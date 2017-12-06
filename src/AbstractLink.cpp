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

#include <string>
#include <iostream>
#include <sstream>
#include <string.h>
#include <fstream>
#include <sys/types.h>
#include <unistd.h>
#include <vector>
#include <ext/stdio_filebuf.h>
#include <sys/wait.h>
#include <libtcc.h>

#include <pelib/AbstractLink.hpp>
#include <pelib/PelibException.hpp>

#ifdef debug
#undef debug
#endif

#define debug(expr) cout << "[" << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << "] " << #expr << " = \"" << (expr) << "\"." << endl;

using namespace std;

namespace pelib
{
	AbstractLink::AbstractLink(const Task &producer, const Task &consumer, const std::string &producerName, const std::string &consumerName, const string &type, const string &header, const string &include_path, size_t producer_rate, size_t consumer_rate) 
	{
		this->producerName = producerName;
		this->consumerName = consumerName;
		this->producer = (Task*)&producer;
		this->consumer = (Task*)&consumer;
		this->producer_rate = producer_rate;
		this->consumer_rate = consumer_rate;
		this->dataType = type;
		this->header = header;
		this->includePath = include_path;
	}

	AbstractLink::AbstractLink(const AbstractLink &link, const Task &producer, const Task &consumer)
	{
		// No task copy here: they point to tasks in taskgraph
		this->producer = &producer;
		this->consumer = &consumer;
		this->producerName = link.getProducerName();
		this->consumerName = link.getConsumerName();
		this->producer_rate = link.getProducerRate();
		this->consumer_rate = link.getConsumerRate();
		this->dataType = link.getDataType();
		this->header = link.getHeader();
		this->includePath = link.getIncludePath();
	}

	AbstractLink::AbstractLink(const AbstractLink& link)
	{
		// No task copy here: they point to tasks in taskgraph
		this->producer = link.getProducer();
		this->consumer = link.getConsumer();
		this->producerName = link.getProducerName();
		this->consumerName = link.getConsumerName();
		this->producer_rate = link.getProducerRate();
		this->consumer_rate = link.getConsumerRate();
		this->dataType = link.getDataType();
		this->header = link.getHeader();
		this->includePath = link.getIncludePath();
	}

	AbstractLink::~AbstractLink()
	{
		// Do nothing
	}

	const Task*
	AbstractLink::getProducer() const
	{
		return this->producer;
	}

	const Task*
	AbstractLink::getConsumer() const
	{
		return this->consumer;
	}

	const std::string&
	AbstractLink::getDataType() const
	{
		return this->dataType;
	}

	static
	string
	istream_to_string(istream &in)
	{
		istreambuf_iterator<char> eos;
		return string(istreambuf_iterator<char>(in), eos);
	}

	// From http://codereview.stackexchange.com/questions/71793/function-to-grab-stdin-stdout-stderr-of-a-child-process
	static
	int
	opencmd(string cmd, vector<string> argv, istream &stdin, string &out, string &err)
	{
		int infd[2];
		int outfd[2];
		int errfd[2];
		pid_t pid;

		argv.insert(argv.begin(), cmd);
		char **c_argv = (char**)malloc(sizeof(char*) * (argv.size() + 1));
		c_argv[argv.size()] = NULL;
		//debug("Hello world!");
		//cout << cmd << " ";
		for(vector<string>::iterator i = argv.begin(); i != argv.end(); i++)
		{
			size_t ii = distance(argv.begin(), i);
			c_argv[ii] = (char*)i->c_str();
			//cout << "'" << c_argv[ii] << "' ";
		}
		//cout << endl;
		//debug("Hello world!");

		/*
		 * Creating pipes in between ...
		 */
		if(pipe(infd) != 0)
		{
			return -1;
		}

		if(pipe(outfd) != 0)
		{
			close(infd[0]);
			close(infd[1]);

			return -1;
		}

		if(pipe(errfd))
		{
			close(outfd[0]);
			close(outfd[1]);
			close(infd[0]);
			close(infd[1]);

			return -1;
		}

		/*
		 * Starting actual processing ...
		 */
		pid = fork();
		switch (pid) {
			case -1:       /* Error */
				close(errfd[0]);
				close(errfd[1]);
				close(outfd[0]);
				close(outfd[1]);
				close(infd[0]);
				close(infd[1]);
			
				return -1;
			break;
			case 0:        /* Child */
				close(infd[1]);
				close(outfd[0]);
				close(errfd[0]);

				dup2(infd[0], 0);    /* redirect child stdin to in[0] */
				dup2(outfd[1], 1);   /* redirect child stdout to out[1] */
				dup2(errfd[1], 2);   /* redirect child stderr to err[1] */
				execvp(cmd.c_str(), c_argv); /* actual command execution */

				return -1; /* shall never be executed */
			break;
			default:       /* Parent */
				close(infd[0]);  /* no need to read its stdin */
				close(outfd[1]); /* no need to write to its stdout */
				close(errfd[1]); /* no need to write to its stderr */

				// Turn fd into string stream
				// hack seen here:
				// http://stackoverflow.com/questions/2746168/how-to-construct-a-c-fstream-from-a-posix-file-descriptor
				__gnu_cxx::stdio_filebuf<char> filein(infd[1], ios::out);
				ostream pstdin(&filein);

				__gnu_cxx::stdio_filebuf<char> fileout(outfd[0], ios::in);
				istream pstdout(&fileout);
				__gnu_cxx::stdio_filebuf<char> fileerr(errfd[0], ios::in);
				istream pstderr(&fileerr);

				// Write stdin to process' stdin
				string string = istream_to_string(stdin);
				pstdin << string;

				// This will not run before the solver is done
				out = istream_to_string(pstdout);
				err = istream_to_string(pstderr);

				// Wait for child process to terminate
				int status;
				waitpid(pid, &status, WUNTRACED);

				/*
				debug(WIFSIGNALED(status));
				debug(WIFEXITED(status));
				debug(WEXITSTATUS(status));
				*/

				if(WIFEXITED(status) == 1 && WIFSIGNALED(status) == 0)
				{
					status = WEXITSTATUS(status);
					//debug(status);
				}
				else
				{
					status = 0;
					//debug(status);
				}

				// Close streams
				filein.close();
				fileout.close();
				fileerr.close();

				// Free argument list
				free(c_argv);
				return status;
			break;
		}
	}

	static
	void
	tcc_error(void* opaque, const char* msg)
	{
		throw PelibException(string(msg));
	}

	const size_t
	AbstractLink::getTypeSize() const
	{
		// Simple use of TCC
		//https://stackoverflow.com/questions/17273674/tcc-invoke-a-function-returning-a-double
		stringstream src;
		src << "#include <stddef.h>" << endl;
		if(this->getHeader().compare(string()) != 0)
		{
			src << "#include <" << this->getHeader() << ">" << endl;
		}
		src << endl;
		src << "size_t" << endl;
		src << "getSize()" << endl;
		src << "{" << endl;
		src << "	return sizeof(" << this->getDataType().c_str() << ");" << endl;
		src << "}" << endl;

		TCCState *s;
		s = tcc_new();

		if (!s)
		{
			throw PelibException("Could not create tcc state");
		}

		typedef size_t (*getSizeFunc)();
		getSizeFunc getSize;

		if(this->getIncludePath().compare(string()) == 0)
		{
			tcc_add_include_path(s, this->getIncludePath().c_str());
		}
		tcc_set_error_func(s, NULL, tcc_error);
		tcc_set_output_type(s, TCC_OUTPUT_MEMORY);

		if(tcc_compile_string(s, src.str().c_str()) != 0)
		{
			throw PelibException("TCC Could not compile compile sample C++ program");
		}

		if (tcc_relocate(s, TCC_RELOCATE_AUTO) < 0)
		{
			throw PelibException("Something went wrong when relating TCC symbols into user memory");
		}

		getSize = (getSizeFunc)tcc_get_symbol(s, "getSize");
		if (!getSize)
		{
			throw PelibException("Could not retrieve symbol from TCC");
		}

		size_t out = getSize();
		tcc_delete(s);

		return out;
#if 0
#define ROOT_DIR "/" // or "C:\"
#define DIR_SEPARATOR "/" // or "\"
#define DEF_TMP_DIR ROOT_DIR"tmp" // or ROOT_DIR"windows"DIR_SEPARATOR"temp"
#define GPP "/usr/bin/g++"

		// /!\ Warning: This is not portable to Windows
		const char *folder = getenv("TMPDIR");
		if (folder == NULL)
		{
			folder = DEF_TMP_DIR;
		}

		stringstream filename;
		filename << folder << DIR_SEPARATOR << "test-" << ::getpid() << ".cpp";
		ofstream myfile;
		myfile.open(filename.str());

		myfile << "#include <iostream>" << endl;
		myfile << "#include <cstdlib>" << endl;
		if(this->getHeader().compare(string()) != 0)
		{
			myfile << "#include <" << this->getHeader() << ">" << endl;
		}
		myfile << endl;
		myfile << "int" << endl;
		myfile << "main(int argc, char **argv)" << endl;
		myfile << "{" << endl;
		myfile << "	std::cout << sizeof(" << this->getDataType().c_str() << ") << std::endl;" << endl;
		myfile << "	return EXIT_SUCCESS;" << endl;
		myfile << "}" << endl;
		myfile.close();

		stringstream bin;
		bin << folder << DIR_SEPARATOR << "test-" << ::getpid();

		vector<string> args;
		args.push_back(string(GPP));
		args.push_back(filename.str());
		if(this->getIncludePath().compare(string()) != 0)
		{
			args.push_back("-I");
			args.push_back(this->getIncludePath());
		}
		args.push_back(string("-D_GLIBCXX_USE_CXX11_ABI=0"));
		args.push_back(string("-o"));
		args.push_back(bin.str());
		stringstream in;
		string out, err;

		if(opencmd(GPP, args, in, out, err) != 0)
		{
			stringstream ss;
			ss << "Could not run command \"" << GPP << " " << filename.str() << " -o " << bin.str() << "\"" << endl;
			ss << "Standard output: " << endl << out;
			ss << "Standard error: " << err;
			throw PelibException(ss.str());
		}

		args.clear();
		args.push_back(bin.str());
		size_t size = 0;
		if(opencmd(bin.str(), args, in, out, err) != 0)
		{
			stringstream ss(out);
			ss >> size;
		}

		debug(size);

		// Clean the mess up
		stringstream rm;
		rm << "rm -rf " << filename.str() << " " << bin.str();
		debug(rm.str());
		if(!system(rm.str().c_str()))
		{
			stringstream ss;
			ss << "Failed to clean up files \"" << filename.str() << "\" and \"" << bin.str() << "\".";
			throw PelibException(ss.str());
		}

		return size;
#else
		return 0;
#endif
	}

	void
	AbstractLink::setProducer(Task* producer)
	{
		this->producer = producer;
	}

	void
	AbstractLink::setConsumer(Task* consumer)
	{
		this->consumer = consumer;
	}

	size_t
	AbstractLink::getProducerRate() const
	{
		return this->producer_rate;
	}

	size_t
	AbstractLink::getConsumerRate() const
	{
		return this->consumer_rate;
	}

	const std::string&
	AbstractLink::getHeader() const
	{
		return this->header;
	}

	const std::string&
	AbstractLink::getIncludePath() const
	{
		return this->includePath;
	}

	const std::string&
	AbstractLink::getProducerName() const
	{
		return this->producerName;
	}

	const std::string&
	AbstractLink::getConsumerName() const
	{
		return this->consumerName;
	}

	bool
	AbstractLink::operator<(const AbstractLink &other) const
	{
		const Task &thisProducer = *this->getProducer();
		const Task &otherProducer = *other.getProducer();
		const Task &thisConsumer = *this->getConsumer();
		const Task &otherConsumer = *other.getConsumer();

		if(thisProducer == otherProducer && thisConsumer == otherConsumer)
		{
			if(this->getProducerName().compare(other.getProducerName()) == 0)
			{
				return this->getConsumerName() < other.getConsumerName();
			}
			else
			{
				return this->getProducerName() < other.getProducerName();
			}
		}

		if(thisProducer == otherProducer)
		{
			return thisConsumer < otherConsumer;
		}
		else
		{
			return thisProducer < otherProducer;
		}	
	}

	bool
	AbstractLink::operator==(const AbstractLink &other) const
	{	
		bool res = (*this->getProducer() == *other.getProducer()) && (*this->getConsumer() == *other.getConsumer()) && (this->getProducerName().compare(other.getProducerName()) == 0) && (this->getConsumerName().compare(other.getConsumerName()) == 0);
		return res;
	}
}
