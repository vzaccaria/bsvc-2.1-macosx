.DEFAULT_GOAL := all

.build/1-docopt.o: sim68k-src/lib/docopt/docopt.cpp
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/docopt/docopt.cpp -o .build/1-docopt.o

.build/2-json11.o: sim68k-src/lib/json11/json11.cpp
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/json11/json11.cpp -o .build/2-json11.o

.build/3-decode.o: sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/cpu/decode.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/cpu/decode.cxx -o .build/3-decode.o

.build/4-exec.o: sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/cpu/exec.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/cpu/exec.cxx -o .build/4-exec.o

.build/5-m68000.o: sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/cpu/m68000.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/cpu/m68000.cxx -o .build/5-m68000.o

.build/6-DeviceRegistry.o: sim68k-src/devices/DeviceRegistry.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/DeviceRegistry.cxx -o .build/6-DeviceRegistry.o

.build/7-M68681.o: sim68k-src/devices/M68681.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/M68681.cxx -o .build/7-M68681.o

.build/8-RAM.o: sim68k-src/devices/RAM.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/RAM.cxx -o .build/8-RAM.o

.build/9-Timer.o: sim68k-src/devices/Timer.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/Timer.cxx -o .build/9-Timer.o

.build/10-Loader.o: sim68k-src/loader/Loader.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/loader/Loader.cxx -o .build/10-Loader.o

.build/11-frontend.o: sim68k-src/src/print.hxx sim68k-src/src/run.hxx sim68k-src/src/track.hxx sim68k-src/src/frontend.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/frontend.cxx -o .build/11-frontend.o

.build/12-print.o: sim68k-src/src/print.hxx sim68k-src/src/run.hxx sim68k-src/src/track.hxx sim68k-src/src/print.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/print.cxx -o .build/12-print.o

.build/13-run.o: sim68k-src/src/print.hxx sim68k-src/src/run.hxx sim68k-src/src/track.hxx sim68k-src/src/run.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/run.cxx -o .build/13-run.o

.build/14-track.o: sim68k-src/src/print.hxx sim68k-src/src/run.hxx sim68k-src/src/track.hxx sim68k-src/src/track.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/track.cxx -o .build/14-track.o

.build/15-AddressSpace.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/AddressSpace.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/AddressSpace.cxx -o .build/15-AddressSpace.o

.build/16-BasicCPU.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BasicCPU.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BasicCPU.cxx -o .build/16-BasicCPU.o

.build/17-BasicDevice.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BasicDevice.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BasicDevice.cxx -o .build/17-BasicDevice.o

.build/18-BasicDeviceRegistry.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BasicDeviceRegistry.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BasicDeviceRegistry.cxx -o .build/18-BasicDeviceRegistry.o

.build/19-BreakpointList.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BreakpointList.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BreakpointList.cxx -o .build/19-BreakpointList.o

.build/20-Event.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Event.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Event.cxx -o .build/20-Event.o

.build/21-Interface.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Interface.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Interface.cxx -o .build/21-Interface.o

.build/22-RegInfo.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/RegInfo.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/RegInfo.cxx -o .build/22-RegInfo.o

.build/23-StatInfo.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/StatInfo.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/StatInfo.cxx -o .build/23-StatInfo.o

.build/24-Time.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Time.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Time.cxx -o .build/24-Time.o

.build/25-Tools.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Tools.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Tools.cxx -o .build/25-Tools.o

.build/26-format.o: sim68k-src/lib/cppformat/format.cc
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/cppformat/format.cc -o .build/26-format.o

.build/linked0.x: .build/1-docopt.o .build/2-json11.o .build/3-decode.o .build/4-exec.o .build/5-m68000.o .build/6-DeviceRegistry.o .build/7-M68681.o .build/8-RAM.o .build/9-Timer.o .build/10-Loader.o .build/11-frontend.o .build/12-print.o .build/13-run.o .build/14-track.o .build/15-AddressSpace.o .build/16-BasicCPU.o .build/17-BasicDevice.o .build/18-BasicDeviceRegistry.o .build/19-BreakpointList.o .build/20-Event.o .build/21-Interface.o .build/22-RegInfo.o .build/23-StatInfo.o .build/24-Time.o .build/25-Tools.o .build/26-format.o
	clang++ $^  -o $@

./bin: 
	mkdir -p ./bin

./bin/sim68k: .build/linked0.x ./bin
	cp .build/linked0.x $@

.build/28-assemble.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/assemble.c
	clang   -c asm68k-src/assemble.c -o .build/28-assemble.o

.build/29-build.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/build.c
	clang   -c asm68k-src/build.c -o .build/29-build.o

.build/30-codegen.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/codegen.c
	clang   -c asm68k-src/codegen.c -o .build/30-codegen.o

.build/31-directive.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/directive.c
	clang   -c asm68k-src/directive.c -o .build/31-directive.o

.build/32-error.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/error.c
	clang   -c asm68k-src/error.c -o .build/32-error.o

.build/33-eval.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/eval.c
	clang   -c asm68k-src/eval.c -o .build/33-eval.o

.build/34-globals.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/globals.c
	clang   -c asm68k-src/globals.c -o .build/34-globals.o

.build/35-include.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/include.c
	clang   -c asm68k-src/include.c -o .build/35-include.o

.build/36-instlookup.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/instlookup.c
	clang   -c asm68k-src/instlookup.c -o .build/36-instlookup.o

.build/37-insttable.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/insttable.c
	clang   -c asm68k-src/insttable.c -o .build/37-insttable.o

.build/38-listing.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/listing.c
	clang   -c asm68k-src/listing.c -o .build/38-listing.o

.build/39-movem.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/movem.c
	clang   -c asm68k-src/movem.c -o .build/39-movem.o

.build/40-object.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/object.c
	clang   -c asm68k-src/object.c -o .build/40-object.o

.build/41-opparse.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/opparse.c
	clang   -c asm68k-src/opparse.c -o .build/41-opparse.o

.build/42-symbol.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/driver.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h asm68k-src/symbol.c
	clang   -c asm68k-src/symbol.c -o .build/42-symbol.o

.build/43-driver.o: asm68k-src/driver.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp asm68k-src/driver.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ asm68k-src/driver.cxx -o .build/43-driver.o

.build/44-main.o: asm68k-src/driver.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp asm68k-src/main.cxx
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ asm68k-src/main.cxx -o .build/44-main.o

.build/45-docopt.o: sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/docopt/docopt.cpp
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/docopt/docopt.cpp -o .build/45-docopt.o

.build/46-json11.o: sim68k-src/lib/json11/json11.hpp sim68k-src/lib/json11/json11.cpp
	clang++ -c -Isim68k-src/lib/cppformat -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/json11/json11.cpp -o .build/46-json11.o

.build/linked27.x: .build/28-assemble.o .build/29-build.o .build/30-codegen.o .build/31-directive.o .build/32-error.o .build/33-eval.o .build/34-globals.o .build/35-include.o .build/36-instlookup.o .build/37-insttable.o .build/38-listing.o .build/39-movem.o .build/40-object.o .build/41-opparse.o .build/42-symbol.o .build/43-driver.o .build/44-main.o .build/45-docopt.o .build/46-json11.o
	clang++ $^  -o $@

./bin/asm68k: .build/linked27.x ./bin
	cp .build/linked27.x $@

.PHONY : build
build: bin/sim68k bin/asm68k

.PHONY : cmd-47
cmd-47: 
	make build

.PHONY : cmd-48
cmd-48: 
	DEBUG_COLORS=no DEBUG=* ./test/test.sh

.PHONY : cmd-49
cmd-49: 
	./bin/asm68k ./examples/example.s -j | DEBUG_COLORS=no DEBUG=* ./bin/sim68k -j -t "SUM.2L"

.PHONY : cmd-seq-50
cmd-seq-50: 
	make cmd-47
	make cmd-48
	make cmd-49

.PHONY : all
all: cmd-seq-50

.PHONY : clean-51
clean-51: 
	rm -rf .build/1-docopt.o .build/2-json11.o .build/3-decode.o .build/4-exec.o .build/5-m68000.o .build/6-DeviceRegistry.o .build/7-M68681.o .build/8-RAM.o .build/9-Timer.o .build/10-Loader.o .build/11-frontend.o .build/12-print.o .build/13-run.o .build/14-track.o .build/15-AddressSpace.o .build/16-BasicCPU.o .build/17-BasicDevice.o .build/18-BasicDeviceRegistry.o .build/19-BreakpointList.o .build/20-Event.o .build/21-Interface.o .build/22-RegInfo.o .build/23-StatInfo.o .build/24-Time.o .build/25-Tools.o .build/26-format.o .build/linked0.x ./bin ./bin/sim68k .build/28-assemble.o .build/29-build.o .build/30-codegen.o .build/31-directive.o .build/32-error.o .build/33-eval.o .build/34-globals.o .build/35-include.o .build/36-instlookup.o .build/37-insttable.o .build/38-listing.o .build/39-movem.o .build/40-object.o .build/41-opparse.o .build/42-symbol.o .build/43-driver.o .build/44-main.o .build/45-docopt.o .build/46-json11.o .build/linked27.x ./bin/asm68k

.PHONY : clean-52
clean-52: 
	rm -rf .build

.PHONY : clean-53
clean-53: 
	mkdir -p .build

.PHONY : clean
clean: clean-51 clean-52 clean-53
