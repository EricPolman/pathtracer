#include "Scene.h"
#include "raytracer.h"
#include "definitions.h"
#include "Sphere.h"
#include "Plane.h"

Scene::Scene()
{
  // scene initialization
  primList = new Primitive*[128]; // todo: this is going to bite us one day
  primCount = 0;
  primList[primCount++] = new Sphere(vec3(-2.5f, 0, 0), 1);
  primList[primCount++] = new Sphere(vec3(0, 0, 0), 1);
  primList[primCount++] = new Sphere(vec3(2.5f, 0, 0), 1);

  primList[primCount++] = new Plane(vec3(0, -1, 0), -0.7f);
  primList[primCount++] = new Plane(vec3(0, 0, -1), -1.5f);
}

void Scene::Intersect(Ray& _Ray)
{
  // intersect ray with each primitive in the scene
  for (int i = 0; i < primCount; i++) primList[i]->Intersect(_Ray);
}