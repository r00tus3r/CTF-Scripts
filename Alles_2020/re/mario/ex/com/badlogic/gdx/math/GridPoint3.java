package com.badlogic.gdx.math;

import java.io.Serializable;

public class GridPoint3 implements Serializable {
  private static final long serialVersionUID = 5922187982746752830L;
  
  public int x;
  
  public int y;
  
  public int z;
  
  public GridPoint3() {}
  
  public GridPoint3(int paramInt1, int paramInt2, int paramInt3) {
    this.x = paramInt1;
    this.y = paramInt2;
    this.z = paramInt3;
  }
  
  public GridPoint3(GridPoint3 paramGridPoint3) {
    this.x = paramGridPoint3.x;
    this.y = paramGridPoint3.y;
    this.z = paramGridPoint3.z;
  }
  
  public GridPoint3 add(int paramInt1, int paramInt2, int paramInt3) {
    this.x += paramInt1;
    this.y += paramInt2;
    this.z += paramInt3;
    return this;
  }
  
  public GridPoint3 add(GridPoint3 paramGridPoint3) {
    this.x += paramGridPoint3.x;
    this.y += paramGridPoint3.y;
    this.z += paramGridPoint3.z;
    return this;
  }
  
  public GridPoint3 cpy() { return new GridPoint3(this); }
  
  public float dst(int paramInt1, int paramInt2, int paramInt3) {
    paramInt1 -= this.x;
    paramInt2 -= this.y;
    paramInt3 -= this.z;
    return (float)Math.sqrt((paramInt1 * paramInt1 + paramInt2 * paramInt2 + paramInt3 * paramInt3));
  }
  
  public float dst(GridPoint3 paramGridPoint3) {
    int i = paramGridPoint3.x - this.x;
    int j = paramGridPoint3.y - this.y;
    int k = paramGridPoint3.z - this.z;
    return (float)Math.sqrt((i * i + j * j + k * k));
  }
  
  public float dst2(int paramInt1, int paramInt2, int paramInt3) {
    paramInt1 -= this.x;
    paramInt2 -= this.y;
    paramInt3 -= this.z;
    return (paramInt1 * paramInt1 + paramInt2 * paramInt2 + paramInt3 * paramInt3);
  }
  
  public float dst2(GridPoint3 paramGridPoint3) {
    int i = paramGridPoint3.x - this.x;
    int j = paramGridPoint3.y - this.y;
    int k = paramGridPoint3.z - this.z;
    return (i * i + j * j + k * k);
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (this == paramObject)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (GridPoint3)paramObject;
    if (this.x != paramObject.x || this.y != paramObject.y || this.z != paramObject.z)
      bool = false; 
    return bool;
  }
  
  public int hashCode() { return ((this.x + 17) * 17 + this.y) * 17 + this.z; }
  
  public GridPoint3 set(int paramInt1, int paramInt2, int paramInt3) {
    this.x = paramInt1;
    this.y = paramInt2;
    this.z = paramInt3;
    return this;
  }
  
  public GridPoint3 set(GridPoint3 paramGridPoint3) {
    this.x = paramGridPoint3.x;
    this.y = paramGridPoint3.y;
    this.z = paramGridPoint3.z;
    return this;
  }
  
  public GridPoint3 sub(int paramInt1, int paramInt2, int paramInt3) {
    this.x -= paramInt1;
    this.y -= paramInt2;
    this.z -= paramInt3;
    return this;
  }
  
  public GridPoint3 sub(GridPoint3 paramGridPoint3) {
    this.x -= paramGridPoint3.x;
    this.y -= paramGridPoint3.y;
    this.z -= paramGridPoint3.z;
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("(");
    stringBuilder.append(this.x);
    stringBuilder.append(", ");
    stringBuilder.append(this.y);
    stringBuilder.append(", ");
    stringBuilder.append(this.z);
    stringBuilder.append(")");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/GridPoint3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */