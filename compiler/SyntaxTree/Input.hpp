#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Input : public SyntaxTree{
  public:
    Input(SyntaxTree *tree,SyntaxTree *otherTree){
      children.push_back(tree);
      children.push_back(otherTree);
    }
    virtual ~Input(){

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
