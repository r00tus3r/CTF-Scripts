package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Ellipse implements Serializable, Shape2D {
  private static final long serialVersionUID = 7381533206532032099L;
  
  public float height;
  
  public float width;
  
  public float x;
  
  public float y;
  
  public Ellipse() {}
  
  public Ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.width = paramFloat3;
    this.height = paramFloat4;
  }
  
  public Ellipse(Circle paramCircle) {
    this.x = paramCircle.x;
    this.y = paramCircle.y;
    this.width = paramCircle.radius * 2.0F;
    this.height = paramCircle.radius * 2.0F;
  }
  
  public Ellipse(Ellipse paramEllipse) {
    this.x = paramEllipse.x;
    this.y = paramEllipse.y;
    this.width = paramEllipse.width;
    this.height = paramEllipse.height;
  }
  
  public Ellipse(Vector2 paramVector2, float paramFloat1, float paramFloat2) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    this.width = paramFloat1;
    this.height = paramFloat2;
  }
  
  public Ellipse(Vector2 paramVector21, Vector2 paramVector22) {
    this.x = paramVector21.x;
    this.y = paramVector21.y;
    this.width = paramVector22.x;
    this.height = paramVector22.y;
  }
  
  public float area() { return this.width * this.height * 3.1415927F / 4.0F; }
  
  public float circumference() {
    float f1 = this.width / 2.0F;
    float f2 = this.height / 2.0F;
    float f3 = f1 * 3.0F;
    if (f3 > f2 || f2 * 3.0F > f1) {
      double d1 = ((f1 + f2) * 3.0F);
      double d2 = Math.sqrt(((f3 + f2) * (f1 + f2 * 3.0F)));
      Double.isNaN(d1);
      return (float)((d1 - d2) * 3.1415927410125732D);
    } 
    return (float)(Math.sqrt(((f1 * f1 + f2 * f2) / 2.0F)) * 6.2831854820251465D);
  }
  
  public boolean contains(float paramFloat1, float paramFloat2) {
    boolean bool;
    float f = paramFloat1 - this.x;
    paramFloat1 = paramFloat2 - this.y;
    paramFloat2 = this.width;
    f = f * f / paramFloat2 * 0.5F * paramFloat2 * 0.5F;
    paramFloat2 = this.height;
    if (f + paramFloat1 * paramFloat1 / paramFloat2 * 0.5F * paramFloat2 * 0.5F <= 1.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean contains(Vector2 paramVector2) { return contains(paramVector2.x, paramVector2.y); }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (paramObject == this)
      return true; 
    if (paramObject == null || paramObject.getClass() != getClass())
      return false; 
    paramObject = (Ellipse)paramObject;
    if (this.x != paramObject.x || this.y != paramObject.y || this.width != paramObject.width || this.height != paramObject.height)
      bool = false; 
    return bool;
  }
  
  public int hashCode() { return (((NumberUtils.floatToRawIntBits(this.height) + 53) * 53 + NumberUtils.floatToRawIntBits(this.width)) * 53 + NumberUtils.floatToRawIntBits(this.x)) * 53 + NumberUtils.floatToRawIntBits(this.y); }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.width = paramFloat3;
    this.height = paramFloat4;
  }
  
  public void set(Circle paramCircle) {
    this.x = paramCircle.x;
    this.y = paramCircle.y;
    this.width = paramCircle.radius * 2.0F;
    this.height = paramCircle.radius * 2.0F;
  }
  
  public void set(Ellipse paramEllipse) {
    this.x = paramEllipse.x;
    this.y = paramEllipse.y;
    this.width = paramEllipse.width;
    this.height = paramEllipse.height;
  }
  
  public void set(Vector2 paramVector21, Vector2 paramVector22) {
    this.x = paramVector21.x;
    this.y = paramVector21.y;
    this.width = paramVector22.x;
    this.height = paramVector22.y;
  }
  
  public Ellipse setPosition(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    return this;
  }
  
  public Ellipse setPosition(Vector2 paramVector2) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    return this;
  }
  
  public Ellipse setSize(float paramFloat1, float paramFloat2) {
    this.width = paramFloat1;
    this.height = paramFloat2;
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Ellipse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */