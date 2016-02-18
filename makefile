all:
	${MAKE} grammar
	${MAKE} lex
	gcc -c compiler/grammer.tab.c compiler/lex.yy.c
	mv grammer.tab.o bin
	mv lex.yy.o bin
	ar rvs bin/lexgram.a bin/grammer.tab.o bin/lex.yy.o
	g++ -std=c++11 -Wall -Wextra compiler/main.cpp bin/lexgram.a

	${MAKE} run

grammar:
	bison -d compiler/grammer.y
	mv grammer.tab.h compiler
	mv grammer.tab.c compiler

lex:
	flex compiler/lex.l
	mv lex.yy.c compiler

run:
	a < test/test.code
