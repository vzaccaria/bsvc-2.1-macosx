* -----------------------------------------------------------
* Title         : Test procedure calls
* Written by    : Vittorio Zaccaria
* Date          : Dec 2014
* Description   : Test procedure definition and call 
* 
* License: BSD
* -----------------------------------------------------------
* (note, use tabs for spacing. Labels always on BOL)

START			ORG $2000	
					MOVEA.L #$8000,A7
					MOVE #3,-(A7)
					BSR FUN 
					MOVE (A7)+,D3
					JSR PROGEND
    

FUN_LOCVAR_SIZE	EQU  0
FUN_PAR_SIZE 		EQU  4

FUN 				LINK A6,#-1*FUN_LOCVAR_SIZE 
					MOVEM D0-D7/A0-A5,-(A7)

					MOVE 8(A6),D0
					ADD #1,D0
					MOVE D0,8(A6)

					MOVEM (A7)+,D0-D7/A0-A5
					UNLK A6
					RTS


PROGEND     BREAK    
    
* ------------------------------------
* Variables 











