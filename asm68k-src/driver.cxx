#include "driver.hxx"
#include "debug.hxx"

using namespace std;

string objectFile;

extern "C" void initializeObject() {
	debugm("Initializing object file");
	objectFile="";
}

extern "C" void addObj(const char *str) {
	debugm("New object data: " + string(str));
	objectFile = objectFile + string(str);
}

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
    shell::to(outputName, objectFile);
  } else {
    fclose(listFile);
  }

  return true;
}