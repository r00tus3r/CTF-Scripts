package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class NinePatch {
  public static final int BOTTOM_CENTER = 7;
  
  public static final int BOTTOM_LEFT = 6;
  
  public static final int BOTTOM_RIGHT = 8;
  
  public static final int MIDDLE_CENTER = 4;
  
  public static final int MIDDLE_LEFT = 3;
  
  public static final int MIDDLE_RIGHT = 5;
  
  public static final int TOP_CENTER = 1;
  
  public static final int TOP_LEFT = 0;
  
  public static final int TOP_RIGHT = 2;
  
  private static final Color tmpDrawColor = new Color();
  
  private int bottomCenter = -1;
  
  private float bottomHeight;
  
  private int bottomLeft = -1;
  
  private int bottomRight = -1;
  
  private final Color color = new Color(Color.WHITE);
  
  private int idx;
  
  private float leftWidth;
  
  private int middleCenter = -1;
  
  private float middleHeight;
  
  private int middleLeft = -1;
  
  private int middleRight = -1;
  
  private float middleWidth;
  
  private float padBottom = -1.0F;
  
  private float padLeft = -1.0F;
  
  private float padRight = -1.0F;
  
  private float padTop = -1.0F;
  
  private float rightWidth;
  
  private Texture texture;
  
  private int topCenter = -1;
  
  private float topHeight;
  
  private int topLeft = -1;
  
  private int topRight = -1;
  
  private float[] vertices = new float[180];
  
  public NinePatch(Texture paramTexture) { this(new TextureRegion(paramTexture)); }
  
  public NinePatch(Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4) { this(new TextureRegion(paramTexture), paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public NinePatch(Texture paramTexture, Color paramColor) {
    this(paramTexture);
    setColor(paramColor);
  }
  
  public NinePatch(NinePatch paramNinePatch) { this(paramNinePatch, paramNinePatch.color); }
  
  public NinePatch(NinePatch paramNinePatch, Color paramColor) {
    this.texture = paramNinePatch.texture;
    this.bottomLeft = paramNinePatch.bottomLeft;
    this.bottomCenter = paramNinePatch.bottomCenter;
    this.bottomRight = paramNinePatch.bottomRight;
    this.middleLeft = paramNinePatch.middleLeft;
    this.middleCenter = paramNinePatch.middleCenter;
    this.middleRight = paramNinePatch.middleRight;
    this.topLeft = paramNinePatch.topLeft;
    this.topCenter = paramNinePatch.topCenter;
    this.topRight = paramNinePatch.topRight;
    this.leftWidth = paramNinePatch.leftWidth;
    this.rightWidth = paramNinePatch.rightWidth;
    this.middleWidth = paramNinePatch.middleWidth;
    this.middleHeight = paramNinePatch.middleHeight;
    this.topHeight = paramNinePatch.topHeight;
    this.bottomHeight = paramNinePatch.bottomHeight;
    this.padLeft = paramNinePatch.padLeft;
    this.padTop = paramNinePatch.padTop;
    this.padBottom = paramNinePatch.padBottom;
    this.padRight = paramNinePatch.padRight;
    this.vertices = new float[paramNinePatch.vertices.length];
    float[] arrayOfFloat = paramNinePatch.vertices;
    System.arraycopy(arrayOfFloat, 0, this.vertices, 0, arrayOfFloat.length);
    this.idx = paramNinePatch.idx;
    this.color.set(paramColor);
  }
  
  public NinePatch(TextureRegion paramTextureRegion) { load(new TextureRegion[] { null, null, null, null, paramTextureRegion, null, null, null, null }); }
  
  public NinePatch(TextureRegion paramTextureRegion, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (paramTextureRegion != null) {
      int i = paramTextureRegion.getRegionWidth() - paramInt1 - paramInt2;
      int j = paramTextureRegion.getRegionHeight() - paramInt3 - paramInt4;
      TextureRegion[] arrayOfTextureRegion = new TextureRegion[9];
      if (paramInt3 > 0) {
        if (paramInt1 > 0)
          arrayOfTextureRegion[0] = new TextureRegion(paramTextureRegion, false, false, paramInt1, paramInt3); 
        if (i > 0)
          arrayOfTextureRegion[1] = new TextureRegion(paramTextureRegion, paramInt1, false, i, paramInt3); 
        if (paramInt2 > 0)
          arrayOfTextureRegion[2] = new TextureRegion(paramTextureRegion, paramInt1 + i, false, paramInt2, paramInt3); 
      } 
      if (j > 0) {
        if (paramInt1 > 0)
          arrayOfTextureRegion[3] = new TextureRegion(paramTextureRegion, false, paramInt3, paramInt1, j); 
        if (i > 0)
          arrayOfTextureRegion[4] = new TextureRegion(paramTextureRegion, paramInt1, paramInt3, i, j); 
        if (paramInt2 > 0)
          arrayOfTextureRegion[5] = new TextureRegion(paramTextureRegion, paramInt1 + i, paramInt3, paramInt2, j); 
      } 
      if (paramInt4 > 0) {
        if (paramInt1 > 0)
          arrayOfTextureRegion[6] = new TextureRegion(paramTextureRegion, false, paramInt3 + j, paramInt1, paramInt4); 
        if (i > 0)
          arrayOfTextureRegion[7] = new TextureRegion(paramTextureRegion, paramInt1, paramInt3 + j, i, paramInt4); 
        if (paramInt2 > 0)
          arrayOfTextureRegion[8] = new TextureRegion(paramTextureRegion, paramInt1 + i, paramInt3 + j, paramInt2, paramInt4); 
      } 
      if (paramInt1 == 0 && i == 0) {
        arrayOfTextureRegion[1] = arrayOfTextureRegion[2];
        arrayOfTextureRegion[4] = arrayOfTextureRegion[5];
        arrayOfTextureRegion[7] = arrayOfTextureRegion[8];
        arrayOfTextureRegion[2] = null;
        arrayOfTextureRegion[5] = null;
        arrayOfTextureRegion[8] = null;
      } 
      if (paramInt3 == 0 && j == 0) {
        arrayOfTextureRegion[3] = arrayOfTextureRegion[6];
        arrayOfTextureRegion[4] = arrayOfTextureRegion[7];
        arrayOfTextureRegion[5] = arrayOfTextureRegion[8];
        arrayOfTextureRegion[6] = null;
        arrayOfTextureRegion[7] = null;
        arrayOfTextureRegion[8] = null;
      } 
      load(arrayOfTextureRegion);
      return;
    } 
    throw new IllegalArgumentException("region cannot be null.");
  }
  
  public NinePatch(TextureRegion paramTextureRegion, Color paramColor) {
    this(paramTextureRegion);
    setColor(paramColor);
  }
  
  public NinePatch(TextureRegion... paramVarArgs) {
    if (paramVarArgs != null && paramVarArgs.length == 9) {
      load(paramVarArgs);
      float f = getLeftWidth();
      if ((paramVarArgs[false] == null || paramVarArgs[0].getRegionWidth() == f) && (paramVarArgs[3] == null || paramVarArgs[3].getRegionWidth() == f) && (paramVarArgs[6] == null || paramVarArgs[6].getRegionWidth() == f)) {
        f = getRightWidth();
        if ((paramVarArgs[2] == null || paramVarArgs[2].getRegionWidth() == f) && (paramVarArgs[5] == null || paramVarArgs[5].getRegionWidth() == f) && (paramVarArgs[8] == null || paramVarArgs[8].getRegionWidth() == f)) {
          f = getBottomHeight();
          if ((paramVarArgs[6] == null || paramVarArgs[6].getRegionHeight() == f) && (paramVarArgs[7] == null || paramVarArgs[7].getRegionHeight() == f) && (paramVarArgs[8] == null || paramVarArgs[8].getRegionHeight() == f)) {
            f = getTopHeight();
            if ((paramVarArgs[false] == null || paramVarArgs[0].getRegionHeight() == f) && (paramVarArgs[true] == null || paramVarArgs[1].getRegionHeight() == f) && (paramVarArgs[2] == null || paramVarArgs[2].getRegionHeight() == f))
              return; 
            throw new GdxRuntimeException("Top side patches must have the same height");
          } 
          throw new GdxRuntimeException("Bottom side patches must have the same height");
        } 
        throw new GdxRuntimeException("Right side patches must have the same width");
      } 
      throw new GdxRuntimeException("Left side patches must have the same width");
    } 
    throw new IllegalArgumentException("NinePatch needs nine TextureRegions");
  }
  
  private int add(TextureRegion paramTextureRegion, float paramFloat, boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: aload_0
    //   1: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   4: astore #5
    //   6: aload #5
    //   8: ifnonnull -> 22
    //   11: aload_0
    //   12: aload_1
    //   13: invokevirtual getTexture : ()Lcom/badlogic/gdx/graphics/Texture;
    //   16: putfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   19: goto -> 31
    //   22: aload #5
    //   24: aload_1
    //   25: invokevirtual getTexture : ()Lcom/badlogic/gdx/graphics/Texture;
    //   28: if_acmpne -> 321
    //   31: aload_1
    //   32: getfield u : F
    //   35: fstore #6
    //   37: aload_1
    //   38: getfield v2 : F
    //   41: fstore #7
    //   43: aload_1
    //   44: getfield u2 : F
    //   47: fstore #8
    //   49: aload_1
    //   50: getfield v : F
    //   53: fstore #9
    //   55: aload_0
    //   56: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   59: invokevirtual getMagFilter : ()Lcom/badlogic/gdx/graphics/Texture$TextureFilter;
    //   62: getstatic com/badlogic/gdx/graphics/Texture$TextureFilter.Linear : Lcom/badlogic/gdx/graphics/Texture$TextureFilter;
    //   65: if_acmpeq -> 97
    //   68: fload #6
    //   70: fstore #10
    //   72: fload #7
    //   74: fstore #11
    //   76: fload #8
    //   78: fstore #12
    //   80: fload #9
    //   82: fstore #13
    //   84: aload_0
    //   85: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   88: invokevirtual getMinFilter : ()Lcom/badlogic/gdx/graphics/Texture$TextureFilter;
    //   91: getstatic com/badlogic/gdx/graphics/Texture$TextureFilter.Linear : Lcom/badlogic/gdx/graphics/Texture$TextureFilter;
    //   94: if_acmpne -> 192
    //   97: fload #6
    //   99: fstore #14
    //   101: fload #8
    //   103: fstore #15
    //   105: iload_3
    //   106: ifeq -> 136
    //   109: ldc 0.5
    //   111: aload_0
    //   112: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   115: invokevirtual getWidth : ()I
    //   118: i2f
    //   119: fdiv
    //   120: fstore #15
    //   122: fload #6
    //   124: fload #15
    //   126: fadd
    //   127: fstore #14
    //   129: fload #8
    //   131: fload #15
    //   133: fsub
    //   134: fstore #15
    //   136: fload #14
    //   138: fstore #10
    //   140: fload #7
    //   142: fstore #11
    //   144: fload #15
    //   146: fstore #12
    //   148: fload #9
    //   150: fstore #13
    //   152: iload #4
    //   154: ifeq -> 192
    //   157: ldc 0.5
    //   159: aload_0
    //   160: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   163: invokevirtual getHeight : ()I
    //   166: i2f
    //   167: fdiv
    //   168: fstore #8
    //   170: fload #7
    //   172: fload #8
    //   174: fsub
    //   175: fstore #11
    //   177: fload #9
    //   179: fload #8
    //   181: fadd
    //   182: fstore #13
    //   184: fload #15
    //   186: fstore #12
    //   188: fload #14
    //   190: fstore #10
    //   192: aload_0
    //   193: getfield vertices : [F
    //   196: astore_1
    //   197: aload_0
    //   198: getfield idx : I
    //   201: istore #16
    //   203: aload_1
    //   204: iload #16
    //   206: iconst_2
    //   207: iadd
    //   208: fload_2
    //   209: fastore
    //   210: aload_1
    //   211: iload #16
    //   213: iconst_3
    //   214: iadd
    //   215: fload #10
    //   217: fastore
    //   218: aload_1
    //   219: iload #16
    //   221: iconst_4
    //   222: iadd
    //   223: fload #11
    //   225: fastore
    //   226: aload_1
    //   227: iload #16
    //   229: bipush #7
    //   231: iadd
    //   232: fload_2
    //   233: fastore
    //   234: aload_1
    //   235: iload #16
    //   237: bipush #8
    //   239: iadd
    //   240: fload #10
    //   242: fastore
    //   243: aload_1
    //   244: iload #16
    //   246: bipush #9
    //   248: iadd
    //   249: fload #13
    //   251: fastore
    //   252: aload_1
    //   253: iload #16
    //   255: bipush #12
    //   257: iadd
    //   258: fload_2
    //   259: fastore
    //   260: aload_1
    //   261: iload #16
    //   263: bipush #13
    //   265: iadd
    //   266: fload #12
    //   268: fastore
    //   269: aload_1
    //   270: iload #16
    //   272: bipush #14
    //   274: iadd
    //   275: fload #13
    //   277: fastore
    //   278: aload_1
    //   279: iload #16
    //   281: bipush #17
    //   283: iadd
    //   284: fload_2
    //   285: fastore
    //   286: aload_1
    //   287: iload #16
    //   289: bipush #18
    //   291: iadd
    //   292: fload #12
    //   294: fastore
    //   295: aload_1
    //   296: iload #16
    //   298: bipush #19
    //   300: iadd
    //   301: fload #11
    //   303: fastore
    //   304: aload_0
    //   305: iload #16
    //   307: bipush #20
    //   309: iadd
    //   310: putfield idx : I
    //   313: aload_0
    //   314: getfield idx : I
    //   317: bipush #20
    //   319: isub
    //   320: ireturn
    //   321: new java/lang/IllegalArgumentException
    //   324: dup
    //   325: ldc 'All regions must be from the same texture.'
    //   327: invokespecial <init> : (Ljava/lang/String;)V
    //   330: athrow }
  
  private void load(TextureRegion[] paramArrayOfTextureRegion) {
    float f = Color.WHITE_FLOAT_BITS;
    if (paramArrayOfTextureRegion[6] != null) {
      this.bottomLeft = add(paramArrayOfTextureRegion[6], f, false, false);
      this.leftWidth = paramArrayOfTextureRegion[6].getRegionWidth();
      this.bottomHeight = paramArrayOfTextureRegion[6].getRegionHeight();
    } 
    if (paramArrayOfTextureRegion[7] != null) {
      this.bottomCenter = add(paramArrayOfTextureRegion[7], f, true, false);
      this.middleWidth = Math.max(this.middleWidth, paramArrayOfTextureRegion[7].getRegionWidth());
      this.bottomHeight = Math.max(this.bottomHeight, paramArrayOfTextureRegion[7].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[8] != null) {
      this.bottomRight = add(paramArrayOfTextureRegion[8], f, false, false);
      this.rightWidth = Math.max(this.rightWidth, paramArrayOfTextureRegion[8].getRegionWidth());
      this.bottomHeight = Math.max(this.bottomHeight, paramArrayOfTextureRegion[8].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[3] != null) {
      this.middleLeft = add(paramArrayOfTextureRegion[3], f, false, true);
      this.leftWidth = Math.max(this.leftWidth, paramArrayOfTextureRegion[3].getRegionWidth());
      this.middleHeight = Math.max(this.middleHeight, paramArrayOfTextureRegion[3].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[4] != null) {
      this.middleCenter = add(paramArrayOfTextureRegion[4], f, true, true);
      this.middleWidth = Math.max(this.middleWidth, paramArrayOfTextureRegion[4].getRegionWidth());
      this.middleHeight = Math.max(this.middleHeight, paramArrayOfTextureRegion[4].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[5] != null) {
      this.middleRight = add(paramArrayOfTextureRegion[5], f, false, true);
      this.rightWidth = Math.max(this.rightWidth, paramArrayOfTextureRegion[5].getRegionWidth());
      this.middleHeight = Math.max(this.middleHeight, paramArrayOfTextureRegion[5].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[false] != null) {
      this.topLeft = add(paramArrayOfTextureRegion[0], f, false, false);
      this.leftWidth = Math.max(this.leftWidth, paramArrayOfTextureRegion[0].getRegionWidth());
      this.topHeight = Math.max(this.topHeight, paramArrayOfTextureRegion[0].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[true] != null) {
      this.topCenter = add(paramArrayOfTextureRegion[1], f, true, false);
      this.middleWidth = Math.max(this.middleWidth, paramArrayOfTextureRegion[1].getRegionWidth());
      this.topHeight = Math.max(this.topHeight, paramArrayOfTextureRegion[1].getRegionHeight());
    } 
    if (paramArrayOfTextureRegion[2] != null) {
      this.topRight = add(paramArrayOfTextureRegion[2], f, false, false);
      this.rightWidth = Math.max(this.rightWidth, paramArrayOfTextureRegion[2].getRegionWidth());
      this.topHeight = Math.max(this.topHeight, paramArrayOfTextureRegion[2].getRegionHeight());
    } 
    int i = this.idx;
    float[] arrayOfFloat = this.vertices;
    if (i < arrayOfFloat.length) {
      float[] arrayOfFloat1 = new float[i];
      System.arraycopy(arrayOfFloat, 0, arrayOfFloat1, 0, i);
      this.vertices = arrayOfFloat1;
    } 
  }
  
  private void prepareVertices(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    float f1 = paramFloat1 + this.leftWidth;
    float f2 = paramFloat1 + paramFloat3;
    float f3 = f2 - this.rightWidth;
    paramFloat3 = paramFloat2 + this.bottomHeight;
    float f4 = paramFloat2 + paramFloat4;
    float f5 = f4 - this.topHeight;
    paramFloat4 = tmpDrawColor.set(this.color).mul(paramBatch.getColor()).toFloatBits();
    int i = this.bottomLeft;
    if (i != -1)
      set(i, paramFloat1, paramFloat2, f1 - paramFloat1, paramFloat3 - paramFloat2, paramFloat4); 
    i = this.bottomCenter;
    if (i != -1)
      set(i, f1, paramFloat2, f3 - f1, paramFloat3 - paramFloat2, paramFloat4); 
    i = this.bottomRight;
    if (i != -1)
      set(i, f3, paramFloat2, f2 - f3, paramFloat3 - paramFloat2, paramFloat4); 
    i = this.middleLeft;
    if (i != -1)
      set(i, paramFloat1, paramFloat3, f1 - paramFloat1, f5 - paramFloat3, paramFloat4); 
    i = this.middleCenter;
    if (i != -1)
      set(i, f1, paramFloat3, f3 - f1, f5 - paramFloat3, paramFloat4); 
    i = this.middleRight;
    if (i != -1)
      set(i, f3, paramFloat3, f2 - f3, f5 - paramFloat3, paramFloat4); 
    i = this.topLeft;
    if (i != -1)
      set(i, paramFloat1, f5, f1 - paramFloat1, f4 - f5, paramFloat4); 
    i = this.topCenter;
    if (i != -1)
      set(i, f1, f5, f3 - f1, f4 - f5, paramFloat4); 
    i = this.topRight;
    if (i != -1)
      set(i, f3, f5, f2 - f3, f4 - f5, paramFloat4); 
  }
  
  private void set(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    paramFloat3 += paramFloat1;
    paramFloat4 += paramFloat2;
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[paramInt] = paramFloat1;
    arrayOfFloat[paramInt + 1] = paramFloat2;
    arrayOfFloat[paramInt + 2] = paramFloat5;
    arrayOfFloat[paramInt + 5] = paramFloat1;
    arrayOfFloat[paramInt + 6] = paramFloat4;
    arrayOfFloat[paramInt + 7] = paramFloat5;
    arrayOfFloat[paramInt + 10] = paramFloat3;
    arrayOfFloat[paramInt + 11] = paramFloat4;
    arrayOfFloat[paramInt + 12] = paramFloat5;
    arrayOfFloat[paramInt + 15] = paramFloat3;
    arrayOfFloat[paramInt + 16] = paramFloat2;
    arrayOfFloat[paramInt + 17] = paramFloat5;
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    prepareVertices(paramBatch, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    paramBatch.draw(this.texture, this.vertices, 0, this.idx);
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    prepareVertices(paramBatch, paramFloat1, paramFloat2, paramFloat5, paramFloat6);
    paramFloat1 += paramFloat3;
    paramFloat5 = paramFloat2 + paramFloat4;
    int i = this.idx;
    float[] arrayOfFloat = this.vertices;
    if (paramFloat9 != 0.0F) {
      for (boolean bool = false; bool < i; bool += true) {
        paramFloat2 = (arrayOfFloat[bool] - paramFloat1) * paramFloat7;
        boolean bool1 = bool + true;
        paramFloat3 = (arrayOfFloat[bool1] - paramFloat5) * paramFloat8;
        paramFloat6 = MathUtils.cosDeg(paramFloat9);
        paramFloat4 = MathUtils.sinDeg(paramFloat9);
        arrayOfFloat[bool] = paramFloat6 * paramFloat2 - paramFloat4 * paramFloat3 + paramFloat1;
        arrayOfFloat[bool1] = paramFloat4 * paramFloat2 + paramFloat6 * paramFloat3 + paramFloat5;
      } 
    } else if (paramFloat7 != 1.0F || paramFloat8 != 1.0F) {
      for (boolean bool = false; bool < i; bool += true) {
        arrayOfFloat[bool] = (arrayOfFloat[bool] - paramFloat1) * paramFloat7 + paramFloat1;
        boolean bool1 = bool + true;
        arrayOfFloat[bool1] = (arrayOfFloat[bool1] - paramFloat5) * paramFloat8 + paramFloat5;
      } 
    } 
    paramBatch.draw(this.texture, arrayOfFloat, 0, i);
  }
  
  public float getBottomHeight() { return this.bottomHeight; }
  
  public Color getColor() { return this.color; }
  
  public float getLeftWidth() { return this.leftWidth; }
  
  public float getMiddleHeight() { return this.middleHeight; }
  
  public float getMiddleWidth() { return this.middleWidth; }
  
  public float getPadBottom() {
    float f1 = this.padBottom;
    float f2 = f1;
    if (f1 == -1.0F)
      f2 = getBottomHeight(); 
    return f2;
  }
  
  public float getPadLeft() {
    float f1 = this.padLeft;
    float f2 = f1;
    if (f1 == -1.0F)
      f2 = getLeftWidth(); 
    return f2;
  }
  
  public float getPadRight() {
    float f1 = this.padRight;
    float f2 = f1;
    if (f1 == -1.0F)
      f2 = getRightWidth(); 
    return f2;
  }
  
  public float getPadTop() {
    float f1 = this.padTop;
    float f2 = f1;
    if (f1 == -1.0F)
      f2 = getTopHeight(); 
    return f2;
  }
  
  public float getRightWidth() { return this.rightWidth; }
  
  public Texture getTexture() { return this.texture; }
  
  public float getTopHeight() { return this.topHeight; }
  
  public float getTotalHeight() { return this.topHeight + this.middleHeight + this.bottomHeight; }
  
  public float getTotalWidth() { return this.leftWidth + this.middleWidth + this.rightWidth; }
  
  public void scale(float paramFloat1, float paramFloat2) {
    this.leftWidth *= paramFloat1;
    this.rightWidth *= paramFloat1;
    this.topHeight *= paramFloat2;
    this.bottomHeight *= paramFloat2;
    this.middleWidth *= paramFloat1;
    this.middleHeight *= paramFloat2;
    float f = this.padLeft;
    if (f != -1.0F)
      this.padLeft = f * paramFloat1; 
    f = this.padRight;
    if (f != -1.0F)
      this.padRight = f * paramFloat1; 
    paramFloat1 = this.padTop;
    if (paramFloat1 != -1.0F)
      this.padTop = paramFloat1 * paramFloat2; 
    paramFloat1 = this.padBottom;
    if (paramFloat1 != -1.0F)
      this.padBottom = paramFloat1 * paramFloat2; 
  }
  
  public void setBottomHeight(float paramFloat) { this.bottomHeight = paramFloat; }
  
  public void setColor(Color paramColor) { this.color.set(paramColor); }
  
  public void setLeftWidth(float paramFloat) { this.leftWidth = paramFloat; }
  
  public void setMiddleHeight(float paramFloat) { this.middleHeight = paramFloat; }
  
  public void setMiddleWidth(float paramFloat) { this.middleWidth = paramFloat; }
  
  public void setPadBottom(float paramFloat) { this.padBottom = paramFloat; }
  
  public void setPadLeft(float paramFloat) { this.padLeft = paramFloat; }
  
  public void setPadRight(float paramFloat) { this.padRight = paramFloat; }
  
  public void setPadTop(float paramFloat) { this.padTop = paramFloat; }
  
  public void setPadding(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.padLeft = paramFloat1;
    this.padRight = paramFloat2;
    this.padTop = paramFloat3;
    this.padBottom = paramFloat4;
  }
  
  public void setRightWidth(float paramFloat) { this.rightWidth = paramFloat; }
  
  public void setTopHeight(float paramFloat) { this.topHeight = paramFloat; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/NinePatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */