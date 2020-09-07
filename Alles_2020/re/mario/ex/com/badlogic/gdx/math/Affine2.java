package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.Serializable;

public final class Affine2 implements Serializable {
  private static final long serialVersionUID = 1524569123485049187L;
  
  public float m00 = 1.0F;
  
  public float m01 = 0.0F;
  
  public float m02 = 0.0F;
  
  public float m10 = 0.0F;
  
  public float m11 = 1.0F;
  
  public float m12 = 0.0F;
  
  public Affine2() {}
  
  public Affine2(Affine2 paramAffine2) { set(paramAffine2); }
  
  public void applyTo(Vector2 paramVector2) {
    float f1 = paramVector2.x;
    float f2 = paramVector2.y;
    paramVector2.x = this.m00 * f1 + this.m01 * f2 + this.m02;
    paramVector2.y = this.m10 * f1 + this.m11 * f2 + this.m12;
  }
  
  public float det() { return this.m00 * this.m11 - this.m01 * this.m10; }
  
  public Vector2 getTranslation(Vector2 paramVector2) {
    paramVector2.x = this.m02;
    paramVector2.y = this.m12;
    return paramVector2;
  }
  
  public Affine2 idt() {
    this.m00 = 1.0F;
    this.m01 = 0.0F;
    this.m02 = 0.0F;
    this.m10 = 0.0F;
    this.m11 = 1.0F;
    this.m12 = 0.0F;
    return this;
  }
  
  public Affine2 inv() {
    float f = det();
    if (f != 0.0F) {
      float f1 = 1.0F / f;
      f = this.m11;
      float f2 = this.m01;
      float f3 = -f2;
      float f4 = this.m12;
      float f5 = this.m02;
      float f6 = this.m10;
      float f7 = -f6;
      float f8 = this.m00;
      this.m00 = f * f1;
      this.m01 = f3 * f1;
      this.m02 = (f2 * f4 - f * f5) * f1;
      this.m10 = f7 * f1;
      this.m11 = f8 * f1;
      this.m12 = f1 * (f6 * f5 - f4 * f8);
      return this;
    } 
    throw new GdxRuntimeException("Can't invert a singular affine matrix");
  }
  
  public boolean isIdt() {
    boolean bool;
    if (this.m00 == 1.0F && this.m02 == 0.0F && this.m12 == 0.0F && this.m11 == 1.0F && this.m01 == 0.0F && this.m10 == 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isTranslation() {
    boolean bool;
    if (this.m00 == 1.0F && this.m11 == 1.0F && this.m01 == 0.0F && this.m10 == 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Affine2 mul(Affine2 paramAffine2) {
    float f1 = this.m00;
    float f2 = paramAffine2.m00;
    float f3 = this.m01;
    float f4 = paramAffine2.m10;
    float f5 = paramAffine2.m01;
    float f6 = paramAffine2.m11;
    float f7 = paramAffine2.m02;
    float f8 = paramAffine2.m12;
    float f9 = this.m02;
    float f10 = this.m10;
    float f11 = this.m11;
    float f12 = this.m12;
    this.m00 = f1 * f2 + f3 * f4;
    this.m01 = f1 * f5 + f3 * f6;
    this.m02 = f1 * f7 + f3 * f8 + f9;
    this.m10 = f2 * f10 + f4 * f11;
    this.m11 = f5 * f10 + f6 * f11;
    this.m12 = f10 * f7 + f11 * f8 + f12;
    return this;
  }
  
  public Affine2 preMul(Affine2 paramAffine2) {
    float f1 = paramAffine2.m00;
    float f2 = this.m00;
    float f3 = paramAffine2.m01;
    float f4 = this.m10;
    float f5 = this.m01;
    float f6 = this.m11;
    float f7 = this.m02;
    float f8 = this.m12;
    float f9 = paramAffine2.m02;
    float f10 = paramAffine2.m10;
    float f11 = paramAffine2.m11;
    float f12 = paramAffine2.m12;
    this.m00 = f1 * f2 + f3 * f4;
    this.m01 = f1 * f5 + f3 * f6;
    this.m02 = f1 * f7 + f3 * f8 + f9;
    this.m10 = f2 * f10 + f4 * f11;
    this.m11 = f5 * f10 + f6 * f11;
    this.m12 = f10 * f7 + f11 * f8 + f12;
    return this;
  }
  
  public Affine2 preRotate(float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    float f1 = MathUtils.cosDeg(paramFloat);
    paramFloat = MathUtils.sinDeg(paramFloat);
    float f2 = this.m00;
    float f3 = this.m10;
    float f4 = this.m01;
    float f5 = this.m11;
    float f6 = this.m02;
    float f7 = this.m12;
    this.m00 = f1 * f2 - paramFloat * f3;
    this.m01 = f1 * f4 - paramFloat * f5;
    this.m02 = f1 * f6 - paramFloat * f7;
    this.m10 = f2 * paramFloat + f3 * f1;
    this.m11 = f4 * paramFloat + f5 * f1;
    this.m12 = paramFloat * f6 + f1 * f7;
    return this;
  }
  
  public Affine2 preRotateRad(float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    float f1 = MathUtils.cos(paramFloat);
    float f2 = MathUtils.sin(paramFloat);
    float f3 = this.m00;
    float f4 = this.m10;
    float f5 = this.m01;
    float f6 = this.m11;
    float f7 = this.m02;
    paramFloat = this.m12;
    this.m00 = f1 * f3 - f2 * f4;
    this.m01 = f1 * f5 - f2 * f6;
    this.m02 = f1 * f7 - f2 * paramFloat;
    this.m10 = f3 * f2 + f4 * f1;
    this.m11 = f5 * f2 + f6 * f1;
    this.m12 = f2 * f7 + f1 * paramFloat;
    return this;
  }
  
  public Affine2 preScale(float paramFloat1, float paramFloat2) {
    this.m00 *= paramFloat1;
    this.m01 *= paramFloat1;
    this.m02 *= paramFloat1;
    this.m10 *= paramFloat2;
    this.m11 *= paramFloat2;
    this.m12 *= paramFloat2;
    return this;
  }
  
  public Affine2 preScale(Vector2 paramVector2) { return preScale(paramVector2.x, paramVector2.y); }
  
  public Affine2 preShear(float paramFloat1, float paramFloat2) {
    float f1 = this.m00;
    float f2 = this.m10;
    float f3 = this.m01;
    float f4 = this.m11;
    float f5 = this.m02;
    float f6 = this.m12;
    this.m00 = paramFloat1 * f2 + f1;
    this.m01 = paramFloat1 * f4 + f3;
    this.m02 = paramFloat1 * f6 + f5;
    this.m10 = f2 + f1 * paramFloat2;
    this.m11 = f4 + f3 * paramFloat2;
    this.m12 = f6 + paramFloat2 * f5;
    return this;
  }
  
  public Affine2 preShear(Vector2 paramVector2) { return preShear(paramVector2.x, paramVector2.y); }
  
  public Affine2 preTranslate(float paramFloat1, float paramFloat2) {
    this.m02 += paramFloat1;
    this.m12 += paramFloat2;
    return this;
  }
  
  public Affine2 preTranslate(Vector2 paramVector2) { return preTranslate(paramVector2.x, paramVector2.y); }
  
  public Affine2 rotate(float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    float f1 = MathUtils.cosDeg(paramFloat);
    float f2 = MathUtils.sinDeg(paramFloat);
    float f3 = this.m00;
    paramFloat = this.m01;
    float f4 = -f2;
    float f5 = this.m10;
    float f6 = this.m11;
    this.m00 = f3 * f1 + paramFloat * f2;
    this.m01 = f3 * f4 + paramFloat * f1;
    this.m10 = f5 * f1 + f2 * f6;
    this.m11 = f5 * f4 + f6 * f1;
    return this;
  }
  
  public Affine2 rotateRad(float paramFloat) {
    if (paramFloat == 0.0F)
      return this; 
    float f1 = MathUtils.cos(paramFloat);
    float f2 = MathUtils.sin(paramFloat);
    float f3 = this.m00;
    float f4 = this.m01;
    float f5 = -f2;
    float f6 = this.m10;
    paramFloat = this.m11;
    this.m00 = f3 * f1 + f4 * f2;
    this.m01 = f3 * f5 + f4 * f1;
    this.m10 = f6 * f1 + f2 * paramFloat;
    this.m11 = f6 * f5 + paramFloat * f1;
    return this;
  }
  
  public Affine2 scale(float paramFloat1, float paramFloat2) {
    this.m00 *= paramFloat1;
    this.m01 *= paramFloat2;
    this.m10 *= paramFloat1;
    this.m11 *= paramFloat2;
    return this;
  }
  
  public Affine2 scale(Vector2 paramVector2) { return scale(paramVector2.x, paramVector2.y); }
  
  public Affine2 set(Affine2 paramAffine2) {
    this.m00 = paramAffine2.m00;
    this.m01 = paramAffine2.m01;
    this.m02 = paramAffine2.m02;
    this.m10 = paramAffine2.m10;
    this.m11 = paramAffine2.m11;
    this.m12 = paramAffine2.m12;
    return this;
  }
  
  public Affine2 set(Matrix3 paramMatrix3) {
    float[] arrayOfFloat = paramMatrix3.val;
    this.m00 = arrayOfFloat[0];
    this.m01 = arrayOfFloat[3];
    this.m02 = arrayOfFloat[6];
    this.m10 = arrayOfFloat[1];
    this.m11 = arrayOfFloat[4];
    this.m12 = arrayOfFloat[7];
    return this;
  }
  
  public Affine2 set(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.val;
    this.m00 = arrayOfFloat[0];
    this.m01 = arrayOfFloat[4];
    this.m02 = arrayOfFloat[12];
    this.m10 = arrayOfFloat[1];
    this.m11 = arrayOfFloat[5];
    this.m12 = arrayOfFloat[13];
    return this;
  }
  
  public Affine2 setToProduct(Affine2 paramAffine21, Affine2 paramAffine22) {
    float f1 = paramAffine21.m00;
    float f2 = paramAffine22.m00;
    float f3 = paramAffine21.m01;
    float f4 = paramAffine22.m10;
    this.m00 = f1 * f2 + f3 * f4;
    f1 = paramAffine21.m00;
    float f5 = paramAffine22.m01;
    f2 = paramAffine22.m11;
    this.m01 = f5 * f1 + f3 * f2;
    float f6 = paramAffine22.m02;
    f5 = paramAffine21.m01;
    f3 = paramAffine22.m12;
    this.m02 = f1 * f6 + f5 * f3 + paramAffine21.m02;
    f6 = paramAffine21.m10;
    f5 = paramAffine22.m00;
    f1 = paramAffine21.m11;
    this.m10 = f6 * f5 + f4 * f1;
    f4 = paramAffine21.m10;
    this.m11 = paramAffine22.m01 * f4 + f1 * f2;
    this.m12 = f4 * paramAffine22.m02 + paramAffine21.m11 * f3 + paramAffine21.m12;
    return this;
  }
  
  public Affine2 setToRotation(float paramFloat) {
    float f = MathUtils.cosDeg(paramFloat);
    paramFloat = MathUtils.sinDeg(paramFloat);
    this.m00 = f;
    this.m01 = -paramFloat;
    this.m02 = 0.0F;
    this.m10 = paramFloat;
    this.m11 = f;
    this.m12 = 0.0F;
    return this;
  }
  
  public Affine2 setToRotation(float paramFloat1, float paramFloat2) {
    this.m00 = paramFloat1;
    this.m01 = -paramFloat2;
    this.m02 = 0.0F;
    this.m10 = paramFloat2;
    this.m11 = paramFloat1;
    this.m12 = 0.0F;
    return this;
  }
  
  public Affine2 setToRotationRad(float paramFloat) {
    float f = MathUtils.cos(paramFloat);
    paramFloat = MathUtils.sin(paramFloat);
    this.m00 = f;
    this.m01 = -paramFloat;
    this.m02 = 0.0F;
    this.m10 = paramFloat;
    this.m11 = f;
    this.m12 = 0.0F;
    return this;
  }
  
  public Affine2 setToScaling(float paramFloat1, float paramFloat2) {
    this.m00 = paramFloat1;
    this.m01 = 0.0F;
    this.m02 = 0.0F;
    this.m10 = 0.0F;
    this.m11 = paramFloat2;
    this.m12 = 0.0F;
    return this;
  }
  
  public Affine2 setToScaling(Vector2 paramVector2) { return setToScaling(paramVector2.x, paramVector2.y); }
  
  public Affine2 setToShearing(float paramFloat1, float paramFloat2) {
    this.m00 = 1.0F;
    this.m01 = paramFloat1;
    this.m02 = 0.0F;
    this.m10 = paramFloat2;
    this.m11 = 1.0F;
    this.m12 = 0.0F;
    return this;
  }
  
  public Affine2 setToShearing(Vector2 paramVector2) { return setToShearing(paramVector2.x, paramVector2.y); }
  
  public Affine2 setToTranslation(float paramFloat1, float paramFloat2) {
    this.m00 = 1.0F;
    this.m01 = 0.0F;
    this.m02 = paramFloat1;
    this.m10 = 0.0F;
    this.m11 = 1.0F;
    this.m12 = paramFloat2;
    return this;
  }
  
  public Affine2 setToTranslation(Vector2 paramVector2) { return setToTranslation(paramVector2.x, paramVector2.y); }
  
  public Affine2 setToTrnRotRadScl(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    this.m02 = paramFloat1;
    this.m12 = paramFloat2;
    if (paramFloat3 == 0.0F) {
      this.m00 = paramFloat4;
      this.m01 = 0.0F;
      this.m10 = 0.0F;
      this.m11 = paramFloat5;
    } else {
      paramFloat1 = MathUtils.sin(paramFloat3);
      paramFloat2 = MathUtils.cos(paramFloat3);
      this.m00 = paramFloat2 * paramFloat4;
      this.m01 = -paramFloat1 * paramFloat5;
      this.m10 = paramFloat1 * paramFloat4;
      this.m11 = paramFloat2 * paramFloat5;
    } 
    return this;
  }
  
  public Affine2 setToTrnRotRadScl(Vector2 paramVector21, float paramFloat, Vector2 paramVector22) { return setToTrnRotRadScl(paramVector21.x, paramVector21.y, paramFloat, paramVector22.x, paramVector22.y); }
  
  public Affine2 setToTrnRotScl(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    this.m02 = paramFloat1;
    this.m12 = paramFloat2;
    if (paramFloat3 == 0.0F) {
      this.m00 = paramFloat4;
      this.m01 = 0.0F;
      this.m10 = 0.0F;
      this.m11 = paramFloat5;
    } else {
      paramFloat1 = MathUtils.sinDeg(paramFloat3);
      paramFloat2 = MathUtils.cosDeg(paramFloat3);
      this.m00 = paramFloat2 * paramFloat4;
      this.m01 = -paramFloat1 * paramFloat5;
      this.m10 = paramFloat1 * paramFloat4;
      this.m11 = paramFloat2 * paramFloat5;
    } 
    return this;
  }
  
  public Affine2 setToTrnRotScl(Vector2 paramVector21, float paramFloat, Vector2 paramVector22) { return setToTrnRotScl(paramVector21.x, paramVector21.y, paramFloat, paramVector22.x, paramVector22.y); }
  
  public Affine2 setToTrnScl(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.m00 = paramFloat3;
    this.m01 = 0.0F;
    this.m02 = paramFloat1;
    this.m10 = 0.0F;
    this.m11 = paramFloat4;
    this.m12 = paramFloat2;
    return this;
  }
  
  public Affine2 setToTrnScl(Vector2 paramVector21, Vector2 paramVector22) { return setToTrnScl(paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y); }
  
  public Affine2 shear(float paramFloat1, float paramFloat2) {
    float f1 = this.m00;
    float f2 = this.m01;
    this.m00 = paramFloat2 * f2 + f1;
    this.m01 = f2 + f1 * paramFloat1;
    f1 = this.m10;
    f2 = this.m11;
    this.m10 = paramFloat2 * f2 + f1;
    this.m11 = f2 + paramFloat1 * f1;
    return this;
  }
  
  public Affine2 shear(Vector2 paramVector2) { return shear(paramVector2.x, paramVector2.y); }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.m00);
    stringBuilder.append("|");
    stringBuilder.append(this.m01);
    stringBuilder.append("|");
    stringBuilder.append(this.m02);
    stringBuilder.append("]\n[");
    stringBuilder.append(this.m10);
    stringBuilder.append("|");
    stringBuilder.append(this.m11);
    stringBuilder.append("|");
    stringBuilder.append(this.m12);
    stringBuilder.append("]\n[0.0|0.0|0.1]");
    return stringBuilder.toString();
  }
  
  public Affine2 translate(float paramFloat1, float paramFloat2) {
    this.m02 += this.m00 * paramFloat1 + this.m01 * paramFloat2;
    this.m12 += this.m10 * paramFloat1 + this.m11 * paramFloat2;
    return this;
  }
  
  public Affine2 translate(Vector2 paramVector2) { return translate(paramVector2.x, paramVector2.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Affine2.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */