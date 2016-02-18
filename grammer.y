%{
#include <stdio.h>
#include <stdlib.h>
%}



%start line

%token BRA KET NL
%%

line      : BRA KET NL
            {printf("hello by ");}
            ;


%%

#include "lex.yy.c"
