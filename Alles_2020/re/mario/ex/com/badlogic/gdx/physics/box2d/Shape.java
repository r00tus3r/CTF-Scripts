package com.badlogic.gdx.physics.box2d;

public abstract class Shape {
  protected long addr;
  
  private native void jniDispose(long paramLong);
  
  private native int jniGetChildCount(long paramLong);
  
  private native float jniGetRadius(long paramLong);
  
  protected static native int jniGetType(long paramLong);
  
  private native void jniSetRadius(long paramLong, float paramFloat);
  
  public void dispose() { jniDispose(this.addr); }
  
  public int getChildCount() { return jniGetChildCount(this.addr); }
  
  public float getRadius() { return jniGetRadius(this.addr); }
  
  public abstract Type getType();
  
  public void setRadius(float paramFloat) { jniSetRadius(this.addr, paramFloat); }
  
  public enum Type {
    Chain, Circle, Edge, Polygon;
    
    static  {
      Chain = new Type("Chain", 3);
      $VALUES = new Type[] { Circle, Edge, Polygon, Chain };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Shape.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */