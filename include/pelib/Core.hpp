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
#include <stddef.h>
#include <set>
#include <map>

#ifndef PELIB_CORE
#define PELIB_CORE

#define debug(var) std::cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << (var) << "\"" << std::endl;
namespace pelib
{
	/** Models a processor Core **/
	class Core
	{
		public:
			typedef unsigned long long int MemorySize;

			struct LessCorePtrByCoreId 
			{
				bool operator() (const Core *x, const Core *y) const
				{
					return (size_t)x < (size_t)y;
				}
			};

			/** Constructor **/
			Core();

			Core(const std::map<unsigned int, MemorySize> &pm);

			/** Returns a pointer to a copy of this Core **/
			virtual Core* clone() const = 0;
			/** Destructor **/
			virtual ~Core();
			/** Returns the set of frequencies admissible by this core **/
			virtual const std::set<unsigned int>& getFrequencies() const = 0;
			/** Returns the frequency multiplier of the frequency set to obtain frequencies in Hertz **/
			virtual unsigned int getFrequencyUnit() const = 0;

			const std::map<unsigned int, Core::MemorySize>&
			getPrivateMemories() const;

			virtual bool
			operator<(const Core &other) const;
	    		virtual bool
			operator==(const Core &other) const;

			//static std::set<const Core*> freed;
		protected:
			//static size_t counter;
			unsigned int frequencyUnit;
			std::map<unsigned int, MemorySize> privateMemorySize; // level -> size association for a core's private memory
		private:
	};
}
#undef debug
#endif
