
all: test

test.txt: test.s
	@../../../bin/asm68k -j test.s | ../../../bin/sim68k -j -t 'D0,SR:Z,SR:N,SUM.W,COUNT.W' -n 100 > test.txt

test: 
	@make clean
	@make test.txt
	@diff-files test.txt test.txt.ref -m "Test SIM - 3"

clean:
	@rm -f test.txt
