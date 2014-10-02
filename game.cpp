// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#include "string.h"
#include "game.h"
#include "surface.h"
#include "stdlib.h"
#include "template.h"
#include "definitions.h"

using namespace Tmpl8;
using namespace glm;

#include "raytracer.h"

Renderer renderer;
int currentLine = 0;

// == Game::Init ==============================================================
void Game::Init()
{
	// initialization code goes here
}

// == Game::Draw2DView ========================================================
void Game::Draw2DView()
{
	renderer.scene.Draw2D();
	renderer.camera.Draw2D();
}

// == Game::Init ==============================================================
void Game::Tick( float dt )
{
	screen->Clear( 0 );					// first line; clear screen..
	for(int i = 0; i < SCRHEIGHT; i++ )
	{
		renderer.Render( i );					
	}
}




