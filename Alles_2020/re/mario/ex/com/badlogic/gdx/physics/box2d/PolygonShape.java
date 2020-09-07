package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class PolygonShape extends Shape {
  private static float[] verts = new float[2];
  
  public PolygonShape() {}
  
  protected PolygonShape(long paramLong) {}
  
  private native void jniGetVertex(long paramLong, int paramInt, float[] paramArrayOfFloat);
  
  private native int jniGetVertexCount(long paramLong);
  
  private native void jniSet(long paramLong, float[] paramArrayOfFloat, int paramInt1, int paramInt2);
  
  private native void jniSetAsBox(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetAsBox(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5);
  
  private native long newPolygonShape();
  
  public Shape.Type getType() { return Shape.Type.Polygon; }
  
  public void getVertex(int paramInt, Vector2 paramVector2) {
    jniGetVertex(this.addr, paramInt, verts);
    float[] arrayOfFloat = verts;
    paramVector2.x = arrayOfFloat[0];
    paramVector2.y = arrayOfFloat[1];
  }
  
  public int getVertexCount() { return jniGetVertexCount(this.addr); }
  
  public void set(float[] paramArrayOfFloat) { jniSet(this.addr, paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public void set(float[] paramArrayOfFloat, int paramInt1, int paramInt2) { jniSet(this.addr, paramArrayOfFloat, paramInt1, paramInt2); }
  
  public void set(Vector2[] paramArrayOfVector2) {
    float[] arrayOfFloat = new float[paramArrayOfVector2.length * 2];
    boolean bool = false;
    for (byte b = 0; bool < paramArrayOfVector2.length * 2; b++) {
      arrayOfFloat[bool] = (paramArrayOfVector2[b]).x;
      arrayOfFloat[bool + true] = (paramArrayOfVector2[b]).y;
      bool += true;
    } 
    jniSet(this.addr, arrayOfFloat, 0, arrayOfFloat.length);
  }
  
  public void setAsBox(float paramFloat1, float paramFloat2) { jniSetAsBox(this.addr, paramFloat1, paramFloat2); }
  
  public void setAsBox(float paramFloat1, float paramFloat2, Vector2 paramVector2, float paramFloat3) { jniSetAsBox(this.addr, paramFloat1, paramFloat2, paramVector2.x, paramVector2.y, paramFloat3); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/PolygonShape.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */