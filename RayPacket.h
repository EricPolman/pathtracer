#pragma once
#include "Ray.h"
#include "Primitive.h"
#include "definitions.h"

namespace Tmpl8
{
  class Renderer;
};
class Scene;

using namespace Tmpl8;

class RayPacket
{
public:
  RayPacket(Renderer& _Renderer, int _startX, int _startY);
  ~RayPacket();

  bool frustumGenerated;
  int startX, startY;
  Ray packet[PACKET_SIZE][PACKET_SIZE];
  void Trace(Renderer& _Renderer, Scene& _Scene);
  bool IntersectAABB(const AABB& box);
  void GenerateFrustum();
  vec3 frustumPlanes[6];
  vec3 frustumPlanePositions[6];
};

