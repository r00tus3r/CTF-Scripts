package com.badlogic.gdx.math.collision;

import com.badlogic.gdx.math.Vector3;
import java.io.Serializable;

public class Segment implements Serializable {
  private static final long serialVersionUID = 2739667069736519602L;
  
  public final Vector3 a = new Vector3();
  
  public final Vector3 b = new Vector3();
  
  public Segment(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    this.a.set(paramFloat1, paramFloat2, paramFloat3);
    this.b.set(paramFloat4, paramFloat5, paramFloat6);
  }
  
  public Segment(Vector3 paramVector31, Vector3 paramVector32) {
    this.a.set(paramVector31);
    this.b.set(paramVector32);
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (paramObject == this)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (Segment)paramObject;
    if (!this.a.equals(paramObject.a) || !this.b.equals(paramObject.b))
      bool = false; 
    return bool;
  }
  
  public int hashCode() { return (this.a.hashCode() + 71) * 71 + this.b.hashCode(); }
  
  public float len() { return this.a.dst(this.b); }
  
  public float len2() { return this.a.dst2(this.b); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/collision/Segment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */