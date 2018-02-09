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
#include <algorithm>

#include <pelib/UniformLinkAllocator.hpp>
#include <pelib/Platform.hpp>
#include <pelib/Taskgraph.hpp>
#include <pelib/Schedule.hpp>
#include <pelib/PelibException.hpp>

#ifdef debug
#undef debug
#endif 

#define debug(expr) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << (#expr) << " = \"" << (expr) << "\"." << endl;

using namespace std;

namespace pelib
{
	UniformLinkAllocator::UniformLinkAllocator(const std::map<Memory::Feature, unsigned int> &levels)
	{
		this->levels = levels;
	}

	UniformLinkAllocator::~UniformLinkAllocator()
	{
		// Do nothing
	}

	const std::map<Memory::Feature, unsigned int>&
	UniformLinkAllocator::getLevelDirectives() const
	{
		return this->levels;
	}

	static
	Platform::island
	masterCoreIsland(const Schedule &schedule, const Platform &pt, const Task &task)
	{
		Platform::island out;
		unsigned int master_core = schedule.getExecTask(task).getMasterCore();
		Platform::island::const_iterator search_core = pt.getCores().begin();
		std::advance(search_core, master_core);
		if(search_core == pt.getCores().end())
		{
			stringstream ss;
			ss << "Task \"" << task.getName() << "\" is mapped to core beyond number of cores in platform";
			throw PelibException(ss.str());
		}
		const Core *core = *search_core;
		out.insert(core);
		return out;
	}

	Schedule
	UniformLinkAllocator::allocate(const Schedule &schedule) const
	{
		const Platform &pt = schedule.getPlatform();
		const Taskgraph &tg = schedule.getTaskgraph();

		// Always allocate memory on a memory directly accessible by the receiving task
		// in private memory first, then in shared memory and if none is possible, in distributed memory.
		// If no directive is given, always allocate on level 0

		// Determine memory available for each possible memory target
		map<Platform::island, Core::MemorySize> private_max_size;
		// Begin with single cores' private memory
		map<Memory::Feature, unsigned int>::const_iterator search_level = this->getLevelDirectives().find(Memory::Feature::exclusive);
		unsigned int private_level = 0;
		if(search_level != this->getLevelDirectives().end())
		{
			private_level = search_level->second;
		}

		for(const Core* core: pt.getCores())
		{
			Platform::island tisl;
			tisl.insert(core);
			
			map<unsigned int, Core::MemorySize>::const_iterator search_size = core->getPrivateMemories().find(private_level);
			if(search_size == core->getPrivateMemories().end())
			{
				throw PelibException("Requested private memory level that platform does not provide");
			}
			private_max_size.insert(pair<Platform::island, Core::MemorySize>(tisl, search_size->second));
		}

		// Now shared memories
		unsigned int shared_level = 0;
		map<Platform::island, Core::MemorySize> shared_max_size;
		search_level = this->getLevelDirectives().find(Memory::Feature::shared);
		if(search_level != this->getLevelDirectives().end())
		{
			shared_level = search_level->second;
		}

		for(const Platform::island &isl: pt.getSharedMemoryIslands())
		{
			map<pair<Platform::island, unsigned int>, Core::MemorySize>::const_iterator search_size = pt.getSharedMemories().find(pair<Platform::island, unsigned int>(isl, shared_level));
			if(search_size == pt.getSharedMemories().end())
			{
				throw PelibException("Requested shared memory level that platform does not provide");
			}
			shared_max_size.insert(pair<Platform::island, Core::MemorySize>(isl, search_size->second));
		}

		unsigned int distributed_level = 0;
		Core::MemorySize distributed_max_size = 0;
		search_level = this->getLevelDirectives().find(Memory::Feature::distributed);
		if(search_level != this->getLevelDirectives().end())
		{
			distributed_level = search_level->second;
		}
		map<unsigned int, Core::MemorySize>::const_iterator search_size = pt.getDistributedMemories().find(distributed_level);
		if(search_size == pt.getDistributedMemories().end() && distributed_level != 0)
		{
			throw PelibException("Requested distributed memory level that platform does not provide");
		}
		if(search_size != pt.getDistributedMemories().end())
		{
			distributed_level = search_size->second;
		}

		// Allocate synchronization memory
		// For task scheduled in every core
		map<unsigned int, set<ExecTask>> table;
		map<ExecTask, Memory> sync;
		unsigned int sync_counter = 0;
		for(const pair<unsigned int, set<ExecTask>> &i: schedule.getSchedule())
		{
			set<ExecTask> sequence;
			for(const ExecTask &eTask: i.second)
			{
				// If the task runs on more than one core, and its master core is the one being covered now
				if(eTask.getWidth() > 1)
				{
					// We need to allocate a synchronization barrier, but first
					// we need to find the shared memory island
					Platform::island task_cores = schedule.taskIsland(eTask.getTask());

					for(const Platform::island &island: pt.getSharedMemoryIslands())
					{
						if(all_of(task_cores.begin(), task_cores.end(), [island](const Core* c){ return island.find(c) != island.end(); }))
						{
							// All cores involved in the task execution are included
							// in this island therefore this island can host the barrier
							shared_max_size.find(island)->second -= pt.getSyncSize();
							unsigned int sync_id = 0;

							if(sync.find(eTask) != sync.end())
							{
								sync_id = sync.find(eTask)->second.getInstance();
							}
							else
							{
								sync_id = sync_counter++;
							}

							Memory mem(Memory::Feature::shared, shared_level, i.first, sync_id);
							sync.insert(pair<ExecTask, Memory>(eTask, mem));
							sequence.insert(ExecTask(eTask.getTask(), eTask.allLinks(), eTask.getFrequency(), eTask.getWidth(), eTask.getStart(), eTask.getInstance(), eTask.getMasterCore(), mem));
						}
						else
						{
							sequence.insert(ExecTask(eTask));
						}
					}
				}
				else
				{
					sequence.insert(ExecTask(eTask));
				}
			}
			table.insert(pair<unsigned int, set<ExecTask>>(i.first, sequence));
		}

		map<Platform::island, Core::MemorySize> private_mem_use, shared_mem_use;
		Core::MemorySize distributed_mem_use = 0;
		map<Platform::island, set<AbstractLink>> private_mem_alloc, shared_mem_alloc;
		set<AbstractLink> distributed_mem_alloc;
		for(const AbstractLink &ablink: tg.getLinks())
		{
			Platform::island producer_island = schedule.taskIsland(*ablink.getProducer());
			Platform::island consumer_island = schedule.taskIsland(*ablink.getConsumer());

			Platform::island prod_core_island = masterCoreIsland(schedule, pt, *ablink.getProducer());
			Platform::island cons_core_island = masterCoreIsland(schedule, pt, *ablink.getConsumer());
		
			// Until we find a suitable allocation
			bool alloted = false;

			// Check if both islands are included in any single core. If so, allocate its
			// private memory to this link
			for(const Core* core: pt.getCores())
			{
				Platform::island tisl;
				tisl.insert(core);
				bool producer_ok = all_of(producer_island.begin(), producer_island.end(), [tisl](const Core* c){ return tisl.find(c) != tisl.end(); });
				bool consumer_ok = all_of(consumer_island.begin(), consumer_island.end(), [tisl](const Core* c){ return tisl.find(c) != tisl.end(); });

				if(producer_ok && consumer_ok)
				{
					// Account for private memory used for private communication channel
					private_max_size.find(tisl)->second -= pt.getPrivMemChanProdBuffSize();
					private_max_size.find(tisl)->second -= pt.getPrivMemChanConsBuffSize();

					// We should allocate this link into this core's private memory
					map<Platform::island, Core::MemorySize>::iterator use = private_mem_use.find(tisl);
					if(use == private_mem_use.end())
					{
						pair<map<Platform::island, Core::MemorySize>::iterator, bool> res = private_mem_use.insert(pair<Platform::island, Core::MemorySize>(tisl, 0));
						use = res.first;
					}
					use->second += ablink.getTypeSize(); // for SDF-style allocation, multiply this by the relevant number of times

					// Add link to private memory island
					map<Platform::island, set<AbstractLink>>::iterator search_alloc = private_mem_alloc.find(tisl);
					if(search_alloc == private_mem_alloc.end())
					{
						pair<map<Platform::island, set<AbstractLink>>::iterator, bool> res = private_mem_alloc.insert(pair<Platform::island, set<AbstractLink>>(tisl, set<AbstractLink>()));
						search_alloc = res.first;
					}
					pair<set<AbstractLink>::iterator, bool> res = search_alloc->second.insert(ablink);
					const AbstractLink &in = *res.first;

					// Mark link as alloted	
					alloted = true;
					break;
				}
			}

			// If the link is already alloted, then no need to look for shared memory allocation
			if(alloted)
			{
				continue;
			}

			for(const Platform::island tisl: pt.getSharedMemoryIslands())
			{
				bool producer_ok = all_of(producer_island.begin(), producer_island.end(), [tisl](const Core* c){ return tisl.find(c) != tisl.end(); });
				bool consumer_ok = all_of(consumer_island.begin(), consumer_island.end(), [tisl](const Core* c){ return tisl.find(c) != tisl.end(); });
				if(producer_ok && consumer_ok)
				{
					// We need also to account for the additional shared memory used to implement communication through shared memory
					shared_max_size.find(tisl)->second -= pt.getSharedMemChanProdSharedBuffSize();
					shared_max_size.find(tisl)->second -= pt.getSharedMemChanConsSharedBuffSize();
					// As well as the private memory of both cores running producer and consumer tasks 
					private_max_size.find(prod_core_island)->second -= pt.getSharedMemChanProdPrivBuffSize();
					private_max_size.find(cons_core_island)->second -= pt.getSharedMemChanConsPrivBuffSize();
					
					// We should allocate this link into this shared memory island
					map<Platform::island, Core::MemorySize>::iterator use = shared_mem_use.find(tisl);
					if(use == shared_mem_use.end())
					{
						pair<map<Platform::island, Core::MemorySize>::iterator, bool> res = shared_mem_use.insert(pair<Platform::island, Core::MemorySize>(tisl, 0));
						use = res.first;
					}
					use->second += ablink.getTypeSize(); // for SDF-style allocation, multiply this by the relevant number of times

					// Add link to shared memory island
					map<Platform::island, set<AbstractLink>>::iterator search_alloc = shared_mem_alloc.find(tisl);
					if(search_alloc == shared_mem_alloc.end())
					{
						pair<map<Platform::island, set<AbstractLink>>::iterator, bool> res = shared_mem_alloc.insert(pair<Platform::island, set<AbstractLink>>(tisl, set<AbstractLink>()));
						search_alloc = res.first;
					}
					pair<set<AbstractLink>::iterator, bool> res = search_alloc->second.insert(ablink);
					const AbstractLink &in = *res.first;

					// Mark link as alloted	
					alloted = true;
					break;
				}
			}

			// If the link is already alloted, then no need to look for distributed memory allocation
			if(alloted)
			{
				continue;
			}

			// We should allocate this link into distributed memory
			// Cores distributed across distributed memory cannot co-run a task in parallel, thus we don't need synchronization structure
			// However we do need message passing distributed and private memory
			distributed_max_size -= pt.getDistMemChanProdDistBuffSize();
			distributed_max_size -= pt.getDistMemChanConsDistBuffSize();
			private_max_size.find(prod_core_island)->second -= pt.getDistMemChanProdPrivBuffSize();
			private_max_size.find(cons_core_island)->second -= pt.getDistMemChanConsPrivBuffSize();

			// Memory used for buffers
			distributed_mem_use += ablink.getTypeSize(); // for SDF-style allocation, multiply this by the relevant number of times

			// Add link to shared memory island
			distributed_mem_alloc.insert(ablink);
		}

		// Not that we have the amount of memory alloted for each island, including communication barriers and additional memory overhead
		// let us compute how much we can grow these buffers and still be able to accomodate all these in the memory they have been alloted to
		float min_ratio = distributed_max_size;
		for(const pair<Platform::island, Core::MemorySize> &p: private_max_size)
		{
			if(p.second > min_ratio)
			{
				min_ratio = p.second;
			}
		}
		for(const pair<Platform::island, Core::MemorySize> &p: shared_max_size)
		{
			if(p.second > min_ratio)
			{
				min_ratio = p.second;
			}
		}
		// Let us scan private memory allocation
		for(const pair<Platform::island, Core::MemorySize> &i: private_mem_use)
		{
			// This can't fail because all core have been added as private memory island above
			Core::MemorySize max = private_max_size.find(i.first)->second;
			Core::MemorySize use = i.second;

			float ratio = (double)max / (double)use;
			// If we have alloted more memory than available, then raise an exception
			if(ratio < 1)
			{
				throw PelibException("Private memory allocation exceed private memory capacity. No correct uniform allocation is possible with this schedule.");
			}

			// If the ratio is bigger than any already found, then update
			if(min_ratio > ratio)
			{
				min_ratio = ratio;
			}
		}

		// Let us scan shared memory allocation
		for(const pair<Platform::island, Core::MemorySize> &i: shared_mem_use)
		{
			Core::MemorySize max = shared_max_size.find(i.first)->second;
			Core::MemorySize use = i.second;

			float ratio = (double)max / (double)use;
			// If we have alloted more memory than available, then raise an exception
			if(ratio < 1)
			{
				throw PelibException("Private memory allocation exceed shared memory capacity. No correct uniform allocation is possible with this schedule.");
			}

			// If the ratio is bigger than any already found, then update
			if(min_ratio > ratio)
			{
				min_ratio = ratio;
			}
		}

		float ratio = (double) distributed_max_size / (double)distributed_mem_use;
		if(ratio < 1)
		{
			throw PelibException("Private memory allocation exceed shared memory capacity. No correct uniform allocation is possible with this schedule.");
		}

		// If the ratio is bigger than any already found, then update
		if(min_ratio > ratio)
		{
			min_ratio = ratio;
		}

		// Now we can magnify all allocations and insert links
		// Private memory
		set<AllotedLink> links;
		for(const pair<Platform::island, set<AbstractLink>> &i: private_mem_alloc)
		{
			for(const AbstractLink &j: i.second)
			{
				const ExecTask &eTask = schedule.getExecTask(*j.getConsumer());
				Memory m(Memory::Feature::exclusive, private_level, eTask.getMasterCore(), 0);
				Buffer b(j.getTypeSize() * min_ratio / j.getTypeSize(), j.getDataType(), j.getHeader(), m);
				// Create new link in private memory. Because we use a common
				// private memory, no additional memory is required to manage
				// data transactions from sender or receiver sides
				AllotedLink al(j, b, Memory(), Memory());
				pair<set<AllotedLink>::iterator, bool> res = links.insert(al);
			}
		}

		// Shared memory
		for(const pair<Platform::island, set<AbstractLink>> &i: shared_mem_alloc)
		{
			for(const AbstractLink &j: i.second)
			{
				const ExecTask &eTask = schedule.getExecTask(*j.getConsumer());
				Memory m(Memory::Feature::shared, shared_level, eTask.getMasterCore(), 0);
				Buffer b(j.getTypeSize() * min_ratio / j.getTypeSize(), j.getDataType(), j.getHeader(), m);
				// Create new link in private memory. Because we use a shared
				// memory, no additional memory is required to manage data
				// transactions from sender or receiver sides
				AllotedLink al(j, b, Memory(), Memory());
				pair<set<AllotedLink>::iterator, bool> res = links.insert(al);
			}
		}

		// TODO: allocate for distributed memory
		Schedule out(schedule.getName(), schedule.getAppName(), table, links, tg, pt);
		return out;
	}
}
