package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;

public class PolygonSprite {
  private Rectangle bounds = new Rectangle();
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private boolean dirty;
  
  private float height;
  
  private float originX;
  
  private float originY;
  
  PolygonRegion region;
  
  private float rotation;
  
  private float scaleX = 1.0F;
  
  private float scaleY = 1.0F;
  
  private float[] vertices;
  
  private float width;
  
  private float x;
  
  private float y;
  
  public PolygonSprite(PolygonRegion paramPolygonRegion) {
    setRegion(paramPolygonRegion);
    setSize(paramPolygonRegion.region.regionWidth, paramPolygonRegion.region.regionHeight);
    setOrigin(this.width / 2.0F, this.height / 2.0F);
  }
  
  public PolygonSprite(PolygonSprite paramPolygonSprite) { set(paramPolygonSprite); }
  
  public void draw(PolygonSpriteBatch paramPolygonSpriteBatch) {
    PolygonRegion polygonRegion = this.region;
    paramPolygonSpriteBatch.draw(polygonRegion.region.texture, getVertices(), 0, this.vertices.length, polygonRegion.triangles, 0, polygonRegion.triangles.length);
  }
  
  public void draw(PolygonSpriteBatch paramPolygonSpriteBatch, float paramFloat) {
    Color color1 = getColor();
    float f = color1.a;
    color1.a *= paramFloat;
    setColor(color1);
    draw(paramPolygonSpriteBatch);
    color1.a = f;
    setColor(color1);
  }
  
  public Rectangle getBoundingRectangle() {
    float[] arrayOfFloat = getVertices();
    float f1 = arrayOfFloat[0];
    float f2 = arrayOfFloat[1];
    float f3 = arrayOfFloat[0];
    float f4 = arrayOfFloat[1];
    byte b = 5;
    while (b < arrayOfFloat.length) {
      float f5 = arrayOfFloat[b];
      float f6 = arrayOfFloat[b + 1];
      float f7 = f1;
      if (f1 > f5)
        f7 = f5; 
      f1 = f3;
      if (f3 < f5)
        f1 = f5; 
      f5 = f2;
      if (f2 > f6)
        f5 = f6; 
      f2 = f4;
      if (f4 < f6)
        f2 = f6; 
      b += 5;
      f3 = f1;
      f1 = f7;
      f4 = f2;
      f2 = f5;
    } 
    Rectangle rectangle = this.bounds;
    rectangle.x = f1;
    rectangle.y = f2;
    rectangle.width = f3 - f1;
    rectangle.height = f4 - f2;
    return rectangle;
  }
  
  public Color getColor() { return this.color; }
  
  public float getHeight() { return this.height; }
  
  public float getOriginX() { return this.originX; }
  
  public float getOriginY() { return this.originY; }
  
  public Color getPackedColor() {
    Color.abgr8888ToColor(this.color, this.vertices[2]);
    return this.color;
  }
  
  public PolygonRegion getRegion() { return this.region; }
  
  public float getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scaleX; }
  
  public float getScaleY() { return this.scaleY; }
  
  public float[] getVertices() {
    if (!this.dirty)
      return this.vertices; 
    boolean bool1 = false;
    this.dirty = false;
    float f1 = this.originX;
    float f2 = this.originY;
    float f3 = this.scaleX;
    float f4 = this.scaleY;
    PolygonRegion polygonRegion = this.region;
    float[] arrayOfFloat1 = this.vertices;
    float[] arrayOfFloat2 = polygonRegion.vertices;
    float f5 = this.x;
    float f6 = this.y;
    float f7 = this.width / polygonRegion.region.getRegionWidth();
    float f8 = this.height / polygonRegion.region.getRegionHeight();
    float f9 = MathUtils.cosDeg(this.rotation);
    float f10 = MathUtils.sinDeg(this.rotation);
    int i = arrayOfFloat2.length;
    for (boolean bool2 = false; bool1 < i; bool2 += true) {
      float f11 = (arrayOfFloat2[bool1] * f7 - f1) * f3;
      float f12 = (arrayOfFloat2[bool1 + true] * f8 - f2) * f4;
      arrayOfFloat1[bool2] = f9 * f11 - f10 * f12 + f5 + f1;
      arrayOfFloat1[bool2 + true] = f11 * f10 + f12 * f9 + f6 + f2;
      bool1 += true;
    } 
    return arrayOfFloat1;
  }
  
  public float getWidth() { return this.width; }
  
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
  }
  
  public void set(PolygonSprite paramPolygonSprite) {
    if (paramPolygonSprite != null) {
      setRegion(paramPolygonSprite.region);
      this.x = paramPolygonSprite.x;
      this.y = paramPolygonSprite.y;
      this.width = paramPolygonSprite.width;
      this.height = paramPolygonSprite.height;
      this.originX = paramPolygonSprite.originX;
      this.originY = paramPolygonSprite.originY;
      this.rotation = paramPolygonSprite.rotation;
      this.scaleX = paramPolygonSprite.scaleX;
      this.scaleY = paramPolygonSprite.scaleY;
      this.color.set(paramPolygonSprite.color);
      return;
    } 
    throw new IllegalArgumentException("sprite cannot be null.");
  }
  
  public void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.width = paramFloat3;
    this.height = paramFloat4;
    this.dirty = true;
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    paramFloat1 = this.color.toFloatBits();
    float[] arrayOfFloat = this.vertices;
    for (byte b = 2; b < arrayOfFloat.length; b += 5)
      arrayOfFloat[b] = paramFloat1; 
  }
  
  public void setColor(Color paramColor) {
    this.color.set(paramColor);
    float f = paramColor.toFloatBits();
    float[] arrayOfFloat = this.vertices;
    for (byte b = 2; b < arrayOfFloat.length; b += 5)
      arrayOfFloat[b] = f; 
  }
  
  public void setOrigin(float paramFloat1, float paramFloat2) {
    this.originX = paramFloat1;
    this.originY = paramFloat2;
    this.dirty = true;
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) { translate(paramFloat1 - this.x, paramFloat2 - this.y); }
  
  public void setRegion(PolygonRegion paramPolygonRegion) {
    this.region = paramPolygonRegion;
    float[] arrayOfFloat2 = paramPolygonRegion.vertices;
    float[] arrayOfFloat1 = paramPolygonRegion.textureCoords;
    int i = arrayOfFloat2.length / 2 * 5;
    arrayOfFloat2 = this.vertices;
    if (arrayOfFloat2 == null || arrayOfFloat2.length != i)
      this.vertices = new float[i]; 
    float f = this.color.toFloatBits();
    arrayOfFloat2 = this.vertices;
    byte b = 2;
    boolean bool = false;
    while (b < i) {
      arrayOfFloat2[b] = f;
      arrayOfFloat2[b + 1] = arrayOfFloat1[bool];
      arrayOfFloat2[b + 2] = arrayOfFloat1[bool + true];
      bool += true;
      b += 5;
    } 
    this.dirty = true;
  }
  
  public void setRotation(float paramFloat) {
    this.rotation = paramFloat;
    this.dirty = true;
  }
  
  public void setScale(float paramFloat) {
    this.scaleX = paramFloat;
    this.scaleY = paramFloat;
    this.dirty = true;
  }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    this.scaleX = paramFloat1;
    this.scaleY = paramFloat2;
    this.dirty = true;
  }
  
  public void setSize(float paramFloat1, float paramFloat2) {
    this.width = paramFloat1;
    this.height = paramFloat2;
    this.dirty = true;
  }
  
  public void setX(float paramFloat) { translateX(paramFloat - this.x); }
  
  public void setY(float paramFloat) { translateY(paramFloat - this.y); }
  
  public void translate(float paramFloat1, float paramFloat2) {
    this.x += paramFloat1;
    this.y += paramFloat2;
    if (this.dirty)
      return; 
    float[] arrayOfFloat = this.vertices;
    for (boolean bool = false; bool < arrayOfFloat.length; bool += true) {
      arrayOfFloat[bool] = arrayOfFloat[bool] + paramFloat1;
      boolean bool1 = bool + true;
      arrayOfFloat[bool1] = arrayOfFloat[bool1] + paramFloat2;
    } 
  }
  
  public void translateX(float paramFloat) {
    this.x += paramFloat;
    if (this.dirty)
      return; 
    float[] arrayOfFloat = this.vertices;
    for (boolean bool = false; bool < arrayOfFloat.length; bool += true)
      arrayOfFloat[bool] = arrayOfFloat[bool] + paramFloat; 
  }
  
  public void translateY(float paramFloat) {
    this.y += paramFloat;
    if (this.dirty)
      return; 
    float[] arrayOfFloat = this.vertices;
    for (boolean bool = true; bool < arrayOfFloat.length; bool += true)
      arrayOfFloat[bool] = arrayOfFloat[bool] + paramFloat; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PolygonSprite.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */