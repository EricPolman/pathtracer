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
	void Render();
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