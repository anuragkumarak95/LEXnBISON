%option noyywrap
%{
#include "grammer.tab.h"
int yylineno = 1;
%}

alpha             [a-zA-Z]
ws                [ \r\t\v\f]
name              {alpha}([0-9]*{alpha}*)+
comment           ([\/\/].*)|(\/(\\*)(.*(\n)*)*(\\*)\/)

%%

{name}         { return NAME; }

{comment}      //No response to any commented section.
{ws}           //No response to any whitespace category token.

"("            { return BRA ; }
")"            { return KET ; }
"->"           { return ARROW; }
":"            { return COLON; }
"{"            { return BO;    }
"}"            { return DY;    }

\n               ++yylineno; //increment line count accordingly.
