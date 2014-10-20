#pragma once

// == HELPER FUNCTIONS ========================================================
//    ----------------

// visible world space definition
#define WXMIN	-8.0f	// left edge of visible world
#define WYMIN	-8.0f // top edge of visible world
#define WXMAX	 8.0f // right edge of visible world
#define WYMAX	 8.0f // bottom edge of visible world

// world space to screen space conversion
#define SX(x) ((((x)-(WXMIN))/((WXMAX)-(WXMIN)))*(SCRWIDTH/2)+SCRWIDTH/2)
#define SY(y) ((((-y)-(WYMIN))/((WYMAX)-(WYMIN)))*SCRHEIGHT) // trust me

#define SCRWIDTH	1024
#define SCRHEIGHT	512

#define MIN(a,b) (((a)>(b))?(b):(a))
#define MAX(a,b) (((a)>(b))?(a):(b))

#define PI				3.14159265358979323846264338327950288419716939937510582097494459072381640628620899862803482534211706798f

#define PREFETCH(x) _mm_prefetch((const char*)(x),_MM_HINT_T0)
#define PREFETCH_ONCE(x) _mm_prefetch((const char*)(x),_MM_HINT_NTA)
#define PREFETCH_WRITE(x) _m_prefetchw((const char*)(x))
#define loadss(mem)			_mm_load_ss((const float*const)(mem))
#define broadcastps(ps)		_mm_shuffle_ps((ps),(ps), 0)
#define broadcastss(ss)		broadcastps(loadss((ss)))

#define MALLOC64(x) _aligned_malloc(x,64)
#define FREE64(x) _aligned_free(x)

#define EPSILON		0.0001f
#define MAX_TRACE_DEPTH 3

#define ROULETTE_FACTOR 30.0f

#define MIN_OBJECTS_IN_BVH_NODE 5

#define MAX_BRIGHTNESS 16.0f

typedef unsigned long Pixel;