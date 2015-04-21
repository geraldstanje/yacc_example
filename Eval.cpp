#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <iostream>
#include "Token.h"
#include "Tree.h"
#include "y.tab.hpp"

using namespace std;

void yyerror(char *);


int eval(Tree *t) {
    assert(t != NULL);

    int lvalue, rvalue;

    switch(t->getValue().getType()) {
    case NUMBER:
        return t->getValue().getAttribute(NUMBER);
    case ADDOP:
        lvalue = eval(t->getLeft());
        rvalue = eval(t->getRight());
        if (t->getValue().getAttribute(ADDOP) == '+')
            return lvalue + rvalue;
        else if (t->getValue().getAttribute(ADDOP) == '-')
            return lvalue - rvalue;
        else yyerror("eval: bad ADDOP attribute");
    case MULOP:
        lvalue = eval(t->getLeft());
        rvalue = eval(t->getRight());
        if (t->getValue().getAttribute(MULOP) == '*')
            return lvalue * rvalue;
        else if (t->getValue().getAttribute(MULOP) == '/')
            return lvalue / rvalue;		// insert divide-by-zero check here
        else yyerror("eval: bad MULOP attribute");
    default:
        yyerror("eval: unknown token type");
    }
}


