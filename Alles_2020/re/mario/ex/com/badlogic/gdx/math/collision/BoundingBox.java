package com.badlogic.gdx.math.collision;

import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

public class BoundingBox implements Serializable {
  private static final long serialVersionUID = -1286036817192127343L;
  
  private static final Vector3 tmpVector = new Vector3();
  
  private final Vector3 cnt = new Vector3();
  
  private final Vector3 dim = new Vector3();
  
  public final Vector3 max = new Vector3();
  
  public final Vector3 min = new Vector3();
  
  public BoundingBox() { clr(); }
  
  public BoundingBox(Vector3 paramVector31, Vector3 paramVector32) { set(paramVector31, paramVector32); }
  
  public BoundingBox(BoundingBox paramBoundingBox) { set(paramBoundingBox); }
  
  static final float max(float paramFloat1, float paramFloat2) {
    if (paramFloat1 <= paramFloat2)
      paramFloat1 = paramFloat2; 
    return paramFloat1;
  }
  
  static final float min(float paramFloat1, float paramFloat2) {
    float f = paramFloat1;
    if (paramFloat1 > paramFloat2)
      f = paramFloat2; 
    return f;
  }
  
  public BoundingBox clr() { return set(this.min.set(0.0F, 0.0F, 0.0F), this.max.set(0.0F, 0.0F, 0.0F)); }
  
  public boolean contains(Vector3 paramVector3) {
    boolean bool;
    if (this.min.x <= paramVector3.x && this.max.x >= paramVector3.x && this.min.y <= paramVector3.y && this.max.y >= paramVector3.y && this.min.z <= paramVector3.z && this.max.z >= paramVector3.z) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean contains(BoundingBox paramBoundingBox) { return (!isValid() || (this.min.x <= paramBoundingBox.min.x && this.min.y <= paramBoundingBox.min.y && this.min.z <= paramBoundingBox.min.z && this.max.x >= paramBoundingBox.max.x && this.max.y >= paramBoundingBox.max.y && this.max.z >= paramBoundingBox.max.z)); }
  
  public BoundingBox ext(float paramFloat1, float paramFloat2, float paramFloat3) {
    Vector3 vector31 = this.min;
    Vector3 vector32 = vector31.set(min(vector31.x, paramFloat1), min(this.min.y, paramFloat2), min(this.min.z, paramFloat3));
    vector31 = this.max;
    return set(vector32, vector31.set(max(vector31.x, paramFloat1), max(this.max.y, paramFloat2), max(this.max.z, paramFloat3)));
  }
  
  public BoundingBox ext(Vector3 paramVector3) {
    Vector3 vector31 = this.min;
    Vector3 vector32 = vector31.set(min(vector31.x, paramVector3.x), min(this.min.y, paramVector3.y), min(this.min.z, paramVector3.z));
    vector31 = this.max;
    return set(vector32, vector31.set(Math.max(vector31.x, paramVector3.x), Math.max(this.max.y, paramVector3.y), Math.max(this.max.z, paramVector3.z)));
  }
  
  public BoundingBox ext(Vector3 paramVector3, float paramFloat) {
    Vector3 vector31 = this.min;
    vector31 = vector31.set(min(vector31.x, paramVector3.x - paramFloat), min(this.min.y, paramVector3.y - paramFloat), min(this.min.z, paramVector3.z - paramFloat));
    Vector3 vector32 = this.max;
    return set(vector31, vector32.set(max(vector32.x, paramVector3.x + paramFloat), max(this.max.y, paramVector3.y + paramFloat), max(this.max.z, paramVector3.z + paramFloat)));
  }
  
  public BoundingBox ext(BoundingBox paramBoundingBox) {
    Vector3 vector31 = this.min;
    Vector3 vector32 = vector31.set(min(vector31.x, paramBoundingBox.min.x), min(this.min.y, paramBoundingBox.min.y), min(this.min.z, paramBoundingBox.min.z));
    vector31 = this.max;
    return set(vector32, vector31.set(max(vector31.x, paramBoundingBox.max.x), max(this.max.y, paramBoundingBox.max.y), max(this.max.z, paramBoundingBox.max.z)));
  }
  
  public BoundingBox ext(BoundingBox paramBoundingBox, Matrix4 paramMatrix4) {
    ext(tmpVector.set(paramBoundingBox.min.x, paramBoundingBox.min.y, paramBoundingBox.min.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.min.x, paramBoundingBox.min.y, paramBoundingBox.max.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.min.x, paramBoundingBox.max.y, paramBoundingBox.min.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.min.x, paramBoundingBox.max.y, paramBoundingBox.max.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.max.x, paramBoundingBox.min.y, paramBoundingBox.min.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.max.x, paramBoundingBox.min.y, paramBoundingBox.max.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.max.x, paramBoundingBox.max.y, paramBoundingBox.min.z).mul(paramMatrix4));
    ext(tmpVector.set(paramBoundingBox.max.x, paramBoundingBox.max.y, paramBoundingBox.max.z).mul(paramMatrix4));
    return this;
  }
  
  public Vector3 getCenter(Vector3 paramVector3) { return paramVector3.set(this.cnt); }
  
  public float getCenterX() { return this.cnt.x; }
  
  public float getCenterY() { return this.cnt.y; }
  
  public float getCenterZ() { return this.cnt.z; }
  
  public Vector3 getCorner000(Vector3 paramVector3) { return paramVector3.set(this.min.x, this.min.y, this.min.z); }
  
  public Vector3 getCorner001(Vector3 paramVector3) { return paramVector3.set(this.min.x, this.min.y, this.max.z); }
  
  public Vector3 getCorner010(Vector3 paramVector3) { return paramVector3.set(this.min.x, this.max.y, this.min.z); }
  
  public Vector3 getCorner011(Vector3 paramVector3) { return paramVector3.set(this.min.x, this.max.y, this.max.z); }
  
  public Vector3 getCorner100(Vector3 paramVector3) { return paramVector3.set(this.max.x, this.min.y, this.min.z); }
  
  public Vector3 getCorner101(Vector3 paramVector3) { return paramVector3.set(this.max.x, this.min.y, this.max.z); }
  
  public Vector3 getCorner110(Vector3 paramVector3) { return paramVector3.set(this.max.x, this.max.y, this.min.z); }
  
  public Vector3 getCorner111(Vector3 paramVector3) { return paramVector3.set(this.max.x, this.max.y, this.max.z); }
  
  public float getDepth() { return this.dim.z; }
  
  public Vector3 getDimensions(Vector3 paramVector3) { return paramVector3.set(this.dim); }
  
  public float getHeight() { return this.dim.y; }
  
  public Vector3 getMax(Vector3 paramVector3) { return paramVector3.set(this.max); }
  
  public Vector3 getMin(Vector3 paramVector3) { return paramVector3.set(this.min); }
  
  public float getWidth() { return this.dim.x; }
  
  public BoundingBox inf() {
    this.min.set(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
    this.max.set(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);
    this.cnt.set(0.0F, 0.0F, 0.0F);
    this.dim.set(0.0F, 0.0F, 0.0F);
    return this;
  }
  
  public boolean intersects(BoundingBox paramBoundingBox) {
    boolean bool = isValid();
    boolean bool1 = false;
    if (!bool)
      return false; 
    float f1 = Math.abs(this.cnt.x - paramBoundingBox.cnt.x);
    float f2 = this.dim.x / 2.0F;
    float f3 = paramBoundingBox.dim.x / 2.0F;
    float f4 = Math.abs(this.cnt.y - paramBoundingBox.cnt.y);
    float f5 = this.dim.y / 2.0F;
    float f6 = paramBoundingBox.dim.y / 2.0F;
    float f7 = Math.abs(this.cnt.z - paramBoundingBox.cnt.z);
    float f8 = this.dim.z / 2.0F;
    float f9 = paramBoundingBox.dim.z / 2.0F;
    bool = bool1;
    if (f1 <= f2 + f3) {
      bool = bool1;
      if (f4 <= f5 + f6) {
        bool = bool1;
        if (f7 <= f8 + f9)
          bool = true; 
      } 
    } 
    return bool;
  }
  
  public boolean isValid() {
    boolean bool;
    if (this.min.x <= this.max.x && this.min.y <= this.max.y && this.min.z <= this.max.z) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public BoundingBox mul(Matrix4 paramMatrix4) {
    float f1 = this.min.x;
    float f2 = this.min.y;
    float f3 = this.min.z;
    float f4 = this.max.x;
    float f5 = this.max.y;
    float f6 = this.max.z;
    inf();
    ext(tmpVector.set(f1, f2, f3).mul(paramMatrix4));
    ext(tmpVector.set(f1, f2, f6).mul(paramMatrix4));
    ext(tmpVector.set(f1, f5, f3).mul(paramMatrix4));
    ext(tmpVector.set(f1, f5, f6).mul(paramMatrix4));
    ext(tmpVector.set(f4, f2, f3).mul(paramMatrix4));
    ext(tmpVector.set(f4, f2, f6).mul(paramMatrix4));
    ext(tmpVector.set(f4, f5, f3).mul(paramMatrix4));
    ext(tmpVector.set(f4, f5, f6).mul(paramMatrix4));
    return this;
  }
  
  public BoundingBox set(Vector3 paramVector31, Vector3 paramVector32) {
    float f3;
    float f2;
    float f1;
    Vector3 vector3 = this.min;
    if (paramVector31.x < paramVector32.x) {
      f1 = paramVector31.x;
    } else {
      f1 = paramVector32.x;
    } 
    if (paramVector31.y < paramVector32.y) {
      f2 = paramVector31.y;
    } else {
      f2 = paramVector32.y;
    } 
    if (paramVector31.z < paramVector32.z) {
      f3 = paramVector31.z;
    } else {
      f3 = paramVector32.z;
    } 
    vector3.set(f1, f2, f3);
    vector3 = this.max;
    if (paramVector31.x > paramVector32.x) {
      f1 = paramVector31.x;
    } else {
      f1 = paramVector32.x;
    } 
    if (paramVector31.y > paramVector32.y) {
      f2 = paramVector31.y;
    } else {
      f2 = paramVector32.y;
    } 
    if (paramVector31.z > paramVector32.z) {
      f3 = paramVector31.z;
    } else {
      f3 = paramVector32.z;
    } 
    vector3.set(f1, f2, f3);
    this.cnt.set(this.min).add(this.max).scl(0.5F);
    this.dim.set(this.max).sub(this.min);
    return this;
  }
  
  public BoundingBox set(BoundingBox paramBoundingBox) { return set(paramBoundingBox.min, paramBoundingBox.max); }
  
  public BoundingBox set(List<Vector3> paramList) {
    inf();
    Iterator iterator = paramList.iterator();
    while (iterator.hasNext())
      ext((Vector3)iterator.next()); 
    return this;
  }
  
  public BoundingBox set(Vector3[] paramArrayOfVector3) {
    inf();
    int i = paramArrayOfVector3.length;
    for (byte b = 0; b < i; b++)
      ext(paramArrayOfVector3[b]); 
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.min);
    stringBuilder.append("|");
    stringBuilder.append(this.max);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/collision/BoundingBox.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */