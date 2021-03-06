/*
 Copyright 2015 Nicolas Melot

 This file is part of Pelib.

 Pelib is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Pelib is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Pelib. If not, see <http://www.gnu.org/licenses/>.
*/


#include <set>
#include <string>

#include <pelib/AmplInputScalar.hpp>
#include <pelib/UniformLinkAllocator.hpp>
#include <pelib/Schedule.hpp>
#include <pelib/Scalar.hpp>
#include <pelib/Vector.hpp>
#include <pelib/Matrix.hpp>
#include <pelib/Set.hpp>
#include <pelib/CastException.hpp>
#include <pelib/PelibException.hpp>
#include <pelib/Task.hpp>
#include <pelib/GraphML.hpp>

#ifdef debug
#undef debug
#endif 

#define debug(expr) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << (#expr) << " = \"" << (expr) << "\"." << endl;

using namespace std;

namespace pelib
{
	Schedule::Schedule(const std::string &name, const std::string &appName, const Table &schedule, const set<AllotedLink> &links, const Taskgraph &application, const Platform &platform)
	{
		this->name = name;
		this->appName = appName;
	
		this->setSchedule(schedule, links, application, platform);		
	}

	Schedule::~Schedule()
	{
		// Do nothing
	}

	const ExecTask&
	Schedule::getExecTask(const Task &task) const
	{
		// Do nothing
		for(const pair<unsigned int, set<ExecTask>> &i: this->getSchedule())
		{
			for(const ExecTask &eTask: i.second)
			{
				if(task == eTask.getTask())
				{
					return eTask;
				}
			}
		}

		stringstream ss;
		ss << "Task \"" << task.getName() << "\" is not part of schedule";
		throw PelibException(ss.str());
	}

	void
	Schedule::setSchedule(const Table &sched, const std::set<AllotedLink> &links, const Taskgraph &application, const Platform &platform)
	{
		// First copy taskgraph and platform
		this->taskgraph = application;
		this->platform = platform;

		this->schedule = Schedule::Table();
		this->links = set<AllotedLink>();
		for(set<AllotedLink>::iterator i = links.begin(); i != links.end(); i++)
		{
			set<AbstractLink>::const_iterator link = this->getTaskgraph().getLinks().find(i->getLink());
			if(link == this->getTaskgraph().getLinks().end())
			{
				stringstream ss;
				//const AbstractLink &abl = i->getLink();
				ss << "Schedule contains link from task \"" << i->getLink().getProducer()->getName() << "\" (\"" << i->getLink().getLink().getProducerName() << "\") to task \"" << i->getLink().getConsumer()->getName() << "\" (\"" << i->getLink().getConsumerName() << "\") but it does not exist in taskgraph";
				throw PelibException(ss.str());
			}
			AllotedLink allotedLink(*link, i->getQueueBuffer(), i->getProducerMemory(), i->getConsumerMemory());

			this->links.insert(allotedLink);
		}

		// Copy schedule with all exec task refering to tasks within internal copy of taskgraph
		for(Table::const_iterator i = sched.begin(); i != sched.end(); i++)
		{
			set<ExecTask> core_schedule;
			for(set<ExecTask>::const_iterator j = i->second.begin(); j != i->second.end(); j++)
			{
				set<Task>::const_iterator task = this->getTaskgraph().getTasks().find(j->getTask());
				if(task == this->getTaskgraph().getTasks().end())
				{
					throw PelibException("Schedule contains a task that does not exists in taskgraph");
				}
				
				const ExecTask execTask(*task, this->links, j->getFrequency(), j->getWidth(), j->getStart(), j->getInstance(), j->getMasterCore(), j->getSync());
				core_schedule.insert(execTask);
			}

			this->schedule.insert(pair<unsigned int, set<ExecTask> >(i->first, core_schedule));
		}
	}

	Schedule::Schedule(const std::string &name, const Algebra &algebra)
	{
		buildFromAlgebra(name, string("Generated from Algebra"), algebra);	
	}

	Schedule::Schedule(const std::string &name, const string &appName, const Algebra &algebra)
	{
		buildFromAlgebra(name, appName, algebra);
	}

	Schedule::Schedule(const Schedule& src)
	{
		this->name = src.getName();
		this->appName = src.getAppName();
		this->setSchedule(src.getSchedule(), src.getLinks(), src.getTaskgraph(), src.getPlatform());
	}

#if 0
	set<const ExecTask*>
	Schedule::execTasksIsland(const Platform::island &island) const
	{
		set<const ExecTask*> out;
		for(const Core* core: island)
		{
			set<const Core*>::const_iterator core_search = this->getPlatform().getCores().find(core);
			if(core_search == this->getPlatform().getCores().end())
			{
				throw PelibException("Requested tasks running by cores that do not belong to platform.");
			}
			
			unsigned int core_id = std::distance(this->getPlatform().getCores().begin(), core_search);
			
			Schedule::Table::const_iterator core_id_search = this->getSchedule().find(core_id);
			if(core_id_search != this->getSchedule().end())
			{
				for(const ExecTask &eTask: core_id_search->second)
				{
					Platform::island isl = eTask.runIsland(*this);
					bool included = true;
					for(const Core *c: isl)
					{
						if(island.find(c) == island.end())
						{
							included = false;
							break;
						}
					}

					if(included)
					{
						out.insert(&eTask);
					}
				}
			}
		}		

		return out;
	}

	set<const Task*>
	Schedule::tasksIsland(const Platform::island &island) const
	{
		set<const Task*> out;
		for(const Core* core: island)
		{
			set<const Core*>::const_iterator core_search = this->getPlatform().getCores().find(core);
			if(core_search == this->getPlatform().getCores().end())
			{
				throw PelibException("Requested tasks running by cores that do not belong to platform.");
			}
			
			unsigned int core_id = std::distance(this->getPlatform().getCores().begin(), core_search);
			
			Schedule::Table::const_iterator core_id_search = this->getSchedule().find(core_id);
			if(core_id_search != this->getSchedule().end())
			{
				for(const ExecTask &eTask: core_id_search->second)
				{
					Platform::island isl = eTask.runIsland(*this);
					bool included = true;
					for(const Core *c: isl)
					{
						if(island.find(c) == island.end())
						{
							included = false;
							break;
						}
					}

					if(included)
					{
						out.insert(&eTask.getTask());
					}
				}
			}
		}		

		return out;
	}
#endif

	Platform::island
	Schedule::taskIsland(const Task &task) const
	{
		Platform::island out;
		for(const pair<unsigned int, set<ExecTask>> &p: this->getSchedule())
		{
			for(const ExecTask &eTask: p.second)
			{
				if(eTask.getTask() == task)
				{
					set<const Core*>::const_iterator core_search = this->getPlatform().getCores().begin();
					std::advance(core_search, p.first);
					if(core_search == this->getPlatform().getCores().end())
					{
						throw PelibException("Schedule includes a core that cannot be found in associated platform.");
					}
					out.insert(*core_search);
				}
			}
		}

		return out;
	}

	void
	Schedule::merge(const Schedule &schedule, const string &schedule_name, const string &app_name, const set<AllotedLink> &junction)
	{
		const Schedule::Table &foreign_table = schedule.getSchedule();
		const set<AllotedLink> &foreign_links = schedule.getLinks();
		const Taskgraph &foreign_taskgraph = schedule.getTaskgraph();

		Schedule me(*this);
		me.name = schedule_name;
		Schedule::Table this_table = me.getSchedule();
		set<AllotedLink> this_links = me.getLinks();
		Taskgraph this_taskgraph = me.getTaskgraph();
		Platform this_platform = me.getPlatform();
			
		// Merge task scheduling
		for(const pair<unsigned int, set<ExecTask>> &core_etask: foreign_table)
		{
			Schedule::Table::const_iterator search = this_table.find(core_etask.first);
			float start;
			if(search == this_table.end())
			{
				pair<Schedule::Table::const_iterator, bool> res = this_table.insert(pair<unsigned int, set<ExecTask>>(core_etask.first, set<ExecTask>()));
				search = res.first;
				start = 0;
			}
			else
			{
				const ExecTask &eTask = *this_table.find(core_etask.first)->second.rbegin();
				start = eTask.getStart() + eTask.getTask().runtime(eTask.getWidth(), eTask.getFrequency());
			}

			// Is this recommended?
			set<ExecTask> &tasks = (set<ExecTask>&)search->second;
			for(const ExecTask &feTask: core_etask.second)
			{
				set<ExecTask>::const_iterator task_search = tasks.find(Task(feTask.getTask().getName()));
				if(task_search != tasks.end())
				{
					stringstream ss;
					ss << "Task \"" << task_search->getTask().getName() << "\" instance " << task_search->getInstance() << " is scheduled in both schedules to merge";
					throw PelibException(ss.str());
				}
				
				ExecTask eTask(feTask.getTask(), feTask.allLinks(), feTask.getFrequency(), feTask.getWidth(), start, feTask.getInstance(), feTask.getMasterCore(), feTask.getSync());
				tasks.insert(eTask);
				start += eTask.getTask().runtime(eTask.getWidth(), eTask.getFrequency());
			}
		}

		// Merge link allocation
		// Extract all abstract links from alloted links
		set<AbstractLink> absJunction;
		for(const AllotedLink &al: junction)
		{
			absJunction.insert(al.getLink());
		}
		this_links.insert(foreign_links.begin(), foreign_links.end());
		this_links.insert(junction.begin(), junction.end());

		// Set schedule
		this_taskgraph.merge(foreign_taskgraph, this_taskgraph.getName(), this_taskgraph.getDeadlineCalculator(), absJunction);

		this->setSchedule(this_table, this_links, this_taskgraph, this_platform);
	}

	Schedule
	Schedule::merge(const Schedule &schedule, const string &schedule_name, const string &app_name, const set<AllotedLink> &junction) const
	{
		Schedule copy(*this);
		copy.merge(schedule, schedule_name, app_name, junction);	
		return copy;
	}

	void
	Schedule::buildFromAlgebra(const string &name, const string &appName, const Algebra &algebra)
	{
		this->name = name;
		this->appName = appName;

		const Vector<int, float> *tau = algebra.find<Vector<int, float> >("Tau");
		const Vector<int, float> *start = algebra.find<Vector<int, float> >("start");
		const Vector<int, float> *wi = algebra.find<Vector<int, float> >("wi");
		const Matrix<int, int, float> *sched = algebra.find<Matrix<int, int, float> >("schedule");
		const Vector<int, float> *freq = algebra.find<Vector<int, float> >("frequency");
		const Vector<int, string> *task_name = algebra.find<Vector<int, string> >("name");

		Taskgraph taskgraph = Taskgraph(algebra);
		Platform platform = Platform(algebra);

		Table schedule;
		set<ExecTask> tasks;
	
		if(start == NULL || tau == NULL || wi == NULL || sched == NULL || freq == NULL || task_name == NULL)
		{
			throw CastException("Missing some input data structure instance. Check start, Tau, wi, schedule, frequency and name.");
		}
		else
		{
			map<ExecTask, unsigned int> master;
			for(map<int, map<int, float> >::const_iterator i = sched->getValues().begin(); i != sched->getValues().end(); i++)
			{
				set<ExecTask> core_schedule;
				float start = 0;
				
				for(map<int, float>::const_iterator j = i->second.begin(); j != i->second.end(); j++)
				{
					if(floor(j->second) > 0)
					{
						string task_str;
						if(task_name == NULL)
						{
							stringstream estr;
							estr << "task_" << j->second;
							task_str = string(estr.str());
						}
						else
						{
							task_str = string(task_name->getValues().find((int)j->second)->second);
						}

						set<Task>::const_iterator task_iter = taskgraph.getTasks().find(Task(task_str));
						if(task_iter == taskgraph.getTasks().end())
						{
							stringstream ss;
							ss << "Trying to schedule task \"" << task_str << "\" but it does not exist in taskgraph";
							throw PelibException(ss.str());
						}
						const Task &task = *task_iter;

						if(task.getWorkload() > 0)
						{
							unsigned int width = wi->find(j->second);
							float frequency = freq->find(j->second);
							unsigned int master_id;
							ExecTask dummy(task, set<AllotedLink>(), frequency, width, start, 0, 0, Memory::nullMemory());
							if(master.find(dummy) == master.end())
							{
								master_id = i->first - 1;
								master.insert(pair<ExecTask, unsigned int>(dummy, i->first - 1));
							}
							else
							{
								map<ExecTask, unsigned int>::const_iterator search = master.find(dummy);
								master_id = search->second;
							}
							ExecTask exec(task, set<AllotedLink>(), frequency, width, start, 0, master_id, Memory::nullMemory());
							start += exec.getTask().runtime(width, frequency);
							core_schedule.insert(exec);
						}
					}
				}

				schedule.insert(pair<unsigned int, set<ExecTask>>(i->first - 1, core_schedule));
			}
		}

		this->setSchedule(schedule, set<AllotedLink>(), taskgraph, platform);
	}
	
	Schedule*
	Schedule::clone() const
	{
		Schedule *clone = new Schedule(this->getName(), this->getAppName(), this->getSchedule(), this->getLinks(), this->getTaskgraph(), this->getPlatform());

		return clone;
	}

	Algebra
	Schedule::buildAlgebra() const
	{
		Algebra algebra;
		
		map<string, int> taskid2id; 
		for(Table::const_iterator i = schedule.begin(); i != schedule.end(); i++)
		{
			for(set<ExecTask>::const_iterator j = i->second.begin(); j != i->second.end(); j++)
			{
				taskid2id.insert(pair<string, int>(j->getTask().getName(), std::distance(this->getTaskgraph().getTasks().begin(), this->getTaskgraph().getTasks().find(j->getTask())) + 1));
			}
		}

		map<int, map<int, float> > sched;
		map<int, float> frequencies, start;
		Table schedule = getSchedule();

		size_t ordering, max_tasks = 0;
		for(Table::const_iterator i = schedule.begin(); i != schedule.end(); i++)
		{
			map<int, float> schedule_row;
			int core = i->first;
	
			ordering = 0;
			for(set<ExecTask>::const_iterator j = i->second.begin(); j != i->second.end(); j++, ordering++)
			{
				int id = taskid2id.find(j->getTask().getName())->second;
				schedule_row.insert(pair<int, int>(ordering, id));
				frequencies.insert(pair<int, float>(id, j->getFrequency()));

				max_tasks = ordering > max_tasks ? ordering : max_tasks;
				start.insert(pair<int, float>(std::distance(this->getTaskgraph().getTasks().begin(), this->getTaskgraph().getTasks().find(j->getTask().getName())), j->getStart())); 
			}

			sched.insert(pair<int, map<int, float> >(core, schedule_row));
		}

		// pad with 0
		for(Table::const_iterator i = schedule.begin(); i != schedule.end(); i++)
		{
			size_t base = i->second.size();
			for(ordering = base; ordering < max_tasks; ordering++)
			{
				sched.find(i->first)->second.insert(pair<int, int>(ordering, 0));
			}
		}

		Matrix<int, int, float> ampl_schedule("schedule", sched);
		Vector<int, float> ampl_frequencies("frequency", frequencies);
		Vector<int, float> ampl_start("start", start);

		algebra.insert(&ampl_schedule);
		algebra.insert(&ampl_frequencies);
		algebra.insert(&ampl_start);
		algebra = algebra.merge(this->getTaskgraph().buildAlgebra());
		algebra = algebra.merge(this->getPlatform().buildAlgebra());

		return algebra;
	}

	const Taskgraph&
	Schedule::getTaskgraph() const
	{
		return this->taskgraph;
	}

	const Platform&
	Schedule::getPlatform() const
	{
		return this->platform;
	}

	std::string
	Schedule::getName() const
	{
		return this->name;
	}

	std::string
	Schedule::getAppName() const
	{
		return this->appName;
	}

	const Schedule::Table&
	Schedule::getSchedule() const
	{
		return schedule;
	}
	
	const Task&
	Schedule::getTask(int id) const
	{
		
		set<Task>::const_iterator it = this->getTaskgraph().getTasks().begin();
		std::advance(it, id - 1);
		if(it == this->getTaskgraph().getTasks().end())
		{
			throw PelibException("Requested task by integer index beyond the number of task available in taskgraph");
		}

		return *it;
	}

	Schedule&
	Schedule::operator=(const Schedule &copy)
	{
		this->name = copy.getName();
		this->appName = copy.getAppName();
	
		// Copy taskgraph
		this->setSchedule(copy.getSchedule(), copy.getLinks(), copy.getTaskgraph(), copy.getPlatform());
		return *this;
	}

	const set<AllotedLink>&
	Schedule::getLinks() const
	{
		return this->links;
	}

	const set<ExecTask>&
	Schedule::getTasks(unsigned int core) const
	{
		map<unsigned int, set<ExecTask>>::const_iterator i = this->schedule.find(core);
		if(i == this->schedule.end())
		{
			throw PelibException("Requested core id that does not exist in schedule");
		}
		return i->second;
	}

	void
	Schedule::allocateLinks(const ScheduleLinkAllocator &alloc)
	{
		//Schedule cpy = *this;
		Schedule s = alloc.allocate(*this);
		//this->setSchedule(cpy.getSchedule(), links, cpy.getTaskgraph(), cpy.getPlatform());
		*this = s;
	}

	set<const Task*>
	Schedule::tasksSharedMemoryIsland(const set<unsigned int>& islands) const
	{
		set<const Task*> tasks;

		for(set<unsigned int>::const_iterator i = islands.begin(); i != islands.end(); i++)
		{
			Platform::islands::const_iterator ii = this->getPlatform().getSharedMemoryIslands().begin();
			std::advance(ii, *i - 1);

			for(Platform::island::const_iterator j = ii->begin(); j != ii->end(); j++)
			{
				size_t core_id = std::distance(this->getPlatform().getCores().begin(), this->getPlatform().getCores().find(*j)) + 1;
				for(set<ExecTask>::const_iterator k = this->getTasks((unsigned int)core_id).begin(); k != this->getTasks((int)core_id).end(); k++)
				{
					tasks.insert(&k->getTask());
				}
			}
		}

		return tasks;
	}

	multiset<const Task*>
	Schedule::remoteSharedMemoryIslandProducers(const set<unsigned int> &islands) const
	{
		const Taskgraph &tg = this->getTaskgraph();
		const Platform &pt = this->getPlatform();
		multiset<const Task*> producers;
		for(set<unsigned int>::const_iterator i = islands.begin(); i != islands.end(); i++)
		{
			if(*i > pt.getSharedMemoryIslands().size())
			{
				throw CastException("Requested shared memory islands not existing in platform.");
			}
		}

		set<const Task*> tasks_in_islands = this->tasksSharedMemoryIsland(islands);
		for(set<const Task*>::const_iterator i = tasks_in_islands.begin(); i != tasks_in_islands.end(); i++)
		{
			const Task &task_p = **i;
			if(tg.getTasks().find(task_p) == tg.getTasks().end())
			{
				stringstream ss;
				ss << "Cannot find task \"" << task_p.getName() << "\" in taskgraph.";
				throw CastException(ss.str());
			}
			const Task &task_tg = task_p;
			set<unsigned int> consumer_cores = this->cores(task_tg);
			set<unsigned int>::const_iterator j = consumer_cores.begin();
			Platform::islands consumer_core_islands = pt.sharedMemoryIslands(*j);
			for(; j != consumer_cores.end(); j++)
			{
				if(pt.sharedMemoryIslands(*j) != consumer_core_islands)
				{
					throw CastException("Task mapped to cores that belong to different shared memory islands.");
				}	
			}
			
			for(set<const AbstractLink*>::const_iterator j = task_tg.getProducers().begin(); j != task_tg.getProducers().end(); j++)
			{
				const AbstractLink &l = **j;
				const Task &producer = *l.getProducer();
				set<unsigned int> producer_cores = this->cores(producer);
				set<unsigned int>::const_iterator k = producer_cores.begin();
				Platform::islands producer_core_islands = pt.sharedMemoryIslands(*k);
				for(; k != producer_cores.end(); k++)
				{
					if(pt.sharedMemoryIslands(*k) != producer_core_islands)
					{
						throw CastException("Task mapped to cores that belong to different shared memory islands.");
					}	
				}

				if(consumer_core_islands != producer_core_islands)
				{
					producers.insert(&producer);
				}
			}
		}

		return producers;
	}

	multiset<const Task*>
	Schedule::remoteSharedMemoryIslandTaskProducers(const Task &t) const
	{
		const Taskgraph &tg = this->getTaskgraph();
		const Platform &pt = this->getPlatform();
		multiset<const Task*> producers;
		if(this->getTaskgraph().getTasks().find(t) == this->getTaskgraph().getTasks().end())
		{
			stringstream ss;
			ss << "Task \"" << t.getName() << "\" does not figure in schedule.";
			throw CastException(ss.str());
		}

		if(tg.getTasks().find(t) == tg.getTasks().end())
		{
			stringstream ss;
			ss << "Task \"" << t.getName() << "\" does not figure in taskgraph.";
			throw CastException(ss.str());
		}

		const Task &task_tg = *tg.getTasks().find(t);
		set<unsigned int> consumer_cores = this->cores(task_tg);
		set<unsigned int>::const_iterator j = consumer_cores.begin();
		Platform::islands consumer_core_islands = pt.sharedMemoryIslands(*j);
		for(; j != consumer_cores.end(); j++)
		{
			if(pt.sharedMemoryIslands(*j) != consumer_core_islands)
			{
				throw CastException("Task mapped to cores that belong to different shared memory islands.");
			}	
		}
	
		for(set<const AbstractLink*>::const_iterator j = task_tg.getProducers().begin(); j != task_tg.getProducers().end(); j++)
		{
			const AbstractLink &l = **j;
			const Task &producer = *l.getProducer();
			set<unsigned int> producer_cores = this->cores(producer);
			set<unsigned int>::const_iterator k = producer_cores.begin();

			Platform::islands producer_core_islands = pt.sharedMemoryIslands(*k);
			for(; k != producer_cores.end(); k++)
			{
				if(pt.sharedMemoryIslands(*k) != producer_core_islands)
				{
					throw CastException("Task mapped to cores that belong to different shared memory islands.");
				}	
			}

			if(consumer_core_islands != producer_core_islands)
			{
				producers.insert(&producer);
			}
		}

		return producers;
	}

	multiset<const Task*>
	Schedule::remoteTaskConsumers(const Task &t) const
	{
		const Taskgraph &tg = this->getTaskgraph();

		set<Task>::const_iterator iter = tg.getTasks().find(t);
		if(iter == tg.getTasks().end())
		{
			throw PelibException("Task in schedule does not exist in taskgraph.");
		}
		const Task &task = *iter;	

		multiset<const Task*> consumers;
		for(set<const AbstractLink*>::const_iterator j = task.getConsumers().begin(); j != task.getConsumers().end(); j++)
		{
			const Task &consumer = *(*j)->getConsumer();
			if(this->cores(t) != this->cores(consumer))
			{
				consumers.insert(&consumer);
			}
		}
	
		return consumers;
	}

	multiset<const Task*>
	Schedule::remoteTaskProducers(const Task &t) const
	{
		const Taskgraph &tg = this->getTaskgraph();

		set<Task>::const_iterator iter = tg.getTasks().find(t);
		if(iter == tg.getTasks().cend())
		{
			throw PelibException("Task in schedule does not exist in taskgraph.");
		}
		const Task &task = *iter;	

		multiset<const Task*> producers;
		for(set<const AbstractLink*>::const_iterator j = task.getProducers().begin(); j != task.getProducers().end(); j++)
		{
			const Task &producer = *(*j)->getProducer();
			if(this->cores(t) != this->cores(producer))
			{
				producers.insert(&producer);
			}
		}
	
		return producers;
	}

	multiset<const Task*>
	Schedule::remoteConsumers(unsigned int core) const
	{
		multiset<const AbstractLink*> links = remoteConsumersAbstractLink(core);
		multiset<const Task*> tasks;
		for(multiset<const AbstractLink*>::iterator i = links.begin(); i != links.end(); i++)
		{
			const AbstractLink &link = **i;
			tasks.insert(link.getConsumer());
		}

		return tasks;
	}

	multiset<const AbstractLink*>
	Schedule::remoteConsumersAbstractLink(unsigned int core) const
	{
		const Taskgraph &tg = this->getTaskgraph();

		Table::const_iterator iter = this->getSchedule().find(core);
		if(iter == this->getSchedule().end())
		{
			throw PelibException("Cannot find requested core in schedule");
		}

		const set<ExecTask> &seq = iter->second;

		multiset<const AbstractLink*> consumers;
		for(set<ExecTask>::const_iterator i = seq.begin(); i != seq.end(); i++)
		{
			set<Task>::const_iterator iter = tg.getTasks().find(i->getTask());
			if(iter == tg.getTasks().end())
			{
				throw PelibException("Task in schedule does not exist in taskgraph.");
			}
			const Task &task = *iter;	

			for(set<const AbstractLink*>::const_iterator j = task.getConsumers().begin(); j != task.getConsumers().end(); j++)
			{
				const Task &consumer = *(*j)->getConsumer();
				if(this->cores(i->getTask()) != this->cores(consumer))
				{
					consumers.insert(*j);
				}
			}
		}
	
		return consumers;
	}

	multimap<const Task*, const AbstractLink*>
	Schedule::remoteConsumersTaskAbstractLink(unsigned int core) const
	{
		multiset<const AbstractLink*> links = remoteConsumersAbstractLink(core);
		multimap<const Task*, const AbstractLink*> tasklink;
		for(multiset<const AbstractLink*>::iterator i = links.begin(); i != links.end(); i++)
		{
			const AbstractLink &link = **i;
			tasklink.insert(pair<const Task*, const AbstractLink*>(link.getConsumer(), *i));
		}

		return tasklink;
	}

	multiset<const Task*>
	Schedule::remoteProducers(unsigned int core) const
	{
		multiset<const AbstractLink*> links = remoteProducersAbstractLink(core);
		multiset<const Task*> tasks;
		for(multiset<const AbstractLink*>::iterator i = links.begin(); i != links.end(); i++)
		{
			const AbstractLink &link = **i;
			tasks.insert(link.getProducer());
		}

		return tasks;
	}

	multiset<const AbstractLink*>
	Schedule::remoteProducersAbstractLink(unsigned int core) const
	{
		const Taskgraph &tg = this->getTaskgraph();

		Table::const_iterator iter = this->getSchedule().find(core);
		if(iter == this->getSchedule().end())
		{
			throw PelibException("Cannot find requested core in schedule");
		}

		const set<ExecTask> &seq = iter->second;

		multiset<const AbstractLink*> producers;
		for(set<ExecTask>::const_iterator i = seq.begin(); i != seq.end(); i++)
		{
			set<Task>::const_iterator iter = tg.getTasks().find(i->getTask());
			if(iter == tg.getTasks().end())
			{
				throw PelibException("Task in schedule does not exist in taskgraph.");
			}
			const Task &task = *iter;

			for(set<const AbstractLink*>::const_iterator j = task.getProducers().begin(); j != task.getProducers().end(); j++)
			{
				const Task &producer = *(*j)->getProducer();
				if(this->cores(i->getTask()) != this->cores(producer))
				{
					producers.insert(*j);
				}
			}
		}
	
		return producers;
	}

	multimap<const Task*, const AbstractLink*>
	Schedule::remoteProducersTaskAbstractLink(unsigned int core) const
	{
		multiset<const AbstractLink*> links = remoteProducersAbstractLink(core);
		multimap<const Task*, const AbstractLink*> tasklink;
		for(multiset<const AbstractLink*>::iterator i = links.begin(); i != links.end(); i++)
		{
			const AbstractLink &link = **i;
			tasklink.insert(pair<const Task*, const AbstractLink*>(link.getProducer(), *i));
		}

		return tasklink;
	}

	multiset<const Task*>
	Schedule::remoteSharedMemoryIslandConsumers(const set<unsigned int> &islands) const
	{
		const Taskgraph &tg = this->getTaskgraph();
		const Platform &pt = this->getPlatform();

		multiset<const Task*> consumers;
		for(set<unsigned int>::const_iterator i = islands.begin(); i != islands.end(); i++)
		{
			if(*i > pt.getSharedMemoryIslands().size())
			{
				throw CastException("Requested shared memory islands not existing in platform.");
			}
		}

		set<const Task*> tasks_in_islands = this->tasksSharedMemoryIsland(islands);
		for(set<const Task*>::const_iterator i = tasks_in_islands.begin(); i != tasks_in_islands.end(); i++)
		{
			const Task &task_p = **i;
			if(tg.getTasks().find(task_p) == tg.getTasks().end())
			{
				stringstream ss;
				ss << "Trying to schedule task \"" << task_p.getName() << "\" that does not exist in taskgraph.";
				throw CastException(ss.str());
			}
			const Task &task_tg = *tg.getTasks().find(task_p);
			set<unsigned int> producer_cores = this->cores(task_tg);
			set<unsigned int>::const_iterator j = producer_cores.begin();
			Platform::islands producer_core_islands = pt.sharedMemoryIslands(*j);
			for(; j != producer_cores.end(); j++)
			{
				if(pt.sharedMemoryIslands(*j) != producer_core_islands)
				{
					throw CastException("Task mapped to cores that belong to different shared memory islands.");
				}	
			}
			
			for(set<const AbstractLink*>::const_iterator j = task_tg.getConsumers().begin(); j != task_tg.getConsumers().end(); j++)
			{
				const AbstractLink &l = **j;
				const Task &consumer = *l.getConsumer();
				set<unsigned int> consumer_cores = this->cores(consumer);
				set<unsigned int>::const_iterator k = consumer_cores.begin();

				Platform::islands consumer_core_islands = pt.sharedMemoryIslands(*k);
				for(; k != consumer_cores.end(); k++)
				{
					if(pt.sharedMemoryIslands(*k) != consumer_core_islands)
					{
						throw CastException("Task mapped to cores that belong to different shared memory islands.");
					}	
				}

				if(producer_core_islands != consumer_core_islands)
				{
					consumers.insert(&consumer);
				}
			}
		}

		return consumers;
	}

	multiset<const Task*>
	Schedule::remoteSharedMemoryIslandTaskConsumers(const Task &t) const
	{
		const Taskgraph &tg = this->getTaskgraph();
		const Platform &pt = this->getPlatform();

		multiset<const Task*> consumers;
		if(this->getTaskgraph().getTasks().find(t) == this->getTaskgraph().getTasks().end())
		{
			stringstream ss;
			ss << "Task \"" << t.getName() << "\" does not figure in schedule.";
			throw CastException(ss.str());
		}

		if(tg.getTasks().find(t) == tg.getTasks().end())
		{
			stringstream ss;
			ss << "Task \"" << t.getName() << "\" does not figure in taskgraph.";
			throw CastException(ss.str());
		}

		const Task &task_tg = *tg.getTasks().find(t);
		set<unsigned int> producer_cores = this->cores(task_tg);
		set<unsigned int>::const_iterator j = producer_cores.begin();
		Platform::islands producer_core_islands = pt.sharedMemoryIslands(*j);
		for(; j != producer_cores.end(); j++)
		{
			if(pt.sharedMemoryIslands(*j) != producer_core_islands)
			{
				throw CastException("Task mapped to cores that belong to different shared memory islands.");
			}	
		}
		
		for(set<const AbstractLink*>::const_iterator j = task_tg.getConsumers().begin(); j != task_tg.getConsumers().end(); j++)
		{
			const AbstractLink &l = **j;
			const Task &consumer = *l.getConsumer();
			set<unsigned int> consumer_cores = this->cores(*this->getTaskgraph().getTasks().find(consumer));
			set<unsigned int>::const_iterator k = consumer_cores.begin();

			Platform::islands consumer_core_islands = pt.sharedMemoryIslands(*k);
			for(; k != consumer_cores.end(); k++)
			{
				if(pt.sharedMemoryIslands(*k) != consumer_core_islands)
				{
					throw CastException("Task mapped to cores that belong to different shared memory islands.");
				}	
			}

			if(producer_core_islands != consumer_core_islands)
			{
				consumers.insert(&consumer);
			}
		}

		return consumers;
	}

	const set<unsigned int>
	Schedule::cores(const Task &t) const
	{
		if(this->getTaskgraph().getTasks().find(t) == this->getTaskgraph().getTasks().end())
		{
			stringstream ss;
			ss << "Task \"" << t.getName() << "\" does not figure in schedule.";
			throw PelibException(ss.str());
		}
		const Task &tt = *this->getTaskgraph().getTasks().find(t);

		set<unsigned int> cores;
		for(Table::const_iterator i = this->getSchedule().begin(); i != this->getSchedule().end(); i++)
		{
			for(set<ExecTask>::const_iterator j = i->second.begin(); j != i->second.end(); j++)
			{
				if(j->getTask() == tt)
				{
					cores.insert(i->first);
				}
			}
		}

		return cores;
	}

	Algebra
	Schedule::addStartTime(const Algebra &data, const Taskgraph &tg, const Platform &platform)
	{
		// Now browse all tasks in all cores and compute a starting time matrix
		Algebra sched = data;
		Algebra input = tg.buildAlgebra(platform);
		input = input.merge(platform.buildAlgebra());
		input = input.merge(sched);

		map<int, float> start_time = input.find<Vector<int, float> >("Tau")->getValues();
		map<int, float> frequency = input.find<Vector<int, float> >("frequency")->getValues();
		map<int, float> workload = input.find<Vector<int, float> >("Tau")->getValues();
		map<int, float> width = input.find<Vector<int, float> >("wi")->getValues();
		map<int, float> max_width = input.find<Vector<int, float> >("Wi")->getValues();
		map<int, map<int, float> > efficiency = input.find<Matrix<int, int, float> >("e")->getValues();
		map<int, map<int, float> > map_sched = input.find<Matrix<int, int, float> >("schedule")->getValues();

		for(map<int, float>::iterator i = start_time.begin(); i != start_time.end(); i++)
		{
			i->second = 0;
		}

		for(map<int, map<int, float> >::const_iterator i = map_sched.begin(); i != map_sched.end(); i++)
		{
			double mystart = 0;
			for(map<int, float>::const_iterator j = i->second.begin(); j != i->second.end(); j++)
			{
				int n = (int)j->second;
				if(n > 0)
				{
					if(start_time.find((int)n)->second < mystart)
					{
						start_time.find((int)n)->second = mystart;
					}

					double tau = workload.find((int)n)->second;
					size_t wi = (size_t)floor((width.find((int)n)->second + 0.5));
					size_t Wi = (size_t)max_width.find((int)n)->second;
					double e = wi <= Wi ? efficiency.find((int)n)->second.find((int)wi)->second : 1e-06;
					double f = frequency.find((int)n)->second;
					double delta = (tau / (wi * e) / f);
					mystart = mystart + delta;
				}
			}
		}

		const Vector<int, string> *name = input.find<Vector<int, string> >("name");
		if(name == NULL)
		{
			map<int, string> names;
			for(set<Task>::const_iterator iter = tg.getTasks().begin(); iter != tg.getTasks().end(); iter++)
			{
				names.insert(pair<int, string>(std::distance(tg.getTasks().begin(), iter) + 1, iter->getName()));
			}

			name = new Vector<int, string>("name", names);
			sched.insert(name);
		}

		Vector<int, float> *start = new Vector<int, float>("start", start_time);
		sched.insert(start);

		return sched;
	}
}
