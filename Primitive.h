#pragma once
#include "glm/glm.hpp"
#include "Ray.h"
#include "Material.h"

using namespace glm;

class Triangle;

struct AABB
{
  AABB(const vec3& a_min, const vec3& a_max)
  : _min(a_min), _max(a_max) { }
  AABB(){}
  vec3 _min, _max;
  float padding[2];

  static AABB CreateFromTriangle(const Triangle& _Tri);
  static AABB CreateFromTriangles(Triangle** _Tris, int _Count);
  void Draw2D();
};

class Primitive
{
public:
  Primitive() : material(nullptr) {}
  virtual void Intersect(Ray& _Ray) = 0;
  virtual void Draw2D() = 0;
  Material* material;				// primitive material
};