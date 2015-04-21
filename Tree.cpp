#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "Tree.h"

void Tree::print(int spaces) {
    for (int i=0; i<spaces; i++)
        fprintf(stderr, " ");

    value.show();

    if (left != NULL)
        left->print(spaces+4);
    if (right != NULL)
        right->print(spaces+4);
}

