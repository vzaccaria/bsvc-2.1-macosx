#include "cpu/m68000.hxx"
#include "devices/DeviceRegistry.hxx"
#include "loader/Loader.hxx"
#include "lib/json11/json11.hpp"
#include <vector>
#include <numeric>
#include <map>
#include "lib/debug.hxx"
#include "lib/underscore.hxx"
#include "track.hxx"

auto debug = Debug("run");

using namespace std;

static vector<int> range(int x,int y) { 
	vector<int> v(y-x+1);
	iota(begin(v), end(v), x);
	return v;
}

using namespace json11;
using namespace _;

auto processor = new m68000;
auto loader = new Loader(*processor);
auto registry = new DeviceRegistry;

BasicDevice *ram;

void setupSimulation() {
	registry->Create("RAM", "BaseAddress = 0 Size = 20000", (*processor), ram);
	processor->addressSpace(0).AttachDevice(ram);
}



Json diff(Json j1, Json j2) {
	vector<Json> rdiff;
	auto ji1 = indexBy(j1, "name");
	auto ji2 = indexBy(j2, "name");

	return compact(jmap(j1, lambda(Json v) -> Json {

		auto element = v["name"].string_value();

		if(ji1[element] != ji2[element]) {
			return (Json::object {
				{ "register", Json::object {
					{ "name"   , element }      ,
					{ "before" , ji1[element]["value"] } ,
					{ "after"  , ji2[element]["value"] }}
				}
			});
		} else {
			return Json();
		}

	}));
}

#define FLAG(V, FNAME) ((int) (V & processor->FNAME) ? 1 : 0)

Json getRegisters() {
	vector<Json> regs;
	for(auto t: range(0, (processor->myNumberOfRegisters) - 1)) {

		auto data  = processor->ourRegisterData[t];
		auto pname = data.name;
		auto value = processor->register_value[t] & data.mask;
		auto desc  = data.description;

		if(pname != string("SR")) {
			regs.push_back(Json::object {
				{ "name", pname },
				{ "value", (int) value }
			});
		} else {
			regs.push_back(Json::object {
				{ "name", "C"}, { "value", FLAG(value, C_FLAG) }
			});
			regs.push_back(Json::object {
				{ "name", "Z"}, { "value", FLAG(value, Z_FLAG) }
			});			
			regs.push_back(Json::object {
				{ "name", "N"}, { "value", FLAG(value, N_FLAG) }
			});		
			regs.push_back(Json::object {
				{ "name", "V"}, { "value", FLAG(value, V_FLAG) }
			});		
			regs.push_back(Json::object {
				{ "name", "X"}, { "value", FLAG(value, X_FLAG) }
			});		
		}
	}
	return regs;
}

string extractMnemonic(string traceMessage) {
	smatch sm;
	regex re("Mnemonic \\{([^\\}]*)\\}", std::regex_constants::ECMAScript | std::regex_constants::icase);
	auto res = regex_search(traceMessage, sm, re);
	if(sm.size() > 1)
		return sm[1];
	else 
		return "";
}

Json execInstruction() {
	string current_trace_message;
	auto pc       = processor->ValueOfProgramCounter();
	auto state    = processor->ExecuteInstruction(current_trace_message, true);
	auto mnemonic = extractMnemonic(current_trace_message);
	return Json::object {
		{ "state", state },
		{ "pc", (int) pc },
		{ "mnemonic", mnemonic }
	};
}

Json run(string program, long instructions, bool json, string start_address, string track="") {
	vector<Json> inst;
	int n = 0;

	auto ls = loader->Load(program.c_str(), 0);

	if(ls != "") {
		throw "Error loading file";
	}

	debugm("Tracking " + track);

	processor->Reset();
	processor->SetRegister("PC", start_address);

	auto prev = getRegisters();
	bool continuate = true;
	do {
		auto val = execInstruction();
		auto regs = getRegisters();
		auto trackedValues = getTracked(processor, track);
		inst.push_back(Json::object {
			{ "instruction", val }, 
			{ "delta", diff(prev, regs) },
			{ "tracked", trackedValues }
		});
		prev = regs;
		n = n + 1;

		if((val["state"] != "OK") || n >= instructions) {
			continuate = false;
		}
	} while(continuate);

	return Json::array(inst);
}