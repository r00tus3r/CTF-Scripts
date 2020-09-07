package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;

public interface GroupStrategy {
  void afterGroup(int paramInt);
  
  void afterGroups();
  
  void beforeGroup(int paramInt, Array<Decal> paramArray);
  
  void beforeGroups();
  
  int decideGroup(Decal paramDecal);
  
  ShaderProgram getGroupShader(int paramInt);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/decals/GroupStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */