package com.badlogic.gdx.graphics;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.glutils.FileTextureArrayData;

public interface TextureArrayData {
  void consumeTextureArrayData();
  
  int getDepth();
  
  int getGLType();
  
  int getHeight();
  
  int getInternalFormat();
  
  int getWidth();
  
  boolean isManaged();
  
  boolean isPrepared();
  
  void prepare();
  
  public static class Factory {
    public static TextureArrayData loadFromFiles(Pixmap.Format param1Format, boolean param1Boolean, FileHandle... param1VarArgs) { return new FileTextureArrayData(param1Format, param1Boolean, param1VarArgs); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/TextureArrayData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */