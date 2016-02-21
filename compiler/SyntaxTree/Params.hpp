#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Params : public SyntaxTree{
  public:
    Params(SyntaxTree *tree,SyntaxTree *otherTree){
      children.push_back(tree);
      children.push_back(otherTree);
    }
    virtual ~Params(){

    }
    virtual std::string toCode() const{
      std::string code;
      for(SyntaxTree *node : children){
        if(node != nullptr){code += "//"+node->toCode()+"\n";}
      }
      return code;
    }
  };

}
