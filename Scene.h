#pragma once
#include "Primitive.h"

class Scene
{
public:
  // constructor
  Scene();
  void Draw2D();
  void Intersect(Ray& _Ray);
  // data members
  Primitive** primList;
  int primCount;
};
