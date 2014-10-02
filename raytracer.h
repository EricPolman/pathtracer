// Template for GP1, version 2
// IGAD/NHTV - Jacco Bikker - 2006-2014

#pragma once

#define EPSILON		0.0001f

namespace Tmpl8 {

// == class Material ==========================================================
//    --------------
class Material
{
public:
	vec3 color;						// color of material
};

// == class Intersection ======================================================
//    ------------------
class Intersection
{
public:
	vec3 N;							// normal at intersection point
	vec3 color;						// color at intersection point
};

// == class Ray ===============================================================
//    ---------
class Ray
{
public:
	// methods
	void Draw2D();
	// data members
	vec3 O;							// ray origin
	vec3 D;							// normalized ray direction
	float t;						// distance of intersection along ray ( >= 0 )
	Intersection intersection;		// data for closest intersection point
};

// == class Primitive =========================================================
//    ---------------
class Primitive
{
public:
	Primitive() : material( 0 ) {}
	virtual void Intersect( Ray& _Ray ) = 0;
	virtual void Draw2D() = 0;
	Material* material;				// primitive material
};

// == class Plane =============================================================
//    -----------
class Plane : public Primitive
{
public:
	// constructors
	Plane() {}
	Plane( vec3& _N, float _Dist ) : N( _N ), dist( _Dist ) {}
	Plane( vec3 _V0, vec3 _V1, vec3 _V2 );
	// methods
	void Intersect( Ray& _Ray );
	void Draw2D();
	// data members
	vec3 N;							// plane normal
	float dist;						// distance of plane from (0,0,0)
};

// == class Sphere ============================================================
//    ------------
class Sphere : public Primitive
{
public:
	// constructors
	Sphere() {}
	Sphere( vec3 _Pos, float _Radius ) : P( _Pos ), r( _Radius ) {}
	// methods
	void Intersect( Ray& _Ray );
	void Draw2D();
	// data members
	vec3 P;							// centre of sphere
	float r;						// sphere radius
};

// == class Triangle ==========================================================
//    --------------
class Triangle : public Primitive
{
public:
	// constructors
	Triangle() {}
	Triangle( vec3 _V0, vec3 _V1, vec3 _V2 );
	// methods
	void Intersect( Ray& _Ray );
	void Draw2D();
	// data members
	vec3 v0, v1, v2;				// triangle vertices
	vec3 N;							// triangle normal
};

// == class Camera ============================================================
//    ------------
class Camera
{
public:
	// methods
	Ray GenerateRay( int _X, int _Y );
	void Set( vec3 _Pos, vec3 _Direction );
	void Draw2D();
	// data members
	vec3 eyePos;					// camera position
	vec3 V;							// normalized view direction
	vec3 p1, p2, p3, p4;			// corners of screen plane
};

// == class Scene =============================================================
//    -----------
class Scene
{
public:
	// constructor
	Scene();
	void Draw2D();
	void Intersect( Ray& _Ray );
	// data members
	Primitive** primList;
	int primCount;
};

// == class Renderer ==========================================================
//    --------------
class Renderer
{
public:
	// constructor
	Renderer();
	// methods
	vec3 Trace( Ray& _Ray );
	void Render( int _Y );
	// data members
	Scene scene;
	Camera camera;
};

};

// EOF