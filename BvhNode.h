#pragma once
#include "glm/glm.hpp"
#include <vector>
#include <queue>
#include "Triangle.h"

struct AABB;
class Ray;
class Triangle;
class BvhNode;

using namespace glm;

struct SplitInstruction { BvhNode* node; Triangle** tris; int p; int count; int depth; };

class BvhNode
{
public:
  BvhNode(Triangle** triangles, int count, const AABB& _RootBox, int _Depth);
  ~BvhNode();

  BvhNode *left; 
  BvhNode *right;

  int numObjects;
  bool isLeaf() { return numObjects > 0; }

  int depth;
  AABB bounds;

  bool Intersect(Ray& _Ray);
  void Draw2D();

  void GenerateSplitCandidates(Triangle** triangles, int count, bool _PerTriangle = false);
  void Build(Triangle** triangles, int count, const AABB& _RootBox, int _Depth);
  int Partition(Triangle** triangles, int count, const AABB& _RootBox, float& _rCost);
  
  static std::queue<SplitInstruction> splitQueue;

  Triangle** tris;
  //float padding[12];
};
