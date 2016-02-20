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

      for(SyntaxTree *chk : children) { if(chk != nullptr){if(dynamic_cast<const compiler::Name*>(chk)){if(chk->toCode().compare("enter") != 0) return "";}}}
      
      code += "int main() {";
        for(SyntaxTree *node : children){
          if(node != nullptr){if(!dynamic_cast<Name *>(node)) code += node->toCode();}
        }
      code += "}";

      return code;
    }
  };

}
