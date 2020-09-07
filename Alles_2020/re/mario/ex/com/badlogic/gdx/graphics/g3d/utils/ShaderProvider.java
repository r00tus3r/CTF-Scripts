package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;

public interface ShaderProvider {
  void dispose();
  
  Shader getShader(Renderable paramRenderable);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/ShaderProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */