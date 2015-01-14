#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include "lib/shell.hxx"
#include <iostream>
#include "src/print.hxx"
#include <sstream>
#include "track.hxx"

static const char USAGE[] =
R"(sim68k.

    Usage:
      sim68k [ <program> ] [ -j | --json ] [ -n N | --num_inst N ] [ -s ADDR | --start ADDR ] [ -t TRACK | --track TRACK ]
      sim68k (-h | --help)
      sim68k(-v | --version)

    Options:
      -j, --json                  Inputfile is Json
      -t TRACK, --track TRACK     List of regs, status bits, and symbols to track
      -n N, --num_inst N          Number of instructions to execute 
      -s ADDR, --start ADDR       Specify hex start address (default is 2000)
      -h --help                   Show this screen.
      -v --version                Program version

)";

using namespace std;

#define checkopt(v) (args.count(v) && args[v].isBool() && args[v].asBool())
#define checkopts(v) (args.count(v) && args[v].isString())

int main(int argc, const char** argv)
{
    std::map<std::string, docopt::value> args
        = docopt::docopt(USAGE,
                         { argv + 1, argv + argc },
                         true,             // show help if requested
                         "Sim68K 0.0");  // version string

    auto instructions = (long) -1;
    auto start = string("2000");
    auto track = string("");

    if(checkopts("--num_inst")) {
      instructions = stol(args["--num_inst"].asString());
    } else {
      instructions = 10;
    }

    if(checkopts("--start")) {
      start = args["--start"].asString();
    }

    if(checkopts("--track")) {
      track = args["--track"].asString();
    }

    try {

      string program;

      if(not checkopts("<program>")) {
        program = shell::catin();
      } else {
        auto program_name = args["<program>"].asString();
        program = shell::cat(program_name);
      }

      if(checkopt("--json")) {
          string error;
          auto complete = json11::Json::parse(program, error);
          program = complete["object"].string_value();
          addSymbols(complete["sym"]);
          initTracked(track);
      }

      setupSimulation(); 
      auto res = run(program, instructions, true, start);
      printTrace(res);
    }
    catch(char const *e) {
      cout << "Exception: " << e << '\n';
      cout << "Aborting" << '\n';
      exit(1);
    }


    return 0;
}
