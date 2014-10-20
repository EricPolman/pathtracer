#pragma once
#include <vector>
#include "glm/glm.hpp"

using namespace glm;

class Triangle;

class Mesh
{
public:
  Mesh(const char* a_path);
  ~Mesh(void);

  void Load(const char* a_path);
  std::vector<Triangle*> m_triangles;
  std::vector<vec3> m_vertices;
  std::vector<vec3> m_normals;
  std::vector<vec2> m_uvcoords;

  std::vector<unsigned int> m_vertexIndices;
  std::vector<unsigned int> m_normalIndices;
  std::vector<unsigned int> m_uvcoordIndices;

  unsigned int m_listId;
};