%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include "SyntaxTree/SyntaxTree.hpp"
int yylex (void);
void yyerror (char const *);
void speak(char const *);
%}
%define api.value.type {double}

%token NAME BRA KET ARROW COLON BO DY ASSIGN SEMI

%token INTEGER STRING
%token NUMBER_LITERAL STRING_LITERAL NAME


%start input

%%

input       :  funcs;

funcs       : func funcs
            | func;

func        : NAME COLON ARROW BRA KET BO DY{speak("hi");}
            | NAME COLON ARROW BRA KET BO statements DY{speak("hi");};

statements  : statements statement
            | statement;

statement   : NAME SEMI {};

exprs       : expr exprs
            | expr ;

expr        : NAME COLON type ASSIGN value
            | NAME COLON type
            ;

type        : INTEGER | STRING ;

value       : STRING_LITERAL | NUMBER_LITERAL ;
%%

std::unique_ptr<compiler::SyntaxTree> root;

#include "lex.yy.c"

void speak(char const *s){
  printf("hello %s\n",s);
}

void yyerror (char const *x){
 printf("Error --  %s\n",x);
 exit(1);
}
