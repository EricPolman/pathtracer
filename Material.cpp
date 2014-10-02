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
        color.r += diffuse * light->material->color.r * _Ray.intersection.color.r;
        color.g += diffuse * light->material->color.g * _Ray.intersection.color.g;
        color.b += diffuse * light->material->color.b * _Ray.intersection.color.b;
      }
    }
  }
  return color;
}

vec3 Material::Illuminate(Renderer& _Renderer, Ray& _Ray)
{
  switch(type)
  {
  case LAMBERT:
    return IlluminateLambert(_Renderer, _Ray, *this);
    break;
  case PHONG:

    break;
  case MIRROR:
    break;
  case DIELECTRIC:
    break;
  case LIGHT:
  case UNLIT:
  default:
    return color;
    break;
  }
}