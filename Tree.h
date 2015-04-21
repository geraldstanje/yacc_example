#ifndef TREE_H
#define TREE_H

#include "Token.h"

class Tree {
private:
	Token value;
	Tree *left;
	Tree *right;

public:
	Tree(Token v, Tree *l, Tree *r): value(v), left(l), right(r) {}
	~Tree() { left = right = NULL; }

	Token getValue() { return value; }
	Tree* getLeft() { return left; }
	Tree* getRight() { return right; }

	void setValue(Token v) { value = v; }
	void setLeft(Tree *l) { left = l; }
	void setRight(Tree *r) { right = r; }

	void print(int spaces);
	void print() { this->print(0); }

	friend int eval(Tree *t);

};

#endif

