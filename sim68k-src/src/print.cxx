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

void printMnemonic(string s) {
	cout << setfill(' ') << setw(16) << ' ';
	cout << setfill(' ') << setw(32) << left << s ;
}

void printDelta(string name, int v1, int v2) {
	cout << setfill(' ') << right << setw(4) << name << ':';
	printHex(v1,4);
	cout << " -> ";
	printHex(v2,4);

}

void printTrace(Json trace) {
	for(const auto i: trace.array_items()) {
		printHex(i["instruction"]["pc"].int_value());
		printMnemonic(i["instruction"]["mnemonic"].string_value());
		for(const auto x: i["delta"].array_items()) {
			auto d = x["register"];
			if(d["name"].string_value() != "PC") {
				printDelta(d["name"].string_value(), 
					d["before"].int_value(), 
					d["after"].int_value());
			}
		}
		cout << endl;
	}
}