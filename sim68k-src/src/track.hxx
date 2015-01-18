#include "cpu/m68000.hxx"
#include "lib/json11/json11.hpp"

json11::Json getTracked(m68000 *processor);
void addSymbols(json11::Json sym);
void initTracked(string  s);