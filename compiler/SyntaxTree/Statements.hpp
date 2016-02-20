#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Statements : public SyntaxTree{
  public:
    Statements(SyntaxTree *tree,SyntaxTree *otherTree){
      children.push_back(tree);
      children.push_back(otherTree);
    }
    virtual ~Statements(){

    }
    virtual std::string toCode() const{
      std::string code;
      for(SyntaxTree *node : children){
        if(node != nullptr){code += node->toCode();}
      }
      return code;
    }
  };

}
