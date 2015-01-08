
all: test

test.txt: test.s
	@../../../bin/asm68k test.s | ../../../bin/sim68k > test.txt

test: 
	@make clean
	@make test.txt
	@diff-files test.txt test.txt.ref -m "Test SIM - 2"

clean:
	@rm -f test.txt
