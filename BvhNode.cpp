#include "BvhNode.h"
#include "Ray.h"
#include "Triangle.h"
#include "Material.h"
#include "raytracer.h"
#include <map>
#include <vector>

BvhNode::BvhNode(const vec3& b0, const vec3& b1)
: bound0(b0), bound1(b1), numObjects(0), left(nullptr), right(nullptr)
{
}


BvhNode::~BvhNode()
{
}


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
    // Split this thing yo
    int p = Partition(_Tris, _Count);

    // Get BV for left
    if (p > 0)
    {
      AABB bvLeft = AABB::CreateFromTriangles(_Tris, p);

      // Get BV for right
      left = new BvhNode(bvLeft.boundMin, bvLeft.boundMax);

      left->Build(_Tris, p);
    }
    if (p < _Count)
    {
      AABB bvRight = AABB::CreateFromTriangles(_Tris + p, _Count - p);
      right = new BvhNode(bvRight.boundMin, bvRight.boundMax);

      right->Build(_Tris + p, _Count - p);
    }
  }
}

static int roundRobin = 0;
int BvhNode::Partition(Triangle** triangles, int count)
{
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

  std::vector<Triangle*> onTheLeft;
  std::vector<Triangle*> onTheRight;
  std::vector<Triangle*> inTheMiddle;
  
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
      inTheMiddle.push_back(triangles[i]);
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
  for (int i = 0; i < inTheMiddle.size(); ++i)
  {
    triangles[currIndex++] = inTheMiddle[i];
  }
  for (int i = 0; i < onTheRight.size(); ++i)
  {
    triangles[currIndex++] = onTheRight[i];
  }

  return onTheLeft.size() + inTheMiddle.size();
}

bool BvhNode::TriangleBoxIntersection(Triangle* _Tri)
{
  const Triangle& triangle = *_Tri;

  /*// SAT for Triangle-AABB intersection, p.169 of Real-Time Collision Detection
  static const vec3 axes[13] =
  {
    triangle.N,     // Triangle face normal
    vec3(0, 0, 1),  // Z-axis normal
    vec3(0, 1, 0),  // Y-axis normal
    vec3(1, 0, 0),  // X-axis normal
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0),
    vec3(0, 0, 0)
  };*/

  // First get AABB, then check if AABB overlaps BvhNode. Quick & dirty
  AABB triBox = AABB::CreateFromTriangle(triangle);
  // AABB-AABB intersection, p.79 of Real-Time Collision Detection
  if (bound1.x < triBox.boundMin.x || bound0.x > triBox.boundMax.x) return false;
  if (bound1.y < triBox.boundMin.y || bound0.y > triBox.boundMax.y) return false;
  if (bound1.z < triBox.boundMin.z || bound0.z > triBox.boundMax.z) return false;

  return true;
}