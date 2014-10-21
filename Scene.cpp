#include "Scene.h"
#include "raytracer.h"
#include "definitions.h"
#include "Sphere.h"
#include "Plane.h"
#include "BoxLight.h"
#include "Triangle.h"
#include "BvhNode.h"
#include "Mesh.h"

Mesh* mesh;
auto path = "resources/mace.obj";
// Sponza from: http://hdri.cgtechniques.com/~sponza/files/
// Sponza from: http://graphics.cs.williams.edu/data/meshes.xml

Scene::Scene()
{
  primList = new Primitive*[128]; // todo: this is going to bite us one day
  lightList = new Primitive*[128];
  primCount = lightCount = 0;

  //SetupSphereScene();
  SetupHeavyScene();
  BuildBVH();
}

void Scene::SetupSphereScene()
{
  // scene initialization
  primList[primCount++] = new Sphere(vec3(-1, -0.5f, 1), 1.5f);
  primList[primCount++] = new Plane(vec3(0, -1, 0), -0.7f);
  primList[primCount++] = new Plane(vec3(1, 0, 0), -2.5f);
  primList[primCount++] = new Plane(vec3(-1, 0, 0), -2.5f);
  primList[primCount++] = new Plane(vec3(0, 1, 0), -4.0f);
  primList[primCount++] = new Sphere(vec3(1, -0.5f, -1.0f), 1);
  primList[primCount++] = new Sphere(vec3(2, -2.5f, 2), 1);
  primList[primCount++] = new Plane(vec3(0, 0, 1), -8.0f);

  vec3 p0(-2.5f, 0.7f, 2.5f);
  vec3 p1(-2.5f, -4.0f, 2.5f);
  vec3 p2(2.5f, 0.7f, 2.5f);
  vec3 p3(2.5f, -4.0f, 2.5f);

  primList[primCount++] = new Triangle(p1, p0, p2);
  primList[primCount++] = new Triangle(p3, p1, p2);

  primList[2]->material->color = vec3(1, 0, 0);
  primList[3]->material->color = vec3(0, 1, 0);

  primList[0]->material->type = Material::PHONG;
  primList[5]->material->type = Material::DIELECTRIC;
  primList[5]->material->refractionIndex = 1.5f;
  //primList[6]->material->color = vec3(0.9f, 0.7f, 0.7f);
  primList[6]->material->color = vec3(0.95f, 0.8f, 0.4f);
  primList[6]->material->type = Material::MIRROR;

  for (int i = 0; i < 4; ++i)
  {
    Sphere* s = new Sphere(vec3(2, -1.5f + i * 0.75f, 2), 0.5f);
    s->material->color = vec3(i * 0.2f, 0.6f, 0.6f);
    primList[primCount++] = s;
  }

  BoxLight* boxLight = new BoxLight();
  primList[primCount++] = boxLight;
  lightList[lightCount++] = boxLight;

  boxLight->position = vec3(0, -3.95f, 0);
  boxLight->size = vec3(5, 0.15f, 5);
  boxLight->material->color *= 2;
}

void Scene::SetupHeavyScene()
{
  primList[primCount++] = new Plane(vec3(0, -1, 0), -20);
  primList[primCount++] = new Plane(vec3(-1, 0, 0), -20);
  primList[primCount++] = new Plane(vec3(1, 0, 0), -20);
  primList[primCount++] = new Plane(vec3(0, 1, 0), -20);
  primList[primCount++] = new Plane(vec3(0, 0, -1), -20);
  primList[primCount++] = new Plane(vec3(0, 0, 1), -20);

  primList[0]->material->type = Material::LIGHT;
  //primList[1]->material->type = Material::LIGHT;
  //primList[2]->material->type = Material::LIGHT;
  primList[1]->material->color = vec3(1, 0, 0);
  primList[2]->material->color = vec3(0, 1, 0);
  primList[3]->material->color = vec3(0.5f, 0.5f, 0.5f);
  primList[4]->material->color = vec3(0.5f, 0.5f, 0.5f);
  primList[5]->material->color = vec3(0.5f, 0.5f, 0.5f);
  //primList[3]->material->type = Material::LIGHT;
  //primList[4]->material->type = Material::LIGHT;
  //primList[5]->material->type = Material::LIGHT;

  /*primList[primCount++] = new Sphere(vec3(8, 0, 5), 1.5f);
  primList[primCount++] = new Sphere(vec3(8, 0, -5), 1.5f);
  primList[6]->material->type = Material::LIGHT;
  primList[7]->material->type = Material::LIGHT;
  primList[6]->material->color = vec3(1.0f, 0.1f, 0.1f);
  primList[7]->material->color = vec3(0.1f, 1.0f, 0.1f);

  primList[primCount++] = new Sphere(vec3(5, 0, 5), 1.5f);
  primList[primCount++] = new Sphere(vec3(5, 0, -5), 1.5f);
  primList[8]->material->type = Material::LIGHT;
  primList[9]->material->type = Material::LIGHT;
  primList[8]->material->color = vec3(0.1f, 1.0f, 0.1f);
  primList[9]->material->color = vec3(1.0f, 0.1f, 0.1f);*/


  //primList[primCount++] = new Plane(vec3(0, -1, 0), -10);
  //primList[primCount++] = new Sphere(vec3(0, 0, 0), 2);
  //primList[primCount - 1]->material->type = Material::LIGHT;

  /*primList[primCount++] = new Plane(vec3(0, 1, 0), -6);
  primList[primCount++] = new Plane(vec3(-1, 0, 0), -6);
  primList[primCount++] = new Plane(vec3(1, 0, 0), -6);
  primList[primCount++] = new Plane(vec3(0, -1, 0), -6);
  primList[primCount++] = new Plane(vec3(0, 0, -1), -6);
  primList[primCount++] = new Plane(vec3(0, 0, 1), -7.5f);

  primList[0]->material->type = Material::LIGHT;
  primList[1]->material->color = vec3(0.1f, 1, 0.1f);
  primList[2]->material->color = vec3(1, 0.1f, 0.1f);
  primList[1]->material->type = Material::LIGHT;
  primList[2]->material->type = Material::LIGHT;*/

  /*
  for (int x = 0; x < 5; ++x)
  {
    for (int y = 0; y < 5; ++y)
    {
      for (int z = 0; z < 5; ++z)
      {
        vec3 p0(-5 + 2.5f * x - 0.5f, -5 + 2.5f * y - 0.5f, -5 + 2.5f * z);
        vec3 p1(-5 + 2.5f * x, -5 + 2.5f * y + 0.5f, -5 + 2.5f * z + 0.5f);
        vec3 p2(-5 + 2.5f * x + 0.5f, -5 + 2.5f * y - 0.5f, -5 + 2.5f * z);

        Triangle* tri = new Triangle(p0, p1, p2);
        tri->material->color = vec3(Random::value(), Random::value(), Random::value());
        //primList[primCount++] = tri;
        triangles.push_back(tri);

        if (Random::value() > 0.75f)
        {
          tri->material->type = Material::LIGHT;
          tri->material->color *= 2;
        }
      }
    }
  }
  */
  printf("Parsing mesh.\n");
  mesh = new Mesh(path);
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
    //i->material->color = vec3(0.9f, 0.9f, 0.8f);
    //if (Random::value() > 0.8f)
    i->material->type = Material::PHONG;
    i->material->specularComponent = 20;
  }
  printf("Done parsing mesh.\n");
}

void Scene::BuildBVH()
{
  printf("Generating BV for entire mesh.\n");
  AABB bv = AABB::CreateFromTriangles(&triangles[0], triangles.size());
  printf("Done generating BV.\n");
  bvhRoot = new BvhNode(bv.boundMin, bv.boundMax);
  printf("Building root node.\n");
  bvhRoot->Build(&triangles[0], triangles.size());

  printf("Going through splitQueue.\n");
  while (BvhNode::splitQueue.size() > 0)
  {
    SplitInstruction instr = BvhNode::splitQueue.front();
    BvhNode::splitQueue.pop();

    printf("%i\t%i\t%p\n", instr.count, instr.p, instr.node);

    //if (instr.p == instr.count)
    //  continue;

    // Get BV for left
    if (instr.p > 0)
    {
      AABB bvLeft = AABB::CreateFromTriangles(instr.tris, instr.p);

      // Get BV for right
      instr.node->left = new BvhNode(bvLeft.boundMin, bvLeft.boundMax);

      instr.node->left->Build(instr.tris, instr.p);
    }
    if (instr.p < instr.count)
    {
      AABB bvRight = AABB::CreateFromTriangles(instr.tris + instr.p, instr.count - instr.p);
      instr.node->right = new BvhNode(bvRight.boundMin, bvRight.boundMax);

      instr.node->right->Build(instr.tris + instr.p, instr.count - instr.p);
    }
  }
  printf("BVH done.\n");
}

void Scene::Intersect(Ray& _Ray)
{
  // intersect ray with each primitive in the scene
  for (int i = 0; i < primCount; i++) primList[i]->Intersect(_Ray);
  bvhRoot->Intersect(_Ray);
}

void Scene::IntersectShadow(Ray& _Ray, float _Length)
{
  // intersect ray with each primitive in the scene
  for (int i = 0; i < primCount; i++)
  {
    primList[i]->Intersect(_Ray);
    bvhRoot->Intersect(_Ray);
    //if (_Ray.t <= _length)
    //  return;
  }
}