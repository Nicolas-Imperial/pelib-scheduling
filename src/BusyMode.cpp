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

#include <pelib/PelibException.hpp>
#include <pelib/BusyMode.hpp>

#ifdef debug
#undef debug
#endif

#define debug(expr) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #expr << " = \"" << (expr) << "\"." << endl;

using namespace std;

namespace pelib
{
	BusyMode::BusyMode(float rate): rate(rate)
	{
		if(rate < 0 || rate > 1)
		{
			stringstream ss;
			ss << "Transistor utilization rate (" << rate << ") is outside the valid range [0,1]";
			throw PelibException(ss.str());
		}
		// do nothing else
	}

	float
	BusyMode::getRate()
	{
		return this->rate;
	}
}



