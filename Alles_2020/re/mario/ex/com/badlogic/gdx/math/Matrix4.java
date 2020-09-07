package com.badlogic.gdx.math;

import java.io.Serializable;

public class Matrix4 implements Serializable {
  public static final int M00 = 0;
  
  public static final int M01 = 4;
  
  public static final int M02 = 8;
  
  public static final int M03 = 12;
  
  public static final int M10 = 1;
  
  public static final int M11 = 5;
  
  public static final int M12 = 9;
  
  public static final int M13 = 13;
  
  public static final int M20 = 2;
  
  public static final int M21 = 6;
  
  public static final int M22 = 10;
  
  public static final int M23 = 14;
  
  public static final int M30 = 3;
  
  public static final int M31 = 7;
  
  public static final int M32 = 11;
  
  public static final int M33 = 15;
  
  static final Vector3 l_vex;
  
  static final Vector3 l_vey;
  
  static final Vector3 l_vez;
  
  static Quaternion quat;
  
  static Quaternion quat2;
  
  static final Vector3 right;
  
  private static final long serialVersionUID = -2717655254359579617L;
  
  private static final float[] tmp = new float[16];
  
  static final Vector3 tmpForward;
  
  static final Matrix4 tmpMat;
  
  static final Vector3 tmpUp;
  
  static final Vector3 tmpVec;
  
  public final float[] val = new float[16];
  
  static  {
    quat = new Quaternion();
    quat2 = new Quaternion();
    l_vez = new Vector3();
    l_vex = new Vector3();
    l_vey = new Vector3();
    tmpVec = new Vector3();
    tmpMat = new Matrix4();
    right = new Vector3();
    tmpForward = new Vector3();
    tmpUp = new Vector3();
  }
  
  public Matrix4() {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = 1.0F;
    arrayOfFloat[5] = 1.0F;
    arrayOfFloat[10] = 1.0F;
    arrayOfFloat[15] = 1.0F;
  }
  
  public Matrix4(Matrix4 paramMatrix4) { set(paramMatrix4); }
  
  public Matrix4(Quaternion paramQuaternion) { set(paramQuaternion); }
  
  public Matrix4(Vector3 paramVector31, Quaternion paramQuaternion, Vector3 paramVector32) { set(paramVector31, paramQuaternion, paramVector32); }
  
  public Matrix4(float[] paramArrayOfFloat) { set(paramArrayOfFloat); }
  
  public static native float det(float[] paramArrayOfFloat);
  
  public static native boolean inv(float[] paramArrayOfFloat);
  
  public static native void mul(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2);
  
  public static native void mulVec(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2);
  
  public static native void mulVec(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2, int paramInt1, int paramInt2, int paramInt3);
  
  public static native void prj(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2);
  
  public static native void prj(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2, int paramInt1, int paramInt2, int paramInt3);
  
  public static native void rot(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2);
  
  public static native void rot(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2, int paramInt1, int paramInt2, int paramInt3);
  
  public Matrix4 avg(Matrix4 paramMatrix4, float paramFloat) {
    getScale(tmpVec);
    paramMatrix4.getScale(tmpForward);
    getRotation(quat);
    paramMatrix4.getRotation(quat2);
    getTranslation(tmpUp);
    paramMatrix4.getTranslation(right);
    Vector3 vector31 = tmpVec.scl(paramFloat);
    Vector3 vector32 = tmpForward;
    float f = 1.0F - paramFloat;
    setToScaling(vector31.add(vector32.scl(f)));
    rotate(quat.slerp(quat2, f));
    setTranslation(tmpUp.scl(paramFloat).add(right.scl(f)));
    return this;
  }
  
  public Matrix4 avg(Matrix4[] paramArrayOfMatrix4) {
    float f = 1.0F / paramArrayOfMatrix4.length;
    tmpVec.set(paramArrayOfMatrix4[0].getScale(tmpUp).scl(f));
    quat.set(paramArrayOfMatrix4[0].getRotation(quat2).exp(f));
    tmpForward.set(paramArrayOfMatrix4[0].getTranslation(tmpUp).scl(f));
    for (byte b = 1; b < paramArrayOfMatrix4.length; b++) {
      tmpVec.add(paramArrayOfMatrix4[b].getScale(tmpUp).scl(f));
      quat.mul(paramArrayOfMatrix4[b].getRotation(quat2).exp(f));
      tmpForward.add(paramArrayOfMatrix4[b].getTranslation(tmpUp).scl(f));
    } 
    quat.nor();
    setToScaling(tmpVec);
    rotate(quat);
    setTranslation(tmpForward);
    return this;
  }
  
  public Matrix4 avg(Matrix4[] paramArrayOfMatrix4, float[] paramArrayOfFloat) {
    tmpVec.set(paramArrayOfMatrix4[0].getScale(tmpUp).scl(paramArrayOfFloat[0]));
    quat.set(paramArrayOfMatrix4[0].getRotation(quat2).exp(paramArrayOfFloat[0]));
    tmpForward.set(paramArrayOfMatrix4[0].getTranslation(tmpUp).scl(paramArrayOfFloat[0]));
    for (byte b = 1; b < paramArrayOfMatrix4.length; b++) {
      tmpVec.add(paramArrayOfMatrix4[b].getScale(tmpUp).scl(paramArrayOfFloat[b]));
      quat.mul(paramArrayOfMatrix4[b].getRotation(quat2).exp(paramArrayOfFloat[b]));
      tmpForward.add(paramArrayOfMatrix4[b].getTranslation(tmpUp).scl(paramArrayOfFloat[b]));
    } 
    quat.nor();
    setToScaling(tmpVec);
    rotate(quat);
    setTranslation(tmpForward);
    return this;
  }
  
  public Matrix4 cpy() { return new Matrix4(this); }
  
  public float det() {
    float[] arrayOfFloat = this.val;
    return arrayOfFloat[3] * arrayOfFloat[6] * arrayOfFloat[9] * arrayOfFloat[12] - arrayOfFloat[2] * arrayOfFloat[7] * arrayOfFloat[9] * arrayOfFloat[12] - arrayOfFloat[3] * arrayOfFloat[5] * arrayOfFloat[10] * arrayOfFloat[12] + arrayOfFloat[1] * arrayOfFloat[7] * arrayOfFloat[10] * arrayOfFloat[12] + arrayOfFloat[2] * arrayOfFloat[5] * arrayOfFloat[11] * arrayOfFloat[12] - arrayOfFloat[1] * arrayOfFloat[6] * arrayOfFloat[11] * arrayOfFloat[12] - arrayOfFloat[3] * arrayOfFloat[6] * arrayOfFloat[8] * arrayOfFloat[13] + arrayOfFloat[2] * arrayOfFloat[7] * arrayOfFloat[8] * arrayOfFloat[13] + arrayOfFloat[3] * arrayOfFloat[4] * arrayOfFloat[10] * arrayOfFloat[13] - arrayOfFloat[0] * arrayOfFloat[7] * arrayOfFloat[10] * arrayOfFloat[13] - arrayOfFloat[2] * arrayOfFloat[4] * arrayOfFloat[11] * arrayOfFloat[13] + arrayOfFloat[0] * arrayOfFloat[6] * arrayOfFloat[11] * arrayOfFloat[13] + arrayOfFloat[3] * arrayOfFloat[5] * arrayOfFloat[8] * arrayOfFloat[14] - arrayOfFloat[1] * arrayOfFloat[7] * arrayOfFloat[8] * arrayOfFloat[14] - arrayOfFloat[3] * arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[14] + arrayOfFloat[0] * arrayOfFloat[7] * arrayOfFloat[9] * arrayOfFloat[14] + arrayOfFloat[1] * arrayOfFloat[4] * arrayOfFloat[11] * arrayOfFloat[14] - arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[11] * arrayOfFloat[14] - arrayOfFloat[2] * arrayOfFloat[5] * arrayOfFloat[8] * arrayOfFloat[15] + arrayOfFloat[1] * arrayOfFloat[6] * arrayOfFloat[8] * arrayOfFloat[15] + arrayOfFloat[2] * arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[15] - arrayOfFloat[0] * arrayOfFloat[6] * arrayOfFloat[9] * arrayOfFloat[15] - arrayOfFloat[1] * arrayOfFloat[4] * arrayOfFloat[10] * arrayOfFloat[15] + arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[10] * arrayOfFloat[15];
  }
  
  public float det3x3() {
    float[] arrayOfFloat = this.val;
    return arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[10] + arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[2] + arrayOfFloat[8] * arrayOfFloat[1] * arrayOfFloat[6] - arrayOfFloat[0] * arrayOfFloat[9] * arrayOfFloat[6] - arrayOfFloat[4] * arrayOfFloat[1] * arrayOfFloat[10] - arrayOfFloat[8] * arrayOfFloat[5] * arrayOfFloat[2];
  }
  
  public void extract4x3Matrix(float[] paramArrayOfFloat) {
    float[] arrayOfFloat = this.val;
    paramArrayOfFloat[0] = arrayOfFloat[0];
    paramArrayOfFloat[1] = arrayOfFloat[1];
    paramArrayOfFloat[2] = arrayOfFloat[2];
    paramArrayOfFloat[3] = arrayOfFloat[4];
    paramArrayOfFloat[4] = arrayOfFloat[5];
    paramArrayOfFloat[5] = arrayOfFloat[6];
    paramArrayOfFloat[6] = arrayOfFloat[8];
    paramArrayOfFloat[7] = arrayOfFloat[9];
    paramArrayOfFloat[8] = arrayOfFloat[10];
    paramArrayOfFloat[9] = arrayOfFloat[12];
    paramArrayOfFloat[10] = arrayOfFloat[13];
    paramArrayOfFloat[11] = arrayOfFloat[14];
  }
  
  public Quaternion getRotation(Quaternion paramQuaternion) { return paramQuaternion.setFromMatrix(this); }
  
  public Quaternion getRotation(Quaternion paramQuaternion, boolean paramBoolean) { return paramQuaternion.setFromMatrix(paramBoolean, this); }
  
  public Vector3 getScale(Vector3 paramVector3) { return paramVector3.set(getScaleX(), getScaleY(), getScaleZ()); }
  
  public float getScaleX() {
    float f;
    if (MathUtils.isZero(this.val[4]) && MathUtils.isZero(this.val[8])) {
      f = Math.abs(this.val[0]);
    } else {
      f = (float)Math.sqrt(getScaleXSquared());
    } 
    return f;
  }
  
  public float getScaleXSquared() {
    float[] arrayOfFloat = this.val;
    return arrayOfFloat[0] * arrayOfFloat[0] + arrayOfFloat[4] * arrayOfFloat[4] + arrayOfFloat[8] * arrayOfFloat[8];
  }
  
  public float getScaleY() {
    float f;
    if (MathUtils.isZero(this.val[1]) && MathUtils.isZero(this.val[9])) {
      f = Math.abs(this.val[5]);
    } else {
      f = (float)Math.sqrt(getScaleYSquared());
    } 
    return f;
  }
  
  public float getScaleYSquared() {
    float[] arrayOfFloat = this.val;
    return arrayOfFloat[1] * arrayOfFloat[1] + arrayOfFloat[5] * arrayOfFloat[5] + arrayOfFloat[9] * arrayOfFloat[9];
  }
  
  public float getScaleZ() {
    float f;
    if (MathUtils.isZero(this.val[2]) && MathUtils.isZero(this.val[6])) {
      f = Math.abs(this.val[10]);
    } else {
      f = (float)Math.sqrt(getScaleZSquared());
    } 
    return f;
  }
  
  public float getScaleZSquared() {
    float[] arrayOfFloat = this.val;
    return arrayOfFloat[2] * arrayOfFloat[2] + arrayOfFloat[6] * arrayOfFloat[6] + arrayOfFloat[10] * arrayOfFloat[10];
  }
  
  public Vector3 getTranslation(Vector3 paramVector3) {
    float[] arrayOfFloat = this.val;
    paramVector3.x = arrayOfFloat[12];
    paramVector3.y = arrayOfFloat[13];
    paramVector3.z = arrayOfFloat[14];
    return paramVector3;
  }
  
  public float[] getValues() { return this.val; }
  
  public boolean hasRotationOrScaling() {
    float[] arrayOfFloat = this.val;
    boolean bool = false;
    if (!MathUtils.isEqual(arrayOfFloat[0], 1.0F) || !MathUtils.isEqual(this.val[5], 1.0F) || !MathUtils.isEqual(this.val[10], 1.0F) || !MathUtils.isZero(this.val[4]) || !MathUtils.isZero(this.val[8]) || !MathUtils.isZero(this.val[1]) || !MathUtils.isZero(this.val[9]) || !MathUtils.isZero(this.val[2]) || !MathUtils.isZero(this.val[6]))
      bool = true; 
    return bool;
  }
  
  public Matrix4 idt() {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = 1.0F;
    arrayOfFloat[4] = 0.0F;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[12] = 0.0F;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[5] = 1.0F;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[13] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[10] = 1.0F;
    arrayOfFloat[14] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[15] = 1.0F;
    return this;
  }
  
  public Matrix4 inv() {
    float[] arrayOfFloat = this.val;
    float f = arrayOfFloat[3] * arrayOfFloat[6] * arrayOfFloat[9] * arrayOfFloat[12] - arrayOfFloat[2] * arrayOfFloat[7] * arrayOfFloat[9] * arrayOfFloat[12] - arrayOfFloat[3] * arrayOfFloat[5] * arrayOfFloat[10] * arrayOfFloat[12] + arrayOfFloat[1] * arrayOfFloat[7] * arrayOfFloat[10] * arrayOfFloat[12] + arrayOfFloat[2] * arrayOfFloat[5] * arrayOfFloat[11] * arrayOfFloat[12] - arrayOfFloat[1] * arrayOfFloat[6] * arrayOfFloat[11] * arrayOfFloat[12] - arrayOfFloat[3] * arrayOfFloat[6] * arrayOfFloat[8] * arrayOfFloat[13] + arrayOfFloat[2] * arrayOfFloat[7] * arrayOfFloat[8] * arrayOfFloat[13] + arrayOfFloat[3] * arrayOfFloat[4] * arrayOfFloat[10] * arrayOfFloat[13] - arrayOfFloat[0] * arrayOfFloat[7] * arrayOfFloat[10] * arrayOfFloat[13] - arrayOfFloat[2] * arrayOfFloat[4] * arrayOfFloat[11] * arrayOfFloat[13] + arrayOfFloat[0] * arrayOfFloat[6] * arrayOfFloat[11] * arrayOfFloat[13] + arrayOfFloat[3] * arrayOfFloat[5] * arrayOfFloat[8] * arrayOfFloat[14] - arrayOfFloat[1] * arrayOfFloat[7] * arrayOfFloat[8] * arrayOfFloat[14] - arrayOfFloat[3] * arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[14] + arrayOfFloat[0] * arrayOfFloat[7] * arrayOfFloat[9] * arrayOfFloat[14] + arrayOfFloat[1] * arrayOfFloat[4] * arrayOfFloat[11] * arrayOfFloat[14] - arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[11] * arrayOfFloat[14] - arrayOfFloat[2] * arrayOfFloat[5] * arrayOfFloat[8] * arrayOfFloat[15] + arrayOfFloat[1] * arrayOfFloat[6] * arrayOfFloat[8] * arrayOfFloat[15] + arrayOfFloat[2] * arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[15] - arrayOfFloat[0] * arrayOfFloat[6] * arrayOfFloat[9] * arrayOfFloat[15] - arrayOfFloat[1] * arrayOfFloat[4] * arrayOfFloat[10] * arrayOfFloat[15] + arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[10] * arrayOfFloat[15];
    if (f != 0.0F) {
      f = 1.0F / f;
      float[] arrayOfFloat1 = tmp;
      arrayOfFloat1[0] = arrayOfFloat[9] * arrayOfFloat[14] * arrayOfFloat[7] - arrayOfFloat[13] * arrayOfFloat[10] * arrayOfFloat[7] + arrayOfFloat[13] * arrayOfFloat[6] * arrayOfFloat[11] - arrayOfFloat[5] * arrayOfFloat[14] * arrayOfFloat[11] - arrayOfFloat[9] * arrayOfFloat[6] * arrayOfFloat[15] + arrayOfFloat[5] * arrayOfFloat[10] * arrayOfFloat[15];
      arrayOfFloat1[4] = arrayOfFloat[12] * arrayOfFloat[10] * arrayOfFloat[7] - arrayOfFloat[8] * arrayOfFloat[14] * arrayOfFloat[7] - arrayOfFloat[12] * arrayOfFloat[6] * arrayOfFloat[11] + arrayOfFloat[4] * arrayOfFloat[14] * arrayOfFloat[11] + arrayOfFloat[8] * arrayOfFloat[6] * arrayOfFloat[15] - arrayOfFloat[4] * arrayOfFloat[10] * arrayOfFloat[15];
      arrayOfFloat1[8] = arrayOfFloat[8] * arrayOfFloat[13] * arrayOfFloat[7] - arrayOfFloat[12] * arrayOfFloat[9] * arrayOfFloat[7] + arrayOfFloat[12] * arrayOfFloat[5] * arrayOfFloat[11] - arrayOfFloat[4] * arrayOfFloat[13] * arrayOfFloat[11] - arrayOfFloat[8] * arrayOfFloat[5] * arrayOfFloat[15] + arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[15];
      arrayOfFloat1[12] = arrayOfFloat[12] * arrayOfFloat[9] * arrayOfFloat[6] - arrayOfFloat[8] * arrayOfFloat[13] * arrayOfFloat[6] - arrayOfFloat[12] * arrayOfFloat[5] * arrayOfFloat[10] + arrayOfFloat[4] * arrayOfFloat[13] * arrayOfFloat[10] + arrayOfFloat[8] * arrayOfFloat[5] * arrayOfFloat[14] - arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[14];
      arrayOfFloat1[1] = arrayOfFloat[13] * arrayOfFloat[10] * arrayOfFloat[3] - arrayOfFloat[9] * arrayOfFloat[14] * arrayOfFloat[3] - arrayOfFloat[13] * arrayOfFloat[2] * arrayOfFloat[11] + arrayOfFloat[1] * arrayOfFloat[14] * arrayOfFloat[11] + arrayOfFloat[9] * arrayOfFloat[2] * arrayOfFloat[15] - arrayOfFloat[1] * arrayOfFloat[10] * arrayOfFloat[15];
      arrayOfFloat1[5] = arrayOfFloat[8] * arrayOfFloat[14] * arrayOfFloat[3] - arrayOfFloat[12] * arrayOfFloat[10] * arrayOfFloat[3] + arrayOfFloat[12] * arrayOfFloat[2] * arrayOfFloat[11] - arrayOfFloat[0] * arrayOfFloat[14] * arrayOfFloat[11] - arrayOfFloat[8] * arrayOfFloat[2] * arrayOfFloat[15] + arrayOfFloat[0] * arrayOfFloat[10] * arrayOfFloat[15];
      arrayOfFloat1[9] = arrayOfFloat[12] * arrayOfFloat[9] * arrayOfFloat[3] - arrayOfFloat[8] * arrayOfFloat[13] * arrayOfFloat[3] - arrayOfFloat[12] * arrayOfFloat[1] * arrayOfFloat[11] + arrayOfFloat[0] * arrayOfFloat[13] * arrayOfFloat[11] + arrayOfFloat[8] * arrayOfFloat[1] * arrayOfFloat[15] - arrayOfFloat[0] * arrayOfFloat[9] * arrayOfFloat[15];
      arrayOfFloat1[13] = arrayOfFloat[8] * arrayOfFloat[13] * arrayOfFloat[2] - arrayOfFloat[12] * arrayOfFloat[9] * arrayOfFloat[2] + arrayOfFloat[12] * arrayOfFloat[1] * arrayOfFloat[10] - arrayOfFloat[0] * arrayOfFloat[13] * arrayOfFloat[10] - arrayOfFloat[8] * arrayOfFloat[1] * arrayOfFloat[14] + arrayOfFloat[0] * arrayOfFloat[9] * arrayOfFloat[14];
      arrayOfFloat1[2] = arrayOfFloat[5] * arrayOfFloat[14] * arrayOfFloat[3] - arrayOfFloat[13] * arrayOfFloat[6] * arrayOfFloat[3] + arrayOfFloat[13] * arrayOfFloat[2] * arrayOfFloat[7] - arrayOfFloat[1] * arrayOfFloat[14] * arrayOfFloat[7] - arrayOfFloat[5] * arrayOfFloat[2] * arrayOfFloat[15] + arrayOfFloat[1] * arrayOfFloat[6] * arrayOfFloat[15];
      arrayOfFloat1[6] = arrayOfFloat[12] * arrayOfFloat[6] * arrayOfFloat[3] - arrayOfFloat[4] * arrayOfFloat[14] * arrayOfFloat[3] - arrayOfFloat[12] * arrayOfFloat[2] * arrayOfFloat[7] + arrayOfFloat[0] * arrayOfFloat[14] * arrayOfFloat[7] + arrayOfFloat[4] * arrayOfFloat[2] * arrayOfFloat[15] - arrayOfFloat[0] * arrayOfFloat[6] * arrayOfFloat[15];
      arrayOfFloat1[10] = arrayOfFloat[4] * arrayOfFloat[13] * arrayOfFloat[3] - arrayOfFloat[12] * arrayOfFloat[5] * arrayOfFloat[3] + arrayOfFloat[12] * arrayOfFloat[1] * arrayOfFloat[7] - arrayOfFloat[0] * arrayOfFloat[13] * arrayOfFloat[7] - arrayOfFloat[4] * arrayOfFloat[1] * arrayOfFloat[15] + arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[15];
      arrayOfFloat1[14] = arrayOfFloat[12] * arrayOfFloat[5] * arrayOfFloat[2] - arrayOfFloat[4] * arrayOfFloat[13] * arrayOfFloat[2] - arrayOfFloat[12] * arrayOfFloat[1] * arrayOfFloat[6] + arrayOfFloat[0] * arrayOfFloat[13] * arrayOfFloat[6] + arrayOfFloat[4] * arrayOfFloat[1] * arrayOfFloat[14] - arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[14];
      arrayOfFloat1[3] = arrayOfFloat[9] * arrayOfFloat[6] * arrayOfFloat[3] - arrayOfFloat[5] * arrayOfFloat[10] * arrayOfFloat[3] - arrayOfFloat[9] * arrayOfFloat[2] * arrayOfFloat[7] + arrayOfFloat[1] * arrayOfFloat[10] * arrayOfFloat[7] + arrayOfFloat[5] * arrayOfFloat[2] * arrayOfFloat[11] - arrayOfFloat[1] * arrayOfFloat[6] * arrayOfFloat[11];
      arrayOfFloat1[7] = arrayOfFloat[4] * arrayOfFloat[10] * arrayOfFloat[3] - arrayOfFloat[8] * arrayOfFloat[6] * arrayOfFloat[3] + arrayOfFloat[8] * arrayOfFloat[2] * arrayOfFloat[7] - arrayOfFloat[0] * arrayOfFloat[10] * arrayOfFloat[7] - arrayOfFloat[4] * arrayOfFloat[2] * arrayOfFloat[11] + arrayOfFloat[0] * arrayOfFloat[6] * arrayOfFloat[11];
      arrayOfFloat1[11] = arrayOfFloat[8] * arrayOfFloat[5] * arrayOfFloat[3] - arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[3] - arrayOfFloat[8] * arrayOfFloat[1] * arrayOfFloat[7] + arrayOfFloat[0] * arrayOfFloat[9] * arrayOfFloat[7] + arrayOfFloat[4] * arrayOfFloat[1] * arrayOfFloat[11] - arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[11];
      arrayOfFloat1[15] = arrayOfFloat[4] * arrayOfFloat[9] * arrayOfFloat[2] - arrayOfFloat[8] * arrayOfFloat[5] * arrayOfFloat[2] + arrayOfFloat[8] * arrayOfFloat[1] * arrayOfFloat[6] - arrayOfFloat[0] * arrayOfFloat[9] * arrayOfFloat[6] - arrayOfFloat[4] * arrayOfFloat[1] * arrayOfFloat[10] + arrayOfFloat[0] * arrayOfFloat[5] * arrayOfFloat[10];
      arrayOfFloat[0] = arrayOfFloat1[0] * f;
      arrayOfFloat[4] = arrayOfFloat1[4] * f;
      arrayOfFloat[8] = arrayOfFloat1[8] * f;
      arrayOfFloat[12] = arrayOfFloat1[12] * f;
      arrayOfFloat[1] = arrayOfFloat1[1] * f;
      arrayOfFloat[5] = arrayOfFloat1[5] * f;
      arrayOfFloat[9] = arrayOfFloat1[9] * f;
      arrayOfFloat[13] = arrayOfFloat1[13] * f;
      arrayOfFloat[2] = arrayOfFloat1[2] * f;
      arrayOfFloat[6] = arrayOfFloat1[6] * f;
      arrayOfFloat[10] = arrayOfFloat1[10] * f;
      arrayOfFloat[14] = arrayOfFloat1[14] * f;
      arrayOfFloat[3] = arrayOfFloat1[3] * f;
      arrayOfFloat[7] = arrayOfFloat1[7] * f;
      arrayOfFloat[11] = arrayOfFloat1[11] * f;
      arrayOfFloat[15] = arrayOfFloat1[15] * f;
      return this;
    } 
    throw new RuntimeException("non-invertible matrix");
  }
  
  public Matrix4 lerp(Matrix4 paramMatrix4, float paramFloat) {
    for (byte b = 0; b < 16; b++) {
      float[] arrayOfFloat = this.val;
      arrayOfFloat[b] = arrayOfFloat[b] * (1.0F - paramFloat) + paramMatrix4.val[b] * paramFloat;
    } 
    return this;
  }
  
  public Matrix4 mul(Matrix4 paramMatrix4) {
    mul(this.val, paramMatrix4.val);
    return this;
  }
  
  public Matrix4 mulLeft(Matrix4 paramMatrix4) {
    tmpMat.set(paramMatrix4).mul(tmpMat.val, this.val);
    return set(tmpMat);
  }
  
  public Matrix4 rotate(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat4 == 0.0F)
      return this; 
    quat.setFromAxis(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    return rotate(quat);
  }
  
  public Matrix4 rotate(Quaternion paramQuaternion) {
    paramQuaternion.toMatrix(tmp);
    mul(this.val, tmp);
    return this;
  }
  
  public Matrix4 rotate(Vector3 paramVector3, float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    quat.set(paramVector3, paramFloat);
    return rotate(quat);
  }
  
  public Matrix4 rotate(Vector3 paramVector31, Vector3 paramVector32) { return rotate(quat.setFromCross(paramVector31, paramVector32)); }
  
  public Matrix4 rotateRad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat4 == 0.0F)
      return this; 
    quat.setFromAxisRad(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    return rotate(quat);
  }
  
  public Matrix4 rotateRad(Vector3 paramVector3, float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    quat.setFromAxisRad(paramVector3, paramFloat);
    return rotate(quat);
  }
  
  public Matrix4 scale(float paramFloat1, float paramFloat2, float paramFloat3) {
    float[] arrayOfFloat = tmp;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[4] = 0.0F;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[12] = 0.0F;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[5] = paramFloat2;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[13] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[10] = paramFloat3;
    arrayOfFloat[14] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[15] = 1.0F;
    mul(this.val, arrayOfFloat);
    return this;
  }
  
  public Matrix4 scl(float paramFloat) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = arrayOfFloat[0] * paramFloat;
    arrayOfFloat[5] = arrayOfFloat[5] * paramFloat;
    arrayOfFloat[10] = arrayOfFloat[10] * paramFloat;
    return this;
  }
  
  public Matrix4 scl(float paramFloat1, float paramFloat2, float paramFloat3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = arrayOfFloat[0] * paramFloat1;
    arrayOfFloat[5] = arrayOfFloat[5] * paramFloat2;
    arrayOfFloat[10] = arrayOfFloat[10] * paramFloat3;
    return this;
  }
  
  public Matrix4 scl(Vector3 paramVector3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = arrayOfFloat[0] * paramVector3.x;
    arrayOfFloat = this.val;
    arrayOfFloat[5] = arrayOfFloat[5] * paramVector3.y;
    arrayOfFloat = this.val;
    arrayOfFloat[10] = arrayOfFloat[10] * paramVector3.z;
    return this;
  }
  
  public Matrix4 set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return set(0.0F, 0.0F, 0.0F, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public Matrix4 set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) {
    float f1 = paramFloat4 * 2.0F;
    float f2 = paramFloat5 * 2.0F;
    float f3 = 2.0F * paramFloat6;
    float f4 = paramFloat7 * f1;
    float f5 = paramFloat7 * f2;
    paramFloat7 *= f3;
    float f6 = f1 * paramFloat4;
    f1 = paramFloat4 * f2;
    paramFloat4 *= f3;
    f2 *= paramFloat5;
    paramFloat5 *= f3;
    paramFloat6 = f3 * paramFloat6;
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = 1.0F - f2 + paramFloat6;
    arrayOfFloat[4] = f1 - paramFloat7;
    arrayOfFloat[8] = paramFloat4 + f5;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[1] = f1 + paramFloat7;
    arrayOfFloat[5] = 1.0F - paramFloat6 + f6;
    arrayOfFloat[9] = paramFloat5 - f4;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[2] = paramFloat4 - f5;
    arrayOfFloat[6] = paramFloat5 + f4;
    arrayOfFloat[10] = 1.0F - f6 + f2;
    arrayOfFloat[14] = paramFloat3;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[15] = 1.0F;
    return this;
  }
  
  public Matrix4 set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10) {
    float f1 = paramFloat4 * 2.0F;
    float f2 = paramFloat5 * 2.0F;
    float f3 = 2.0F * paramFloat6;
    float f4 = paramFloat7 * f1;
    float f5 = paramFloat7 * f2;
    paramFloat7 *= f3;
    float f6 = f1 * paramFloat4;
    f1 = paramFloat4 * f2;
    paramFloat4 *= f3;
    f2 *= paramFloat5;
    paramFloat5 *= f3;
    paramFloat6 = f3 * paramFloat6;
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = (1.0F - f2 + paramFloat6) * paramFloat8;
    arrayOfFloat[4] = (f1 - paramFloat7) * paramFloat9;
    arrayOfFloat[8] = (paramFloat4 + f5) * paramFloat10;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[1] = paramFloat8 * (f1 + paramFloat7);
    arrayOfFloat[5] = (1.0F - paramFloat6 + f6) * paramFloat9;
    arrayOfFloat[9] = (paramFloat5 - f4) * paramFloat10;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[2] = paramFloat8 * (paramFloat4 - f5);
    arrayOfFloat[6] = paramFloat9 * (paramFloat5 + f4);
    arrayOfFloat[10] = (1.0F - f6 + f2) * paramFloat10;
    arrayOfFloat[14] = paramFloat3;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[15] = 1.0F;
    return this;
  }
  
  public Matrix4 set(Affine2 paramAffine2) {
    this.val[0] = paramAffine2.m00;
    this.val[1] = paramAffine2.m10;
    float[] arrayOfFloat2 = this.val;
    arrayOfFloat2[2] = 0.0F;
    arrayOfFloat2[3] = 0.0F;
    arrayOfFloat2[4] = paramAffine2.m01;
    this.val[5] = paramAffine2.m11;
    arrayOfFloat2 = this.val;
    arrayOfFloat2[6] = 0.0F;
    arrayOfFloat2[7] = 0.0F;
    arrayOfFloat2[8] = 0.0F;
    arrayOfFloat2[9] = 0.0F;
    arrayOfFloat2[10] = 1.0F;
    arrayOfFloat2[11] = 0.0F;
    arrayOfFloat2[12] = paramAffine2.m02;
    this.val[13] = paramAffine2.m12;
    float[] arrayOfFloat1 = this.val;
    arrayOfFloat1[14] = 0.0F;
    arrayOfFloat1[15] = 1.0F;
    return this;
  }
  
  public Matrix4 set(Matrix3 paramMatrix3) {
    this.val[0] = paramMatrix3.val[0];
    this.val[1] = paramMatrix3.val[1];
    this.val[2] = paramMatrix3.val[2];
    float[] arrayOfFloat = this.val;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = paramMatrix3.val[3];
    this.val[5] = paramMatrix3.val[4];
    this.val[6] = paramMatrix3.val[5];
    arrayOfFloat = this.val;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[10] = 1.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[12] = paramMatrix3.val[6];
    this.val[13] = paramMatrix3.val[7];
    arrayOfFloat = this.val;
    arrayOfFloat[14] = 0.0F;
    arrayOfFloat[15] = paramMatrix3.val[8];
    return this;
  }
  
  public Matrix4 set(Matrix4 paramMatrix4) { return set(paramMatrix4.val); }
  
  public Matrix4 set(Quaternion paramQuaternion) { return set(paramQuaternion.x, paramQuaternion.y, paramQuaternion.z, paramQuaternion.w); }
  
  public Matrix4 set(Vector3 paramVector3, Quaternion paramQuaternion) { return set(paramVector3.x, paramVector3.y, paramVector3.z, paramQuaternion.x, paramQuaternion.y, paramQuaternion.z, paramQuaternion.w); }
  
  public Matrix4 set(Vector3 paramVector31, Quaternion paramQuaternion, Vector3 paramVector32) { return set(paramVector31.x, paramVector31.y, paramVector31.z, paramQuaternion.x, paramQuaternion.y, paramQuaternion.z, paramQuaternion.w, paramVector32.x, paramVector32.y, paramVector32.z); }
  
  public Matrix4 set(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) {
    this.val[0] = paramVector31.x;
    this.val[4] = paramVector31.y;
    this.val[8] = paramVector31.z;
    this.val[1] = paramVector32.x;
    this.val[5] = paramVector32.y;
    this.val[9] = paramVector32.z;
    this.val[2] = paramVector33.x;
    this.val[6] = paramVector33.y;
    this.val[10] = paramVector33.z;
    this.val[12] = paramVector34.x;
    this.val[13] = paramVector34.y;
    this.val[14] = paramVector34.z;
    float[] arrayOfFloat = this.val;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[15] = 1.0F;
    return this;
  }
  
  public Matrix4 set(float[] paramArrayOfFloat) {
    float[] arrayOfFloat = this.val;
    System.arraycopy(paramArrayOfFloat, 0, arrayOfFloat, 0, arrayOfFloat.length);
    return this;
  }
  
  public Matrix4 setAsAffine(Affine2 paramAffine2) {
    this.val[0] = paramAffine2.m00;
    this.val[1] = paramAffine2.m10;
    this.val[4] = paramAffine2.m01;
    this.val[5] = paramAffine2.m11;
    this.val[12] = paramAffine2.m02;
    this.val[13] = paramAffine2.m12;
    return this;
  }
  
  public Matrix4 setAsAffine(Matrix4 paramMatrix4) {
    float[] arrayOfFloat2 = this.val;
    float[] arrayOfFloat1 = paramMatrix4.val;
    arrayOfFloat2[0] = arrayOfFloat1[0];
    arrayOfFloat2[1] = arrayOfFloat1[1];
    arrayOfFloat2[4] = arrayOfFloat1[4];
    arrayOfFloat2[5] = arrayOfFloat1[5];
    arrayOfFloat2[12] = arrayOfFloat1[12];
    arrayOfFloat2[13] = arrayOfFloat1[13];
    return this;
  }
  
  public Matrix4 setFromEulerAngles(float paramFloat1, float paramFloat2, float paramFloat3) {
    quat.setEulerAngles(paramFloat1, paramFloat2, paramFloat3);
    return set(quat);
  }
  
  public Matrix4 setFromEulerAnglesRad(float paramFloat1, float paramFloat2, float paramFloat3) {
    quat.setEulerAnglesRad(paramFloat1, paramFloat2, paramFloat3);
    return set(quat);
  }
  
  public Matrix4 setToLookAt(Vector3 paramVector31, Vector3 paramVector32) {
    l_vez.set(paramVector31).nor();
    l_vex.set(paramVector31).nor();
    l_vex.crs(paramVector32).nor();
    l_vey.set(l_vex).crs(l_vez).nor();
    idt();
    this.val[0] = l_vex.x;
    this.val[4] = l_vex.y;
    this.val[8] = l_vex.z;
    this.val[1] = l_vey.x;
    this.val[5] = l_vey.y;
    this.val[9] = l_vey.z;
    this.val[2] = -l_vez.x;
    this.val[6] = -l_vez.y;
    this.val[10] = -l_vez.z;
    return this;
  }
  
  public Matrix4 setToLookAt(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33) {
    tmpVec.set(paramVector32).sub(paramVector31);
    setToLookAt(tmpVec, paramVector33);
    mul(tmpMat.setToTranslation(-paramVector31.x, -paramVector31.y, -paramVector31.z));
    return this;
  }
  
  public Matrix4 setToOrtho(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    idt();
    float f1 = paramFloat2 - paramFloat1;
    float f2 = 2.0F / f1;
    float f3 = paramFloat4 - paramFloat3;
    float f4 = 2.0F / f3;
    float f5 = paramFloat6 - paramFloat5;
    float f6 = -2.0F / f5;
    paramFloat1 = -(paramFloat2 + paramFloat1) / f1;
    paramFloat2 = -(paramFloat4 + paramFloat3) / f3;
    paramFloat3 = -(paramFloat6 + paramFloat5) / f5;
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = f2;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 0.0F;
    arrayOfFloat[5] = f4;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[10] = f6;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[14] = paramFloat3;
    arrayOfFloat[15] = 1.0F;
    return this;
  }
  
  public Matrix4 setToOrtho2D(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    setToOrtho(paramFloat1, paramFloat1 + paramFloat3, paramFloat2, paramFloat2 + paramFloat4, 0.0F, 1.0F);
    return this;
  }
  
  public Matrix4 setToOrtho2D(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    setToOrtho(paramFloat1, paramFloat1 + paramFloat3, paramFloat2, paramFloat2 + paramFloat4, paramFloat5, paramFloat6);
    return this;
  }
  
  public Matrix4 setToProjection(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    idt();
    double d = paramFloat3;
    Double.isNaN(d);
    paramFloat3 = (float)(1.0D / Math.tan(d * 0.017453292519943295D / 2.0D));
    float f1 = paramFloat1 - paramFloat2;
    float f2 = (paramFloat2 + paramFloat1) / f1;
    paramFloat1 = paramFloat2 * 2.0F * paramFloat1 / f1;
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = paramFloat3 / paramFloat4;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 0.0F;
    arrayOfFloat[5] = paramFloat3;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[10] = f2;
    arrayOfFloat[11] = -1.0F;
    arrayOfFloat[12] = 0.0F;
    arrayOfFloat[13] = 0.0F;
    arrayOfFloat[14] = paramFloat1;
    arrayOfFloat[15] = 0.0F;
    return this;
  }
  
  public Matrix4 setToProjection(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    float f1 = paramFloat5 * 2.0F;
    float f2 = paramFloat2 - paramFloat1;
    float f3 = f1 / f2;
    float f4 = paramFloat4 - paramFloat3;
    f1 /= f4;
    paramFloat1 = (paramFloat2 + paramFloat1) / f2;
    paramFloat2 = (paramFloat4 + paramFloat3) / f4;
    paramFloat4 = paramFloat5 - paramFloat6;
    paramFloat3 = (paramFloat6 + paramFloat5) / paramFloat4;
    paramFloat4 = paramFloat6 * 2.0F * paramFloat5 / paramFloat4;
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = f3;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 0.0F;
    arrayOfFloat[5] = f1;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = paramFloat1;
    arrayOfFloat[9] = paramFloat2;
    arrayOfFloat[10] = paramFloat3;
    arrayOfFloat[11] = -1.0F;
    arrayOfFloat[12] = 0.0F;
    arrayOfFloat[13] = 0.0F;
    arrayOfFloat[14] = paramFloat4;
    arrayOfFloat[15] = 0.0F;
    return this;
  }
  
  public Matrix4 setToRotation(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat4 == 0.0F) {
      idt();
      return this;
    } 
    return set(quat.setFromAxis(paramFloat1, paramFloat2, paramFloat3, paramFloat4));
  }
  
  public Matrix4 setToRotation(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return set(quat.setFromCross(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6)); }
  
  public Matrix4 setToRotation(Vector3 paramVector3, float paramFloat) {
    if (paramFloat == 0.0F) {
      idt();
      return this;
    } 
    return set(quat.set(paramVector3, paramFloat));
  }
  
  public Matrix4 setToRotation(Vector3 paramVector31, Vector3 paramVector32) { return set(quat.setFromCross(paramVector31, paramVector32)); }
  
  public Matrix4 setToRotationRad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat4 == 0.0F) {
      idt();
      return this;
    } 
    return set(quat.setFromAxisRad(paramFloat1, paramFloat2, paramFloat3, paramFloat4));
  }
  
  public Matrix4 setToRotationRad(Vector3 paramVector3, float paramFloat) {
    if (paramFloat == 0.0F) {
      idt();
      return this;
    } 
    return set(quat.setFromAxisRad(paramVector3, paramFloat));
  }
  
  public Matrix4 setToScaling(float paramFloat1, float paramFloat2, float paramFloat3) {
    idt();
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[5] = paramFloat2;
    arrayOfFloat[10] = paramFloat3;
    return this;
  }
  
  public Matrix4 setToScaling(Vector3 paramVector3) {
    idt();
    this.val[0] = paramVector3.x;
    this.val[5] = paramVector3.y;
    this.val[10] = paramVector3.z;
    return this;
  }
  
  public Matrix4 setToTranslation(float paramFloat1, float paramFloat2, float paramFloat3) {
    idt();
    float[] arrayOfFloat = this.val;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[14] = paramFloat3;
    return this;
  }
  
  public Matrix4 setToTranslation(Vector3 paramVector3) {
    idt();
    this.val[12] = paramVector3.x;
    this.val[13] = paramVector3.y;
    this.val[14] = paramVector3.z;
    return this;
  }
  
  public Matrix4 setToTranslationAndScaling(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    idt();
    float[] arrayOfFloat = this.val;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[14] = paramFloat3;
    arrayOfFloat[0] = paramFloat4;
    arrayOfFloat[5] = paramFloat5;
    arrayOfFloat[10] = paramFloat6;
    return this;
  }
  
  public Matrix4 setToTranslationAndScaling(Vector3 paramVector31, Vector3 paramVector32) {
    idt();
    this.val[12] = paramVector31.x;
    this.val[13] = paramVector31.y;
    this.val[14] = paramVector31.z;
    this.val[0] = paramVector32.x;
    this.val[5] = paramVector32.y;
    this.val[10] = paramVector32.z;
    return this;
  }
  
  public Matrix4 setToWorld(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33) {
    tmpForward.set(paramVector32).nor();
    right.set(tmpForward).crs(paramVector33).nor();
    tmpUp.set(right).crs(tmpForward).nor();
    set(right, tmpUp, tmpForward.scl(-1.0F), paramVector31);
    return this;
  }
  
  public Matrix4 setTranslation(float paramFloat1, float paramFloat2, float paramFloat3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[14] = paramFloat3;
    return this;
  }
  
  public Matrix4 setTranslation(Vector3 paramVector3) {
    this.val[12] = paramVector3.x;
    this.val[13] = paramVector3.y;
    this.val[14] = paramVector3.z;
    return this;
  }
  
  public Matrix4 toNormalMatrix() {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[12] = 0.0F;
    arrayOfFloat[13] = 0.0F;
    arrayOfFloat[14] = 0.0F;
    return inv().tra();
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.val[0]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[4]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[8]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[12]);
    stringBuilder.append("]\n[");
    stringBuilder.append(this.val[1]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[5]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[9]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[13]);
    stringBuilder.append("]\n[");
    stringBuilder.append(this.val[2]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[6]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[10]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[14]);
    stringBuilder.append("]\n[");
    stringBuilder.append(this.val[3]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[7]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[11]);
    stringBuilder.append("|");
    stringBuilder.append(this.val[15]);
    stringBuilder.append("]\n");
    return stringBuilder.toString();
  }
  
  public Matrix4 tra() {
    float[] arrayOfFloat1 = tmp;
    float[] arrayOfFloat2 = this.val;
    arrayOfFloat1[0] = arrayOfFloat2[0];
    arrayOfFloat1[4] = arrayOfFloat2[1];
    arrayOfFloat1[8] = arrayOfFloat2[2];
    arrayOfFloat1[12] = arrayOfFloat2[3];
    arrayOfFloat1[1] = arrayOfFloat2[4];
    arrayOfFloat1[5] = arrayOfFloat2[5];
    arrayOfFloat1[9] = arrayOfFloat2[6];
    arrayOfFloat1[13] = arrayOfFloat2[7];
    arrayOfFloat1[2] = arrayOfFloat2[8];
    arrayOfFloat1[6] = arrayOfFloat2[9];
    arrayOfFloat1[10] = arrayOfFloat2[10];
    arrayOfFloat1[14] = arrayOfFloat2[11];
    arrayOfFloat1[3] = arrayOfFloat2[12];
    arrayOfFloat1[7] = arrayOfFloat2[13];
    arrayOfFloat1[11] = arrayOfFloat2[14];
    arrayOfFloat1[15] = arrayOfFloat2[15];
    return set(arrayOfFloat1);
  }
  
  public Matrix4 translate(float paramFloat1, float paramFloat2, float paramFloat3) {
    float[] arrayOfFloat = tmp;
    arrayOfFloat[0] = 1.0F;
    arrayOfFloat[4] = 0.0F;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[5] = 1.0F;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[13] = paramFloat2;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[10] = 1.0F;
    arrayOfFloat[14] = paramFloat3;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[11] = 0.0F;
    arrayOfFloat[15] = 1.0F;
    mul(this.val, arrayOfFloat);
    return this;
  }
  
  public Matrix4 translate(Vector3 paramVector3) { return translate(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public Matrix4 trn(float paramFloat1, float paramFloat2, float paramFloat3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[12] = arrayOfFloat[12] + paramFloat1;
    arrayOfFloat[13] = arrayOfFloat[13] + paramFloat2;
    arrayOfFloat[14] = arrayOfFloat[14] + paramFloat3;
    return this;
  }
  
  public Matrix4 trn(Vector3 paramVector3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[12] = arrayOfFloat[12] + paramVector3.x;
    arrayOfFloat = this.val;
    arrayOfFloat[13] = arrayOfFloat[13] + paramVector3.y;
    arrayOfFloat = this.val;
    arrayOfFloat[14] = arrayOfFloat[14] + paramVector3.z;
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Matrix4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */