#include "Ray.h"
#include "raytracer.h"

using namespace Tmpl8;


void Ray::Draw2D()
{
  Renderer::Line2D(O.x, O.z, O.x + 10000 * D.x, O.z + 10000 + D.z, 0x111111);
  Renderer::Line2D(O.x, O.z, O.x + D.x, O.z + D.z, 0x666666);
  Renderer::Line2D(O.x, O.z, O.x + t * D.x, O.z + t * D.z, 0xaaaa00);
  Renderer::Plot2D(O.x + t * D.x, O.z + t * D.z, 0xff0000);
}