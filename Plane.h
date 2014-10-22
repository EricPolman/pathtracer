#pragma once
#include "Primitive.h"

class Plane : public Primitive
{
public:
  // constructors
  Plane() { material = new Material; }
  Plane(vec3& _N, float _Dist) : N(_N), dist(_Dist) { material = new Material; }
  Plane(vec3 _V0, vec3 _V1, vec3 _V2);
  // methods
  void Intersect(Ray& _Ray);
  void Draw2D();
  // data members
  vec3 N;							// plane normal
  float dist;						// distance of plane from (0,0,0)
};