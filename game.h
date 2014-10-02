// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#pragma once

namespace Tmpl8 {

class Surface;
class Game
{
public:
	void SetTarget( Surface* a_Surface ) { screen = a_Surface; }
	void Init();
	void Draw2DView();
	void Tick( float dt );
	void Shutdown() { /* implement if you want code to be executed upon app exit */ };
	void MouseUp( int button ) { /* implement if you want code to be executed upon app exit */ };
	void MouseDown( int button ) { /* implement if you want code to be executed upon app exit */ };
	void MouseMove( int x, unsigned int y ) { /* implement if you want code to be executed upon app exit */ };
	void KeyUp( int code ) { /* implement if you want code to be executed upon app exit */ };
	void KeyDown( int code ) { /* implement if you want code to be executed upon app exit */ };
private:
	Surface* screen;
};

}; // namespace Tmpl8