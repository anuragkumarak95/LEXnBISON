#pragma once
#include "SyntaxTree.hpp"

namespace compiler{
  class Value :  public SyntaxTree{
  public:
    Value( std::string type, std::string value){
      this->value = value;
      this->type = type;
      //printf("//value gathered : %s of type  \n",this->value);
    }

    virtual ~Value() = default;

    virtual std::string toCode() const{
      //return string value inside the quotes.
      if(type == "str")return value.substr(1,value.length()-2);
      //return integer.
      else return value;
    }
  private:
    std::string type,value;
  };

}
