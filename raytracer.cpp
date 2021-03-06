// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#include "template.h"
#include "surface.h"
#include "InputManager.h"

using namespace Tmpl8;
using namespace glm;

#include "raytracer.h"
#include "game.h"
#include "definitions.h"
#include "Random.h"
#include <thread>
#include <functional>
#include "BvhNode.h"
#include "JobDelegator.h"
#include "Texture.h"
#include "Plane.h"
#include "RayPacket.h"

extern Surface* screen; // defined in template.cpp

Renderer* RenderTileJob::renderer;
RenderTileJob renderJobs[SCRHEIGHT / PACKET_SIZE][SCRWIDTH / 2 / PACKET_SIZE];
Texture* skyDome;

// draw a line using world space coordinates
void Renderer::Line2D(float x1, float y1, float x2, float y2, unsigned int c)
{
  // convert world space coordinates to screen space and draw line
  x1 = SX(x1), y1 = SY(y1), x2 = SX(x2), y2 = SY(y2);
  screen->ClipTo(SCRWIDTH / 2 + 2, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
  screen->Line(x1, y1, x2, y2, c);
}

// plot a pixel using world space coordinates
void Renderer::Plot2D(float x1, float y1, unsigned int c)
{
  // convert world space coordinates to screen space and plot
  screen->Plot((int)SX(x1), (int)SY(y1), c);
}

// convert a color from float to 32-bit integer RGB
unsigned int ConvertColor(vec3& _Color)
{
  // convert a vec3 color to 32-bit integer
  int red = (int)(255.0f * min(1.0f, _Color.x));
  int green = (int)(255.0f * min(1.0f, _Color.y));
  int blue = (int)(255.0f * min(1.0f, _Color.z));
  return (red << 16) + (green << 8) + blue;
}


// == Scene class =============================================================
//    -----------
void Scene::Draw2D()
{
  // draw arrows
  const int cx = SCRWIDTH / 2, w = SCRWIDTH / 2, y2 = SCRHEIGHT - 1;
  screen->ClipTo(0, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
  screen->Line(cx, 0, cx, y2, 0xffffff);
  screen->Line(cx + 9, y2 - 6, cx + 9, y2 - 40, 0xffffff);
  screen->Line(cx + 9, y2 - 40, cx + 6, y2 - 37, 0xffffff);
  screen->Line(cx + 9, y2 - 40, cx + 12, y2 - 37, 0xffffff);
  screen->Line(cx + 9, y2 - 6, cx + 43, y2 - 6, 0xffffff);
  screen->Line(cx + 43, y2 - 6, cx + 40, y2 - 3, 0xffffff);
  screen->Line(cx + 43, y2 - 6, cx + 40, y2 - 9, 0xffffff);
  screen->Print("z", cx + 7, y2 - 50, 0xffffff);
  screen->Print("x", cx + 48, y2 - 8, 0xffffff);
  // 2D viewport
  Renderer::Line2D(0, -10000, 0, 10000, 0x004400);
  Renderer::Line2D(-10000, 0, 10000, 0, 0x004400);
  char t[128];
  sprintf(t, "%4.1f", WXMIN);
  screen->Print(t, SCRWIDTH / 2 + 2, (int)SY(0) - 7, 0x006600);
  sprintf(t, "%4.1f", WXMAX);
  screen->Print(t, SCRWIDTH - 30, (int)SY(0) - 7, 0x006600);
  sprintf(t, "%4.1f", WYMAX);
  screen->Print(t, (int)SX(0) + 2, 2, 0x006600);
  sprintf(t, "%4.1f", WYMIN);
  screen->Print(t, (int)SX(0) + 2, SCRHEIGHT - 8, 0x006600);
  for (int i = 0; i < primCount; i++) primList[i]->Draw2D();
  bvhRoot->Draw2D();
}


// == Renderer class ==========================================================
//    --------------
Renderer::Renderer()
{
  camera.Set(vec3(0, 1, -10), vec3(0, 0, 1));
  skyDome = new Texture();
  skyDome->Load("resources/sky.jpg");
  RenderTileJob::renderer = this;
  for (int y = 0; y < SCRHEIGHT / PACKET_SIZE; ++y)
  {
    for (int x = 0; x < SCRWIDTH / 2 / PACKET_SIZE; ++x)
    {
      renderJobs[y][x].x = x * PACKET_SIZE;
      renderJobs[y][x].y = y * PACKET_SIZE;
    }
  }
}

vec3 Renderer::Trace(Ray& _Ray, int depth, unsigned int _Debug)
{
  // intersect a single ray with the objects in the scene
  scene.Intersect(_Ray);

  // get the distance of the nearest intersection
  float distance = _Ray.t;

  if (_Ray.t > 1e33)
    return vec3();

  if (depth > MAX_TRACE_DEPTH)
    return _Ray.intersection.color;

  vec3 color = _Ray.intersection.prim->material->Illuminate(*this, _Ray, depth, false, _Debug);

  if (_Debug)
  {
    // clip to debug panel
    screen->ClipTo(SCRWIDTH / 2, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
    // draw ray
    _Ray.Draw2D(_Debug);
    // reset clip window
    screen->ClipTo(0, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
  }
  return color;
}

vec3 Renderer::TracePath(Ray& _Ray, float _CurrentProbability, bool _CheckBVH, unsigned int _Debug)
{
  // intersect a single ray with the objects in the scene
  scene.Intersect(_Ray);
  if (_CheckBVH)
    scene.IntersectBVH(_Ray);

  // get the distance of the nearest intersection
  float distance = _Ray.t;

  if (_Ray.t > 1e33f)
  {
    // Skydome
    vec2 uv = vec2(atan2(_Ray.D.z, _Ray.D.x) / PI / 2, acos(_Ray.D.y) / PI);
    //printf("%f\t%f\n", uv.x, uv.y);
    uv.x = fabsf(uv.x);
    uv.y = fabsf(uv.y);
    return skyDome->GetPixel(uv.x, uv.y) / ROULETTE_SURVIVAL_CHANCE;
  }

  vec3 color;
  float roulette = Random::value();
  if (roulette < ROULETTE_SURVIVAL_CHANCE) // Kill chance
  {
    color = _Ray.intersection.prim->material->Illuminate(*this, _Ray, 0, true, _Debug) / ROULETTE_SURVIVAL_CHANCE;
  }

  if (_Debug)
  {
    // clip to debug panel
    screen->ClipTo(SCRWIDTH / 2, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
    // draw ray
    _Ray.Draw2D(_Debug);
    // reset clip window
    screen->ClipTo(0, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
  }
  return color;
}

vec3 Renderer::TracePath(Ray& _Ray, float _CurrentProbability, BvhNode* _StartNode)
{
  // intersect a single ray with the objects in the scene
  scene.Intersect(_Ray);
  scene.IntersectBVH(_Ray, _StartNode);

  // get the distance of the nearest intersection
  float distance = _Ray.t;

  if (_Ray.t > 1e33f)
  {
    // Skydome
    vec2 uv = vec2(atan2(_Ray.D.z, _Ray.D.x) / PI / 2, acos(_Ray.D.y) / PI);
    //printf("%f\t%f\n", uv.x, uv.y);
    uv.x = fabsf(uv.x);
    uv.y = fabsf(uv.y);
    return skyDome->GetPixel(uv.x, uv.y) / ROULETTE_SURVIVAL_CHANCE;
  }
  //if (depth > MAX_TRACE_DEPTH)
  //  return _Ray.intersection.color;
  vec3 color;
  float roulette = Random::value();
  if (roulette < ROULETTE_SURVIVAL_CHANCE) // Kill chance
  {
    color = _Ray.intersection.prim->material->Illuminate(*this, _Ray, 0, true) / ROULETTE_SURVIVAL_CHANCE;
  }

  return color;
}

void Renderer::RenderLinePathTraced(int _Y, Pixel* _Buffer, Renderer* _Renderer, int _linesToRender)
{
  for (int y = _Y; y < _Y + _linesToRender; ++y)
  {
    for (int x = 0; x < (SCRWIDTH / 2); ++x)
    {
      // generate primary ray
      Ray ray = _Renderer->camera.GenerateRay(x, y);
      // trace primary ray
#ifdef _DEBUG
      if (Input->IsMouseButtonDown(SDL_BUTTON_LEFT))
      {
        if (y == Input->GetMousePosition().y && x == Input->GetMousePosition().x)
        {
          __debugbreak();
        }
      }
#endif

      vec3 color = _Renderer->TracePath(ray, 1, true);
      // visualize ray in 2D if y == 0, and for every 16th pixel

      // visualize intersection result
      //_Screen->Plot(x, y, ConvertColor(color));
      if (glm::length(color) > MAX_BRIGHTNESS)
      {
        color = normalize(color) * MAX_BRIGHTNESS;
      }

      _Renderer->accumulatedColours[y][x] += color;
      _Renderer->frameCounter[y][x] += 1;
    }
    for (int ix = 0; ix < SCRWIDTH / 2; ++ix)
    {
      _Buffer[ix + y * (SCRWIDTH)] =
        ConvertColor(_Renderer->accumulatedColours[y][ix] * (1.0f / _Renderer->frameCounter[y][ix]));
    }
  }
}

void Renderer::RenderTilePathTraced(int _X, int _Y, int _TileSize, Pixel* _Buffer, Renderer* _Renderer)
{
  RayPacket rayPacket(*_Renderer, _X, _Y);
  rayPacket.Trace(*_Renderer, _Renderer->scene);

  for (int y = 0; y < PACKET_SIZE; ++y)
  {
    for (int x = 0; x < PACKET_SIZE; ++x)
    {
      _Buffer[x + _X + ((y + _Y) * (SCRWIDTH))] =
        ConvertColor(_Renderer->accumulatedColours[(y + _Y)][x + _X] / _Renderer->frameCounter[(y + _Y)][x + _X]);
    }
  }
}

int currentY = 0;
void Renderer::Render()
{
  // visualize ray in 2D if y == SCRHEIGHT / 2, and for every 16th pixel
  int midY = SCRHEIGHT / 2;

  for (int x = 0; x < (SCRWIDTH / 2); x++)
  {
    if (((x % 32) == 0))
    {
      Ray ray = camera.GenerateRay(x, midY);
      TracePath(ray, 0, 0xFFFFFF);
    }
  }

  for (int y = 0; y < SCRHEIGHT / PACKET_SIZE; ++y)
  {
    for (int x = 0; x < SCRWIDTH / 2 / PACKET_SIZE; ++x)
    {
      JobSys->Queue(&renderJobs[y][x]);
    }
  }
  JobSys->Delegate();
  JobSys->Finish();
}


void RenderTileJob::Execute()
{
  Renderer::RenderTilePathTraced(x, y, PACKET_SIZE, screen->GetBuffer(), renderer);
}
// EOF