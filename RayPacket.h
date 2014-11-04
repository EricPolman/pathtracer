#pragma once
#include "Ray.h"
#include "Primitive.h"
#include "definitions.h"
#include "emmintrin.h"

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

  // Frustum
  union { __m128 Px4; float Px[4]; };
  union { __m128 Py4; float Py[4]; };
  union { __m128 Pz4; float Pz[4]; };
  union { __m128 Nx4; float Nx[4]; };
  union { __m128 Ny4; float Ny[4]; };
  union { __m128 Nz4; float Nz[4]; };
};

