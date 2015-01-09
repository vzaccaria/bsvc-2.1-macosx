


#include <vector>
#include <numeric>
#include <map>
#include "lib/debug.hxx"
#include "lib/underscore.hxx"
#include "track.hxx"


using namespace json11;
using namespace std;


Json getTracked(m68000 *processor, string track){
    /* Returns array of tuples:
        { "name": "name of symbol", "size": numeric_size_in_chars, "string": "string representation" }
     */
	vector<Json> res;
    if (track != "")
    {
        res.push_back(Json::object
        {
            { "name", "PIPPO" },
            { "size", 4 },
            { "string", "ABCD"}
        });
    }
    return res;
}