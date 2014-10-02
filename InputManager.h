#pragma once
// Borrowed from my PR2 project (Micro Machines)

#include <map>
#include "Singleton.h"
#include "glm/glm.hpp"
#include "SDL_keyboard.h"
#include "SDL_keycode.h"
#include "SDL_mouse.h"

using namespace glm;

class InputManager : public Singleton<InputManager>
{
public:
	~InputManager(void);
	InputManager(void);
	
	bool IsKeyPressed(SDL_Keycode a_key);
	bool IsKeyDown(SDL_Keycode a_key);
	bool IsKeyUp(SDL_Keycode a_key);
	
	void SetKeyPressed(SDL_Keycode a_key);
	void SetKeyUp(SDL_Keycode a_key);

	bool IsMouseButtonPressed(Uint8 a_mouseButton);
	bool IsMouseButtonDown(Uint8 a_mouseButton);
	bool IsMouseButtonUp(Uint8 a_mouseButton);
	
	void SetMouseButtonPressed(Uint8 a_mouseButton);
	void SetMouseButtonUp(Uint8 a_mouseButton);
	
	void SetMousePosition(float x, float y);
	void SetMouseMovement(float x, float y);
	vec2 GetMousePosition();
  
  virtual void Update(float a_fDeltaTime);
private:
	
	vec2 m_mousePosition;
	vec2 m_mouseMovement;
	
	std::map<SDL_Keycode, bool> m_keysDown;
	std::map<SDL_Keycode, bool> m_keysPressed;
	std::map<SDL_Keycode, bool> m_keysUp;
	
	std::map<Uint8, bool> m_mouseButtonDown;
	std::map<Uint8, bool> m_mouseButtonPressed;
	std::map<Uint8, bool> m_mouseButtonUp;
};

#define Input InputManager::GetInstance()