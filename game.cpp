// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#include "Random.h"
#include "string.h"
#include "game.h"
#include "surface.h"
#include "stdlib.h"
#include "template.h"
#include "definitions.h"
#include "InputManager.h"

using namespace Tmpl8;
using namespace glm;

std::_Bind<false, void, Distribution, Engine> Random::_r(std::bind(Distribution(0.0f, 1.0f), Engine((int)time(NULL))));

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

  if (Input->IsKeyDown(SDLK_LEFT))
  {
    renderer.camera.eyePos.x -= 0.005f;
  }
}




