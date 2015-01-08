#include "driver.hxx"
#include "debug.hxx"
#include "json11.hpp"

using namespace std;
using namespace json11;

string objectFile;
string listingFile;

typedef map<string, Json> symbolTable;

symbolTable symTable;

extern "C" void defineSymbol(const char *sym, const int val) {
  symTable[sym] = val;
}

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

string assembleJson(string content) {
  auto ob = assembleObj(content);
  Json out = Json::object {
    { "object", ob }, 
    { "sym", symTable }
  };
  return out.dump();
}

