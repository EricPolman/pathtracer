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

vec2 oldMousePos;

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
  screen->ClipTo(0, 0, float(SCRWIDTH / 2), float(SCRHEIGHT));
  renderer.Render();
  screen->ClipTo(0, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
  renderer.scene.Draw2D();
  renderer.camera.Draw2D();


  vec2 mousePosition = Input->GetMousePosition();
  vec2 mouseMovement = mousePosition - oldMousePos;
  mouseMovement.x /= SCRWIDTH;
  mouseMovement.y /= SCRHEIGHT;

  if (Input->IsKeyDown(SDLK_LEFT))
  {
    renderer.camera.eyePos.x -= dt;
  }
  if (Input->IsKeyDown(SDLK_RIGHT))
  {
    renderer.camera.eyePos.x += dt;
  }
  if (Input->IsKeyDown(SDLK_UP))
  {
    renderer.camera.eyePos.z += dt;
  }
  if (Input->IsKeyDown(SDLK_DOWN))
  {
    renderer.camera.eyePos.z -= dt;
  }
  if (Input->IsKeyDown(SDLK_KP_4))
  {
    renderer.camera.eyePos.y -= dt;
  }
  if (Input->IsKeyDown(SDLK_KP_1))
  {
    renderer.camera.eyePos.y += dt;
  }
  
  if (Input->IsMouseButtonDown(SDL_BUTTON_RIGHT))
  {
    renderer.camera.rotation *= glm::angleAxis(dt * mouseMovement.x * 4000, vec3(0, 1, 0)) * glm::angleAxis(dt * mouseMovement.y * 4000, vec3(-1, 0, 0));
  }

  renderer.camera.Set(renderer.camera.eyePos, renderer.camera.rotation * vec3(0,0,1));
  oldMousePos = Input->GetMousePosition();
}




