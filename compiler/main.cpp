#include <iostream>
#include <stdio.h>

extern "C" {
  int yyparse();
  void yyerror(const char *);
  int yylex();
}
extern int yylineno;

int main(){
  int result = yyparse();
  if(result==0)
    std::cout << "Input parsed correctly" << std::endl;
  else
    std::cout <<"Input parsed incorrectly" << std::endl;
  std::cout << "No of lines : " << yylineno;
  return result;
}
