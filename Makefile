CC = g++
YACC = yacc
LEX = lex
CXXFLAGS = -g -Wall -std=gnu++11
DFLAGS = -DDEBUG
YACCFLAGS = -dv
LECFLAGS = -l
#LIBDIR =
#LIBS = -ll -ly
SRC = y.tab.cpp lex.yy.cpp Token.cpp Tree.cpp Eval.cpp main.cpp
OBJ = y.tab.o lex.yy.o Token.o Tree.o Eval.o main.o
TARGET = main

all: $(TARGET) $(OBJ)

$(TARGET): $(OBJ)
	$(CC) $(CXXFLAGS) $(DFLAGS) -o $@ $(OBJ) 
#-L$(LIBDIR) $(LIBS)

.c.o:
	$(CC) $(CXXFLAGS) $(DFLAGS) -c $<

y.tab.cpp: calc.y
	$(YACC) -dv -o y.tab.cpp calc.y

lex.yy.cpp: calc.l
	$(LEX) -l -o lex.yy.cpp calc.l

clean:
	rm -f y.tab.* lex.yy.* y.output $(OBJ) $(TARGET)

