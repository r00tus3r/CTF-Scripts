package com.badlogic.gdx.math.collision;

import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import java.io.Serializable;

public class Ray implements Serializable {
  private static final long serialVersionUID = -620692054835390878L;
  
  static Vector3 tmp = new Vector3();
  
  public final Vector3 direction = new Vector3();
  
  public final Vector3 origin = new Vector3();
  
  public Ray() {}
  
  public Ray(Vector3 paramVector31, Vector3 paramVector32) {
    this.origin.set(paramVector31);
    this.direction.set(paramVector32).nor();
  }
  
  public Ray cpy() { return new Ray(this.origin, this.direction); }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (paramObject == this)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (Ray)paramObject;
    if (!this.direction.equals(paramObject.direction) || !this.origin.equals(paramObject.origin))
      bool = false; 
    return bool;
  }
  
  public Vector3 getEndPoint(Vector3 paramVector3, float paramFloat) { return paramVector3.set(this.direction).scl(paramFloat).add(this.origin); }
  
  public int hashCode() { return (this.direction.hashCode() + 73) * 73 + this.origin.hashCode(); }
  
  public Ray mul(Matrix4 paramMatrix4) {
    tmp.set(this.origin).add(this.direction);
    tmp.mul(paramMatrix4);
    this.origin.mul(paramMatrix4);
    this.direction.set(tmp.sub(this.origin));
    return this;
  }
  
  public Ray set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    this.origin.set(paramFloat1, paramFloat2, paramFloat3);
    this.direction.set(paramFloat4, paramFloat5, paramFloat6);
    return this;
  }
  
  public Ray set(Vector3 paramVector31, Vector3 paramVector32) {
    this.origin.set(paramVector31);
    this.direction.set(paramVector32);
    return this;
  }
  
  public Ray set(Ray paramRay) {
    this.origin.set(paramRay.origin);
    this.direction.set(paramRay.direction);
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("ray [");
    stringBuilder.append(this.origin);
    stringBuilder.append(":");
    stringBuilder.append(this.direction);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/collision/Ray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */