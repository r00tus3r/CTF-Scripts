package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class ChainShape extends Shape {
  private static float[] verts = new float[2];
  
  boolean isLooped = false;
  
  public ChainShape() {}
  
  ChainShape(long paramLong) {}
  
  private native void jniCreateChain(long paramLong, float[] paramArrayOfFloat, int paramInt1, int paramInt2);
  
  private native void jniCreateLoop(long paramLong, float[] paramArrayOfFloat, int paramInt1, int paramInt2);
  
  private native void jniGetVertex(long paramLong, int paramInt, float[] paramArrayOfFloat);
  
  private native int jniGetVertexCount(long paramLong);
  
  private native void jniSetNextVertex(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetPrevVertex(long paramLong, float paramFloat1, float paramFloat2);
  
  private native long newChainShape();
  
  public void createChain(float[] paramArrayOfFloat) {
    jniCreateChain(this.addr, paramArrayOfFloat, 0, paramArrayOfFloat.length / 2);
    this.isLooped = false;
  }
  
  public void createChain(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    jniCreateChain(this.addr, paramArrayOfFloat, paramInt1, paramInt2 / 2);
    this.isLooped = false;
  }
  
  public void createChain(Vector2[] paramArrayOfVector2) {
    float[] arrayOfFloat = new float[paramArrayOfVector2.length * 2];
    boolean bool = false;
    for (byte b = 0; bool < paramArrayOfVector2.length * 2; b++) {
      arrayOfFloat[bool] = (paramArrayOfVector2[b]).x;
      arrayOfFloat[bool + true] = (paramArrayOfVector2[b]).y;
      bool += true;
    } 
    jniCreateChain(this.addr, arrayOfFloat, 0, paramArrayOfVector2.length);
    this.isLooped = false;
  }
  
  public void createLoop(float[] paramArrayOfFloat) {
    jniCreateLoop(this.addr, paramArrayOfFloat, 0, paramArrayOfFloat.length / 2);
    this.isLooped = true;
  }
  
  public void createLoop(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    jniCreateLoop(this.addr, paramArrayOfFloat, paramInt1, paramInt2 / 2);
    this.isLooped = true;
  }
  
  public void createLoop(Vector2[] paramArrayOfVector2) {
    float[] arrayOfFloat = new float[paramArrayOfVector2.length * 2];
    boolean bool = false;
    for (byte b = 0; bool < paramArrayOfVector2.length * 2; b++) {
      arrayOfFloat[bool] = (paramArrayOfVector2[b]).x;
      arrayOfFloat[bool + true] = (paramArrayOfVector2[b]).y;
      bool += true;
    } 
    jniCreateLoop(this.addr, arrayOfFloat, 0, arrayOfFloat.length / 2);
    this.isLooped = true;
  }
  
  public Shape.Type getType() { return Shape.Type.Chain; }
  
  public void getVertex(int paramInt, Vector2 paramVector2) {
    jniGetVertex(this.addr, paramInt, verts);
    float[] arrayOfFloat = verts;
    paramVector2.x = arrayOfFloat[0];
    paramVector2.y = arrayOfFloat[1];
  }
  
  public int getVertexCount() { return jniGetVertexCount(this.addr); }
  
  public boolean isLooped() { return this.isLooped; }
  
  public void setNextVertex(float paramFloat1, float paramFloat2) { jniSetNextVertex(this.addr, paramFloat1, paramFloat2); }
  
  public void setNextVertex(Vector2 paramVector2) { setNextVertex(paramVector2.x, paramVector2.y); }
  
  public void setPrevVertex(float paramFloat1, float paramFloat2) { jniSetPrevVertex(this.addr, paramFloat1, paramFloat2); }
  
  public void setPrevVertex(Vector2 paramVector2) { setPrevVertex(paramVector2.x, paramVector2.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/ChainShape.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */