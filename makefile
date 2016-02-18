all:
	${MAKE} grammar
	${MAKE} lex
	gcc -c compiler/grammer.tab.c compiler/lex.yy.c
	mv grammer.tab.o compiler
	mv lex.yy.o compiler
	ar rvs compiler/lexgram.a compiler/grammer.tab.o compiler/lex.yy.o
	g++ -std=c++11 -Wall -Wextra compiler/main.cpp compiler/lexgram.a
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
