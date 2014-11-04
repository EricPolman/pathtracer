#include "Scene.h"
#include "raytracer.h"
#include "definitions.h"
#include "Sphere.h"
#include "Plane.h"
#include "Triangle.h"
#include "BvhNode.h"
#include "Mesh.h"
#include "Texture.h"

Mesh* mesh;
Texture* texture;
// Sponza from: http://hdri.cgtechniques.com/~sponza/files/
// Sponza from: http://graphics.cs.williams.edu/data/meshes.xml

std::vector<Material*> Scene::materials;
void Scene::AddMaterial(Material* mat)
{
  materials.push_back(mat);
  mat->id = materials.size() - 1;
}

Scene::Scene()
{
  primList = new Primitive*[128]; // todo: this is going to bite us one day
  primCount = lightCount = 0;
  
  SetupScene();
  BuildBVH();
}

void Scene::SetupScene()
{
  primList[primCount++] = new Plane(vec3(0, 1, 0), -1);

  //primList[primCount++] = new Sphere(vec3(0, 1.5f, -6), 1.0f);
  //primList[primCount - 1]->material->type = Material::DIELECTRIC;
  //primList[primCount - 1]->material->refractionIndex = 1.4f;
  //primList[primCount - 1]->material->color = vec3(1.0f, 1.0f, 1.0f);
  //
  //
  //primList[primCount++] = new Sphere(vec3(-4.0f, 2.5f, 2), 2);
  //primList[primCount - 1]->material->color = vec3(0.9f, 0.5f, 0.5f);
  //primList[primCount - 1]->material->type = Material::MIRROR;
  //
  //primList[primCount++] = new Sphere(vec3(4.0f, 2.5f, 2), 2);
  //primList[primCount - 1]->material->color = vec3(0.3f, 0.9f, 0.5f);
  //primList[primCount - 1]->material->type = Material::MIRROR;

  printf("Parsing mesh.\n");
  mesh = new Mesh("resources/prettyScene/all.obj");
  for (auto i : mesh->m_triangles)
  {
    triangles.push_back(i);
  }

  printf("Done parsing mesh.\n");
}

void Scene::BuildBVH()
{
  printf("Generating BV for entire mesh.\n");
  rootBox = AABB::CreateFromTriangles(&triangles[0], triangles.size());
  printf("Done generating BV.\n");
  bvhRoot = new BvhNode(&triangles[0], triangles.size(), rootBox, 0);
  printf("Building root node.\n");

  printf("Going through splitQueue.\n");
  while (BvhNode::splitQueue.size() > 0)
  {
    SplitInstruction instr = BvhNode::splitQueue.front();
    BvhNode::splitQueue.pop();

    printf("%i\t%i\t%i\n", instr.p, instr.count, instr.depth);

    // Get BV for left
    if (instr.p > 0)
    {
      instr.node->left = new BvhNode(instr.tris, instr.p, rootBox, instr.depth);
    }
    if (instr.p < instr.count)
    {
      instr.node->right = new BvhNode(instr.tris + instr.p, instr.count - instr.p, rootBox, instr.depth);
    }
  }
  printf("BVH done.\n");
}

void Scene::Intersect(Ray& _Ray)
{
  for (int i = 0; i < primCount; i++) primList[i]->Intersect(_Ray);
}
void Scene::IntersectBVH(Ray& _Ray, BvhNode* _StartNode)
{
  // Recursion-less BVH traversal, borrowed from Max Oomen
  BvhNode* stack[128];
  int stackIdx = 0;
  if(_StartNode == nullptr)
    stack[stackIdx++] = bvhRoot;
  else
    stack[stackIdx++] = _StartNode;

  while (stackIdx)
  {
    BvhNode* current = stack[--stackIdx];

    bool hit = current->Intersect(_Ray);
    if (hit)
    {
      if (!current->isLeaf())
      {
        if (current->left)
          stack[stackIdx++] = current->left;
        if (current->right)
          stack[stackIdx++] = current->right;
      }
      else
      {
        for (int i = 0; i < current->numObjects; ++i)
        {
          current->tris[i]->Intersect(_Ray);
        }
      }
    }
  }
}
