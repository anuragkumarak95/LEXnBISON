%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
int yylex (void);
void yyerror (char const *);

void speak(char const *);
%}

%union{
  char const *s;
}

%token BRA KET ARROW COLON BO DY ASSIGN
%token INTEGER STRING
%token NUMBER_LITERAL STRING_LITERAL
%token<s> NAME

%start input

%%

input       :  funcs;

funcs       : func funcs
            | func;

func        : NAME COLON ARROW BRA KET BO DY{speak($1);}
            | NAME COLON ARROW BRA KET BO exprs DY{speak($1);};

exprs       : expr exprs
            | expr ;

expr        : NAME COLON type ASSIGN value
            | NAME COLON type
            ;

type        : INTEGER | STRING ;

value       : STRING_LITERAL | NUMBER_LITERAL ;
%%

#include "lex.yy.c"

void speak(char const *s){
  printf("hello %s\n",s);
}

void yyerror (char const *x){
 printf("Error --  %s\n",x);
 exit(1);
}
