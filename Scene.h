#pragma once
#include "Primitive.h"
#include <vector>

class BvhNode;
class Triangle;

class Scene
{
public:
  // constructor
  Scene();

  void SetupSphereScene();
  void SetupHeavyScene();

  void BuildBVH();

  void Draw2D();
  void Intersect(Ray& _Ray);
  void IntersectShadow(Ray& _Ray, float _Length);
  // data members
  BvhNode* bvhRoot;
  AABB rootBox;
  Primitive** primList;
  std::vector<Triangle*> triangles;
  std::vector<Material*> materials;
  int primCount;


  Primitive** lightList;
  int lightCount;
};
