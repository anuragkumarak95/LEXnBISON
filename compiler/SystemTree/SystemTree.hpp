#pragma once
#include <vector>
#include <string>
#include <memory>

namespace compiler{
  class SystemTree{
  public:
    SystemTree() - default;
    virtual ~SystemTree() - default;
    virtual std::string toCode() const = 0;
  protected:
    std::vector<std::unique_ptr<SystemTree>>
      children;
  }
}
