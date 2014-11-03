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
auto path = "resources/prettyScene/walls.obj";
// Sponza from: http://hdri.cgtechniques.com/~sponza/files/
// Sponza from: http://graphics.cs.williams.edu/data/meshes.xml

Scene::Scene()
{
  primList = new Primitive*[128]; // todo: this is going to bite us one day
  lightList = new Primitive*[128];
  primCount = lightCount = 0;

  //SetupSphereScene();
  materials.push_back(new Material);
  materials.push_back(new Material);
  materials.push_back(new Material);

  // Walls
  materials[0]->id = 0;
  texture = new Texture();
  auto normalMap = new Texture();
  texture->Load("resources/brickwall/wall_diffuse.jpg");
  normalMap->Load("resources/brickwall/wall_normal.jpg");
  materials[0]->texture = texture;

  // Path
  materials[1]->id = 1;
  texture = new Texture();
  normalMap = new Texture();
  texture->Load("resources/path/cobblestone.jpg");
  normalMap->Load("resources/path/cobblestone_normal.jpg");
  materials[1]->texture = texture;


  materials[2]->id = 2;
  materials[2]->color = vec3(0.3f, 0.3f, 0.3f);
  //materials[2]->type = Material::PHONG;
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
  primList[5]->material->refractionIndex = 1.4f;
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
  primList[primCount++] = new Plane(vec3(0, 1, 0), -1);

  //primList[primCount++] = new Sphere(vec3(0, 0, 0), 4);
  //primList[primCount - 1]->material->type = Material::DIELECTRIC;
  //primList[primCount - 1]->material->refractionIndex = 1.0f;

  printf("Parsing mesh.\n");
  /*mesh = new Mesh("resources/prettyScene/walls.obj");
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
    i->material = materials[0];
  }*/

  mesh = new Mesh("resources/prettyScene/path.obj");
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
    i->material = materials[1];
  }

  mesh = new Mesh("resources/prettyScene/weaponStand.obj");
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
    i->material = materials[2];
  }
  /*mesh = new Mesh("resources/sahtest.obj");
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
    i->material = materials[1];
  }*/
  printf("Done parsing mesh.\n");
}

void Scene::BuildBVH()
{
  printf("Generating BV for entire mesh.\n");
  rootBox = AABB::CreateFromTriangles(&triangles[0], triangles.size());
  printf("Done generating BV.\n");
  bvhRoot = new BvhNode(rootBox.boundMin, rootBox.boundMax);
  printf("Building root node.\n");
  bvhRoot->Build(&triangles[0], triangles.size(), rootBox, 0);

  printf("Going through splitQueue.\n");
  while (BvhNode::splitQueue.size() > 0)
  {
    SplitInstruction instr = BvhNode::splitQueue.front();
    BvhNode::splitQueue.pop();

    printf("%i\t%i\t%i\n", instr.p, instr.count, instr.depth);
    //if (instr.p == instr.count)
    //  continue;

    // Get BV for left
    if (instr.p > 0)
    {
      AABB bvLeft = AABB::CreateFromTriangles(instr.tris, instr.p);

      // Get BV for right
      instr.node->left = new BvhNode(bvLeft.boundMin, bvLeft.boundMax);

      instr.node->left->Build(instr.tris, instr.p, rootBox, instr.depth);
    }
    if (instr.p < instr.count)
    {
      AABB bvRight = AABB::CreateFromTriangles(instr.tris + instr.p, instr.count - instr.p);
      instr.node->right = new BvhNode(bvRight.boundMin, bvRight.boundMax);

      instr.node->right->Build(instr.tris + instr.p, instr.count - instr.p, rootBox, instr.depth);
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