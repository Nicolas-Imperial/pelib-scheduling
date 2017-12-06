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
#include <map>

#include <pelib/Record.hpp>
#include <pelib/Schedule.hpp>
#include <pelib/UniformLinkAllocator.hpp>

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
	string name;
};
typedef struct args args_t;

static
args_t
parse(char** arg)
{
	args_t args;
	args.name = string(typeid(Schedule).name());

	for(; arg[0] != NULL; arg++)
	{
		if(strcmp(arg[0], "--schedule") == 0)
		{
			arg++;
			args.name = string(arg[0] != NULL ? arg[0] : typeid(Schedule).name());
			continue;
		}

		continue;
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

	// Load library
	map<string, Record*> output;

	Schedule *schedule = NULL;
	map<string, Record*>::const_iterator search = records.find(args.name);
	if(search != records.end())
	{
		schedule = dynamic_cast<Schedule*>(records.find(args.name)->second->clone());
		schedule->allocateLinks(UniformLinkAllocator());
	}

	if(schedule != NULL)
	{
		output.insert(pair<string, Record*>(args.name, schedule));
	}
	for(const pair<string, Record*> &p: records)
	{
		output.insert(pair<string, Record*>(p.first, p.second->clone()));
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

