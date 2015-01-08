
all: test.h68

test.h68: test.s
	@../../../bin/asm68k test.s > test.h68

test.txt: test.h68
	@../../../bin/asm68k -l test.s > test.lis
	@cp test.lis test.txt

test: 
	@make clean
	@make test.txt
	@diff-files test.txt test.txt.ref -m "Test ASM - 1"

clean:
	@rm -f test.h68 test.txt test.lis
