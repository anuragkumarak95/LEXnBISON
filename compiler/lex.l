%option noyywrap
%{
#include "grammer.tab.h"
int yylineno = 1;
%}

alpha             [a-zA-Z]
ws                [ \r\t\v\f]
name              {alpha}([0-9]*{alpha}*)+

%%


{name}         { return NAME; }
"{"            { return BRA ; }
"}"            { return KET ; }
{ws}


\n               ++yylineno;

%%
