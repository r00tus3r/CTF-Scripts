package com.badlogic.gdx.math;

public class Polygon implements Shape2D {
  private Rectangle bounds;
  
  private boolean dirty = true;
  
  private float[] localVertices;
  
  private float originX;
  
  private float originY;
  
  private float rotation;
  
  private float scaleX = 1.0F;
  
  private float scaleY = 1.0F;
  
  private float[] worldVertices;
  
  private float x;
  
  private float y;
  
  public Polygon() { this.localVertices = new float[0]; }
  
  public Polygon(float[] paramArrayOfFloat) {
    if (paramArrayOfFloat.length >= 6) {
      this.localVertices = paramArrayOfFloat;
      return;
    } 
    throw new IllegalArgumentException("polygons must contain at least 3 points.");
  }
  
  public float area() {
    float[] arrayOfFloat = getTransformedVertices();
    return GeometryUtils.polygonArea(arrayOfFloat, 0, arrayOfFloat.length);
  }
  
  public boolean contains(float paramFloat1, float paramFloat2) { // Byte code:
    //   0: aload_0
    //   1: invokevirtual getTransformedVertices : ()[F
    //   4: astore_3
    //   5: aload_3
    //   6: arraylength
    //   7: istore #4
    //   9: iconst_0
    //   10: istore #5
    //   12: iconst_0
    //   13: istore #6
    //   15: iload #5
    //   17: iload #4
    //   19: if_icmpge -> 143
    //   22: aload_3
    //   23: iload #5
    //   25: faload
    //   26: fstore #7
    //   28: aload_3
    //   29: iload #5
    //   31: iconst_1
    //   32: iadd
    //   33: faload
    //   34: fstore #8
    //   36: iload #5
    //   38: iconst_2
    //   39: iadd
    //   40: istore #9
    //   42: aload_3
    //   43: iload #9
    //   45: iload #4
    //   47: irem
    //   48: faload
    //   49: fstore #10
    //   51: aload_3
    //   52: iload #5
    //   54: iconst_3
    //   55: iadd
    //   56: iload #4
    //   58: irem
    //   59: faload
    //   60: fstore #11
    //   62: fload #8
    //   64: fload_2
    //   65: fcmpg
    //   66: ifgt -> 76
    //   69: fload_2
    //   70: fload #11
    //   72: fcmpg
    //   73: iflt -> 98
    //   76: iload #6
    //   78: istore #12
    //   80: fload #11
    //   82: fload_2
    //   83: fcmpg
    //   84: ifgt -> 132
    //   87: iload #6
    //   89: istore #12
    //   91: fload_2
    //   92: fload #8
    //   94: fcmpg
    //   95: ifge -> 132
    //   98: iload #6
    //   100: istore #12
    //   102: fload_1
    //   103: fload #10
    //   105: fload #7
    //   107: fsub
    //   108: fload #11
    //   110: fload #8
    //   112: fsub
    //   113: fdiv
    //   114: fload_2
    //   115: fload #8
    //   117: fsub
    //   118: fmul
    //   119: fload #7
    //   121: fadd
    //   122: fcmpg
    //   123: ifge -> 132
    //   126: iload #6
    //   128: iconst_1
    //   129: iadd
    //   130: istore #12
    //   132: iload #9
    //   134: istore #5
    //   136: iload #12
    //   138: istore #6
    //   140: goto -> 15
    //   143: iconst_1
    //   144: istore #13
    //   146: iload #6
    //   148: iconst_1
    //   149: iand
    //   150: iconst_1
    //   151: if_icmpne -> 157
    //   154: goto -> 160
    //   157: iconst_0
    //   158: istore #13
    //   160: iload #13
    //   162: ireturn }
  
  public boolean contains(Vector2 paramVector2) { return contains(paramVector2.x, paramVector2.y); }
  
  public void dirty() { this.dirty = true; }
  
  public Rectangle getBoundingRectangle() {
    float[] arrayOfFloat = getTransformedVertices();
    float f1 = arrayOfFloat[0];
    float f2 = arrayOfFloat[1];
    float f3 = arrayOfFloat[0];
    float f4 = arrayOfFloat[1];
    int i = arrayOfFloat.length;
    byte b = 2;
    while (b < i) {
      float f5 = f1;
      if (f1 > arrayOfFloat[b])
        f5 = arrayOfFloat[b]; 
      byte b1 = b + 1;
      float f6 = f2;
      if (f2 > arrayOfFloat[b1])
        f6 = arrayOfFloat[b1]; 
      f1 = f3;
      if (f3 < arrayOfFloat[b])
        f1 = arrayOfFloat[b]; 
      f2 = f4;
      if (f4 < arrayOfFloat[b1])
        f2 = arrayOfFloat[b1]; 
      b += 2;
      f3 = f1;
      f1 = f5;
      f4 = f2;
      f2 = f6;
    } 
    if (this.bounds == null)
      this.bounds = new Rectangle(); 
    Rectangle rectangle = this.bounds;
    rectangle.x = f1;
    rectangle.y = f2;
    rectangle.width = f3 - f1;
    rectangle.height = f4 - f2;
    return rectangle;
  }
  
  public float getOriginX() { return this.originX; }
  
  public float getOriginY() { return this.originY; }
  
  public float getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scaleX; }
  
  public float getScaleY() { return this.scaleY; }
  
  public float[] getTransformedVertices() {
    boolean bool2;
    if (!this.dirty)
      return this.worldVertices; 
    boolean bool1 = false;
    this.dirty = false;
    float[] arrayOfFloat1 = this.localVertices;
    float[] arrayOfFloat2 = this.worldVertices;
    if (arrayOfFloat2 == null || arrayOfFloat2.length != arrayOfFloat1.length)
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
  }
  
  public void setVertices(float[] paramArrayOfFloat) {
    if (paramArrayOfFloat.length >= 6) {
      this.localVertices = paramArrayOfFloat;
      this.dirty = true;
      return;
    } 
    throw new IllegalArgumentException("polygons must contain at least 3 points.");
  }
  
  public void translate(float paramFloat1, float paramFloat2) {
    this.x += paramFloat1;
    this.y += paramFloat2;
    this.dirty = true;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Polygon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */