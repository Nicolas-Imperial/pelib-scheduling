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

#include <pelib/KimEtAlPowerModel.hpp>

#ifdef debug
#undef debug
#endif

#define debug(expr) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #expr << " = \"" << (expr) << "\"." << endl;

using namespace std;

namespace pelib
{
	KimEtAlPowerModel::KimEtAlPowerModel(float K1, float K2, float n, float Vtheta, float Vt, float alpha, float Tox, float W): K1(K1), K2(K2), n(n), Vtheta(Vtheta), Vt(Vt), alpha(alpha), Tox(Tox), W(W)
	{
		// Do nothing else
	}

	PowerReport
	KimEtAlPowerModel::evaluate(const Schedule &schedule)
	{
		return PowerReport(3);
		// do nothing
	}
}

