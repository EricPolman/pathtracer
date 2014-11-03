#pragma once
#include "glm/glm.hpp"

using namespace glm;

class Primitive;
class Ray;

class Intersection
{
public:
  Intersection() : directLight(nullptr) {}
  ~Intersection() { delete directLight; }
  vec3 N, geomN;							// normal at intersection point
  vec3 color;						// color at intersection point
  vec3 position;
  Primitive* prim;
  Ray* directLight;
};

class Ray
{
public:
  Ray() :t(1e34f), lastRefractiveIndex(1.0f){}
  Ray(vec3& _o, vec3& _d) : O(_o), D(_d), t(1e34f), lastRefractiveIndex(1.0f){}
  // methods
  void Draw2D(unsigned int col = 0xaaaa00);
  // data members
  vec3 O;							// ray origin
  vec3 D;							// normalized ray direction
  float t, u, v;						// distance of intersection along ray ( >= 0 )
  float lastRefractiveIndex;
  Intersection intersection;		// data for closest intersection point
};
