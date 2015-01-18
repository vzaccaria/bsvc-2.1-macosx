
        org $1000

V       dc.b 'parola lunga'
        dc.b 0
DIM_V   dc.l 12
N       dc.l 0
C       dc.b 'a'
I       ds.l 1 

        org $1100

MAIN    clr.l I 
        movea.l #V,A0
        move.l  DIM_V,D0
WHILE   cmp.l I,D0
        ble DOPO_WHILE 
        move.l I,D1
        move.b 0(A0,D1),D2
        cmp.b C,D2 
        bne FINE_IF 
        addi.l #1,N
FINE_IF addi.l #1,I 
        bra WHILE
DOPO_WHILE break

