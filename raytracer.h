// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#pragma once
#include "Ray.h"
#include "Scene.h"
#include "Camera.h"
#include "definitions.h"

namespace Tmpl8 {

// == class Renderer ==========================================================
//    --------------
class Renderer
{
public:
	// constructor
	Renderer();
	// methods
  vec3 Trace(Ray& _Ray, int depth = 0, unsigned int _Debug = 0);
  vec3 TracePath(Ray& _Ray, float _CurrentProbability, bool _CheckBVH, unsigned int _Debug = 0);
  vec3 TracePath(Ray& _Ray, float _CurrentProbability, BvhNode* startNode); // Used by Ray Packet
	void Render();
  static void RenderLinePathTraced(int _Y, Pixel* _Buffer, Renderer* _Renderer, int _linesToRender);
  static void RenderTilePathTraced(int _X, int _Y, int _TileSize, Pixel* _Buffer, Renderer* _Renderer);
	// data members
	Scene scene;
	Camera camera;

  static void Line2D(float x1, float y1, float x2, float y2, unsigned int c);
  static void Plot2D(float x1, float y1, unsigned int c);

  float frameCounter[SCRHEIGHT][SCRWIDTH];
  int firstRenders[SCRHEIGHT];
  vec3 accumulatedColours[SCRHEIGHT][SCRWIDTH];
};

};

// EOF