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

#include <pelib/Platform.hpp>
#include <pelib/Core.hpp>
#include <pelib/DummyCore.hpp>

#include <pelib/Scalar.hpp>
#include <pelib/Vector.hpp>
#include <pelib/Matrix.hpp>
#include <pelib/Set.hpp>
#include <pelib/ParseException.hpp>
#include <pelib/CastException.hpp>
#include <pelib/AmplInputScalar.hpp>
#include <pelib/AmplInputVector.hpp>
#include <pelib/AmplInputMatrix.hpp>
#include <pelib/AmplInputSet.hpp>
#include <pelib/AmplOutputScalar.hpp>
#include <pelib/AmplOutputVector.hpp>
#include <pelib/AmplOutputMatrix.hpp>
#include <pelib/AmplOutputSet.hpp>

#define debug(var) std::cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #var << " = \"" << (var) << "\"" << std::endl;

using namespace std;

namespace pelib
{
#if 1
	void
	Platform::check() const
	{
		for(const Platform::island &isl: this->getSharedMemoryIslands())
		{
			for(const Core *ptr: isl)
			{
				/*
				if(Core::freed.find(ptr) != Core::freed.end())
				{
					throw PelibException("Pointer to freed core");
				}
				*/
				if(this->getCores().find(ptr) == this->getCores().end())
				{
					throw PelibException("Shared memory island made of cores outside platform");
				}
			}
		}
	}
#endif

	Platform::Platform()
	{
		set<unsigned int> f;
		f.insert(1);
		Core *core = new DummyCore(f, 1, map<unsigned int, Core::MemorySize>());
		this->cores.insert(core);
		island isl;
		isl.insert(core);
		//main.insert(island(isl));
		shared.insert(island(isl));
		//priv.insert(island(isl));
		voltage.insert(island(isl));
		freq.insert(island(isl));
		syncSize = 0;
		pmcpbs = 0;
		pmccbs = 0;
		smcppbs = 0;
		smcpsbs = 0;
		smccpbs = 0;
		smccsbs = 0;
		dmcppbs = 0;
		dmcpdbs = 0;
		dmccpbs = 0;
		dmccdbs = 0;
		this->check();
	}

	const Core::MemorySize&
	Platform::getSyncSize() const
	{
		return this->syncSize;
	}

	/** Memory size in bytes necessary on the producer side of a channel alloted in private memory **/
	const Core::MemorySize&
	Platform::getPrivMemChanProdBuffSize() const
	{
		return pmcpbs;
	}

	/** Memory size in bytes necessary on the consumer side of a channel alloted in private memory **/
	const Core::MemorySize&
	Platform::getPrivMemChanConsBuffSize() const
	{
		return pmccbs;
	}

	/** Private Memory size in bytes necessary on the producer side of a channel alloted in shared memory **/
	const Core::MemorySize&
	Platform::getSharedMemChanProdPrivBuffSize() const
	{
		return smcppbs;
	}

	/** Shared Memory size in bytes necessary on the producer side of a channel alloted in shared memory **/
	const Core::MemorySize&
	Platform::getSharedMemChanProdSharedBuffSize() const
	{
		return smcpsbs;
	}

	/** Private Memory size in bytes necessary on the consumer side of a channel alloted in shared memory **/
	const Core::MemorySize&
	Platform::getSharedMemChanConsPrivBuffSize() const
	{
		return smccpbs;
	}

	/** Shared Memory size in bytes necessary on the consumer side of a channel alloted in shared memory **/
	const Core::MemorySize&
	Platform::getSharedMemChanConsSharedBuffSize() const
	{
		return smccsbs;
	}

	/** Private Memory size in bytes necessary on the producer side of a channel alloted in distributed memory **/
	const Core::MemorySize&
	Platform::getDistMemChanProdPrivBuffSize() const
	{
		return dmcppbs;
	}

	/** Distributed Memory size in bytes necessary on the producer side of a channel alloted in distributed memory **/
	const Core::MemorySize&
	Platform::getDistMemChanProdDistBuffSize() const
	{
		return dmcpdbs;
	}

	/** Private Memory size in bytes necessary on the consumer side of a channel alloted in distributed memory **/
	const Core::MemorySize&
	Platform::getDistMemChanConsPrivBuffSize() const
	{
		return dmccpbs;
	}

	/** Distributed Memory size in bytes necessary on the consumer side of a channel alloted in distributed memory **/
	const Core::MemorySize&
	Platform::getDistMemChanConsDistBuffSize() const
	{
		return dmccdbs;
	}

	Platform::Platform(const island &cores)
	{
		//set<const Core*> shared;
		for(set<const Core*>::const_iterator i = cores.begin(); i != cores.end(); i++)
		{
			Core *core = (*i)->clone();
			pair<set<const Core*>::const_iterator, bool> res = this->cores.insert(core);
			
			island isl;
			isl.insert(*res.first);
			//shared.insert(core);

			// Each core is its own Platform::island of anything
			this->shared.insert(island(isl));
			//this->main.insert(island(isl));
			//this->priv.insert(island(isl));
			this->voltage.insert(island(isl));
			this->freq.insert(island(isl));
		}
		syncSize = 0;
		pmcpbs = 0;
		pmccbs = 0;
		smcppbs = 0;
		smcpsbs = 0;
		smccpbs = 0;
		smccsbs = 0;
		dmcppbs = 0;
		dmcpdbs = 0;
		dmccpbs = 0;
		dmccdbs = 0;
		this->check();
	}
	
	static
	Platform::island
	buildIsland(const Platform::island &inRef, const Platform::island &ref, const Platform::island src)
	{
		Platform::island out;
		for(const Core *core: src)
		{
			Platform::island::const_iterator search_core = ref.find(core);
			if(ref.find(core) == ref.end())
			{
				throw PelibException("Trying to insert an island composed of cores not part of platform"); 
			}
			size_t id = std::distance(ref.begin(), search_core);
			Platform::island::const_iterator c = inRef.begin();
			std::advance(c, id);
			out.insert(*c);
		}

		return out;
	}
	static
	Platform::islands
	buildIslands(const Platform::island &inRef, const Platform::island &ref, const Platform::islands src)
	{
		Platform::islands out;
		for(const Platform::island &isl: src)
		{
			out.insert(buildIsland(inRef, ref, isl));
		}
	
		return out;	
	}

	Platform::Platform(const island& cores, const islands &shared, const islands &main, const islands &priv, const islands &voltage, const islands &freq, const std::map<std::pair<island, unsigned int>, Core::MemorySize> &sm, const std::map<unsigned int, Core::MemorySize> &dm, const Core::MemorySize &syncSize, const Core::MemorySize &pmcpbs, const Core::MemorySize &pmccbs, const Core::MemorySize &smcppbs, const Core::MemorySize &smcpsbs, const Core::MemorySize &smccpbs, const Core::MemorySize &smccsbs, const Core::MemorySize &dmcppbs, const Core::MemorySize &dmcpdbs, const Core::MemorySize &dmccpbs, const Core::MemorySize &dmccdbs)
	{
		this->cores.clear();
		for(const Core *core: cores)
		{
			this->cores.insert(core->clone());
		}
		this->shared = buildIslands(this->cores, cores, shared);
		this->voltage = buildIslands(this->cores, cores, voltage);
		this->freq = buildIslands(this->cores, cores, freq);

		for(const pair<pair<Platform::island, unsigned int>, Core::MemorySize> &i: sm)
		{
			Platform::island isl = buildIsland(this->cores, cores, i.first.first);
			unsigned int level = i.first.second;

			this->sharedMemorySize.insert(pair<pair<Platform::island, unsigned int>, Core::MemorySize>(pair<Platform::island, unsigned int>(isl, level), i.second));
		}
		this->distributedMemorySize = dm;
		this->syncSize = syncSize;
		this->pmcpbs = pmcpbs;
		this->pmccbs = pmccbs;
		this->smcppbs = smcppbs;
		this->smcpsbs = smcpsbs;
		this->smccpbs = smccpbs;
		this->smccsbs = smccsbs;
		this->dmcppbs = dmcppbs;
		this->dmcpdbs = dmcpdbs;
		this->dmccpbs = dmccpbs;
		this->dmccdbs = dmccdbs;
		this->check();
	}

	Platform::Platform(size_t p, const Core* ref)
	{
		//set<const Core*> shared;
		for(size_t i = 0; i < p; i++)
		{
			Core *core = ref->clone();
			this->cores.insert(core);
			island isl;
			isl.insert(core);
			//shared.insert(core);

			// Each core is its own Platform::island of anything
			this->shared.insert(island(isl));
			//this->main.insert(island(isl));
			//this->priv.insert(island(isl));
			this->voltage.insert(island(isl));
			this->freq.insert(island(isl));
		}
		//this->shared.insert(shared);
		this->syncSize = 0;
		pmcpbs = 0;
		pmccbs = 0;
		smcppbs = 0;
		smcpsbs = 0;
		smccpbs = 0;
		smccsbs = 0;
		dmcppbs = 0;
		dmcpdbs = 0;
		dmccpbs = 0;
		dmccdbs = 0;
		this->check();
	}

	void
	Platform::copy(const Platform *arch)
	{
		// Allocate new Color
		this->syncSize = arch->getSyncSize();
		this->pmcpbs = arch->getPrivMemChanProdBuffSize();
		this->pmccbs = arch->getPrivMemChanConsBuffSize();
		this->smcppbs = arch->getSharedMemChanProdPrivBuffSize();
		this->smcpsbs = arch->getSharedMemChanProdSharedBuffSize();
		this->smccpbs = arch->getSharedMemChanConsPrivBuffSize();
		this->smccsbs = arch->getSharedMemChanConsSharedBuffSize();
		this->dmcppbs = arch->getDistMemChanProdPrivBuffSize();
		this->dmcpdbs = arch->getDistMemChanProdDistBuffSize();
		this->dmccpbs = arch->getDistMemChanConsPrivBuffSize();
		this->dmccdbs = arch->getDistMemChanConsDistBuffSize();

		this->cores.clear();
		for(const Core *core: arch->getCores())
		{
			this->cores.insert(core->clone());
		}
		this->shared = buildIslands(this->cores, arch->getCores(), arch->getSharedMemoryIslands());
		this->voltage = buildIslands(this->cores, arch->getCores(), arch->getVoltageIslands());
		this->freq = buildIslands(this->cores, arch->getCores(), arch->getFrequencyIslands());

		arch->check();
		for(const pair<pair<Platform::island, unsigned int>, Core::MemorySize> &i: arch->getSharedMemories())
		{
			Platform::island isl = buildIsland(this->cores, arch->getCores(), i.first.first);
			unsigned int level = i.first.second;

			this->sharedMemorySize.insert(pair<pair<Platform::island, unsigned int>, Core::MemorySize>(pair<Platform::island, unsigned int>(isl, level), i.second));
		}
		this->distributedMemorySize = arch->getDistributedMemories();


#if 0
		Platform::island stuff = arch->getCores();
		this->cores.clear();
		for(island::const_iterator i = arch->getCores().begin(); i != arch->getCores().end(); i++)
		{
			Core *cpy = (*i)->clone();
			this->cores.insert(cpy);
		}

		this->shared.clear();
		//this->main.clear();
		//this->priv.clear();
		this->voltage.clear();
		this->freq.clear();

		for(islands::const_iterator i = arch->getSharedMemoryIslands().begin(); i != arch->getSharedMemoryIslands().end(); i++)
		{
			island isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				set<const Core*>::const_iterator search_core = this->getCores().begin();
				std::advance(search_core, arch->getCoreId(*arch->getCores().find(*j)) - 1);
				const Core *core_ptr = *search_core;
				isl.insert(core_ptr);
			}

			this->shared.insert(isl);
		}

		/*
		for(islands::const_iterator i = arch->getMainMemoryIslands().begin(); i != arch->getMainMemoryIslands().end(); i++)
		{
			island isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				set<const Core*>::const_iterator search_core = this->getCores().begin();
				std::advance(search_core, arch->getCoreId(*arch->getCores().find(*j)) - 1);
				const Core *core_ptr = *search_core;
				isl.insert(core_ptr);
			}

			this->main.insert(isl);
		}

		for(islands::const_iterator i = arch->getPrivateMemoryIslands().begin(); i != arch->getPrivateMemoryIslands().end(); i++)
		{
			island isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				set<const Core*>::const_iterator search_core = this->getCores().begin();
				std::advance(search_core, arch->getCoreId(*arch->getCores().find(*j)) - 1);
				const Core *core_ptr = *search_core;
				isl.insert(core_ptr);
			}

			this->priv.insert(isl);
		}
		*/

		for(islands::const_iterator i = arch->getVoltageIslands().begin(); i != arch->getVoltageIslands().end(); i++)
		{
			island isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				set<const Core*>::const_iterator search_core = this->getCores().begin();
				std::advance(search_core, arch->getCoreId(*arch->getCores().find(*j)) - 1);
				const Core *core_ptr = *search_core;
				isl.insert(core_ptr);
			}

			this->voltage.insert(isl);
		}

		for(islands::const_iterator i = arch->getFrequencyIslands().begin(); i != arch->getFrequencyIslands().end(); i++)
		{
			island isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				set<const Core*>::const_iterator search_core = this->getCores().begin();
				std::advance(search_core, arch->getCoreId(*arch->getCores().find(*j)) - 1);
				const Core *core_ptr = *search_core;
				isl.insert(core_ptr);
			}

			this->freq.insert(isl);
		}

		this->sharedMemorySize = arch->sharedMemorySize;
		this->distributedMemorySize = arch->distributedMemorySize;
#endif

		// Now check if everything is alright
		this->check();
	}
		
	Platform::Platform(const Platform *arch)
	{
		copy(arch);
		this->check();
	}

	Platform::Platform(const Platform &pt)
	{
		copy(&pt);
		this->check();
	}

	static
	std::map<std::string, const std::type_info&>
	init_ampl_directives()
	{
		std::map<std::string, const std::type_info&> new_map;
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("p"), typeid(Scalar<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("sync"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("pmcpbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("pmccbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("smcppbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("smcpsbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("smccpbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("smccsbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("dmcppbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("dmcpdbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("dmccpbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("dmccdbs"), typeid(Scalar<unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("Fin"), typeid(Scalar<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("Funit"), typeid(Scalar<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("F"), typeid(Set<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("Fi"), typeid(Set<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("Si"), typeid(Set<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("pml"), typeid(Vector<unsigned int, unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("sml"), typeid(Vector<unsigned int, unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("dml"), typeid(Scalar<unsigned int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("pms"), typeid(Matrix<unsigned int, unsigned int, unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("sms"), typeid(Matrix<unsigned int, unsigned int, unsigned long int>)));
		new_map.insert(std::pair<std::string, const std::type_info&>(std::string("dms"), typeid(Vector<unsigned int, unsigned long int>)));
		return new_map;
	}
	map<string, const type_info&> Platform::amplDirectives = init_ampl_directives();
	Platform::Platform(const Algebra &arch)
	{
		const Scalar<unsigned int> *scalar_p = arch.find<Scalar<unsigned int> >("p");
		const Scalar<unsigned long int> *scalar_sync = arch.find<Scalar<unsigned long int> >("sync");
		const Scalar<unsigned long int> *scalar_pmcpbs = arch.find<Scalar<unsigned long int> >("pmcpbs");
		const Scalar<unsigned long int> *scalar_pmccbs = arch.find<Scalar<unsigned long int> >("pmccbs");
		const Scalar<unsigned long int> *scalar_smcppbs = arch.find<Scalar<unsigned long int> >("smcppbs");
		const Scalar<unsigned long int> *scalar_smcpsbs = arch.find<Scalar<unsigned long int> >("smcpsbs");
		const Scalar<unsigned long int> *scalar_smccpbs = arch.find<Scalar<unsigned long int> >("smccpbs");
		const Scalar<unsigned long int> *scalar_smccsbs = arch.find<Scalar<unsigned long int> >("smccsbs");
		const Scalar<unsigned long int> *scalar_dmcppbs = arch.find<Scalar<unsigned long int> >("dmcppbs");
		const Scalar<unsigned long int> *scalar_dmcpdbs = arch.find<Scalar<unsigned long int> >("dmcpdbs");
		const Scalar<unsigned long int> *scalar_dmccpbs = arch.find<Scalar<unsigned long int> >("dmccpbs");
		const Scalar<unsigned long int> *scalar_dmccdbs = arch.find<Scalar<unsigned long int> >("dmccdbs");
		const Scalar<unsigned int> *scalar_fin = arch.find<Scalar<unsigned int> >("Fin");
		//const Scalar<float> *scalar_sin = arch.find<Scalar<float> >("Sin");
		const Scalar<unsigned int> *f_unit = arch.find<Scalar<unsigned int> >("Funit");
		const Set<unsigned int> *set_F = arch.find<Set<unsigned int> >("F");
		const Set<unsigned int> *set_Fi = arch.find<Set<unsigned int> >("Fi");
		const Set<unsigned int> *set_Si = arch.find<Set<unsigned int> >("Si");
		const Vector<unsigned int, unsigned int> *vector_pml = arch.find<Vector<unsigned int, unsigned int> >("pml"); // Number of levels for private memory of each core
		const Vector<unsigned int, unsigned int> *vector_sml = arch.find<Vector<unsigned int, unsigned int> >("sml"); // Number of levels for shared memories for each island
		const Scalar<unsigned int> *scalar_dml = arch.find<Scalar<unsigned int> >("dml"); // Number of levels for distributed memory
		const Matrix<unsigned int, unsigned int, unsigned long int> *matrix_pms = arch.find<Matrix<unsigned int, unsigned int, unsigned long int> >("pms"); // Size of each private memory level of each core
		const Matrix<unsigned int, unsigned int, unsigned long int> *matrix_sms = arch.find<Matrix<unsigned int, unsigned int, unsigned long int> >("sms"); // Size of each shared memory level of each island
		const Vector<unsigned int, unsigned long int> *vector_dms = arch.find<Vector<unsigned int, unsigned long int> >("dms"); // Size of each distributed memory level

		if(scalar_p == NULL)
		{
			throw PelibException("Missing number of cores (scalar \"p\").");
		}
		if(scalar_sync == NULL)
		{
			throw PelibException("Missing synchronization size (scalar \"sync\").");
		}
		if(scalar_pmcpbs == NULL)
		{
			throw PelibException("Missing private memory channel producer buffer size (scalar \"pmcpbs\").");
		}
		if(scalar_pmccbs == NULL)
		{
			throw PelibException("Missing private memory channel consumer buffer size (scalar \"pmccbs\").");
		}
		if(scalar_smcppbs == NULL)
		{
			throw PelibException("Missing shared memory channel producer private buffer size (scalar \"smcppbs\").");
		}
		if(scalar_smcpsbs == NULL)
		{
			throw PelibException("Missing shared memory channel producer shared buffer size (scalar \"smcpsbs\").");
		}
		if(scalar_smccpbs == NULL)
		{
			throw PelibException("Missing shared memory channel consumer private buffer size (scalar \"smccpbs\").");
		}
		if(scalar_smccsbs == NULL)
		{
			throw PelibException("Missing shared memory channel consumer shared buffer size (scalar \"smccsbs\").");
		}
		if(scalar_dmcppbs == NULL)
		{
			throw PelibException("Missing distributed memory channel producer private buffer size (scalar \"smcppbs\").");
		}
		if(scalar_dmcpdbs == NULL)
		{
			throw PelibException("Missing distributed memory channel producer distributed buffer size (scalar \"smcpdbs\").");
		}
		if(scalar_dmccpbs == NULL)
		{
			throw PelibException("Missing distributed memory channel consumer private buffer size (scalar \"smccpbs\").");
		}
		if(scalar_dmccdbs == NULL)
		{
			throw PelibException("Missing distributed memory channel consumer distributed buffer size (scalar \"smcppbs\").");
		}
		if(set_F == NULL)
		{
			throw PelibException("Missing frequency set (set \"F\").");
		}
		if(f_unit == NULL)
		{
			throw PelibException("Missing frequency unit (scalar \"Funit\").");
		}
		if(set_Fi == NULL)
                {   
                        throw PelibException("Missing frequency island toppology (set of sets \"Fi\").");
		}
		if(scalar_fin == NULL)
                {   
                        throw PelibException("Missing number of frequency islands (scalar \"Fin\").");
		}
		if(set_Si == NULL)
                {   
                        throw PelibException("Missing shared memory island topology (set of sets \"Si\").");
		}
		if(vector_pml == NULL)
                {   
                        throw PelibException("Missing number of private memory levels per core (vector \"pml\").");
		}
		if(vector_sml == NULL)
		{
			throw PelibException("Missing number of shared memory levels per shared memory island and level (vector \"sml\").");
		}
		if(scalar_dml == NULL)
                {   
                        throw PelibException("Missing number of distributed memory levels (scalar \"dml\").");
		}
		if(matrix_pms == NULL)
                {   
                        throw PelibException("Missing size of private memories per core and level (matrix \"pms\").");
		}
		if(matrix_sms == NULL)
                {   
                        throw PelibException("Missing size of shared memories per shared memory island (matrix \"sms\").");
		}
		if(vector_dms == NULL)
                {   
                        throw PelibException("Missing size of distributed memories per distributed level (vector \"dms\").");
		}

		this->syncSize = scalar_sync->getValue();
		this->pmcpbs = scalar_pmcpbs->getValue();
		this->pmccbs = scalar_pmccbs->getValue();
		this->smcppbs = scalar_smcppbs->getValue();
		this->smcpsbs = scalar_smcpsbs->getValue();
		this->smccpbs = scalar_smccpbs->getValue();
		this->smccsbs = scalar_smccsbs->getValue();
		this->dmcppbs = scalar_dmcppbs->getValue();
		this->dmcpdbs = scalar_dmcpdbs->getValue();
		this->dmccpbs = scalar_dmccpbs->getValue();
		this->dmccdbs = scalar_dmccdbs->getValue();

		// Create empty frequency islands, if a description is given
		vector<island> frequency;
		if(set_Fi != NULL)
		{
			Set<unsigned int>::SetOfSetsType Fi = set_Fi->getSubsets();
			for(Set<unsigned int>::SetOfSetsType::iterator i = Fi.begin(); i != Fi.end(); i++)
			{
				frequency.push_back(island());
			}
		}

		// Create empty shared memory islands, if a description is given
		vector<island> shared;
		Set<unsigned int>::SetOfSetsType Si = set_Si->getSubsets();
		for(Set<unsigned int>::SetOfSetsType::iterator i = Si.begin(); i != Si.end(); i++)
		{
			shared.push_back(island());
		}

		for(size_t i = 0; i < scalar_p->getValue(); i++)
		{
			map<unsigned int, Core::MemorySize> pm;
			if(matrix_pms->getValues().find(i + 1) == matrix_pms->getValues().end() || vector_pml->getValues().find(i + 1) == vector_pml->getValues().end())
			{
				stringstream ss;
				ss << "Cannot find private memory for core " << i + 1 << ".";
				throw PelibException(ss.str());
			}

			for(map<unsigned int, map<unsigned int, unsigned long int>>::const_iterator imem = matrix_pms->getValues().begin(); imem != matrix_pms->getValues().end(); imem++)
			{
				const map<unsigned int, unsigned long int> &mem = imem->second;
				for(unsigned int j = 0; j < vector_pml->getValues().find(i + 1)->second; j++)
				{
					if(mem.find(j + 1) == mem.end())
					{
						stringstream ss;
						ss << "Cannot find private memory level " << j + 1 << " for core " << i + 1 << ".";
						throw PelibException(ss.str());
					}

					pm.insert(pair<unsigned int, Core::MemorySize>(j, mem.find(j + 1)->second));
				}
			}

			const Core *core = new DummyCore(set_F->getValues(), f_unit == NULL ? 1 : f_unit->getValue(), pm);
			this->cores.insert(core);
			island isl;
			isl.insert(core);

			// Each core is its own shared memory island
			//main.insert(island(isl));

			// If frequency islands are provided, then insert core in the right island
			if(set_Fi != NULL)
			{
				size_t core_id = i + 1;
				vector<Platform::island>::iterator jj = frequency.begin();

				// Find the frequency island that holds this core
				Set<unsigned int>::SetOfSetsType Fi = set_Fi->getSubsets();
				for(Set<unsigned int>::SetOfSetsType::iterator j = Fi.begin(); j != Fi.end(); j++)
				{
					if(j->second.find(core_id) != j->second.end())
					{
						size_t island_id = std::distance(Fi.begin(), j);
						std::advance(jj, island_id);
						island isl = *jj;
						frequency[island_id].insert(core);

						break;
					}
				}
			}

			// If shared memory islands are provided, then insert core in the right island
			size_t core_id = i + 1;
			vector<Platform::island>::iterator jj = shared.begin();

			// Find the shared memory island that holds this core
			Set<unsigned int>::SetOfSetsType Si = set_Si->getSubsets();
			for(Set<unsigned int>::SetOfSetsType::iterator j = Si.begin(); j != Si.end(); j++)
			{
				if(j->second.find(core_id) != j->second.end())
				{
					size_t island_id = std::distance(Si.begin(), j);
					std::advance(jj, island_id);
					island isl = *jj;
					shared[island_id].insert(core);
					break;
				}
			}

			// If voltage/frequency islands are provided, then copy the
			// frequency island set computed above to voltage and frequency
			// islands
			{
				islands isls;
				for(vector<Platform::island>::iterator i = frequency.begin(); i != frequency.end(); i++)
				{
					isls.insert(*i);
				}
				this->voltage = isls;
				this->freq = isls;
			}

			// If shared memory islands are provided, then copy the
			// frequency island set computed above to voltage and frequency
			// islands
			islands isls;
			for(vector<Platform::island>::iterator i = shared.begin(); i != shared.end(); i++)
			{
				isls.insert(*i);
			}
			this->shared = isls;
		}

		for(islands::const_iterator i = this->shared.begin(); i != this->shared.end(); i++)
		{
			unsigned int id = std::distance(this->shared.begin(), i) + 1;
			if(matrix_sms->getValues().find(id) == matrix_sms->getValues().end())
			{
				stringstream ss;
				ss << "Could not find any shared memory island with id " << id << ".";
				throw PelibException(ss.str());
			}
			if(vector_sml->getValues().find(id) == vector_sml->getValues().end())
			{
				stringstream ss;
				ss << "Could not find any shared memory level for island " << id << ".";
			}
			map<unsigned int, unsigned long int> sizes = matrix_sms->getValues().find(id)->second;
			for(const pair<unsigned int, unsigned long int> &size: sizes)
			{
				if(size.first <= vector_sml->getValues().find(id)->second)
				{
					this->sharedMemorySize.insert(pair<pair<island, unsigned int>, Core::MemorySize>(pair<island, unsigned int>(*i, size.first - 1), size.second));
				}
				else
				{
					this->sharedMemorySize.insert(pair<pair<island, unsigned int>, Core::MemorySize>(pair<island, unsigned int>(*i, size.first - 1), 0));
				}
			}
		}

		unsigned int dml = scalar_dml->getValue();
		map<unsigned int, unsigned long int>::const_iterator dms = vector_dms->getValues().begin();
		for(unsigned int i = 0; i < dml; i++)
		{
			map<unsigned int, unsigned long int>::const_iterator idms = dms;
			std::advance(idms, i);

			if(idms == vector_dms->getValues().end())
			{
				throw PelibException("More levels givens in dml than described in dms.");
			}
			
			this->distributedMemorySize.insert(pair<unsigned int, unsigned long int>(i, idms->second));
		}
	}

	Platform::~Platform()
	{
		for(island::const_iterator i = this->getCores().begin(); i != this->getCores().end(); i++)
		{
			delete *i;
		}
	}
	
	Platform*
	Platform::clone() const
	{
		Platform* res = new Platform(this);
		return res;
	}

	const Platform::island&
	Platform::getCores() const
	{
		return this->cores;
	}
		
	bool
	Platform::isHomogeneous() const
	{
		const char* type = NULL;
		
		for(island::const_iterator i = this->getCores().begin(); i != this->getCores().end(); i++)
		{
			if(type != NULL)
			{
				if(string(type).compare(typeid(**i).name()) != 0)
				{
					return false;
				}
			}

			type = typeid(**i).name();
		}

		// If we reach this point having read at least one string, then this is homogeneous
		return type != NULL;
	}

	Algebra
	Platform::buildAlgebra() const
	{
		Algebra record;

		if(!this->isHomogeneous())
		{
			throw CastException(std::string("Missing core number scalar \"p\" or frequency set \"F\" in input."));
		}

		Scalar<unsigned int> scalar_p("p", this->getCores().size());
		Scalar<unsigned int> f_unit("Funit", (*this->getCores().begin())->getFrequencyUnit());
		Set<unsigned int> set_F("F", (*this->getCores().begin())->getFrequencies());
		map<unsigned int, unsigned int> pml_map;

		map<unsigned int, map<unsigned int, unsigned long int>> private_memories;
		map<unsigned int, unsigned int> private_memories_length;
		unsigned int max_private_levels = 0;
		for(set<const Core*>::const_iterator i = this->getCores().begin(); i != this->getCores().end(); i++)
		{
			const Core& core = **i;
			unsigned int id = std::distance(this->getCores().begin(), i) + 1;
			unsigned int this_private_levels = 0;
			for(map<unsigned int, Core::MemorySize>::const_iterator j = core.getPrivateMemories().begin(); j != core.getPrivateMemories().end(); j++)
			{
				this_private_levels++;
			}
			if(this_private_levels > max_private_levels)
			{
				max_private_levels = this_private_levels;
			}
			private_memories_length.insert(pair<int, float>(id, this_private_levels));
		}

		for(set<const Core*>::const_iterator i = this->getCores().begin(); i != this->getCores().end(); i++)
		{
			const Core& core = **i;
			unsigned int id = std::distance(this->getCores().begin(), i) + 1;
			map<unsigned int, unsigned long int> mem;

			map<unsigned int, Core::MemorySize>::const_iterator begin = core.getPrivateMemories().begin();
			for(unsigned int j = 0; j < max_private_levels; j++, std::advance(begin, 1))
			{
				if(begin != core.getPrivateMemories().end())
				{
					mem.insert(pair<unsigned int, unsigned long int>(j + 1, begin->second));
				}
				else
				{
					mem.insert(pair<unsigned int, unsigned long int>(j + 1, 0));
				}
			}

			private_memories.insert(pair<unsigned int, map<unsigned int, unsigned long int>>(id, mem));
			private_memories_length.insert(pair<unsigned int, unsigned int>(id, mem.size()));
		}
		Vector<unsigned int, unsigned int> vector_pml("pml", private_memories_length); // Number of levels for private memory of each core
		Matrix<unsigned int, unsigned int, unsigned long int> matrix_pms("pms", private_memories);
		map<unsigned int, unsigned int> sharedMemLevels;
		map<unsigned int, map<unsigned int, unsigned long int>> sharedMemSize;
		for(islands::const_iterator i = this->shared.begin(); i != this->shared.end(); i++)
		{
			unsigned int island_id = std::distance(this->shared.begin(), i) + 1;
			unsigned int levels = 0;
			map<unsigned int, unsigned long int> memSize;
			for(const pair<pair<island, unsigned int>, Core::MemorySize> &mem: this->sharedMemorySize)
			{
				if(mem.first.first != *i)
				{
					continue;
				}
				if(mem.second > 0)
				{
					memSize.insert(pair<unsigned int, unsigned long int>(mem.first.second + 1, mem.second));
					levels++;
				}
				else
				{
					memSize.insert(pair<unsigned int, unsigned long int>(mem.first.second + 1, 0));
				}
			}
			sharedMemSize.insert(pair<unsigned int, map<unsigned int, unsigned long int>>(island_id, memSize));
			sharedMemLevels.insert(pair<unsigned int, unsigned long int>(island_id, levels));
		}
		Vector<unsigned int, unsigned int> vector_sml("sml", sharedMemLevels); // Number of levels for shared memories for each island
		Matrix<unsigned int, unsigned int, unsigned long int> matrix_sms("sms", sharedMemSize); // Size of each shared memory level of each island

		Set<unsigned int>::SetOfSetsType Fi;
		for(set<island>::iterator i = this->freq.begin(); i != this->freq.end(); i++)
		{
			Set<unsigned int>::SetType isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				island::iterator core_iter = cores.find(*j);
				isl.insert(std::distance(cores.begin(), core_iter) + 1);
			}
			Fi.insert(pair<size_t, Set<unsigned int>::SetType>((size_t)(std::distance(this->freq.begin(), i) + 1), isl));
		}
		Set<unsigned int> set_Fi("Fi", Fi);

		Set<unsigned int>::SetOfSetsType Si;
		for(set<island>::iterator i = this->shared.begin(); i != this->shared.end(); i++)
		{
			Set<unsigned int>::SetType isl;
			for(island::const_iterator j = i->begin(); j != i->end(); j++)
			{
				island::iterator core_iter = cores.find(*j);
				isl.insert(std::distance(cores.begin(), core_iter) + 1);
			}
			Si.insert(pair<size_t, Set<unsigned int>::SetType>((size_t)(std::distance(this->shared.begin(), i) + 1), isl));
		}
		Set<unsigned int> set_Si("Si", Si);

		Scalar<unsigned int> scalar_dml("dml", this->getDistributedMemories().size()); // Number of levels for distributed memory
		map<unsigned int, unsigned long int> new_dms;
		for(const pair<unsigned int, unsigned long long int> &dms: this->getDistributedMemories())
		{
			new_dms.insert(pair<unsigned int, unsigned long int>(dms.first, dms.second));
		}
		Vector<unsigned int, unsigned long int> vector_dms("dms", new_dms); // Size of each distributed memory level

		record.insert(&scalar_p);
		record.insert(&f_unit);
		record.insert(&set_F);
		record.insert(&set_Fi);
		record.insert(&set_Si);
		record.insert(&vector_pml);
		record.insert(&matrix_pms);
		record.insert(&vector_sml);
		record.insert(&matrix_sms);
		record.insert(&scalar_dml);
		record.insert(&vector_dms);
		Scalar<unsigned int> scalar_Fin("Fin", Fi.size());
		record.insert(&scalar_Fin);
		Scalar<unsigned int> scalar_Sin("Sin", Si.size());
		record.insert(&scalar_Sin);
		Scalar<unsigned long int> scalar_sync("sync", this->getSyncSize());
		record.insert(&scalar_sync);

		Scalar<unsigned long int> scalar_pmcpbs("pmcpbs", this->getPrivMemChanProdBuffSize());
		record.insert(&scalar_pmcpbs);
		Scalar<unsigned long int> scalar_pmccbs("pmccbs", this->getPrivMemChanConsBuffSize());
		record.insert(&scalar_pmccbs);
		Scalar<unsigned long int> scalar_smcppbs("smcppbs", this->getSharedMemChanProdPrivBuffSize());
		record.insert(&scalar_smcppbs);
		Scalar<unsigned long int> scalar_smcpsbs("smcpsbs", this->getSharedMemChanProdSharedBuffSize());
		record.insert(&scalar_smcpsbs);
		Scalar<unsigned long int> scalar_smccpbs("smccpbs", this->getSharedMemChanConsPrivBuffSize());
		record.insert(&scalar_smccpbs);
		Scalar<unsigned long int> scalar_smccsbs("smccsbs", this->getSharedMemChanConsSharedBuffSize());
		record.insert(&scalar_smccsbs);
		Scalar<unsigned long int> scalar_dmcppbs("dmcppbs", this->getDistMemChanProdPrivBuffSize());
		record.insert(&scalar_dmcppbs);
		Scalar<unsigned long int> scalar_dmcpdbs("dmcpdbs", this->getDistMemChanProdDistBuffSize());
		record.insert(&scalar_dmcpdbs);
		Scalar<unsigned long int> scalar_dmccpbs("dmccpbs", this->getDistMemChanConsPrivBuffSize());
		record.insert(&scalar_dmccpbs);
		Scalar<unsigned long int> scalar_dmccdbs("dmccdbs", this->getDistMemChanConsDistBuffSize());
		record.insert(&scalar_dmccdbs);

		return record;
	}

	size_t
	Platform::getCoreId(const Core* core) const
	{
		if(this->getCores().find(core) == this->getCores().end())
		{
			throw CastException("Core is not part of the platform.");
		}

		return std::distance(this->cores.begin(), this->cores.find(core)) + 1;
	}

	const Platform::islands&
	Platform::getSharedMemoryIslands() const
	{
		return this->shared;
	}

	const Platform::islands
	Platform::sharedMemoryIslands(size_t id) const
	{
		if(id > this->getCores().size())
		{
			throw CastException("Requesting shared memory island beyond the number of islands in the platform.");
		}
		islands isls;
		set<const Core*>::const_iterator core_search = this->getCores().begin();
		std::advance(core_search, id - 1);
		const Core &core = **core_search;
		for(islands::const_iterator i = this->getSharedMemoryIslands().begin(); i != this->getSharedMemoryIslands().end(); i++)
		{
			if(i->find(&core) != i->end())
			{
				isls.insert(*i);
			}
		}

		return isls;
	}

	const std::set<unsigned int>
	Platform::sharedMemoryIslands(const islands& isls) const
	{
		set<unsigned int> indexes;
		for(Platform::islands::const_iterator i = isls.begin(); i != isls.end(); i++)
		{
			if(this->getSharedMemoryIslands().find(*i) != this->getSharedMemoryIslands().end())
			{
				indexes.insert((unsigned int)std::distance(this->getSharedMemoryIslands().begin(), this->getSharedMemoryIslands().find(*i)) + 1);
			}
			else
			{
				throw CastException("Could not find island in platform.");
			}
		}

		return indexes;
	}

	const Platform::islands
	Platform::sharedMemoryIslands(const std::set<int>& isls) const
	{
		Platform::islands out;
		for(std::set<int>::const_iterator i = isls.begin(); i != isls.end(); i++)
		{
			set<island>::const_iterator ii = this->getSharedMemoryIslands().begin();
			if(*i > (ptrdiff_t)this->getSharedMemoryIslands().size())
			{
				throw CastException("Trying to get shared memory island beyond the capacity of the platform.");
			}
			std::advance(ii, *i);
			out.insert(*ii);
		} 

		return out;
	}

	/*
	const Platform::islands&
	Platform::getMainMemoryIslands() const
	{
		return this->main;
	}

	const Platform::islands
	Platform::mainMemoryIslands(size_t id) const
	{
		islands isls;
		set<const Core*>::const_iterator core_search = this->getCores().begin();
		std::advance(core_search, id - 1);
		const Core &core = **core_search;
		for(Platform::islands::const_iterator i = this->getMainMemoryIslands().begin(); i != this->getMainMemoryIslands().end(); i++)
		{
			if(i->find(&core) != i->end())
			{
				isls.insert(*i);
			}
		}

		return isls;
	}

	const Platform::islands&
	Platform::getPrivateMemoryIslands() const
	{
		return this->priv;
	}

	const Platform::islands
	Platform::privateMemoryIslands(size_t id) const
	{
		Platform::islands isls;
		set<const Core*>::const_iterator core_search = this->getCores().begin();
		std::advance(core_search, id - 1);
		const Core &core = **core_search;
		for(Platform::islands::const_iterator i = this->getPrivateMemoryIslands().begin(); i != this->getPrivateMemoryIslands().end(); i++)
		{
			if(i->find(&core) != i->end())
			{
				isls.insert(*i);
			}
		}

		return isls;
	}
	*/

	const Platform::islands&
	Platform::getVoltageIslands() const
	{
		return this->voltage;
	}

	const Platform::island&
	Platform::getVoltageIsland(size_t id) const
	{
		set<const Core*>::const_iterator core_search = this->getCores().begin();
		std::advance(core_search, id - 1);
		const Core &core = **core_search;
		for(Platform::islands::const_iterator i = this->getVoltageIslands().begin(); i != this->getVoltageIslands().end(); i++)
		{
			if(i->find(&core) != i->end())
			{
				return *i;
			}
		}

		throw CastException("Cannot find core in any Platform::island of the platform.");
	}

	const Platform::islands&
	Platform::getFrequencyIslands() const
	{
		return this->freq;
	}

	const Platform::island&
	Platform::getFrequencyIsland(size_t id) const
	{
		set<const Core*>::const_iterator core_search = this->getCores().begin();
		std::advance(core_search, id - 1);
		const Core &core = **core_search;
		for(Platform::islands::const_iterator i = this->getFrequencyIslands().begin(); i != this->getFrequencyIslands().end(); i++)
		{
			if(i->find(&core) != i->end())
			{
				return *i;
			}
		}

		throw CastException("Cannot find core in any Platform::island of the platform.");
	}

	Platform&
	Platform::operator=(const Platform& cpy)
	{
		for(island::const_iterator i = this->getCores().begin(); i != this->getCores().end(); i++)
		{
			delete *i;
		}

		copy(&cpy);
		this->check();
		return *this;
	}

	const std::map<std::pair<Platform::island, unsigned int>, Core::MemorySize>&
	Platform::getSharedMemories() const
	{
		return this->sharedMemorySize;
	}

	const std::map<unsigned int, Core::MemorySize>&
	Platform::getDistributedMemories() const
	{
		return this->distributedMemorySize;
	}
	
	std::vector<AmplInputDataParser*> Platform::AmplInputParsers()
	{
		std::vector<AmplInputDataParser*> parsers;
		
		parsers.push_back(new AmplInputScalar<unsigned int>(false));
		parsers.push_back(new AmplInputScalar<unsigned long int>(false));
		parsers.push_back(new AmplInputVector<unsigned int, unsigned int>(true));
		parsers.push_back(new AmplInputVector<unsigned int, unsigned long int>(true));
		parsers.push_back(new AmplInputSet<unsigned int>(true));
		parsers.push_back(new AmplInputMatrix<unsigned int, unsigned int, unsigned long int>(false));

		return parsers;
	}
		
	std::vector<AmplInputDataOutput*> Platform::AmplInputOutputs()
	{
		std::vector<AmplInputDataOutput*> outputs;

		outputs.push_back(new AmplInputScalar<unsigned int>(false));
		outputs.push_back(new AmplInputScalar<unsigned long int>(false));
		outputs.push_back(new AmplInputVector<unsigned int, unsigned int>(true));
		outputs.push_back(new AmplInputVector<unsigned int, unsigned long int>(true));
		outputs.push_back(new AmplInputSet<unsigned int>(true));
		outputs.push_back(new AmplInputMatrix<unsigned int, unsigned int, unsigned long int>(false));

		return outputs;
	}
	std::pair<std::vector<AmplInputDataParser*>, std::vector<AmplInputDataOutput*> > Platform::AmplInputHandlers()
	{
		return std::pair<std::vector<AmplInputDataParser*>, std::vector<AmplInputDataOutput*> >(Platform::AmplInputParsers(), Platform::AmplInputOutputs());
	}

	std::vector<AmplOutputDataParser*> Platform::AmplOutputParsers()
	{
		std::vector<AmplOutputDataParser*> parsers;
		
		parsers.push_back(new AmplOutputScalar<unsigned int>(false));
		parsers.push_back(new AmplOutputScalar<unsigned long int>(false));
		parsers.push_back(new AmplOutputVector<unsigned int, unsigned int>(true));
		parsers.push_back(new AmplOutputVector<unsigned int, unsigned long int>(true));
		parsers.push_back(new AmplOutputSet<unsigned int>(true));
		parsers.push_back(new AmplOutputMatrix<unsigned int, unsigned int, unsigned long int>(false));

		return parsers;
	}
		
	std::vector<AmplOutputDataOutput*> Platform::AmplOutputOutputs()
	{
		std::vector<AmplOutputDataOutput*> outputs;

		outputs.push_back(new AmplOutputScalar<unsigned int>(false));
		outputs.push_back(new AmplOutputScalar<unsigned long int>(false));
		outputs.push_back(new AmplOutputVector<unsigned int, unsigned int>(true));
		outputs.push_back(new AmplOutputVector<unsigned int, unsigned long int>(true));
		outputs.push_back(new AmplOutputSet<unsigned int>(true));
		outputs.push_back(new AmplOutputMatrix<unsigned int, unsigned int, unsigned long int>(false));

		return outputs;
	}
	std::pair<std::vector<AmplOutputDataParser*>, std::vector<AmplOutputDataOutput*> > Platform::AmplOutputHandlers()
	{
		return std::pair<std::vector<AmplOutputDataParser*>, std::vector<AmplOutputDataOutput*> >(Platform::AmplOutputParsers(), Platform::AmplOutputOutputs());
	}

	const std::map<std::string, const std::type_info&>&
	Platform::getAmplParsingDirectives()
	{
		return Platform::amplDirectives;
	}
}
