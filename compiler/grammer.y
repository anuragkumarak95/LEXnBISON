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

%token BRA KET
%token<s> NAME

%start input

%%

input      :  line;

line        :  NAME BRA KET{speak($1);};
            | NAME BRA line KET{speak($1);};

%%

#include "lex.yy.c"

void speak(char const *s){
  printf("hello %s\n",s);
}

void yyerror (char const *x){
 printf("Error --  %s\n",x);
 exit(1);
}
