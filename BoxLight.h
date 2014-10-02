#pragma once
#include "Primitive.h"

class Ray;

class BoxLight :
  public Primitive
{
public:
  BoxLight() : size(1, 1, 1), intensity(1) { material->type = Material::LIGHT; }
  ~BoxLight();

  vec3 position, size;
  float intensity;

  float Shade(Tmpl8::Renderer& _Renderer, Ray& _Ray);
  void Intersect(Ray& _Ray);
  void Draw2D();
};

