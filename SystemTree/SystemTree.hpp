#pragma once
#include <vector>

namespace compiler{
  class SystemTree{
  public:
    SystemTree(){

    }
    ~SystemTree(){

    }
  private:
    std::vector<std::unique_ptr<SystemTree>>
      children;
  }
}
