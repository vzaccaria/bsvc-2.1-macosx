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
      asm68k <program> [ -j | --json ] [ -l | --listing ] [ [ -o <file> | --output <file> ] | [ -s | --stdout ] ]
      asm68k (-h | --help)
      asm68k (-v | --version)

    Options:
      -j, --json                    Produce object executable and symtable in json
      -l, --listing                 Produce program listing out
      -s, --stdout                  Dump to terminal instead of file
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
    auto output = input;

    output = regex_replace(output, regex("\\.s"), ".h68");

    if(args.count("--output") && args["--output"].isString()) {
          output = args["--output"].asString();
    }

    string outputName;
    string inputfile = shell::cat(input);
    string result;

    if(checkopt("--json")) {

      outputName = regex_replace(output, regex("\\.h68"), ".json");
      result = assembleJson(inputfile);

    } else {

        if(checkopt("--listing")) {

          result = assembleListing(inputfile);
          outputName = regex_replace(output, regex("\\.h68"), ".lis");

        } else {

          outputName = output;
          result = assembleObj(inputfile);
          
        }
    }

    if(!checkopt("--stdout")) {
      shell::to(outputName, result);
    } else {
      cout << result << endl;
    }


    return 0;
}
