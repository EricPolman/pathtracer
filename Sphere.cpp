#include "Sphere.h"
#include "raytracer.h"
#include "definitions.h"

using namespace Tmpl8;

void Sphere::Intersect(Ray& _Ray)
{
  bool invertNormal = false;
  // find the intersection of a ray and a sphere
  // http://www.ccs.neu.edu/home/fell/CSU540/programs/RayTracingFormulas.htm
  float t = 1e34;
  float a = dot(_Ray.D, _Ray.D), b = 2.0f * dot(_Ray.D, _Ray.O - P);
  float c = dot(P, P) + dot(_Ray.O, _Ray.O) - 2.0f * dot(P, _Ray.O) - r * r;
  float d = b * b - 4 * a * c;
  if (d >= 0)
  {
    float t1 = (-b - sqrtf(d)) / (2 * a);
    float t2 = (-b + sqrtf(d)) / (2 * a);
    if ((t1 < t) && (t1 >= 0)) t = t1;
    if ((t2 < t) && (t2 >= 0)) t = t2, invertNormal = true;;
  }
  // store distance in ray if smaller than previous found distance
  if (t < _Ray.t)
  {
    _Ray.t = t;
    _Ray.intersection.position = _Ray.D * t + _Ray.O;
    _Ray.intersection.prim = this;
    _Ray.intersection.N = normalize(_Ray.intersection.position - P); 
    if (invertNormal)
      _Ray.intersection.N *= -1;
    if (material) _Ray.intersection.color = material->color;
  }
}

void Sphere::Draw2D()
{
  // visualize a sphere by drawing 72 line segments around the center
  float x1 = r * sinf(0) + P.x, y1 = r * cosf(0) + P.z, x2, y2;
  for (int i = 1; i <= 72; i++, x1 = x2, y1 = y2)
  {
    float degrees = i * 5.0f, radians = degrees * PI / 180;
    x2 = r * sinf(radians) + P.x, y2 = r * cosf(radians) + P.z;
    Renderer::Line2D(x1, y1, x2, y2, 0xffffff);
  }
}