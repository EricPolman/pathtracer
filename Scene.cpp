#include "Scene.h"
#include "raytracer.h"
#include "definitions.h"
#include "Sphere.h"
#include "Plane.h"
#include "BoxLight.h"
#include "Triangle.h"
#include "BvhNode.h"
#include "Mesh.h"
#include "Texture.h"

Mesh* mesh;
Texture* texture;
auto path = "resources/box_rot.obj";
// Sponza from: http://hdri.cgtechniques.com/~sponza/files/
// Sponza from: http://graphics.cs.williams.edu/data/meshes.xml

Scene::Scene()
{
  primList = new Primitive*[128]; // todo: this is going to bite us one day
  lightList = new Primitive*[128];
  primCount = lightCount = 0;

  //SetupSphereScene();
  materials.push_back(new Material);
  materials[0]->type = Material::PHONG;
  materials[0]->id = 0;
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
  primList[1]->material->color = vec3(1, 0, 0);
  primList[2]->material->color = vec3(0, 1, 0);
  primList[3]->material->color = vec3(0.5f, 0.5f, 0.5f);
  primList[4]->material->color = vec3(0.5f, 0.5f, 0.5f);
  primList[5]->material->color = vec3(0.5f, 0.5f, 0.5f);

  //primList[primCount++] = new Sphere(vec3(0, 0, -6), 2);
  //primList[primCount - 1]->material->type = Material::DIELECTRIC;
  //primList[primCount - 1]->material->refractionIndex = 1.4f;

  printf("Loading texture.\n");
  texture = new Texture();
  texture->Load("resources/box_texture.png");
  printf("Done loading texture.\n");

  printf("Parsing mesh.\n");
  mesh = new Mesh(path);
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
    i->material = materials[0];
    //i->material->texture = texture;
    //i->material->color = vec3(0.9f, 0.9f, 0.8f);
    //if (Random::value() > 0.8f)
    //i->material->type = Material::PHONG;
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