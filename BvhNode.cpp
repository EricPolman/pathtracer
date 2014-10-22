#include "BvhNode.h"
#include "Ray.h"
#include "Triangle.h"
#include "Material.h"
#include "raytracer.h"
#include <map>
#include <vector>

struct SplitPlane
{
  SplitPlane(const vec3& p, const vec3& n) : position(p), normal(n) { }

  vec3 position;
  float padding0;
  vec3 normal;
  float padding1;
};

std::queue<SplitInstruction> BvhNode::splitQueue;
std::vector<SplitPlane> splitPlaneCandidates;


BvhNode::BvhNode(const vec3& b0, const vec3& b1)
: bound0(b0), bound1(b1), numObjects(0), left(nullptr), right(nullptr)
{
}


BvhNode::~BvhNode()
{
}

static int inc = 0;
void BvhNode::Draw2D()
{
  Renderer::Line2D(bound0.x, bound0.z, bound0.x, bound1.z, 0xff00ff);
  Renderer::Line2D(bound0.x, bound0.z, bound1.x, bound0.z, 0xff00ff);
  Renderer::Line2D(bound1.x, bound0.z, bound1.x, bound1.z, 0xff00ff);
  Renderer::Line2D(bound1.x, bound1.z, bound0.x, bound1.z, 0xff00ff);

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
}

float GetSurfaceArea(const AABB& box)
{
  vec3 size = box.boundMax - box.boundMin;
  return 2.0f * (size.x * size.y + size.x * size.z + size.z * size.y);
}

float TraverseCost()
{
  return 0.0f;
}

float IntersectionCost()
{
  return 0.0f;
}


bool BvhNode::Intersect(Ray& _Ray)
{
  // Ray - AABB intersect
  // r.dir is unit direction vector of ray
  vec3 dirfrac(1.0f / _Ray.D.x, 1.0f / _Ray.D.y, 1.0f / _Ray.D.z);
  // lb is the corner of AABB with minimal coordinates - left bottom, rt is maximal corner
  // r.org is origin of ray

  float t1 = (bound0.x - _Ray.O.x)*dirfrac.x;
  float t2 = (bound1.x - _Ray.O.x)*dirfrac.x;
  float t3 = (bound0.y - _Ray.O.y)*dirfrac.y;
  float t4 = (bound1.y - _Ray.O.y)*dirfrac.y;
  float t5 = (bound0.z - _Ray.O.z)*dirfrac.z;
  float t6 = (bound1.z - _Ray.O.z)*dirfrac.z;

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
    if (isLeaf())
    {
      for (int i = 0; i < numObjects; ++i)
      {
        tris[i]->Intersect(_Ray);
      }
    }
    else
    {
      if (left)
        left->Intersect(_Ray);
      if (right)
        right->Intersect(_Ray);
    }

    return true;
  }
  return false;
}

void BvhNode::Build(Triangle** _Tris, int _Count)
{
  // Real-Time Collision Detection p.240
  // Top-down Construction of BVH
  
  if (_Count <= MIN_OBJECTS_IN_BVH_NODE)
  {
    // Is leaf
    tris = _Tris;
    numObjects = _Count;
  }
  else
  {
    for (int i = 0; i < _Count; ++i)
    {
      const AABB triBox = AABB::CreateFromTriangle(*_Tris[i]);
      const vec3 triBoxCenter = (triBox.boundMin + triBox.boundMax) * 0.5f;
      const vec3 triBoxExtends = (triBox.boundMax - triBox.boundMin) * 0.5f;

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

    // Split this thing yo
    int p = Partition(_Tris, _Count);

    if (p == _Count || p == 0)
    {
      // Is leaf
      tris = _Tris;
      numObjects = _Count;
    }
    else
    {
      SplitInstruction instr;
      instr.node = this;
      instr.p = p;
      instr.tris = _Tris;
      instr.count = _Count;

      splitQueue.push(instr);
    }
  }
}

static int roundRobin = 0;
int BvhNode::Partition(Triangle** triangles, int count)
{
  static std::vector<Triangle*> onTheLeft;
  static std::vector<Triangle*> onTheRight;

  /*// Naive SAH approach
  SplitPlane* currentBestCandidate = nullptr;
  float currentBestCost = 1e34f;
  for (auto splane : splitPlaneCandidates)
  {
    onTheLeft.clear();
    onTheRight.clear();

    for (int i = 0; i < count; ++i)
    {
      bool onLeft = false, onRight = false;

      float v0dot = dot(triangles[i]->v0 - splane.position, splane.normal);
      float v1dot = dot(triangles[i]->v1 - splane.position, splane.normal);
      float v2dot = dot(triangles[i]->v2 - splane.position, splane.normal);

      if (v0dot < 0 || v1dot < 0 || v2dot < 0)
        onLeft = true;
      if (v0dot >= 0 || v1dot >= 0 || v2dot >= 0)
        onRight = true;

      if (onLeft && onRight)
        onTheLeft.push_back(triangles[i]);
      else if (onLeft)
        onTheLeft.push_back(triangles[i]);
      else
        onTheRight.push_back(triangles[i]);
    }

    // Calculate costs and evaluate best split

    AABB leftAABB; if (onTheLeft.size() > 0) leftAABB = AABB::CreateFromTriangles(&onTheLeft[0], onTheLeft.size());
    AABB rightAABB; if (onTheRight.size() > 0) rightAABB = AABB::CreateFromTriangles(&onTheRight[0], onTheRight.size());
    float totalSurface = GetSurfaceArea(leftAABB) + GetSurfaceArea(rightAABB);
    if (totalSurface < currentBestCost)
    {
      currentBestCost = totalSurface;
      currentBestCandidate = &splane;
    }
  }*/

  // Non-SAH approach (naive)
  // Get center
  vec3 bvCenter = (bound0 + bound1) * 0.5f;

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

  onTheLeft.clear();
  onTheRight.clear();

  for (int i = 0; i < count; ++i)
  {
    bool onLeft = false, onRight = false;

    // < 0 == left, >= 0 == right
    float v0dot = dot(triangles[i]->v0 - bvCenter, spNormal);
    float v1dot = dot(triangles[i]->v1 - bvCenter, spNormal);
    float v2dot = dot(triangles[i]->v2 - bvCenter, spNormal);

    if (v0dot < 0 || v1dot < 0 || v2dot < 0)
      onLeft = true;
    if (v0dot >= 0 || v1dot >= 0 || v2dot >= 0)
      onRight = true;

    if (onLeft && onRight)
      onTheLeft.push_back(triangles[i]);
    else if (onLeft)
      onTheLeft.push_back(triangles[i]);
    else
      onTheRight.push_back(triangles[i]);
  }
  
  int currIndex = 0;
  for (int i = 0; i < onTheLeft.size(); ++i)
  {
    triangles[currIndex++] = onTheLeft[i];
  }
  for (int i = 0; i < onTheRight.size(); ++i)
  {
    triangles[currIndex++] = onTheRight[i];
  }
  splitPlaneCandidates.clear();
  return onTheLeft.size();
}