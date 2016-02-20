%{
#include <math.h>
#include<iostream>
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<memory>
#include "SyntaxTree/Includes.hpp"
extern char *yytext;
int yylex (void);
void yyerror (char const *);
void speak(char const *);

std::unique_ptr<compiler::SyntaxTree> root;
%}

%define api.value.type {compiler::SyntaxTree *}

%token NAME BRA KET ARROW COLON BO DY ASSIGN SEMI NAME PRINT

%token INTEGER STRING
%token NUMBER_LITERAL STRING_LITERAL


%start input

%%

input       :  func funcs                                                       {root.reset(new compiler::Input($1,$2));}
            ;

funcs       : func funcs                                                        {$$ = $1;}
            | %empty                                                            {$$ = nullptr;}
            ;

func        : NAME COLON type ARROW BRA KET BO statements DY                    {$$ = new compiler::Function($1,$8);}
            ;

statements  : statements statement                                              {$$ = new compiler::Statements($1,$2);}
            | %empty                                                            {$$ = nullptr;}
            ;

statement   : expr                                                              {$$ = new compiler::Statement($1);}
            | print                                                             {$$ = new compiler::Statement($1);}
            ;

print       : PRINT name SEMI                                                   {$$ = $2;}
            ;

name        :NAME                                                               {$$ =new compiler::Name(yytext);}
            ;

expr        : name COLON type ASSIGN value                                      {$$ = $1;}
            | name COLON type                                                   {$$ = $1;}
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
