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

#include <pelib/Scalar.hpp>
#include <pelib/argument_parsing.hpp>
#include <pelib/scheduler.h>
#include <pelib/dl.h>
#include <pelib/KimEtAlPowerModel.hpp>

#ifdef debug
#undef debug
#endif

#define debug(var) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << (var) << "\"" << endl;

using namespace std;
using namespace pelib;

#ifdef __cplusplus
extern "C" {
#endif

struct args
{
	float K1, K2, n, Vtheta, Vt, alpha, Tox, W;
	bool showStatsOut;
	bool showStatsErr;
	char* showStatsFile;
	
};
typedef struct args args_t;

static args_t
parse(char **args)
{
	args_t out;
	out.K1 = 1;
	out.K2 = 1;
	out.n = 1;
	out.Vtheta = 2.5e-3;
	out.Vt = 1;
	out.alpha = 1.3;
	out.Tox = 3.9;
	out.W = 65;

	for(; args[0] != NULL; args++)
	{
		if(strcmp(args[0], "--show-stats") == 0)
		{
			args++;
			
			if(strcmp(args[0], "--stdout") == 0)
			{
				out.showStatsOut = true;
			}
			else if(strcmp(args[0], "--stderr") == 0)
			{
				out.showStatsErr = true;
			}
			else
			{
				out.showStatsFile = args[0];
			}
			continue;
		}

		if(strcmp(args[0], "-W") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.W;
			continue;
		}
		if(strcmp(args[0], "--Tox") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.Tox;
			continue;
		}
		if(strcmp(args[0], "--alpha") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.alpha;
			continue;
		}
		if(strcmp(args[0], "--Vt") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.Vt;
			continue;
		}
		if(strcmp(args[0], "--Vtheta") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.Vtheta;
			continue;
		}
		if(strcmp(args[0], "-n") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.n;
			continue;
		}
		if(strcmp(args[0], "--K2") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.K2;
			continue;
		}
		if(strcmp(args[0], "--K1") == 0)
		{
			args++;
			stringstream str(args[0]);
			str >> out.K1;
			continue;
		}

		// Argument was no valid, breaking
		break;
	}

	return out;
}

const PowerReport
pelib_evaluate(const Schedule &schedule, size_t argc, char **argv, map<string, double> &statistics)
{
	args_t args = parse(argv);

	// Compute a schedule
	KimEtAlPowerModel kimetal(args.K1, args.K2, args.n, args.Vtheta, args.Vt, args.alpha, args.Tox, args.W);
	PowerReport report = kimetal.evaluate(schedule);
	return report;
}

string
pelib_description(size_t argc, char **argv)
{
	args_t args = parse(argv);
	stringstream ss;
	ss << "Kim Et. Al. (K1=" << args.K1 << ", K2=" << args.K2 << ", n=" << args.n << ", Vtheta=" << args.Vtheta << ", Vt=" << args.Vt << ", alpha=" << args.alpha << ", Tox=" << args.Tox << ", W=" << args.W << endl;
	return string(ss.str());
}

#ifdef __cplusplus
}
#endif

