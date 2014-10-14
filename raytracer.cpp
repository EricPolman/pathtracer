// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#include "template.h"
#include "surface.h"

using namespace Tmpl8;
using namespace glm;

#include "raytracer.h"
#include "game.h"
#include "definitions.h"
#include "Random.h"
#include <thread>
#include <functional>

extern Surface* screen; // defined in template.cpp

// draw a line using world space coordinates
void Renderer::Line2D( float x1, float y1, float x2, float y2, unsigned int c )
{
	// convert world space coordinates to screen space and draw line
	x1 = SX( x1 ), y1 = SY( y1 ), x2 = SX( x2 ), y2 = SY( y2 );
	screen->ClipTo( SCRWIDTH / 2 + 2, 0, SCRWIDTH - 1, SCRHEIGHT - 1 );
	screen->Line( x1, y1, x2, y2, c );
}

// plot a pixel using world space coordinates
void Renderer::Plot2D( float x1, float y1, unsigned int c )
{
	// convert world space coordinates to screen space and plot
	screen->Plot( (int)SX( x1 ), (int)SY( y1 ), c );
}

// convert a color from float to 32-bit integer RGB
unsigned int ConvertColor( vec3& _Color )
{
	// convert a vec3 color to 32-bit integer
	int red = (int)(255.0f * min( 1.0f, _Color.x) );
	int green = (int)(255.0f * min( 1.0f, _Color.y) );
	int blue = (int)(255.0f * min( 1.0f, _Color.z) );
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
}


// == Renderer class ==========================================================
//    --------------
Renderer::Renderer()
{
  camera.Set(vec3(0, -1.5f, -7), vec3(0, 0, 1));
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
vec3 Renderer::TracePath(Ray& _Ray, int depth, unsigned int _Debug)
{
  // intersect a single ray with the objects in the scene
  scene.Intersect(_Ray);

  // get the distance of the nearest intersection
  float distance = _Ray.t;

  if (_Ray.t > 1e33f)
    return vec3();

  //if (depth > MAX_TRACE_DEPTH)
  //  return _Ray.intersection.color;
  vec3 color;
  float probability = Random::value();
  if (probability < (1.0f - depth / ROULETTE_FACTOR)) // Kill chance
  {
    color = _Ray.intersection.prim->material->Illuminate(*this, _Ray, depth, true, _Debug) / (1.0f - depth / ROULETTE_FACTOR);
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

void Renderer::RenderLinePathTraced(int _Y, Pixel* _Buffer, Renderer* _Renderer, int _linesToRender)
{
  for (int y = _Y; y < _Y + _linesToRender; ++y)
  {
    for (int x = 0; x < (SCRWIDTH / 2); ++x)
    {
      // generate primary ray
      Ray ray = _Renderer->camera.GenerateRay(x, y);
      // trace primary ray
      vec3 color = _Renderer->TracePath(ray, 1);
      // visualize ray in 2D if y == 0, and for every 16th pixel

      // visualize intersection result
      //_Screen->Plot(x, y, ConvertColor(color));

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

void Renderer::Render( )
{
  // visualize ray in 2D if y == SCRHEIGHT / 2, and for every 16th pixel
  int midY = SCRHEIGHT / 2;
  Ray midRay = camera.GenerateSimpleRay(SCRWIDTH / 4, midY);
  Trace(midRay);
  camera.focusDistance = midRay.t;

  for (int x = 0; x < (SCRWIDTH / 2); x++)
  {
    if (((x % 32) == 0))
    {
      Ray ray = camera.GenerateRay(x, midY);
      TracePath(ray, 0, 0xFFFFFF);
    }
  }

  const static int THREADS = 4;
  std::thread threads[THREADS];

  for (int t = 0; t < THREADS; ++t)
  {
    threads[t] = std::thread(&Renderer::RenderLinePathTraced, SCRHEIGHT / THREADS * t, screen->GetBuffer(), this, SCRHEIGHT / THREADS);
  }
  for (int t = 0; t < THREADS; t++)
  {
    threads[t].join();
  }
}

// EOF