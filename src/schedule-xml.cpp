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

#include <pelib/parser.h>
#include <pelib/output.h>

#include <pelib/XMLSchedule.hpp>
#include <pelib/Taskgraph.hpp>

#include "schedule-parse.hpp"

using namespace std;
using namespace pelib;

#ifdef __cplusplus
extern "C" {
#endif

#ifndef debug
#define debug(expr) cerr << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #expr << " = \"" << expr << "\"." << endl;
#endif

struct args
{
	string schedule;
};
typedef struct args args_t;

static
args_t
parse_dump(char** arg)
{
	args_t args;
	args.schedule = typeid(Schedule).name();

	for(; arg[0] != NULL && string(arg[0]).compare("--") != 0; arg++)
	{
		if(strcmp(arg[0], "--schedule") == 0)
		{
			arg++;
			string name;
			if(arg[0] != NULL)
			{
				name = string(arg[0]);
			}
			else
			{
				name = typeid(Schedule).name();
			}
			args.schedule = name;
			continue;
		}

		break;
	}

	return args;
}

// /!\ the content of argv is freed after this function is run
pelib::Record*
pelib_parse(std::istream& cin, size_t argc, char **argv, const map<string, Record*> &inputs)
{
	schedule_parse_args_t args = parse_arguments(argc, argv);
	Taskgraph &tg = getTaskgraph(args.taskgraph, inputs);
	Platform &pt = getPlatform(args.platform, inputs);
	Schedule* sched = XMLSchedule().parse(cin, tg, pt);

	return sched;
}

// /!\ the content of argv is freed after this function is run
void
pelib_dump(std::ostream& cout, const std::map<string, Record*> &records, size_t argc, char **argv)
{
	args_t args = parse_dump(argv);
	Schedule *sc;

	if(records.find(args.schedule) != records.end())
	{
		sc = (Schedule*)records.find(args.schedule)->second;
	}
	else
	{
		throw PelibException("Missing schedule instance to output in data set.");
	}
#define check(var, core, task) { Schedule::table::iterator ii = ((Schedule::table&)var).begin(); std::advance(ii, core); Schedule::sequence::iterator jj = ii->second.begin(); std::advance(jj, task); debug(jj->second.first->getName()); }
	XMLSchedule().dump(cout, sc);
}

void
pelib_delete_schedule(Record *obj)
{
	delete obj;
}

void
pelib_delete_record(Record *obj)
{
	delete obj;
}
#ifdef __cplusplus
}
#endif

