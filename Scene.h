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
  void SetupScene();

  void BuildBVH();

  void Draw2D();
  void Intersect(Ray& _Ray);
  void IntersectBVH(Ray& _Ray, BvhNode* startNode = nullptr);
  // data members
  BvhNode* bvhRoot;
  AABB rootBox;
  Primitive** primList;
  std::vector<Triangle*> triangles;
  static std::vector<Material*> materials;
  static void AddMaterial(Material* mat);
  int primCount;


  Primitive** lightList;
  int lightCount;
};
