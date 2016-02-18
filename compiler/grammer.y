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

%token BRA KET ARROW COLON BO DY
%token<s> NAME

%start input

%%

input      :  line;

line        : line line;
            | NAME COLON ARROW BRA KET BO DY{speak($1);};
            | NAME COLON ARROW BRA KET BO line DY{speak($1);};

%%

#include "lex.yy.c"

void speak(char const *s){
  printf("hello %s\n",s);
}

void yyerror (char const *x){
 printf("Error --  %s\n",x);
 exit(1);
}
