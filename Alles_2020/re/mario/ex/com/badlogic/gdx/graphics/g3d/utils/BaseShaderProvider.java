package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public abstract class BaseShaderProvider implements ShaderProvider {
  protected Array<Shader> shaders = new Array();
  
  protected abstract Shader createShader(Renderable paramRenderable);
  
  public void dispose() {
    Iterator iterator = this.shaders.iterator();
    while (iterator.hasNext())
      ((Shader)iterator.next()).dispose(); 
    this.shaders.clear();
  }
  
  public Shader getShader(Renderable paramRenderable) {
    Shader shader2 = paramRenderable.shader;
    if (shader2 != null && shader2.canRender(paramRenderable))
      return shader2; 
    for (Shader shader : this.shaders) {
      if (shader.canRender(paramRenderable))
        return shader; 
    } 
    Shader shader1 = createShader(paramRenderable);
    shader1.init();
    this.shaders.add(shader1);
    return shader1;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/BaseShaderProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */