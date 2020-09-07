package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.math.Matrix4;

public interface ShadowMap {
  TextureDescriptor getDepthMap();
  
  Matrix4 getProjViewTrans();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/ShadowMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */