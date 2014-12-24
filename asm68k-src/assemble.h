extern void processFile();

extern char* buildCompleteSourceFile(FILE* currentFile, char* currentFileName, FILE* completeFile, int level);

extern void strcap(char *, char *);
extern char *skipSpace(char *);

extern FILE *inFile;	/* Input file */
extern FILE *listFile;	/* Listing file */
extern FILE *objFile;	/* Object file */
extern char line[256];	/* Source line */
extern int errorCount, warningCount;	/* Number of errors and warnings */

extern char listFlag;		/* True if a listing is desired */
extern char objFlag;		/* True if an object code file is desired */
extern char xrefFlag;		/* True if a cross-reference is desired */
extern char cexFlag;		/* True is Constants are to be EXpanded */
extern char absLongFlag;	/* True if all long absolute addresses */

extern void initList(char *);
extern void initObj(char *);