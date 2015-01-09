#include "lib/json11/json11.hpp"

extern void setupSimulation();
extern json11::Json run(std::string program, long instructions, bool json, std::string start_address, std::string track); 