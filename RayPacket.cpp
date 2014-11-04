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

  // reset counters for corners in and out
  out = 0; in = 0;
  // for each corner of the box do ...
  // get out of the cycle as soon as a box as corners
  // both inside and out of the frustum
  for (int k = 0; k < 8 && (in == 0 || out == 0); k++)
  {
    const vec3& b = *(&box0 + k);
    __m128 Bx4 = _mm_set1_ps(b.x);
    __m128 By4 = _mm_set1_ps(b.y);
    __m128 Bz4 = _mm_set1_ps(b.z);

    __m128 Dx4 = _mm_sub_ps(Bx4, Px4);
    __m128 Dy4 = _mm_sub_ps(By4, Py4);
    __m128 Dz4 = _mm_sub_ps(Bz4, Pz4);

    union
    {
      __m128 mul4;
      float mul[4];
    };
    mul4 = _mm_add_ps(_mm_mul_ps(Nx4, Dx4), _mm_add_ps(_mm_mul_ps(Ny4, Dy4), _mm_mul_ps(Nz4, Dz4)));

    if (mul[0] > 0 && mul[1] > 0 && mul[2] > 0 && mul[3] > 0)
      ++out;
    else
      in++;
  }

  //if all corners are out
  if (!in)
    return false;
  // if some corners are out and others are in	
  else if (out)
    return true;
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

  vec3 frustumPlane = cross(topRightFar - topRight.O, bottomRightFar - topRight.O); // right
  frustumPlane = normalize(frustumPlane);
  Nx[0] = frustumPlane.x;
  Ny[0] = frustumPlane.y;
  Nz[0] = frustumPlane.z;

  frustumPlane = cross(bottomLeftFar - topLeft.O, topLeftFar - topLeft.O); // left
  frustumPlane = normalize(frustumPlane);
  Nx[1] = frustumPlane.x;
  Ny[1] = frustumPlane.y;
  Nz[1] = frustumPlane.z;

  frustumPlane = cross(topLeftFar - topLeft.O, topRightFar - topLeft.O); // up
  frustumPlane = normalize(frustumPlane);
  Nx[2] = frustumPlane.x;
  Ny[2] = frustumPlane.y;
  Nz[2] = frustumPlane.z;

  frustumPlane = cross(bottomRightFar - topLeft.O, bottomLeftFar - topLeft.O); // down
  frustumPlane = normalize(frustumPlane);
  Nx[3] = frustumPlane.x;
  Ny[3] = frustumPlane.y;
  Nz[3] = frustumPlane.z;

  Px[0] = topRightFar.x;
  Px[1] = topLeftFar.x;
  Px[2] = topLeftFar.x;
  Px[3] = bottomLeftFar.x;

  Py[0] = topRightFar.y;
  Py[1] = topLeftFar.y;
  Py[2] = topLeftFar.y;
  Py[3] = bottomLeftFar.y;

  Pz[0] = topRightFar.y;
  Pz[1] = topLeftFar.y;
  Pz[2] = topLeftFar.y;
  Pz[3] = bottomLeftFar.y;
}