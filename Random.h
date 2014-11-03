#pragma once
#include <random>
#include <ctime>
#include <functional>

using std::mt19937;
using std::uniform_real_distribution;

typedef mt19937                                     Engine;
typedef uniform_real_distribution<float>            Distribution;

class Random
{
public:
  static std::_Bind<false, void, Distribution, Engine> value;
private:
};