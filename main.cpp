#include <stdio.h>
#include <stdlib.h>

extern int yyparse();
extern FILE *yyin;

int main() {
	yyin = fopen("input.txt", "r+");
	if (!yyin) {
		fprintf(stderr, "error: opening file");
		exit(1);
	}
	
    yyparse();
    fclose(yyin);
	
	return 0;
}