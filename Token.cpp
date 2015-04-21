#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <iostream>
#include "Token.h"
#include "Tree.h"
#include "y.tab.hpp"

using namespace std;

void yyerror(char *);


int Token::getAttribute(int token_type) 
{ 
	switch(token_type) {
	case NUMBER:
		return attribute.ival;
	case ADDOP:
		return attribute.opval;
	case MULOP:
		return attribute.opval;
	default:
		yyerror("Error: getAttribute: unknown token type");
	}
}

void Token::setAttribute(int token_type, int v)
{ 
	switch(token_type) {
	case NUMBER:
		attribute.ival = v; 
		break;
	case ADDOP: case MULOP:
		attribute.opval = v; 
		break;
	default:
		yyerror("Error: setAttribute: unknown token type");
	}
}

void Token::show()
{
	switch(type) {
	case NUMBER:
		cerr << "NUM[" << attribute.ival << "]" << endl;
		break;
	case ADDOP:
		fprintf(stderr, "ADDOP[%c]\n", attribute.opval);
		break;
	case MULOP:
		fprintf(stderr, "MULOP[%c]\n", attribute.opval);
		break;
	default:
		yyerror("Error: show: unknown type");
	}
}
	

