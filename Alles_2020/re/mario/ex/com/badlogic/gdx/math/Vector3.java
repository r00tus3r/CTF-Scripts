package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Vector3 extends Object implements Serializable, Vector<Vector3> {
  public static final Vector3 X = new Vector3(1.0F, 0.0F, 0.0F);
  
  public static final Vector3 Y = new Vector3(0.0F, 1.0F, 0.0F);
  
  public static final Vector3 Z = new Vector3(0.0F, 0.0F, 1.0F);
  
  public static final Vector3 Zero = new Vector3(0.0F, 0.0F, 0.0F);
  
  private static final long serialVersionUID = 3840054589595372522L;
  
  private static final Matrix4 tmpMat = new Matrix4();
  
  public float x;
  
  public float y;
  
  public float z;
  
  public Vector3() {}
  
  public Vector3(float paramFloat1, float paramFloat2, float paramFloat3) { set(paramFloat1, paramFloat2, paramFloat3); }
  
  public Vector3(Vector2 paramVector2, float paramFloat) { set(paramVector2.x, paramVector2.y, paramFloat); }
  
  public Vector3(Vector3 paramVector3) { set(paramVector3); }
  
  public Vector3(float[] paramArrayOfFloat) { set(paramArrayOfFloat[0], paramArrayOfFloat[1], paramArrayOfFloat[2]); }
  
  public static float dot(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return paramFloat1 * paramFloat4 + paramFloat2 * paramFloat5 + paramFloat3 * paramFloat6; }
  
  public static float dst(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    paramFloat1 = paramFloat4 - paramFloat1;
    paramFloat2 = paramFloat5 - paramFloat2;
    paramFloat3 = paramFloat6 - paramFloat3;
    return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3));
  }
  
  public static float dst2(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    paramFloat1 = paramFloat4 - paramFloat1;
    paramFloat2 = paramFloat5 - paramFloat2;
    paramFloat3 = paramFloat6 - paramFloat3;
    return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3;
  }
  
  public static float len(float paramFloat1, float paramFloat2, float paramFloat3) { return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3)); }
  
  public static float len2(float paramFloat1, float paramFloat2, float paramFloat3) { return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3; }
  
  public Vector3 add(float paramFloat) { return set(this.x + paramFloat, this.y + paramFloat, this.z + paramFloat); }
  
  public Vector3 add(float paramFloat1, float paramFloat2, float paramFloat3) { return set(this.x + paramFloat1, this.y + paramFloat2, this.z + paramFloat3); }
  
  public Vector3 add(Vector3 paramVector3) { return add(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public Vector3 clamp(float paramFloat1, float paramFloat2) {
    float f = len2();
    if (f == 0.0F)
      return this; 
    paramFloat2 *= paramFloat2;
    if (f > paramFloat2)
      return scl((float)Math.sqrt((paramFloat2 / f))); 
    paramFloat1 *= paramFloat1;
    return (f < paramFloat1) ? scl((float)Math.sqrt((paramFloat1 / f))) : this;
  }
  
  public Vector3 cpy() { return new Vector3(this); }
  
  public Vector3 crs(float paramFloat1, float paramFloat2, float paramFloat3) {
    float f1 = this.y;
    float f2 = this.z;
    float f3 = this.x;
    return set(f1 * paramFloat3 - f2 * paramFloat2, f2 * paramFloat1 - paramFloat3 * f3, f3 * paramFloat2 - f1 * paramFloat1);
  }
  
  public Vector3 crs(Vector3 paramVector3) {
    float f1 = this.y;
    float f2 = paramVector3.z;
    float f3 = this.z;
    float f4 = paramVector3.y;
    float f5 = paramVector3.x;
    float f6 = this.x;
    return set(f1 * f2 - f3 * f4, f3 * f5 - f2 * f6, f6 * f4 - f1 * f5);
  }
  
  public float dot(float paramFloat1, float paramFloat2, float paramFloat3) { return this.x * paramFloat1 + this.y * paramFloat2 + this.z * paramFloat3; }
  
  public float dot(Vector3 paramVector3) { return this.x * paramVector3.x + this.y * paramVector3.y + this.z * paramVector3.z; }
  
  public float dst(float paramFloat1, float paramFloat2, float paramFloat3) {
    paramFloat1 -= this.x;
    paramFloat2 -= this.y;
    paramFloat3 -= this.z;
    return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3));
  }
  
  public float dst(Vector3 paramVector3) {
    float f1 = paramVector3.x - this.x;
    float f2 = paramVector3.y - this.y;
    float f3 = paramVector3.z - this.z;
    return (float)Math.sqrt((f1 * f1 + f2 * f2 + f3 * f3));
  }
  
  public float dst2(float paramFloat1, float paramFloat2, float paramFloat3) {
    paramFloat1 -= this.x;
    paramFloat2 -= this.y;
    paramFloat3 -= this.z;
    return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3;
  }
  
  public float dst2(Vector3 paramVector3) {
    float f1 = paramVector3.x - this.x;
    float f2 = paramVector3.y - this.y;
    float f3 = paramVector3.z - this.z;
    return f1 * f1 + f2 * f2 + f3 * f3;
  }
  
  public boolean epsilonEquals(float paramFloat1, float paramFloat2, float paramFloat3) { return epsilonEquals(paramFloat1, paramFloat2, paramFloat3, 1.0E-6F); }
  
  public boolean epsilonEquals(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return (Math.abs(paramFloat1 - this.x) > paramFloat4) ? false : ((Math.abs(paramFloat2 - this.y) > paramFloat4) ? false : (!(Math.abs(paramFloat3 - this.z) > paramFloat4))); }
  
  public boolean epsilonEquals(Vector3 paramVector3) { return epsilonEquals(paramVector3, 1.0E-6F); }
  
  public boolean epsilonEquals(Vector3 paramVector3, float paramFloat) { return (paramVector3 == null) ? false : ((Math.abs(paramVector3.x - this.x) > paramFloat) ? false : ((Math.abs(paramVector3.y - this.y) > paramFloat) ? false : (!(Math.abs(paramVector3.z - this.z) > paramFloat)))); }
  
  public boolean equals(Object paramObject) {
    if (this == paramObject)
      return true; 
    if (paramObject == null)
      return false; 
    if (getClass() != paramObject.getClass())
      return false; 
    paramObject = (Vector3)paramObject;
    return (NumberUtils.floatToIntBits(this.x) != NumberUtils.floatToIntBits(paramObject.x)) ? false : ((NumberUtils.floatToIntBits(this.y) != NumberUtils.floatToIntBits(paramObject.y)) ? false : (!(NumberUtils.floatToIntBits(this.z) != NumberUtils.floatToIntBits(paramObject.z))));
  }
  
  public Vector3 fromString(String paramString) {
    int i = paramString.indexOf(',', 1);
    int j = i + 1;
    int k = paramString.indexOf(',', j);
    if (i != -1 && k != -1 && paramString.charAt(0) == '(' && paramString.charAt(paramString.length() - 1) == ')')
      try {
        return set(Float.parseFloat(paramString.substring(1, i)), Float.parseFloat(paramString.substring(j, k)), Float.parseFloat(paramString.substring(k + 1, paramString.length() - 1)));
      } catch (NumberFormatException numberFormatException) {} 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Malformed Vector3: ");
    stringBuilder.append(paramString);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public boolean hasOppositeDirection(Vector3 paramVector3) {
    boolean bool;
    if (dot(paramVector3) < 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasSameDirection(Vector3 paramVector3) {
    boolean bool;
    if (dot(paramVector3) > 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int hashCode() { return ((NumberUtils.floatToIntBits(this.x) + 31) * 31 + NumberUtils.floatToIntBits(this.y)) * 31 + NumberUtils.floatToIntBits(this.z); }
  
  public boolean idt(Vector3 paramVector3) {
    boolean bool;
    if (this.x == paramVector3.x && this.y == paramVector3.y && this.z == paramVector3.z) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Vector3 interpolate(Vector3 paramVector3, float paramFloat, Interpolation paramInterpolation) { return lerp(paramVector3, paramInterpolation.apply(0.0F, 1.0F, paramFloat)); }
  
  public boolean isCollinear(Vector3 paramVector3) {
    boolean bool;
    if (isOnLine(paramVector3) && hasSameDirection(paramVector3)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isCollinear(Vector3 paramVector3, float paramFloat) {
    boolean bool;
    if (isOnLine(paramVector3, paramFloat) && hasSameDirection(paramVector3)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isCollinearOpposite(Vector3 paramVector3) {
    boolean bool;
    if (isOnLine(paramVector3) && hasOppositeDirection(paramVector3)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isCollinearOpposite(Vector3 paramVector3, float paramFloat) {
    boolean bool;
    if (isOnLine(paramVector3, paramFloat) && hasOppositeDirection(paramVector3)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isOnLine(Vector3 paramVector3) {
    boolean bool;
    float f1 = this.y;
    float f2 = paramVector3.z;
    float f3 = this.z;
    float f4 = paramVector3.y;
    float f5 = paramVector3.x;
    float f6 = this.x;
    if (len2(f1 * f2 - f3 * f4, f3 * f5 - f2 * f6, f6 * f4 - f1 * f5) <= 1.0E-6F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isOnLine(Vector3 paramVector3, float paramFloat) {
    boolean bool;
    float f1 = this.y;
    float f2 = paramVector3.z;
    float f3 = this.z;
    float f4 = paramVector3.y;
    float f5 = paramVector3.x;
    float f6 = this.x;
    if (len2(f1 * f2 - f3 * f4, f3 * f5 - f2 * f6, f6 * f4 - f1 * f5) <= paramFloat) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isPerpendicular(Vector3 paramVector3) { return MathUtils.isZero(dot(paramVector3)); }
  
  public boolean isPerpendicular(Vector3 paramVector3, float paramFloat) { return MathUtils.isZero(dot(paramVector3), paramFloat); }
  
  public boolean isUnit() { return isUnit(1.0E-9F); }
  
  public boolean isUnit(float paramFloat) {
    boolean bool;
    if (Math.abs(len2() - 1.0F) < paramFloat) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isZero() {
    boolean bool;
    if (this.x == 0.0F && this.y == 0.0F && this.z == 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isZero(float paramFloat) {
    boolean bool;
    if (len2() < paramFloat) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public float len() {
    float f1 = this.x;
    float f2 = this.y;
    float f3 = this.z;
    return (float)Math.sqrt((f1 * f1 + f2 * f2 + f3 * f3));
  }
  
  public float len2() {
    float f1 = this.x;
    float f2 = this.y;
    float f3 = this.z;
    return f1 * f1 + f2 * f2 + f3 * f3;
  }
  
  public Vector3 lerp(Vector3 paramVector3, float paramFloat) {
    float f = this.x;
    this.x = f + (paramVector3.x - f) * paramFloat;
    f = this.y;
    this.y = f + (paramVector3.y - f) * paramFloat;
    f = this.z;
    this.z = f + paramFloat * (paramVector3.z - f);
    return this;
  }
  
  public Vector3 limit(float paramFloat) { return limit2(paramFloat * paramFloat); }
  
  public Vector3 limit2(float paramFloat) {
    float f = len2();
    if (f > paramFloat)
      scl((float)Math.sqrt((paramFloat / f))); 
    return this;
  }
  
  public Vector3 mul(Matrix3 paramMatrix3) {
    float[] arrayOfFloat = paramMatrix3.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[3];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[6] * f5, arrayOfFloat[1] * f1 + arrayOfFloat[4] * f3 + arrayOfFloat[7] * f5, f1 * arrayOfFloat[2] + f3 * arrayOfFloat[5] + f5 * arrayOfFloat[8]);
  }
  
  public Vector3 mul(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[4];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[8] * f5 + arrayOfFloat[12], arrayOfFloat[1] * f1 + arrayOfFloat[5] * f3 + arrayOfFloat[9] * f5 + arrayOfFloat[13], f1 * arrayOfFloat[2] + f3 * arrayOfFloat[6] + f5 * arrayOfFloat[10] + arrayOfFloat[14]);
  }
  
  public Vector3 mul(Quaternion paramQuaternion) { return paramQuaternion.transform(this); }
  
  public Vector3 mul4x3(float[] paramArrayOfFloat) {
    float f1 = this.x;
    float f2 = paramArrayOfFloat[0];
    float f3 = this.y;
    float f4 = paramArrayOfFloat[3];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + paramArrayOfFloat[6] * f5 + paramArrayOfFloat[9], paramArrayOfFloat[1] * f1 + paramArrayOfFloat[4] * f3 + paramArrayOfFloat[7] * f5 + paramArrayOfFloat[10], f1 * paramArrayOfFloat[2] + f3 * paramArrayOfFloat[5] + f5 * paramArrayOfFloat[8] + paramArrayOfFloat[11]);
  }
  
  public Vector3 mulAdd(Vector3 paramVector3, float paramFloat) {
    this.x += paramVector3.x * paramFloat;
    this.y += paramVector3.y * paramFloat;
    this.z += paramVector3.z * paramFloat;
    return this;
  }
  
  public Vector3 mulAdd(Vector3 paramVector31, Vector3 paramVector32) {
    this.x += paramVector31.x * paramVector32.x;
    this.y += paramVector31.y * paramVector32.y;
    this.z += paramVector31.z * paramVector32.z;
    return this;
  }
  
  public Vector3 nor() {
    float f = len2();
    return (f == 0.0F || f == 1.0F) ? this : scl(1.0F / (float)Math.sqrt(f));
  }
  
  public Vector3 prj(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[3];
    float f3 = this.y;
    float f4 = arrayOfFloat[7];
    float f5 = this.z;
    f2 = 1.0F / (f2 * f1 + f4 * f3 + arrayOfFloat[11] * f5 + arrayOfFloat[15]);
    return set((arrayOfFloat[0] * f1 + arrayOfFloat[4] * f3 + arrayOfFloat[8] * f5 + arrayOfFloat[12]) * f2, (arrayOfFloat[1] * f1 + arrayOfFloat[5] * f3 + arrayOfFloat[9] * f5 + arrayOfFloat[13]) * f2, (f1 * arrayOfFloat[2] + f3 * arrayOfFloat[6] + f5 * arrayOfFloat[10] + arrayOfFloat[14]) * f2);
  }
  
  public Vector3 rot(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[4];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[8] * f5, arrayOfFloat[1] * f1 + arrayOfFloat[5] * f3 + arrayOfFloat[9] * f5, f1 * arrayOfFloat[2] + f3 * arrayOfFloat[6] + f5 * arrayOfFloat[10]);
  }
  
  public Vector3 rotate(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return mul(tmpMat.setToRotation(paramFloat2, paramFloat3, paramFloat4, paramFloat1)); }
  
  public Vector3 rotate(Vector3 paramVector3, float paramFloat) {
    tmpMat.setToRotation(paramVector3, paramFloat);
    return mul(tmpMat);
  }
  
  public Vector3 rotateRad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return mul(tmpMat.setToRotationRad(paramFloat2, paramFloat3, paramFloat4, paramFloat1)); }
  
  public Vector3 rotateRad(Vector3 paramVector3, float paramFloat) {
    tmpMat.setToRotationRad(paramVector3, paramFloat);
    return mul(tmpMat);
  }
  
  public Vector3 scl(float paramFloat) { return set(this.x * paramFloat, this.y * paramFloat, this.z * paramFloat); }
  
  public Vector3 scl(float paramFloat1, float paramFloat2, float paramFloat3) { return set(this.x * paramFloat1, this.y * paramFloat2, this.z * paramFloat3); }
  
  public Vector3 scl(Vector3 paramVector3) { return set(this.x * paramVector3.x, this.y * paramVector3.y, this.z * paramVector3.z); }
  
  public Vector3 set(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.z = paramFloat3;
    return this;
  }
  
  public Vector3 set(Vector2 paramVector2, float paramFloat) { return set(paramVector2.x, paramVector2.y, paramFloat); }
  
  public Vector3 set(Vector3 paramVector3) { return set(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public Vector3 set(float[] paramArrayOfFloat) { return set(paramArrayOfFloat[0], paramArrayOfFloat[1], paramArrayOfFloat[2]); }
  
  public Vector3 setFromSpherical(float paramFloat1, float paramFloat2) {
    float f = MathUtils.cos(paramFloat2);
    paramFloat2 = MathUtils.sin(paramFloat2);
    return set(MathUtils.cos(paramFloat1) * paramFloat2, MathUtils.sin(paramFloat1) * paramFloat2, f);
  }
  
  public Vector3 setLength(float paramFloat) { return setLength2(paramFloat * paramFloat); }
  
  public Vector3 setLength2(float paramFloat) {
    float f = len2();
    return (f == 0.0F || f == paramFloat) ? this : scl((float)Math.sqrt((paramFloat / f)));
  }
  
  public Vector3 setToRandomDirection() { return setFromSpherical(MathUtils.random() * 6.2831855F, (float)Math.acos((MathUtils.random() * 2.0F - 1.0F))); }
  
  public Vector3 setZero() {
    this.x = 0.0F;
    this.y = 0.0F;
    this.z = 0.0F;
    return this;
  }
  
  public Vector3 slerp(Vector3 paramVector3, float paramFloat) {
    float f1 = dot(paramVector3);
    double d = f1;
    if (d > 0.9995D || d < -0.9995D)
      return lerp(paramVector3, paramFloat); 
    d = ((float)Math.acos(d) * paramFloat);
    float f2 = (float)Math.sin(d);
    float f3 = paramVector3.x - this.x * f1;
    float f4 = paramVector3.y - this.y * f1;
    f1 = paramVector3.z - this.z * f1;
    float f5 = f3 * f3 + f4 * f4 + f1 * f1;
    paramFloat = 1.0F;
    if (f5 >= 1.0E-4F)
      paramFloat = 1.0F / (float)Math.sqrt(f5); 
    paramFloat = f2 * paramFloat;
    return scl((float)Math.cos(d)).add(f3 * paramFloat, f4 * paramFloat, f1 * paramFloat).nor();
  }
  
  public Vector3 sub(float paramFloat) { return set(this.x - paramFloat, this.y - paramFloat, this.z - paramFloat); }
  
  public Vector3 sub(float paramFloat1, float paramFloat2, float paramFloat3) { return set(this.x - paramFloat1, this.y - paramFloat2, this.z - paramFloat3); }
  
  public Vector3 sub(Vector3 paramVector3) { return sub(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("(");
    stringBuilder.append(this.x);
    stringBuilder.append(",");
    stringBuilder.append(this.y);
    stringBuilder.append(",");
    stringBuilder.append(this.z);
    stringBuilder.append(")");
    return stringBuilder.toString();
  }
  
  public Vector3 traMul(Matrix3 paramMatrix3) {
    float[] arrayOfFloat = paramMatrix3.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[1];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[2] * f5, arrayOfFloat[3] * f1 + arrayOfFloat[4] * f3 + arrayOfFloat[5] * f5, f1 * arrayOfFloat[6] + f3 * arrayOfFloat[7] + f5 * arrayOfFloat[8]);
  }
  
  public Vector3 traMul(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[1];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[2] * f5 + arrayOfFloat[3], arrayOfFloat[4] * f1 + arrayOfFloat[5] * f3 + arrayOfFloat[6] * f5 + arrayOfFloat[7], f1 * arrayOfFloat[8] + f3 * arrayOfFloat[9] + f5 * arrayOfFloat[10] + arrayOfFloat[11]);
  }
  
  public Vector3 unrotate(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[1];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[2] * f5, arrayOfFloat[4] * f1 + arrayOfFloat[5] * f3 + arrayOfFloat[6] * f5, f1 * arrayOfFloat[8] + f3 * arrayOfFloat[9] + f5 * arrayOfFloat[10]);
  }
  
  public Vector3 untransform(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    this.x -= arrayOfFloat[12];
    this.y -= arrayOfFloat[12];
    this.z -= arrayOfFloat[12];
    float f1 = this.x;
    float f2 = arrayOfFloat[0];
    float f3 = this.y;
    float f4 = arrayOfFloat[1];
    float f5 = this.z;
    return set(f2 * f1 + f4 * f3 + arrayOfFloat[2] * f5, arrayOfFloat[4] * f1 + arrayOfFloat[5] * f3 + arrayOfFloat[6] * f5, f1 * arrayOfFloat[8] + f3 * arrayOfFloat[9] + f5 * arrayOfFloat[10]);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Vector3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */