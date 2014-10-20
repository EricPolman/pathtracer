#pragma once
#include "Primitive.h"

class Triangle : public Primitive
{
public:
  // constructors
  Triangle() {}
  Triangle(vec3 _V0, vec3 _V1, vec3 _V2);
  // methods
  void Intersect(Ray& _Ray);
  void Draw2D();

  vec3 GetBarycentricCoordinate();
  // data members
  vec3 v0, v1, v2;				// triangle vertices
  vec3 P;				
  vec3 N;							// triangle normal
};
