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

#include <pelib/Schedule.hpp>
#include <pelib/PelibException.hpp>
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

struct args
{
	vector<string> string_id;
	string name;
	string taskgraph;
};
typedef struct args args_t;

static
args_t
parse(char** arg)
{
	args_t args;
	args.name = string(typeid(Schedule).name());
	args.taskgraph = string();

	for(; arg[0] != NULL; arg++)
	{
		if(strcmp(arg[0], "--name") == 0)
		{
			arg++;
			args.name = string(arg[0] != NULL ? arg[0] : string(typeid(Schedule).name()));
			continue;
		}

		if(strcmp(arg[0], "--taskgraph") == 0)
		{
			arg = arg[1] != NULL ? arg + 1 : arg;
			if(string(arg[0]).compare("--class") == 0 || string(arg[0]).compare("--taskgraph") == 0)
			{
				args.taskgraph = string(typeid(Taskgraph).name());
			}
			else
			{
				args.taskgraph = string(arg[0]);
			}
			continue;
		}

		if(strcmp(arg[0], "--schedules") == 0)
		{
			arg++;
			if(strcmp(arg[0], "[") == 0)
			{
				for(arg++; arg[0] != NULL && strcmp(arg[0], "]") != 0; arg++)
				{
					args.string_id.push_back(arg[0]);
				}
			}
			else
			{
				args.string_id.push_back(arg[0]);
			}
			continue;
		}

		break;
	}

	return args;
}

// TODO: find a way to use libdl to invoke the library that created the object
char *library;

std::map<string, pelib::Record*>
pelib_process(const std::map<string, pelib::Record*> &records, size_t argc, char** argv)
{
	// Parse extra arguments and skip them
	args_t args = parse(argv);

	Taskgraph *tg = NULL;
	if(args.taskgraph.compare(string()) != 0)
	{
		map<string, Record*>::const_iterator search_tg = records.find(args.taskgraph);
		if(search_tg == records.end())
		{
			stringstream ss;
			ss << "Could not find taskgraph named \"" << args.taskgraph << "\".";
			throw PelibException(ss.str());
		}
		const Taskgraph *tgRef = dynamic_cast<Taskgraph*>(search_tg->second);
		if(tgRef == NULL)
		{
			stringstream ss;
			ss << "Could not find taskgraph named \"" << args.taskgraph << "\".";
			throw PelibException(ss.str());
		}

		tg = tgRef->clone();
	}

	// Gather all schedules to be merged, in order, if any
	vector<const Schedule*> schedules;
	if(args.string_id.size() == 0)
	{
		for(const pair<string, Record *> &rec: records)
		{
			Schedule *sched = dynamic_cast<Schedule*>(rec.second);
			if(sched != NULL)
			{
				schedules.push_back(sched);
			}
		}
	}
	else
	{
		for(const string &id: args.string_id)
		{
			map<string, Record*>::const_iterator search = records.find(id);
			if(search != records.end())
			{
				const Schedule *sched = dynamic_cast<Schedule*>(search->second);
				if(sched != NULL)
				{
					schedules.push_back(sched);
				}
			}
		}
	}
	if(schedules.size() == 0)
	{
		throw PelibException("No schedule was found to merge");
	}

	vector<const Schedule*>::const_iterator i = schedules.begin();
	Schedule *schedule;
	if(tg == NULL)
	{
 		schedule = new Schedule(**i);
	}
	else
	{
		schedule = new Schedule((*i)->getName(), tg->getName(), (*i)->getSchedule(), (*i)->getLinks(), *tg, (*i)->getPlatform());
	}
	std::advance(i, 1);
	for(; i != schedules.end(); i++)
	{
		schedule->merge(**i, string(schedule->getName()).append(string("+")).append((*i)->getName()), schedule->getAppName(), set<AllotedLink>());
	}

	map<string, Record*> output;
	output.insert(pair<string, Record*>(args.name, schedule));

	// Now put cloned ref taskgraph
	if(tg != NULL)
	{
		output.insert(pair<string, Record*>(args.taskgraph, tg));
	}

	for(map<string, Record*>::const_iterator i = records.begin(); i != records.end(); i++)
	{
		output.insert(pair<string, Record*>(i->first, i->second->clone()));
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

