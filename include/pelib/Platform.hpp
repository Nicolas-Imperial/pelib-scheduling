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

#include <typeinfo>
#include <set>

#include <pelib/Core.hpp>
#include <pelib/Algebra.hpp>
#include <pelib/AmplInputDataParser.hpp>
#include <pelib/AmplInputDataOutput.hpp>
#include <pelib/AmplOutputDataParser.hpp>
#include <pelib/AmplOutputDataOutput.hpp>

#ifndef PELIB_PLATFORM
#define PELIB_PLATFORM

#define debug(var) std::cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << (var) << "\"" << std::endl;

namespace pelib
{
	/** Models an execution platform **/
	class Platform: public Record
	{
		public:
			typedef std::set<const Core*, Core::LessCorePtrByCoreId> island;
			struct LessIslandByFirstCoreId 
			{
				bool operator() (const island &x, const island &y) const
				{
					for(island::const_iterator xx = x.begin(), yy = y.begin(); xx != x.end() && yy != y.end(); xx++, yy++)
					{
						if(*xx == *yy)
						{
							continue;
						}
						else
						{
							return **xx < **yy;
						}
					}

					return x.size() < y.size();
				}
			};
			typedef std::set<island, LessIslandByFirstCoreId> islands;

			static std::vector<AmplInputDataParser*> AmplInputParsers();
			static std::vector<AmplInputDataOutput*> AmplInputOutputs();
			static std::pair<std::vector<AmplInputDataParser*>, std::vector<AmplInputDataOutput*> > AmplInputHandlers();

			static std::vector<AmplOutputDataParser*> AmplOutputParsers();
			static std::vector<AmplOutputDataOutput*> AmplOutputOutputs();
			static std::pair<std::vector<AmplOutputDataParser*>, std::vector<AmplOutputDataOutput*> > AmplOutputHandlers();
			static const std::map<std::string, const std::type_info&> &getAmplParsingDirectives();

			/** Internal type of a platform core island **/

			/** Constructor **/
			Platform();

			/** Constructor
				@param p Number of cores in this platform. Each core is its own shared memory, main memory, private memory, voltage and frequency island
				@param ref Pointer to an instance of pelib::Core duplicated p times and stored in the Platform instance being build
			**/
			Platform(size_t p, const Core* ref);

			/** Constructor
				@param cores Collection of derivative instances of pelib::Core that model all execution cores in the platform. Each core is its own shared memory, main memory, private memory, voltage and frequency island
			**/
			Platform(const island &cores);

			/** Constructor
				@param cores Collection of derivative instances of pelib::Core that model all execution cores in the platform. Each core is its own shared memory, main memory, private memory, voltage and frequency island
				@param shared On-chip shared memory islands
				@param main Off-chip shared memory islands
				@param priv Off-chip Private memory islands
				@param voltage Voltage scaling islands
				@param freq Frequency scaling islands
			**/
			Platform(const island& cores, const islands &shared, const islands &main, const islands &priv, const islands &voltage, const islands &freq, const std::map<std::pair<island, unsigned int>, Core::MemorySize> &sm, const std::map<unsigned int, Core::MemorySize> &dm, const Core::MemorySize &syncSize, const Core::MemorySize &pmcpbs, const Core::MemorySize &pmccbs, const Core::MemorySize &smcppbs, const Core::MemorySize &smcpsbs, const Core::MemorySize &smccpbs, const Core::MemorySize &smccsbs, const Core::MemorySize &dmcppbs, const Core::MemorySize &dmcpdbs, const Core::MemorySize &dmccpbs, const Core::MemorySize &dmccdbs);

			/** Copy constructor **/
			Platform(const Platform *arch);

			/** Copy constructor **/
			Platform(const Platform &arch);

			/** Constructor
				@param arch Algebraic representation of a platform: Scalar p is the number of cores, set F is the set of frequency each core can run at. Each core is its own shared memory, main memory, private memory, voltage and frequency island
			**/
			Platform(const Algebra &arch);

			/** Returns a pointer to a copy of this platform **/
			virtual Platform* clone() const;

			/** Returns all cores in the platform **/
			virtual const island& getCores() const;

			/** Returns true if all cores are identical and false otherwise **/
			virtual bool isHomogeneous() const;

			/** Returns all shared memory islands **/
			virtual const islands& getSharedMemoryIslands() const;

			/** Returns the shared memory island corresponding to the core_id-th core of the platform, starting with 1 **/
			virtual const islands sharedMemoryIslands(size_t core_id) const;

			/** Returns the shared memory islands a set of cores belongs to
				@param islands Set of core id the shared memory islands' are requested
			**/
			virtual const islands sharedMemoryIslands(const std::set<int>& islands) const;
			/** Returns the core ids contained in a shared memory island
				@param islands Shared memory islands that contains the cores to be returned
			**/
			virtual const std::set<unsigned int> sharedMemoryIslands(const islands& isls) const;
			/** Returns all main memory islands **/
			//virtual const islands& getMainMemoryIslands() const;
			/** Returns the main memory island corresponding to the core_id-th core of the platform, starting with 1 **/
			//virtual const islands mainMemoryIslands(size_t core_id) const;
			/** Returns all private memory islands **/
			//virtual const islands& getPrivateMemoryIslands() const;
			/** Returns the private memory island corresponding to the core_id-th core of the platform, starting with 1 **/
			//virtual const islands privateMemoryIslands(size_t core_id) const;
			/** Returns all voltage memory islands **/
			virtual const islands& getVoltageIslands() const;
			/** Returns the voltage memory island corresponding to the core_id-th core of the platform, starting with 1 **/
			virtual const island& getVoltageIsland(size_t core_id) const;
			/** Returns all frequency memory islands **/
			virtual const islands& getFrequencyIslands() const;
			/** Returns the frequency memory island corresponding to the core_id-th core of the platform, starting with 1 **/
			virtual const island& getFrequencyIsland(size_t core_id) const;

			/** Returns the core id in the platform that corresponds to a pointer to core; throws a CastException if the core doesn't belong to this plaform **/
			virtual size_t getCoreId(const Core*) const;

			/** Builds an algebraic representation of this platform: p is the number of cores and F is the set of frequency they can run at **/
			virtual Algebra buildAlgebra() const;

			const std::map<std::pair<island, unsigned int>, Core::MemorySize>&
			getSharedMemories() const;

			const std::map<unsigned int, Core::MemorySize>&
			getDistributedMemories() const;

			const Core::MemorySize&
			getSyncSize() const;

			const Core::MemorySize&
			getPrivMemTaskCost() const;
			const Core::MemorySize&
			getPrivMemChanCost() const;
			const Core::MemorySize&
			getSharedMemTaskCost() const;
			const Core::MemorySize&
			getSharedMemChanCost() const;
			const Core::MemorySize&
			getDistMemTaskCost() const;
			const Core::MemorySize&
			getDistMemChanCost() const;
			/** Memory size in bytes necessary on the producer side of a channel alloted in private memory **/
			const Core::MemorySize&
			getPrivMemChanProdBuffSize() const;

			/** Memory size in bytes necessary on the consumer side of a channel alloted in private memory **/
			const Core::MemorySize&
			getPrivMemChanConsBuffSize() const;

			/** Private Memory size in bytes necessary on the producer side of a channel alloted in shared memory **/
			const Core::MemorySize&
			getSharedMemChanProdPrivBuffSize() const;

			/** Shared Memory size in bytes necessary on the producer side of a channel alloted in shared memory **/
			const Core::MemorySize&
			getSharedMemChanProdSharedBuffSize() const;

			/** Private Memory size in bytes necessary on the consumer side of a channel alloted in shared memory **/
			const Core::MemorySize&
			getSharedMemChanConsPrivBuffSize() const;

			/** Shared Memory size in bytes necessary on the consumer side of a channel alloted in shared memory **/
			const Core::MemorySize&
			getSharedMemChanConsSharedBuffSize() const;

			/** Private Memory size in bytes necessary on the producer side of a channel alloted in distributed memory **/
			const Core::MemorySize&
			getDistMemChanProdPrivBuffSize() const;

			/** Distributed Memory size in bytes necessary on the producer side of a channel alloted in distributed memory **/
			const Core::MemorySize&
			getDistMemChanProdDistBuffSize() const;

			/** Private Memory size in bytes necessary on the consumer side of a channel alloted in distributed memory **/
			const Core::MemorySize&
			getDistMemChanConsPrivBuffSize() const;

			/** Distributed Memory size in bytes necessary on the consumer side of a channel alloted in distributed memory **/
			const Core::MemorySize&
			getDistMemChanConsDistBuffSize() const;

			/** Destructor **/
			virtual	~Platform();
			virtual Platform&
			operator=(const Platform& copy);

			void
			check() const;
		protected:
			/** Collection of cores **/
			island cores;
			/** Islands **/
			//islands shared, main, priv, voltage, freq; // Why are private and main memory islands necessary?
			islands shared, voltage, freq;
			std::map<std::pair<island, unsigned int>, Core::MemorySize> sharedMemorySize; // (island,level) -> size for shared memory
			std::map<unsigned int, Core::MemorySize> distributedMemorySize; // level -> size for distributed memory
		private:		
			void copy(const Platform *pt);
			static std::map<std::string, const std::type_info&> amplDirectives;
			Core::MemorySize syncSize, pmcpbs, pmccbs, smcppbs, smcpsbs, smccpbs, smccsbs, dmcppbs, dmcpdbs, dmccpbs, dmccdbs;
	};
}

#undef debug

#endif
