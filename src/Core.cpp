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


#include <pelib/Core.hpp>

#define debug(var) std::cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << (var) << "\"" << std::endl;
using namespace std;

namespace pelib
{
	//std::set<const Core*> Core::freed;
	Core::Core()
	{
	/*
		if(freed.find(this) != freed.end())
		{
			freed.erase(freed.find(this));
		}
	*/
	}	

	Core::Core(const std::map<unsigned int, Core::MemorySize> &pm) : privateMemorySize(pm)
	{
	/*
		if(freed.find(this) != freed.end())
		{
			freed.erase(freed.find(this));
		}
*/
	}

	Core::~Core()
	{
		//Core::freed.insert(this);
		// Do nothing
	}

	bool
	Core::operator<(const Core &other) const
	{
		return (size_t)this < (size_t)&other;
	}

	const std::map<unsigned int, Core::MemorySize>&
	Core::getPrivateMemories() const
	{
		return this->privateMemorySize;
	}

	bool
	Core::operator==(const Core &other) const
	{
		return (size_t)this == (size_t)&other;
	}
}
