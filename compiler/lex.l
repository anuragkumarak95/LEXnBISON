%option noyywrap
%{
#include "grammar.tab.h"
#include "SyntaxTree/Includes.hpp"
int yylineno = 1;
%}

alpha             [a-zA-Z]
ws                [ \r\t\v\f]
name              {alpha}([0-9]*{alpha}*)+
string            [(\\").*(\\")]
digit             [0-9]
number            (-)?{digit}+

anything          .*
comment           ([\/\/]{anything}\n)

%%

{name}         { return NAME;}

{comment}      //No response to any commented section.
{ws}           //No response to any whitespace category token.

"("            { return BRA ;    }
")"            { return KET ;    }
"="            { return ASSIGN;  }
"->"           { return ARROW;   }
":"            { return COLON;   }
";"            { return SEMI;    }
"{"            { return BO;      }
"}"            { return DY;      }

"int"          { return INTEGER; }
"str"          { return STRING;  }


{number}       { return NUMBER_LITERAL;}
{string}       { return STRING_LITERAL;}


\n               ++yylineno;
