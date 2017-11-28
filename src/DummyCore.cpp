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


#include <pelib/DummyCore.hpp>

using namespace std;

namespace pelib
{
	DummyCore::DummyCore(const std::set<unsigned int> &f, float unit, const std::map<unsigned int, Core::MemorySize> &pm) : Core(pm)
	{
		this->frequencies = set<unsigned int>(f);
		this->frequencyUnit = unit;
	}

	DummyCore::DummyCore(const DummyCore* src): Core(src->getPrivateMemories())
	{
		this->frequencies = set<unsigned int>(src->getFrequencies());
		this->frequencyUnit = src->getFrequencyUnit();
	}

	DummyCore::DummyCore(const DummyCore &src): Core(src.getPrivateMemories())
	{
		this->frequencies = set<unsigned int>(src.getFrequencies());
		this->frequencyUnit = src.getFrequencyUnit();
	}

	DummyCore::~DummyCore()
	{
		// Do nothing
	}

	Core*
	DummyCore::clone() const
	{
		return new DummyCore(this);
	}

	const set<unsigned int>&
	DummyCore::getFrequencies() const
	{
		return this->frequencies;
	}

	unsigned int
	DummyCore::getFrequencyUnit() const
	{
		return this->frequencyUnit;
	}
}
