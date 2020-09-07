package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Quaternion implements Serializable {
  private static final long serialVersionUID = -7661875440774897168L;
  
  private static Quaternion tmp1 = new Quaternion(0.0F, 0.0F, 0.0F, 0.0F);
  
  private static Quaternion tmp2 = new Quaternion(0.0F, 0.0F, 0.0F, 0.0F);
  
  public float w;
  
  public float x;
  
  public float y;
  
  public float z;
  
  public Quaternion() { idt(); }
  
  public Quaternion(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { set(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public Quaternion(Quaternion paramQuaternion) { set(paramQuaternion); }
  
  public Quaternion(Vector3 paramVector3, float paramFloat) { set(paramVector3, paramFloat); }
  
  public static final float dot(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) { return paramFloat1 * paramFloat5 + paramFloat2 * paramFloat6 + paramFloat3 * paramFloat7 + paramFloat4 * paramFloat8; }
  
  public static final float len(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3 + paramFloat4 * paramFloat4)); }
  
  public static final float len2(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 + paramFloat3 * paramFloat3 + paramFloat4 * paramFloat4; }
  
  public Quaternion add(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x += paramFloat1;
    this.y += paramFloat2;
    this.z += paramFloat3;
    this.w += paramFloat4;
    return this;
  }
  
  public Quaternion add(Quaternion paramQuaternion) {
    this.x += paramQuaternion.x;
    this.y += paramQuaternion.y;
    this.z += paramQuaternion.z;
    this.w += paramQuaternion.w;
    return this;
  }
  
  public Quaternion conjugate() {
    this.x = -this.x;
    this.y = -this.y;
    this.z = -this.z;
    return this;
  }
  
  public Quaternion cpy() { return new Quaternion(this); }
  
  public float dot(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return this.x * paramFloat1 + this.y * paramFloat2 + this.z * paramFloat3 + this.w * paramFloat4; }
  
  public float dot(Quaternion paramQuaternion) { return this.x * paramQuaternion.x + this.y * paramQuaternion.y + this.z * paramQuaternion.z + this.w * paramQuaternion.w; }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (this == paramObject)
      return true; 
    if (paramObject == null)
      return false; 
    if (!(paramObject instanceof Quaternion))
      return false; 
    paramObject = (Quaternion)paramObject;
    if (NumberUtils.floatToRawIntBits(this.w) != NumberUtils.floatToRawIntBits(paramObject.w) || NumberUtils.floatToRawIntBits(this.x) != NumberUtils.floatToRawIntBits(paramObject.x) || NumberUtils.floatToRawIntBits(this.y) != NumberUtils.floatToRawIntBits(paramObject.y) || NumberUtils.floatToRawIntBits(this.z) != NumberUtils.floatToRawIntBits(paramObject.z))
      bool = false; 
    return bool;
  }
  
  public Quaternion exp(float paramFloat) {
    float f1 = len();
    double d1 = f1;
    float f2 = (float)Math.pow(d1, paramFloat);
    float f3 = (float)Math.acos((this.w / f1));
    if (Math.abs(f3) < 0.001D) {
      f1 = f2 * paramFloat / f1;
    } else {
      double d3 = f2;
      double d4 = Math.sin((paramFloat * f3));
      Double.isNaN(d3);
      double d5 = Math.sin(f3);
      Double.isNaN(d1);
      f1 = (float)(d3 * d4 / d1 * d5);
    } 
    double d2 = f2;
    d1 = Math.cos((paramFloat * f3));
    Double.isNaN(d2);
    this.w = (float)(d2 * d1);
    this.x *= f1;
    this.y *= f1;
    this.z *= f1;
    nor();
    return this;
  }
  
  public float getAngle() { return getAngleRad() * 57.295776F; }
  
  public float getAngleAround(float paramFloat1, float paramFloat2, float paramFloat3) { return getAngleAroundRad(paramFloat1, paramFloat2, paramFloat3) * 57.295776F; }
  
  public float getAngleAround(Vector3 paramVector3) { return getAngleAround(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public float getAngleAroundRad(float paramFloat1, float paramFloat2, float paramFloat3) {
    float f = Vector3.dot(this.x, this.y, this.z, paramFloat1, paramFloat2, paramFloat3);
    paramFloat2 = len2(paramFloat1 * f, paramFloat2 * f, paramFloat3 * f, this.w);
    boolean bool = MathUtils.isZero(paramFloat2);
    paramFloat1 = 0.0F;
    if (!bool) {
      if (f < 0.0F) {
        paramFloat1 = -this.w;
      } else {
        paramFloat1 = this.w;
      } 
      double d1 = paramFloat1;
      double d2 = Math.sqrt(paramFloat2);
      Double.isNaN(d1);
      paramFloat1 = (float)(Math.acos(MathUtils.clamp((float)(d1 / d2), -1.0F, 1.0F)) * 2.0D);
    } 
    return paramFloat1;
  }
  
  public float getAngleAroundRad(Vector3 paramVector3) { return getAngleAroundRad(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public float getAngleRad() {
    float f1 = this.w;
    float f2 = f1;
    if (f1 > 1.0F)
      f2 = f1 / len(); 
    return (float)(Math.acos(f2) * 2.0D);
  }
  
  public float getAxisAngle(Vector3 paramVector3) { return getAxisAngleRad(paramVector3) * 57.295776F; }
  
  public float getAxisAngleRad(Vector3 paramVector3) {
    if (this.w > 1.0F)
      nor(); 
    float f1 = (float)(Math.acos(this.w) * 2.0D);
    float f2 = this.w;
    double d = Math.sqrt((1.0F - f2 * f2));
    if (d < 9.999999974752427E-7D) {
      paramVector3.x = this.x;
      paramVector3.y = this.y;
      paramVector3.z = this.z;
    } else {
      double d1 = this.x;
      Double.isNaN(d1);
      paramVector3.x = (float)(d1 / d);
      d1 = this.y;
      Double.isNaN(d1);
      paramVector3.y = (float)(d1 / d);
      d1 = this.z;
      Double.isNaN(d1);
      paramVector3.z = (float)(d1 / d);
    } 
    return f1;
  }
  
  public int getGimbalPole() {
    byte b;
    float f = this.y * this.x + this.z * this.w;
    if (f > 0.499F) {
      b = 1;
    } else if (f < -0.499F) {
      b = -1;
    } else {
      b = 0;
    } 
    return b;
  }
  
  public float getPitch() { return getPitchRad() * 57.295776F; }
  
  public float getPitchRad() {
    float f;
    int i = getGimbalPole();
    if (i == 0) {
      f = (float)Math.asin(MathUtils.clamp((this.w * this.x - this.z * this.y) * 2.0F, -1.0F, 1.0F));
    } else {
      f = i * 3.1415927F * 0.5F;
    } 
    return f;
  }
  
  public float getRoll() { return getRollRad() * 57.295776F; }
  
  public float getRollRad() {
    float f;
    int i = getGimbalPole();
    if (i == 0) {
      float f1 = this.w;
      float f2 = this.z;
      f = this.y;
      float f3 = this.x;
      f = MathUtils.atan2((f1 * f2 + f * f3) * 2.0F, 1.0F - (f3 * f3 + f2 * f2) * 2.0F);
    } else {
      f = i * 2.0F * MathUtils.atan2(this.y, this.w);
    } 
    return f;
  }
  
  public void getSwingTwist(float paramFloat1, float paramFloat2, float paramFloat3, Quaternion paramQuaternion1, Quaternion paramQuaternion2) {
    float f = Vector3.dot(this.x, this.y, this.z, paramFloat1, paramFloat2, paramFloat3);
    paramQuaternion2.set(paramFloat1 * f, paramFloat2 * f, paramFloat3 * f, this.w).nor();
    if (f < 0.0F)
      paramQuaternion2.mul(-1.0F); 
    paramQuaternion1.set(paramQuaternion2).conjugate().mulLeft(this);
  }
  
  public void getSwingTwist(Vector3 paramVector3, Quaternion paramQuaternion1, Quaternion paramQuaternion2) { getSwingTwist(paramVector3.x, paramVector3.y, paramVector3.z, paramQuaternion1, paramQuaternion2); }
  
  public float getYaw() { return getYawRad() * 57.295776F; }
  
  public float getYawRad() {
    float f;
    if (getGimbalPole() == 0) {
      float f1 = this.y;
      f = this.w;
      float f2 = this.x;
      f = MathUtils.atan2((f * f1 + this.z * f2) * 2.0F, 1.0F - (f1 * f1 + f2 * f2) * 2.0F);
    } else {
      f = 0.0F;
    } 
    return f;
  }
  
  public int hashCode() { return (((NumberUtils.floatToRawIntBits(this.w) + 31) * 31 + NumberUtils.floatToRawIntBits(this.x)) * 31 + NumberUtils.floatToRawIntBits(this.y)) * 31 + NumberUtils.floatToRawIntBits(this.z); }
  
  public Quaternion idt() { return set(0.0F, 0.0F, 0.0F, 1.0F); }
  
  public boolean isIdentity() {
    boolean bool;
    if (MathUtils.isZero(this.x) && MathUtils.isZero(this.y) && MathUtils.isZero(this.z) && MathUtils.isEqual(this.w, 1.0F)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isIdentity(float paramFloat) {
    boolean bool;
    if (MathUtils.isZero(this.x, paramFloat) && MathUtils.isZero(this.y, paramFloat) && MathUtils.isZero(this.z, paramFloat) && MathUtils.isEqual(this.w, 1.0F, paramFloat)) {
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
    float f4 = this.w;
    return (float)Math.sqrt((f1 * f1 + f2 * f2 + f3 * f3 + f4 * f4));
  }
  
  public float len2() {
    float f1 = this.x;
    float f2 = this.y;
    float f3 = this.z;
    float f4 = this.w;
    return f1 * f1 + f2 * f2 + f3 * f3 + f4 * f4;
  }
  
  public Quaternion mul(float paramFloat) {
    this.x *= paramFloat;
    this.y *= paramFloat;
    this.z *= paramFloat;
    this.w *= paramFloat;
    return this;
  }
  
  public Quaternion mul(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    float f1 = this.w;
    float f2 = this.x;
    float f3 = this.y;
    float f4 = this.z;
    this.x = f1 * paramFloat1 + f2 * paramFloat4 + f3 * paramFloat3 - f4 * paramFloat2;
    this.y = f1 * paramFloat2 + f3 * paramFloat4 + f4 * paramFloat1 - f2 * paramFloat3;
    this.z = f1 * paramFloat3 + f4 * paramFloat4 + f2 * paramFloat2 - f3 * paramFloat1;
    this.w = f1 * paramFloat4 - f2 * paramFloat1 - f3 * paramFloat2 - f4 * paramFloat3;
    return this;
  }
  
  public Quaternion mul(Quaternion paramQuaternion) {
    float f1 = this.w;
    float f2 = paramQuaternion.x;
    float f3 = this.x;
    float f4 = paramQuaternion.w;
    float f5 = this.y;
    float f6 = paramQuaternion.z;
    float f7 = this.z;
    float f8 = paramQuaternion.y;
    this.x = f1 * f2 + f3 * f4 + f5 * f6 - f7 * f8;
    this.y = f1 * f8 + f5 * f4 + f7 * f2 - f3 * f6;
    this.z = f1 * f6 + f7 * f4 + f3 * f8 - f5 * f2;
    this.w = f1 * f4 - f3 * f2 - f5 * f8 - f7 * f6;
    return this;
  }
  
  public Quaternion mulLeft(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    float f1 = this.x;
    float f2 = this.w;
    float f3 = this.z;
    float f4 = this.y;
    this.x = paramFloat4 * f1 + paramFloat1 * f2 + paramFloat2 * f3 - paramFloat3 * f4;
    this.y = paramFloat4 * f4 + paramFloat2 * f2 + paramFloat3 * f1 - paramFloat1 * f3;
    this.z = paramFloat4 * f3 + paramFloat3 * f2 + paramFloat1 * f4 - paramFloat2 * f1;
    this.w = paramFloat4 * f2 - paramFloat1 * f1 - paramFloat2 * f4 - paramFloat3 * f3;
    return this;
  }
  
  public Quaternion mulLeft(Quaternion paramQuaternion) {
    float f1 = paramQuaternion.w;
    float f2 = this.x;
    float f3 = paramQuaternion.x;
    float f4 = this.w;
    float f5 = paramQuaternion.y;
    float f6 = this.z;
    float f7 = paramQuaternion.z;
    float f8 = this.y;
    this.x = f1 * f2 + f3 * f4 + f5 * f6 - f7 * f8;
    this.y = f1 * f8 + f5 * f4 + f7 * f2 - f3 * f6;
    this.z = f1 * f6 + f7 * f4 + f3 * f8 - f5 * f2;
    this.w = f1 * f4 - f3 * f2 - f5 * f8 - f7 * f6;
    return this;
  }
  
  public Quaternion nor() {
    float f = len2();
    if (f != 0.0F && !MathUtils.isEqual(f, 1.0F)) {
      f = (float)Math.sqrt(f);
      this.w /= f;
      this.x /= f;
      this.y /= f;
      this.z /= f;
    } 
    return this;
  }
  
  public Quaternion set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.z = paramFloat3;
    this.w = paramFloat4;
    return this;
  }
  
  public Quaternion set(Quaternion paramQuaternion) { return set(paramQuaternion.x, paramQuaternion.y, paramQuaternion.z, paramQuaternion.w); }
  
  public Quaternion set(Vector3 paramVector3, float paramFloat) { return setFromAxis(paramVector3.x, paramVector3.y, paramVector3.z, paramFloat); }
  
  public Quaternion setEulerAngles(float paramFloat1, float paramFloat2, float paramFloat3) { return setEulerAnglesRad(paramFloat1 * 0.017453292F, paramFloat2 * 0.017453292F, paramFloat3 * 0.017453292F); }
  
  public Quaternion setEulerAnglesRad(float paramFloat1, float paramFloat2, float paramFloat3) {
    double d = (paramFloat3 * 0.5F);
    float f1 = (float)Math.sin(d);
    paramFloat3 = (float)Math.cos(d);
    d = (paramFloat2 * 0.5F);
    paramFloat2 = (float)Math.sin(d);
    float f2 = (float)Math.cos(d);
    d = (paramFloat1 * 0.5F);
    float f3 = (float)Math.sin(d);
    float f4 = (float)Math.cos(d);
    paramFloat1 = f4 * paramFloat2;
    float f5 = f3 * f2;
    f2 = f4 * f2;
    paramFloat2 = f3 * paramFloat2;
    this.x = paramFloat1 * paramFloat3 + f5 * f1;
    this.y = f5 * paramFloat3 - paramFloat1 * f1;
    this.z = f2 * f1 - paramFloat2 * paramFloat3;
    this.w = f2 * paramFloat3 + paramFloat2 * f1;
    return this;
  }
  
  public Quaternion setFromAxes(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { return setFromAxes(false, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9); }
  
  public Quaternion setFromAxes(boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    float f1 = paramFloat1;
    float f2 = paramFloat2;
    float f3 = paramFloat3;
    float f4 = paramFloat4;
    float f5 = paramFloat5;
    float f6 = paramFloat6;
    float f7 = paramFloat7;
    float f8 = paramFloat8;
    float f9 = paramFloat9;
    if (paramBoolean) {
      f7 = 1.0F / Vector3.len(paramFloat1, paramFloat2, paramFloat3);
      f8 = 1.0F / Vector3.len(paramFloat4, paramFloat5, paramFloat6);
      f9 = 1.0F / Vector3.len(paramFloat7, paramFloat8, paramFloat9);
      f1 = paramFloat1 * f7;
      f2 = paramFloat2 * f7;
      f3 = paramFloat3 * f7;
      f4 = paramFloat4 * f8;
      f5 = paramFloat5 * f8;
      f6 = paramFloat6 * f8;
      f7 = paramFloat7 * f9;
      f8 = paramFloat8 * f9;
      f9 = paramFloat9 * f9;
    } 
    paramFloat1 = f1 + f5 + f9;
    if (paramFloat1 >= 0.0F) {
      paramFloat1 = (float)Math.sqrt((paramFloat1 + 1.0F));
      this.w = paramFloat1 * 0.5F;
      paramFloat1 = 0.5F / paramFloat1;
      this.x = (f8 - f6) * paramFloat1;
      this.y = (f3 - f7) * paramFloat1;
      this.z = (f4 - f2) * paramFloat1;
    } else if (f1 > f5 && f1 > f9) {
      double d1 = f1;
      Double.isNaN(d1);
      double d2 = f5;
      Double.isNaN(d2);
      double d3 = f9;
      Double.isNaN(d3);
      paramFloat1 = (float)Math.sqrt(d1 + 1.0D - d2 - d3);
      this.x = paramFloat1 * 0.5F;
      paramFloat1 = 0.5F / paramFloat1;
      this.y = (f4 + f2) * paramFloat1;
      this.z = (f3 + f7) * paramFloat1;
      this.w = (f8 - f6) * paramFloat1;
    } else if (f5 > f9) {
      double d3 = f5;
      Double.isNaN(d3);
      double d2 = f1;
      Double.isNaN(d2);
      double d1 = f9;
      Double.isNaN(d1);
      paramFloat1 = (float)Math.sqrt(d3 + 1.0D - d2 - d1);
      this.y = paramFloat1 * 0.5F;
      paramFloat1 = 0.5F / paramFloat1;
      this.x = (f4 + f2) * paramFloat1;
      this.z = (f8 + f6) * paramFloat1;
      this.w = (f3 - f7) * paramFloat1;
    } else {
      double d2 = f9;
      Double.isNaN(d2);
      double d3 = f1;
      Double.isNaN(d3);
      double d1 = f5;
      Double.isNaN(d1);
      paramFloat1 = (float)Math.sqrt(d2 + 1.0D - d3 - d1);
      this.z = paramFloat1 * 0.5F;
      paramFloat1 = 0.5F / paramFloat1;
      this.x = (f3 + f7) * paramFloat1;
      this.y = (f8 + f6) * paramFloat1;
      this.w = (f4 - f2) * paramFloat1;
    } 
    return this;
  }
  
  public Quaternion setFromAxis(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return setFromAxisRad(paramFloat1, paramFloat2, paramFloat3, paramFloat4 * 0.017453292F); }
  
  public Quaternion setFromAxis(Vector3 paramVector3, float paramFloat) { return setFromAxis(paramVector3.x, paramVector3.y, paramVector3.z, paramFloat); }
  
  public Quaternion setFromAxisRad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    float f = Vector3.len(paramFloat1, paramFloat2, paramFloat3);
    if (f == 0.0F)
      return idt(); 
    f = 1.0F / f;
    if (paramFloat4 < 0.0F) {
      paramFloat4 = 6.2831855F - -paramFloat4 % 6.2831855F;
    } else {
      paramFloat4 %= 6.2831855F;
    } 
    double d = (paramFloat4 / 2.0F);
    paramFloat4 = (float)Math.sin(d);
    return set(paramFloat1 * f * paramFloat4, paramFloat2 * f * paramFloat4, f * paramFloat3 * paramFloat4, (float)Math.cos(d)).nor();
  }
  
  public Quaternion setFromAxisRad(Vector3 paramVector3, float paramFloat) { return setFromAxisRad(paramVector3.x, paramVector3.y, paramVector3.z, paramFloat); }
  
  public Quaternion setFromCross(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return setFromAxisRad(paramFloat2 * paramFloat6 - paramFloat3 * paramFloat5, paramFloat3 * paramFloat4 - paramFloat6 * paramFloat1, paramFloat1 * paramFloat5 - paramFloat2 * paramFloat4, (float)Math.acos(MathUtils.clamp(Vector3.dot(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6), -1.0F, 1.0F))); }
  
  public Quaternion setFromCross(Vector3 paramVector31, Vector3 paramVector32) {
    float f = (float)Math.acos(MathUtils.clamp(paramVector31.dot(paramVector32), -1.0F, 1.0F));
    return setFromAxisRad(paramVector31.y * paramVector32.z - paramVector31.z * paramVector32.y, paramVector31.z * paramVector32.x - paramVector31.x * paramVector32.z, paramVector31.x * paramVector32.y - paramVector31.y * paramVector32.x, f);
  }
  
  public Quaternion setFromMatrix(Matrix3 paramMatrix3) { return setFromMatrix(false, paramMatrix3); }
  
  public Quaternion setFromMatrix(Matrix4 paramMatrix4) { return setFromMatrix(false, paramMatrix4); }
  
  public Quaternion setFromMatrix(boolean paramBoolean, Matrix3 paramMatrix3) { return setFromAxes(paramBoolean, paramMatrix3.val[0], paramMatrix3.val[3], paramMatrix3.val[6], paramMatrix3.val[1], paramMatrix3.val[4], paramMatrix3.val[7], paramMatrix3.val[2], paramMatrix3.val[5], paramMatrix3.val[8]); }
  
  public Quaternion setFromMatrix(boolean paramBoolean, Matrix4 paramMatrix4) { return setFromAxes(paramBoolean, paramMatrix4.val[0], paramMatrix4.val[4], paramMatrix4.val[8], paramMatrix4.val[1], paramMatrix4.val[5], paramMatrix4.val[9], paramMatrix4.val[2], paramMatrix4.val[6], paramMatrix4.val[10]); }
  
  public Quaternion slerp(Quaternion paramQuaternion, float paramFloat) {
    float f2;
    float f1 = this.x * paramQuaternion.x + this.y * paramQuaternion.y + this.z * paramQuaternion.z + this.w * paramQuaternion.w;
    if (f1 < 0.0F) {
      f2 = -f1;
    } else {
      f2 = f1;
    } 
    float f3 = 1.0F - paramFloat;
    float f4 = f3;
    float f5 = paramFloat;
    if ((1.0F - f2) > 0.1D) {
      f2 = (float)Math.acos(f2);
      f5 = 1.0F / (float)Math.sin(f2);
      f4 = (float)Math.sin((f3 * f2)) * f5;
      f5 = (float)Math.sin((paramFloat * f2)) * f5;
    } 
    paramFloat = f5;
    if (f1 < 0.0F)
      paramFloat = -f5; 
    this.x = this.x * f4 + paramQuaternion.x * paramFloat;
    this.y = this.y * f4 + paramQuaternion.y * paramFloat;
    this.z = this.z * f4 + paramQuaternion.z * paramFloat;
    this.w = f4 * this.w + paramFloat * paramQuaternion.w;
    return this;
  }
  
  public Quaternion slerp(Quaternion[] paramArrayOfQuaternion) {
    float f = 1.0F / paramArrayOfQuaternion.length;
    set(paramArrayOfQuaternion[0]).exp(f);
    for (byte b = 1; b < paramArrayOfQuaternion.length; b++)
      mul(tmp1.set(paramArrayOfQuaternion[b]).exp(f)); 
    nor();
    return this;
  }
  
  public Quaternion slerp(Quaternion[] paramArrayOfQuaternion, float[] paramArrayOfFloat) {
    set(paramArrayOfQuaternion[0]).exp(paramArrayOfFloat[0]);
    for (byte b = 1; b < paramArrayOfQuaternion.length; b++)
      mul(tmp1.set(paramArrayOfQuaternion[b]).exp(paramArrayOfFloat[b])); 
    nor();
    return this;
  }
  
  public void toMatrix(float[] paramArrayOfFloat) {
    float f1 = this.x;
    float f2 = f1 * f1;
    float f3 = this.y;
    float f4 = f1 * f3;
    float f5 = this.z;
    float f6 = f1 * f5;
    float f7 = this.w;
    f1 *= f7;
    float f8 = f3 * f3;
    float f9 = f3 * f5;
    float f10 = f3 * f7;
    f3 = f5 * f5;
    f7 = f5 * f7;
    paramArrayOfFloat[0] = 1.0F - (f8 + f3) * 2.0F;
    paramArrayOfFloat[4] = (f4 - f7) * 2.0F;
    paramArrayOfFloat[8] = (f6 + f10) * 2.0F;
    paramArrayOfFloat[12] = 0.0F;
    paramArrayOfFloat[1] = (f4 + f7) * 2.0F;
    paramArrayOfFloat[5] = 1.0F - (f3 + f2) * 2.0F;
    paramArrayOfFloat[9] = (f9 - f1) * 2.0F;
    paramArrayOfFloat[13] = 0.0F;
    paramArrayOfFloat[2] = (f6 - f10) * 2.0F;
    paramArrayOfFloat[6] = (f9 + f1) * 2.0F;
    paramArrayOfFloat[10] = 1.0F - (f2 + f8) * 2.0F;
    paramArrayOfFloat[14] = 0.0F;
    paramArrayOfFloat[3] = 0.0F;
    paramArrayOfFloat[7] = 0.0F;
    paramArrayOfFloat[11] = 0.0F;
    paramArrayOfFloat[15] = 1.0F;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.x);
    stringBuilder.append("|");
    stringBuilder.append(this.y);
    stringBuilder.append("|");
    stringBuilder.append(this.z);
    stringBuilder.append("|");
    stringBuilder.append(this.w);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
  
  public Vector3 transform(Vector3 paramVector3) {
    tmp2.set(this);
    tmp2.conjugate();
    tmp2.mulLeft(tmp1.set(paramVector3.x, paramVector3.y, paramVector3.z, 0.0F)).mulLeft(this);
    Quaternion quaternion = tmp2;
    paramVector3.x = quaternion.x;
    paramVector3.y = quaternion.y;
    paramVector3.z = quaternion.z;
    return paramVector3;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Quaternion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */