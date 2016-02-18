%{
#include <stdio.h>
#include <stdlib.h>
%}



%start lines

%token BRA KET NL
%%

lines     : line lines
          | line
          ;
line      : BRA KET NL
            {printf("hello by ");}
          ;


%%

#include "lex.yy.c"
