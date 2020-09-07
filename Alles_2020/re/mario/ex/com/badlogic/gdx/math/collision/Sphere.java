package com.badlogic.gdx.math.collision;

import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Sphere implements Serializable {
  private static final float PI_4_3 = 4.1887903F;
  
  private static final long serialVersionUID = -6487336868908521596L;
  
  public final Vector3 center;
  
  public float radius;
  
  public Sphere(Vector3 paramVector3, float paramFloat) {
    this.center = new Vector3(paramVector3);
    this.radius = paramFloat;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (this == paramObject)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (Sphere)paramObject;
    if (this.radius != paramObject.radius || !this.center.equals(paramObject.center))
      bool = false; 
    return bool;
  }
  
  public int hashCode() { return (this.center.hashCode() + 71) * 71 + NumberUtils.floatToRawIntBits(this.radius); }
  
  public boolean overlaps(Sphere paramSphere) {
    boolean bool;
    float f1 = this.center.dst2(paramSphere.center);
    float f2 = this.radius;
    float f3 = paramSphere.radius;
    if (f1 < (f2 + f3) * (f2 + f3)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public float surfaceArea() {
    float f = this.radius;
    return 12.566371F * f * f;
  }
  
  public float volume() {
    float f = this.radius;
    return 4.1887903F * f * f * f;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/collision/Sphere.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */