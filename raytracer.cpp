// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#include "template.h"
#include "surface.h"

using namespace Tmpl8;
using namespace glm;

#include "raytracer.h"
#include "game.h"

extern Surface* screen; // defined in template.cpp

// == HELPER FUNCTIONS ========================================================
//    ----------------

// visible world space definition
#define WXMIN	-3.5f	// left edge of visible world
#define WYMIN	-3.5f	// top edge of visible world
#define WXMAX	 3.5f	// right edge of visible world
#define WYMAX	 3.5f	// bottom edge of visible world

// world space to screen space conversion
#define SX(x) ((((x)-(WXMIN))/((WXMAX)-(WXMIN)))*(SCRWIDTH/2)+SCRWIDTH/2)
#define SY(y) ((((-y)-(WYMIN))/((WYMAX)-(WYMIN)))*SCRHEIGHT) // trust me

// draw a line using world space coordinates
void Line2D( float x1, float y1, float x2, float y2, unsigned int c )
{
	// convert world space coordinates to screen space and draw line
	x1 = SX( x1 ), y1 = SY( y1 ), x2 = SX( x2 ), y2 = SY( y2 );
	screen->ClipTo( SCRWIDTH / 2 + 2, 0, SCRWIDTH - 1, SCRHEIGHT - 1 );
	screen->Line( x1, y1, x2, y2, c );
}

// plot a pixel using world space coordinates
void Plot2D( float x1, float y1, unsigned int c )
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

// == Ray class ===============================================================
//    ---------
void Ray::Draw2D()
{
	Line2D( O.x, O.z, O.x + 10000 * D.x, O.z + 10000 + D.z, 0x111111 );
	Line2D( O.x, O.z, O.x + D.x, O.z + D.z, 0x666666 );	
	Line2D( O.x, O.z, O.x + t * D.x, O.z + t * D.z, 0xaaaa00 );	
	Plot2D( O.x + t * D.x, O.z + t * D.z, 0xff0000 );
}

// == Plane class =============================================================
//    -----------
Plane::Plane( vec3 _V0, vec3 _V1, vec3 _V2 )
{
	// construct an infinite plane based on three points
	const vec3 e1 = _V1 - _V0, e2 = _V2 - _V0;
	N = normalize( cross( e1, e2 ) );
	dist = dot( _V0, N );
	material = 0;
}

void Plane::Intersect( Ray& _Ray )
{
	// find the intersection of a ray and an infinite plane
	float t = (-dot( _Ray.O, N ) + dist) / dot( _Ray.D, N );
	// store distance in ray if smaller than previous found distance
	if ((t < _Ray.t) && (t >= 0))
	{
		_Ray.t = t;
		_Ray.intersection.N = N;
		if (material) _Ray.intersection.color = material->color;
	}
}

void Plane::Draw2D()
{
	// visualize plane
	if (fabs( N.y ) < EPSILON) // we can only draw a line for vertical planes
	{
		// get a point on the plane
		vec3 p0 = N * dist;
		// determine vector perpendicular to N (and thus parallel to the plane)
		vec3 B( -N.z, 0.0f, N.x );
		// calculate two points on the plane, far apart
		vec3 p1 = p0 + B * 10000.0f;
		vec3 p2 = p0 - B * 10000.0f;
		// connect these points with a line
		Line2D( p1.x, p1.z, p2.x, p2.z, 0xffffff );
	}
}

// == Sphere class ============================================================
//    ------------
void Sphere::Intersect( Ray& _Ray )
{
	// find the intersection of a ray and a sphere
	// http://www.ccs.neu.edu/home/fell/CSU540/programs/RayTracingFormulas.htm
	float t = 1e34;
	float a = dot( _Ray.D, _Ray.D ), b = 2.0f * dot( _Ray.D, _Ray.O - P );
	float c = dot( P, P ) + dot( _Ray.O, _Ray.O ) - 2.0f * dot( P, _Ray.O ) - r * r;
	float d = b * b - 4 * a * c;
	if (d >= 0)
	{
		float t1 = (-b - sqrtf( d )) / (2 * a);
		float t2 = (-b + sqrtf( d )) / (2 * a);
		if ((t1 < t) && (t1 >= 0)) t = t1;
		if ((t2 < t) && (t2 >= 0)) t = t2;
	}
	// store distance in ray if smaller than previous found distance
	if (t < _Ray.t)
	{
		_Ray.t = t;
		_Ray.intersection.N = vec3( 0, 1, 0 ); // todo: determine normal at intersection
		if (material) _Ray.intersection.color = material->color;
	}
}

void Sphere::Draw2D()
{
	// visualize a sphere by drawing 72 line segments around the center
	float x1 = r * sinf( 0 ) + P.x, y1 = r * cosf( 0 ) + P.z, x2, y2;
	for ( int i = 1; i <= 72; i++, x1 = x2, y1 = y2 )
	{
		float degrees = i * 5.0f, radians = degrees * PI / 180;
		x2 = r * sinf( radians ) + P.x, y2 = r * cosf( radians ) + P.z;
		Line2D( x1, y1, x2, y2, 0xffffff );
	}
}

// == Triangle class ==========================================================
//    --------------
Triangle::Triangle( vec3 _V0, vec3 _V1, vec3 _V2 ) : v0( _V0 ), v1( _V1 ), v2( _V2 )
{
	// set triangle vertices and calculate its normal
	const vec3 e1 = v1 - v0, e2 = v2 - v0;
	N = normalize( cross( e1, e2 ) );
	material = 0;
}

void Triangle::Intersect( Ray& _Ray )
{
	// find the intersection of a ray and a triangle
	float t = 0; // todo: find intersection distance
	if (t < _Ray.t)
	{
		_Ray.t = t;
		_Ray.intersection.N = N;
		if (material) _Ray.intersection.color = material->color;
	}
}

void Triangle::Draw2D()
{
	// draw triangle edges
	Line2D( v0.x, v0.z, v1.x, v1.z, 0xffffff );
	Line2D( v1.x, v1.z, v2.x, v2.z, 0xffffff );
	Line2D( v2.x, v2.z, v0.x, v0.z, 0xffffff );
}

// == Camera class ============================================================
//    ------------
void Camera::Draw2D()
{
	// draw view frustum
	Line2D( eyePos.x, eyePos.z, p1.x, p1.z, 0xaa );
	Line2D( eyePos.x, eyePos.z, p2.x, p2.z, 0xaa );
	Line2D( p1.x, p1.z, p2.x, p2.z, 0xaa );
}

void Camera::Set( vec3 _Pos, vec3 _Direction )
{
	// set position and view direction, then calculate screen corners
	eyePos = _Pos;
	V = _Direction;
	p1 = vec3( -0.5f, -0.5f, -2.2f ); // todo: calculate screen corners using P and V
	p2 = vec3(  0.5f, -0.5f, -2.2f ); // todo: calculate screen corners using P and V
	p3 = vec3(  0.5f,  0.5f, -2.2f ); // todo: calculate screen corners using P and V
	p4 = vec3( -0.5f,  0.5f, -2.2f ); // todo: calculate screen corners using P and V
}

Ray Camera::GenerateRay( int _X, int _Y )
{
	// calculate position on virtual screen plane floating in front of camera
	float fx = (float)_X / (SCRWIDTH / 2), fy = (float)_Y / SCRHEIGHT;
	vec3 P = p1 + (p2 - p1) * fx + (p4 - p1) * fy;
	// generate a ray starting at the camera, going through a pixel
	Ray ray;
	ray.O = eyePos;
	ray.D = normalize( P - eyePos );
	ray.t = 1e34;
	return ray;
}

// == Scene class =============================================================
//    -----------
Scene::Scene()
{
	// scene initialization
	primList = new Primitive*[128]; // todo: this is going to bite us one day
	primCount = 0;
	primList[primCount++] = new Sphere( vec3( -2.5f, 0, 0 ), 1 );
	primList[primCount++] = new Sphere( vec3( 0, 0, 0 ), 1 );
	primList[primCount++] = new Sphere( vec3( 2.5f, 0, 0 ), 1 );
	primList[primCount++] = new Plane( vec3( 0, 1, 0 ), 0.7f );
	primList[primCount++] = new Plane( vec3( 0, 0, -1 ), -1.5f );
}

void Scene::Draw2D()
{
	// draw arrows
	const int cx = SCRWIDTH / 2, w = SCRWIDTH / 2, y2 = SCRHEIGHT - 1;
	screen->ClipTo( 0, 0, SCRWIDTH - 1, SCRHEIGHT - 1 );
	screen->Line( cx, 0, cx, y2, 0xffffff );
	screen->Line( cx + 9, y2 - 6, cx + 9, y2 - 40, 0xffffff );
	screen->Line( cx + 9, y2 - 40, cx + 6, y2 - 37, 0xffffff );
	screen->Line( cx + 9, y2 - 40, cx + 12, y2 - 37, 0xffffff );
	screen->Line( cx + 9, y2 - 6, cx + 43, y2 - 6, 0xffffff );
	screen->Line( cx + 43, y2 - 6, cx + 40, y2 - 3, 0xffffff );
	screen->Line( cx + 43, y2 - 6, cx + 40, y2 - 9, 0xffffff );
	screen->Print( "z", cx + 7, y2 - 50, 0xffffff );
	screen->Print( "x", cx + 48, y2 - 8, 0xffffff );
	// 2D viewport
	Line2D( 0, -10000, 0, 10000, 0x004400 );
	Line2D( -10000, 0, 10000, 0, 0x004400 );
	char t[128];
	sprintf( t, "%4.1f", WXMIN );
	screen->Print( t, SCRWIDTH / 2 + 2, (int)SY( 0 ) - 7, 0x006600 );
	sprintf( t, "%4.1f", WXMAX );
	screen->Print( t, SCRWIDTH - 30, (int)SY( 0 ) - 7, 0x006600 );
	sprintf( t, "%4.1f", WYMAX );
	screen->Print( t, (int)SX( 0 ) + 2, 2, 0x006600 );
	sprintf( t, "%4.1f", WYMIN );
	screen->Print( t, (int)SX( 0 ) + 2, SCRHEIGHT - 8, 0x006600 );
	for ( int i = 0; i < primCount; i++ ) primList[i]->Draw2D();
}

void Scene::Intersect( Ray& _Ray )
{
	// intersect ray with each primitive in the scene
	for ( int i = 0; i < primCount; i++ ) primList[i]->Intersect( _Ray );
}

// == Renderer class ==========================================================
//    --------------
Renderer::Renderer()
{
	camera.Set( vec3( 0, 0, -3 ), vec3( 0, 0, 1 ) );
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