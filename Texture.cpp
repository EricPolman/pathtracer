#include "Texture.h"


Texture::Texture()
{
}


Texture::~Texture()
{
}


void Texture::Load(const char* path)
{
  FREE_IMAGE_FORMAT fileType = FreeImage_GetFileType(path);
  FIBITMAP* temp = FreeImage_Load(fileType, path);

  width = FreeImage_GetWidth(temp);
  height = FreeImage_GetHeight(temp);
  floatTexture = new vec3*[height];

  for (int i = 0; i < height; ++i)
  {
    floatTexture[i] = new vec3[width];
  }

  for (int y = 0; y < height; ++y)
  {
    for (int x = 0; x < width; ++x)
    {
      RGBQUAD col;
      FreeImage_GetPixelColor(temp, x, y, &col);
      floatTexture[y][x] = vec3((float)col.rgbRed / 256.0f, (float)col.rgbGreen / 256.0f, (float)col.rgbBlue / 256.0f);
    }
  }

  FreeImage_Unload(temp);
}


vec3 Texture::GetPixel(float u, float v)
{
  return floatTexture[(int)(v * height) % height][(int)(u * width) % height];
}