#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Variable : public SyntaxTree{
  public:
    Variable(SyntaxTree *name,SyntaxTree *value){
      children.push_back(name);
      children.push_back(value);
    }
    Variable(SyntaxTree *name){
      children.push_back(name);
    }
    virtual ~Variable(){

    }
    virtual std::string toCode() const{
      std::string code;

        for(SyntaxTree *node : children){
          if(node != nullptr){
            if(dynamic_cast<const compiler::Name*>(node))code += "variable : "+node->toCode();
            else code += " : "+node->toCode();
          }
        }

      return code;
    }
  };

}
