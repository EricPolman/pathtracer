#include "Triangle.h"
#include "raytracer.h"

using namespace Tmpl8;

Triangle::Triangle(vec3 _V0, vec3 _V1, vec3 _V2) : v0(_V0), v1(_V1), v2(_V2)
{
  // set triangle vertices and calculate its normal
  const vec3 e1 = v1 - v0, e2 = v2 - v0;
  N = normalize(cross(e1, e2));
  material = 0;
}

void Triangle::Intersect(Ray& _Ray)
{
  // find the intersection of a ray and a triangle
  float t = 0; // todo: find intersection distance
  if (t < _Ray.t)
  {
    _Ray.t = t;
    _Ray.intersection.N = N;
    if (material) _Ray.intersection.color = material->color;
  }
}

void Triangle::Draw2D()
{
  // draw triangle edges
  Renderer::Line2D(v0.x, v0.z, v1.x, v1.z, 0xffffff);
  Renderer::Line2D(v1.x, v1.z, v2.x, v2.z, 0xffffff);
  Renderer::Line2D(v2.x, v2.z, v0.x, v0.z, 0xffffff);
}