/*
 Copyright 2015 Nicolas Melot

 This file is part of Crown.

 Crown is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Crown is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Crown. If not, see <http://www.gnu.org/licenses/>.

*/

#include <limits>

#include <pelib/scheduler.h>
#include <pelib/parser.h>
#include <pelib/output.h>
#include "schedule-parse.hpp"
#include <pelib/PelibException.hpp>

#ifdef debug
#undef debug
#endif

#if 1
#define debug(var) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << var << "\"" << endl;
#else
#define debug(var)
#endif

using namespace std;
using namespace pelib;

#define MAX "max"
#define MIN "min"

typedef struct
{
	string producer, producer_name, consumer, consumer_name;
	Memory queueMem, producerMem, consumerMem;
	size_t size;
} link_t;

typedef struct
{
	string task;
	unsigned int instance, sync, master;
	set<pair<unsigned int, unsigned int>> mapping; // core -> position
	string frequency;
} task_spec_t;

static inline bool
operator<(const task_spec_t &te1, const task_spec_t &te2)
{
	if(te1.task.compare(te2.task) == 0)
	{
		if(te1.instance == te2.instance)
		{
			return te1.mapping < te2.mapping;
		}
		else
		{
			return te1.instance < te2.instance;
		}
	}
	else
	{
		return te1.task.compare(te2.task);
	}
}

static inline bool
operator==(const task_spec_t &te1, const task_spec_t &te2)
{
	return te1.task.compare(te2.task) == 0 && te1.instance == te2.instance && te1.mapping == te2.mapping;
}

static inline bool
operator<(const link_t &l1, const link_t &l2)
{
	if(l1.producer.compare(l2.producer) == 0)
	{
		if(l1.consumer.compare(l2.consumer) == 0)
		{
			if(l1.producer_name.compare(l2.producer_name) == 0)
			{
				if(l1.consumer_name.compare(l2.consumer_name) == 0)
				{
					if(l1.queueMem == l2.queueMem)
					{
						if(l1.producerMem == l2.producerMem)
						{
							return l1.consumerMem < l2.consumerMem;
						}
						else
						{
							return l1.producerMem < l2.producerMem;
						}
					}
					else
					{
						return l1.queueMem < l2.queueMem;
					}
				}
				else
				{
					return l1.consumer_name.compare(l2.consumer_name);
				}
			}
			else
			{
				return l1.producer_name.compare(l2.consumer_name);
			}
		}
		else
		{
			return l1.consumer.compare(l2.consumer);
		}
	}
	else
	{
		return l1.producer.compare(l2.consumer);
	}
}

static inline bool
operator==(const link_t &l1, const link_t &l2)
{
	return l1.producer.compare(l2.producer) == 0 &&
		l1.producer_name.compare(l2.producer_name) == 0 &&
		l1.consumer.compare(l2.consumer) == 0 &&
		l1.consumer_name.compare(l2.consumer_name) == 0 &&
		l1.queueMem == l2.queueMem &&
		l1.producerMem == l2.producerMem &&
		l1.consumerMem == l2.consumerMem;
}

typedef struct
{
	set<task_spec_t> spec;
	set<link_t> link;
	map<unsigned int, Memory> sync;
	bool add_missing_tasks, add_missing_links;
	string default_frequency, taskgraph, platform;
} args_t;

static int
parse_run(char *str, pair<unsigned int, float> &run)
{
	size_t scanner = 0;

	// Find position value
	char *end;
	unsigned int value = strtol(&str[scanner], &end, 10) - 1;
	if(end == &str[scanner] || ( *end != ',' && *end != '\0') || errno == ERANGE)
	{
		// Pattern matching failure
		// Issue warning
		// Get to next symbol
		return 0;
	}
	run.first = value;

	if(*end == '\0')
	{
		run.second = 0;
		return 1;
	}
	scanner += ((size_t)end - (size_t)(&str[scanner])) + 1;

	run.second = atof(&str[scanner]);

	return 2;
}

static unsigned int
parse_buffer(size_t argc, char **argv, Memory &mem)
{
	unsigned int core = 0;
	unsigned int level = 0, instance = 0;
	Memory::Feature feature = (Memory::Feature)((int)Memory::Feature::distributed | (int)Memory::Feature::smallAndCheap);

	unsigned int i;
	for(i = 0; i < argc; i++)
	{
		if(string(argv[i]).compare("--level") == 0)  
		{
			i++;
			level = atoi(argv[i]);
			continue;                            
		}
		  
		if(string(argv[i]).compare("--core") == 0)  
		{
			i++;
			core = atoi(argv[i]) - 1;
			continue;
		}

		if(string(argv[i]).compare("--feature") == 0)  
		{
			i++;
			feature = Memory::stringToFeature(argv[i]);
			continue;
		}

		if(string(argv[i]).compare("--instance") == 0)  
		{
			i++;
			instance = atoi(argv[i]) - 1;
			continue;
		}

		break;                                       
	}

	mem = Memory(feature, level, core, instance);

	return i - 1;
}

static args_t
read_args(size_t argc, char **argv)
{
	map<unsigned int, float> top_position;
	args_t args;

	// Default values
	args.add_missing_tasks = false;
	args.add_missing_links = false;
	args.default_frequency = MAX;
	args.taskgraph = string(typeid(Taskgraph).name());
	args.platform = string(typeid(Platform).name());

	for(size_t i = 0; i < argc; i++)
	{
		if(string(argv[i]).compare("--frequency") == 0)
		{
			i++;
			args.default_frequency = string(argv[i]);
			continue;
		}
		if(string(argv[i]).compare("--taskgraph") == 0)
		{
			i++;
			args.taskgraph = string(argv[i]);
			continue;
		}
		if(string(argv[i]).compare("--platform") == 0)
		{
			i++;
			args.platform = string(argv[i]);
			continue;
		}
		if(string(argv[i]).compare("--add-missing-tasks") == 0)
		{
			args.add_missing_tasks = true;
			continue;
		}
		if(string(argv[i]).compare("--add-missing-links") == 0)
		{
			args.add_missing_links = true;
			continue;
		}
		if(string(argv[i]).compare("--sync") == 0)
		{
			i++;
			Memory::Feature feature = (Memory::Feature)((int)Memory::Feature::distributed | (int)Memory::Feature::smallAndCheap);
			unsigned int level = 0;
			unsigned int instance = 0;
			unsigned int core = 0;

			for(; i < argc; i++)
			{
				if(string(argv[i]).compare("--feature") == 0)
				{
					i++;
					feature = Memory::stringToFeature(argv[i]);
					continue;
				}
				if(string(argv[i]).compare("--level") == 0)
				{
					i++;
					level = atoi(argv[i]);
					continue;
				}
				if(string(argv[i]).compare("--core") == 0)
				{
					i++;
					core = atoi(argv[i]) - 1;
					continue;
				}
				if(string(argv[i]).compare("--id") == 0)
				{
					i++;
					instance = atoi(argv[i]) - 1;
					continue;
				}

				// option was not recognized, make it ready to parse at next top iteration
				i--;
				break;
			}

			args.sync.insert(pair<unsigned int, Memory>(instance, Memory(feature, level, core, instance)));
			continue;
		}
		if(string(argv[i]).compare("--link") == 0)
		{
			i++;
			Memory queueMem, producerMem, consumerMem;
			string producer, pname, consumer, cname, memory;
			unsigned int size = 1;

			for(; i < argc; i++)
			{
				if(string(argv[i]).compare("--producer") == 0)
				{
					i++;
					producer = string(argv[i]);
					continue;
				}

				if(string(argv[i]).compare("--producer-link") == 0)
				{
					i++;
					pname = argv[i];
					continue;
				}

				if(string(argv[i]).compare("--consumer-link") == 0)
				{
					i++;
					cname = string(argv[i]);
					continue;
				}

				if(string(argv[i]).compare("--consumer") == 0)
				{
					i++;
					consumer = string(argv[i]);
					continue;
				}

				if(string(argv[i]).compare("--size") == 0)
				{
					i++;
					size = atoi(argv[i]);
					continue;
				}

				if(string(argv[i]).compare("--buffer-memory") == 0)                
				{
					i++;
					unsigned int diff = parse_buffer(argc - i, &argv[i], queueMem);
					i += diff;
					continue;
				}

				if(string(argv[i]).compare("--producer-memory") == 0)                
				{
					i++;
					i += parse_buffer(argc - i, &argv[i], producerMem);
					continue;
				}

				if(string(argv[i]).compare("--consumer-memory") == 0)                
				{
					i++;
					i += parse_buffer(argc - i, &argv[i], consumerMem);
					continue;
				}
				i--;
				break;
			}

			link_t link;
			link.producer = producer;
			link.producer_name = pname;
			link.consumer = consumer;
			link.consumer_name = cname;
			link.size = size;
			link.queueMem = queueMem;
			link.producerMem = producerMem;
			link.consumerMem = consumerMem;

			args.link.insert(link);
			continue;
		}

		if(string(argv[i]).compare("--task") == 0)
		{
			task_spec_t exec;
			exec.instance = 0;
			exec.frequency = MAX;
			exec.sync = 0;
			exec.master = 0;
			bool at_least_one_mapping = false;
			bool master = false;
			set<unsigned int> cores;
			i++;
			exec.task = string(argv[i]);
			i++;
			for(; i < argc; i++)
			{
				if(string(argv[i]).compare("--instance") == 0)
				{
					i++;
					exec.instance = atoi(argv[i]) - 1;
					continue;
				}

				if(string(argv[i]).compare("--mapping") == 0)
				{
					i++;
					
					if(string(argv[i]).compare("{") == 0)
					{
						i++;

						for(;i < argc && string(argv[i]).compare("}") != 0; i++)
						{
							pair<unsigned int, float> core_position;
							int res = parse_run(argv[i], core_position);

							if(!res)
							{
								// If nothing good could be parsed, then get back to top-level parsing
								break;
							}

							// Add a starting position, if needed
							if(top_position.find(core_position.first) == top_position.end())
							{
								top_position.insert(pair<unsigned int, float>(core_position.first, -1));
							}

							// If no position was given
							if(res == 1)
							{
								core_position.second = top_position.find(core_position.first)->second + 1;
							}

							// Update top position of corresponding core, but first check if there is any record for that core
							if(top_position.find(core_position.first)->second < core_position.second)
							{
								top_position.find(core_position.first)->second = core_position.second;
							}

							// Actually add mapping
							exec.mapping.insert(core_position);
							at_least_one_mapping = true;
						}
					}
					else
					{
						pair<unsigned int, float> core_position;
						int res = parse_run(argv[i], core_position);

						if(!res)
						{
							// If nothing good could be parsed, then get back to top-level parsing
							break;
						}

						// Add a starting position, if needed
						if(top_position.find(core_position.first) == top_position.end())
						{
							top_position.insert(pair<unsigned int, float>(core_position.first, -1));
						}

						// If no position was given
						if(res == 1)
						{
							core_position.second = top_position.find(core_position.first)->second + 1;
						}

						// Update top position of corresponding core, but first check if there is any record for that core
						if(top_position.find(core_position.first)->second < core_position.second)
						{
							top_position.find(core_position.first)->second = core_position.second;
						}

						// Actually add mapping
						exec.mapping.insert(core_position);
						at_least_one_mapping = true;
					}

					continue;
				}

				if(string(argv[i]).compare("--frequency") == 0)
				{
					i++;
					exec.frequency = argv[i];
					continue;
				}

				if(string(argv[i]).compare("--barrier") == 0)
				{
					i++;
					exec.sync = atoi(argv[i]) - 1;
					continue;
				}

				if(string(argv[i]).compare("--master") == 0)
				{
					i++;
					exec.master = atoi(argv[i]) - 1;
					master = true;
					continue;
				}

				// If nothing matches, then break inner loop and get back into top-level argument parsing
				break;
			}

			// If the task has been given no position, just append it
			if(!at_least_one_mapping)
			{
				unsigned int core = 0;
				if(top_position.find(core) == top_position.end())
				{
					top_position.insert(pair<unsigned int, float>(core, -1));
				}
				float position = top_position.find(core)->second + 1;
				top_position.find(core)->second = position;
				exec.mapping.insert(pair<unsigned int, float>(core, position));
			}

			if(!master || exec.mapping.find(pair<unsigned int, unsigned int>(exec.master, exec.instance)) == exec.mapping.end())
			{
				// Warning message? Unspecified master or master core not co-running task
				exec.master = exec.mapping.begin()->first;
			}

			// Add task spec to spec list
			args.spec.insert(exec);

			// Now i points to next argument. Backtrack by one position so the next iteration restore i to the right position
			i--;
			continue;
		}
	}
	return args;
}

static float
parse_frequency(const string &str, const Platform &pt)
{
	float freq;
	if(str.compare(MIN) == 0)
	{
		freq = *(*pt.getCores().begin())->getFrequencies().begin();
	}
	else if(str.compare(MAX) == 0)
	{
		freq = *(*pt.getCores().begin())->getFrequencies().rbegin();
	}
	else
	{
		freq = atof(str.c_str());
	}

	return freq;
} 

static pelib::Schedule
generate(const pelib::Taskgraph &tg, const pelib::Platform &pt, const args_t args)
{
	float time = 0;
	float default_freq = parse_frequency(args.default_frequency, pt);

	map<unsigned int, set<ExecTask>> schedule;
	set<ExecTask> srt;
	for(const task_spec_t &i : args.spec)
	{
		Task task(i.task);
		set<Task>::const_iterator search = tg.getTasks().find(task);
		if(search != tg.getTasks().end())
		{
			const Task &tgTask = *search;
			float freq = parse_frequency(i.frequency, pt);
			for(pair<unsigned int, float> core_position: i.mapping)
			{
				Memory sync;
				if(i.mapping.size() > 1) // We need synchronization data structure
				{
					if(args.sync.find(i.sync) == args.sync.end())
					{
						stringstream ss;
						ss << "Could not find synchronization buffer " << i.sync << " of task \"" << tgTask.getName() << "\" instance " << i.instance + 1 << " in core " << core_position.first + 1 << "." << endl;
						throw PelibException(ss.str());
					}
					sync = args.sync.find(i.sync)->second;
				}
				else
				{
					sync = Memory::nullMemory();
				}
				if(schedule.find(core_position.first) == schedule.end())
				{
					schedule.insert(pair<unsigned int, set<ExecTask>>(core_position.first, set<ExecTask>()));
				}
				
				ExecTask eTask(tgTask, std::set<const AllotedLink*>(), freq, i.mapping.size(), core_position.second, i.instance, i.master, sync);
				schedule.find(core_position.first)->second.insert(eTask);
			}
		}
	}

	// Compute actual starting time for all tasks, synchronized together
	map<ExecTask, float> task_time;
	for(const pair<unsigned int, set<ExecTask>> &core: schedule)
	{
		float time = 0;
		for(const ExecTask &eTask: core.second)
		{
			if(task_time.find(eTask) == task_time.end())
			{
				task_time.insert(pair<ExecTask, float>(eTask, time));
			}

			if(task_time.find(eTask)->second < time)
			{
				task_time.find(eTask)->second = time;
			}
			time += eTask.getTask().runtime(eTask.getWidth(), eTask.getFrequency());
		}
	}
	
	// compute final schedule
	map<unsigned int, set<ExecTask>> final_schedule;
	for(const pair<unsigned int, set<ExecTask>> &core: schedule)
	{
		final_schedule.insert(pair<unsigned int, set<ExecTask>>(core.first, set<ExecTask>()));

		for(const ExecTask &eTask: core.second)
		{
			ExecTask newTask(eTask.getTask(), eTask.allLinks(), eTask.getFrequency(), eTask.getWidth(), task_time.find(eTask)->second, eTask.getInstance(), eTask.getMasterCore(), eTask.getSync());
			final_schedule.find(core.first)->second.insert(newTask);
		}
	}
	schedule = final_schedule;

	set<AllotedLink> links;
	for(const link_t i: args.link)
	{
		set<Task>::const_iterator prod_search = tg.getTasks().find(Task(i.producer));
		if(prod_search == tg.getTasks().end())
		{
			stringstream ss;
			ss << "Could not find task \"" << i.producer << "\" in taskgraph" << endl;
			throw PelibException(ss.str());
		}
		set<Task>::const_iterator cons_search = tg.getTasks().find(Task(i.consumer));
		if(cons_search == tg.getTasks().end())
		{
			stringstream ss;
			ss << "Could not find task \"" << i.consumer << "\" in taskgraph" << endl;
			throw PelibException(ss.str());
		}

		const Task &prod = *prod_search;
		const Task &cons = *cons_search;

		set<AbstractLink>::const_iterator link_search = tg.getLinks().find(AbstractLink(prod, cons, i.producer_name, i.consumer_name, string(), string()));
		if(link_search == tg.getLinks().end())
		{
			stringstream ss;
			ss << "Could not find link from \"" << i.producer << "\" as \"" << i.producer_name << "\" to \"" << i.consumer << "\" as \"" << i.consumer_name << "\"." << endl;
			throw PelibException(ss.str());
		}

		size_t size;
		if(i.size == 0)
		{
			size = 1;
		}
		else
		{
			size = i.size;
		}
		
		AllotedLink all(*link_search, Buffer(size, link_search->getDataType(), link_search->getHeader(), i.queueMem), i.producerMem, i.consumerMem);
		links.insert(all);	
	}

	// Add all links that were not specified with default values taken from taskgraph
	if(args.add_missing_links)
	{
		for(const AbstractLink &abstract: tg.getLinks())
		{
			bool found = false;
			for(const AllotedLink &alloted: links)
			{
				if(alloted.getLink() == abstract)
				{
					found = true;
				}
			}

			if(!found)
			{
				links.insert(AllotedLink(abstract, Buffer(abstract.getProducerRate() * abstract.getConsumerRate(), abstract.getDataType(), abstract.getHeader(), Memory((Memory::Feature)((int)Memory::Feature::exclusive | (int)Memory::Feature::smallAndCheap), 0, 0, 0)), Memory::nullMemory(), Memory::nullMemory()));
			}
		}
	}

	if(args.add_missing_tasks)
	{
		for(const Task &task: tg.getTasks())
		{
			bool found = false;
			for(const ExecTask &eTask: srt)
			{
				if(eTask.getTask() == task)
				{
					found = true;
					break;
				}
			}

			if(!found)
			{
				srt.insert(ExecTask(task, links, default_freq, 1, time, 0, 0, Memory::nullMemory()));
				float runtime = task.runtime(1, default_freq);
				time += runtime;
			}
		}
	}
	schedule.insert(pair<unsigned int, set<ExecTask>>(0, srt));

	return Schedule("Manual", tg.getName(), schedule, links, tg, pt);
}

const pelib::Schedule*
pelib_schedule(const pelib::Taskgraph &tg, const pelib::Platform &pt, size_t argc, char** argv, map<const string, double>& stats)
{
	args_t args = read_args(argc, argv);
	return new Schedule(generate(tg, pt, args));
}

pelib::Record*
pelib_parse(std::istream& cin, size_t argc, char **argv, const map<string, Record*> &inputs)
{
	args_t args = read_args(argc, argv);
	Taskgraph &tg = getTaskgraph(args.taskgraph, inputs);
	Platform &pt = getPlatform(args.platform, inputs);
	return new Schedule(generate(tg, pt, args));
}

void
pelib_delete_record(pelib::Record *sched)
{
	delete sched;
}

void
pelib_delete_schedule(pelib::Schedule *sched)
{
	delete sched;
}

typedef struct
{
	string schedule;
	string linebreak, indent;
} out_args_t;

static out_args_t
output_args(size_t argc, char **argv)
{
	out_args_t args;
	args.schedule = string(typeid(Schedule).name());
	args.linebreak = string(" ");
	args.indent = string();

	for(size_t i = 0; i < argc; i++)
	{
		if(string(argv[i]).compare("--schedule") == 0)
		{
			i++;
			args.schedule = string(argv[i]);
			continue;
		}
		if(string(argv[i]).compare("--multiline") == 0)
		{
			i++;
			stringstream ss;
			ss << endl;
			args.linebreak = ss.str();
			args.indent = string("\t");
			continue;
		}
	}

	return args;
}

void pelib_dump(std::ostream& cout, const std::map<std::string, pelib::Record*> &records, size_t argc, char** argv)
{
	out_args_t args = output_args(argc, argv);

	map<string, Record*>::const_iterator search_schedule = records.find(args.schedule);
	if(search_schedule == records.end())
	{
		stringstream ss;
		ss << "Could not find schedule of name \"" << args.schedule << "\" in collection." << endl;
		throw PelibException(ss.str());
	}
	const Schedule &sc = *(Schedule*)search_schedule->second;

	// Get all cores each task instance runs on
	map<ExecTask, set<unsigned int>> etask_core;
	set<Memory> sync;
	for(pair<unsigned int, set<ExecTask>> core_task: sc.getSchedule())
	{
		for(const ExecTask &eTask: core_task.second)
		{
			map<ExecTask, set<unsigned int>>::iterator search = etask_core.find(eTask);
			if(etask_core.find(eTask) == etask_core.end())
			{
				search = etask_core.insert(pair<ExecTask, set<unsigned int>>(eTask, set<unsigned int>())).first;
			}
			search->second.insert(core_task.first);
			if(eTask.getSync() != Memory::nullMemory() && sync.find(eTask.getSync()) == sync.end())
			{
				sync.insert(eTask.getSync());
			}
		}
	}

	// Generate options for each task
	cout << "--input --file /dev/null --lib schedule-manual --args {" << args.linebreak;
	set<ExecTask> etask_done;
	
	// Tasks
	for(pair<unsigned int, set<ExecTask>> core_task: sc.getSchedule())
	{
		for(const ExecTask &eTask: core_task.second)
		{
			if(etask_done.find(eTask) != etask_done.end())
			{
				continue;
			}

			// name
			cout << args.indent << "--task " << eTask.getTask().getName() << " ";

			// instance
			cout << "--instance " << eTask.getInstance() + 1 << " ";

			// Frequency
			cout << "--frequency " << eTask.getFrequency() << " ";

			// mapping
			cout << "--mapping { ";
			for(unsigned int core: etask_core.find(eTask)->second)
			{
				cout << core + 1 << "," << eTask.getStart() << " ";
			}
			cout << "} ";

			// barrier
			if(eTask.getWidth() > 1)
			{
				cout << "--barrier " << eTask.getSync().getInstance() + 1 << " ";
			}

			// Master core
			cout << "--master " << eTask.getMasterCore() + 1 << args.linebreak;

			etask_done.insert(eTask);
		}
	}

	// Links
	for(const AllotedLink &link: sc.getLinks())
	{
		cout << args.indent << "--link --producer " << link.getLink().getProducer()->getName() << " --producer-link " << link.getLink().getProducerName() << " --consumer " << link.getLink().getConsumer()->getName() << " --consumer-link " << link.getLink().getConsumerName() << " --size " << link.getQueueBuffer().getSize() << args.linebreak;
		cout << args.indent << args.indent << "--buffer-memory --feature \"" << Memory::featureToString(link.getQueueBuffer().getMemory().getFeature()) << "\" --core " << link.getQueueBuffer().getMemory().getCore() + 1 << " --level " << link.getQueueBuffer().getMemory().getLevel() << args.linebreak;

		if(((int)link.getProducerMemory().getFeature() & 3 & (int)Memory::Feature::distributed) == (int)Memory::Feature::distributed)
		{
			cout << args.indent << args.indent << "--producer-memory --core " << link.getProducerMemory().getCore() + 1 << " --feature \"" << Memory::featureToString(link.getProducerMemory().getFeature()) << "\" --level " << link.getProducerMemory().getLevel() << args.linebreak;
		}

		if(((int)link.getConsumerMemory().getFeature() & 3 & (int)Memory::Feature::distributed) == (int)Memory::Feature::distributed)
		{
			cout << args.indent << args.indent << "--consumer-memory --core " << link.getConsumerMemory().getCore() + 1 << " --feature \"" << Memory::featureToString(link.getConsumerMemory().getFeature()) << "\" --level " << link.getConsumerMemory().getLevel() << args.linebreak;
		}
	}

	// Sync
	for(Memory barrier: sync)
	{
		cout << args.indent << "--sync --id " << barrier.getInstance() + 1 << " --level " << barrier.getLevel() << " --core " << barrier.getCore() + 1 << " --feature \"" << Memory::featureToString(barrier.getFeature()) << "\"" << args.linebreak;
	}
	
	cout << "}" << endl;
}
