#pragma once
#include "glm/glm.hpp"
#include "Ray.h"
#include "Material.h"

using namespace glm;

class Triangle;

struct AABB
{
  AABB(const vec3& _min, const vec3& _max)
  : boundMin(_min), boundMax(_max) { }

  vec3 boundMin, boundMax;
  float padding[2];

  static AABB CreateFromTriangle(const Triangle& _Tri);
  static AABB CreateFromTriangles(Triangle** _Tris, int _Count);
  void Draw2D();
};

class Primitive
{
public:
  Primitive() : material(new Material()) {}
  virtual void Intersect(Ray& _Ray) = 0;
  virtual void Draw2D() = 0;
  Material* material;				// primitive material
};