package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;

public class HdpiUtils {
  private static HdpiMode mode = HdpiMode.Logical;
  
  public static void glScissor(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (mode == HdpiMode.Logical && (Gdx.graphics.getWidth() != Gdx.graphics.getBackBufferWidth() || Gdx.graphics.getHeight() != Gdx.graphics.getBackBufferHeight())) {
      Gdx.gl.glScissor(toBackBufferX(paramInt1), toBackBufferY(paramInt2), toBackBufferX(paramInt3), toBackBufferY(paramInt4));
    } else {
      Gdx.gl.glScissor(paramInt1, paramInt2, paramInt3, paramInt4);
    } 
  }
  
  public static void glViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (mode == HdpiMode.Logical && (Gdx.graphics.getWidth() != Gdx.graphics.getBackBufferWidth() || Gdx.graphics.getHeight() != Gdx.graphics.getBackBufferHeight())) {
      Gdx.gl.glViewport(toBackBufferX(paramInt1), toBackBufferY(paramInt2), toBackBufferX(paramInt3), toBackBufferY(paramInt4));
    } else {
      Gdx.gl.glViewport(paramInt1, paramInt2, paramInt3, paramInt4);
    } 
  }
  
  public static void setMode(HdpiMode paramHdpiMode) { mode = paramHdpiMode; }
  
  public static int toBackBufferX(int paramInt) { return (int)((paramInt * Gdx.graphics.getBackBufferWidth()) / Gdx.graphics.getWidth()); }
  
  public static int toBackBufferY(int paramInt) { return (int)((paramInt * Gdx.graphics.getBackBufferHeight()) / Gdx.graphics.getHeight()); }
  
  public static int toLogicalX(int paramInt) { return (int)((paramInt * Gdx.graphics.getWidth()) / Gdx.graphics.getBackBufferWidth()); }
  
  public static int toLogicalY(int paramInt) { return (int)((paramInt * Gdx.graphics.getHeight()) / Gdx.graphics.getBackBufferHeight()); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/HdpiUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */