#include "driver.hxx"
#include "debug.hxx"

using namespace std;

string objectFile;
string listingFile;

extern "C" void initializeObject() {
	objectFile="";
}

extern "C" void initializeList() {
  listingFile = "";
}

extern "C" void addObj(const char *str) {
	objectFile = objectFile + string(str);
}

extern "C" void addListing(const char *str) {
  listingFile = listingFile + string(str);
}

void assembleIt(string content) {
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
}

string assembleObj(string content) {
      listFlag = 0;
      objFlag = 0xFF;

      initObj();
      assembleIt(content);
      finishObj();

      return objectFile;
}

string assembleListing(string content) {
      listFlag = 0xFF;
      objFlag = 0;
      initList();
      assembleIt(content);
      return listingFile;
}

bool process(string inputName, string outputName, bool isObj) {

  if(isObj) {
      shell::to(outputName, assembleObj(shell::cat(inputName)));
  } else {
      shell::to(outputName, assembleListing(shell::cat(inputName)));
  }

  return true;
}