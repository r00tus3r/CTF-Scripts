package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.NumberUtils;

public class Sprite extends TextureRegion {
  static final int SPRITE_SIZE = 20;
  
  static final int VERTEX_SIZE = 5;
  
  private Rectangle bounds;
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private boolean dirty = true;
  
  float height;
  
  private float originX;
  
  private float originY;
  
  private float rotation;
  
  private float scaleX = 1.0F;
  
  private float scaleY = 1.0F;
  
  final float[] vertices = new float[20];
  
  float width;
  
  private float x;
  
  private float y;
  
  public Sprite() { setColor(1.0F, 1.0F, 1.0F, 1.0F); }
  
  public Sprite(Texture paramTexture) { this(paramTexture, 0, 0, paramTexture.getWidth(), paramTexture.getHeight()); }
  
  public Sprite(Texture paramTexture, int paramInt1, int paramInt2) { this(paramTexture, 0, 0, paramInt1, paramInt2); }
  
  public Sprite(Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (paramTexture != null) {
      this.texture = paramTexture;
      setRegion(paramInt1, paramInt2, paramInt3, paramInt4);
      setColor(1.0F, 1.0F, 1.0F, 1.0F);
      setSize(Math.abs(paramInt3), Math.abs(paramInt4));
      setOrigin(this.width / 2.0F, this.height / 2.0F);
      return;
    } 
    throw new IllegalArgumentException("texture cannot be null.");
  }
  
  public Sprite(Sprite paramSprite) { set(paramSprite); }
  
  public Sprite(TextureRegion paramTextureRegion) {
    setRegion(paramTextureRegion);
    setColor(1.0F, 1.0F, 1.0F, 1.0F);
    setSize(paramTextureRegion.getRegionWidth(), paramTextureRegion.getRegionHeight());
    setOrigin(this.width / 2.0F, this.height / 2.0F);
  }
  
  public Sprite(TextureRegion paramTextureRegion, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    setRegion(paramTextureRegion, paramInt1, paramInt2, paramInt3, paramInt4);
    setColor(1.0F, 1.0F, 1.0F, 1.0F);
    setSize(Math.abs(paramInt3), Math.abs(paramInt4));
    setOrigin(this.width / 2.0F, this.height / 2.0F);
  }
  
  public void draw(Batch paramBatch) { paramBatch.draw(this.texture, getVertices(), 0, 20); }
  
  public void draw(Batch paramBatch, float paramFloat) {
    float f = (getColor()).a;
    setAlpha(paramFloat * f);
    draw(paramBatch);
    setAlpha(f);
  }
  
  public void flip(boolean paramBoolean1, boolean paramBoolean2) {
    super.flip(paramBoolean1, paramBoolean2);
    float[] arrayOfFloat = this.vertices;
    if (paramBoolean1) {
      float f = arrayOfFloat[3];
      arrayOfFloat[3] = arrayOfFloat[13];
      arrayOfFloat[13] = f;
      f = arrayOfFloat[8];
      arrayOfFloat[8] = arrayOfFloat[18];
      arrayOfFloat[18] = f;
    } 
    if (paramBoolean2) {
      float f = arrayOfFloat[4];
      arrayOfFloat[4] = arrayOfFloat[14];
      arrayOfFloat[14] = f;
      f = arrayOfFloat[9];
      arrayOfFloat[9] = arrayOfFloat[19];
      arrayOfFloat[19] = f;
    } 
  }
  
  public Rectangle getBoundingRectangle() {
    float[] arrayOfFloat = getVertices();
    float f1 = arrayOfFloat[0];
    float f2 = arrayOfFloat[1];
    float f3 = arrayOfFloat[0];
    float f4 = arrayOfFloat[1];
    float f5 = f1;
    if (f1 > arrayOfFloat[5])
      f5 = arrayOfFloat[5]; 
    f1 = f5;
    if (f5 > arrayOfFloat[10])
      f1 = arrayOfFloat[10]; 
    float f6 = f1;
    if (f1 > arrayOfFloat[15])
      f6 = arrayOfFloat[15]; 
    f5 = f3;
    if (f3 < arrayOfFloat[5])
      f5 = arrayOfFloat[5]; 
    f1 = f5;
    if (f5 < arrayOfFloat[10])
      f1 = arrayOfFloat[10]; 
    f3 = f1;
    if (f1 < arrayOfFloat[15])
      f3 = arrayOfFloat[15]; 
    f1 = f2;
    if (f2 > arrayOfFloat[6])
      f1 = arrayOfFloat[6]; 
    f5 = f1;
    if (f1 > arrayOfFloat[11])
      f5 = arrayOfFloat[11]; 
    f2 = f5;
    if (f5 > arrayOfFloat[16])
      f2 = arrayOfFloat[16]; 
    f5 = f4;
    if (f4 < arrayOfFloat[6])
      f5 = arrayOfFloat[6]; 
    f1 = f5;
    if (f5 < arrayOfFloat[11])
      f1 = arrayOfFloat[11]; 
    f5 = f1;
    if (f1 < arrayOfFloat[16])
      f5 = arrayOfFloat[16]; 
    if (this.bounds == null)
      this.bounds = new Rectangle(); 
    Rectangle rectangle = this.bounds;
    rectangle.x = f6;
    rectangle.y = f2;
    rectangle.width = f3 - f6;
    rectangle.height = f5 - f2;
    return rectangle;
  }
  
  public Color getColor() {
    int i = NumberUtils.floatToIntColor(this.vertices[2]);
    Color color1 = this.color;
    color1.r = (i & 0xFF) / 255.0F;
    color1.g = (i >>> 8 & 0xFF) / 255.0F;
    color1.b = (i >>> 16 & 0xFF) / 255.0F;
    color1.a = (i >>> 24 & 0xFF) / 255.0F;
    return color1;
  }
  
  public float getHeight() { return this.height; }
  
  public float getOriginX() { return this.originX; }
  
  public float getOriginY() { return this.originY; }
  
  public float getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scaleX; }
  
  public float getScaleY() { return this.scaleY; }
  
  public float[] getVertices() { // Byte code:
    //   0: aload_0
    //   1: getfield dirty : Z
    //   4: ifeq -> 384
    //   7: aload_0
    //   8: iconst_0
    //   9: putfield dirty : Z
    //   12: aload_0
    //   13: getfield vertices : [F
    //   16: astore_1
    //   17: aload_0
    //   18: getfield originX : F
    //   21: fneg
    //   22: fstore_2
    //   23: aload_0
    //   24: getfield originY : F
    //   27: fneg
    //   28: fstore_3
    //   29: aload_0
    //   30: getfield width : F
    //   33: fload_2
    //   34: fadd
    //   35: fstore #4
    //   37: aload_0
    //   38: getfield height : F
    //   41: fload_3
    //   42: fadd
    //   43: fstore #5
    //   45: aload_0
    //   46: getfield x : F
    //   49: fload_2
    //   50: fsub
    //   51: fstore #6
    //   53: aload_0
    //   54: getfield y : F
    //   57: fload_3
    //   58: fsub
    //   59: fstore #7
    //   61: aload_0
    //   62: getfield scaleX : F
    //   65: fconst_1
    //   66: fcmpl
    //   67: ifne -> 93
    //   70: fload_2
    //   71: fstore #8
    //   73: fload_3
    //   74: fstore #9
    //   76: fload #4
    //   78: fstore #10
    //   80: fload #5
    //   82: fstore #11
    //   84: aload_0
    //   85: getfield scaleY : F
    //   88: fconst_1
    //   89: fcmpl
    //   90: ifeq -> 131
    //   93: aload_0
    //   94: getfield scaleX : F
    //   97: fstore #10
    //   99: fload_2
    //   100: fload #10
    //   102: fmul
    //   103: fstore #8
    //   105: aload_0
    //   106: getfield scaleY : F
    //   109: fstore #11
    //   111: fload_3
    //   112: fload #11
    //   114: fmul
    //   115: fstore #9
    //   117: fload #4
    //   119: fload #10
    //   121: fmul
    //   122: fstore #10
    //   124: fload #5
    //   126: fload #11
    //   128: fmul
    //   129: fstore #11
    //   131: aload_0
    //   132: getfield rotation : F
    //   135: fstore #5
    //   137: fload #5
    //   139: fconst_0
    //   140: fcmpl
    //   141: ifeq -> 311
    //   144: fload #5
    //   146: invokestatic cosDeg : (F)F
    //   149: fstore #4
    //   151: aload_0
    //   152: getfield rotation : F
    //   155: invokestatic sinDeg : (F)F
    //   158: fstore #5
    //   160: fload #8
    //   162: fload #4
    //   164: fmul
    //   165: fstore_3
    //   166: fload #8
    //   168: fload #5
    //   170: fmul
    //   171: fstore #12
    //   173: fload #4
    //   175: fload #11
    //   177: fmul
    //   178: fstore #8
    //   180: fload #11
    //   182: fload #5
    //   184: fmul
    //   185: fstore_2
    //   186: fload_3
    //   187: fload #9
    //   189: fload #5
    //   191: fmul
    //   192: fsub
    //   193: fload #6
    //   195: fadd
    //   196: fstore #11
    //   198: fload #9
    //   200: fload #4
    //   202: fmul
    //   203: fload #12
    //   205: fadd
    //   206: fload #7
    //   208: fadd
    //   209: fstore #9
    //   211: aload_1
    //   212: iconst_0
    //   213: fload #11
    //   215: fastore
    //   216: aload_1
    //   217: iconst_1
    //   218: fload #9
    //   220: fastore
    //   221: fload_3
    //   222: fload_2
    //   223: fsub
    //   224: fload #6
    //   226: fadd
    //   227: fstore_3
    //   228: fload #12
    //   230: fload #8
    //   232: fadd
    //   233: fload #7
    //   235: fadd
    //   236: fstore #12
    //   238: aload_1
    //   239: iconst_5
    //   240: fload_3
    //   241: fastore
    //   242: aload_1
    //   243: bipush #6
    //   245: fload #12
    //   247: fastore
    //   248: fload #10
    //   250: fload #4
    //   252: fmul
    //   253: fload_2
    //   254: fsub
    //   255: fload #6
    //   257: fadd
    //   258: fstore #4
    //   260: fload #8
    //   262: fload #10
    //   264: fload #5
    //   266: fmul
    //   267: fadd
    //   268: fload #7
    //   270: fadd
    //   271: fstore #10
    //   273: aload_1
    //   274: bipush #10
    //   276: fload #4
    //   278: fastore
    //   279: aload_1
    //   280: bipush #11
    //   282: fload #10
    //   284: fastore
    //   285: aload_1
    //   286: bipush #15
    //   288: fload #11
    //   290: fload #4
    //   292: fload_3
    //   293: fsub
    //   294: fadd
    //   295: fastore
    //   296: aload_1
    //   297: bipush #16
    //   299: fload #10
    //   301: fload #12
    //   303: fload #9
    //   305: fsub
    //   306: fsub
    //   307: fastore
    //   308: goto -> 384
    //   311: fload #8
    //   313: fload #6
    //   315: fadd
    //   316: fstore #8
    //   318: fload #9
    //   320: fload #7
    //   322: fadd
    //   323: fstore #9
    //   325: fload #10
    //   327: fload #6
    //   329: fadd
    //   330: fstore #10
    //   332: fload #11
    //   334: fload #7
    //   336: fadd
    //   337: fstore #11
    //   339: aload_1
    //   340: iconst_0
    //   341: fload #8
    //   343: fastore
    //   344: aload_1
    //   345: iconst_1
    //   346: fload #9
    //   348: fastore
    //   349: aload_1
    //   350: iconst_5
    //   351: fload #8
    //   353: fastore
    //   354: aload_1
    //   355: bipush #6
    //   357: fload #11
    //   359: fastore
    //   360: aload_1
    //   361: bipush #10
    //   363: fload #10
    //   365: fastore
    //   366: aload_1
    //   367: bipush #11
    //   369: fload #11
    //   371: fastore
    //   372: aload_1
    //   373: bipush #15
    //   375: fload #10
    //   377: fastore
    //   378: aload_1
    //   379: bipush #16
    //   381: fload #9
    //   383: fastore
    //   384: aload_0
    //   385: getfield vertices : [F
    //   388: areturn }
  
  public float getWidth() { return this.width; }
  
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public void rotate(float paramFloat) {
    if (paramFloat == 0.0F)
      return; 
    this.rotation += paramFloat;
    this.dirty = true;
  }
  
  public void rotate90(boolean paramBoolean) {
    float[] arrayOfFloat = this.vertices;
    if (paramBoolean) {
      float f = arrayOfFloat[4];
      arrayOfFloat[4] = arrayOfFloat[19];
      arrayOfFloat[19] = arrayOfFloat[14];
      arrayOfFloat[14] = arrayOfFloat[9];
      arrayOfFloat[9] = f;
      f = arrayOfFloat[3];
      arrayOfFloat[3] = arrayOfFloat[18];
      arrayOfFloat[18] = arrayOfFloat[13];
      arrayOfFloat[13] = arrayOfFloat[8];
      arrayOfFloat[8] = f;
    } else {
      float f = arrayOfFloat[4];
      arrayOfFloat[4] = arrayOfFloat[9];
      arrayOfFloat[9] = arrayOfFloat[14];
      arrayOfFloat[14] = arrayOfFloat[19];
      arrayOfFloat[19] = f;
      f = arrayOfFloat[3];
      arrayOfFloat[3] = arrayOfFloat[8];
      arrayOfFloat[8] = arrayOfFloat[13];
      arrayOfFloat[13] = arrayOfFloat[18];
      arrayOfFloat[18] = f;
    } 
  }
  
  public void scale(float paramFloat) {
    this.scaleX += paramFloat;
    this.scaleY += paramFloat;
    this.dirty = true;
  }
  
  public void scroll(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat = this.vertices;
    if (paramFloat1 != 0.0F) {
      paramFloat1 = (arrayOfFloat[3] + paramFloat1) % 1.0F;
      float f = this.width / this.texture.getWidth() + paramFloat1;
      this.u = paramFloat1;
      this.u2 = f;
      arrayOfFloat[3] = paramFloat1;
      arrayOfFloat[8] = paramFloat1;
      arrayOfFloat[13] = f;
      arrayOfFloat[18] = f;
    } 
    if (paramFloat2 != 0.0F) {
      paramFloat1 = (arrayOfFloat[9] + paramFloat2) % 1.0F;
      paramFloat2 = this.height / this.texture.getHeight() + paramFloat1;
      this.v = paramFloat1;
      this.v2 = paramFloat2;
      arrayOfFloat[4] = paramFloat2;
      arrayOfFloat[9] = paramFloat1;
      arrayOfFloat[14] = paramFloat1;
      arrayOfFloat[19] = paramFloat2;
    } 
  }
  
  public void set(Sprite paramSprite) {
    if (paramSprite != null) {
      System.arraycopy(paramSprite.vertices, 0, this.vertices, 0, 20);
      this.texture = paramSprite.texture;
      this.u = paramSprite.u;
      this.v = paramSprite.v;
      this.u2 = paramSprite.u2;
      this.v2 = paramSprite.v2;
      this.x = paramSprite.x;
      this.y = paramSprite.y;
      this.width = paramSprite.width;
      this.height = paramSprite.height;
      this.regionWidth = paramSprite.regionWidth;
      this.regionHeight = paramSprite.regionHeight;
      this.originX = paramSprite.originX;
      this.originY = paramSprite.originY;
      this.rotation = paramSprite.rotation;
      this.scaleX = paramSprite.scaleX;
      this.scaleY = paramSprite.scaleY;
      this.color.set(paramSprite.color);
      this.dirty = paramSprite.dirty;
      return;
    } 
    throw new IllegalArgumentException("sprite cannot be null.");
  }
  
  public void setAlpha(float paramFloat) {
    Color color1 = this.color;
    color1.a = paramFloat;
    paramFloat = color1.toFloatBits();
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[2] = paramFloat;
    arrayOfFloat[7] = paramFloat;
    arrayOfFloat[12] = paramFloat;
    arrayOfFloat[17] = paramFloat;
  }
  
  public void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    this.width = paramFloat3;
    this.height = paramFloat4;
    if (this.dirty)
      return; 
    paramFloat3 += paramFloat1;
    paramFloat4 += paramFloat2;
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = paramFloat2;
    arrayOfFloat[5] = paramFloat1;
    arrayOfFloat[6] = paramFloat4;
    arrayOfFloat[10] = paramFloat3;
    arrayOfFloat[11] = paramFloat4;
    arrayOfFloat[15] = paramFloat3;
    arrayOfFloat[16] = paramFloat2;
    if (this.rotation != 0.0F || this.scaleX != 1.0F || this.scaleY != 1.0F)
      this.dirty = true; 
  }
  
  public void setCenter(float paramFloat1, float paramFloat2) {
    setCenterX(paramFloat1);
    setCenterY(paramFloat2);
  }
  
  public void setCenterX(float paramFloat) { setX(paramFloat - this.width / 2.0F); }
  
  public void setCenterY(float paramFloat) { setY(paramFloat - this.height / 2.0F); }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    paramFloat1 = this.color.toFloatBits();
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[2] = paramFloat1;
    arrayOfFloat[7] = paramFloat1;
    arrayOfFloat[12] = paramFloat1;
    arrayOfFloat[17] = paramFloat1;
  }
  
  public void setColor(Color paramColor) {
    this.color.set(paramColor);
    float f = paramColor.toFloatBits();
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[2] = f;
    arrayOfFloat[7] = f;
    arrayOfFloat[12] = f;
    arrayOfFloat[17] = f;
  }
  
  public void setFlip(boolean paramBoolean1, boolean paramBoolean2) {
    boolean bool = isFlipX();
    boolean bool1 = true;
    if (bool != paramBoolean1) {
      paramBoolean1 = true;
    } else {
      paramBoolean1 = false;
    } 
    if (isFlipY() != paramBoolean2) {
      paramBoolean2 = bool1;
    } else {
      paramBoolean2 = false;
    } 
    flip(paramBoolean1, paramBoolean2);
  }
  
  public void setOrigin(float paramFloat1, float paramFloat2) {
    this.originX = paramFloat1;
    this.originY = paramFloat2;
    this.dirty = true;
  }
  
  public void setOriginBasedPosition(float paramFloat1, float paramFloat2) { setPosition(paramFloat1 - this.originX, paramFloat2 - this.originY); }
  
  public void setOriginCenter() {
    this.originX = this.width / 2.0F;
    this.originY = this.height / 2.0F;
    this.dirty = true;
  }
  
  public void setPackedColor(float paramFloat) {
    Color.abgr8888ToColor(this.color, paramFloat);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[2] = paramFloat;
    arrayOfFloat[7] = paramFloat;
    arrayOfFloat[12] = paramFloat;
    arrayOfFloat[17] = paramFloat;
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) { translate(paramFloat1 - this.x, paramFloat2 - this.y); }
  
  public void setRegion(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    super.setRegion(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[3] = paramFloat1;
    arrayOfFloat[4] = paramFloat4;
    arrayOfFloat[8] = paramFloat1;
    arrayOfFloat[9] = paramFloat2;
    arrayOfFloat[13] = paramFloat3;
    arrayOfFloat[14] = paramFloat2;
    arrayOfFloat[18] = paramFloat3;
    arrayOfFloat[19] = paramFloat4;
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
    if (this.dirty)
      return; 
    float f1 = this.x;
    paramFloat1 += f1;
    float f2 = this.y;
    paramFloat2 += f2;
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[0] = f1;
    arrayOfFloat[1] = f2;
    arrayOfFloat[5] = f1;
    arrayOfFloat[6] = paramFloat2;
    arrayOfFloat[10] = paramFloat1;
    arrayOfFloat[11] = paramFloat2;
    arrayOfFloat[15] = paramFloat1;
    arrayOfFloat[16] = f2;
    if (this.rotation != 0.0F || this.scaleX != 1.0F || this.scaleY != 1.0F)
      this.dirty = true; 
  }
  
  public void setU(float paramFloat) {
    super.setU(paramFloat);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[3] = paramFloat;
    arrayOfFloat[8] = paramFloat;
  }
  
  public void setU2(float paramFloat) {
    super.setU2(paramFloat);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[13] = paramFloat;
    arrayOfFloat[18] = paramFloat;
  }
  
  public void setV(float paramFloat) {
    super.setV(paramFloat);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[9] = paramFloat;
    arrayOfFloat[14] = paramFloat;
  }
  
  public void setV2(float paramFloat) {
    super.setV2(paramFloat);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[4] = paramFloat;
    arrayOfFloat[19] = paramFloat;
  }
  
  public void setX(float paramFloat) { translateX(paramFloat - this.x); }
  
  public void setY(float paramFloat) { translateY(paramFloat - this.y); }
  
  public void translate(float paramFloat1, float paramFloat2) {
    this.x += paramFloat1;
    this.y += paramFloat2;
    if (this.dirty)
      return; 
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[0] = arrayOfFloat[0] + paramFloat1;
    arrayOfFloat[1] = arrayOfFloat[1] + paramFloat2;
    arrayOfFloat[5] = arrayOfFloat[5] + paramFloat1;
    arrayOfFloat[6] = arrayOfFloat[6] + paramFloat2;
    arrayOfFloat[10] = arrayOfFloat[10] + paramFloat1;
    arrayOfFloat[11] = arrayOfFloat[11] + paramFloat2;
    arrayOfFloat[15] = arrayOfFloat[15] + paramFloat1;
    arrayOfFloat[16] = arrayOfFloat[16] + paramFloat2;
  }
  
  public void translateX(float paramFloat) {
    this.x += paramFloat;
    if (this.dirty)
      return; 
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[0] = arrayOfFloat[0] + paramFloat;
    arrayOfFloat[5] = arrayOfFloat[5] + paramFloat;
    arrayOfFloat[10] = arrayOfFloat[10] + paramFloat;
    arrayOfFloat[15] = arrayOfFloat[15] + paramFloat;
  }
  
  public void translateY(float paramFloat) {
    this.y += paramFloat;
    if (this.dirty)
      return; 
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[1] = arrayOfFloat[1] + paramFloat;
    arrayOfFloat[6] = arrayOfFloat[6] + paramFloat;
    arrayOfFloat[11] = arrayOfFloat[11] + paramFloat;
    arrayOfFloat[16] = arrayOfFloat[16] + paramFloat;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/Sprite.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */