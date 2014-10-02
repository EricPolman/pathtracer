#pragma once
#include "glm/glm.hpp"
#include "Ray.h"
#include "Material.h"

using namespace glm;

class Primitive
{
public:
  Primitive() : material(0) {}
  virtual void Intersect(Ray& _Ray) = 0;
  virtual void Draw2D() = 0;
  Material* material;				// primitive material
};