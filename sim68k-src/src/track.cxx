


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
vector<Json> tracked;

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
    regex re("([\\:\\w']+)\\.?(\\d*)(\\w*)");
    smatch m; 
    if(regex_match(s, m, re)) {
        if(m.size()>2) {
            auto name = m[1].str();
            long num = 1;
            if(m[2].str() != "") {
                num = stol(m[2].str());
            }
            auto spec = m[3].str();            
            tracked.push_back(Json::object {
               { "name", name },
               { "size",  (int) (specSize(spec, name) * num) }
            });
        }
    } else {
        throw ("Invalid format specifier for " + s);
    }
}

set<string> architectureState;

void initTracked(string track) {
    for(auto s: _s::words(track, ",")) {
        addTracked(s);
    }
    architectureState = { "SR:N", "SR:V", "SR:X", "SR:Z", "PC",
                          "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", 
                          "A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A7'"};
}

string getSymValue(m68000 *processor, unsigned long address, int size) {
    string res = "";
    auto & as = processor->addressSpace(0);
    for(int ss=0; ss<size; ss +=8) {
       unsigned long dta;
       as.Peek(address+(ss/8), dta, BYTE);
       if(dta > 0) {
            res = res + format("{0:0>2x} ", dta);
       } else {
            res = res + format("{0:<2} ", "");
       }
    }
    return res;
}

Json getTracked(m68000 *processor){
    static bool first = true;

    vector<Json> res;
    for(auto t: tracked) {
        auto name = t["name"].string_value();

        if(architectureState.count(name)) {

            auto value = getRegValue(name);

            auto size = lambda() {
                if(_s::regex1(name, "(SR:.)") != "") 
                    return 1;
                else 
                    return 32;
            }();

            string sval;

            sval = lambda() {
                    if(first  && (size == 1))  return fmt::format("{0:>4}"  , name);
                    if(first  && (size > 1 ))  return fmt::format("{0:>8}"  , name);
                    if(!first && (size == 1))  return fmt::format("{0:>4x}" , value);
                    return fmt::format("{0:8x}" , value);
                }();
            res.push_back(Json::object {
                    { "name", name },
                    { "size", size },
                    { "string", sval } });
       } else {
            auto address = symbols[name].int_value();
            auto size = t["size"].int_value();
            auto value = getSymValue(processor, address, size);

            auto sval = lambda() {
                auto fs = "{:<" + to_string(size/8 * 3) + "}"; /* See upper function */
                if(first) return fmt::format(fs, name);
                return fmt::format("{}", value);
            } ();

            res.push_back(Json::object {
                { "name", name },
                { "address", address },
                { "addressHex", fmt::format("{0:x}", address)},
                { "size", size },
                { "string", sval }
            });            
        }

    }
    first = false;
    return res;
}