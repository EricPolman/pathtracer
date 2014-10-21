#pragma once
#include "FreeImage/FreeImage.h"
#include "glm/glm.hpp"

using namespace glm;


class Texture
{
public:
  Texture();
  ~Texture();

  void Load(const char* path);
  vec3 GetPixel(float u, float v);

  int width, height;

  FIBITMAP* texture;
  glm::vec3** floatTexture;
};

