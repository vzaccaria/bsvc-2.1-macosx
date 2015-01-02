#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include <iostream>
#include "src/print.hxx"
#include "lib/shell.hxx"
#include "lib/underscore.hxx"

extern "C" {
  #include "assemble.h"
  #include "object.h"
}

static const char USAGE[] =
R"(asm68k.

    Usage:
      asm68k <program> [ -j | --json ] [ -l | --listing ] [ -o <file> | --output <file> ]
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


bool process(string inputName, string outputName, bool isObj) {

  if(isObj) {
      listFlag = 0;
      objFlag = 0xFF;
      initObj(strdup(outputName.c_str()));
  } else {
      listFlag = 0xFF;
      objFlag = 0;
      initList(strdup(outputName.c_str()));
  }


  auto content = shell::cat(inputName);
  auto v = _s::words(content, "\n");

  for(auto & l: v) {
    l = l + "\n";
  }

  /* Pass 1 */ 
  nInitProcessText();
  for(const auto & c: v) {
    nProcessLine(c.c_str(), false);
  }

  /* Pass 2 */
  nInitProcessText();
  for(const auto & c: v) {
    nProcessLine(c.c_str(), true);
  }

  /* Emit */
  if(isObj) {
    finishObj();
  } else {
    fclose(listFile);
  }

  return true;
}

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

    auto outputListing = regex_replace(output, regex("\\.h68"), ".lis");

    if(args.count("--listing") && args["--listing"].asBool()) {
      process(input, outputListing, false);
    } else {
      process(input, output, true);
    }


    return 0;
}
