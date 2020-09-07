package com.badlogic.gdx.math;

import java.io.Serializable;

public class GridPoint2 implements Serializable {
  private static final long serialVersionUID = -4019969926331717380L;
  
  public int x;
  
  public int y;
  
  public GridPoint2() {}
  
  public GridPoint2(int paramInt1, int paramInt2) {
    this.x = paramInt1;
    this.y = paramInt2;
  }
  
  public GridPoint2(GridPoint2 paramGridPoint2) {
    this.x = paramGridPoint2.x;
    this.y = paramGridPoint2.y;
  }
  
  public GridPoint2 add(int paramInt1, int paramInt2) {
    this.x += paramInt1;
    this.y += paramInt2;
    return this;
  }
  
  public GridPoint2 add(GridPoint2 paramGridPoint2) {
    this.x += paramGridPoint2.x;
    this.y += paramGridPoint2.y;
    return this;
  }
  
  public GridPoint2 cpy() { return new GridPoint2(this); }
  
  public float dst(int paramInt1, int paramInt2) {
    paramInt1 -= this.x;
    paramInt2 -= this.y;
    return (float)Math.sqrt((paramInt1 * paramInt1 + paramInt2 * paramInt2));
  }
  
  public float dst(GridPoint2 paramGridPoint2) {
    int i = paramGridPoint2.x - this.x;
    int j = paramGridPoint2.y - this.y;
    return (float)Math.sqrt((i * i + j * j));
  }
  
  public float dst2(int paramInt1, int paramInt2) {
    paramInt1 -= this.x;
    paramInt2 -= this.y;
    return (paramInt1 * paramInt1 + paramInt2 * paramInt2);
  }
  
  public float dst2(GridPoint2 paramGridPoint2) {
    int i = paramGridPoint2.x - this.x;
    int j = paramGridPoint2.y - this.y;
    return (i * i + j * j);
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (this == paramObject)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (GridPoint2)paramObject;
    if (this.x != paramObject.x || this.y != paramObject.y)
      bool = false; 
    return bool;
  }
  
  public int hashCode() { return (this.x + 53) * 53 + this.y; }
  
  public GridPoint2 set(int paramInt1, int paramInt2) {
    this.x = paramInt1;
    this.y = paramInt2;
    return this;
  }
  
  public GridPoint2 set(GridPoint2 paramGridPoint2) {
    this.x = paramGridPoint2.x;
    this.y = paramGridPoint2.y;
    return this;
  }
  
  public GridPoint2 sub(int paramInt1, int paramInt2) {
    this.x -= paramInt1;
    this.y -= paramInt2;
    return this;
  }
  
  public GridPoint2 sub(GridPoint2 paramGridPoint2) {
    this.x -= paramGridPoint2.x;
    this.y -= paramGridPoint2.y;
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("(");
    stringBuilder.append(this.x);
    stringBuilder.append(", ");
    stringBuilder.append(this.y);
    stringBuilder.append(")");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/GridPoint2.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */