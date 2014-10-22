#pragma once
#include "glm/glm.hpp"
#include "Texture.h"

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
  Material():color(1,1,1), refractionIndex(1), type(LAMBERT), specularCoefficient(1), specularComponent(1), texture(nullptr){}
  int id;
  vec3 color;						// color of material
  Type type;
  float reflection;
  float refractionIndex;
  float specularCoefficient, specularComponent;
  Texture* texture;
  vec3 Illuminate(Renderer&, Ray&, int _Depth, bool _PathTraced, unsigned int _Debug = 0);
};