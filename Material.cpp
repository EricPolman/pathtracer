#include "Material.h"
#include "raytracer.h"
#include "Ray.h"

// http://pathtracing.wordpress.com/2011/03/03/cosine-weighted-hemisphere/
vec3 RandomDiffuseDirection(vec3 n)
{
  float r1 = Random::value();
  float r2 = Random::value();

  float  theta = acosf(sqrtf(1.0f - r1)); // altitude
  float  phi = 2.0f * PI * r2; // azimuth

  float xs = sinf(theta) * cosf(phi);
  float ys = cosf(theta);
  float zs = sinf(theta) * sinf(phi);

  vec3 y(n.x, n.y, n.z);
  vec3 h = y;
  if (fabs(h.x) <= fabs(h.y) && fabs(h.x) <= fabs(h.z))
    h.x = 1.0;
  else if (fabs(h.y) <= fabs(h.x) && fabs(h.y) <= fabs(h.z))
    h.y = 1.0;
  else
    h.z = 1.0;

  vec3 x = normalize(cross(h, y));
  vec3 z = normalize(cross(x, y));

  vec3 direction = xs * x + ys * y + zs * z;
  return normalize(direction);
}

// Derived from a word file (https://www.cs.virginia.edu/~jdl/importance.doc)
// Also used http://www.igorsklyar.com/system/documents/papers/4/fiscourse.comp.pdf 
// for info on the PDF and CDF
vec3 RandomSpecularDirection(vec3 _N, vec3 _R, Material& _Material)
{
  float r1 = Random::value();
  float r2 = Random::value();

  float  theta = acosf(powf(r1,  1.0f / (_Material.specularComponent + 1.0f))); // altitude
  float  phi = 2.0f * PI * r2; // azimuth

  float xs = sinf(theta) * cosf(phi);
  float ys = cosf(theta);
  float zs = sinf(theta) * sinf(phi);

  vec3 y(_R.x, _R.y, _R.z);
  vec3 h = y;
  if (fabs(h.x) <= fabs(h.y) && fabs(h.x) <= fabs(h.z))
    h.x = 1.0;
  else if (fabs(h.y) <= fabs(h.x) && fabs(h.y) <= fabs(h.z))
    h.y = 1.0;
  else
    h.z = 1.0;

  vec3 x = normalize(cross(h, y)); 
  vec3 z = normalize(cross(x, y));

  vec3 direction = xs * x + ys * y + zs * z;
  return normalize(direction);
}

vec3 IlluminateLambertPathTraced(Renderer& _Renderer, Ray& _Ray, Material& _Material)
{
  vec3 rndVec = RandomDiffuseDirection(_Ray.intersection.N);
  float rndVecDotN = dot(rndVec, _Ray.intersection.N);

  Ray newRay(_Ray.intersection.position + rndVec * EPSILON, rndVec);

  vec3 color;
  if (_Material.texture)
    color = _Renderer.TracePath(newRay, 0.0f, true) * _Material.color * _Material.texture->GetPixel(_Ray.u, _Ray.v);
  else
    color = _Renderer.TracePath(newRay, 0.0f, true) * _Material.color;
  return color;
}

vec3 IlluminatePhongPathTraced(Renderer& _Renderer, Ray& _Ray, Material& _Material)
{
  vec3 color;
  const float diffCoeff = 1 - _Material.specularCoefficient;
  float randRayType = Random::value();
  if (randRayType < _Material.specularCoefficient) // Specular ray
  {
    vec3 rndVec = RandomSpecularDirection(_Ray.intersection.N, reflect(_Ray.D, _Ray.intersection.geomN), _Material);
    float rndVecDotN = dot(rndVec, _Ray.intersection.N);

    Ray newRay(_Ray.intersection.position + rndVec * EPSILON, rndVec);

    color = _Renderer.TracePath(newRay, 0.0f, true);

    if (_Material.texture)
      return color * _Material.color * _Material.texture->GetPixel(_Ray.u, _Ray.v);
    else
      return color * _Material.color;// * _Material.specularCoefficient
  }
  else // Diffuse ray
  {
    vec3 rndVec = RandomDiffuseDirection(_Ray.intersection.N);
    float rndVecDotN = dot(rndVec, _Ray.intersection.N);

    Ray newRay(_Ray.intersection.position + rndVec * EPSILON, rndVec);

    color = _Renderer.TracePath(newRay, 0.0f, true);

    //float pdf = 1.0f / PI * rndVecDotN;

    if (_Material.texture)
      return color * _Material.color * _Material.texture->GetPixel(_Ray.u, _Ray.v);
    else
      return color * _Material.color;// *(1.0f - _Material.specularCoefficient);
  }

}

vec3 IlluminateMirrorPathTraced(Renderer& _Renderer, Ray& _Ray, Material& _Material, unsigned int _Debug = 0)
{
  vec3 reflectionVector = glm::normalize(glm::reflect(_Ray.D, _Ray.intersection.N));
  Ray recursiveRay(_Ray.intersection.position + _Ray.intersection.N * EPSILON, reflectionVector);
  // +vec3(-0.5f + r(), -0.5f + r(), -0.5f + r()) * 0.2f);

  vec3 color = _Renderer.TracePath(recursiveRay, 0.0f, true);
  return color * _Material.color;
}

vec3 IlluminateDielectricPathTraced(Renderer& _Renderer, Ray& _Ray, Material& _Material, unsigned int _Debug = 0)
{
  vec3 color;

  float n1, n2;
  bool leaving = false;
  if (_Ray.lastRefractiveIndex == _Material.refractionIndex) // Leaving object
  {
    n1 = _Ray.lastRefractiveIndex;
    n2 = 1.000277f;
    leaving = true;
  }
  else // Entering object
  {
    n1 = _Ray.lastRefractiveIndex;
    n2 = _Material.refractionIndex;
    leaving = false;
  }

  const float tOverI = n1 / n2;

  const vec3& N = _Ray.intersection.N;
  const float cosI = -glm::dot(N, _Ray.D); // cosine of incidence ray

  // Fresnel term
  const float r0 = ((n1 - n2) / (n1 + n2)) * ((n1 - n2) / (n1 + n2));
  const float reflCoeff = r0 + (1 - r0) * powf(1 - cosI, 5); // Schlick's approx
  const float refrCoeff = 1 - reflCoeff;

  float rndVal = Random::value();
  if (rndVal > reflCoeff)
  {
    const float cosT2 = 1.0f - (tOverI * tOverI) * (1.0f - (cosI * cosI));
    if (cosT2 > 0.0f)
    {
      // vec3 T = -N * 
      vec3 T = (tOverI * _Ray.D) + (tOverI * cosI - sqrtf(cosT2)) * N;
      T = normalize(T);

      Ray recursiveRay;
      recursiveRay.D = T;

      recursiveRay.O = _Ray.intersection.position + T * EPSILON;

      vec3 col = _Renderer.TracePath(recursiveRay, 0.0f, true, _Debug & 0xFF0000);
      if (leaving) // Absorp according to Beer's law
      {
        vec3 absorbance = recursiveRay.intersection.color * 0.05f * -recursiveRay.t; // Constant should be 0.15f
        vec3 transparency = vec3(expf(absorbance.r), expf(absorbance.g), expf(absorbance.b));

        color += col * transparency;
      }
      else
      {
        color += col;
      }
    }
  }
  else
  {
    vec3 reflectionVector = glm::reflect(_Ray.D, _Ray.intersection.N);
    Ray recursiveRay(_Ray.intersection.position + _Ray.intersection.N * EPSILON, reflectionVector);// +vec3(-0.5f + r(), -0.5f + r(), -0.5f + r()) * 0.05f);

    vec3 col = _Renderer.TracePath(recursiveRay, 0.0f, true, _Debug);
    color += col;
  }
  if (_Material.texture)
    return color * _Material.color * _Material.texture->GetPixel(_Ray.u, _Ray.v);
  else
    return color * _Material.color;
}

vec3 Material::Illuminate(Renderer& _Renderer, Ray& _Ray, int _Depth, bool _PathTraced, unsigned int _Debug)
{
  if (_PathTraced)
  {
    switch (type)
    {
    case LAMBERT:
      return IlluminateLambertPathTraced(_Renderer, _Ray, *this);
      break;
    case PHONG:
      return IlluminatePhongPathTraced(_Renderer, _Ray, *this);
      break;
    case MIRROR:
      return IlluminateMirrorPathTraced(_Renderer, _Ray, *this, _Debug);
      break;
    case DIELECTRIC:
      return IlluminateDielectricPathTraced(_Renderer, _Ray, *this, _Debug);
      break;
    case LIGHT:
      if (texture != nullptr)
        return texture->GetPixel(_Ray.u, _Ray.v);
      return color;
      break;
    case UNLIT:
    default:
      return color;
      break;
    }
  }
}