package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.EarClippingTriangulator;
import com.badlogic.gdx.math.Intersector;
import com.badlogic.gdx.math.Polygon;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ShortArray;

public class RepeatablePolygonSprite {
  private Color color = Color.WHITE;
  
  private int cols;
  
  private float density;
  
  private boolean dirty = true;
  
  private float gridHeight;
  
  private float gridWidth;
  
  private Array<short[]> indices = new Array();
  
  private Vector2 offset = new Vector2();
  
  private Array<float[]> parts = new Array();
  
  private TextureRegion region;
  
  private int rows;
  
  private Array<float[]> vertices = new Array();
  
  public float x = 0.0F;
  
  public float y = 0.0F;
  
  private void buildVertices() {
    this.vertices.clear();
    for (int i = 0; i < this.parts.size; i++) {
      float[] arrayOfFloat = (float[])this.parts.get(i);
      if (arrayOfFloat != null) {
        float[] arrayOfFloat1 = new float[arrayOfFloat.length * 5 / 2];
        int j = this.rows;
        int k = i / j;
        int m = i % j;
        j = 0;
        for (int n = 0; j < arrayOfFloat.length; n++) {
          boolean bool1 = n + true;
          arrayOfFloat1[n] = arrayOfFloat[j] + this.offset.x + this.x;
          boolean bool2 = bool1 + true;
          n = j + 1;
          arrayOfFloat1[bool1] = arrayOfFloat[n] + this.offset.y + this.y;
          bool1 = bool2 + true;
          arrayOfFloat1[bool2] = this.color.toFloatBits();
          float f1 = arrayOfFloat[j];
          float f2 = this.gridWidth;
          f1 = f1 % f2 / f2;
          float f3 = arrayOfFloat[n];
          float f4 = this.gridHeight;
          f3 = f3 % f4 / f4;
          if (arrayOfFloat[j] == k * f2)
            f1 = 0.0F; 
          float f5 = arrayOfFloat[j];
          float f6 = (k + 1);
          float f7 = this.gridWidth;
          f4 = 1.0F;
          f2 = f1;
          if (f5 == f6 * f7)
            f2 = 1.0F; 
          if (arrayOfFloat[n] == m * this.gridHeight) {
            f1 = 0.0F;
          } else {
            f1 = f3;
          } 
          if (arrayOfFloat[n] == (m + 1) * this.gridHeight)
            f1 = f4; 
          f7 = this.region.getU();
          f4 = this.region.getU2();
          f5 = this.region.getU();
          f6 = this.region.getV();
          float f8 = this.region.getV2();
          f3 = this.region.getV();
          n = bool1 + true;
          arrayOfFloat1[bool1] = f7 + (f4 - f5) * f2;
          arrayOfFloat1[n] = f6 + (f8 - f3) * f1;
          j += 2;
        } 
        this.vertices.add(arrayOfFloat1);
      } 
    } 
    this.dirty = false;
  }
  
  private float[] offset(float[] paramArrayOfFloat) {
    boolean bool3;
    Vector2 vector2 = this.offset;
    boolean bool1 = false;
    vector2.set(paramArrayOfFloat[0], paramArrayOfFloat[1]);
    boolean bool2 = false;
    while (true) {
      bool3 = bool1;
      if (bool2 < paramArrayOfFloat.length - 1) {
        if (this.offset.x > paramArrayOfFloat[bool2])
          this.offset.x = paramArrayOfFloat[bool2]; 
        float f = this.offset.y;
        bool3 = bool2 + true;
        if (f > paramArrayOfFloat[bool3])
          this.offset.y = paramArrayOfFloat[bool3]; 
        bool2 += true;
        continue;
      } 
      break;
    } 
    while (bool3 < paramArrayOfFloat.length) {
      paramArrayOfFloat[bool3] = paramArrayOfFloat[bool3] - this.offset.x;
      bool2 = bool3 + true;
      paramArrayOfFloat[bool2] = paramArrayOfFloat[bool2] - this.offset.y;
      bool3 += true;
    } 
    return paramArrayOfFloat;
  }
  
  private float[] snapToGrid(float[] paramArrayOfFloat) {
    for (boolean bool = false; bool < paramArrayOfFloat.length; bool += true) {
      float f1 = paramArrayOfFloat[bool] / this.gridWidth % 1.0F;
      boolean bool1 = bool + true;
      float f2 = paramArrayOfFloat[bool1] / this.gridHeight % 1.0F;
      if (f1 > 0.99F || f1 < 0.01F) {
        f1 = this.gridWidth;
        paramArrayOfFloat[bool] = f1 * Math.round(paramArrayOfFloat[bool] / f1);
      } 
      if (f2 > 0.99F || f2 < 0.01F) {
        f2 = this.gridHeight;
        paramArrayOfFloat[bool1] = f2 * Math.round(paramArrayOfFloat[bool1] / f2);
      } 
    } 
    return paramArrayOfFloat;
  }
  
  public void draw(PolygonSpriteBatch paramPolygonSpriteBatch) {
    if (this.dirty)
      buildVertices(); 
    for (byte b = 0; b < this.vertices.size; b++)
      paramPolygonSpriteBatch.draw(this.region.getTexture(), (float[])this.vertices.get(b), 0, (float[])this.vertices.get(b).length, (short[])this.indices.get(b), 0, (short[])this.indices.get(b).length); 
  }
  
  public void setColor(Color paramColor) {
    this.color = paramColor;
    this.dirty = true;
  }
  
  public void setPolygon(TextureRegion paramTextureRegion, float[] paramArrayOfFloat) { setPolygon(paramTextureRegion, paramArrayOfFloat, -1.0F); }
  
  public void setPolygon(TextureRegion paramTextureRegion, float[] paramArrayOfFloat, float paramFloat) {
    this.region = paramTextureRegion;
    Polygon polygon1 = new Polygon(offset(paramArrayOfFloat));
    Polygon polygon2 = new Polygon();
    Polygon polygon3 = new Polygon();
    EarClippingTriangulator earClippingTriangulator = new EarClippingTriangulator();
    Rectangle rectangle = polygon1.getBoundingRectangle();
    if (paramFloat == -1.0F)
      paramFloat = rectangle.getWidth() / paramTextureRegion.getRegionWidth(); 
    float f = paramTextureRegion.getRegionHeight() / paramTextureRegion.getRegionWidth();
    this.cols = (int)Math.ceil(paramFloat);
    this.gridWidth = rectangle.getWidth() / paramFloat;
    this.gridHeight = f * this.gridWidth;
    this.rows = (int)Math.ceil((rectangle.getHeight() / this.gridHeight));
    for (byte b = 0; b < this.cols; b++) {
      byte b1 = 0;
      while (b1 < this.rows) {
        float f1 = b;
        float f2 = this.gridWidth;
        paramFloat = b1;
        f = this.gridHeight;
        float f3 = ++b1;
        float f4 = (b + true);
        polygon2.setVertices(new float[] { f1 * f2, paramFloat * f, f1 * f2, f3 * f, f4 * f2, f3 * f, f4 * f2, paramFloat * f });
        Intersector.intersectPolygons(polygon1, polygon2, polygon3);
        float[] arrayOfFloat = polygon3.getVertices();
        if (arrayOfFloat.length > 0) {
          this.parts.add(snapToGrid(arrayOfFloat));
          ShortArray shortArray = earClippingTriangulator.computeTriangles(arrayOfFloat);
          this.indices.add(shortArray.toArray());
          continue;
        } 
        this.parts.add(null);
      } 
    } 
    buildVertices();
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.dirty = true;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/RepeatablePolygonSprite.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */