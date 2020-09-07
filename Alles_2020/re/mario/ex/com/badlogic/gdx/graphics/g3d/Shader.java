package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.utils.Disposable;

public interface Shader extends Disposable {
  void begin(Camera paramCamera, RenderContext paramRenderContext);
  
  boolean canRender(Renderable paramRenderable);
  
  int compareTo(Shader paramShader);
  
  void end();
  
  void init();
  
  void render(Renderable paramRenderable);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Shader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */