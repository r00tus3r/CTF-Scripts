package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.Disposable;
import java.nio.FloatBuffer;

public interface InstanceData extends Disposable {
  void bind(ShaderProgram paramShaderProgram);
  
  void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt);
  
  void dispose();
  
  VertexAttributes getAttributes();
  
  FloatBuffer getBuffer();
  
  int getNumInstances();
  
  int getNumMaxInstances();
  
  void invalidate();
  
  void setInstanceData(FloatBuffer paramFloatBuffer, int paramInt);
  
  void setInstanceData(float[] paramArrayOfFloat, int paramInt1, int paramInt2);
  
  void unbind(ShaderProgram paramShaderProgram);
  
  void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt);
  
  void updateInstanceData(int paramInt1, FloatBuffer paramFloatBuffer, int paramInt2, int paramInt3);
  
  void updateInstanceData(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/InstanceData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */