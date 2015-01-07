#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include "lib/shell.hxx"
#include <iostream>
#include "src/print.hxx"

static const char USAGE[] =
R"(sim68k.

    Usage:
      sim68k <program> [ -j | --json ] [ -n N | --num_inst N ] [ -s ADDR | --start ADDR] [ -i | --stdin ]
      sim68k (-h | --help)
      sim68k(-v | --version)

    Options:
      -j, --json              Inputfile is Json
      -i, --stdin             Inputfile is from stdin
      -n N, --num_inst N      Number of instructions to execute 
      -s ADDR, --start ADDR   Specify hex start address (default is 2000)
      -h --help               Show this screen.
      -v --version            Program version

)";

using namespace std;

#define checkopt(v) (args.count(v) && args[v].asBool())
#define checkopts(v) (args.count(v) && args[v].isString())

int main(int argc, const char** argv)
{
    std::map<std::string, docopt::value> args
        = docopt::docopt(USAGE,
                         { argv + 1, argv + argc },
                         true,             // show help if requested
                         "Sim68K 0.0");  // version string

    auto program_name = args["<program>"].asString();
    auto instructions = (long) -1;
    auto start = string("2000");

    if(checkopts("--num_inst")) {
      instructions = stol(args["--num_inst"].asString());
    } else {
      instructions = 10;
    }

    if(checkopts("--start")) {
      start = args["--start"].asString();
    }
    try {
      string program = shell::cat(program_name);
      if(checkopt("--json")) {
          string error;
          program = (json11::Json::parse(program, error))["object"].string_value();
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


    // if(args["--json"].asBool()) {
    //     cout << "Seems json was called" << "\n";
    // }
    // cout << program_name;

    return 0;
}
