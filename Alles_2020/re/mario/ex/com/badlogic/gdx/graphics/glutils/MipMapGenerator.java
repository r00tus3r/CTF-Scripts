package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;

public class MipMapGenerator {
  private static boolean useHWMipMap = true;
  
  static  {
  
  }
  
  public static void generateMipMap(int paramInt1, Pixmap paramPixmap, int paramInt2, int paramInt3) {
    if (!useHWMipMap) {
      generateMipMapCPU(paramInt1, paramPixmap, paramInt2, paramInt3);
      return;
    } 
    if (Gdx.app.getType() == Application.ApplicationType.Android || Gdx.app.getType() == Application.ApplicationType.WebGL || Gdx.app.getType() == Application.ApplicationType.iOS) {
      generateMipMapGLES20(paramInt1, paramPixmap);
      return;
    } 
    generateMipMapDesktop(paramInt1, paramPixmap, paramInt2, paramInt3);
  }
  
  public static void generateMipMap(Pixmap paramPixmap, int paramInt1, int paramInt2) { generateMipMap(3553, paramPixmap, paramInt1, paramInt2); }
  
  private static void generateMipMapCPU(int paramInt1, Pixmap paramPixmap, int paramInt2, int paramInt3) {
    Gdx.gl.glTexImage2D(paramInt1, 0, paramPixmap.getGLInternalFormat(), paramPixmap.getWidth(), paramPixmap.getHeight(), 0, paramPixmap.getGLFormat(), paramPixmap.getGLType(), paramPixmap.getPixels());
    if (Gdx.gl20 != null || paramInt2 == paramInt3) {
      paramInt3 = paramPixmap.getWidth() / 2;
      int i = paramPixmap.getHeight() / 2;
      for (paramInt2 = 1; paramInt3 > 0 && i > 0; paramInt2++) {
        Pixmap pixmap = new Pixmap(paramInt3, i, paramPixmap.getFormat());
        pixmap.setBlending(Pixmap.Blending.None);
        pixmap.drawPixmap(paramPixmap, 0, 0, paramPixmap.getWidth(), paramPixmap.getHeight(), 0, 0, paramInt3, i);
        if (paramInt2 > 1)
          paramPixmap.dispose(); 
        GL20 gL20 = Gdx.gl;
        int j = pixmap.getGLInternalFormat();
        i = pixmap.getWidth();
        paramInt3 = pixmap.getHeight();
        int k = pixmap.getGLFormat();
        int m = pixmap.getGLType();
        ByteBuffer byteBuffer = pixmap.getPixels();
        paramPixmap = pixmap;
        gL20.glTexImage2D(paramInt1, paramInt2, j, i, paramInt3, 0, k, m, byteBuffer);
        paramInt3 = paramPixmap.getWidth() / 2;
        i = paramPixmap.getHeight() / 2;
      } 
      return;
    } 
    throw new GdxRuntimeException("texture width and height must be square when using mipmapping.");
  }
  
  private static void generateMipMapDesktop(int paramInt1, Pixmap paramPixmap, int paramInt2, int paramInt3) {
    if (Gdx.graphics.supportsExtension("GL_ARB_framebuffer_object") || Gdx.graphics.supportsExtension("GL_EXT_framebuffer_object") || Gdx.gl30 != null) {
      Gdx.gl.glTexImage2D(paramInt1, 0, paramPixmap.getGLInternalFormat(), paramPixmap.getWidth(), paramPixmap.getHeight(), 0, paramPixmap.getGLFormat(), paramPixmap.getGLType(), paramPixmap.getPixels());
      Gdx.gl20.glGenerateMipmap(paramInt1);
      return;
    } 
    generateMipMapCPU(paramInt1, paramPixmap, paramInt2, paramInt3);
  }
  
  private static void generateMipMapGLES20(int paramInt, Pixmap paramPixmap) {
    Gdx.gl.glTexImage2D(paramInt, 0, paramPixmap.getGLInternalFormat(), paramPixmap.getWidth(), paramPixmap.getHeight(), 0, paramPixmap.getGLFormat(), paramPixmap.getGLType(), paramPixmap.getPixels());
    Gdx.gl20.glGenerateMipmap(paramInt);
  }
  
  public static void setUseHardwareMipMap(boolean paramBoolean) { useHWMipMap = paramBoolean; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/MipMapGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */