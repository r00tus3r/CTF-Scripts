package com.badlogic.gdx.graphics;

public interface CubemapData {
  void consumeCubemapData();
  
  int getHeight();
  
  int getWidth();
  
  boolean isManaged();
  
  boolean isPrepared();
  
  void prepare();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/CubemapData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */