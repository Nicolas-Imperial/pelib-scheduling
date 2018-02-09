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
#include <pelib/Scheduler.hpp>

#ifndef PELIB_SEQUENTIAL
#define PELIB_SEQUENTIAL 1
namespace pelib
{
	class Sequential : public Scheduler
	{
		public:
			typedef struct
			{
				float frequency;
				unsigned int position;
			} RunTask;
			virtual const Record* solve() const;
			virtual const Record* solve(std::map<const std::string, double> &statistics) const;
			virtual Schedule schedule(const Taskgraph &tg, const Platform &pt, std::map<const std::string, double> &statistics) const;
			virtual Schedule schedule(const Taskgraph &tg, const Platform &pt, const map<ExecTask, set<RunTask>> &directives, std::map<const std::string, double> &statistics) const;
			~Sequential();

			virtual std::string getShortDescription() const;
		protected:
		private:
	};
}

#endif

