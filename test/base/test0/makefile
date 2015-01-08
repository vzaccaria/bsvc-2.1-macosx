
all: test.h68

test.h68: test.s
	@../../../bin/asm68k test.s > test.h68

test.txt: test.h68
	@../../../bin/sim68k test.h68 > test.txt

test: 
	@make clean
	@make test.txt
	@diff-files test.txt test.txt.ref -m "Test SIM - 1"

clean:
	@rm -f test.h68 test.txt
