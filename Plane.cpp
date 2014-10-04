#include "Plane.h"
#include "raytracer.h"
#include "definitions.h"


Plane::Plane(vec3 _V0, vec3 _V1, vec3 _V2)
{
  // construct an infinite plane based on three points
  const vec3 e1 = _V1 - _V0, e2 = _V2 - _V0;
  N = normalize(cross(e1, e2));
  dist = dot(_V0, N);
  material = 0;
}

void Plane::Intersect(Ray& _Ray)
{
  // find the intersection of a ray and an infinite plane
  float t = (-dot(_Ray.O, N) + dist) / dot(_Ray.D, N);
  // store distance in ray if smaller than previous found distance
  if ((t < _Ray.t) && (t >= 0))
  {
    _Ray.t = t;
    _Ray.intersection.position = _Ray.D * t + _Ray.O;
    _Ray.intersection.prim = this;
    _Ray.intersection.N = N;
    if (material) _Ray.intersection.color = material->color;
  }
}

void Plane::Draw2D()
{
  // visualize plane
  if (fabs(N.y) < EPSILON) // we can only draw a line for vertical planes
  {
    // get a point on the plane
    vec3 p0 = N * dist;
    // determine vector perpendicular to N (and thus parallel to the plane)
    vec3 B(-N.z, 0.0f, N.x);
    // calculate two points on the plane, far apart
    vec3 p1 = p0 + B * 10000.0f;
    vec3 p2 = p0 - B * 10000.0f;
    // connect these points with a line
    Tmpl8::Renderer::Line2D(p1.x, p1.z, p2.x, p2.z, 0xffffff);
  }
}