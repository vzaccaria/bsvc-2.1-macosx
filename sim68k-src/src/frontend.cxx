#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include <iostream>
#include "src/print.hxx"

static const char USAGE[] =
R"(sim68k.

    Usage:
      sim68k <program> [ -j | --json ] [ -n N | --num_inst N ]
      sim68k (-h | --help)
      sim68k(-v | --version)

    Options:
      -j --json             Output in json format
      -n N, --num_inst N    Number of instructions to execute 
      -h --help             Show this screen.
      -v --version          Program version

)";

using namespace std;

int main(int argc, const char** argv)
{
    std::map<std::string, docopt::value> args
        = docopt::docopt(USAGE,
                         { argv + 1, argv + argc },
                         true,             // show help if requested
                         "Sim68K 0.0");  // version string

    auto program_name = args["<program>"].asString();
    auto instructions = (long) -1;

    if(args.count("--num_inst") && args["--num_inst"].isString()) {
      instructions = stol(args["--num_inst"].asString());
    } else {
      instructions = 10;
    }

    try {
      setupSimulation(); 
      auto res = run(program_name, instructions, true);
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
