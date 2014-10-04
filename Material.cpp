#include "Material.h"
#include "raytracer.h"
#include "Ray.h"
#include "BoxLight.h"

vec3 IlluminateLambert(Renderer& _Renderer, Ray& _Ray, Material& _Material)
{
  vec3 color;
  // Check against all lights
  for (int i = 0; i < _Renderer.scene.lightCount; ++i)
  {
    BoxLight* light = (BoxLight*)_Renderer.scene.lightList[i];
    float shade = light->Shade(_Renderer, _Ray);
    if (shade > 0)
    {
      float diffuse = dot(_Ray.intersection.N, normalize(light->position - (_Ray.intersection.position)));
      diffuse *= light->intensity;

      vec3 difference = light->position - _Ray.intersection.position;
      float distSquared = glm::dot(difference, difference);

      diffuse /= distSquared;

      if (diffuse > 0)
      {
        color.r += diffuse * light->material->color.r * _Ray.intersection.color.r * shade;
        color.g += diffuse * light->material->color.g * _Ray.intersection.color.g * shade;
        color.b += diffuse * light->material->color.b * _Ray.intersection.color.b * shade;
      }
    }
  }
  return color;
}

vec3 IlluminatePhong(Renderer& _Renderer, Ray& _Ray, Material& _Material)
{
  vec3 color;
  // Check against all lights
  for (int i = 0; i < _Renderer.scene.lightCount; ++i)
  {
    BoxLight* light = (BoxLight*)_Renderer.scene.lightList[i];
    float shade = light->Shade(_Renderer, _Ray);
    if (shade > 0)
    {
      float diffuse = dot(_Ray.intersection.N, normalize(light->position - (_Ray.intersection.position)));
      diffuse *= light->intensity;

      vec3 difference = light->position - _Ray.intersection.position;
      float distSquared = glm::dot(difference, difference);

      diffuse /= distSquared;

      if (diffuse > 0)
      {
        color.r += diffuse * light->material->color.r * _Ray.intersection.color.r * shade;
        color.g += diffuse * light->material->color.g * _Ray.intersection.color.g * shade;
        color.b += diffuse * light->material->color.b * _Ray.intersection.color.b * shade;
      }

      float specdot = glm::dot(_Ray.D, glm::reflect(glm::normalize(light->position - _Ray.intersection.position), _Ray.intersection.N));
      if (specdot > 0)
      {
        float spec = powf(specdot, 20);

        color.r += spec * light->material->color.r * _Ray.intersection.color.r * shade;
        color.g += spec * light->material->color.g * _Ray.intersection.color.g * shade;
        color.b += spec * light->material->color.b * _Ray.intersection.color.b * shade;
      }
    }
  }
  return color;
}

vec3 IlluminateMirror(Renderer& _Renderer, Ray& _Ray, Material& _Material, int _Depth, unsigned int _Debug = 0)
{
  vec3 reflectionVector = glm::normalize(glm::reflect(_Ray.D, _Ray.intersection.N));
  Ray recursiveRay(_Ray.intersection.position + _Ray.intersection.N * EPSILON, reflectionVector);// +vec3(-0.5f + r(), -0.5f + r(), -0.5f + r()) * 0.2f);

  vec3 col;
  if (_Debug)
  {
    col = _Renderer.Trace(recursiveRay, _Depth + 1, 0xFF0000);
  }
  else
  {
    col = _Renderer.Trace(recursiveRay, _Depth + 1, _Debug);
  }
  return col * _Material.reflection * _Material.color;
}


vec3 IlluminateDielectric(Renderer& _Renderer, Ray& _Ray, Material& _Material, int _Depth, unsigned int _Debug = 0)
{
  vec3 color; 

  const float n1 = _Ray.lastRefractiveIndex; // Refractive index for air
  //const float n1 = 1.000277f; // Refractive index for air
  const float n2 = _Material.refractionIndex;

  const float tOverI = n1 / n2;
  const float iOverT = n1 / n2;

  const vec3& N = _Ray.intersection.N;
  const float cosI = -glm::dot(N, _Ray.D); // cosine of incidence ray

  // Fresnel term
  const float r0 = ((n1 - n2) / (n1 + n2)) * ((n1 - n2) / (n1 + n2));
  const float reflCoeff = r0 + (1 - r0) * powf(1 - cosI, 5); // Schlick's approx
  const float refrCoeff = 1 - reflCoeff;

  const float cosT2 = 1.0f - (tOverI * tOverI) * (1.0f - (cosI * cosI));
  if (cosT2 > 0.0f)
  {
    // vec3 T = -N * 
    vec3 T = (tOverI * _Ray.D) + (tOverI * cosI - sqrtf(cosT2)) * N;
    T = normalize(T);

    Ray recursiveRay;
    recursiveRay.D = T;

    recursiveRay.O = _Ray.intersection.position + T * EPSILON;

    vec3 col;
    if (_Debug)
    {
      col = _Renderer.Trace(recursiveRay, _Depth + 1, 0xFF);
    }
    else
    {
      col = _Renderer.Trace(recursiveRay, _Depth + 1, _Debug);
    }

    vec3 absorbance = recursiveRay.intersection.color * 0.05f * -recursiveRay.t; // Constant should be 0.15f
    vec3 transparency = vec3(expf(absorbance.r), expf(absorbance.g), expf(absorbance.b));

    color += col * transparency * refrCoeff;
  }

  vec3 reflectionVector = glm::reflect(_Ray.D, _Ray.intersection.N);
  Ray recursiveRay(_Ray.intersection.position + _Ray.intersection.N * EPSILON, reflectionVector);// +vec3(-0.5f + r(), -0.5f + r(), -0.5f + r()) * 0.05f);

  vec3 col;
  if (_Debug)
  {
    col = _Renderer.Trace(recursiveRay, _Depth + 1, 0xFF0000);
  }
  else
  {
    col = _Renderer.Trace(recursiveRay, _Depth + 1, _Debug);
  }
  color += col * _Material.color * reflCoeff;

  return color;
}

vec3 Material::Illuminate(Renderer& _Renderer, Ray& _Ray, int _Depth, unsigned int _Debug)
{
  switch(type)
  {
  case LAMBERT:
    return IlluminateLambert(_Renderer, _Ray, *this);
    break;
  case PHONG:
    return IlluminatePhong(_Renderer, _Ray, *this);
    break;
  case MIRROR:
    return IlluminateMirror(_Renderer, _Ray, *this, _Depth, _Debug);
    break;
  case DIELECTRIC:
    return IlluminateDielectric(_Renderer, _Ray, *this, _Depth, _Debug);
    break;
  case LIGHT:
  case UNLIT:
  default:
    return color;
    break;
  }
}