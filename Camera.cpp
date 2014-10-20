#include "Camera.h"
#include "raytracer.h"
#include "definitions.h"

using namespace Tmpl8;

void Camera::Draw2D()
{
  // draw view frustum
  Renderer::Line2D(eyePos.x, eyePos.z, p1.x, p1.z, 0xaa);
  Renderer::Line2D(eyePos.x, eyePos.z, p2.x, p2.z, 0xaa);
  Renderer::Line2D(p1.x, p1.z, p2.x, p2.z, 0xaa);
}

void Camera::Set(vec3 _Pos, vec3 _Direction)
{
  // set position and view direction, then calculate screen corners
  eyePos = _Pos;
  V = _Direction;

  right = glm::cross(V, glm::vec3(0, -1, 0));
  up = glm::cross(V, right);
  right = glm::normalize(right);
  up = glm::normalize(up);

  p1 = (-0.5f * right*focusDistance) + (-0.5f * up*focusDistance) + (V*focusDistance) + _Pos;
  p2 = (0.5f * right*focusDistance) + (-0.5f * up*focusDistance) + (V*focusDistance) + _Pos;
  p3 = (0.5f * right*focusDistance) + (0.5f * up*focusDistance) + (V*focusDistance) + _Pos;
  p4 = (-0.5f * right*focusDistance) + (0.5f * up*focusDistance) + (V*focusDistance) + _Pos;
}

Ray Camera::GenerateRay(int _X, int _Y)
{
  // calculate position on virtual screen plane floating in front of camera
  float fx = ((float)_X + Random::value()) / (SCRWIDTH / 2), fy = ((float)_Y + Random::value()) / SCRHEIGHT;
  vec3 P = p1 + (p2 - p1) * fx + (p4 - p1) * fy;
  // generate a ray starting at the camera, going through a pixel
  Ray ray;
  ray.O = eyePos + right * (Random::value() - 0.5f) * (1.0f / 4.0f) + up * (Random::value() - 0.5f)* (1.0f / 4.0f);
  ray.D = normalize(P - ray.O);
  ray.t = 1e34;
  return ray;
}

Ray Camera::GenerateSimpleRay(int _X, int _Y)
{
  // calculate position on virtual screen plane floating in front of camera
  float fx = (float)_X / (SCRWIDTH / 2), fy = (float)_Y / SCRHEIGHT;
  vec3 P = p1 + (p2 - p1) * fx + (p4 - p1) * fy;
  // generate a ray starting at the camera, going through a pixel
  Ray ray;
  ray.O = eyePos;
  ray.D = normalize(P - eyePos);
  ray.t = 1e34;
  return ray;
}