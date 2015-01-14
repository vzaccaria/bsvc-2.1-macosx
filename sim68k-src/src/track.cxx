


#include <vector>
#include <numeric>
#include <map>
#include "lib/debug.hxx"
#include "lib/underscore.hxx"
#include "track.hxx"
#include <string>
#include <iomanip>
#include "format.h"
#include "run.hxx"
#include <set>

using namespace json11;
using namespace std;
using namespace fmt;

Json symbols;
map<string, Json> tracked;

void addSymbols(Json sym) {
    symbols = sym;
}

int getDefaultSize(string s) {
    if(s=="Z" || s=="V" || s=="C" || s=="N" || s=="X") {
        return 1;
    } else {
        return 16;
    }
}

int specSize(string s, string name) {
    if(s=="W") {
        return 16;
    } else {
        if(s=="L") {
            return 32;
        } else {
            if(s=="B") {
                return 8;
            } else {
                if(s=="b") {
                    return 1;
                } else {
                    return getDefaultSize(name);
                }
            }
        }
    }
}

void addTracked(string s) {
    /* #include <regex> */
    /* using namespace std; */
    regex re("(\\w+)\\.?(\\d*)(\\w*)");
    smatch m; 
    if(regex_match(s, m, re)) {
        if(m.size()>2) {
            auto name = m[1].str();
            long num = 1;
            if(m[2].str() != "") {
                num = stol(m[2].str());
            }
            auto spec = m[3].str();            
            tracked[name] = Json::object {
               { "name", name },
               { "size",  (int) (specSize(spec, name) * num) }
            };
            cout << tracked[name].dump() << endl;
        }
    }
}

void initTracked(string track) {
    for(auto s: _s::words(track, ",")) {
        addTracked(s);
    }
}

string getSymValue(m68000 *processor, unsigned long address, int size) {
    string res = "";
    auto & as = processor->addressSpace(0);
    for(int ss=0; ss<size; ss +=8) {
       unsigned long dta;
       as.Peek(address+(ss/8), dta, BYTE);
       res = res + format("{0:0<2x} ", dta);
    }
    return res;
}


set<string> architectureState = {   "N", "V", "X", "Z", 
                                    "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", 
                                    "A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7" 
                                    }; 

Json getTracked(m68000 *processor){

    vector<Json> res;
    for(auto t: tracked) {
        auto name = t.first;
        if(architectureState.count(name)) {
            auto value = getRegValue(name);
            auto size = 32;
            res.push_back(Json::object {
                { "name", name },
                { "size", size },
                { "string", fmt::format("{0:8x}", value) }
            });      
        } else {
            auto address = symbols[name].int_value();
            auto size = t.second["size"].int_value();
            auto value = getSymValue(processor, address, size);

            res.push_back(Json::object {
                { "name", name },
                { "address", address },
                { "addressHex", fmt::format("{0:x}", address)},
                { "size", size },
                { "string", value }
            });            
        }

    }

    return res;
}