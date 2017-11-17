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
#include "schedule-parse.hpp"
#include <pelib/PelibException.hpp>
#include <pelib/argument_parsing.hpp>
#include <pelib/dl.h>

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
	pelib_argument_stream lib;
} args_t;

static args_t
read_args(size_t argc, char **argv)
{
	args_t args;
	argv += pelib_argument_stream_parse(argv, &args.lib);

	return args;
}

static Schedule*
copy_schedule(map<string, Record*> records, const args_t &args)
{
	if(args.lib.library == NULL)
	{
		throw PelibException("[ERROR] No input schedule specified.");
	}

	// Load library
	char *library = args.lib.library;
	void *libParser = load_lib(library);
	map<string, Record*> output;
	Schedule *sched = NULL;

	Record* (*read_schedule)(istream&, size_t, char**, const map<string, Record*>&) = (Record* (*)(istream&, size_t, char**, const map<string, Record*>&))load_function(libParser, "pelib_parse");

	// Read input data
	if(records.find(typeid(Taskgraph).name()) != records.end() && records.find(typeid(Platform).name()) != records.end())
	{
		Taskgraph *tg = (Taskgraph*)records.find(typeid(Taskgraph).name())->second;
		if(tg == NULL)
		{
			throw PelibException("[ERROR] Missing taskgraph description. Aborting");
		}	
		Platform *pt = (Platform*)records.find(typeid(Platform).name())->second;
		if(pt == NULL)
		{
			throw PelibException("[ERROR] Missing platform description. Aborting");
		}

		// Prepare output collection and fill it with schedule generated by library
		map<const string, double> statistics;
		switch(args.lib.stream)
		{
			case STREAM_STDIN:
				sched = (Schedule*)read_schedule(cin, args.lib.argc, args.lib.argv, records);
			break;

			case STREAM_STDOUT:
			case STREAM_STDERR:
				throw PelibException("Attempting to read schedule from standard output");
			break;

			case STREAM_FILE:
			{
				ifstream myfile(args.lib.filename);
				sched = (Schedule*)read_schedule(myfile, args.lib.argc, args.lib.argv, records);
				myfile.close();
			}
			break;

			case STREAM_NOTHING:
			default:
				throw PelibException("No input schedule specified");
			break;
		}
	
		Taskgraph *ptg = new Taskgraph(tg);
		Platform *ppt = new Platform(pt);
		output.insert(pair<string, Record*>(typeid(Schedule).name(), sched));
		output.insert(pair<string, Record*>(typeid(Taskgraph).name(), ptg));
		output.insert(pair<string, Record*>(typeid(Platform).name(), ppt));
	}

	destroy_lib(libParser);

	return sched;
}

const pelib::Schedule*
pelib_schedule(const pelib::Taskgraph &tg, const pelib::Platform &pt, size_t argc, char** argv, map<const string, double>& stats)
{
	args_t args = read_args(argc, argv);
	map<string, Record*> inputs;
	inputs.insert(pair<string, Record*>(string(typeid(Taskgraph).name()), new Taskgraph(tg)));
	inputs.insert(pair<string, Record*>(string(typeid(Platform).name()), new Platform(pt)));
	return copy_schedule(inputs, args);
}

pelib::Record*
pelib_parse(std::istream& cin, size_t argc, char **argv, const map<string, Record*> &inputs)
{
	args_t args = read_args(argc, argv);
	return copy_schedule(inputs, args);
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
