// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#include "InputManager.h"
#include "Random.h"
#include "string.h"
#include "game.h"
#include "surface.h"
#include "stdlib.h"
#include "template.h"
#include "definitions.h"
#include "BvhNode.h"

using namespace Tmpl8;
using namespace glm;

std::_Bind<false, void, Distribution, Engine> Random::value(std::bind(Distribution(0.0f, 1.0f), Engine((int)time(NULL))));

#include "raytracer.h"

Renderer renderer;
int currentLine = 0;

vec2 oldMousePos;

vec3 startViewDir;

// == Game::Init ==============================================================
void Game::Init()
{
	// initialization code goes here
  startViewDir = renderer.camera.V;
}

// == Game::Draw2DView ========================================================
void Game::Draw2DView()
{
  screen->ClipTo(0, 0, SCRWIDTH - 1, SCRHEIGHT - 1);
  renderer.scene.Draw2D();
  renderer.camera.Draw2D();
  screen->ClipTo(0, 0, float(SCRWIDTH / 2), float(SCRHEIGHT));
}

// == Game::Init ==============================================================
void Game::Tick( float dt )
{
	screen->Clear( 0 );					// first line; clear screen..
  Draw2DView();
  renderer.Render();

  vec2 mousePosition = Input->GetMousePosition();
  vec2 mouseMovement = mousePosition - oldMousePos;
  mouseMovement.x /= SCRWIDTH;
  mouseMovement.y /= SCRHEIGHT;

  bool movement = false;

  if (Input->IsKeyDown(SDLK_LEFT))
  {
    renderer.camera.eyePos -= dt * renderer.camera.right;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_RIGHT))
  {
    renderer.camera.eyePos += dt * renderer.camera.right;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_UP))
  {
    renderer.camera.eyePos += dt * normalize(renderer.camera.V);
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_DOWN))
  {
    renderer.camera.eyePos -= dt * normalize(renderer.camera.V);
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_KP_4))
  {
    renderer.camera.eyePos.y += dt;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_KP_1))
  {
    renderer.camera.eyePos.y -= dt;
    movement = true;
  }

  if (Input->IsMouseButtonDown(SDL_BUTTON_RIGHT))
  {
    renderer.camera.rotation *= glm::angleAxis(0.02f * mouseMovement.x * 4000, vec3(0, 1, 0)) * glm::angleAxis(0.02f * mouseMovement.y * 4000, vec3(1, 0, 0));
    movement = true;
  }
  if (Input->IsMouseButtonDown(SDL_BUTTON_LEFT))
  {
    if (mousePosition.x < SCRWIDTH / 2 && mousePosition.x > 0 && 
      mousePosition.y < SCRHEIGHT && mousePosition.y > 0)
    {
      Ray r = renderer.camera.GenerateSimpleRay(mousePosition.x, mousePosition.y);
      renderer.TracePath(r, 1, true, 0);
      renderer.camera.focusDistance = r.t;
    }
    //renderer.camera. *= glm::angleAxis(0.02f * mouseMovement.x * 4000, vec3(0, 1, 0)) * glm::angleAxis(0.02f * mouseMovement.y * 4000, vec3(1, 0, 0));
    movement = true;
  }  

  if (movement)
  {
    memset(&renderer.firstRenders[0], 0, sizeof(renderer.firstRenders));
    memset(renderer.frameCounter[0], 0, sizeof(renderer.frameCounter));
    memset(renderer.accumulatedColours[0], 0, sizeof(renderer.accumulatedColours));
  }

  renderer.camera.Set(renderer.camera.eyePos, renderer.camera.rotation * vec3(0, 0, 1));

  oldMousePos = Input->GetMousePosition();
}




