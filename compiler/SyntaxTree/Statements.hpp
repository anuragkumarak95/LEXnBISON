#pragma once
#include "Includes.hpp"
#include "Variable.hpp"

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


    //function: to get all the variable names inside a single vector of string recursively.
    std::vector<std::string> getAllVariables(){
      std::vector<std::string> varNames;
      for(SyntaxTree *node : children){
        if(node!=nullptr && dynamic_cast<compiler::Statement *>(node)){
          for(SyntaxTree *varnode : node->getChildren()){
            //TODO : error if use Name class here, expected type specifier error occures. check why.
            if(varnode!=nullptr && dynamic_cast<compiler::Name *>(varnode)) {
              varNames.push_back(varnode->toCode());
            }
          }
        }
        //recursive calling of function to reach all the stored variables.
        else if(node!=nullptr && dynamic_cast<compiler::Statements *>(node)){
            for(std::string strnode : dynamic_cast<compiler::Statements *>(node)->getAllVariables()){
              varNames.push_back(strnode);
            }
          }

      }

      return varNames;
    }

  };
}
