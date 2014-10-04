#include "BoxLight.h"
#include "definitions.h"
#include "raytracer.h"

const static int SAMPLES_X = 2;
const static int SAMPLES_Y = 2;
const static int SAMPLES_Z = 2;
const static int SAMPLES_PER_POINT = 1;
const static int SAMPLES_TOTAL = SAMPLES_X * SAMPLES_Y * SAMPLES_Z * SAMPLES_PER_POINT;

float BoxLight::Shade(Tmpl8::Renderer& _Renderer, Ray& _Ray)
{
  float shade = 0;
  const float xStepSize = size.x / (SAMPLES_X - 1);
  const float yStepSize = size.y / (SAMPLES_Y - 1);
  const float zStepSize = size.z / (SAMPLES_Z - 1);

  for (int x = 0; x < SAMPLES_X; ++x)
  {
    for (int y = 0; y < SAMPLES_Y; ++y)
    {
      for (int z = 0; z < SAMPLES_Z; ++z)
      {
        for (int s = 0; s < SAMPLES_PER_POINT; ++s)
        {
          Ray shadowRay;
          vec3 offset(
            -size.x / 2 + xStepSize*x + Random::value() * xStepSize,
            -size.y / 2 + yStepSize*y + Random::value() * yStepSize,
            -size.z / 2 + zStepSize*z + Random::value() * zStepSize);

          shadowRay.D = (position + offset) - _Ray.intersection.position;
          float length = shadowRay.D.length();
          shadowRay.D /= length;

          shadowRay.O = (_Ray.intersection.position) + shadowRay.D * EPSILON;
          _Renderer.scene.IntersectShadow(shadowRay, length);

          if (shadowRay.t >= length || shadowRay.intersection.prim == this)
          {
            shade += 1.0f / SAMPLES_TOTAL;
          }
        }
      }
    }
  }

  return shade;
}


void BoxLight::Intersect(Ray& _Ray)
{
  // Ray - AABB intersect
  // r.dir is unit direction vector of ray
  vec3 dirfrac(1.0f / _Ray.D.x, 1.0f / _Ray.D.y, 1.0f / _Ray.D.z);
  // lb is the corner of AABB with minimal coordinates - left bottom, rt is maximal corner
  // r.org is origin of ray

  const vec3 halfX = vec3(size.x / 2, 0, 0);
  const vec3 halfY = vec3(0, size.y / 2, 0);
  const vec3 halfZ = vec3(0, 0, size.z / 2);
  const vec3 bounds0 = position - halfX - halfZ - halfY;
  const vec3 bounds1 = position + halfX + halfZ + halfY;

  float t1 = (bounds0.x - _Ray.O.x)*dirfrac.x;
  float t2 = (bounds1.x - _Ray.O.x)*dirfrac.x;
  float t3 = (bounds0.y - _Ray.O.y)*dirfrac.y;
  float t4 = (bounds1.y - _Ray.O.y)*dirfrac.y;
  float t5 = (bounds0.z - _Ray.O.z)*dirfrac.z;
  float t6 = (bounds1.z - _Ray.O.z)*dirfrac.z;

  float tmin = max(max(min(t1, t2), min(t3, t4)), min(t5, t6));
  float tmax = min(min(max(t1, t2), max(t3, t4)), max(t5, t6));

  // if tmax < 0, ray (line) is intersecting AABB, but whole AABB is behing us
  if (tmax < 0)
  {
    //t = tmax;
    return;
  }

  // if tmin > tmax, ray doesn't intersect AABB
  if (tmin > tmax)
  {
    //t = tmax;
    return;
  }

  // Intersection yay
  if (tmin < _Ray.t)
  {
    _Ray.t = tmin;
    _Ray.intersection.position = _Ray.O + _Ray.D * tmin;
    _Ray.intersection.prim = this;
    _Ray.intersection.N = normalize(_Ray.intersection.position - position);
    _Ray.intersection.color = material->color;
  }
  return;
}

void BoxLight::Draw2D()
{
  vec3 halfX = vec3(size.x / 2, 0, 0);
  vec3 halfZ = vec3(0, 0, size.z / 2);
  vec3 v0 = position - halfX - halfZ;
  vec3 v1 = position - halfX + halfZ;
  vec3 v2 = position + halfX - halfZ;
  vec3 v3 = position + halfX + halfZ;
  Renderer::Line2D(v0.x, v0.z, v1.x, v1.z, 0xffff00);
  Renderer::Line2D(v0.x, v0.z, v2.x, v2.z, 0xffff00);
  Renderer::Line2D(v2.x, v2.z, v3.x, v3.z, 0xffff00);
  Renderer::Line2D(v3.x, v3.z, v1.x, v1.z, 0xffff00);
}