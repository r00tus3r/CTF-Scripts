package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Matrix4;

public interface ImmediateModeRenderer {
  void begin(Matrix4 paramMatrix4, int paramInt);
  
  void color(float paramFloat);
  
  void color(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  void color(Color paramColor);
  
  void dispose();
  
  void end();
  
  void flush();
  
  int getMaxVertices();
  
  int getNumVertices();
  
  void normal(float paramFloat1, float paramFloat2, float paramFloat3);
  
  void texCoord(float paramFloat1, float paramFloat2);
  
  void vertex(float paramFloat1, float paramFloat2, float paramFloat3);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/ImmediateModeRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */