package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Circle implements Serializable, Shape2D {
  public float radius;
  
  public float x;
  
  public float y;
  
  public Circle() {}
  
  public Circle(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.radius = paramFloat3;
  }
  
  public Circle(Circle paramCircle) {
    this.x = paramCircle.x;
    this.y = paramCircle.y;
    this.radius = paramCircle.radius;
  }
  
  public Circle(Vector2 paramVector2, float paramFloat) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    this.radius = paramFloat;
  }
  
  public Circle(Vector2 paramVector21, Vector2 paramVector22) {
    this.x = paramVector21.x;
    this.y = paramVector21.y;
    this.radius = Vector2.len(paramVector21.x - paramVector22.x, paramVector21.y - paramVector22.y);
  }
  
  public float area() {
    float f = this.radius;
    return f * f * 3.1415927F;
  }
  
  public float circumference() { return this.radius * 6.2831855F; }
  
  public boolean contains(float paramFloat1, float paramFloat2) {
    boolean bool;
    paramFloat1 = this.x - paramFloat1;
    float f = this.y - paramFloat2;
    paramFloat2 = this.radius;
    if (paramFloat1 * paramFloat1 + f * f <= paramFloat2 * paramFloat2) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean contains(Circle paramCircle) {
    float f1 = this.radius;
    float f2 = paramCircle.radius;
    float f3 = f1 - f2;
    byte b = 0;
    if (f3 < 0.0F)
      return false; 
    float f4 = this.x - paramCircle.x;
    float f5 = this.y - paramCircle.y;
    f4 = f4 * f4 + f5 * f5;
    f1 += f2;
    int i = b;
    if (f3 * f3 >= f4) {
      i = b;
      if (f4 < f1 * f1)
        i = 1; 
    } 
    return i;
  }
  
  public boolean contains(Vector2 paramVector2) {
    boolean bool;
    float f1 = this.x - paramVector2.x;
    float f2 = this.y - paramVector2.y;
    float f3 = this.radius;
    if (f1 * f1 + f2 * f2 <= f3 * f3) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (paramObject == this)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (Circle)paramObject;
    if (this.x != paramObject.x || this.y != paramObject.y || this.radius != paramObject.radius)
      bool = false; 
    return bool;
  }
  
  public int hashCode() { return ((NumberUtils.floatToRawIntBits(this.radius) + 41) * 41 + NumberUtils.floatToRawIntBits(this.x)) * 41 + NumberUtils.floatToRawIntBits(this.y); }
  
  public boolean overlaps(Circle paramCircle) {
    boolean bool;
    float f1 = this.x - paramCircle.x;
    float f2 = this.y - paramCircle.y;
    float f3 = this.radius + paramCircle.radius;
    if (f1 * f1 + f2 * f2 < f3 * f3) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.radius = paramFloat3;
  }
  
  public void set(Circle paramCircle) {
    this.x = paramCircle.x;
    this.y = paramCircle.y;
    this.radius = paramCircle.radius;
  }
  
  public void set(Vector2 paramVector2, float paramFloat) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    this.radius = paramFloat;
  }
  
  public void set(Vector2 paramVector21, Vector2 paramVector22) {
    this.x = paramVector21.x;
    this.y = paramVector21.y;
    this.radius = Vector2.len(paramVector21.x - paramVector22.x, paramVector21.y - paramVector22.y);
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
  }
  
  public void setPosition(Vector2 paramVector2) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
  }
  
  public void setRadius(float paramFloat) { this.radius = paramFloat; }
  
  public void setX(float paramFloat) { this.x = paramFloat; }
  
  public void setY(float paramFloat) { this.y = paramFloat; }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.x);
    stringBuilder.append(",");
    stringBuilder.append(this.y);
    stringBuilder.append(",");
    stringBuilder.append(this.radius);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Circle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */