

#ifndef DRIVER_HXX
#define DRIVER_HXX

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

extern bool process(std::string inputName, std::string outputName, bool isObj);
extern "C" void initializeObject();

#endif // DRIVER_HXX
