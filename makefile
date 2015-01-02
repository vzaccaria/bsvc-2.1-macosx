.DEFAULT_GOAL := all

.build/1-docopt.o: sim68k-src/lib/docopt/docopt.cpp
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/docopt/docopt.cpp -o .build/1-docopt.o

.build/2-json11.o: sim68k-src/lib/json11/json11.cpp
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/json11/json11.cpp -o .build/2-json11.o

.build/3-decode.o: sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/cpu/decode.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/cpu/decode.cxx -o .build/3-decode.o

.build/4-exec.o: sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/cpu/exec.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/cpu/exec.cxx -o .build/4-exec.o

.build/5-m68000.o: sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/cpu/m68000.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/cpu/m68000.cxx -o .build/5-m68000.o

.build/6-DeviceRegistry.o: sim68k-src/devices/DeviceRegistry.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/DeviceRegistry.cxx -o .build/6-DeviceRegistry.o

.build/7-M68681.o: sim68k-src/devices/M68681.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/M68681.cxx -o .build/7-M68681.o

.build/8-RAM.o: sim68k-src/devices/RAM.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/RAM.cxx -o .build/8-RAM.o

.build/9-Timer.o: sim68k-src/devices/Timer.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/devices/Timer.cxx -o .build/9-Timer.o

.build/10-Loader.o: sim68k-src/loader/Loader.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/loader/Loader.cxx -o .build/10-Loader.o

.build/11-frontend.o: sim68k-src/src/frontend.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/frontend.cxx -o .build/11-frontend.o

.build/12-print.o: sim68k-src/src/print.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/print.cxx -o .build/12-print.o

.build/13-run.o: sim68k-src/src/run.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/src/run.cxx -o .build/13-run.o

.build/14-AddressSpace.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/AddressSpace.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/AddressSpace.cxx -o .build/14-AddressSpace.o

.build/15-BasicCPU.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BasicCPU.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BasicCPU.cxx -o .build/15-BasicCPU.o

.build/16-BasicDevice.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BasicDevice.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BasicDevice.cxx -o .build/16-BasicDevice.o

.build/17-BasicDeviceRegistry.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BasicDeviceRegistry.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BasicDeviceRegistry.cxx -o .build/17-BasicDeviceRegistry.o

.build/18-BreakpointList.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/BreakpointList.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/BreakpointList.cxx -o .build/18-BreakpointList.o

.build/19-Event.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Event.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Event.cxx -o .build/19-Event.o

.build/20-Interface.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Interface.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Interface.cxx -o .build/20-Interface.o

.build/21-RegInfo.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/RegInfo.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/RegInfo.cxx -o .build/21-RegInfo.o

.build/22-StatInfo.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/StatInfo.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/StatInfo.cxx -o .build/22-StatInfo.o

.build/23-Time.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Time.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Time.cxx -o .build/23-Time.o

.build/24-Tools.o: sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/Framework/Tools.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/Framework/Tools.cxx -o .build/24-Tools.o

.build/linked0.x: .build/1-docopt.o .build/2-json11.o .build/3-decode.o .build/4-exec.o .build/5-m68000.o .build/6-DeviceRegistry.o .build/7-M68681.o .build/8-RAM.o .build/9-Timer.o .build/10-Loader.o .build/11-frontend.o .build/12-print.o .build/13-run.o .build/14-AddressSpace.o .build/15-BasicCPU.o .build/16-BasicDevice.o .build/17-BasicDeviceRegistry.o .build/18-BreakpointList.o .build/19-Event.o .build/20-Interface.o .build/21-RegInfo.o .build/22-StatInfo.o .build/23-Time.o .build/24-Tools.o
	clang++ $^  -o $@

./bin: 
	mkdir -p ./bin

./bin/sim68k: .build/linked0.x ./bin
	cp .build/linked0.x $@

.build/26-assemble.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/assemble.c
	clang   -c asm68k-src/assemble.c -o .build/26-assemble.o

.build/27-build.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/build.c
	clang   -c asm68k-src/build.c -o .build/27-build.o

.build/28-codegen.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/codegen.c
	clang   -c asm68k-src/codegen.c -o .build/28-codegen.o

.build/29-directive.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/directive.c
	clang   -c asm68k-src/directive.c -o .build/29-directive.o

.build/30-error.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/error.c
	clang   -c asm68k-src/error.c -o .build/30-error.o

.build/31-eval.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/eval.c
	clang   -c asm68k-src/eval.c -o .build/31-eval.o

.build/32-globals.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/globals.c
	clang   -c asm68k-src/globals.c -o .build/32-globals.o

.build/33-include.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/include.c
	clang   -c asm68k-src/include.c -o .build/33-include.o

.build/34-instlookup.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/instlookup.c
	clang   -c asm68k-src/instlookup.c -o .build/34-instlookup.o

.build/35-insttable.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/insttable.c
	clang   -c asm68k-src/insttable.c -o .build/35-insttable.o

.build/36-listing.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/listing.c
	clang   -c asm68k-src/listing.c -o .build/36-listing.o

.build/37-movem.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/movem.c
	clang   -c asm68k-src/movem.c -o .build/37-movem.o

.build/38-object.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/object.c
	clang   -c asm68k-src/object.c -o .build/38-object.o

.build/39-opparse.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/opparse.c
	clang   -c asm68k-src/opparse.c -o .build/39-opparse.o

.build/40-symbol.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/symbol.c
	clang   -c asm68k-src/symbol.c -o .build/40-symbol.o

.build/41-main.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 asm68k-src/main.cxx
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ asm68k-src/main.cxx -o .build/41-main.o

.build/42-docopt.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 sim68k-src/lib/docopt/docopt.cpp
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/docopt/docopt.cpp -o .build/42-docopt.o

.build/43-json11.o: asm68k-src/asm.h asm68k-src/assemble.h asm68k-src/codegen.h asm68k-src/directive.h asm68k-src/error.h asm68k-src/listing.h asm68k-src/object.h examples/MatrixMultiply.h68 examples/example.h68 examples/myproc.h68 examples/timer.h68 examples/tutor.h68 sim68k-src/Framework/AddressSpace.hxx sim68k-src/Framework/BasicCPU.hxx sim68k-src/Framework/BasicDevice.hxx sim68k-src/Framework/BasicDeviceRegistry.hxx sim68k-src/Framework/BasicLoader.hxx sim68k-src/Framework/BreakpointList.hxx sim68k-src/Framework/Event.hxx sim68k-src/Framework/Interface.hxx sim68k-src/Framework/RegInfo.hxx sim68k-src/Framework/StatInfo.hxx sim68k-src/Framework/Time.hxx sim68k-src/Framework/Tools.hxx sim68k-src/cpu/m68000.hxx sim68k-src/cpu/m68000DecodeTable.hxx sim68k-src/devices/DeviceRegistry.hxx sim68k-src/devices/M68681.hxx sim68k-src/devices/RAM.hxx sim68k-src/devices/Timer.hxx sim68k-src/lib/debug.hxx sim68k-src/lib/docopt/docopt.h sim68k-src/lib/docopt/docopt_private.h sim68k-src/lib/docopt/docopt_util.h sim68k-src/lib/docopt/docopt_value.h sim68k-src/lib/json11/json11.hpp sim68k-src/lib/shell.hxx sim68k-src/lib/underscore.hxx sim68k-src/lib/verbalexpressions.hpp sim68k-src/loader/Loader.hxx sim68k-src/src/print.hxx sim68k-src/src/run.hxx test/base/test0/test.h68 test/base/test1/test.h68 sim68k-src/lib/json11/json11.cpp
	clang++ -c -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ sim68k-src/lib/json11/json11.cpp -o .build/43-json11.o

.build/linked25.x: .build/26-assemble.o .build/27-build.o .build/28-codegen.o .build/29-directive.o .build/30-error.o .build/31-eval.o .build/32-globals.o .build/33-include.o .build/34-instlookup.o .build/35-insttable.o .build/36-listing.o .build/37-movem.o .build/38-object.o .build/39-opparse.o .build/40-symbol.o .build/41-main.o .build/42-docopt.o .build/43-json11.o
	clang++ $^  -o $@

./bin/asm68k: .build/linked25.x ./bin
	cp .build/linked25.x $@

.build/45-assemble.o: asm68k-src/assemble.c
	clang   -c asm68k-src/assemble.c -o .build/45-assemble.o

.build/46-build.o: asm68k-src/build.c
	clang   -c asm68k-src/build.c -o .build/46-build.o

.build/47-codegen.o: asm68k-src/codegen.c
	clang   -c asm68k-src/codegen.c -o .build/47-codegen.o

.build/48-directive.o: asm68k-src/directive.c
	clang   -c asm68k-src/directive.c -o .build/48-directive.o

.build/49-error.o: asm68k-src/error.c
	clang   -c asm68k-src/error.c -o .build/49-error.o

.build/50-eval.o: asm68k-src/eval.c
	clang   -c asm68k-src/eval.c -o .build/50-eval.o

.build/51-globals.o: asm68k-src/globals.c
	clang   -c asm68k-src/globals.c -o .build/51-globals.o

.build/52-include.o: asm68k-src/include.c
	clang   -c asm68k-src/include.c -o .build/52-include.o

.build/53-instlookup.o: asm68k-src/instlookup.c
	clang   -c asm68k-src/instlookup.c -o .build/53-instlookup.o

.build/54-insttable.o: asm68k-src/insttable.c
	clang   -c asm68k-src/insttable.c -o .build/54-insttable.o

.build/55-listing.o: asm68k-src/listing.c
	clang   -c asm68k-src/listing.c -o .build/55-listing.o

.build/56-movem.o: asm68k-src/movem.c
	clang   -c asm68k-src/movem.c -o .build/56-movem.o

.build/57-object.o: asm68k-src/object.c
	clang   -c asm68k-src/object.c -o .build/57-object.o

.build/58-opparse.o: asm68k-src/opparse.c
	clang   -c asm68k-src/opparse.c -o .build/58-opparse.o

.build/59-symbol.o: asm68k-src/symbol.c
	clang   -c asm68k-src/symbol.c -o .build/59-symbol.o

.build/60-main.o: asm68k-src/old/main.c
	clang   -c asm68k-src/old/main.c -o .build/60-main.o

.build/linkedc44.x: .build/45-assemble.o .build/46-build.o .build/47-codegen.o .build/48-directive.o .build/49-error.o .build/50-eval.o .build/51-globals.o .build/52-include.o .build/53-instlookup.o .build/54-insttable.o .build/55-listing.o .build/56-movem.o .build/57-object.o .build/58-opparse.o .build/59-symbol.o .build/60-main.o
	clang $^  -o $@

./bin/oldasm68k: .build/linkedc44.x ./bin
	cp .build/linkedc44.x $@

.PHONY : build
build: bin/sim68k bin/asm68k bin/oldasm68k

.PHONY : cmd-61
cmd-61: 
	make build

.PHONY : cmd-seq-62
cmd-seq-62: 
	make cmd-61

.PHONY : all
all: cmd-seq-62

.PHONY : clean-63
clean-63: 
	rm -rf .build/1-docopt.o .build/2-json11.o .build/3-decode.o .build/4-exec.o .build/5-m68000.o .build/6-DeviceRegistry.o .build/7-M68681.o .build/8-RAM.o .build/9-Timer.o .build/10-Loader.o .build/11-frontend.o .build/12-print.o .build/13-run.o .build/14-AddressSpace.o .build/15-BasicCPU.o .build/16-BasicDevice.o .build/17-BasicDeviceRegistry.o .build/18-BreakpointList.o .build/19-Event.o .build/20-Interface.o .build/21-RegInfo.o .build/22-StatInfo.o .build/23-Time.o .build/24-Tools.o .build/linked0.x ./bin ./bin/sim68k .build/26-assemble.o .build/27-build.o .build/28-codegen.o .build/29-directive.o .build/30-error.o .build/31-eval.o .build/32-globals.o .build/33-include.o .build/34-instlookup.o .build/35-insttable.o .build/36-listing.o .build/37-movem.o .build/38-object.o .build/39-opparse.o .build/40-symbol.o .build/41-main.o .build/42-docopt.o .build/43-json11.o .build/linked25.x ./bin/asm68k .build/45-assemble.o .build/46-build.o .build/47-codegen.o .build/48-directive.o .build/49-error.o .build/50-eval.o .build/51-globals.o .build/52-include.o .build/53-instlookup.o .build/54-insttable.o .build/55-listing.o .build/56-movem.o .build/57-object.o .build/58-opparse.o .build/59-symbol.o .build/60-main.o .build/linkedc44.x ./bin/oldasm68k

.PHONY : clean-64
clean-64: 
	rm -rf .build

.PHONY : clean-65
clean-65: 
	mkdir -p .build

.PHONY : clean
clean: clean-63 clean-64 clean-65
