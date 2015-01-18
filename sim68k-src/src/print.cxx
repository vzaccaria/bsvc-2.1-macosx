#include "lib/json11/json11.hpp"
#include <vector>
#include <numeric>
#include <map>
#include "lib/debug.hxx"
#include <iomanip>

using namespace json11;
using namespace std;

void printHex(int v, int n=8) {
	cout << right << setfill(' ') << setw(n) << hex << v ;
}

void printString(string v, int n=8) {
	cout << right << setfill(' ') << setw(n) << v ;
}

void space() {
	cout << "  ";
}

void printMnemonic(string s) {
	cout << setfill(' ') << setw(16) << ' ';
	cout << setfill(' ') << setw(32) << left << s ;
}

void printDelta(string name, int v1, int v2) {
	cout << setfill(' ') << right << setw(4) << name << ':';
	printHex(v1,2);
	cout << " -> ";
	printHex(v2,2);

}


string compactMnemonic(string s) {
	/* #include <regex> */
	/* using namespace std; */
	s = regex_replace(s, regex("A5 A4 A3 A2 A1 A0 D7 D6 D5 D4 D3 D2 D1 D0"), "A0-A6/D0-D7");
	s = regex_replace(s, regex("D0 D1 D2 D3 D4 D5 D6 D7 A0 A1 A2 A3 A4 A5"), "D0-D7/A0-A6");
	return s;

}



void printTrace(Json trace, bool tracked) {

	for(const auto i: trace.array_items()) {
		printHex(i["instruction"]["pc"].int_value());
		printMnemonic(compactMnemonic(i["instruction"]["mnemonic"].string_value()));

		if(!tracked) {
				for(const auto x: i["delta"].array_items()) {
					auto d = x["register"];
					if(d["name"].string_value() != "PC") {
						printDelta(d["name"].string_value(), 
							d["before"].int_value(), 
							d["after"].int_value());
					}
				}
		} else {
		
				for(const auto j: i["tracked"].array_items()) {
					auto name=j["name"].string_value();
					auto value=j["string"].string_value();
					auto size=j["size"].int_value();
					printString(value, size/8);
					space();
				}
		}

		cout << endl;
	}
}