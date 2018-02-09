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

#include <pelib/Sequential.hpp>

namespace pelib
{
	Sequential::~Sequential()
	{
		// Do nothing
	}

	const Record*
	Sequential::solve() const
	{
		return NULL;
	}

	const Record* Sequential::solve(std::map<const std::string, double> &statistics) const
	{
		return NULL;
	}

	Schedule
	Sequential::schedule(const Taskgraph &tg, const Platform &pt, std::map<const std::string, double> &statistics) const
	{
		float maxFreq = *(*pt.getCores().begin())->getFrequencies().rbegin();
		float time = 0;
		set<ExecTask> schedule;
		for(set<Task>::const_iterator i = tg.getTasks().begin(); i != tg.getTasks().end(); i++)
		{
			ExecTask eTask(*i, set<const AllotedLink*>(), maxFreq, 1, time, 1, 0, Memory::nullMemory());
			time += i->runtime(1, maxFreq);
			schedule.insert(eTask);
		}

		Schedule::Table sched;
		sched.insert(pair<unsigned int, set<ExecTask>>(0, schedule));
		return Schedule("Sequential", tg.getName(), sched, set<AllotedLink>(), tg, pt);
	}

	Schedule
	Sequential::schedule(const Taskgraph &tg, const Platform &pt, const map<ExecTask, set<RunTask>> &directives, std::map<const std::string, double> &statistics) const
	{
		set<ExecTask> schedule;

		for(pair<ExecTask, set<Sequential::RunTask>> i: directives)
		{
		}
	}

	std::string
	Sequential::getShortDescription() const
	{
		return string("Seq.");
	}
}
