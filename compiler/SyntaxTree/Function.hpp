#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Function : public SyntaxTree{
  public:
    Function(SyntaxTree *name,SyntaxTree *tree){
      children.push_back(name);
      children.push_back(tree);
    }
    virtual ~Function(){

    }
    virtual std::string toCode() const{
      std::string code;
      code += "#include <stdio.h>\n";
      code += "int main() {";
        for(SyntaxTree *node : children){
          if(node != nullptr){code += node->toCode();}
        }
      code += "}";

      return code;
    }
  };

}
