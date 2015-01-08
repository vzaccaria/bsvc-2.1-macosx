#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include <iostream>
#include "src/print.hxx"
#include "lib/shell.hxx"
#include "lib/underscore.hxx"
#include "driver.hxx"

extern "C" {
  #include "assemble.h"
  #include "object.h"
}

static const char USAGE[] =
R"(asm68k.

    Usage:
      asm68k <program> [ -j | --json ] [ -l | --listing ] 
      asm68k (-h | --help)
      asm68k (-v | --version)

    Options:
      -j, --json                    Produce object executable and symtable in json
      -l, --listing                 Produce program listing out
      -o <file>, --output <file>    Output filename
      -h, --help                    Show this screen.
      -v, --version                 Program version

)";

using namespace std;


#define checkopt(v) (args.count(v) && args[v].asBool())


using std::regex;
using std::regex_replace;

int main(int argc, const char** argv)
{
    std::map<std::string, docopt::value> args
        = docopt::docopt(USAGE,
                         { argv + 1, argv + argc },
                         true,             // show help if requested
                         "Asm68k 0.0");  // version string

    auto produceJson = false;
    auto input = args["<program>"].asString();


    string inputfile = shell::cat(input);
    string result;

    if(checkopt("--json")) {
      result = assembleJson(inputfile);
    } else {
        if(checkopt("--listing")) {
          result = assembleListing(inputfile);
        } else {
          result = assembleObj(inputfile);
        }
    }

    cout << result << endl;
}
