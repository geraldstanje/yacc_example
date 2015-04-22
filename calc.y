%{
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <memory>
#include "Token.h"
#include "Tree.h"

extern void yyerror(char* message);
extern int yylex(void);
extern int yyparse(void);

%}

%union {
	int ival;	/* NUMBER */
	int opval;	/* ADDOP MULOP */
	//Tree *tval;
  std::shared_ptr<Tree> tval;
}

%left <opval> 	ADDOP
%left <opval> 	MULOP
%token <ival>	NUMBER

%type <tval> expr

%%

expr_list
	: expr_list expr '\n' 
		{ $2.get()->print(0); 
		  fprintf(stderr, "Value = %d\n", eval($2.get())); }
	| expr '\n' 
		{ $1.get()->print(0); 
		  fprintf(stderr, "Value = %d\n", eval($1.get())); }

expr 
	: expr ADDOP expr 
		{ $$ = std::make_shared<decltype($$)>(new Tree(Token(ADDOP,$2),$1,$3)); }
	| expr MULOP expr 
		{ $$ = std::make_shared<decltype($$)>(new Tree(Token(MULOP,$2),$1,$3)); }
	| '(' expr ')'
		{ $$ = $2; }
	| NUMBER
		{ $$ = std::make_shared<decltype($$)>(new Tree(Token(NUMBER,$1),nullptr,nullptr)); }
	;

%%
