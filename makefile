all:
	${MAKE} grammar
	${MAKE} lex
	g++ -c compiler/grammar.tab.c compiler/lex.yy.c
	mv grammar.tab.o bin
	mv lex.yy.o bin
	ar rvs bin/lexgram.a bin/grammar.tab.o bin/lex.yy.o
	g++ -std=c++11 -Wall -Wextra compiler/main.cpp bin/lexgram.a

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
