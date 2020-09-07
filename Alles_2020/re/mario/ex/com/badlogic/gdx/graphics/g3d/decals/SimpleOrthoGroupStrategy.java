package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Sort;
import java.util.Comparator;

public class SimpleOrthoGroupStrategy implements GroupStrategy {
  private static final int GROUP_BLEND = 1;
  
  private static final int GROUP_OPAQUE = 0;
  
  private Comparator comparator = new Comparator();
  
  public void afterGroup(int paramInt) {
    if (paramInt == 1) {
      Gdx.gl.glDepthMask(true);
      Gdx.gl.glDisable(3042);
    } 
  }
  
  public void afterGroups() { Gdx.gl.glDisable(3553); }
  
  public void beforeGroup(int paramInt, Array<Decal> paramArray) {
    if (paramInt == 1) {
      Sort.instance().sort(paramArray, this.comparator);
      Gdx.gl.glEnable(3042);
      Gdx.gl.glDepthMask(false);
    } 
  }
  
  public void beforeGroups() { Gdx.gl.glEnable(3553); }
  
  public int decideGroup(Decal paramDecal) { return paramDecal.getMaterial().isOpaque() ^ true; }
  
  public ShaderProgram getGroupShader(int paramInt) { return null; }
  
  class Comparator extends Object implements Comparator<Decal> {
    public int compare(Decal param1Decal1, Decal param1Decal2) {
      byte b;
      if (param1Decal1.getZ() == param1Decal2.getZ())
        return 0; 
      if (param1Decal1.getZ() - param1Decal2.getZ() < 0.0F) {
        b = -1;
      } else {
        b = 1;
      } 
      return b;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */