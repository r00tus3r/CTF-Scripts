package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;

public class DefaultShaderProvider extends BaseShaderProvider {
  public final DefaultShader.Config config;
  
  public DefaultShaderProvider() { this(null); }
  
  public DefaultShaderProvider(FileHandle paramFileHandle1, FileHandle paramFileHandle2) { this(paramFileHandle1.readString(), paramFileHandle2.readString()); }
  
  public DefaultShaderProvider(DefaultShader.Config paramConfig) {
    DefaultShader.Config config1 = paramConfig;
    if (paramConfig == null)
      config1 = new DefaultShader.Config(); 
    this.config = config1;
  }
  
  public DefaultShaderProvider(String paramString1, String paramString2) { this(new DefaultShader.Config(paramString1, paramString2)); }
  
  protected Shader createShader(Renderable paramRenderable) { return new DefaultShader(paramRenderable, this.config); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */