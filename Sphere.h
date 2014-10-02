#pragma once
#include "Primitive.h"
class Sphere : public Primitive
{
public:
  // constructors
  Sphere() {}
  Sphere(vec3 _Pos, float _Radius) : P(_Pos), r(_Radius) {}
  // methods
  void Intersect(Ray& _Ray);
  void Draw2D();
  // data members
  vec3 P;							// centre of sphere
  float r;						// sphere radius
};
