#pragma once
#include "glm/glm.hpp"
#include <vector>

class Ray;
class Triangle;

using namespace glm;

class BvhNode
{
public:
  BvhNode(const vec3& b0, const vec3& b1);
  ~BvhNode();

  union 
  {
    struct { BvhNode *left; int padding; BvhNode *right; };
    struct { Triangle** tris; int numObjects; };
  };
  //BvhNode* right() { return left + 1; }
  bool isLeaf() { return numObjects > 0; }

  vec3 bound0;
  vec3 bound1;

  bool Intersect(Ray& _Ray);
  void Draw2D();

  void Build(Triangle** triangles, int count);
  int Partition(Triangle** triangles, int count);
  void Split();

  bool TriangleBoxIntersection(Triangle*);
};
