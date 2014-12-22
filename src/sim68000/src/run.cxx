#include "cpu/m68000.hxx"
#include "devices/DeviceRegistry.hxx"
#include "loader/Loader.hxx"
#include "lib/json11/json11.hpp"
#include <vector>

using namespace json11;

auto processor = new m68000;
auto loader = new Loader(*processor);
auto registry = new DeviceRegistry;

BasicDevice *ram;

void setupSimulation() {
	registry->Create("RAM", "BaseAddress = 0 Size = 20000", (*processor), ram);
	processor->addressSpace(0).AttachDevice(ram);
}

Json execInstruction() {
	string current_trace_message;
	auto pc = processor->ValueOfProgramCounter();
	auto state = processor->ExecuteInstruction(current_trace_message, true);
	return Json::object {
		{ "state", state },
		{ "pc", (int) pc },
		{ "trace", current_trace_message }
	};
}

Json run(string program, long instructions, bool json) {
	std::vector<Json> inst;
	int n = 0;

	auto ls = loader->Load(program.c_str(), 0);

	if(ls != "") {
		throw "Error loading file";
	}

	processor->SetRegister("PC", "2000");
	bool continuate = true;
	do {
		auto val = execInstruction();
		inst.push_back(val);
		n = n + 1;

		if((val["state"] != "OK") || n >= instructions) {
			continuate = false;
		}
	} while(continuate);

	return Json::array(inst);
}