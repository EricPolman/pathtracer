#pragma once
#include "Ray.h"
#include "Random.h"
#include "glm/gtx/quaternion.hpp"

class Camera
{
public:
  Camera(): focusDistance(1) {}
  // methods
  Ray GenerateRay(int _X, int _Y);
  Ray GenerateSimpleRay(int _X, int _Y);
  void Set(vec3 _Pos, vec3 _Direction);
  void Draw2D();
  // data members
  vec3 eyePos, right, up;					// camera position
  vec3 V;							// normalized view direction
  vec3 p1, p2, p3, p4;			// corners of screen plane

  quat rotation;

  float focusDistance;
};
