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


#include <sstream>

#include <pelib/Taskgraph.hpp>
#include <pelib/DeadlineCalculator.hpp>
#include <pelib/ParseException.hpp>
#include <pelib/CastException.hpp>
#include <pelib/PelibException.hpp>
#include <pelib/DummyCore.hpp>

#include <pelib/Scalar.hpp>
#include <pelib/Vector.hpp>
#include <pelib/Matrix.hpp>

#ifdef debug
#undef debug
#endif

#if 01
#define debug(var) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << var << "\"" << endl;
#else
#define debug(var)
#endif

using namespace std;

namespace pelib
{
	Taskgraph::Taskgraph()
	{
	}

	Taskgraph::Taskgraph(const set<Task> &tasks, const set<AbstractLink> &links)
	{
		// Check if all tasks have a unique string ID
		set<string> task_ids;
		for(set<Task>::const_iterator iter = tasks.begin(); iter != tasks.end(); iter++)
		{
			task_ids.insert(iter->getName());
		}

		if(task_ids.size() != tasks.size())
		{
			// This should never happen as tasks are indexed with their id
			throw ParseException("The tasks added do not have a unique taskId.");
		}
		
		this->tasks = tasks;
		this->setLinks(links);
	}

	Taskgraph::~Taskgraph()
	{
		// Do nothing
	}

	void
	Taskgraph::merge(const Taskgraph &tg, const string &name, const string &deadline, const set<AbstractLink> &junction)
	{
		const set<Task> &foreign_tasks = tg.getTasks();
		const set<AbstractLink> &foreign_links = tg.getLinks();

		set<Task> this_tasks = this->getTasks();
		this_tasks.insert(foreign_tasks.begin(), foreign_tasks.end());

		set<AbstractLink> this_links = this->getLinks();
		for(const AbstractLink &ab: foreign_links)
		{
			set<Task>::const_iterator search_producer = this_tasks.find(*ab.getProducer());
			if(search_producer == this_tasks.end())
			{
				stringstream ss;
				ss << "Could not find task \"" << ab.getProducer()->getName() << "\" in merge task set";
				throw PelibException(ss.str());
			}
			set<Task>::const_iterator search_consumer = this_tasks.find(*ab.getConsumer());
			if(search_consumer == this_tasks.end())
			{
				stringstream ss;
				ss << "Could not find task \"" << ab.getConsumer()->getName() << "\" in merge task set";
				throw PelibException(ss.str());
			}
			this_links.insert(AbstractLink(ab, *search_producer, *search_consumer));
		}
		for(const AbstractLink &ab: junction)
		{
			set<Task>::const_iterator search_producer = this_tasks.find(*ab.getProducer());
			if(search_producer == this_tasks.end())
			{
				stringstream ss;
				ss << "Could not find task \"" << ab.getProducer()->getName() << "\" in merge task set";
				throw PelibException(ss.str());
			}
			set<Task>::const_iterator search_consumer = this_tasks.find(*ab.getConsumer());
			if(search_consumer == this_tasks.end())
			{
				stringstream ss;
				ss << "Could not find task \"" << ab.getConsumer()->getName() << "\" in merge task set";
				throw PelibException(ss.str());
			}
			this_links.insert(AbstractLink(ab, *search_producer, *search_consumer));
		}

		this->setLinks(this_links);
		this->setDeadlineCalculator(deadline);
	}

	Taskgraph
	Taskgraph::merge(const Taskgraph &tg, const string &name, const string &deadline, const set<AbstractLink> &junction) const
	{
		Taskgraph newtg(*this);
		newtg.merge(tg, name, deadline, junction);

		return newtg;
	}

	void
	Taskgraph::setLinks(const set<AbstractLink> &links)
	{
		// Add all links so their endpoints point to tasks in the local collection
		this->links.clear();
		for(set<AbstractLink>::const_iterator i = links.begin(); i != links.end(); i++)
		{
			const Task &producer = *this->tasks.find(*i->getProducer());
			const Task &consumer = *this->tasks.find(*i->getConsumer());

			AbstractLink link(producer, consumer, i->getProducerName(), i->getConsumerName(), i->getDataType(), i->getHeader(), i->getIncludePath(), i->getProducerRate(), i->getConsumerRate());
			this->links.insert(link);
		}

		// Update the tasks' producer and consumer links
		for(set<Task>::iterator i = this->tasks.begin(); i != this->tasks.end(); i++)
		{
			Task &t = (Task&)*i;

			// Keep a copy of the link lists
			set<const AbstractLink*> producers = t.getProducers();
			set<const AbstractLink*> consumers = t.getConsumers();

			// Clear the link lists
			t.getProducers().clear();
			t.getConsumers().clear();
		
			// Reconstruct all links so they point to local tasks
			for(set<const AbstractLink*>::iterator j = producers.begin(); j != producers.end(); j++)
			{
				const Task *producer = (*j)->getProducer();
				const Task *consumer = (*j)->getConsumer();
				AbstractLink newAbstractLink(*this->tasks.find(*producer), *this->tasks.find(*consumer), (*j)->getProducerName(), (*j)->getConsumerName(), (*j)->getDataType(), (*j)->getHeader(), (*j)->getIncludePath(), (*j)->getProducerRate(), (*j)->getConsumerRate());
				const AbstractLink &link = *this->links.find(newAbstractLink);
				t.getProducers().insert(&link);
			}
			
			// Reconstruct all links so they point to local tasks
			for(set<const AbstractLink*>::iterator j = consumers.begin(); j != consumers.end(); j++)
			{
				const Task *producer = (*j)->getProducer();
				const Task *consumer = (*j)->getConsumer();
				AbstractLink newAbstractLink(*this->tasks.find(*producer), *this->tasks.find(*consumer), (*j)->getProducerName(), (*j)->getConsumerName(), (*j)->getDataType(), (*j)->getHeader(), (*j)->getIncludePath(), (*j)->getProducerRate(), (*j)->getConsumerRate());
				const AbstractLink &link = *this->links.find(newAbstractLink);
				t.getConsumers().insert(&link);
			}
		}
	}

	Taskgraph::Taskgraph(const Taskgraph *graph)
	{
		this->name = graph->getName();
		this->deadlineCalculator = graph->getDeadlineCalculator();
		this->tasks = graph->getTasks();
		this->setLinks(graph->getLinks());
	}

	Taskgraph::Taskgraph(const Taskgraph &graph)
	{
		this->name = graph.getName();
		this->deadlineCalculator = graph.getDeadlineCalculator();
		this->tasks = graph.getTasks();
		this->setLinks(graph.getLinks());
	}

	Taskgraph::Taskgraph(const Algebra &algebra)
	{
		this->name = "Converted from Algebra";
		const Scalar<float> *M = algebra.find<Scalar<float> >("M");
		const Scalar<float> *n = algebra.find<Scalar<float> >("n");
		const Vector<int, float> *tau = algebra.find<Vector<int, float> >("Tau");
		const Vector<int, float> *Wi = algebra.find<Vector<int, float> >("Wi");
		const Matrix<int, int, float> *e = algebra.find<Matrix<int, int, float> >("e");
		const Matrix<int, int, float> *c = algebra.find<Matrix<int, int, float> >("c");
		const Matrix<int, int, string> *cpname = algebra.find<Matrix<int, int, string> >("cpname");
		const Matrix<int, int, string> *ccname = algebra.find<Matrix<int, int, string> >("ccname");
		const Matrix<int, int, string> *ctype = algebra.find<Matrix<int, int, string> >("cheader");
		const Matrix<int, int, string> *cheader = algebra.find<Matrix<int, int, string> >("cheader");
		const Matrix<int, int, string> *cflag = algebra.find<Matrix<int, int, string> >("cflag");
		const Vector<int, string> *task_name = algebra.find<Vector<int, string> >("name");
		
		if(M == NULL || n == NULL || tau == NULL || Wi == NULL || e == NULL || task_name == NULL || cpname == NULL || ccname == NULL)
		{
			throw PelibException("Missing parameter. Need float scalar M, integer scalar n, integer vectors tau and Wi (of size n), float matrix e of n lines, vector name for tasks' names and links (c, cpname and ccname).");
		}
		else
		{
			stringstream ss;
			ss << M->getValue();
			this->deadlineCalculator = ss.str(); 
		}

		for(map<int, float>::const_iterator i = tau->getValues().begin(); i != tau->getValues().end(); i++)
		{
			float id = i->first;
			float work = i->second;
			float max_wi = Wi->getValues().find((int)id)->second;

			stringstream ss;
			for(map<int, float>::const_iterator j = e->getValues().find((int)id)->second.begin(); j != e->getValues().find((int)id)->second.end(); j++)
			{
				ss << j->second << " ";
			}
	
			if(task_name->getValues().find(id) == task_name->getValues().end())
			{
				throw PelibException("Missing task name in Algebra record when building a Taskgraph instance");
			}

			Task t(task_name->getValues().find(id)->second);
			t.setWorkload(work);
			t.setMaxWidth(max_wi);
			t.setEfficiencyString(ss.str());

			this->tasks.insert(t);
		}
		
		if(c != NULL && ctype != NULL && cheader != NULL && cflag != NULL)
		{
			for(map<int, map<int, float> >::const_iterator i = c->getValues().begin(); i != c->getValues().end(); i++)
			{
				for(map<int, float>::const_iterator j = i->second.begin(); j != i->second.end(); j++)
				{
					if(j->second > 0)
					{
						set<Task>::const_iterator from = this->getTasks().begin(), to = this->getTasks().begin();
						std::advance(from, (size_t)i->first - 1);
						std::advance(to, (size_t)j->first - 1);
						//string producer_name = 
						//string consumer_name = 
						AbstractLink link(*from, *to, cpname->getValues().find(i->first)->second.find(j->first)->second, ccname->getValues().find(i->first)->second.find(j->first)->second, ctype->getValues().find(i->first)->second.find(j->first)->second, cheader->getValues().find(i->first)->second.find(j->first)->second, cflag->getValues().find(i->first)->second.find(j->first)->second);
						this->links.insert(link);
					}
				}
			}
		}
		else
		{
			this->links.clear();
		}
	}

	Taskgraph*
	Taskgraph::clone() const
	{
		Taskgraph *tg = new Taskgraph(this);
		return tg;
	}

	Algebra
	Taskgraph::buildAlgebra() const
	{
		set<unsigned int> f;
		f.insert(1);
		set<const Core*, Core::LessCorePtrByCoreId> cores;
		cores.insert(new DummyCore(f, 1, map<unsigned int, Core::MemorySize>()));
		Platform arch(cores);
		
		return buildAlgebra(Platform(cores));
	}
	
	Algebra
	Taskgraph::buildAlgebra(const Platform &arch) const
	{
		Algebra out;

		Scalar<float> n("n", getTasks().size());
		map<int, map<int, float> > map_e;
		map<int, map<int, float> > map_c;
		map<int, map<int, string> > map_cpname;
		map<int, map<int, string> > map_ccname;
		map<int, map<int, string> > map_ctype;
		map<int, map<int, string> > map_cheader;
		map<int, map<int, string> > map_cflag;
		map<int, float> map_tau;
		map<int, float> map_streaming;
		map<int, float> map_Wi;
		map<int, string> map_name;

		if(!arch.isHomogeneous())
		{
			throw CastException("Cannot output discretive efficiency function for a heterogeneous platform.");
		}

		for(set<Task>::const_iterator i = getTasks().begin(); i != getTasks().end(); i++)
		{
			map_tau.insert(pair<int, float>(std::distance(this->getTasks().begin(), i) + 1, i->getWorkload()));
			map_name.insert(pair<int, string>(std::distance(this->getTasks().begin(), i) + 1, i->getName()));
			float max_width = 0;
			if(i->getMaxWidth() > arch.getCores().size())
			{
				max_width = arch.getCores().size();
			}
			else
			{
				max_width = i->getMaxWidth();
			}
			map_Wi.insert(pair<int, float>(std::distance(this->getTasks().begin(), i) + 1, max_width));

			map<int, float> task_e;
			for(size_t j = 1; j <= arch.getCores().size(); j++)
			{
				task_e.insert(pair<int, float>((int)j, i->getEfficiency(j)));
			}
			
			map_e.insert(pair<int, map<int, float> >(std::distance(this->getTasks().begin(), i) + 1, task_e));

			map<int, float> task_c;
			map<int, string> task_cpname;
			map<int, string> task_ccname;
			map<int, string> task_ctype;
			map<int, string> task_cheader;
			map<int, string> task_cflag;
			for(set<Task>::const_iterator j = getTasks().begin(); j != getTasks().end(); j++)
			{
				set<AbstractLink>::const_iterator k;
				for(k = this->getLinks().begin(); k != this->getLinks().end(); k++)
				{
					if(*k->getProducer() == *i && *k->getConsumer() == *j)
					{
						task_c.insert(pair<int, float>((int)std::distance(this->getTasks().begin(), j) + 1, 1));
						task_ctype.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, k->getDataType()));
						task_cpname.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, k->getProducerName()));
						task_ccname.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, k->getConsumerName()));
						task_cheader.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, k->getHeader()));
						task_cflag.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, k->getIncludePath()));
						break;
					}
				}
				if(k == this->getLinks().end())
				{
					task_c.insert(pair<int, float>((int)std::distance(this->getTasks().begin(), j) + 1, 0));
					task_cpname.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, string("none")));
					task_ccname.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, string("none")));
					task_ctype.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, string("none")));
					task_cheader.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, string("none")));
					task_cflag.insert(pair<int, string>((int)std::distance(this->getTasks().begin(), j) + 1, string("none")));
				}
			}
			
			map_c.insert(pair<int, map<int, float> >(std::distance(this->getTasks().begin(), i) + 1, task_c));
			map_ctype.insert(pair<int, map<int, string> >(std::distance(this->getTasks().begin(), i) + 1, task_ctype));
			map_cheader.insert(pair<int, map<int, string> >(std::distance(this->getTasks().begin(), i) + 1, task_cheader));
			map_cflag.insert(pair<int, map<int, string> >(std::distance(this->getTasks().begin(), i) + 1, task_cflag));
			map_cpname.insert(pair<int, map<int, string> >(std::distance(this->getTasks().begin(), i) + 1, task_cpname));
			map_ccname.insert(pair<int, map<int, string> >(std::distance(this->getTasks().begin(), i) + 1, task_ccname));
		}

		Vector<int, float> tau("Tau", map_tau);
		Vector<int, float> Wi("Wi", map_Wi);
		Vector<int, string> name("name", map_name);
		Matrix<int, int, float> e("e", map_e);
		Matrix<int, int, float> c("c", map_c);
		Matrix<int, int, string> ctype("cpname", map_cpname);
		Matrix<int, int, string> cpname("ccname", map_ccname);
		Matrix<int, int, string> ccname("ctype", map_ctype);
		Matrix<int, int, string> cheader("cheader", map_cheader);
		Matrix<int, int, string> cflag("cflag", map_cflag);

		Scalar<float> M("M", getDeadline(arch), AlgebraData::higher);

		out.insert(&n);
		out.insert(&name);
		out.insert(&tau);
		out.insert(&Wi);
		out.insert(&e);
		out.insert(&c);
		out.insert(&cpname);
		out.insert(&ccname);
		out.insert(&ctype);
		out.insert(&cheader);
		out.insert(&cflag);
		out.insert(&M);

		return out;
	}

	string
	Taskgraph::getName() const
	{
		return this->name;
	}

	void
	Taskgraph::setName(const string name)
	{
		this->name = name;
	}

	string
	Taskgraph::getDeadlineCalculator() const
	{
		return this->deadlineCalculator;
	}

	void
	Taskgraph::setDeadlineCalculator(const string deadlineCalculator)
	{
		try{
			DeadlineCalculator *calculator = DeadlineCalculator::getDeadlineCalculator(deadlineCalculator);
			delete calculator;
		} catch (ParseException &e)
		{
			throw e;
		}
		
		this->deadlineCalculator = deadlineCalculator;
	}

	double
	Taskgraph::getDeadline(const Platform &arch) const
	{
		DeadlineCalculator *calculator = DeadlineCalculator::getDeadlineCalculator(this->getDeadlineCalculator());
		double time = calculator->calculate(*this, arch);
		delete calculator;
		
		return time;
	}
	
	const set<Task>&
	Taskgraph::getTasks() const
	{
		return tasks;
	}

	set<Task>&
	Taskgraph::getTasks()
	{
		return tasks;
	}

	const Task&
	Taskgraph::findTask(const string &taskId) const
	{
		for(set<Task>::const_iterator iter = this->tasks.begin(); iter != this->tasks.end(); iter++)
		{
			if(iter->getName().compare(taskId) == 0)
			{
				return *iter;
			}
		}

		throw ParseException("No task \"" + taskId + "\" exists in this taskgraph.");
	}

	const set<AbstractLink>&
	Taskgraph::getLinks() const
	{
		return this->links;
	}

	set<AbstractLink>&
	Taskgraph::getLinks()
	{
		return this->links;
	}

	Taskgraph&
	Taskgraph::operator=(const Taskgraph& copy)
	{
		this->name = copy.getName();
		this->deadlineCalculator = copy.getDeadlineCalculator();
		this->tasks = copy.getTasks();
		this->setLinks(copy.getLinks());	

		return *this;
	}
}
