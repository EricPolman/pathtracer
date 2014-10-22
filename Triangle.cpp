#include "Triangle.h"
#include "raytracer.h"

using namespace Tmpl8;


Triangle::Triangle(vec3 _V0, vec3 _V1, vec3 _V2) : v0(_V0), v1(_V1), v2(_V2)
{
  // set triangle vertices and calculate its normal
  const vec3 e1 = v1 - v0, e2 = v2 - v0;
  N = normalize(cross(e1, e2));
  P = GetBarycentricCoordinate();
}

void Triangle::Intersect(Ray& _Ray)
{
  // http://www.cs.virginia.edu/~gfx/Courses/2003/ImageSynthesis/papers/Acceleration/Fast%20MinimumStorage%20RayTriangle%20Intersection.pdf
  vec3 e1 = v1 - v0;       // first edge
  vec3 e2 = v2 - v0;       // second edge

  vec3 tvec, pvec, qvec;
  float det;

  pvec = cross(_Ray.D, e2);
  det = dot(e1, pvec);
  
  if(det < EPSILON) // Parallel-ish
  {
    return;
  }

  float invDet = 1.0f / det;

  tvec = _Ray.O - v0;

  float u = dot(tvec, pvec) * invDet;
  if (u < 0 || u > 1)
    return;

  qvec = cross(tvec, e1);
  float v = dot(_Ray.D, qvec) * invDet;
  if (v < 0 || u + v > 1)
    return;

  float t = dot(e2, qvec) * invDet;

  if (t < _Ray.t && t > 0)
  {
    _Ray.intersection.position = _Ray.O + _Ray.D * t;
    _Ray.t = t;

    const vec2 uv = uv0 + u * (uv1 - uv0) + v * (uv2 - uv0);

    _Ray.u = uv.x;
    _Ray.v = uv.y;
    _Ray.intersection.prim = this;
    _Ray.intersection.N = N;// n0 + u * (n1 - n0) + v * (n2 - n0);
    _Ray.intersection.color = material->color;
    _Ray.lastRefractiveIndex = material->refractionIndex;
    /*
    if (_Ray.lastRefractiveIndex == material->refractionIndex)
    else
      _Ray.lastRefractiveIndex = material->refractionIndex;*/
  }
}

void Triangle::Draw2D()
{
  // draw triangle edges
  Renderer::Line2D(v0.x, v0.z, v1.x, v1.z, 0xffffff);
  Renderer::Line2D(v1.x, v1.z, v2.x, v2.z, 0xffffff);
  Renderer::Line2D(v2.x, v2.z, v0.x, v0.z, 0xffffff);
}


vec3 Triangle::GetBarycentricCoordinate()
{
  // TODO: Implement
  //assert(false);

  return vec3();
}


void Triangle::SetUVs(vec2 _UV0, vec2 _UV1, vec2 _UV2)
{
  uv0 = _UV0;
  uv1 = _UV1;
  uv2 = _UV2;
}