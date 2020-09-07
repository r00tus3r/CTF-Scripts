package com.badlogic.gdx.math;

public class Polyline implements Shape2D {
  private boolean calculateLength = true;
  
  private boolean calculateScaledLength = true;
  
  private boolean dirty = true;
  
  private float length;
  
  private float[] localVertices;
  
  private float originX;
  
  private float originY;
  
  private float rotation;
  
  private float scaleX = 1.0F;
  
  private float scaleY = 1.0F;
  
  private float scaledLength;
  
  private float[] worldVertices;
  
  private float x;
  
  private float y;
  
  public Polyline() { this.localVertices = new float[0]; }
  
  public Polyline(float[] paramArrayOfFloat) {
    if (paramArrayOfFloat.length >= 4) {
      this.localVertices = paramArrayOfFloat;
      return;
    } 
    throw new IllegalArgumentException("polylines must contain at least 2 points.");
  }
  
  public void calculateLength() { this.calculateLength = true; }
  
  public void calculateScaledLength() { this.calculateScaledLength = true; }
  
  public boolean contains(float paramFloat1, float paramFloat2) { return false; }
  
  public boolean contains(Vector2 paramVector2) { return false; }
  
  public void dirty() { this.dirty = true; }
  
  public float getLength() {
    if (!this.calculateLength)
      return this.length; 
    byte b = 0;
    this.calculateLength = false;
    this.length = 0.0F;
    int i = this.localVertices.length;
    while (b < i - 2) {
      float[] arrayOfFloat = this.localVertices;
      byte b1 = b + 2;
      float f1 = arrayOfFloat[b1] - arrayOfFloat[b];
      float f2 = arrayOfFloat[b + true] - arrayOfFloat[b + 3];
      this.length += (float)Math.sqrt((f1 * f1 + f2 * f2));
      b = b1;
    } 
    return this.length;
  }
  
  public float getOriginX() { return this.originX; }
  
  public float getOriginY() { return this.originY; }
  
  public float getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scaleX; }
  
  public float getScaleY() { return this.scaleY; }
  
  public float getScaledLength() {
    if (!this.calculateScaledLength)
      return this.scaledLength; 
    byte b = 0;
    this.calculateScaledLength = false;
    this.scaledLength = 0.0F;
    int i = this.localVertices.length;
    while (b < i - 2) {
      float[] arrayOfFloat = this.localVertices;
      byte b1 = b + 2;
      float f1 = arrayOfFloat[b1];
      float f2 = this.scaleX;
      f1 = f1 * f2 - arrayOfFloat[b] * f2;
      f2 = arrayOfFloat[b + true];
      float f3 = this.scaleY;
      f2 = f2 * f3 - arrayOfFloat[b + 3] * f3;
      this.scaledLength += (float)Math.sqrt((f1 * f1 + f2 * f2));
      b = b1;
    } 
    return this.scaledLength;
  }
  
  public float[] getTransformedVertices() {
    boolean bool2;
    if (!this.dirty)
      return this.worldVertices; 
    boolean bool1 = false;
    this.dirty = false;
    float[] arrayOfFloat1 = this.localVertices;
    float[] arrayOfFloat2 = this.worldVertices;
    if (arrayOfFloat2 == null || arrayOfFloat2.length < arrayOfFloat1.length)
      this.worldVertices = new float[arrayOfFloat1.length]; 
    arrayOfFloat2 = this.worldVertices;
    float f1 = this.x;
    float f2 = this.y;
    float f3 = this.originX;
    float f4 = this.originY;
    float f5 = this.scaleX;
    float f6 = this.scaleY;
    if (f5 != 1.0F || f6 != 1.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    float f7 = this.rotation;
    float f8 = MathUtils.cosDeg(f7);
    float f9 = MathUtils.sinDeg(f7);
    int i = arrayOfFloat1.length;
    while (bool1 < i) {
      float f10 = arrayOfFloat1[bool1] - f3;
      boolean bool = bool1 + true;
      float f11 = arrayOfFloat1[bool] - f4;
      float f12 = f10;
      float f13 = f11;
      if (bool2) {
        f12 = f10 * f5;
        f13 = f11 * f6;
      } 
      f10 = f12;
      f11 = f13;
      if (f7 != 0.0F) {
        f11 = f12 * f9 + f13 * f8;
        f10 = f8 * f12 - f9 * f13;
      } 
      arrayOfFloat2[bool1] = f10 + f1 + f3;
      arrayOfFloat2[bool] = f2 + f11 + f4;
      bool1 += true;
    } 
    return arrayOfFloat2;
  }
  
  public float[] getVertices() { return this.localVertices; }
  
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public void rotate(float paramFloat) {
    this.rotation += paramFloat;
    this.dirty = true;
  }
  
  public void scale(float paramFloat) {
    this.scaleX += paramFloat;
    this.scaleY += paramFloat;
    this.dirty = true;
    this.calculateScaledLength = true;
  }
  
  public void setOrigin(float paramFloat1, float paramFloat2) {
    this.originX = paramFloat1;
    this.originY = paramFloat2;
    this.dirty = true;
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.dirty = true;
  }
  
  public void setRotation(float paramFloat) {
    this.rotation = paramFloat;
    this.dirty = true;
  }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    this.scaleX = paramFloat1;
    this.scaleY = paramFloat2;
    this.dirty = true;
    this.calculateScaledLength = true;
  }
  
  public void setVertices(float[] paramArrayOfFloat) {
    if (paramArrayOfFloat.length >= 4) {
      this.localVertices = paramArrayOfFloat;
      this.dirty = true;
      return;
    } 
    throw new IllegalArgumentException("polylines must contain at least 2 points.");
  }
  
  public void translate(float paramFloat1, float paramFloat2) {
    this.x += paramFloat1;
    this.y += paramFloat2;
    this.dirty = true;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Polyline.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */