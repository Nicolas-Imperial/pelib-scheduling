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
#include <pelib/Sequential.hpp>
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
	string producer, producer_name, consumer, consumer_name, memory;
	unsigned int level, instance;
	size_t size;
} link_t;

typedef struct
{
	string task;
	unsigned int instance;
	float position;
	string frequency;
} task_exec_t;

static inline bool
operator<(const task_exec_t &te1, const task_exec_t &te2)
{
	return te1.position < te2.position;
}

static inline bool
operator==(const task_exec_t &te1, const task_exec_t &te2)
{
	return te1.position == te2.position;
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
					if(l1.memory.compare(l2.memory) == 0)
					{
						if(l1.level == l2.level)
						{
							return l1.size < l2.size;
						}
						else
						{
							return l1.level < l2.level;
						}
					}
					else
					{
						return l1.memory.compare(l2.memory);
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
		l1.memory.compare(l2.memory) == 0 &&
		l1.level == l2.level &&
		l1.size == l2.size;
}

typedef struct
{
	set<task_exec_t> spec;
	set<link_t> link;
	bool add_missing_tasks, add_missing_links;
	string default_frequency;
} args_t;

static int
parse_run(char *str, task_exec_t *run)
{
	size_t scanner = 0;

	// Find position value
	char *end;
	float value = strtof(&str[scanner], &end);
	if(end == &str[scanner] || ( *end != ',' && *end != '\0') || errno == ERANGE)
	{
		// Pattern matching failure
		// Issue warning
		// Get to next symbol
		return 0;
	}
	run->position = value;

	if(*end == '\0')
	{
		run->frequency = MAX;
		return 1;
	}
	scanner += ((size_t)end - (size_t)(&str[scanner])) + 1;

	string frequency(&str[scanner]);
	
	run->frequency = string(&str[scanner]);

	return 1;
}

static args_t
read_args(size_t argc, char **argv)
{
	float top_position = -1;
	args_t args;
	args.add_missing_tasks = false;
	args.add_missing_links = false;
	args.default_frequency = MAX;

	for(size_t i = 0; i < argc; i++)
	{
		if(string(argv[i]).compare("--frequency") == 0)
		{
			i++;
			args.default_frequency = string(argv[i]);
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
		if(string(argv[i]).compare("--link") == 0)
		{
			i++;
			string producer, pname, consumer, cname, memory;
			size_t size = 0;
			unsigned int level = 0, instance = 0;
			stringstream ss;
			ss << Memory::exclusive << " | " << Memory::smallAndCheap;
			memory = ss.str();

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
				if(string(argv[i]).compare("--memory") == 0)
				{
					i++;
					memory = string(argv[i]);
					continue;
				}
				if(string(argv[i]).compare("--level") == 0)
				{
					i++;
					level = atoi(argv[i]);
					continue;
				}
				if(string(argv[i]).compare("--size") == 0)
				{
					i++;
					size = atoi(argv[i]);
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
			link.memory = memory;
			link.level = level;
			link.instance = instance;

			args.link.insert(link);
			continue;
		}

		if(string(argv[i]).compare("--task") == 0)
		{
			task_exec_t exec;
			exec.instance = 0;
			bool at_least_one_position = false;
			i++;
			exec.task = string(argv[i]);
			i++;
			for(; i < argc; i++)
			{
				if(string(argv[i]).compare("--instance") == 0)
				{
					i++;
					exec.instance = atoi(argv[i]);
					continue;
				}

				if(string(argv[i]).compare("{") == 0)
				{
					i++;
					for(;string(argv[i]).compare("}") != 0; i++)
					{
						task_exec_t run = exec;
						if(parse_run(argv[i], &run))
						{
							args.spec.insert(run);
							if(top_position < run.position)
							{
								top_position = run.position;
							}
							at_least_one_position = true;
						}
					}
				}
				else
				{
					task_exec_t run = exec;
					if(parse_run(argv[i], &run))
					{
						args.spec.insert(run);
						if(top_position < run.position)
						{
							top_position = run.position;
						}
						at_least_one_position = true;
					}
				}

				// If nothing matches, then break inner loop and get back into top-level argument parsing
				break;
			}

			// If the task has been given no position, just append it
			if(!at_least_one_position)
			{
				task_exec_t run = exec;
				run.frequency = MAX;
				run.position = top_position + 1;
				if(top_position < run.position)
				{
					top_position = run.position;
				}
				//pair<set<task_exec_t>::iterator, bool> res = 
				args.spec.insert(run);
			}

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

const pelib::Schedule*
pelib_schedule(const pelib::Taskgraph &tg, const pelib::Platform &pt, size_t argc, char** argv, map<const string, double>& stats)
{
	args_t args = read_args(argc, argv);

	float time = 0;
	float default_freq = parse_frequency(args.default_frequency, pt);

	map<unsigned int, set<ExecTask>> schedule;
	set<ExecTask> srt;
	for(const task_exec_t &i : args.spec)
	{
		Task task(i.task);
		set<Task>::const_iterator search = tg.getTasks().find(task);
		if(search != tg.getTasks().end())
		{
			const Task &tgTask = *search;
			float freq = parse_frequency(i.frequency, pt);
			
			ExecTask eTask(tgTask, std::set<AllotedLink>(), freq, 1, time, i.instance, 0, Memory::nullMemory());
			time += task.runtime(1, freq);
			srt.insert(eTask);
		}
	}


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
		
		AllotedLink all(*link_search, Buffer(size, link_search->getDataType(), link_search->getHeader(), Memory(Memory::stringToFeature(i.memory), i.level, 0, i.instance)), Memory::nullMemory(), Memory::nullMemory());
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

	return new Schedule("Sequential", tg.getName(), schedule, links, tg, pt);
}

void
pelib_delete(pelib::Schedule *sched)
{
	delete sched;
}

