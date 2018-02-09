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

#include <pelib/Matrix.hpp>
#include <pelib/BusyMode.hpp>
#include <pelib/PowerReport.hpp>

#ifdef debug
#undef debug
#endif

#define debug(expr) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #expr << " = \"" << (expr) << "\"." << endl;

using namespace std;

namespace pelib
{
	PowerReport::PowerReport(const std::map<const ExecutionMode*, std::map<Power, std::map<float, float> > > &curves): curves(curves)
	{
		// Do nothing else
	}

	PowerReport::PowerReport(float energy)
	{
		// Create an overly simplified power curve but whose overall energy matched
		// the one given as argument
		map<float, float> curve;
		curve.insert(pair<float, float>(0, energy));
		curve.insert(pair<float, float>(1, energy));
		map<Power, map<float, float> > overall;
		overall.insert(pair<Power, map<float, float> >(Power::dynamic, curve));
		curves.insert(pair<const ExecutionMode*, map<Power, map<float, float> > >(new BusyMode(1), overall));
	}

	PowerReport*
	PowerReport::clone() const
	{
		return new PowerReport(this->curves);
	}

	float
	PowerReport::overallEnergy() const
	{
		// Integrate all power curves with linear interpolation
		float energy = 0;
		for(const pair<const ExecutionMode*, map<Power, map<float, float> > > &mode: this->curves)
		{
			for(const pair<Power, map<float, float> > &curve: mode.second)
			{	
				// previous point starts at (0,0)
				// Should be OK, provided first power point in curve begins
				// at time = 0
				float time = 0;
				float power = 0;
				for(const pair<float, float> &point: curve.second)
				{
					float period = point.first - time;

					// This is for the rectangle part
					float energy_section = period * power;
					energy_section += (point.second - power) * period / 2;
					energy += energy_section;
				
					// Update time
					time = point.first;
					power = point.second;
				}
			}
		}

		return energy;
	}

	Algebra
	PowerReport::buildAlgebra() const
	{
		typedef std::map<int, float> RowType;
		typedef std::map<int, RowType> MatrixType;

		RowType xs, ys; 
		xs[0] = 0;
		xs[1] = 1;
		ys[0] = this->overallEnergy();
		ys[1] = ys[0];

		MatrixType matrix;
		matrix[0] = xs; 
		matrix[1] = ys; 

		Matrix<int, int, float> energy("time__power", matrix);
		Matrix<int, int, float> energy_transposed = energy.transpose();
		Algebra out;
		out.insert(energy_transposed.clone());
		return out;
	}

	PowerReport::~PowerReport()
	{
		// do nothing
	}
}

