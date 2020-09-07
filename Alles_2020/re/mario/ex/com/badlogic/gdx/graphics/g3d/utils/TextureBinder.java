package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.GLTexture;

public interface TextureBinder {
  void begin();
  
  int bind(GLTexture paramGLTexture);
  
  int bind(TextureDescriptor paramTextureDescriptor);
  
  void end();
  
  int getBindCount();
  
  int getReuseCount();
  
  void resetCounts();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/TextureBinder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */