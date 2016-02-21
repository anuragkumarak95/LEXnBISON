#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Function : public SyntaxTree{
  public:
    Function(SyntaxTree *name,SyntaxTree *params,SyntaxTree *tree){
      children.push_back(name);
      children.push_back(params);
      children.push_back(tree);
    }
    virtual ~Function(){

    }
    virtual std::string toCode() const{
      std::string code;

      for(SyntaxTree *chk : children) { if(chk != nullptr){if(dynamic_cast<const compiler::Name*>(chk)){if(chk->toCode().compare("enter") != 0) return "";}}}

      code += "int main() {";
        for(SyntaxTree *node : children){
          if(node != nullptr){if(!dynamic_cast<const compiler::Name*>(node)) code += node->toCode();}
        }
      code += "}";

      return code;
    }

    bool checkVarUniqueness() const{
      for(SyntaxTree *node : children){
        if(dynamic_cast<compiler::Statements *>(node)){
          std::vector<std::string> varNames = dynamic_cast<compiler::Statements *>(node)->getAllVariables();

          for(std::string var : varNames){
            int counter=0;
            for(std::string otherVar : varNames){
              if(var.compare(otherVar)==0) counter++;

              if(counter>1) return false;
            }
          }
        }
      }

      return true;
    }

  };

}
