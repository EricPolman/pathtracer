#pragma once
#include "glm/glm.hpp"

using namespace glm;

class Primitive;

class Intersection
{
public:
  vec3 N;							// normal at intersection point
  vec3 color;						// color at intersection point
  vec3 position;
  Primitive* prim;
};

class Ray
{
public:
  Ray():t(1e34f){}
  // methods
  void Draw2D();
  // data members
  vec3 O;							// ray origin
  vec3 D;							// normalized ray direction
  float t;						// distance of intersection along ray ( >= 0 )
  Intersection intersection;		// data for closest intersection point
};
