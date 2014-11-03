#pragma once

struct SDL_Surface;
namespace Tmpl8
{
  class Renderer;
};

namespace JobState
{
  enum JobState
  {
    PENDING,
    WAITING_FOR_DEPENDENCY,
    EXECUTING,
    FINISHED
  };
}

class Job
{
public:
  
  Job() {}
  ~Job(){}

  virtual void Execute() = 0;
};

class RenderTileJob : public Job
{
public:
  RenderTileJob(){}
  RenderTileJob(int _x, int _y, int _tileSize)
    : x(_x), y(_y) {}
  virtual void Execute();
  int x, y;
  static Tmpl8::Renderer* renderer;
};