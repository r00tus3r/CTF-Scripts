package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class Manifold {
  long addr;
  
  final Vector2 localNormal = new Vector2();
  
  final Vector2 localPoint = new Vector2();
  
  final ManifoldPoint[] points = { new ManifoldPoint(), new ManifoldPoint() };
  
  final float[] tmpFloat = new float[4];
  
  final int[] tmpInt = new int[2];
  
  protected Manifold(long paramLong) { this.addr = paramLong; }
  
  private native void jniGetLocalNormal(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLocalPoint(long paramLong, float[] paramArrayOfFloat);
  
  private native int jniGetPoint(long paramLong, float[] paramArrayOfFloat, int paramInt);
  
  private native int jniGetPointCount(long paramLong);
  
  private native int jniGetType(long paramLong);
  
  public Vector2 getLocalNormal() {
    jniGetLocalNormal(this.addr, this.tmpFloat);
    Vector2 vector2 = this.localNormal;
    float[] arrayOfFloat = this.tmpFloat;
    vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
    return this.localNormal;
  }
  
  public Vector2 getLocalPoint() {
    jniGetLocalPoint(this.addr, this.tmpFloat);
    Vector2 vector2 = this.localPoint;
    float[] arrayOfFloat = this.tmpFloat;
    vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
    return this.localPoint;
  }
  
  public int getPointCount() { return jniGetPointCount(this.addr); }
  
  public ManifoldPoint[] getPoints() {
    int i = jniGetPointCount(this.addr);
    for (byte b = 0; b < i; b++) {
      int j = jniGetPoint(this.addr, this.tmpFloat, b);
      ManifoldPoint manifoldPoint = this.points[b];
      manifoldPoint.contactID = j;
      Vector2 vector2 = manifoldPoint.localPoint;
      float[] arrayOfFloat = this.tmpFloat;
      vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
      arrayOfFloat = this.tmpFloat;
      manifoldPoint.normalImpulse = arrayOfFloat[2];
      manifoldPoint.tangentImpulse = arrayOfFloat[3];
    } 
    return this.points;
  }
  
  public ManifoldType getType() {
    int i = jniGetType(this.addr);
    return (i == 0) ? ManifoldType.Circle : ((i == 1) ? ManifoldType.FaceA : ((i == 2) ? ManifoldType.FaceB : ManifoldType.Circle));
  }
  
  public class ManifoldPoint {
    public int contactID = 0;
    
    public final Vector2 localPoint = new Vector2();
    
    public float normalImpulse;
    
    public float tangentImpulse;
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("id: ");
      stringBuilder.append(this.contactID);
      stringBuilder.append(", ");
      stringBuilder.append(this.localPoint);
      stringBuilder.append(", ");
      stringBuilder.append(this.normalImpulse);
      stringBuilder.append(", ");
      stringBuilder.append(this.tangentImpulse);
      return stringBuilder.toString();
    }
  }
  
  public enum ManifoldType {
    Circle, FaceA, FaceB;
    
    static  {
      $VALUES = new ManifoldType[] { Circle, FaceA, FaceB };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Manifold.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */