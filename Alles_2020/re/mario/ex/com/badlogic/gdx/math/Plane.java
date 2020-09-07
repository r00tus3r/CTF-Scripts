package com.badlogic.gdx.math;

import java.io.Serializable;

public class Plane implements Serializable {
  private static final long serialVersionUID = -1240652082930747866L;
  
  public float d = 0.0F;
  
  public final Vector3 normal = new Vector3();
  
  public Plane() {}
  
  public Plane(Vector3 paramVector3, float paramFloat) {
    this.normal.set(paramVector3).nor();
    this.d = paramFloat;
  }
  
  public Plane(Vector3 paramVector31, Vector3 paramVector32) {
    this.normal.set(paramVector31).nor();
    this.d = -this.normal.dot(paramVector32);
  }
  
  public Plane(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33) { set(paramVector31, paramVector32, paramVector33); }
  
  public float distance(Vector3 paramVector3) { return this.normal.dot(paramVector3) + this.d; }
  
  public float getD() { return this.d; }
  
  public Vector3 getNormal() { return this.normal; }
  
  public boolean isFrontFacing(Vector3 paramVector3) {
    boolean bool;
    if (this.normal.dot(paramVector3) <= 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.normal.set(paramFloat1, paramFloat2, paramFloat3);
    this.d = paramFloat4;
  }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    this.normal.set(paramFloat4, paramFloat5, paramFloat6);
    this.d = -(paramFloat1 * paramFloat4 + paramFloat2 * paramFloat5 + paramFloat3 * paramFloat6);
  }
  
  public void set(Plane paramPlane) {
    this.normal.set(paramPlane.normal);
    this.d = paramPlane.d;
  }
  
  public void set(Vector3 paramVector31, Vector3 paramVector32) {
    this.normal.set(paramVector32);
    this.d = -paramVector31.dot(paramVector32);
  }
  
  public void set(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33) {
    this.normal.set(paramVector31).sub(paramVector32).crs(paramVector32.x - paramVector33.x, paramVector32.y - paramVector33.y, paramVector32.z - paramVector33.z).nor();
    this.d = -paramVector31.dot(this.normal);
  }
  
  public PlaneSide testPoint(float paramFloat1, float paramFloat2, float paramFloat3) {
    paramFloat1 = this.normal.dot(paramFloat1, paramFloat2, paramFloat3) + this.d;
    return (paramFloat1 == 0.0F) ? PlaneSide.OnPlane : ((paramFloat1 < 0.0F) ? PlaneSide.Back : PlaneSide.Front);
  }
  
  public PlaneSide testPoint(Vector3 paramVector3) {
    float f = this.normal.dot(paramVector3) + this.d;
    return (f == 0.0F) ? PlaneSide.OnPlane : ((f < 0.0F) ? PlaneSide.Back : PlaneSide.Front);
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.normal.toString());
    stringBuilder.append(", ");
    stringBuilder.append(this.d);
    return stringBuilder.toString();
  }
  
  public enum PlaneSide {
    Back, Front, OnPlane;
    
    static  {
      Back = new PlaneSide("Back", true);
      Front = new PlaneSide("Front", 2);
      $VALUES = new PlaneSide[] { OnPlane, Back, Front };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Plane.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */