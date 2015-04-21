%{
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "Token.h"
#include "Tree.h"

extern void yyerror(char* message);
extern int yylex(void);
extern int yyparse(void);

%}

%union {
	int ival;	/* NUMBER */
	int opval;	/* ADDOP MULOP */
	Tree *tval;
}

%left <opval> 	ADDOP
%left <opval> 	MULOP
%token <ival>	NUMBER

%type <tval> expr

%%

expr_list
	: expr_list expr '\n' 
		{ $2->print(0); 
		  fprintf(stderr, "Value = %d\n", eval($2)); }
	| expr '\n' 
		{ $1->print(0); 
		  fprintf(stderr, "Value = %d\n", eval($1)); }

expr 
	: expr ADDOP expr 
		{ $$ = new Tree(Token(ADDOP,$2),$1,$3); }
	| expr MULOP expr 
		{ $$ = new Tree(Token(MULOP,$2),$1,$3); }
	| '(' expr ')'
		{ $$ = $2; }
	| NUMBER
		{ $$ = new Tree(Token(NUMBER,$1),nullptr,nullptr); }
	;

%%
