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
  camera.Set(vec3(0, 0, -3), vec3(0, 0, 1));
  for (int i = 0; i < 100; ++i)
    printf("asdf\n");
}

vec3 Renderer::Trace( Ray& _Ray )
{
	// intersect a single ray with the objects in the scene
	scene.Intersect( _Ray );

	// get the distance of the nearest intersection
	float distance = _Ray.t;

	// turn this into a greyscale value for now
	float color = 1.0f - min( distance / 6, 1.0f );
	return vec3( color, color, color );
}

void Renderer::Render( int _Y )
{
	// ray trace one line of pixels of the final image
	for ( int x = 0; x < (SCRWIDTH / 2); x++ )
	{
		// generate primary ray
		Ray ray = camera.GenerateRay( x, _Y );
		// trace primary ray
		vec3 color = Trace( ray );
		// visualize ray in 2D if y == 0, and for every 16th pixel
		if ((_Y == (SCRHEIGHT / 2)) && ((x % 16) == 0)) 
		{
			// clip to debug panel
			screen->ClipTo( SCRWIDTH / 2, 0, SCRWIDTH - 1, SCRHEIGHT - 1 );
			// draw ray
			ray.Draw2D();
			// reset clip window
			screen->ClipTo( 0, 0, SCRWIDTH - 1, SCRHEIGHT - 1 );
		}
		// visualize intersection result
		screen->Plot( x, _Y, ConvertColor( color ) );
	}
}

// EOF