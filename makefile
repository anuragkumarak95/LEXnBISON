all:
	${MAKE} clean
	${MAKE} grammar
	${MAKE} lex
	${MAKE} compile
	${MAKE} run

grammar:
	bison -d compiler/grammar.y
	mv grammar.tab.* compiler

lex:
	flex compiler/lex.l
	mv lex.yy.* compiler

run:
	./bin/a.exe < test/test.code > compiled/result.cpp
	-g++ compiled/result.cpp -o compiled/result.exe
	-./compiled/result.exe

clean:
	-rm -f compiled/*.*
	-rm -f compiler/grammar.tab.*
	-rm -f compiler/lex.yy.*
	-rm -f bin/*.*

compile:
	g++ -std=gnu++11 -Wall -Wextra compiler/main.cpp compiler/grammar.tab.c
	mv a.exe bin
