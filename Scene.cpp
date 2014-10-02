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
  lightList = new Primitive*[128]; // todo: this is going to bite us one day
  primCount = lightCount = 0;
  primList[primCount++] = new Sphere(vec3(-2.5f, 0, 0), 1);
  primList[primCount++] = new Sphere(vec3(0, 0, 0), 1);
  primList[primCount++] = new Sphere(vec3(2.5f, 0, 0), 1);

  primList[primCount++] = new Plane(vec3(0, -1, 0), -0.7f);
  primList[primCount++] = new Plane(vec3(0, 0, -1), -1.5f);

  primList[0]->material->color = vec3(1, 0, 0);
  primList[1]->material->color = vec3(0, 1, 0);
  primList[2]->material->color = vec3(0, 0, 1);

  BoxLight* boxLight = new BoxLight();
  primList[primCount++] = boxLight;
  lightList[lightCount++] = boxLight;

  boxLight->position = vec3(3, 0, -3);
  boxLight->intensity = 5;
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