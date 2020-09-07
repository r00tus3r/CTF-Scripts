package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Rectangle implements Serializable, Shape2D {
  private static final long serialVersionUID = 5733252015138115702L;
  
  public static final Rectangle tmp = new Rectangle();
  
  public static final Rectangle tmp2 = new Rectangle();
  
  public float height;
  
  public float width;
  
  public float x;
  
  public float y;
  
  public Rectangle() {}
  
  public Rectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.width = paramFloat3;
    this.height = paramFloat4;
  }
  
  public Rectangle(Rectangle paramRectangle) {
    this.x = paramRectangle.x;
    this.y = paramRectangle.y;
    this.width = paramRectangle.width;
    this.height = paramRectangle.height;
  }
  
  public float area() { return this.width * this.height; }
  
  public boolean contains(float paramFloat1, float paramFloat2) {
    float f = this.x;
    if (f <= paramFloat1 && f + this.width >= paramFloat1) {
      paramFloat1 = this.y;
      if (paramFloat1 <= paramFloat2 && paramFloat1 + this.height >= paramFloat2)
        return true; 
    } 
    return false;
  }
  
  public boolean contains(Circle paramCircle) {
    boolean bool;
    if (paramCircle.x - paramCircle.radius >= this.x && paramCircle.x + paramCircle.radius <= this.x + this.width && paramCircle.y - paramCircle.radius >= this.y && paramCircle.y + paramCircle.radius <= this.y + this.height) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean contains(Rectangle paramRectangle) {
    float f1 = paramRectangle.x;
    float f2 = paramRectangle.width + f1;
    float f3 = paramRectangle.y;
    float f4 = paramRectangle.height + f3;
    float f5 = this.x;
    if (f1 > f5) {
      float f = this.width;
      if (f1 < f5 + f && f2 > f5 && f2 < f5 + f) {
        f1 = this.y;
        if (f3 > f1) {
          f5 = this.height;
          if (f3 < f1 + f5 && f4 > f1 && f4 < f1 + f5)
            return true; 
        } 
      } 
    } 
    return false;
  }
  
  public boolean contains(Vector2 paramVector2) { return contains(paramVector2.x, paramVector2.y); }
  
  public boolean equals(Object paramObject) {
    if (this == paramObject)
      return true; 
    if (paramObject == null)
      return false; 
    if (getClass() != paramObject.getClass())
      return false; 
    paramObject = (Rectangle)paramObject;
    return (NumberUtils.floatToRawIntBits(this.height) != NumberUtils.floatToRawIntBits(paramObject.height)) ? false : ((NumberUtils.floatToRawIntBits(this.width) != NumberUtils.floatToRawIntBits(paramObject.width)) ? false : ((NumberUtils.floatToRawIntBits(this.x) != NumberUtils.floatToRawIntBits(paramObject.x)) ? false : (!(NumberUtils.floatToRawIntBits(this.y) != NumberUtils.floatToRawIntBits(paramObject.y)))));
  }
  
  public Rectangle fitInside(Rectangle paramRectangle) {
    float f = getAspectRatio();
    if (f < paramRectangle.getAspectRatio()) {
      float f1 = paramRectangle.height;
      setSize(f * f1, f1);
    } else {
      float f1 = paramRectangle.width;
      setSize(f1, f1 / f);
    } 
    setPosition(paramRectangle.x + paramRectangle.width / 2.0F - this.width / 2.0F, paramRectangle.y + paramRectangle.height / 2.0F - this.height / 2.0F);
    return this;
  }
  
  public Rectangle fitOutside(Rectangle paramRectangle) {
    float f = getAspectRatio();
    if (f > paramRectangle.getAspectRatio()) {
      float f1 = paramRectangle.height;
      setSize(f * f1, f1);
    } else {
      float f1 = paramRectangle.width;
      setSize(f1, f1 / f);
    } 
    setPosition(paramRectangle.x + paramRectangle.width / 2.0F - this.width / 2.0F, paramRectangle.y + paramRectangle.height / 2.0F - this.height / 2.0F);
    return this;
  }
  
  public Rectangle fromString(String paramString) {
    int i = paramString.indexOf(',', 1);
    int j = i + 1;
    int k = paramString.indexOf(',', j);
    int m = k + 1;
    int n = paramString.indexOf(',', m);
    if (i != -1 && k != -1 && n != -1 && paramString.charAt(0) == '[' && paramString.charAt(paramString.length() - 1) == ']')
      try {
        return set(Float.parseFloat(paramString.substring(1, i)), Float.parseFloat(paramString.substring(j, k)), Float.parseFloat(paramString.substring(m, n)), Float.parseFloat(paramString.substring(n + 1, paramString.length() - 1)));
      } catch (NumberFormatException numberFormatException) {} 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Malformed Rectangle: ");
    stringBuilder.append(paramString);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public float getAspectRatio() {
    float f = this.height;
    if (f == 0.0F) {
      f = NaNF;
    } else {
      f = this.width / f;
    } 
    return f;
  }
  
  public Vector2 getCenter(Vector2 paramVector2) {
    paramVector2.x = this.x + this.width / 2.0F;
    paramVector2.y = this.y + this.height / 2.0F;
    return paramVector2;
  }
  
  public float getHeight() { return this.height; }
  
  public Vector2 getPosition(Vector2 paramVector2) { return paramVector2.set(this.x, this.y); }
  
  public Vector2 getSize(Vector2 paramVector2) { return paramVector2.set(this.width, this.height); }
  
  public float getWidth() { return this.width; }
  
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public int hashCode() { return (((NumberUtils.floatToRawIntBits(this.height) + 31) * 31 + NumberUtils.floatToRawIntBits(this.width)) * 31 + NumberUtils.floatToRawIntBits(this.x)) * 31 + NumberUtils.floatToRawIntBits(this.y); }
  
  public Rectangle merge(float paramFloat1, float paramFloat2) {
    float f = Math.min(this.x, paramFloat1);
    paramFloat1 = Math.max(this.x + this.width, paramFloat1);
    this.x = f;
    this.width = paramFloat1 - f;
    paramFloat1 = Math.min(this.y, paramFloat2);
    paramFloat2 = Math.max(this.y + this.height, paramFloat2);
    this.y = paramFloat1;
    this.height = paramFloat2 - paramFloat1;
    return this;
  }
  
  public Rectangle merge(Rectangle paramRectangle) {
    float f1 = Math.min(this.x, paramRectangle.x);
    float f2 = Math.max(this.x + this.width, paramRectangle.x + paramRectangle.width);
    this.x = f1;
    this.width = f2 - f1;
    f1 = Math.min(this.y, paramRectangle.y);
    f2 = Math.max(this.y + this.height, paramRectangle.y + paramRectangle.height);
    this.y = f1;
    this.height = f2 - f1;
    return this;
  }
  
  public Rectangle merge(Vector2 paramVector2) { return merge(paramVector2.x, paramVector2.y); }
  
  public Rectangle merge(Vector2[] paramArrayOfVector2) {
    float f1 = this.x;
    float f2 = this.width + f1;
    float f3 = this.y;
    float f4 = this.height + f3;
    for (byte b = 0; b < paramArrayOfVector2.length; b++) {
      Vector2 vector2 = paramArrayOfVector2[b];
      f1 = Math.min(f1, vector2.x);
      f2 = Math.max(f2, vector2.x);
      f3 = Math.min(f3, vector2.y);
      f4 = Math.max(f4, vector2.y);
    } 
    this.x = f1;
    this.width = f2 - f1;
    this.y = f3;
    this.height = f4 - f3;
    return this;
  }
  
  public boolean overlaps(Rectangle paramRectangle) {
    float f1 = this.x;
    float f2 = paramRectangle.x;
    if (f1 < paramRectangle.width + f2 && f1 + this.width > f2) {
      f1 = this.y;
      f2 = paramRectangle.y;
      if (f1 < paramRectangle.height + f2 && f1 + this.height > f2)
        return true; 
    } 
    return false;
  }
  
  public float perimeter() { return (this.width + this.height) * 2.0F; }
  
  public Rectangle set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.width = paramFloat3;
    this.height = paramFloat4;
    return this;
  }
  
  public Rectangle set(Rectangle paramRectangle) {
    this.x = paramRectangle.x;
    this.y = paramRectangle.y;
    this.width = paramRectangle.width;
    this.height = paramRectangle.height;
    return this;
  }
  
  public Rectangle setCenter(float paramFloat1, float paramFloat2) {
    setPosition(paramFloat1 - this.width / 2.0F, paramFloat2 - this.height / 2.0F);
    return this;
  }
  
  public Rectangle setCenter(Vector2 paramVector2) {
    setPosition(paramVector2.x - this.width / 2.0F, paramVector2.y - this.height / 2.0F);
    return this;
  }
  
  public Rectangle setHeight(float paramFloat) {
    this.height = paramFloat;
    return this;
  }
  
  public Rectangle setPosition(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    return this;
  }
  
  public Rectangle setPosition(Vector2 paramVector2) {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    return this;
  }
  
  public Rectangle setSize(float paramFloat) {
    this.width = paramFloat;
    this.height = paramFloat;
    return this;
  }
  
  public Rectangle setSize(float paramFloat1, float paramFloat2) {
    this.width = paramFloat1;
    this.height = paramFloat2;
    return this;
  }
  
  public Rectangle setWidth(float paramFloat) {
    this.width = paramFloat;
    return this;
  }
  
  public Rectangle setX(float paramFloat) {
    this.x = paramFloat;
    return this;
  }
  
  public Rectangle setY(float paramFloat) {
    this.y = paramFloat;
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.x);
    stringBuilder.append(",");
    stringBuilder.append(this.y);
    stringBuilder.append(",");
    stringBuilder.append(this.width);
    stringBuilder.append(",");
    stringBuilder.append(this.height);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Rectangle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */