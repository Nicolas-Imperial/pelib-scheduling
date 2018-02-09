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

#include <pelib/RecordOutput.hpp>

#ifndef PELIB_POWER_REPORT_OUTPUT
#define PELIB_POWER_REPORT_OUTPUT

namespace pelib
{
	/** Ancestor class for all outputer of pelib::taskgraph **/
	class PowerReportOutput : public RecordOutput
	{
		public:	
			/** Returns a pointer to a copy of the class instance **/
			virtual PowerReportOutput* clone() const = 0;

			/** Writes a pelib::PowerReport instance into output stream
				@param os Output stream to write PowerReport
				@param data Instance of pelib::PowerReport to be written
				@param arch Allows PowerReportOut concrete implementation to write only information useful for this platform
			**/
			virtual	void dump(std::ostream &os, const PowerReport &data) const = 0;

		protected:
		private:		
	};
}

#endif
