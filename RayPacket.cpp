#include "RayPacket.h"
#include "raytracer.h"
#include "BvhNode.h"


RayPacket::RayPacket(Renderer& _Renderer, int _startX, int _startY)
: startX(_startX), startY(_startY), frustumGenerated(false)
{
  for (int y = 0; y < PACKET_SIZE; ++y)
  {
    for (int x = 0; x < PACKET_SIZE; ++x)
    {
      packet[y][x] = _Renderer.camera.GenerateRay(_startX + x, _startY + y);
    }
  }
}


RayPacket::~RayPacket()
{
}


void RayPacket::Trace(Renderer& _Renderer, Scene& _Scene)
{
  BvhNode* stack[128];
  int stackIdx = 0;
  stack[stackIdx++] = _Scene.bvhRoot;

  while (stackIdx)
  {
    BvhNode* currentNode = stack[--stackIdx];

    bool checkAllRays = false;
    bool firstRayHit = currentNode->Intersect(packet[0][0]);
    if (firstRayHit)
      checkAllRays = true;
    else
    {
      if (!frustumGenerated)
      {
        frustumGenerated = true;
        GenerateFrustum();
      }
      // Check frustum
      bool intersects = IntersectAABB(currentNode->bounds);
      if (intersects)
        checkAllRays = true;
    }
    if (checkAllRays)
    {
      for (int y = 0; y < PACKET_SIZE; ++y)
      {
        for (int x = 0; x < PACKET_SIZE; ++x)
        {
          vec3 col = _Renderer.TracePath(packet[y][x], 1.0f, currentNode);

          if (glm::length(col) > MAX_BRIGHTNESS)
          {
            col = normalize(col) * MAX_BRIGHTNESS;
          }

          _Renderer.accumulatedColours[y + startY][x + startX] += col;
          _Renderer.frameCounter[y + startY][x + startX] += 1;
        }
      }
    }
    else // Advance to next intersect
    {
      if (currentNode->isLeaf())
      {
        for (int y = 0; y < PACKET_SIZE; ++y)
        {
          for (int x = 0; x < PACKET_SIZE; ++x)
          {
            vec3 col = _Renderer.TracePath(packet[y][x], 1.0f, false);

            if (glm::length(col) > MAX_BRIGHTNESS)
            {
              col = normalize(col) * MAX_BRIGHTNESS;
            }

            _Renderer.accumulatedColours[y + startY][x + startX] += col;
            _Renderer.frameCounter[y + startY][x + startX] += 1;
          }
        }
      }
      else
      {
        if (currentNode->left)
          stack[stackIdx++] = currentNode->left;
        if (currentNode->right)
          stack[stackIdx++] = currentNode->right;
      }
    }
  }
}

// http://zach.in.tu-clausthal.de/teaching/cg_literatur/lighthouse3d_view_frustum_culling/index.html
bool RayPacket::IntersectAABB(const AABB &box) {

  bool result = true;
  int out, in;

  const vec3 box0 = box._min;
  const vec3 box7 = box._max;
  const vec3 box1(box0.x, box0.y, box7.z);
  const vec3 box2(box0.x, box7.y, box0.z);
  const vec3 box3(box0.x, box7.y, box7.z);
  const vec3 box4(box7.x, box0.y, box0.z);
  const vec3 box5(box7.x, box0.y, box7.z);
  const vec3 box6(box7.x, box7.y, box0.z);

  // for each plane do ...
  for (int i = 0; i < 6; i++) 
  {
    // reset counters for corners in and out
    out = 0; in = 0;
    // for each corner of the box do ...
    // get out of the cycle as soon as a box as corners
    // both inside and out of the frustum

    if (dot(frustumPlanes[i], box0 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box1 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box2 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box3 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box4 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box5 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box6 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;
    if (dot(frustumPlanes[i], box7 - frustumPlanePositions[i]) > 0)
      ++out;
    else
      in++;

    //if all corners are out
    if (!in)
      return false;
    // if some corners are out and others are in	
    else if (out)
      result = true;
  }
  return(result);
}


void RayPacket::GenerateFrustum()
{
  const Ray& topLeft = packet[0][0];
  const Ray& topRight = packet[0][PACKET_SIZE - 1];
  const Ray& bottomLeft = packet[PACKET_SIZE - 1][0];
  const Ray& bottomRight = packet[PACKET_SIZE - 1][PACKET_SIZE - 1];

  vec3 topLeftFar = topLeft.O + topLeft.D * 60.0f;
  vec3 topRightFar = topRight.O + topRight.D * 60.0f;
  vec3 bottomLeftFar = bottomLeft.O + bottomLeft.D * 60.0f;
  vec3 bottomRightFar = bottomRight.O + bottomRight.D * 60.0f;

  frustumPlanes[0] = cross(topRightFar - topRight.O, bottomRightFar - topRight.O); // right
  frustumPlanes[0] = normalize(frustumPlanes[0]);
  frustumPlanes[1] = cross(bottomLeftFar - topLeft.O, topLeftFar - topLeft.O); // left
  frustumPlanes[1] = normalize(frustumPlanes[1]);

  frustumPlanes[2] = cross(topLeftFar - topLeft.O, topRightFar - topLeft.O); // up
  frustumPlanes[2] = normalize(frustumPlanes[2]);
  frustumPlanes[3] = cross(bottomRightFar - topLeft.O, bottomLeftFar - topLeft.O); // down
  frustumPlanes[3] = normalize(frustumPlanes[3]);

  frustumPlanes[4] = cross(bottomRight.O - topLeft.O, topRight.O - topLeft.O); // near
  frustumPlanes[4] = normalize(frustumPlanes[4]);
  frustumPlanes[5] = cross(bottomRightFar - topLeftFar, topRightFar - topLeftFar); // far
  frustumPlanes[5] = normalize(frustumPlanes[5]);

  frustumPlanePositions[0] = topRightFar;
  frustumPlanePositions[1] = topLeftFar;
  frustumPlanePositions[2] = topLeftFar;
  frustumPlanePositions[3] = bottomLeftFar;
  frustumPlanePositions[4] = topLeft.O;
  frustumPlanePositions[5] = topLeftFar;
}