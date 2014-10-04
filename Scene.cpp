#include "Scene.h"
#include "raytracer.h"
#include "definitions.h"
#include "Sphere.h"
#include "Plane.h"
#include "BoxLight.h"

Scene::Scene()
{
  // scene initialization
  primList = new Primitive*[128]; // todo: this is going to bite us one day
  lightList = new Primitive*[128]; 
  primCount = lightCount = 0;
  primList[primCount++] = new Sphere(vec3(-1.1f, 0, 0.8f), 1);
  primList[primCount++] = new Sphere(vec3(0, 0, -2), 1);
  primList[primCount++] = new Sphere(vec3(1.1f, 0, 0.8f), 1);

  primList[primCount++] = new Plane(vec3(0, -1, 0), -0.7f);
  primList[primCount++] = new Plane(vec3(0, 0, -1), -2);
  primList[primCount++] = new Plane(vec3(1, 0, 0), -4);
  primList[primCount++] = new Plane(vec3(-1, 0, 0), -4);
  primList[primCount++] = new Plane(vec3(0, 1, 0), -3.5f);

  primList[1]->material->type = Material::DIELECTRIC;
  primList[1]->material->refractionIndex = 1.5f;
  //primList[1]->material->type = Material::MIRROR;
  //primList[1]->material->reflection = 1;
  primList[2]->material->color = vec3(0, 0, 1);
  primList[0]->material->color = vec3(0, 1, 1);

  primList[5]->material->color = vec3(1, 0, 0);
  primList[6]->material->color = vec3(0, 1, 0);

  BoxLight* boxLight = new BoxLight();
  primList[primCount++] = boxLight;
  lightList[lightCount++] = boxLight;

  boxLight->position = vec3(0, -3.4f, 0);
  boxLight->size = vec3(4, 0.2f, 4);
  boxLight->intensity = 10;
}

void Scene::Intersect(Ray& _Ray)
{
  // intersect ray with each primitive in the scene
  for (int i = 0; i < primCount; i++) primList[i]->Intersect(_Ray);
}

void Scene::IntersectShadow(Ray& _Ray, float _Length)
{
  // intersect ray with each primitive in the scene
  for (int i = 0; i < primCount; i++)
  {
    primList[i]->Intersect(_Ray);
    //if (_Ray.t <= _length)
    //  return;
  }
}