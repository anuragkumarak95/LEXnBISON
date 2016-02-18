all:
	${MAKE} grammar
	${MAKE} lex
	g++ -std=gnu++11 -Wall -Wextra compiler/main.cpp compiler/grammar.tab.c

	${MAKE} run

grammar:
	bison -d compiler/grammar.y
	mv grammar.tab.h compiler
	mv grammar.tab.c compiler

lex:
	flex compiler/lex.l
	mv lex.yy.c compiler

run:
	a < test/test.code
