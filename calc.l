%{
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "Token.h"
#include "Tree.h"
#include "y.tab.hpp"
%}

number		[0-9]+
whitespace	[ \t]+

%%

{number}		{ fprintf(stderr, "NUM[%d]", yylval.ival = atoi(yytext)); return NUMBER; }
"+"				{ fprintf(stderr, "ADDOP[%c]", yylval.opval = yytext[0]); return ADDOP; }
"-"				{ fprintf(stderr, "ADDOP[%c]", yylval.opval = yytext[0]); return ADDOP; }
"*"				{ fprintf(stderr, "MULOP[%c]", yylval.opval = yytext[0]); return MULOP; }
"/"				{ fprintf(stderr, "MULOP[%c]", yylval.opval = yytext[0]); return MULOP; }
{whitespace}	{ ; }
\n				{ fprintf(stderr, "%c", yytext[0]); return yytext[0]; }
.				{ fprintf(stderr, "{%c}", yytext[0]); return yytext[0]; }

%%

void yyerror(char *msg)
{
	fprintf(stderr, "Error: %s\n", msg);
	exit(1);
}

int yywrap (void)
{
    return 1;
}