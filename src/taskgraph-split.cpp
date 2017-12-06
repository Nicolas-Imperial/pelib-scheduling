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


#include <iostream>
#include <cstdlib>
#include <vector>
#include <map>

#include <pelib/PelibException.hpp>
#include <pelib/Taskgraph.hpp>
#include <pelib/Platform.hpp>
#include <pelib/Record.hpp>

#include <pelib/process.h>
#include <pelib/argument_parsing.hpp>
#include <pelib/dl.h>

#ifdef debug
#undef debug
#endif

#define debug(expr) cerr << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #expr << " = \"" << expr << "\"." << endl;

using namespace std;
using namespace pelib;

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
	set<string> tasks;
	string name;
} tgd_t;

typedef struct
{
	vector<tgd_t> tgs;
	string others;
	string src;
} args_t;

static
args_t
parse(char** arg)
{
	args_t args;
	args.src = string(typeid(Taskgraph).name());
	args.others = string();

	for(; arg[0] != NULL; arg++)
	{
		if(strcmp(arg[0], "--taskgraph") == 0)
		{
			arg++;
			args.src = arg[0] != NULL ? string(arg[0]) : string(typeid(Taskgraph).name());
			continue;
		}

		if(strcmp(arg[0], "--others") == 0)
		{
			arg++;
			args.others = arg[0] != NULL ? string(arg[0]) : string(typeid(Taskgraph).name());
			continue;
		}

		
		if(strcmp(arg[0], "--split") == 0)
		{
			tgd_t tg;
			
			arg++;
			tg.name = string(arg[0]);

			arg++;
			if(strcmp(arg[0], "--tasks") == 0)
			{
				arg++;
				if(strcmp(arg[0], "[") == 0)
				{
					for(arg++; arg[0] != NULL && strcmp(arg[0], "]") != 0; arg++)
					{
						tg.tasks.insert(string(arg[0]));
					}	
				}
				else
				{
					tg.tasks.insert(string(arg[0]));
				}
			}

			args.tgs.push_back(tg);

			continue;
		}
	}

	return args;
}

static
Taskgraph*
split_tg(const tgd_t &tgd, const Taskgraph &tg, set<Task> &split)
{
	set<Task> tasks;
	set<AbstractLink> links;

	for(const string &task: tgd.tasks)
	{
		set<Task>::const_iterator search = tg.getTasks().find(Task(task));
		if(search != tg.getTasks().end())
		{
			tasks.insert(*search);
			split.insert(*search);
		}
	}

	for(const AbstractLink &link: tg.getLinks())
	{
		if(tasks.find(*link.getProducer()) != tasks.end() && tasks.find(*link.getConsumer()) != tasks.end())
		{
			links.insert(link);
		}
	}

	Taskgraph *newtg = new Taskgraph(tasks, links);
	newtg->setName(tg.getName());
	newtg->setDeadlineCalculator(tg.getDeadlineCalculator());
	
	return newtg;
}

std::map<string, pelib::Record*>
pelib_process(const std::map<string, pelib::Record*> &records, size_t argc, char** argv)
{
	// Parse extra arguments and skip them
	args_t args = parse(argv);

	map<string, Record*>::const_iterator src_search = records.find(args.src);
	if(src_search == records.end())
	{
		stringstream ss;
		ss << "Could not find record named \"" << args.src << "\" in collection.";
		throw PelibException(ss.str());
	}
	const Taskgraph *tg_ptr = dynamic_cast<Taskgraph*>(src_search->second);
	if(tg_ptr == NULL)
	{
		stringstream ss;
		ss << "Record \"" << args.src << "\" is not an instance of Taskgraph.";
		throw PelibException(ss.str());
	}
	const Taskgraph &tg = *tg_ptr;
	//debug(tg.getLinks().begin()->getDataType());

	map<string, Record*> output;
	set<Task> split; // Keeps track of all tasks that have been set to any new taskgraph
	for(const tgd_t &tgd: args.tgs)
	{
		Taskgraph *t = split_tg(tgd, tg, split);
		if(t->getLinks().size() > 0)
		{
			//debug(t->getLinks().begin()->getDataType());
		}
		output.insert(pair<string, Record*>(tgd.name, t));
	}

	if(args.others.compare("") != 0)
	{
		tgd_t tgd;
		tgd.name = args.others;

		for(const Task &t: tg.getTasks())
		{
			if(split.find(t) == split.end())
			{
				tgd.tasks.insert(t.getName());
			}
		}

		Taskgraph *t = split_tg(tgd, tg, split);
		//debug(t->getLinks().begin()->getDataType());
		output.insert(pair<string, Record*>(tgd.name, t));
	}

	// Add all remaining records into collection
	for(map<string, Record*>::const_iterator i = records.begin(); i != records.end(); i++)
	{
		Record *split;
		if(i->first.compare(string(typeid(Taskgraph).name())) == 0)
		{
			//debug(((Taskgraph*)i->second)->getLinks().begin()->getDataType());
			Taskgraph *t = (Taskgraph*)i->second->clone();
			split = t;
		}
		else
		{
			split = i->second->clone();
		}
		output.insert(pair<string, Record*>(i->first, split));
	}

	return output;
}

void
pelib_delete_process(pelib::Record* obj)
{
	delete obj;
}

#ifdef __cplusplus
}
#endif

