#pragma once
#include "Primitive.h"

class Scene
{
public:
  // constructor
  Scene();
  void Draw2D();
  void Intersect(Ray& _Ray);
  void IntersectShadow(Ray& _Ray, float _Length);
  // data members
  Primitive** primList;
  int primCount;

  Primitive** lightList;
  int lightCount;
};
