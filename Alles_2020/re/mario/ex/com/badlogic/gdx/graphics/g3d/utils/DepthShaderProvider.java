package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.shaders.DepthShader;

public class DepthShaderProvider extends BaseShaderProvider {
  public final DepthShader.Config config;
  
  public DepthShaderProvider() { this(null); }
  
  public DepthShaderProvider(FileHandle paramFileHandle1, FileHandle paramFileHandle2) { this(paramFileHandle1.readString(), paramFileHandle2.readString()); }
  
  public DepthShaderProvider(DepthShader.Config paramConfig) {
    DepthShader.Config config1 = paramConfig;
    if (paramConfig == null)
      config1 = new DepthShader.Config(); 
    this.config = config1;
  }
  
  public DepthShaderProvider(String paramString1, String paramString2) { this(new DepthShader.Config(paramString1, paramString2)); }
  
  protected Shader createShader(Renderable paramRenderable) { return new DepthShader(paramRenderable, this.config); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */