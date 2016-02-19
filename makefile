all:
	${MAKE} grammar
	${MAKE} lex
	g++ -std=gnu++11 -Wall -Wextra compiler/main.cpp compiler/grammar.tab.c
	${MAKE} runTest
grammar:
	bison -d compiler/grammar.y
	mv grammar.tab.* compiler

lex:
	flex compiler/lex.l
	mv lex.yy.* compiler

runTest:
	a < test/test.code
