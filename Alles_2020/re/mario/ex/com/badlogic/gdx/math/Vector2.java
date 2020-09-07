package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Vector2 extends Object implements Serializable, Vector<Vector2> {
  public static final Vector2 X = new Vector2(1.0F, 0.0F);
  
  public static final Vector2 Y = new Vector2(0.0F, 1.0F);
  
  public static final Vector2 Zero = new Vector2(0.0F, 0.0F);
  
  private static final long serialVersionUID = 913902788239530931L;
  
  public float x;
  
  public float y;
  
  public Vector2() {}
  
  public Vector2(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
  }
  
  public Vector2(Vector2 paramVector2) { set(paramVector2); }
  
  public static float dot(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return paramFloat1 * paramFloat3 + paramFloat2 * paramFloat4; }
  
  public static float dst(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    paramFloat1 = paramFloat3 - paramFloat1;
    paramFloat2 = paramFloat4 - paramFloat2;
    return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2));
  }
  
  public static float dst2(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    paramFloat1 = paramFloat3 - paramFloat1;
    paramFloat2 = paramFloat4 - paramFloat2;
    return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2;
  }
  
  public static float len(float paramFloat1, float paramFloat2) { return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2)); }
  
  public static float len2(float paramFloat1, float paramFloat2) { return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2; }
  
  public Vector2 add(float paramFloat1, float paramFloat2) {
    this.x += paramFloat1;
    this.y += paramFloat2;
    return this;
  }
  
  public Vector2 add(Vector2 paramVector2) {
    this.x += paramVector2.x;
    this.y += paramVector2.y;
    return this;
  }
  
  public float angle() {
    float f1 = (float)Math.atan2(this.y, this.x) * 57.295776F;
    float f2 = f1;
    if (f1 < 0.0F)
      f2 = f1 + 360.0F; 
    return f2;
  }
  
  public float angle(Vector2 paramVector2) { return (float)Math.atan2(crs(paramVector2), dot(paramVector2)) * 57.295776F; }
  
  public float angleRad() { return (float)Math.atan2(this.y, this.x); }
  
  public float angleRad(Vector2 paramVector2) { return (float)Math.atan2(crs(paramVector2), dot(paramVector2)); }
  
  public Vector2 clamp(float paramFloat1, float paramFloat2) {
    float f = len2();
    if (f == 0.0F)
      return this; 
    paramFloat2 *= paramFloat2;
    if (f > paramFloat2)
      return scl((float)Math.sqrt((paramFloat2 / f))); 
    paramFloat1 *= paramFloat1;
    return (f < paramFloat1) ? scl((float)Math.sqrt((paramFloat1 / f))) : this;
  }
  
  public Vector2 cpy() { return new Vector2(this); }
  
  public float crs(float paramFloat1, float paramFloat2) { return this.x * paramFloat2 - this.y * paramFloat1; }
  
  public float crs(Vector2 paramVector2) { return this.x * paramVector2.y - this.y * paramVector2.x; }
  
  public float dot(float paramFloat1, float paramFloat2) { return this.x * paramFloat1 + this.y * paramFloat2; }
  
  public float dot(Vector2 paramVector2) { return this.x * paramVector2.x + this.y * paramVector2.y; }
  
  public float dst(float paramFloat1, float paramFloat2) {
    paramFloat1 -= this.x;
    paramFloat2 -= this.y;
    return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2));
  }
  
  public float dst(Vector2 paramVector2) {
    float f1 = paramVector2.x - this.x;
    float f2 = paramVector2.y - this.y;
    return (float)Math.sqrt((f1 * f1 + f2 * f2));
  }
  
  public float dst2(float paramFloat1, float paramFloat2) {
    paramFloat1 -= this.x;
    paramFloat2 -= this.y;
    return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2;
  }
  
  public float dst2(Vector2 paramVector2) {
    float f1 = paramVector2.x - this.x;
    float f2 = paramVector2.y - this.y;
    return f1 * f1 + f2 * f2;
  }
  
  public boolean epsilonEquals(float paramFloat1, float paramFloat2) { return epsilonEquals(paramFloat1, paramFloat2, 1.0E-6F); }
  
  public boolean epsilonEquals(float paramFloat1, float paramFloat2, float paramFloat3) { return (Math.abs(paramFloat1 - this.x) > paramFloat3) ? false : (!(Math.abs(paramFloat2 - this.y) > paramFloat3)); }
  
  public boolean epsilonEquals(Vector2 paramVector2) { return epsilonEquals(paramVector2, 1.0E-6F); }
  
  public boolean epsilonEquals(Vector2 paramVector2, float paramFloat) { return (paramVector2 == null) ? false : ((Math.abs(paramVector2.x - this.x) > paramFloat) ? false : (!(Math.abs(paramVector2.y - this.y) > paramFloat))); }
  
  public boolean equals(Object paramObject) {
    if (this == paramObject)
      return true; 
    if (paramObject == null)
      return false; 
    if (getClass() != paramObject.getClass())
      return false; 
    paramObject = (Vector2)paramObject;
    return (NumberUtils.floatToIntBits(this.x) != NumberUtils.floatToIntBits(paramObject.x)) ? false : (!(NumberUtils.floatToIntBits(this.y) != NumberUtils.floatToIntBits(paramObject.y)));
  }
  
  public Vector2 fromString(String paramString) {
    int i = paramString.indexOf(',', 1);
    if (i != -1 && paramString.charAt(0) == '(' && paramString.charAt(paramString.length() - 1) == ')')
      try {
        return set(Float.parseFloat(paramString.substring(1, i)), Float.parseFloat(paramString.substring(i + 1, paramString.length() - 1)));
      } catch (NumberFormatException numberFormatException) {} 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Malformed Vector2: ");
    stringBuilder.append(paramString);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public boolean hasOppositeDirection(Vector2 paramVector2) {
    boolean bool;
    if (dot(paramVector2) < 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasSameDirection(Vector2 paramVector2) {
    boolean bool;
    if (dot(paramVector2) > 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int hashCode() { return (NumberUtils.floatToIntBits(this.x) + 31) * 31 + NumberUtils.floatToIntBits(this.y); }
  
  public Vector2 interpolate(Vector2 paramVector2, float paramFloat, Interpolation paramInterpolation) { return lerp(paramVector2, paramInterpolation.apply(paramFloat)); }
  
  public boolean isCollinear(Vector2 paramVector2) {
    boolean bool;
    if (isOnLine(paramVector2) && dot(paramVector2) > 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isCollinear(Vector2 paramVector2, float paramFloat) {
    boolean bool;
    if (isOnLine(paramVector2, paramFloat) && dot(paramVector2) > 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isCollinearOpposite(Vector2 paramVector2) {
    boolean bool;
    if (isOnLine(paramVector2) && dot(paramVector2) < 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isCollinearOpposite(Vector2 paramVector2, float paramFloat) {
    boolean bool;
    if (isOnLine(paramVector2, paramFloat) && dot(paramVector2) < 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isOnLine(Vector2 paramVector2) { return MathUtils.isZero(this.x * paramVector2.y - this.y * paramVector2.x); }
  
  public boolean isOnLine(Vector2 paramVector2, float paramFloat) { return MathUtils.isZero(this.x * paramVector2.y - this.y * paramVector2.x, paramFloat); }
  
  public boolean isPerpendicular(Vector2 paramVector2) { return MathUtils.isZero(dot(paramVector2)); }
  
  public boolean isPerpendicular(Vector2 paramVector2, float paramFloat) { return MathUtils.isZero(dot(paramVector2), paramFloat); }
  
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
    if (this.x == 0.0F && this.y == 0.0F) {
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
    return (float)Math.sqrt((f1 * f1 + f2 * f2));
  }
  
  public float len2() {
    float f1 = this.x;
    float f2 = this.y;
    return f1 * f1 + f2 * f2;
  }
  
  public Vector2 lerp(Vector2 paramVector2, float paramFloat) {
    float f = 1.0F - paramFloat;
    this.x = this.x * f + paramVector2.x * paramFloat;
    this.y = this.y * f + paramVector2.y * paramFloat;
    return this;
  }
  
  public Vector2 limit(float paramFloat) { return limit2(paramFloat * paramFloat); }
  
  public Vector2 limit2(float paramFloat) {
    float f = len2();
    return (f > paramFloat) ? scl((float)Math.sqrt((paramFloat / f))) : this;
  }
  
  public Vector2 mul(Matrix3 paramMatrix3) {
    float f1 = this.x;
    float f2 = paramMatrix3.val[0];
    float f3 = this.y;
    float f4 = paramMatrix3.val[3];
    float f5 = paramMatrix3.val[6];
    float f6 = this.x;
    float f7 = paramMatrix3.val[1];
    float f8 = this.y;
    float f9 = paramMatrix3.val[4];
    float f10 = paramMatrix3.val[7];
    this.x = f1 * f2 + f3 * f4 + f5;
    this.y = f6 * f7 + f8 * f9 + f10;
    return this;
  }
  
  public Vector2 mulAdd(Vector2 paramVector2, float paramFloat) {
    this.x += paramVector2.x * paramFloat;
    this.y += paramVector2.y * paramFloat;
    return this;
  }
  
  public Vector2 mulAdd(Vector2 paramVector21, Vector2 paramVector22) {
    this.x += paramVector21.x * paramVector22.x;
    this.y += paramVector21.y * paramVector22.y;
    return this;
  }
  
  public Vector2 nor() {
    float f = len();
    if (f != 0.0F) {
      this.x /= f;
      this.y /= f;
    } 
    return this;
  }
  
  public Vector2 rotate(float paramFloat) { return rotateRad(paramFloat * 0.017453292F); }
  
  public Vector2 rotate90(int paramInt) {
    float f = this.x;
    if (paramInt >= 0) {
      this.x = -this.y;
      this.y = f;
    } else {
      this.x = this.y;
      this.y = -f;
    } 
    return this;
  }
  
  public Vector2 rotateAround(Vector2 paramVector2, float paramFloat) { return sub(paramVector2).rotate(paramFloat).add(paramVector2); }
  
  public Vector2 rotateAroundRad(Vector2 paramVector2, float paramFloat) { return sub(paramVector2).rotateRad(paramFloat).add(paramVector2); }
  
  public Vector2 rotateRad(float paramFloat) {
    double d = paramFloat;
    float f1 = (float)Math.cos(d);
    float f2 = (float)Math.sin(d);
    paramFloat = this.x;
    float f3 = this.y;
    this.x = paramFloat * f1 - f3 * f2;
    this.y = paramFloat * f2 + f3 * f1;
    return this;
  }
  
  public Vector2 scl(float paramFloat) {
    this.x *= paramFloat;
    this.y *= paramFloat;
    return this;
  }
  
  public Vector2 scl(float paramFloat1, float paramFloat2) {
    this.x *= paramFloat1;
    this.y *= paramFloat2;
    return this;
  }
  
  public Vector2 scl(Vector2 paramVector2) {
    this.x *= paramVector2.x;
    this.y *= paramVector2.y;
    return this;
  }
  
  public Vector2 set(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    return this;
  }
  
  public Vector2 set(Vector2 paramVector2) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    return this;
  }
  
  public Vector2 setAngle(float paramFloat) { return setAngleRad(paramFloat * 0.017453292F); }
  
  public Vector2 setAngleRad(float paramFloat) {
    set(len(), 0.0F);
    rotateRad(paramFloat);
    return this;
  }
  
  public Vector2 setLength(float paramFloat) { return setLength2(paramFloat * paramFloat); }
  
  public Vector2 setLength2(float paramFloat) {
    float f = len2();
    return (f == 0.0F || f == paramFloat) ? this : scl((float)Math.sqrt((paramFloat / f)));
  }
  
  public Vector2 setToRandomDirection() {
    float f = MathUtils.random(0.0F, 6.2831855F);
    return set(MathUtils.cos(f), MathUtils.sin(f));
  }
  
  public Vector2 setZero() {
    this.x = 0.0F;
    this.y = 0.0F;
    return this;
  }
  
  public Vector2 sub(float paramFloat1, float paramFloat2) {
    this.x -= paramFloat1;
    this.y -= paramFloat2;
    return this;
  }
  
  public Vector2 sub(Vector2 paramVector2) {
    this.x -= paramVector2.x;
    this.y -= paramVector2.y;
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("(");
    stringBuilder.append(this.x);
    stringBuilder.append(",");
    stringBuilder.append(this.y);
    stringBuilder.append(")");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Vector2.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */