#pragma once
#include <vector>
#include <string>

namespace compiler{
  class SyntaxTree{
  public:
    SyntaxTree() = default;
    virtual ~SyntaxTree() = default;
    virtual std::string toCode() const = 0;
    virtual std::vector<SyntaxTree *> getChildren(){
      return children;
    }
  protected:
    std::vector<SyntaxTree *>
      children;
  };

}
