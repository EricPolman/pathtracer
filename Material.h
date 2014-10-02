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
  Material():color(1,1,1), type(LAMBERT){}
  vec3 color;						// color of material
  Type type;

  vec3 Illuminate(Renderer&, Ray&);
};