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

#include <iostream>
#include <cstdlib>
#include <fstream>
#include <string>
#include <boost/regex.hpp>
#include <iomanip>

#include <pelib/Scalar.hpp>

#include <pelib/AmplInput.hpp>
#include <pelib/AmplOutput.hpp>

#include <pelib/DummyCore.hpp>
#include <pelib/GraphML.hpp>
#include <pelib/Platform.hpp>
#include <pelib/XMLSchedule.hpp>

#include <pelib/AmplInputData.hpp>
#include <pelib/AmplInputScalar.hpp>
#include <pelib/AmplInputVector.hpp>
#include <pelib/AmplInputMatrix.hpp>

#include <pelib/AmplOutputScalar.hpp>
#include <pelib/AmplOutputVector.hpp>
#include <pelib/AmplOutputMatrix.hpp>

#include <pelib/Scalar.hpp>
#include <pelib/Set.hpp>
#include <pelib/Vector.hpp>
#include <pelib/Matrix.hpp>

#include <pelib/unit.h>

#ifndef debug
#if 0
#define debug(var) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << var << "\"" << endl;
#else
#define debug(var)
#endif
#endif

using namespace pelib;
using namespace std;

static AmplInput input(AmplInput::intFloatHandlers());

extern char _binary_platform_dat_start;
extern size_t _binary_platform_dat_size;
std::string string_platform_amplinput;
std::istringstream istream_platform_amplinput;

Platform pt;

void
setup()
{
	std::cout << std::setprecision(6)
 		<< std::setiosflags(std::ios::fixed)
		<< std::setiosflags(std::ios::showpoint);
}

void
init()
{
	string_platform_amplinput = std::string(&_binary_platform_dat_start).substr(0, (size_t)(&_binary_platform_dat_size));
	istream_platform_amplinput.clear();
	istream_platform_amplinput.str(string_platform_amplinput);
	Algebra ampl_arch = AmplInput(AmplInput::floatHandlers()).parse(istream_platform_amplinput);
	pt = Platform(ampl_arch);
}

void
teardown()
{
  // Do not forget to free your stacks after each test
  // to avoid memory leaks as now
}

void
cleanup()
{
  // Destroy properly your test batch
}

void
copy()
{
	Platform pt2;
	pt2 = pt;
	assert(true);
}

void
run()
{
	test(copy);
}

