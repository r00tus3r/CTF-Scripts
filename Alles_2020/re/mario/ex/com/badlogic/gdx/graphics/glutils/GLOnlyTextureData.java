package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class GLOnlyTextureData implements TextureData {
  int format;
  
  int height = 0;
  
  int internalFormat;
  
  boolean isPrepared = false;
  
  int mipLevel = 0;
  
  int type;
  
  int width = 0;
  
  public GLOnlyTextureData(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) {
    this.width = paramInt1;
    this.height = paramInt2;
    this.mipLevel = paramInt3;
    this.internalFormat = paramInt4;
    this.format = paramInt5;
    this.type = paramInt6;
  }
  
  public void consumeCustomData(int paramInt) { Gdx.gl.glTexImage2D(paramInt, this.mipLevel, this.internalFormat, this.width, this.height, 0, this.format, this.type, null); }
  
  public Pixmap consumePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public boolean disposePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public Pixmap.Format getFormat() { return Pixmap.Format.RGBA8888; }
  
  public int getHeight() { return this.height; }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Custom; }
  
  public int getWidth() { return this.width; }
  
  public boolean isManaged() { return false; }
  
  public boolean isPrepared() { return this.isPrepared; }
  
  public void prepare() {
    if (!this.isPrepared) {
      this.isPrepared = true;
      return;
    } 
    throw new GdxRuntimeException("Already prepared");
  }
  
  public boolean useMipMaps() { return false; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/GLOnlyTextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */