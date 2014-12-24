#include "docopt.h"
#include "src/run.hxx"
#include "lib/debug.hxx"
#include <iostream>
#include "src/print.hxx"

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
  debugm("Input file: " + inputName + " -- Outputfile " + outputName + " ");
  /* This is declared in assemble */
  inFile = tmpfile();

  if(isObj) {
      listFlag = 0;
      objFlag = 0xFF;
      initObj(strdup(outputName.c_str()));
  } else {
      listFlag = 0xFF;
      objFlag = 0;
      initList(strdup(outputName.c_str()));
  }

  auto srcFileName = strdup(inputName.c_str());
  auto srcFile = fopen(srcFileName, "r");

  if(!inFile || !srcFile) {
    std::cerr << "Valid input srcFileName needed" << endl; exit(1);
  }

  auto error = buildCompleteSourceFile(srcFile, srcFileName, inFile, 1);

  if(error) {
    std::cerr << "Cannot build complete source" << endl; exit(1);
  }

  rewind(inFile);

  processFile();

  fclose(inFile);

  if(isObj) {
    finishObj();
  } else {
    fclose(listFile);
  }

  return false;
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
