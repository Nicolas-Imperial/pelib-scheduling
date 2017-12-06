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


#include <set>

#include <pelib/Memory.hpp>
#include <pelib/ScheduleLinkAllocator.hpp>

#ifndef PELIB_UNIFORM_ALLOCATOR
#define PELIB_UNIFORM_ALLOCATOR

namespace pelib
{	
	/** Schedule of a streaming application **/
	class UniformLinkAllocator : public ScheduleLinkAllocator
	{
		public:
			UniformLinkAllocator(const std::map<Memory::Feature, unsigned int> &levels = {});
			virtual ~UniformLinkAllocator();
			virtual std::set<AllotedLink> allocate(const Schedule &schedule) const;

			const std::map<Memory::Feature, unsigned int>&
			getLevelDirectives() const;
		protected:
			std::map<Memory::Feature, unsigned int> levels;
			
		private:
	};
}

#endif
