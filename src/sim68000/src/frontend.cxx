#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include <iostream>

static const char USAGE[] =
R"(frontend.

    Usage:
      frontend run <program> [ -j | --json ] [ -n N | --num_inst N ]
      frontend (-h | --help)
      frontend (-v | --version)

    Options:
      -j --json             Output in json format
      -n N, --num_inst N    Number of instructions to execute 
      -h --help             Show this screen.
      -v --version          Program version

)";

using namespace std;

int main(int argc, const char** argv)
{
    auto i = "Prova";
    auto command = "Check this number #{i} out \n";


    std::map<std::string, docopt::value> args
        = docopt::docopt(USAGE,
                         { argv + 1, argv + argc },
                         true,             // show help if requested
                         "Frontend 0.0");  // version string

    auto program_name = args["<program>"].asString();
    auto instructions = (long) -1;

    if(args.count("--num_inst")) {
      instructions = stol(args["--num_inst"].asString());
    }

    for(auto const &v: args) {
      cout << v.first << " " << v.second << endl;
    }

    try {
      setupSimulation(); 
      auto res = run(program_name, instructions, true);
      for(auto v: res.array_items()) {
        cout << v.dump() << endl;
      }
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
