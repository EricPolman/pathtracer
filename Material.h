#pragma once
#include "glm/glm.hpp"

namespace Tmpl8
{
  class Renderer;
}

using namespace glm;
using namespace Tmpl8;

class Ray;

class Material
{
public:
  enum Type { UNLIT, LAMBERT, PHONG, MIRROR, DIELECTRIC, LIGHT };
  Material():color(1,1,1), refractionIndex(1), type(LAMBERT){}
  vec3 color;						// color of material
  Type type;
  float reflection;
  float refractionIndex;

  vec3 Illuminate(Renderer&, Ray&, int _Depth, unsigned int _Debug = 0);
};