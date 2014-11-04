#include "BvhNode.h"
#include "Ray.h"
#include "Material.h"
#include "raytracer.h"
#include <map>
#include <vector>

static const int COST_TRAVERSAL = 0.5f;
static const int COST_INTERSECT = 1.0f;

struct SplitPlane
{
  SplitPlane(const vec3& p, const vec3& n) : position(p), normal(n) { }

  vec3 position;
  vec3 normal;
};

std::queue<SplitInstruction> BvhNode::splitQueue;
std::vector<SplitPlane> splitPlaneCandidates;


BvhNode::BvhNode(Triangle** triangles, int count, const AABB& _RootBox, int _Depth)
: left(nullptr), right(nullptr)
{
  bounds = AABB::CreateFromTriangles(triangles, count);
  Build(triangles, count, _RootBox, _Depth);
}


BvhNode::~BvhNode()
{
}

static int inc = 0;
void BvhNode::Draw2D()
{
  if (!isLeaf())
  {
    if (left)
      left->Draw2D();
    if (right)
      right->Draw2D();
  }
  else
  {
    for (int i = 0; i < numObjects; ++i)
    {
      tris[i]->Draw2D();
      //printf("%ith triangle drawn.", ++inc);
    }
  }

  Renderer::Line2D(bounds._min.x, bounds._min.z, bounds._min.x, bounds._max.z, 0xff00ff);
  Renderer::Line2D(bounds._min.x, bounds._min.z, bounds._max.x, bounds._min.z, 0xff00ff);
  Renderer::Line2D(bounds._max.x, bounds._min.z, bounds._max.x, bounds._max.z, 0xff00ff);
  Renderer::Line2D(bounds._max.x, bounds._max.z, bounds._min.x, bounds._max.z, 0xff00ff);
}

// with help from: https://github.com/apartridge/GpuRayTracer/tree/c6ad15089bd6a0b92fdfe6b8dcd2db23505aaa7a/SimSun
float SurfaceAreaHeuristic(int numLeft, float areaLeft, int numRight, float areaRight, int numMiddle)
{
  float factor = 1.0f;

  if (numMiddle == 0)
    factor *= 0.7f;

  if (numLeft == 0 || numRight == 0)
    factor *= 0.7f;

  return factor * (COST_TRAVERSAL * 2.0f + COST_INTERSECT * (numLeft * areaLeft + numRight * areaRight));
}

float GetSurfaceArea(const AABB& box)
{
  vec3 size = box._max - box._min;
  return 2.0f * (size.x * size.y + size.x * size.z + size.z * size.y);
}

bool BvhNode::Intersect(Ray& _Ray)
{
  // Ray - AABB intersect
  // r.dir is unit direction vector of ray
  vec3 dirfrac(1.0f / _Ray.D.x, 1.0f / _Ray.D.y, 1.0f / _Ray.D.z);
  // lb is the corner of AABB with minimal coordinates - left bottom, rt is maximal corner
  // r.org is origin of ray

  float t1 = (bounds._min.x - _Ray.O.x)*dirfrac.x;
  float t2 = (bounds._max.x - _Ray.O.x)*dirfrac.x;
  float t3 = (bounds._min.y - _Ray.O.y)*dirfrac.y;
  float t4 = (bounds._max.y - _Ray.O.y)*dirfrac.y;
  float t5 = (bounds._min.z - _Ray.O.z)*dirfrac.z;
  float t6 = (bounds._max.z - _Ray.O.z)*dirfrac.z;

  float tmin = glm::max(glm::max(glm::min(t1, t2), glm::min(t3, t4)), glm::min(t5, t6));
  float tmax = glm::min(glm::min(glm::max(t1, t2), glm::max(t3, t4)), glm::max(t5, t6));

  // if tmax < 0, ray (line) is intersecting AABB, but whole AABB is behing us
  if (tmax < 0 || tmin > tmax)
  {
    //_Ray.t = tmax;
    return false;
  }

  if (tmin < _Ray.t)
  {
    return true;
  }
  return false;
}


#define PLANES_PER_AXIS 16
void BvhNode::GenerateSplitCandidates(Triangle** triangles, int count, bool _PerTriangle)
{
  splitPlaneCandidates.clear();
  if (_PerTriangle)
  {
    for (int i = 0; i < count; ++i)
    {
      const AABB triBox = AABB::CreateFromTriangle(*triangles[i]);
      const vec3 triBoxCenter = (triBox._min + triBox._max) * 0.5f;
      const vec3 triBoxExtends = (triBox._max - triBox._min) * 0.5f;

      const vec3 triBoxX(triBoxExtends.x, 0, 0);
      splitPlaneCandidates.push_back(SplitPlane(triBoxCenter + triBoxX, triBoxX / triBoxX.x));
      splitPlaneCandidates.push_back(SplitPlane(triBoxCenter - triBoxX, -triBoxX / triBoxX.x));

      const vec3 triBoxY(0, triBoxExtends.y, 0);
      splitPlaneCandidates.push_back(SplitPlane(triBoxCenter + triBoxY, triBoxY / triBoxY.y));
      splitPlaneCandidates.push_back(SplitPlane(triBoxCenter - triBoxY, -triBoxY / triBoxY.y));

      const vec3 triBoxZ(0, 0, triBoxExtends.z);
      splitPlaneCandidates.push_back(SplitPlane(triBoxCenter + triBoxZ, triBoxZ / triBoxZ.z));
      splitPlaneCandidates.push_back(SplitPlane(triBoxCenter - triBoxZ, -triBoxZ / triBoxZ.z));
    }
  }
  else
  {
    const vec3 center = (bounds._min + bounds._max) * 0.5f;
    const vec3 extends = (bounds._max - center);
    const vec3 delta = extends * (1.0f / ((float)PLANES_PER_AXIS + 1.0f)) * 2.0f;
    const vec3 extendX = vec3(extends.x, 0, 0);
    const vec3 extendY = vec3(0, extends.y, 0);
    const vec3 extendZ = vec3(0, 0, extends.z);

    for (int x = 1; x < PLANES_PER_AXIS + 1; ++x)
    {
      splitPlaneCandidates.push_back(SplitPlane(center - extendX + (delta * (float)x * vec3(1, 0, 0)), extendX / extendX.x));
    }

    for (int y = 1; y < PLANES_PER_AXIS + 1; ++y)
    {
      splitPlaneCandidates.push_back(SplitPlane(center - extendY + (delta * (float)y * vec3(0, 1, 0)), extendY / extendY.y));
    }

    for (int z = 1; z < PLANES_PER_AXIS + 1; ++z)
    {
      splitPlaneCandidates.push_back(SplitPlane(center - extendZ + (delta * (float)z * vec3(0, 0, 1)), extendZ / extendZ.z));
    }
  }
}


void BvhNode::Build(Triangle** _Tris, int _Count, const AABB& _RootBox, int _Depth)
{
  // Real-Time Collision Detection p.240
  // Top-down Construction of BVH
  
  if (_Count <= MIN_OBJECTS_IN_BVH_NODE) // Stay a leaf.
  {
    // Is leaf
    tris = _Tris;
    numObjects = _Count;
    depth = _Depth;
  }
  else
  {
    GenerateSplitCandidates(_Tris, _Count, false);

    // Split this thing yo
    float cost = 0;
    int p = Partition(_Tris, _Count, _RootBox, cost);

    if (p == _Count || p == 0 || cost > COST_INTERSECT * _Count)
    {
      // Is leaf
      tris = _Tris;
      numObjects = _Count;
      depth = _Depth;
    }
    else
    {
      SplitInstruction instr;
      instr.node = this;
      instr.p = p;
      instr.tris = _Tris;
      instr.count = _Count;
      instr.depth = _Depth + 1;

      splitQueue.push(instr);
    }
  }
}

#define USE_SAH
static int roundRobin = 0;
int BvhNode::Partition(Triangle** triangles, int count, const AABB& _RootBox, float& _rCost)
{
  std::vector<Triangle*> leftTriangles, rightTriangles;
  const float rootArea = GetSurfaceArea(_RootBox);
#ifdef USE_SAH
  int currentBestCandidate = -10;
  float currentBestCost = 1e34f;
  for (int p = 0; p < splitPlaneCandidates.size(); ++p)
  {
    leftTriangles.clear();
    rightTriangles.clear();

    for (int i = 0; i < count; ++i)
    {
      float v0dot = dot(triangles[i]->v0 - splitPlaneCandidates[p].position, splitPlaneCandidates[p].normal);
      float v1dot = dot(triangles[i]->v1 - splitPlaneCandidates[p].position, splitPlaneCandidates[p].normal);
      float v2dot = dot(triangles[i]->v2 - splitPlaneCandidates[p].position, splitPlaneCandidates[p].normal);

      if (v0dot < 0 || v1dot < 0 || v2dot < 0)
        leftTriangles.push_back(triangles[i]);
      if (v0dot >= 0 || v1dot >= 0 || v2dot >= 0)
        rightTriangles.push_back(triangles[i]);

      /*vec3 center = triangles[i]->v0 + triangles[i]->v1 + triangles[i]->v2;
      center /= 3;

      if (dot(center - splitPlaneCandidates[p].position, splitPlaneCandidates[p].normal) <= 0)
        leftTriangles.push_back(triangles[i]);
      else
        rightTriangles.push_back(triangles[i]);*/
    }

    // Calculate costs and evaluate best split
    AABB leftAABB(bounds._min, bounds._max - (splitPlaneCandidates[p].normal * (bounds._max - splitPlaneCandidates[p].position)));
    AABB rightAABB(bounds._max - (splitPlaneCandidates[p].normal * (bounds._max - splitPlaneCandidates[p].position)), bounds._max);
    
    if (leftTriangles.size() > 0)
      leftAABB = AABB::CreateFromTriangles(&leftTriangles[0], leftTriangles.size());
    if (rightTriangles.size() > 0)
      rightAABB = AABB::CreateFromTriangles(&rightTriangles[0], rightTriangles.size());

    float leftArea = GetSurfaceArea(leftAABB) / rootArea;
    float rightArea = GetSurfaceArea(rightAABB) / rootArea;

    float totalCost = SurfaceAreaHeuristic(leftTriangles.size(), leftArea, rightTriangles.size(), rightArea, leftTriangles.size() + rightTriangles.size() - count);
    if (totalCost < currentBestCost)
    {
      currentBestCost = totalCost;
      currentBestCandidate = p;
    }
  }

  leftTriangles.clear();
  rightTriangles.clear();
  for (int i = 0; i < count; ++i)
  {
    vec3 center = triangles[i]->v0 + triangles[i]->v1 + triangles[i]->v2;
    center /= 3;

    if (dot(center - splitPlaneCandidates[currentBestCandidate].position, splitPlaneCandidates[currentBestCandidate].normal) <= 0)
      leftTriangles.push_back(triangles[i]);
    else
      rightTriangles.push_back(triangles[i]);
  }
  _rCost = currentBestCost;
  //_cost = currentBestCost;
#else
  // Centroid Split approach
  // Get center
  vec3 bvCenter = (bounds._min + bounds._max) * 0.5f;

  // Pick splitting plane normal
  vec3 spNormal;
  if (++roundRobin > 2)
    roundRobin = 0;

  if (roundRobin == 0)
    spNormal = vec3(1, 0, 0);
  else if (roundRobin == 1)
    spNormal = vec3(0, 1, 0);
  else
    spNormal = vec3(0, 0, 1);

  leftTriangles.clear();
  rightTriangles.clear();

  for (int i = 0; i < count; ++i)
  {
    // < 0 == left, >= 0 == right
    vec3 center = triangles[i]->v0 + triangles[i]->v1 + triangles[i]->v2;
    center /= 3;

    if (dot(center - bvCenter, spNormal) <= 0)
      leftTriangles.push_back(triangles[i]);
    else
      rightTriangles.push_back(triangles[i]);
  }
#endif
  int currIndex = 0;
  for (int i = 0; i < leftTriangles.size(); ++i)
  {
    triangles[currIndex++] = leftTriangles[i];
  }
  for (int i = 0; i < rightTriangles.size(); ++i)
  {
    triangles[currIndex++] = rightTriangles[i];
  }
  return leftTriangles.size();
}