


#include <vector>
#include <numeric>
#include <map>
#include "lib/debug.hxx"
#include "lib/underscore.hxx"
#include "track.hxx"
#include <string>


using namespace json11;
using namespace std;

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
    regex re("(\\w+)\\.?(\\d)*(\\w)*");
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

Json getTitle(string track) {

}

void initTracked(string track) {
    for(auto s: _s::words(track, ",")) {
        addTracked(s);
    }
}

Json getTracked(m68000 *processor){

    /* Returns array of tuples:
        { "name": "name of symbol", "size": numeric_size_in_chars, "string": "string representation" }
     */
	vector<Json> res;
    // if (track != "")
    // {
    //     res.push_back(Json::object
    //     {
    //         { "name", "PIPPO" },
    //         { "size", 4 },
    //         { "string", "ABCD"}
    //     });
    // }
    return res;
}