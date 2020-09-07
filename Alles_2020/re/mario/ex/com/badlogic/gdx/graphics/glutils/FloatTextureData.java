package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.FloatBuffer;

public class FloatTextureData implements TextureData {
  FloatBuffer buffer;
  
  int format;
  
  int height = 0;
  
  int internalFormat;
  
  boolean isGpuOnly;
  
  boolean isPrepared = false;
  
  int type;
  
  int width = 0;
  
  public FloatTextureData(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, boolean paramBoolean) {
    this.width = paramInt1;
    this.height = paramInt2;
    this.internalFormat = paramInt3;
    this.format = paramInt4;
    this.type = paramInt5;
    this.isGpuOnly = paramBoolean;
  }
  
  public void consumeCustomData(int paramInt) {
    if (Gdx.app.getType() == Application.ApplicationType.Android || Gdx.app.getType() == Application.ApplicationType.iOS || Gdx.app.getType() == Application.ApplicationType.WebGL) {
      if (Gdx.graphics.supportsExtension("OES_texture_float")) {
        Gdx.gl.glTexImage2D(paramInt, 0, 6408, this.width, this.height, 0, 6408, 5126, this.buffer);
        return;
      } 
      throw new GdxRuntimeException("Extension OES_texture_float not supported!");
    } 
    if (Gdx.graphics.isGL30Available() || Gdx.graphics.supportsExtension("GL_ARB_texture_float")) {
      Gdx.gl.glTexImage2D(paramInt, 0, this.internalFormat, this.width, this.height, 0, this.format, 5126, this.buffer);
      return;
    } 
    throw new GdxRuntimeException("Extension GL_ARB_texture_float not supported!");
  }
  
  public Pixmap consumePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public boolean disposePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public FloatBuffer getBuffer() { return this.buffer; }
  
  public Pixmap.Format getFormat() { return Pixmap.Format.RGBA8888; }
  
  public int getHeight() { return this.height; }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Custom; }
  
  public int getWidth() { return this.width; }
  
  public boolean isManaged() { return true; }
  
  public boolean isPrepared() { return this.isPrepared; }
  
  public void prepare() {
    if (!this.isPrepared) {
      if (!this.isGpuOnly) {
        boolean bool = Gdx.graphics.getGLVersion().getType().equals(GLVersion.Type.OpenGL);
        int i = 4;
        if (bool) {
          if (this.internalFormat != 34842);
          int j = this.internalFormat;
          if (j == 34843 || j == 34837)
            i = 3; 
          j = this.internalFormat;
          if (j == 33327 || j == 33328)
            i = 2; 
          j = this.internalFormat;
          if (j == 33325 || j == 33326)
            i = 1; 
        } else {
          i = 4;
        } 
        this.buffer = BufferUtils.newFloatBuffer(this.width * this.height * i);
      } 
      this.isPrepared = true;
      return;
    } 
    throw new GdxRuntimeException("Already prepared");
  }
  
  public boolean useMipMaps() { return false; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FloatTextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */