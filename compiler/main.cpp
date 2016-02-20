#include <iostream>
#include <stdio.h>
#include "SyntaxTree/SyntaxTree.hpp"
#include <memory>

extern int yyparse();
extern int yylineno;
extern std::unique_ptr<compiler::SyntaxTree> root;


int main(){
  int result = yyparse();
  std::cout<< root->toCode() << std::endl;
  return result;
}
