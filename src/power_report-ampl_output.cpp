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

#include <pelib/output.h>

#include <pelib/AmplOutput.hpp>
#include <pelib/PowerReport.hpp>

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
	string name;
};
typedef struct args args_t;

static
args_t
parse(char** arg)
{
	args_t args;
	args.name = typeid(PowerReport).name();

	for(; arg[0] != NULL; arg++)
	{
		if(strcmp(arg[0], "--name") == 0)
		{
			arg++;
			args.name = string(arg[0] != NULL ? arg[0] : typeid(PowerReport).name());
			continue;
		}
		
		continue;
	}

	return args;
}

// /!\ the content of argv is freed after this function is run
void
pelib_dump(std::ostream& cout, const std::map<string, Record*> &records, size_t argc, char **argv)
{
	args_t args = parse(argv);

	map<string, Record*>::const_iterator find = records.find(args.name);
	if(find == records.end())
	{
		stringstream ss;
		ss << "No power report named \"" << args.name << "\" was found in records.";
		throw PelibException(ss.str());
	}
	const PowerReport *report = (PowerReport*)find->second;

	AmplOutput output(AmplOutput::intFloatHandlers());
	Algebra alg = report->buildAlgebra();
	output.dump(cout, alg);
}

void
pelib_delete_record(Record *obj)
{
	delete obj;
}

#ifdef __cplusplus
}
#endif

