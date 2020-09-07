package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.Serializable;

public class Matrix3 implements Serializable {
  public static final int M00 = 0;
  
  public static final int M01 = 3;
  
  public static final int M02 = 6;
  
  public static final int M10 = 1;
  
  public static final int M11 = 4;
  
  public static final int M12 = 7;
  
  public static final int M20 = 2;
  
  public static final int M21 = 5;
  
  public static final int M22 = 8;
  
  private static final long serialVersionUID = 7907569533774959788L;
  
  private float[] tmp = new float[9];
  
  public float[] val = new float[9];
  
  public Matrix3() { idt(); }
  
  public Matrix3(Matrix3 paramMatrix3) { set(paramMatrix3); }
  
  public Matrix3(float[] paramArrayOfFloat) { set(paramArrayOfFloat); }
  
  private static void mul(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2) {
    float f1 = paramArrayOfFloat1[0];
    float f2 = paramArrayOfFloat2[0];
    float f3 = paramArrayOfFloat1[3];
    float f4 = paramArrayOfFloat2[1];
    float f5 = paramArrayOfFloat1[6];
    float f6 = paramArrayOfFloat2[2];
    float f7 = paramArrayOfFloat1[0];
    float f8 = paramArrayOfFloat2[3];
    float f9 = paramArrayOfFloat1[3];
    float f10 = paramArrayOfFloat2[4];
    float f11 = paramArrayOfFloat1[6];
    float f12 = paramArrayOfFloat2[5];
    float f13 = paramArrayOfFloat1[0];
    float f14 = paramArrayOfFloat2[6];
    float f15 = paramArrayOfFloat1[3];
    float f16 = paramArrayOfFloat2[7];
    float f17 = paramArrayOfFloat1[6];
    float f18 = paramArrayOfFloat2[8];
    float f19 = paramArrayOfFloat1[1];
    float f20 = paramArrayOfFloat2[0];
    float f21 = paramArrayOfFloat1[4];
    float f22 = paramArrayOfFloat2[1];
    float f23 = paramArrayOfFloat1[7];
    float f24 = paramArrayOfFloat2[2];
    float f25 = paramArrayOfFloat1[1];
    float f26 = paramArrayOfFloat2[3];
    float f27 = paramArrayOfFloat1[4];
    float f28 = paramArrayOfFloat2[4];
    float f29 = paramArrayOfFloat1[7];
    float f30 = paramArrayOfFloat2[5];
    float f31 = paramArrayOfFloat1[1];
    float f32 = paramArrayOfFloat2[6];
    float f33 = paramArrayOfFloat1[4];
    float f34 = paramArrayOfFloat2[7];
    float f35 = paramArrayOfFloat1[7];
    float f36 = paramArrayOfFloat2[8];
    float f37 = paramArrayOfFloat1[2];
    float f38 = paramArrayOfFloat2[0];
    float f39 = paramArrayOfFloat1[5];
    float f40 = paramArrayOfFloat2[1];
    float f41 = paramArrayOfFloat1[8];
    float f42 = paramArrayOfFloat2[2];
    float f43 = paramArrayOfFloat1[2];
    float f44 = paramArrayOfFloat2[3];
    float f45 = paramArrayOfFloat1[5];
    float f46 = paramArrayOfFloat2[4];
    float f47 = paramArrayOfFloat1[8];
    float f48 = paramArrayOfFloat2[5];
    float f49 = paramArrayOfFloat1[2];
    float f50 = paramArrayOfFloat2[6];
    float f51 = paramArrayOfFloat1[5];
    float f52 = paramArrayOfFloat2[7];
    float f53 = paramArrayOfFloat1[8];
    float f54 = paramArrayOfFloat2[8];
    paramArrayOfFloat1[0] = f1 * f2 + f3 * f4 + f5 * f6;
    paramArrayOfFloat1[1] = f19 * f20 + f21 * f22 + f23 * f24;
    paramArrayOfFloat1[2] = f37 * f38 + f39 * f40 + f41 * f42;
    paramArrayOfFloat1[3] = f7 * f8 + f9 * f10 + f11 * f12;
    paramArrayOfFloat1[4] = f25 * f26 + f27 * f28 + f29 * f30;
    paramArrayOfFloat1[5] = f43 * f44 + f45 * f46 + f47 * f48;
    paramArrayOfFloat1[6] = f13 * f14 + f15 * f16 + f17 * f18;
    paramArrayOfFloat1[7] = f31 * f32 + f33 * f34 + f35 * f36;
    paramArrayOfFloat1[8] = f49 * f50 + f51 * f52 + f53 * f54;
  }
  
  public float det() {
    float[] arrayOfFloat = this.val;
    return arrayOfFloat[0] * arrayOfFloat[4] * arrayOfFloat[8] + arrayOfFloat[3] * arrayOfFloat[7] * arrayOfFloat[2] + arrayOfFloat[6] * arrayOfFloat[1] * arrayOfFloat[5] - arrayOfFloat[0] * arrayOfFloat[7] * arrayOfFloat[5] - arrayOfFloat[3] * arrayOfFloat[1] * arrayOfFloat[8] - arrayOfFloat[6] * arrayOfFloat[4] * arrayOfFloat[2];
  }
  
  public float getRotation() {
    float[] arrayOfFloat = this.val;
    return (float)Math.atan2(arrayOfFloat[1], arrayOfFloat[0]) * 57.295776F;
  }
  
  public float getRotationRad() {
    float[] arrayOfFloat = this.val;
    return (float)Math.atan2(arrayOfFloat[1], arrayOfFloat[0]);
  }
  
  public Vector2 getScale(Vector2 paramVector2) {
    float[] arrayOfFloat = this.val;
    paramVector2.x = (float)Math.sqrt((arrayOfFloat[0] * arrayOfFloat[0] + arrayOfFloat[3] * arrayOfFloat[3]));
    paramVector2.y = (float)Math.sqrt((arrayOfFloat[1] * arrayOfFloat[1] + arrayOfFloat[4] * arrayOfFloat[4]));
    return paramVector2;
  }
  
  public Vector2 getTranslation(Vector2 paramVector2) {
    float[] arrayOfFloat = this.val;
    paramVector2.x = arrayOfFloat[6];
    paramVector2.y = arrayOfFloat[7];
    return paramVector2;
  }
  
  public float[] getValues() { return this.val; }
  
  public Matrix3 idt() {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = 1.0F;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 1.0F;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public Matrix3 inv() {
    float f = det();
    if (f != 0.0F) {
      f = 1.0F / f;
      float[] arrayOfFloat1 = this.tmp;
      float[] arrayOfFloat2 = this.val;
      arrayOfFloat1[0] = arrayOfFloat2[4] * arrayOfFloat2[8] - arrayOfFloat2[5] * arrayOfFloat2[7];
      arrayOfFloat1[1] = arrayOfFloat2[2] * arrayOfFloat2[7] - arrayOfFloat2[1] * arrayOfFloat2[8];
      arrayOfFloat1[2] = arrayOfFloat2[1] * arrayOfFloat2[5] - arrayOfFloat2[2] * arrayOfFloat2[4];
      arrayOfFloat1[3] = arrayOfFloat2[5] * arrayOfFloat2[6] - arrayOfFloat2[3] * arrayOfFloat2[8];
      arrayOfFloat1[4] = arrayOfFloat2[0] * arrayOfFloat2[8] - arrayOfFloat2[2] * arrayOfFloat2[6];
      arrayOfFloat1[5] = arrayOfFloat2[2] * arrayOfFloat2[3] - arrayOfFloat2[0] * arrayOfFloat2[5];
      arrayOfFloat1[6] = arrayOfFloat2[3] * arrayOfFloat2[7] - arrayOfFloat2[4] * arrayOfFloat2[6];
      arrayOfFloat1[7] = arrayOfFloat2[1] * arrayOfFloat2[6] - arrayOfFloat2[0] * arrayOfFloat2[7];
      arrayOfFloat1[8] = arrayOfFloat2[0] * arrayOfFloat2[4] - arrayOfFloat2[1] * arrayOfFloat2[3];
      arrayOfFloat2[0] = arrayOfFloat1[0] * f;
      arrayOfFloat2[1] = arrayOfFloat1[1] * f;
      arrayOfFloat2[2] = arrayOfFloat1[2] * f;
      arrayOfFloat2[3] = arrayOfFloat1[3] * f;
      arrayOfFloat2[4] = arrayOfFloat1[4] * f;
      arrayOfFloat2[5] = arrayOfFloat1[5] * f;
      arrayOfFloat2[6] = arrayOfFloat1[6] * f;
      arrayOfFloat2[7] = arrayOfFloat1[7] * f;
      arrayOfFloat2[8] = f * arrayOfFloat1[8];
      return this;
    } 
    throw new GdxRuntimeException("Can't invert a singular matrix");
  }
  
  public Matrix3 mul(Matrix3 paramMatrix3) {
    float[] arrayOfFloat2 = this.val;
    float f1 = arrayOfFloat2[0];
    float[] arrayOfFloat1 = paramMatrix3.val;
    float f2 = arrayOfFloat1[0];
    float f3 = arrayOfFloat2[3];
    float f4 = arrayOfFloat1[1];
    float f5 = arrayOfFloat2[6];
    float f6 = arrayOfFloat1[2];
    float f7 = arrayOfFloat2[0];
    float f8 = arrayOfFloat1[3];
    float f9 = arrayOfFloat2[3];
    float f10 = arrayOfFloat1[4];
    float f11 = arrayOfFloat2[6];
    float f12 = arrayOfFloat1[5];
    float f13 = arrayOfFloat2[0];
    float f14 = arrayOfFloat1[6];
    float f15 = arrayOfFloat2[3];
    float f16 = arrayOfFloat1[7];
    float f17 = arrayOfFloat2[6];
    float f18 = arrayOfFloat1[8];
    float f19 = arrayOfFloat2[1];
    float f20 = arrayOfFloat1[0];
    float f21 = arrayOfFloat2[4];
    float f22 = arrayOfFloat1[1];
    float f23 = arrayOfFloat2[7];
    float f24 = arrayOfFloat1[2];
    float f25 = arrayOfFloat2[1];
    float f26 = arrayOfFloat1[3];
    float f27 = arrayOfFloat2[4];
    float f28 = arrayOfFloat1[4];
    float f29 = arrayOfFloat2[7];
    float f30 = arrayOfFloat1[5];
    float f31 = arrayOfFloat2[1];
    float f32 = arrayOfFloat1[6];
    float f33 = arrayOfFloat2[4];
    float f34 = arrayOfFloat1[7];
    float f35 = arrayOfFloat2[7];
    float f36 = arrayOfFloat1[8];
    float f37 = arrayOfFloat2[2];
    float f38 = arrayOfFloat1[0];
    float f39 = arrayOfFloat2[5];
    float f40 = arrayOfFloat1[1];
    float f41 = arrayOfFloat2[8];
    float f42 = arrayOfFloat1[2];
    float f43 = arrayOfFloat2[2];
    float f44 = arrayOfFloat1[3];
    float f45 = arrayOfFloat2[5];
    float f46 = arrayOfFloat1[4];
    float f47 = arrayOfFloat2[8];
    float f48 = arrayOfFloat1[5];
    float f49 = arrayOfFloat2[2];
    float f50 = arrayOfFloat1[6];
    float f51 = arrayOfFloat2[5];
    float f52 = arrayOfFloat1[7];
    float f53 = arrayOfFloat2[8];
    float f54 = arrayOfFloat1[8];
    arrayOfFloat2[0] = f1 * f2 + f3 * f4 + f5 * f6;
    arrayOfFloat2[1] = f19 * f20 + f21 * f22 + f23 * f24;
    arrayOfFloat2[2] = f37 * f38 + f39 * f40 + f41 * f42;
    arrayOfFloat2[3] = f7 * f8 + f9 * f10 + f11 * f12;
    arrayOfFloat2[4] = f25 * f26 + f27 * f28 + f29 * f30;
    arrayOfFloat2[5] = f43 * f44 + f45 * f46 + f47 * f48;
    arrayOfFloat2[6] = f13 * f14 + f15 * f16 + f17 * f18;
    arrayOfFloat2[7] = f31 * f32 + f33 * f34 + f35 * f36;
    arrayOfFloat2[8] = f49 * f50 + f51 * f52 + f53 * f54;
    return this;
  }
  
  public Matrix3 mulLeft(Matrix3 paramMatrix3) {
    float[] arrayOfFloat2 = this.val;
    float[] arrayOfFloat1 = paramMatrix3.val;
    float f1 = arrayOfFloat1[0];
    float f2 = arrayOfFloat2[0];
    float f3 = arrayOfFloat1[3];
    float f4 = arrayOfFloat2[1];
    float f5 = arrayOfFloat1[6];
    float f6 = arrayOfFloat2[2];
    float f7 = arrayOfFloat1[0];
    float f8 = arrayOfFloat2[3];
    float f9 = arrayOfFloat1[3];
    float f10 = arrayOfFloat2[4];
    float f11 = arrayOfFloat1[6];
    float f12 = arrayOfFloat2[5];
    float f13 = arrayOfFloat1[0];
    float f14 = arrayOfFloat2[6];
    float f15 = arrayOfFloat1[3];
    float f16 = arrayOfFloat2[7];
    float f17 = arrayOfFloat1[6];
    float f18 = arrayOfFloat2[8];
    float f19 = arrayOfFloat1[1];
    float f20 = arrayOfFloat2[0];
    float f21 = arrayOfFloat1[4];
    float f22 = arrayOfFloat2[1];
    float f23 = arrayOfFloat1[7];
    float f24 = arrayOfFloat2[2];
    float f25 = arrayOfFloat1[1];
    float f26 = arrayOfFloat2[3];
    float f27 = arrayOfFloat1[4];
    float f28 = arrayOfFloat2[4];
    float f29 = arrayOfFloat1[7];
    float f30 = arrayOfFloat2[5];
    float f31 = arrayOfFloat1[1];
    float f32 = arrayOfFloat2[6];
    float f33 = arrayOfFloat1[4];
    float f34 = arrayOfFloat2[7];
    float f35 = arrayOfFloat1[7];
    float f36 = arrayOfFloat2[8];
    float f37 = arrayOfFloat1[2];
    float f38 = arrayOfFloat2[0];
    float f39 = arrayOfFloat1[5];
    float f40 = arrayOfFloat2[1];
    float f41 = arrayOfFloat1[8];
    float f42 = arrayOfFloat2[2];
    float f43 = arrayOfFloat1[2];
    float f44 = arrayOfFloat2[3];
    float f45 = arrayOfFloat1[5];
    float f46 = arrayOfFloat2[4];
    float f47 = arrayOfFloat1[8];
    float f48 = arrayOfFloat2[5];
    float f49 = arrayOfFloat1[2];
    float f50 = arrayOfFloat2[6];
    float f51 = arrayOfFloat1[5];
    float f52 = arrayOfFloat2[7];
    float f53 = arrayOfFloat1[8];
    float f54 = arrayOfFloat2[8];
    arrayOfFloat2[0] = f1 * f2 + f3 * f4 + f5 * f6;
    arrayOfFloat2[1] = f19 * f20 + f21 * f22 + f23 * f24;
    arrayOfFloat2[2] = f37 * f38 + f39 * f40 + f41 * f42;
    arrayOfFloat2[3] = f7 * f8 + f9 * f10 + f11 * f12;
    arrayOfFloat2[4] = f25 * f26 + f27 * f28 + f29 * f30;
    arrayOfFloat2[5] = f43 * f44 + f45 * f46 + f47 * f48;
    arrayOfFloat2[6] = f13 * f14 + f15 * f16 + f17 * f18;
    arrayOfFloat2[7] = f31 * f32 + f33 * f34 + f35 * f36;
    arrayOfFloat2[8] = f49 * f50 + f51 * f52 + f53 * f54;
    return this;
  }
  
  public Matrix3 rotate(float paramFloat) { return rotateRad(paramFloat * 0.017453292F); }
  
  public Matrix3 rotateRad(float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    double d = paramFloat;
    float f = (float)Math.cos(d);
    paramFloat = (float)Math.sin(d);
    float[] arrayOfFloat = this.tmp;
    arrayOfFloat[0] = f;
    arrayOfFloat[1] = paramFloat;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = -paramFloat;
    arrayOfFloat[4] = f;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    mul(this.val, arrayOfFloat);
    return this;
  }
  
  public Matrix3 scale(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat = this.tmp;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = paramFloat2;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    mul(this.val, arrayOfFloat);
    return this;
  }
  
  public Matrix3 scale(Vector2 paramVector2) {
    float[] arrayOfFloat = this.tmp;
    arrayOfFloat[0] = paramVector2.x;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = paramVector2.y;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    mul(this.val, arrayOfFloat);
    return this;
  }
  
  public Matrix3 scl(float paramFloat) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = arrayOfFloat[0] * paramFloat;
    arrayOfFloat[4] = arrayOfFloat[4] * paramFloat;
    return this;
  }
  
  public Matrix3 scl(Vector2 paramVector2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = arrayOfFloat[0] * paramVector2.x;
    arrayOfFloat = this.val;
    arrayOfFloat[4] = arrayOfFloat[4] * paramVector2.y;
    return this;
  }
  
  public Matrix3 scl(Vector3 paramVector3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = arrayOfFloat[0] * paramVector3.x;
    arrayOfFloat = this.val;
    arrayOfFloat[4] = arrayOfFloat[4] * paramVector3.y;
    return this;
  }
  
  public Matrix3 set(Affine2 paramAffine2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = paramAffine2.m00;
    arrayOfFloat[1] = paramAffine2.m10;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = paramAffine2.m01;
    arrayOfFloat[4] = paramAffine2.m11;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = paramAffine2.m02;
    arrayOfFloat[7] = paramAffine2.m12;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public Matrix3 set(Matrix3 paramMatrix3) {
    float[] arrayOfFloat2 = paramMatrix3.val;
    float[] arrayOfFloat1 = this.val;
    System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, 0, arrayOfFloat1.length);
    return this;
  }
  
  public Matrix3 set(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = paramMatrix4.val[0];
    arrayOfFloat[1] = paramMatrix4.val[1];
    arrayOfFloat[2] = paramMatrix4.val[2];
    arrayOfFloat[3] = paramMatrix4.val[4];
    arrayOfFloat[4] = paramMatrix4.val[5];
    arrayOfFloat[5] = paramMatrix4.val[6];
    arrayOfFloat[6] = paramMatrix4.val[8];
    arrayOfFloat[7] = paramMatrix4.val[9];
    arrayOfFloat[8] = paramMatrix4.val[10];
    return this;
  }
  
  public Matrix3 set(float[] paramArrayOfFloat) {
    float[] arrayOfFloat = this.val;
    System.arraycopy(paramArrayOfFloat, 0, arrayOfFloat, 0, arrayOfFloat.length);
    return this;
  }
  
  public Matrix3 setToRotation(float paramFloat) { return setToRotationRad(paramFloat * 0.017453292F); }
  
  public Matrix3 setToRotation(Vector3 paramVector3, float paramFloat) { return setToRotation(paramVector3, MathUtils.cosDeg(paramFloat), MathUtils.sinDeg(paramFloat)); }
  
  public Matrix3 setToRotation(Vector3 paramVector3, float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat = this.val;
    float f = 1.0F - paramFloat1;
    arrayOfFloat[0] = paramVector3.x * f * paramVector3.x + paramFloat1;
    arrayOfFloat[1] = paramVector3.x * f * paramVector3.y - paramVector3.z * paramFloat2;
    arrayOfFloat[2] = paramVector3.z * f * paramVector3.x + paramVector3.y * paramFloat2;
    arrayOfFloat[3] = paramVector3.x * f * paramVector3.y + paramVector3.z * paramFloat2;
    arrayOfFloat[4] = paramVector3.y * f * paramVector3.y + paramFloat1;
    arrayOfFloat[5] = paramVector3.y * f * paramVector3.z - paramVector3.x * paramFloat2;
    arrayOfFloat[6] = paramVector3.z * f * paramVector3.x - paramVector3.y * paramFloat2;
    arrayOfFloat[7] = paramVector3.y * f * paramVector3.z + paramVector3.x * paramFloat2;
    arrayOfFloat[8] = f * paramVector3.z * paramVector3.z + paramFloat1;
    return this;
  }
  
  public Matrix3 setToRotationRad(float paramFloat) {
    double d = paramFloat;
    float f = (float)Math.cos(d);
    paramFloat = (float)Math.sin(d);
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = f;
    arrayOfFloat[1] = paramFloat;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = -paramFloat;
    arrayOfFloat[4] = f;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public Matrix3 setToScaling(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = paramFloat2;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public Matrix3 setToScaling(Vector2 paramVector2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = paramVector2.x;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = paramVector2.y;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = 0.0F;
    arrayOfFloat[7] = 0.0F;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public Matrix3 setToTranslation(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = 1.0F;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 1.0F;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = paramFloat1;
    arrayOfFloat[7] = paramFloat2;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public Matrix3 setToTranslation(Vector2 paramVector2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[0] = 1.0F;
    arrayOfFloat[1] = 0.0F;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 1.0F;
    arrayOfFloat[5] = 0.0F;
    arrayOfFloat[6] = paramVector2.x;
    arrayOfFloat[7] = paramVector2.y;
    arrayOfFloat[8] = 1.0F;
    return this;
  }
  
  public String toString() {
    float[] arrayOfFloat = this.val;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(arrayOfFloat[0]);
    stringBuilder.append("|");
    stringBuilder.append(arrayOfFloat[3]);
    stringBuilder.append("|");
    stringBuilder.append(arrayOfFloat[6]);
    stringBuilder.append("]\n[");
    stringBuilder.append(arrayOfFloat[1]);
    stringBuilder.append("|");
    stringBuilder.append(arrayOfFloat[4]);
    stringBuilder.append("|");
    stringBuilder.append(arrayOfFloat[7]);
    stringBuilder.append("]\n[");
    stringBuilder.append(arrayOfFloat[2]);
    stringBuilder.append("|");
    stringBuilder.append(arrayOfFloat[5]);
    stringBuilder.append("|");
    stringBuilder.append(arrayOfFloat[8]);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
  
  public Matrix3 translate(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat1 = this.val;
    float[] arrayOfFloat2 = this.tmp;
    arrayOfFloat2[0] = 1.0F;
    arrayOfFloat2[1] = 0.0F;
    arrayOfFloat2[2] = 0.0F;
    arrayOfFloat2[3] = 0.0F;
    arrayOfFloat2[4] = 1.0F;
    arrayOfFloat2[5] = 0.0F;
    arrayOfFloat2[6] = paramFloat1;
    arrayOfFloat2[7] = paramFloat2;
    arrayOfFloat2[8] = 1.0F;
    mul(arrayOfFloat1, arrayOfFloat2);
    return this;
  }
  
  public Matrix3 translate(Vector2 paramVector2) {
    float[] arrayOfFloat2 = this.val;
    float[] arrayOfFloat3 = this.tmp;
    arrayOfFloat3[0] = 1.0F;
    arrayOfFloat3[1] = 0.0F;
    arrayOfFloat3[2] = 0.0F;
    arrayOfFloat3[3] = 0.0F;
    arrayOfFloat3[4] = 1.0F;
    arrayOfFloat3[5] = 0.0F;
    arrayOfFloat3[6] = paramVector2.x;
    this.tmp[7] = paramVector2.y;
    float[] arrayOfFloat1 = this.tmp;
    arrayOfFloat1[8] = 1.0F;
    mul(arrayOfFloat2, arrayOfFloat1);
    return this;
  }
  
  public Matrix3 transpose() {
    float[] arrayOfFloat = this.val;
    float f1 = arrayOfFloat[1];
    float f2 = arrayOfFloat[2];
    float f3 = arrayOfFloat[3];
    float f4 = arrayOfFloat[5];
    float f5 = arrayOfFloat[6];
    float f6 = arrayOfFloat[7];
    arrayOfFloat[3] = f1;
    arrayOfFloat[6] = f2;
    arrayOfFloat[1] = f3;
    arrayOfFloat[7] = f4;
    arrayOfFloat[2] = f5;
    arrayOfFloat[5] = f6;
    return this;
  }
  
  public Matrix3 trn(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[6] = arrayOfFloat[6] + paramFloat1;
    arrayOfFloat[7] = arrayOfFloat[7] + paramFloat2;
    return this;
  }
  
  public Matrix3 trn(Vector2 paramVector2) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[6] = arrayOfFloat[6] + paramVector2.x;
    arrayOfFloat = this.val;
    arrayOfFloat[7] = arrayOfFloat[7] + paramVector2.y;
    return this;
  }
  
  public Matrix3 trn(Vector3 paramVector3) {
    float[] arrayOfFloat = this.val;
    arrayOfFloat[6] = arrayOfFloat[6] + paramVector3.x;
    arrayOfFloat = this.val;
    arrayOfFloat[7] = arrayOfFloat[7] + paramVector3.y;
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Matrix3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */