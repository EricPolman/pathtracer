#include "Primitive.h"
#include "Triangle.h"
#include "raytracer.h"

AABB AABB::CreateFromTriangle(const Triangle& _Tri)
{
  vec3 bmin(1e34f, 1e34f, 1e34f);
  vec3 bmax(-1e34f, -1e34f, -1e34f);
  bmin.x = min(bmin.x, _Tri.v0.x);
  bmin.x = min(bmin.x, _Tri.v1.x);
  bmin.x = min(bmin.x, _Tri.v2.x);
  bmin.y = min(bmin.y, _Tri.v0.y);
  bmin.y = min(bmin.y, _Tri.v1.y);
  bmin.y = min(bmin.y, _Tri.v2.y);
  bmin.z = min(bmin.z, _Tri.v0.z);
  bmin.z = min(bmin.z, _Tri.v1.z);
  bmin.z = min(bmin.z, _Tri.v2.z);

  bmax.x = max(bmax.x, _Tri.v0.x);
  bmax.x = max(bmax.x, _Tri.v1.x);
  bmax.x = max(bmax.x, _Tri.v2.x);
  bmax.y = max(bmax.y, _Tri.v0.y);
  bmax.y = max(bmax.y, _Tri.v1.y);
  bmax.y = max(bmax.y, _Tri.v2.y);
  bmax.z = max(bmax.z, _Tri.v0.z);
  bmax.z = max(bmax.z, _Tri.v1.z);
  bmax.z = max(bmax.z, _Tri.v2.z);

  return AABB(bmin, bmax);
}

AABB AABB::CreateFromTriangles(Triangle** _Tris, int _Count)
{
  vec3 bmin(1e34f, 1e34f, 1e34f);
  vec3 bmax(-1e34f, -1e34f, -1e34f);
  for (int i = 0; i < _Count; ++i)
  {
    const Triangle& tri = *_Tris[i];

    bmin.x = min(bmin.x, tri.v0.x);
    bmin.x = min(bmin.x, tri.v1.x);
    bmin.x = min(bmin.x, tri.v2.x);
    bmin.y = min(bmin.y, tri.v0.y);
    bmin.y = min(bmin.y, tri.v1.y);
    bmin.y = min(bmin.y, tri.v2.y);
    bmin.z = min(bmin.z, tri.v0.z);
    bmin.z = min(bmin.z, tri.v1.z);
    bmin.z = min(bmin.z, tri.v2.z);
                         
    bmax.x = max(bmax.x, tri.v0.x);
    bmax.x = max(bmax.x, tri.v1.x);
    bmax.x = max(bmax.x, tri.v2.x);
    bmax.y = max(bmax.y, tri.v0.y);
    bmax.y = max(bmax.y, tri.v1.y);
    bmax.y = max(bmax.y, tri.v2.y);
    bmax.z = max(bmax.z, tri.v0.z);
    bmax.z = max(bmax.z, tri.v1.z);
    bmax.z = max(bmax.z, tri.v2.z);
  }

  return AABB(bmin, bmax);
}


void AABB::Draw2D()
{
  Renderer::Line2D(boundMin.x, boundMin.z, boundMin.x, boundMax.z, 0xff00ff);
  Renderer::Line2D(boundMin.x, boundMin.z, boundMax.x, boundMin.z, 0xff00ff);
  Renderer::Line2D(boundMax.x, boundMin.z, boundMax.x, boundMax.z, 0xff00ff);
  Renderer::Line2D(boundMax.x, boundMax.z, boundMin.x, boundMax.z, 0xff00ff);
}