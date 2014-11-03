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

  void SetUVs(vec2 _UV0, vec2 _UV1, vec2 _UV2);

  vec3 GetBarycentricCoordinate();
  // data members
  vec3 v0, v1, v2;				// triangle vertices
  vec2 uv0, uv1, uv2;				// triangle uv coords
  vec3 n0, n1, n2;				// vert normals
  vec3 N;							// triangle normal
};
