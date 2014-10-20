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
#include "BvhNode.h"

using namespace Tmpl8;
using namespace glm;

std::_Bind<false, void, Distribution, Engine> Random::_r(std::bind(Distribution(0.0f, 1.0f), Engine((int)time(NULL))));

#include "raytracer.h"

Renderer renderer;
int currentLine = 0;

vec2 oldMousePos;

vec3 startViewDir;

// == Game::Init ==============================================================
void Game::Init()
{
	// initialization code goes here
  printf("%i\n", sizeof(BvhNode));
  startViewDir = renderer.camera.V;
  Draw2DView();
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
	//screen->Clear( 0 );					// first line; clear screen..
  renderer.Render();

  vec2 mousePosition = Input->GetMousePosition();
  vec2 mouseMovement = mousePosition - oldMousePos;
  mouseMovement.x /= SCRWIDTH;
  mouseMovement.y /= SCRHEIGHT;

  bool movement = false;

  if (Input->IsKeyDown(SDLK_LEFT))
  {
    renderer.camera.eyePos.x -= dt;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_RIGHT))
  {
    renderer.camera.eyePos.x += dt;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_UP))
  {
    renderer.camera.eyePos.z += dt;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_DOWN))
  {
    renderer.camera.eyePos.z -= dt;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_KP_4))
  {
    renderer.camera.eyePos.y -= dt;
    movement = true;
  }
  if (Input->IsKeyDown(SDLK_KP_1))
  {
    renderer.camera.eyePos.y += dt;
    movement = true;
  }
  
  if (Input->IsMouseButtonDown(SDL_BUTTON_RIGHT))
  {
    renderer.camera.rotation *= glm::angleAxis(0.02f * mouseMovement.x * 4000, vec3(0, 1, 0)) * glm::angleAxis(0.02f * mouseMovement.y * 4000, vec3(-1, 0, 0));
    movement = true;
  }

  if (Input->IsKeyDown(SDLK_r))
  {
    renderer.scene.primList[1]->material->refractionIndex += 0.25f;
    printf("%f\n", renderer.scene.primList[1]->material->refractionIndex);
  }
  

  if (movement)
  {
    memset(&renderer.firstRenders[0], 0, sizeof(renderer.firstRenders));
    memset(renderer.frameCounter[0], 0, sizeof(renderer.frameCounter));
    memset(renderer.accumulatedColours[0], 0, sizeof(renderer.accumulatedColours));
    renderer.camera.Set(renderer.camera.eyePos, renderer.camera.rotation * vec3(0,0,1));
  }

  oldMousePos = Input->GetMousePosition();
}




