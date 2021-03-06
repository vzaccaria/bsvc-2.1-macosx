/******************************************************************************
 *
 *		GLOBALS.C
 *		Global Variable Declarations for 68000 Assembler
 *
 *      Author: Paul McKee
 *		ECE492    North Carolina State University
 *
 *        Date:	12/13/86
 *
 *   Copyright 1990-1991 North Carolina State University. All Rights Reserved.
 *
 ******************************************************************************
 * $Id: globals.c,v 1.1 1996/08/02 14:42:28 bwmott Exp $
 *****************************************************************************/


#include <stdio.h>
#include "asm.h"


/* General */

int loc;		/* The assembler's location counter */
char pass2;		/* Flag telling whether or not it's the second pass */
char endFlag;		/* Flag set when the END directive is encountered */


/* File pointers */


/* Listing information */

char line[256];		/* Source line */
int lineNum;		/* Source line number */
char *listPtr;		/* Pointer to buffer where a listing line is assembled */
char continuation;	/* TRUE if the listing line is a continuation */


/* Option flags with default values */

char listFlag = FALSE;	/* True if a listing is desired */
char objFlag = TRUE;	/* True if an object code file is desired */
char xrefFlag = FALSE;	/* True if a cross-reference is desired */
char cexFlag = FALSE;	/* True is Constants are to be EXpanded */
char absLongFlag = FALSE; /* True if all long absolute addresses */
