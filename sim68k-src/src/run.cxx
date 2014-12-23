#include "cpu/m68000.hxx"
#include "devices/DeviceRegistry.hxx"
#include "loader/Loader.hxx"
#include "lib/json11/json11.hpp"
#include <vector>
#include <numeric>
#include <map>
#include "lib/debug.hxx"

auto debug = Debug("run");

using namespace std;

static vector<int> range(int x,int y) { 
	vector<int> v(y-x+1);
	iota(begin(v), end(v), x);
	return v;
}

using namespace json11;

auto processor = new m68000;
auto loader = new Loader(*processor);
auto registry = new DeviceRegistry;

BasicDevice *ram;

void setupSimulation() {
	registry->Create("RAM", "BaseAddress = 0 Size = 20000", (*processor), ram);
	processor->addressSpace(0).AttachDevice(ram);
}

/* Warning, this assumes there are no two values with the same key */
Json indexBy(Json j1, string key) {
	Json::object ret; 
	for(const auto v: j1.array_items()) {
		auto kk = v[key].string_value();
		ret[kk] = v;
	}
	return ret;
}

Json diff(Json j1, Json j2) {
	vector<Json> rdiff;
	auto ji1 = indexBy(j1.array_items(), "name");
	auto ji2 = indexBy(j2.array_items(), "name");

	for(const auto v: j1.array_items()) {

		auto element = v["name"].string_value();

		if(ji1[element] != ji2[element]) {
			rdiff.push_back(Json::object {
				{ "register", Json::object {
					{ "name"   , element }      ,
					{ "before" , ji1[element]["value"] } ,
					{ "after"  , ji2[element]["value"] }}
				}
			});
		}
	}
	return rdiff;
}

Json getRegisters() {
	vector<Json> regs;
	for(auto t: range(0, (processor->myNumberOfRegisters) - 1)) {

		auto data  = processor->ourRegisterData[t];
		auto pname = data.name;
		auto value = processor->register_value[t] & data.mask;
		auto desc  = data.description;

		regs.push_back(Json::object {
			{ "name", pname },
			{ "value", (int) value }
		});
	}
	return regs;
}

string extractMnemonic(string traceMessage) {
	smatch sm;
	debug("Current trace #{traceMessage}");
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

Json run(string program, long instructions, bool json) {
	vector<Json> inst;
	int n = 0;

	auto ls = loader->Load(program.c_str(), 0);

	if(ls != "") {
		throw "Error loading file";
	}

	processor->Reset();
	processor->SetRegister("PC", "2000");
	auto prev = getRegisters();
	bool continuate = true;
	do {
		auto val = execInstruction();
		auto regs = getRegisters();
		inst.push_back(Json::object {
			{ "instruction", val }, 
			{ "delta", diff(prev, regs) }
		});
		prev = regs;
		n = n + 1;

		if((val["state"] != "OK") || n >= instructions) {
			continuate = false;
		}
	} while(continuate);

	return Json::array(inst);
}