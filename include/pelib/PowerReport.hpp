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

#include <map>

#include <pelib/ExecutionMode.hpp>
#include <pelib/Algebra.hpp>

#ifndef PELIB_POWER_REPORT
#define PELIB_POWER_REPORT

namespace pelib
{
	class PowerReport: public Record
	{
		public:
			enum Power { oxide, subthreshold, dynamic}; // overall = oxide + subthreshold + dynamic, i.e., all sets are disjoint 
			PowerReport(const std::map<const ExecutionMode*, std::map<Power, std::map<float, float> > >&);
			PowerReport(float energy);
			virtual ~PowerReport();

			virtual PowerReport* clone() const;

			Algebra buildAlgebra() const;
			float overallEnergy() const;
		protected:
		private:
			std::map<const ExecutionMode*, std::map<Power, std::map<float, float> > > curves; // For each mode, one curve for static power as a function of time, and another for dynamic power
	};
}

#endif

