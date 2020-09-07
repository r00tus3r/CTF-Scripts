package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.Disposable;
import java.nio.FloatBuffer;

public interface VertexData extends Disposable {
  void bind(ShaderProgram paramShaderProgram);
  
  void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt);
  
  void dispose();
  
  VertexAttributes getAttributes();
  
  FloatBuffer getBuffer();
  
  int getNumMaxVertices();
  
  int getNumVertices();
  
  void invalidate();
  
  void setVertices(float[] paramArrayOfFloat, int paramInt1, int paramInt2);
  
  void unbind(ShaderProgram paramShaderProgram);
  
  void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt);
  
  void updateVertices(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/VertexData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */