#pragma once
#include "Primitive.h"
class Sphere : public Primitive
{
public:
  // constructors
  Sphere() { material = new Material; }
  Sphere(vec3 _Pos, float _Radius) : P(_Pos), r(_Radius) { material = new Material; }
  // methods
  void Intersect(Ray& _Ray);
  void Draw2D();
  // data members
  vec3 P;							// centre of sphere
  float r;						// sphere radius
};
