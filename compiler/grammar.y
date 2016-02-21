%{
#include <math.h>
#include<iostream>
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<memory>
#include "SyntaxTree/Includes.hpp"

extern char *yytext;
extern int yylineno;
int yylex (void);
void yyerror (char const *);
std::unique_ptr<compiler::SyntaxTree> root;
%}

%define api.value.type {compiler::SyntaxTree *}

%token NAME BRA KET ARROW COLON BO DY ASSIGN SEMI PRINT

%token TYPE
%token NUMBER_LITERAL STRING_LITERAL

%start input

%%

input       :  func funcs                                                       {root.reset(new compiler::Input($1,$2));}
            ;

funcs       : func funcs                                                        {$$ = new compiler::Functions($1,$2);}
            | %empty                                                            {$$ = nullptr;}
            ;

func        : name COLON type ARROW BRA params KET BO statements DY             {$$ = new compiler::Function($1,$6,$9);}
            ;

statements  : statements statement                                              {$$ = new compiler::Statements($1,$2);}
            | %empty                                                            {$$ = nullptr;}
            ;

statement   : variable                                                          {$$ = new compiler::Statement($1);}
            | print                                                             {$$ = new compiler::Statement($1);}
            ;

print       : PRINT name SEMI                                                   {$$ = $2;}
            ;

params      : params param                                                      { $$ = new compiler::Params($1,$2);}
            | %empty                                                            { $$ = nullptr;}
            ;

param       : name COLON type                                                   { $$ = new compiler::Variable($1);} // similar to a variable declaration but only for using as a function param.
            ;

variable    : name COLON type ASSIGN value                                      {$$ = new compiler::Variable($1,$5);}
            | name COLON type                                                   {$$ = new compiler::Variable($1);}
            ;

name        :NAME                                                               {$$ =new compiler::Name(yytext);}
            ;

type        : TYPE                                                              {}
            ;

value       : STRING_LITERAL                                                    {$$ = new compiler::Value("str",yytext);}
            | NUMBER_LITERAL                                                    {$$ = new compiler::Value("int",yytext);}
            ;

%%
#include "lex.yy.c"

//print the error also in the final target program source code.
void yyerror (char const *x){
 printf("#include <stdio.h>\n");
 printf("int main(){");
    printf("printf(\"");
    printf("Error in line (%d) : %s",yylineno,x);
    printf("\\n\");");
 printf("}");
 exit(0);
}
