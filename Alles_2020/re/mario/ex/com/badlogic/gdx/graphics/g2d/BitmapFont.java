package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class BitmapFont implements Disposable {
  private static final int LOG2_PAGE_SIZE = 9;
  
  private static final int PAGES = 128;
  
  private static final int PAGE_SIZE = 512;
  
  private final BitmapFontCache cache;
  
  final BitmapFontData data;
  
  private boolean flipped;
  
  boolean integer;
  
  private boolean ownsTexture;
  
  Array<TextureRegion> regions;
  
  public BitmapFont() { this(Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.fnt"), Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.png"), false, true); }
  
  public BitmapFont(FileHandle paramFileHandle) { this(paramFileHandle, false); }
  
  public BitmapFont(FileHandle paramFileHandle1, FileHandle paramFileHandle2, boolean paramBoolean) { this(paramFileHandle1, paramFileHandle2, paramBoolean, true); }
  
  public BitmapFont(FileHandle paramFileHandle1, FileHandle paramFileHandle2, boolean paramBoolean1, boolean paramBoolean2) {
    this(new BitmapFontData(paramFileHandle1, paramBoolean1), new TextureRegion(new Texture(paramFileHandle2, false)), paramBoolean2);
    this.ownsTexture = true;
  }
  
  public BitmapFont(FileHandle paramFileHandle, TextureRegion paramTextureRegion) { this(paramFileHandle, paramTextureRegion, false); }
  
  public BitmapFont(FileHandle paramFileHandle, TextureRegion paramTextureRegion, boolean paramBoolean) { this(new BitmapFontData(paramFileHandle, paramBoolean), paramTextureRegion, true); }
  
  public BitmapFont(FileHandle paramFileHandle, boolean paramBoolean) { this(new BitmapFontData(paramFileHandle, paramBoolean), (TextureRegion)null, true); }
  
  public BitmapFont(BitmapFontData paramBitmapFontData, TextureRegion paramTextureRegion, boolean paramBoolean) { this(paramBitmapFontData, paramTextureRegion, paramBoolean); }
  
  public BitmapFont(BitmapFontData paramBitmapFontData, Array<TextureRegion> paramArray, boolean paramBoolean) {
    this.flipped = paramBitmapFontData.flipped;
    this.data = paramBitmapFontData;
    this.integer = paramBoolean;
    if (paramArray == null || paramArray.size == 0) {
      if (paramBitmapFontData.imagePaths != null) {
        int i = paramBitmapFontData.imagePaths.length;
        this.regions = new Array(i);
        for (byte b = 0; b < i; b++) {
          if (paramBitmapFontData.fontFile == null) {
            fileHandle = Gdx.files.internal(paramBitmapFontData.imagePaths[b]);
          } else {
            fileHandle = Gdx.files.getFileHandle(paramBitmapFontData.imagePaths[b], paramBitmapFontData.fontFile.type());
          } 
          this.regions.add(new TextureRegion(new Texture(fileHandle, false)));
        } 
        this.ownsTexture = true;
      } else {
        illegalArgumentException = new IllegalArgumentException("If no regions are specified, the font data must have an images path.");
        throw illegalArgumentException;
      } 
    } else {
      this.regions = fileHandle;
      this.ownsTexture = false;
    } 
    this.cache = newFontCache();
    load(illegalArgumentException);
  }
  
  public BitmapFont(boolean paramBoolean) { this(Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.fnt"), Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.png"), paramBoolean, true); }
  
  static int indexOf(CharSequence paramCharSequence, char paramChar, int paramInt) {
    int i = paramCharSequence.length();
    while (paramInt < i) {
      if (paramCharSequence.charAt(paramInt) == paramChar)
        return paramInt; 
      paramInt++;
    } 
    return i;
  }
  
  public void dispose() {
    if (this.ownsTexture)
      for (byte b = 0; b < this.regions.size; b++)
        ((TextureRegion)this.regions.get(b)).getTexture().dispose();  
  }
  
  public GlyphLayout draw(Batch paramBatch, CharSequence paramCharSequence, float paramFloat1, float paramFloat2) {
    this.cache.clear();
    GlyphLayout glyphLayout = this.cache.addText(paramCharSequence, paramFloat1, paramFloat2);
    this.cache.draw(paramBatch);
    return glyphLayout;
  }
  
  public GlyphLayout draw(Batch paramBatch, CharSequence paramCharSequence, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, boolean paramBoolean) {
    this.cache.clear();
    GlyphLayout glyphLayout = this.cache.addText(paramCharSequence, paramFloat1, paramFloat2, paramFloat3, paramInt, paramBoolean);
    this.cache.draw(paramBatch);
    return glyphLayout;
  }
  
  public GlyphLayout draw(Batch paramBatch, CharSequence paramCharSequence, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, int paramInt3, boolean paramBoolean) {
    this.cache.clear();
    GlyphLayout glyphLayout = this.cache.addText(paramCharSequence, paramFloat1, paramFloat2, paramInt1, paramInt2, paramFloat3, paramInt3, paramBoolean);
    this.cache.draw(paramBatch);
    return glyphLayout;
  }
  
  public GlyphLayout draw(Batch paramBatch, CharSequence paramCharSequence, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, int paramInt3, boolean paramBoolean, String paramString) {
    this.cache.clear();
    GlyphLayout glyphLayout = this.cache.addText(paramCharSequence, paramFloat1, paramFloat2, paramInt1, paramInt2, paramFloat3, paramInt3, paramBoolean, paramString);
    this.cache.draw(paramBatch);
    return glyphLayout;
  }
  
  public void draw(Batch paramBatch, GlyphLayout paramGlyphLayout, float paramFloat1, float paramFloat2) {
    this.cache.clear();
    this.cache.addText(paramGlyphLayout, paramFloat1, paramFloat2);
    this.cache.draw(paramBatch);
  }
  
  public float getAscent() { return this.data.ascent; }
  
  public BitmapFontCache getCache() { return this.cache; }
  
  public float getCapHeight() { return this.data.capHeight; }
  
  public Color getColor() { return this.cache.getColor(); }
  
  public BitmapFontData getData() { return this.data; }
  
  public float getDescent() { return this.data.descent; }
  
  public float getLineHeight() { return this.data.lineHeight; }
  
  public TextureRegion getRegion() { return (TextureRegion)this.regions.first(); }
  
  public TextureRegion getRegion(int paramInt) { return (TextureRegion)this.regions.get(paramInt); }
  
  public Array<TextureRegion> getRegions() { return this.regions; }
  
  public float getScaleX() { return this.data.scaleX; }
  
  public float getScaleY() { return this.data.scaleY; }
  
  public float getSpaceXadvance() { return this.data.spaceXadvance; }
  
  public float getXHeight() { return this.data.xHeight; }
  
  public boolean isFlipped() { return this.flipped; }
  
  protected void load(BitmapFontData paramBitmapFontData) {
    for (Glyph[] arrayOfGlyph : paramBitmapFontData.glyphs) {
      if (arrayOfGlyph != null) {
        int i = arrayOfGlyph.length;
        for (byte b = 0; b < i; b++) {
          Glyph glyph = arrayOfGlyph[b];
          if (glyph != null)
            paramBitmapFontData.setGlyphRegion(glyph, (TextureRegion)this.regions.get(glyph.page)); 
        } 
      } 
    } 
    if (paramBitmapFontData.missingGlyph != null)
      paramBitmapFontData.setGlyphRegion(paramBitmapFontData.missingGlyph, (TextureRegion)this.regions.get(paramBitmapFontData.missingGlyph.page)); 
  }
  
  public BitmapFontCache newFontCache() { return new BitmapFontCache(this, this.integer); }
  
  public boolean ownsTexture() { return this.ownsTexture; }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.cache.getColor().set(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setColor(Color paramColor) { this.cache.getColor().set(paramColor); }
  
  public void setFixedWidthGlyphs(CharSequence paramCharSequence) {
    BitmapFontData bitmapFontData = this.data;
    int i = paramCharSequence.length();
    boolean bool = false;
    int j = 0;
    int k;
    for (k = 0; j < i; k = m) {
      Glyph glyph = bitmapFontData.getGlyph(paramCharSequence.charAt(j));
      int m = k;
      if (glyph != null) {
        m = k;
        if (glyph.xadvance > k)
          m = glyph.xadvance; 
      } 
      j++;
    } 
    j = paramCharSequence.length();
    for (byte b = bool; b < j; b++) {
      Glyph glyph = bitmapFontData.getGlyph(paramCharSequence.charAt(b));
      if (glyph != null) {
        glyph.xoffset += Math.round(((k - glyph.xadvance) / 2));
        glyph.xadvance = k;
        glyph.kerning = (byte[][])null;
        glyph.fixedWidth = true;
      } 
    } 
  }
  
  public void setOwnsTexture(boolean paramBoolean) { this.ownsTexture = paramBoolean; }
  
  public void setUseIntegerPositions(boolean paramBoolean) {
    this.integer = paramBoolean;
    this.cache.setUseIntegerPositions(paramBoolean);
  }
  
  public String toString() {
    String str;
    if (this.data.name != null) {
      str = this.data.name;
    } else {
      str = super.toString();
    } 
    return str;
  }
  
  public boolean usesIntegerPositions() { return this.integer; }
  
  public static class BitmapFontData {
    public float ascent;
    
    public float blankLineScale = 1.0F;
    
    public char[] breakChars;
    
    public char[] capChars = { 
        'M', 'N', 'B', 'D', 'C', 'E', 'F', 'K', 'A', 'G', 
        'H', 'I', 'J', 'L', 'O', 'P', 'Q', 'R', 'S', 'T', 
        'U', 'V', 'W', 'X', 'Y', 'Z' };
    
    public float capHeight = 1.0F;
    
    public float cursorX;
    
    public float descent;
    
    public float down;
    
    public boolean flipped;
    
    public FileHandle fontFile;
    
    public final BitmapFont.Glyph[][] glyphs = new Glyph[128][];
    
    public String[] imagePaths;
    
    public float lineHeight;
    
    public boolean markupEnabled;
    
    public BitmapFont.Glyph missingGlyph;
    
    public String name;
    
    public float padBottom;
    
    public float padLeft;
    
    public float padRight;
    
    public float padTop;
    
    public float scaleX = 1.0F;
    
    public float scaleY = 1.0F;
    
    public float spaceXadvance;
    
    public char[] xChars = { 
        'x', 'e', 'a', 'o', 'n', 's', 'r', 'c', 'u', 'm', 
        'v', 'w', 'z' };
    
    public float xHeight = 1.0F;
    
    public BitmapFontData() {}
    
    public BitmapFontData(FileHandle param1FileHandle, boolean param1Boolean) {
      this.fontFile = param1FileHandle;
      this.flipped = param1Boolean;
      load(param1FileHandle, param1Boolean);
    }
    
    public BitmapFont.Glyph getFirstGlyph() {
      for (BitmapFont.Glyph[] arrayOfGlyph : this.glyphs) {
        if (arrayOfGlyph != null) {
          int i = arrayOfGlyph.length;
          byte b = 0;
          while (b < i) {
            BitmapFont.Glyph glyph = arrayOfGlyph[b];
            if (glyph == null || glyph.height == 0 || glyph.width == 0) {
              b++;
              continue;
            } 
            return glyph;
          } 
        } 
      } 
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("No glyphs found.");
      throw gdxRuntimeException;
    }
    
    public FileHandle getFontFile() { return this.fontFile; }
    
    public BitmapFont.Glyph getGlyph(char param1Char) {
      BitmapFont.Glyph[] arrayOfGlyph = this.glyphs[param1Char / 'Ȁ'];
      return (arrayOfGlyph != null) ? arrayOfGlyph[param1Char & 0x1FF] : null;
    }
    
    public void getGlyphs(GlyphLayout.GlyphRun param1GlyphRun, CharSequence param1CharSequence, int param1Int1, int param1Int2, BitmapFont.Glyph param1Glyph) { // Byte code:
      //   0: aload_0
      //   1: getfield markupEnabled : Z
      //   4: istore #6
      //   6: aload_0
      //   7: getfield scaleX : F
      //   10: fstore #7
      //   12: aload_0
      //   13: getfield missingGlyph : Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   16: astore #8
      //   18: aload_1
      //   19: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
      //   22: astore #9
      //   24: aload_1
      //   25: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
      //   28: astore #10
      //   30: iload #4
      //   32: iload_3
      //   33: isub
      //   34: istore #11
      //   36: aload #9
      //   38: iload #11
      //   40: invokevirtual ensureCapacity : (I)[Ljava/lang/Object;
      //   43: pop
      //   44: aload #10
      //   46: iload #11
      //   48: iconst_1
      //   49: iadd
      //   50: invokevirtual ensureCapacity : (I)[F
      //   53: pop
      //   54: iload_3
      //   55: iload #4
      //   57: if_icmpge -> 241
      //   60: iload_3
      //   61: iconst_1
      //   62: iadd
      //   63: istore #11
      //   65: aload_2
      //   66: iload_3
      //   67: invokeinterface charAt : (I)C
      //   72: istore #12
      //   74: iload #12
      //   76: bipush #13
      //   78: if_icmpne -> 84
      //   81: goto -> 105
      //   84: aload_0
      //   85: iload #12
      //   87: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   90: astore #13
      //   92: aload #13
      //   94: astore_1
      //   95: aload #13
      //   97: ifnonnull -> 114
      //   100: aload #8
      //   102: ifnonnull -> 111
      //   105: iload #11
      //   107: istore_3
      //   108: goto -> 54
      //   111: aload #8
      //   113: astore_1
      //   114: aload #9
      //   116: aload_1
      //   117: invokevirtual add : (Ljava/lang/Object;)V
      //   120: aload #5
      //   122: ifnonnull -> 164
      //   125: aload_1
      //   126: getfield fixedWidth : Z
      //   129: ifeq -> 138
      //   132: fconst_0
      //   133: fstore #14
      //   135: goto -> 154
      //   138: aload_1
      //   139: getfield xoffset : I
      //   142: ineg
      //   143: i2f
      //   144: fload #7
      //   146: fmul
      //   147: aload_0
      //   148: getfield padLeft : F
      //   151: fsub
      //   152: fstore #14
      //   154: aload #10
      //   156: fload #14
      //   158: invokevirtual add : (F)V
      //   161: goto -> 186
      //   164: aload #10
      //   166: aload #5
      //   168: getfield xadvance : I
      //   171: aload #5
      //   173: iload #12
      //   175: invokevirtual getKerning : (C)I
      //   178: iadd
      //   179: i2f
      //   180: fload #7
      //   182: fmul
      //   183: invokevirtual add : (F)V
      //   186: iload #11
      //   188: istore_3
      //   189: iload #6
      //   191: ifeq -> 235
      //   194: iload #11
      //   196: istore_3
      //   197: iload #12
      //   199: bipush #91
      //   201: if_icmpne -> 235
      //   204: iload #11
      //   206: istore_3
      //   207: iload #11
      //   209: iload #4
      //   211: if_icmpge -> 235
      //   214: iload #11
      //   216: istore_3
      //   217: aload_2
      //   218: iload #11
      //   220: invokeinterface charAt : (I)C
      //   225: bipush #91
      //   227: if_icmpne -> 235
      //   230: iload #11
      //   232: iconst_1
      //   233: iadd
      //   234: istore_3
      //   235: aload_1
      //   236: astore #5
      //   238: goto -> 54
      //   241: aload #5
      //   243: ifnull -> 297
      //   246: aload #5
      //   248: getfield fixedWidth : Z
      //   251: ifeq -> 268
      //   254: aload #5
      //   256: getfield xadvance : I
      //   259: i2f
      //   260: fload #7
      //   262: fmul
      //   263: fstore #14
      //   265: goto -> 290
      //   268: aload #5
      //   270: getfield width : I
      //   273: aload #5
      //   275: getfield xoffset : I
      //   278: iadd
      //   279: i2f
      //   280: fload #7
      //   282: fmul
      //   283: aload_0
      //   284: getfield padRight : F
      //   287: fsub
      //   288: fstore #14
      //   290: aload #10
      //   292: fload #14
      //   294: invokevirtual add : (F)V
      //   297: return }
    
    public String getImagePath(int param1Int) { return this.imagePaths[param1Int]; }
    
    public String[] getImagePaths() { return this.imagePaths; }
    
    public int getWrapIndex(Array<BitmapFont.Glyph> param1Array, int param1Int) { // Byte code:
      //   0: iload_2
      //   1: iconst_1
      //   2: isub
      //   3: istore_3
      //   4: aload_1
      //   5: iload_3
      //   6: invokevirtual get : (I)Ljava/lang/Object;
      //   9: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
      //   12: getfield id : I
      //   15: i2c
      //   16: istore #4
      //   18: aload_0
      //   19: iload #4
      //   21: invokevirtual isWhitespace : (C)Z
      //   24: ifeq -> 29
      //   27: iload_3
      //   28: ireturn
      //   29: iload_3
      //   30: istore_2
      //   31: aload_0
      //   32: iload #4
      //   34: invokevirtual isBreakChar : (C)Z
      //   37: ifeq -> 44
      //   40: iload_3
      //   41: iconst_1
      //   42: isub
      //   43: istore_2
      //   44: iload_2
      //   45: ifle -> 90
      //   48: aload_1
      //   49: iload_2
      //   50: invokevirtual get : (I)Ljava/lang/Object;
      //   53: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
      //   56: getfield id : I
      //   59: i2c
      //   60: istore #4
      //   62: aload_0
      //   63: iload #4
      //   65: invokevirtual isBreakChar : (C)Z
      //   68: ifeq -> 75
      //   71: iload_2
      //   72: iconst_1
      //   73: iadd
      //   74: ireturn
      //   75: iload_2
      //   76: istore_3
      //   77: aload_0
      //   78: iload #4
      //   80: invokevirtual isWhitespace : (C)Z
      //   83: ifeq -> 40
      //   86: iload_2
      //   87: iconst_1
      //   88: iadd
      //   89: ireturn
      //   90: iconst_0
      //   91: ireturn }
    
    public boolean hasGlyph(char param1Char) {
      BitmapFont.Glyph glyph = this.missingGlyph;
      boolean bool = true;
      if (glyph != null)
        return true; 
      if (getGlyph(param1Char) == null)
        bool = false; 
      return bool;
    }
    
    public boolean isBreakChar(char param1Char) {
      char[] arrayOfChar = this.breakChars;
      if (arrayOfChar == null)
        return false; 
      int i = arrayOfChar.length;
      for (byte b = 0; b < i; b++) {
        if (param1Char == arrayOfChar[b])
          return true; 
      } 
      return false;
    }
    
    public boolean isWhitespace(char param1Char) { return !(param1Char != '\t' && param1Char != '\n' && param1Char != '\r' && param1Char != ' '); }
    
    public void load(FileHandle param1FileHandle, boolean param1Boolean) { // Byte code:
      //   0: aload_0
      //   1: getfield imagePaths : [Ljava/lang/String;
      //   4: ifnonnull -> 3153
      //   7: aload_0
      //   8: aload_1
      //   9: invokevirtual nameWithoutExtension : ()Ljava/lang/String;
      //   12: putfield name : Ljava/lang/String;
      //   15: new java/io/BufferedReader
      //   18: dup
      //   19: new java/io/InputStreamReader
      //   22: dup
      //   23: aload_1
      //   24: invokevirtual read : ()Ljava/io/InputStream;
      //   27: invokespecial <init> : (Ljava/io/InputStream;)V
      //   30: sipush #512
      //   33: invokespecial <init> : (Ljava/io/Reader;I)V
      //   36: astore_3
      //   37: aload_3
      //   38: astore #4
      //   40: aload_3
      //   41: astore #5
      //   43: aload_3
      //   44: invokevirtual readLine : ()Ljava/lang/String;
      //   47: astore #6
      //   49: aload #6
      //   51: ifnull -> 3022
      //   54: aload_3
      //   55: astore #4
      //   57: aload_3
      //   58: astore #5
      //   60: aload #6
      //   62: aload #6
      //   64: ldc 'padding='
      //   66: invokevirtual indexOf : (Ljava/lang/String;)I
      //   69: bipush #8
      //   71: iadd
      //   72: invokevirtual substring : (I)Ljava/lang/String;
      //   75: astore #6
      //   77: aload_3
      //   78: astore #4
      //   80: aload_3
      //   81: astore #5
      //   83: aload #6
      //   85: iconst_0
      //   86: aload #6
      //   88: bipush #32
      //   90: invokevirtual indexOf : (I)I
      //   93: invokevirtual substring : (II)Ljava/lang/String;
      //   96: ldc_w ','
      //   99: iconst_4
      //   100: invokevirtual split : (Ljava/lang/String;I)[Ljava/lang/String;
      //   103: astore #6
      //   105: aload_3
      //   106: astore #4
      //   108: aload_3
      //   109: astore #5
      //   111: aload #6
      //   113: arraylength
      //   114: iconst_4
      //   115: if_icmpne -> 2982
      //   118: aload_3
      //   119: astore #4
      //   121: aload_3
      //   122: astore #5
      //   124: aload_0
      //   125: aload #6
      //   127: iconst_0
      //   128: aaload
      //   129: invokestatic parseInt : (Ljava/lang/String;)I
      //   132: i2f
      //   133: putfield padTop : F
      //   136: iconst_1
      //   137: istore #7
      //   139: aload_3
      //   140: astore #4
      //   142: aload_3
      //   143: astore #5
      //   145: aload_0
      //   146: aload #6
      //   148: iconst_1
      //   149: aaload
      //   150: invokestatic parseInt : (Ljava/lang/String;)I
      //   153: i2f
      //   154: putfield padRight : F
      //   157: aload_3
      //   158: astore #4
      //   160: aload_3
      //   161: astore #5
      //   163: aload_0
      //   164: aload #6
      //   166: iconst_2
      //   167: aaload
      //   168: invokestatic parseInt : (Ljava/lang/String;)I
      //   171: i2f
      //   172: putfield padBottom : F
      //   175: aload_3
      //   176: astore #4
      //   178: aload_3
      //   179: astore #5
      //   181: aload_0
      //   182: aload #6
      //   184: iconst_3
      //   185: aaload
      //   186: invokestatic parseInt : (Ljava/lang/String;)I
      //   189: i2f
      //   190: putfield padLeft : F
      //   193: aload_3
      //   194: astore #4
      //   196: aload_3
      //   197: astore #5
      //   199: aload_0
      //   200: getfield padTop : F
      //   203: aload_0
      //   204: getfield padBottom : F
      //   207: fadd
      //   208: fstore #8
      //   210: aload_3
      //   211: astore #4
      //   213: aload_3
      //   214: astore #5
      //   216: aload_3
      //   217: invokevirtual readLine : ()Ljava/lang/String;
      //   220: astore #6
      //   222: aload #6
      //   224: ifnull -> 2942
      //   227: aload_3
      //   228: astore #4
      //   230: aload_3
      //   231: astore #5
      //   233: aload #6
      //   235: ldc_w ' '
      //   238: bipush #9
      //   240: invokevirtual split : (Ljava/lang/String;I)[Ljava/lang/String;
      //   243: astore #6
      //   245: aload_3
      //   246: astore #4
      //   248: aload_3
      //   249: astore #5
      //   251: aload #6
      //   253: arraylength
      //   254: iconst_3
      //   255: if_icmplt -> 2902
      //   258: aload_3
      //   259: astore #4
      //   261: aload_3
      //   262: astore #5
      //   264: aload #6
      //   266: iconst_1
      //   267: aaload
      //   268: ldc_w 'lineHeight='
      //   271: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   274: ifeq -> 2862
      //   277: aload_3
      //   278: astore #4
      //   280: aload_3
      //   281: astore #5
      //   283: aload_0
      //   284: aload #6
      //   286: iconst_1
      //   287: aaload
      //   288: bipush #11
      //   290: invokevirtual substring : (I)Ljava/lang/String;
      //   293: invokestatic parseInt : (Ljava/lang/String;)I
      //   296: i2f
      //   297: putfield lineHeight : F
      //   300: aload_3
      //   301: astore #4
      //   303: aload_3
      //   304: astore #5
      //   306: aload #6
      //   308: iconst_2
      //   309: aaload
      //   310: ldc_w 'base='
      //   313: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   316: ifeq -> 2822
      //   319: aload_3
      //   320: astore #4
      //   322: aload_3
      //   323: astore #5
      //   325: aload #6
      //   327: iconst_2
      //   328: aaload
      //   329: iconst_5
      //   330: invokevirtual substring : (I)Ljava/lang/String;
      //   333: invokestatic parseInt : (Ljava/lang/String;)I
      //   336: i2f
      //   337: fstore #9
      //   339: aload_3
      //   340: astore #4
      //   342: aload_3
      //   343: astore #5
      //   345: aload #6
      //   347: arraylength
      //   348: bipush #6
      //   350: if_icmplt -> 410
      //   353: aload #6
      //   355: iconst_5
      //   356: aaload
      //   357: ifnull -> 410
      //   360: aload_3
      //   361: astore #4
      //   363: aload_3
      //   364: astore #5
      //   366: aload #6
      //   368: iconst_5
      //   369: aaload
      //   370: ldc_w 'pages='
      //   373: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   376: istore #10
      //   378: iload #10
      //   380: ifeq -> 410
      //   383: aload_3
      //   384: astore #4
      //   386: aload_3
      //   387: astore #5
      //   389: iconst_1
      //   390: aload #6
      //   392: iconst_5
      //   393: aaload
      //   394: bipush #6
      //   396: invokevirtual substring : (I)Ljava/lang/String;
      //   399: invokestatic parseInt : (Ljava/lang/String;)I
      //   402: invokestatic max : (II)I
      //   405: istore #11
      //   407: goto -> 413
      //   410: iconst_1
      //   411: istore #11
      //   413: aload_3
      //   414: astore #4
      //   416: aload_3
      //   417: astore #5
      //   419: aload_0
      //   420: iload #11
      //   422: anewarray java/lang/String
      //   425: putfield imagePaths : [Ljava/lang/String;
      //   428: iconst_0
      //   429: istore #12
      //   431: iload #12
      //   433: iload #11
      //   435: if_icmpge -> 854
      //   438: aload_3
      //   439: astore #4
      //   441: aload_3
      //   442: astore #5
      //   444: aload_3
      //   445: invokevirtual readLine : ()Ljava/lang/String;
      //   448: astore #13
      //   450: aload #13
      //   452: ifnull -> 820
      //   455: aload_3
      //   456: astore #4
      //   458: aload_3
      //   459: astore #5
      //   461: ldc_w '.*id=(\d+)'
      //   464: invokestatic compile : (Ljava/lang/String;)Ljava/util/regex/Pattern;
      //   467: aload #13
      //   469: invokevirtual matcher : (Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
      //   472: astore #6
      //   474: aload_3
      //   475: astore #4
      //   477: aload_3
      //   478: astore #5
      //   480: aload #6
      //   482: invokevirtual find : ()Z
      //   485: ifeq -> 699
      //   488: aload_3
      //   489: astore #4
      //   491: aload_3
      //   492: astore #5
      //   494: aload #6
      //   496: iconst_1
      //   497: invokevirtual group : (I)Ljava/lang/String;
      //   500: astore #6
      //   502: aload_3
      //   503: astore #4
      //   505: aload_3
      //   506: astore #5
      //   508: aload #6
      //   510: invokestatic parseInt : (Ljava/lang/String;)I
      //   513: iload #12
      //   515: if_icmpne -> 521
      //   518: goto -> 699
      //   521: aload_3
      //   522: astore #4
      //   524: aload_3
      //   525: astore #5
      //   527: new com/badlogic/gdx/utils/GdxRuntimeException
      //   530: astore #13
      //   532: aload_3
      //   533: astore #4
      //   535: aload_3
      //   536: astore #5
      //   538: new java/lang/StringBuilder
      //   541: astore #14
      //   543: aload_3
      //   544: astore #4
      //   546: aload_3
      //   547: astore #5
      //   549: aload #14
      //   551: invokespecial <init> : ()V
      //   554: aload_3
      //   555: astore #4
      //   557: aload_3
      //   558: astore #5
      //   560: aload #14
      //   562: ldc_w 'Page IDs must be indices starting at 0: '
      //   565: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   568: pop
      //   569: aload_3
      //   570: astore #4
      //   572: aload_3
      //   573: astore #5
      //   575: aload #14
      //   577: aload #6
      //   579: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   582: pop
      //   583: aload_3
      //   584: astore #4
      //   586: aload_3
      //   587: astore #5
      //   589: aload #13
      //   591: aload #14
      //   593: invokevirtual toString : ()Ljava/lang/String;
      //   596: invokespecial <init> : (Ljava/lang/String;)V
      //   599: aload_3
      //   600: astore #4
      //   602: aload_3
      //   603: astore #5
      //   605: aload #13
      //   607: athrow
      //   608: astore #14
      //   610: aload_3
      //   611: astore #4
      //   613: aload_3
      //   614: astore #5
      //   616: new com/badlogic/gdx/utils/GdxRuntimeException
      //   619: astore #15
      //   621: aload_3
      //   622: astore #4
      //   624: aload_3
      //   625: astore #5
      //   627: new java/lang/StringBuilder
      //   630: astore #13
      //   632: aload_3
      //   633: astore #4
      //   635: aload_3
      //   636: astore #5
      //   638: aload #13
      //   640: invokespecial <init> : ()V
      //   643: aload_3
      //   644: astore #4
      //   646: aload_3
      //   647: astore #5
      //   649: aload #13
      //   651: ldc_w 'Invalid page id: '
      //   654: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   657: pop
      //   658: aload_3
      //   659: astore #4
      //   661: aload_3
      //   662: astore #5
      //   664: aload #13
      //   666: aload #6
      //   668: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   671: pop
      //   672: aload_3
      //   673: astore #4
      //   675: aload_3
      //   676: astore #5
      //   678: aload #15
      //   680: aload #13
      //   682: invokevirtual toString : ()Ljava/lang/String;
      //   685: aload #14
      //   687: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
      //   690: aload_3
      //   691: astore #4
      //   693: aload_3
      //   694: astore #5
      //   696: aload #15
      //   698: athrow
      //   699: aload_3
      //   700: astore #4
      //   702: aload_3
      //   703: astore #5
      //   705: ldc_w '.*file="?([^"]+)"?'
      //   708: invokestatic compile : (Ljava/lang/String;)Ljava/util/regex/Pattern;
      //   711: aload #13
      //   713: invokevirtual matcher : (Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
      //   716: astore #6
      //   718: aload_3
      //   719: astore #4
      //   721: aload_3
      //   722: astore #5
      //   724: aload #6
      //   726: invokevirtual find : ()Z
      //   729: ifeq -> 786
      //   732: aload_3
      //   733: astore #4
      //   735: aload_3
      //   736: astore #5
      //   738: aload #6
      //   740: iconst_1
      //   741: invokevirtual group : (I)Ljava/lang/String;
      //   744: astore #6
      //   746: aload_3
      //   747: astore #4
      //   749: aload_3
      //   750: astore #5
      //   752: aload_0
      //   753: getfield imagePaths : [Ljava/lang/String;
      //   756: iload #12
      //   758: aload_1
      //   759: invokevirtual parent : ()Lcom/badlogic/gdx/files/FileHandle;
      //   762: aload #6
      //   764: invokevirtual child : (Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
      //   767: invokevirtual path : ()Ljava/lang/String;
      //   770: ldc_w '\\'
      //   773: ldc_w '/'
      //   776: invokevirtual replaceAll : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
      //   779: aastore
      //   780: iinc #12, 1
      //   783: goto -> 431
      //   786: aload_3
      //   787: astore #4
      //   789: aload_3
      //   790: astore #5
      //   792: new com/badlogic/gdx/utils/GdxRuntimeException
      //   795: astore #6
      //   797: aload_3
      //   798: astore #4
      //   800: aload_3
      //   801: astore #5
      //   803: aload #6
      //   805: ldc_w 'Missing: file'
      //   808: invokespecial <init> : (Ljava/lang/String;)V
      //   811: aload_3
      //   812: astore #4
      //   814: aload_3
      //   815: astore #5
      //   817: aload #6
      //   819: athrow
      //   820: aload_3
      //   821: astore #4
      //   823: aload_3
      //   824: astore #5
      //   826: new com/badlogic/gdx/utils/GdxRuntimeException
      //   829: astore #6
      //   831: aload_3
      //   832: astore #4
      //   834: aload_3
      //   835: astore #5
      //   837: aload #6
      //   839: ldc_w 'Missing additional page definitions.'
      //   842: invokespecial <init> : (Ljava/lang/String;)V
      //   845: aload_3
      //   846: astore #4
      //   848: aload_3
      //   849: astore #5
      //   851: aload #6
      //   853: athrow
      //   854: fconst_0
      //   855: fstore #16
      //   857: aload_3
      //   858: astore #4
      //   860: aload_3
      //   861: astore #5
      //   863: aload_0
      //   864: fconst_0
      //   865: putfield descent : F
      //   868: aload_3
      //   869: astore #4
      //   871: aload_3
      //   872: astore #5
      //   874: aload_3
      //   875: invokevirtual readLine : ()Ljava/lang/String;
      //   878: astore #13
      //   880: aload #13
      //   882: ifnonnull -> 888
      //   885: goto -> 925
      //   888: aload_3
      //   889: astore #4
      //   891: aload_3
      //   892: astore #5
      //   894: aload #13
      //   896: ldc_w 'kernings '
      //   899: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   902: ifeq -> 908
      //   905: goto -> 925
      //   908: aload_3
      //   909: astore #4
      //   911: aload_3
      //   912: astore #5
      //   914: aload #13
      //   916: ldc_w 'metrics '
      //   919: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   922: ifeq -> 2249
      //   925: aload_3
      //   926: astore #4
      //   928: aload_3
      //   929: astore #5
      //   931: aload_0
      //   932: aload_0
      //   933: getfield descent : F
      //   936: aload_0
      //   937: getfield padBottom : F
      //   940: fadd
      //   941: putfield descent : F
      //   944: aload_3
      //   945: astore #4
      //   947: aload_3
      //   948: astore #5
      //   950: aload_3
      //   951: invokevirtual readLine : ()Ljava/lang/String;
      //   954: astore #13
      //   956: aload #13
      //   958: ifnonnull -> 964
      //   961: goto -> 981
      //   964: aload_3
      //   965: astore #4
      //   967: aload_3
      //   968: astore #5
      //   970: aload #13
      //   972: ldc_w 'kerning '
      //   975: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   978: ifne -> 2042
      //   981: aload #13
      //   983: ifnull -> 1245
      //   986: aload_3
      //   987: astore #4
      //   989: aload_3
      //   990: astore #5
      //   992: aload #13
      //   994: ldc_w 'metrics '
      //   997: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   1000: ifeq -> 1245
      //   1003: aload_3
      //   1004: astore #4
      //   1006: aload_3
      //   1007: astore #5
      //   1009: new java/util/StringTokenizer
      //   1012: astore #6
      //   1014: aload_3
      //   1015: astore #4
      //   1017: aload_3
      //   1018: astore #5
      //   1020: aload #6
      //   1022: aload #13
      //   1024: ldc_w ' ='
      //   1027: invokespecial <init> : (Ljava/lang/String;Ljava/lang/String;)V
      //   1030: aload_3
      //   1031: astore #4
      //   1033: aload_3
      //   1034: astore #5
      //   1036: aload #6
      //   1038: invokevirtual nextToken : ()Ljava/lang/String;
      //   1041: pop
      //   1042: aload_3
      //   1043: astore #4
      //   1045: aload_3
      //   1046: astore #5
      //   1048: aload #6
      //   1050: invokevirtual nextToken : ()Ljava/lang/String;
      //   1053: pop
      //   1054: aload_3
      //   1055: astore #4
      //   1057: aload_3
      //   1058: astore #5
      //   1060: aload #6
      //   1062: invokevirtual nextToken : ()Ljava/lang/String;
      //   1065: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1068: fstore #16
      //   1070: aload_3
      //   1071: astore #4
      //   1073: aload_3
      //   1074: astore #5
      //   1076: aload #6
      //   1078: invokevirtual nextToken : ()Ljava/lang/String;
      //   1081: pop
      //   1082: aload_3
      //   1083: astore #4
      //   1085: aload_3
      //   1086: astore #5
      //   1088: aload #6
      //   1090: invokevirtual nextToken : ()Ljava/lang/String;
      //   1093: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1096: fstore #17
      //   1098: aload_3
      //   1099: astore #4
      //   1101: aload_3
      //   1102: astore #5
      //   1104: aload #6
      //   1106: invokevirtual nextToken : ()Ljava/lang/String;
      //   1109: pop
      //   1110: aload_3
      //   1111: astore #4
      //   1113: aload_3
      //   1114: astore #5
      //   1116: aload #6
      //   1118: invokevirtual nextToken : ()Ljava/lang/String;
      //   1121: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1124: fstore #18
      //   1126: aload_3
      //   1127: astore #4
      //   1129: aload_3
      //   1130: astore #5
      //   1132: aload #6
      //   1134: invokevirtual nextToken : ()Ljava/lang/String;
      //   1137: pop
      //   1138: aload_3
      //   1139: astore #4
      //   1141: aload_3
      //   1142: astore #5
      //   1144: aload #6
      //   1146: invokevirtual nextToken : ()Ljava/lang/String;
      //   1149: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1152: fstore #19
      //   1154: aload_3
      //   1155: astore #4
      //   1157: aload_3
      //   1158: astore #5
      //   1160: aload #6
      //   1162: invokevirtual nextToken : ()Ljava/lang/String;
      //   1165: pop
      //   1166: aload_3
      //   1167: astore #4
      //   1169: aload_3
      //   1170: astore #5
      //   1172: aload #6
      //   1174: invokevirtual nextToken : ()Ljava/lang/String;
      //   1177: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1180: fstore #20
      //   1182: aload_3
      //   1183: astore #4
      //   1185: aload_3
      //   1186: astore #5
      //   1188: aload #6
      //   1190: invokevirtual nextToken : ()Ljava/lang/String;
      //   1193: pop
      //   1194: aload_3
      //   1195: astore #4
      //   1197: aload_3
      //   1198: astore #5
      //   1200: aload #6
      //   1202: invokevirtual nextToken : ()Ljava/lang/String;
      //   1205: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1208: fstore #21
      //   1210: aload_3
      //   1211: astore #4
      //   1213: aload_3
      //   1214: astore #5
      //   1216: aload #6
      //   1218: invokevirtual nextToken : ()Ljava/lang/String;
      //   1221: pop
      //   1222: aload_3
      //   1223: astore #4
      //   1225: aload_3
      //   1226: astore #5
      //   1228: aload #6
      //   1230: invokevirtual nextToken : ()Ljava/lang/String;
      //   1233: invokestatic parseFloat : (Ljava/lang/String;)F
      //   1236: fstore #22
      //   1238: iload #7
      //   1240: istore #11
      //   1242: goto -> 1266
      //   1245: iconst_0
      //   1246: istore #11
      //   1248: fconst_0
      //   1249: fstore #22
      //   1251: fconst_0
      //   1252: fstore #17
      //   1254: fconst_0
      //   1255: fstore #18
      //   1257: fconst_0
      //   1258: fstore #19
      //   1260: fconst_0
      //   1261: fstore #20
      //   1263: fconst_0
      //   1264: fstore #21
      //   1266: aload_3
      //   1267: astore #4
      //   1269: aload_3
      //   1270: astore #5
      //   1272: aload_0
      //   1273: bipush #32
      //   1275: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1278: astore #13
      //   1280: aload #13
      //   1282: astore #6
      //   1284: aload #13
      //   1286: ifnonnull -> 1393
      //   1289: aload_3
      //   1290: astore #4
      //   1292: aload_3
      //   1293: astore #5
      //   1295: new com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
      //   1298: astore #13
      //   1300: aload_3
      //   1301: astore #4
      //   1303: aload_3
      //   1304: astore #5
      //   1306: aload #13
      //   1308: invokespecial <init> : ()V
      //   1311: aload_3
      //   1312: astore #4
      //   1314: aload_3
      //   1315: astore #5
      //   1317: aload #13
      //   1319: bipush #32
      //   1321: putfield id : I
      //   1324: aload_3
      //   1325: astore #4
      //   1327: aload_3
      //   1328: astore #5
      //   1330: aload_0
      //   1331: bipush #108
      //   1333: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1336: astore #14
      //   1338: aload #14
      //   1340: astore #6
      //   1342: aload #14
      //   1344: ifnonnull -> 1359
      //   1347: aload_3
      //   1348: astore #4
      //   1350: aload_3
      //   1351: astore #5
      //   1353: aload_0
      //   1354: invokevirtual getFirstGlyph : ()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1357: astore #6
      //   1359: aload_3
      //   1360: astore #4
      //   1362: aload_3
      //   1363: astore #5
      //   1365: aload #13
      //   1367: aload #6
      //   1369: getfield xadvance : I
      //   1372: putfield xadvance : I
      //   1375: aload_3
      //   1376: astore #4
      //   1378: aload_3
      //   1379: astore #5
      //   1381: aload_0
      //   1382: bipush #32
      //   1384: aload #13
      //   1386: invokevirtual setGlyph : (ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V
      //   1389: aload #13
      //   1391: astore #6
      //   1393: aload_3
      //   1394: astore #4
      //   1396: aload_3
      //   1397: astore #5
      //   1399: aload #6
      //   1401: getfield width : I
      //   1404: ifne -> 1452
      //   1407: aload_3
      //   1408: astore #4
      //   1410: aload_3
      //   1411: astore #5
      //   1413: aload #6
      //   1415: aload_0
      //   1416: getfield padLeft : F
      //   1419: aload #6
      //   1421: getfield xadvance : I
      //   1424: i2f
      //   1425: fadd
      //   1426: aload_0
      //   1427: getfield padRight : F
      //   1430: fadd
      //   1431: f2i
      //   1432: putfield width : I
      //   1435: aload_3
      //   1436: astore #4
      //   1438: aload_3
      //   1439: astore #5
      //   1441: aload #6
      //   1443: aload_0
      //   1444: getfield padLeft : F
      //   1447: fneg
      //   1448: f2i
      //   1449: putfield xoffset : I
      //   1452: aload_3
      //   1453: astore #4
      //   1455: aload_3
      //   1456: astore #5
      //   1458: aload_0
      //   1459: aload #6
      //   1461: getfield xadvance : I
      //   1464: i2f
      //   1465: putfield spaceXadvance : F
      //   1468: aload_3
      //   1469: astore #4
      //   1471: aload_3
      //   1472: astore #5
      //   1474: aload_0
      //   1475: getfield xChars : [C
      //   1478: astore #13
      //   1480: aload_3
      //   1481: astore #4
      //   1483: aload_3
      //   1484: astore #5
      //   1486: aload #13
      //   1488: arraylength
      //   1489: istore #12
      //   1491: iconst_0
      //   1492: istore #7
      //   1494: aconst_null
      //   1495: astore #5
      //   1497: iload #7
      //   1499: iload #12
      //   1501: if_icmpge -> 1543
      //   1504: aload_3
      //   1505: astore #4
      //   1507: aload_3
      //   1508: astore #5
      //   1510: aload_0
      //   1511: aload #13
      //   1513: iload #7
      //   1515: caload
      //   1516: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1519: astore #6
      //   1521: aload #6
      //   1523: ifnull -> 1533
      //   1526: aload #6
      //   1528: astore #5
      //   1530: goto -> 1543
      //   1533: iinc #7, 1
      //   1536: aload #6
      //   1538: astore #5
      //   1540: goto -> 1497
      //   1543: aload #5
      //   1545: astore #6
      //   1547: aload #5
      //   1549: ifnonnull -> 1564
      //   1552: aload_3
      //   1553: astore #4
      //   1555: aload_3
      //   1556: astore #5
      //   1558: aload_0
      //   1559: invokevirtual getFirstGlyph : ()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1562: astore #6
      //   1564: aload_3
      //   1565: astore #4
      //   1567: aload_3
      //   1568: astore #5
      //   1570: aload_0
      //   1571: aload #6
      //   1573: getfield height : I
      //   1576: i2f
      //   1577: fload #8
      //   1579: fsub
      //   1580: putfield xHeight : F
      //   1583: aload_3
      //   1584: astore #4
      //   1586: aload_3
      //   1587: astore #5
      //   1589: aload_0
      //   1590: getfield capChars : [C
      //   1593: astore #13
      //   1595: aload_3
      //   1596: astore #4
      //   1598: aload_3
      //   1599: astore #5
      //   1601: aload #13
      //   1603: arraylength
      //   1604: istore #12
      //   1606: iconst_0
      //   1607: istore #7
      //   1609: aconst_null
      //   1610: astore #5
      //   1612: aload #5
      //   1614: astore #4
      //   1616: iload #7
      //   1618: iload #12
      //   1620: if_icmpge -> 1662
      //   1623: aload_3
      //   1624: astore #4
      //   1626: aload_3
      //   1627: astore #5
      //   1629: aload_0
      //   1630: aload #13
      //   1632: iload #7
      //   1634: caload
      //   1635: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1638: astore #6
      //   1640: aload #6
      //   1642: ifnull -> 1652
      //   1645: aload #6
      //   1647: astore #4
      //   1649: goto -> 1662
      //   1652: iinc #7, 1
      //   1655: aload #6
      //   1657: astore #5
      //   1659: goto -> 1612
      //   1662: aload #4
      //   1664: ifnonnull -> 1832
      //   1667: aload_3
      //   1668: astore #4
      //   1670: aload_3
      //   1671: astore #5
      //   1673: aload_0
      //   1674: getfield glyphs : [[Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   1677: astore #13
      //   1679: aload_3
      //   1680: astore #4
      //   1682: aload_3
      //   1683: astore #5
      //   1685: aload #13
      //   1687: arraylength
      //   1688: istore #7
      //   1690: iconst_0
      //   1691: istore #12
      //   1693: aload_3
      //   1694: astore #6
      //   1696: iload #12
      //   1698: iload #7
      //   1700: if_icmpge -> 1829
      //   1703: aload #13
      //   1705: iload #12
      //   1707: aaload
      //   1708: astore #14
      //   1710: aload #14
      //   1712: ifnonnull -> 1718
      //   1715: goto -> 1823
      //   1718: aload #6
      //   1720: astore #4
      //   1722: aload #6
      //   1724: astore #5
      //   1726: aload #14
      //   1728: arraylength
      //   1729: istore #23
      //   1731: aload #6
      //   1733: astore #4
      //   1735: iconst_0
      //   1736: istore #24
      //   1738: iload #24
      //   1740: iload #23
      //   1742: if_icmpge -> 1823
      //   1745: aload #14
      //   1747: iload #24
      //   1749: aaload
      //   1750: astore #15
      //   1752: aload #15
      //   1754: ifnull -> 1817
      //   1757: aload #4
      //   1759: astore #5
      //   1761: aload #4
      //   1763: astore_3
      //   1764: aload #15
      //   1766: getfield height : I
      //   1769: ifeq -> 1817
      //   1772: aload #4
      //   1774: astore #5
      //   1776: aload #4
      //   1778: astore_3
      //   1779: aload #15
      //   1781: getfield width : I
      //   1784: ifne -> 1790
      //   1787: goto -> 1817
      //   1790: aload #4
      //   1792: astore #5
      //   1794: aload #4
      //   1796: astore_3
      //   1797: aload_0
      //   1798: aload_0
      //   1799: getfield capHeight : F
      //   1802: aload #15
      //   1804: getfield height : I
      //   1807: i2f
      //   1808: invokestatic max : (FF)F
      //   1811: putfield capHeight : F
      //   1814: goto -> 1817
      //   1817: iinc #24, 1
      //   1820: goto -> 1738
      //   1823: iinc #12, 1
      //   1826: goto -> 1696
      //   1829: goto -> 1852
      //   1832: aload_3
      //   1833: astore #6
      //   1835: aload #6
      //   1837: astore #5
      //   1839: aload #6
      //   1841: astore_3
      //   1842: aload_0
      //   1843: aload #4
      //   1845: getfield height : I
      //   1848: i2f
      //   1849: putfield capHeight : F
      //   1852: aload #6
      //   1854: astore #5
      //   1856: aload #6
      //   1858: astore_3
      //   1859: aload_0
      //   1860: aload_0
      //   1861: getfield capHeight : F
      //   1864: fload #8
      //   1866: fsub
      //   1867: putfield capHeight : F
      //   1870: aload #6
      //   1872: astore #5
      //   1874: aload #6
      //   1876: astore_3
      //   1877: aload_0
      //   1878: fload #9
      //   1880: aload_0
      //   1881: getfield capHeight : F
      //   1884: fsub
      //   1885: putfield ascent : F
      //   1888: aload #6
      //   1890: astore #5
      //   1892: aload #6
      //   1894: astore_3
      //   1895: aload_0
      //   1896: aload_0
      //   1897: getfield lineHeight : F
      //   1900: fneg
      //   1901: putfield down : F
      //   1904: iload_2
      //   1905: ifeq -> 1940
      //   1908: aload #6
      //   1910: astore #5
      //   1912: aload #6
      //   1914: astore_3
      //   1915: aload_0
      //   1916: aload_0
      //   1917: getfield ascent : F
      //   1920: fneg
      //   1921: putfield ascent : F
      //   1924: aload #6
      //   1926: astore #5
      //   1928: aload #6
      //   1930: astore_3
      //   1931: aload_0
      //   1932: aload_0
      //   1933: getfield down : F
      //   1936: fneg
      //   1937: putfield down : F
      //   1940: iload #11
      //   1942: ifeq -> 2036
      //   1945: aload #6
      //   1947: astore #5
      //   1949: aload #6
      //   1951: astore_3
      //   1952: aload_0
      //   1953: fload #16
      //   1955: putfield ascent : F
      //   1958: aload #6
      //   1960: astore #5
      //   1962: aload #6
      //   1964: astore_3
      //   1965: aload_0
      //   1966: fload #17
      //   1968: putfield descent : F
      //   1971: aload #6
      //   1973: astore #5
      //   1975: aload #6
      //   1977: astore_3
      //   1978: aload_0
      //   1979: fload #18
      //   1981: putfield down : F
      //   1984: aload #6
      //   1986: astore #5
      //   1988: aload #6
      //   1990: astore_3
      //   1991: aload_0
      //   1992: fload #19
      //   1994: putfield capHeight : F
      //   1997: aload #6
      //   1999: astore #5
      //   2001: aload #6
      //   2003: astore_3
      //   2004: aload_0
      //   2005: fload #20
      //   2007: putfield lineHeight : F
      //   2010: aload #6
      //   2012: astore #5
      //   2014: aload #6
      //   2016: astore_3
      //   2017: aload_0
      //   2018: fload #21
      //   2020: putfield spaceXadvance : F
      //   2023: aload #6
      //   2025: astore #5
      //   2027: aload #6
      //   2029: astore_3
      //   2030: aload_0
      //   2031: fload #22
      //   2033: putfield xHeight : F
      //   2036: aload #6
      //   2038: invokestatic closeQuietly : (Ljava/io/Closeable;)V
      //   2041: return
      //   2042: aload_3
      //   2043: astore #6
      //   2045: aload #6
      //   2047: astore #5
      //   2049: aload #6
      //   2051: astore_3
      //   2052: new java/util/StringTokenizer
      //   2055: astore #4
      //   2057: aload #6
      //   2059: astore #5
      //   2061: aload #6
      //   2063: astore_3
      //   2064: aload #4
      //   2066: aload #13
      //   2068: ldc_w ' ='
      //   2071: invokespecial <init> : (Ljava/lang/String;Ljava/lang/String;)V
      //   2074: aload #6
      //   2076: astore #5
      //   2078: aload #6
      //   2080: astore_3
      //   2081: aload #4
      //   2083: invokevirtual nextToken : ()Ljava/lang/String;
      //   2086: pop
      //   2087: aload #6
      //   2089: astore #5
      //   2091: aload #6
      //   2093: astore_3
      //   2094: aload #4
      //   2096: invokevirtual nextToken : ()Ljava/lang/String;
      //   2099: pop
      //   2100: aload #6
      //   2102: astore #5
      //   2104: aload #6
      //   2106: astore_3
      //   2107: aload #4
      //   2109: invokevirtual nextToken : ()Ljava/lang/String;
      //   2112: invokestatic parseInt : (Ljava/lang/String;)I
      //   2115: istore #12
      //   2117: aload #6
      //   2119: astore #5
      //   2121: aload #6
      //   2123: astore_3
      //   2124: aload #4
      //   2126: invokevirtual nextToken : ()Ljava/lang/String;
      //   2129: pop
      //   2130: aload #6
      //   2132: astore #5
      //   2134: aload #6
      //   2136: astore_3
      //   2137: aload #4
      //   2139: invokevirtual nextToken : ()Ljava/lang/String;
      //   2142: invokestatic parseInt : (Ljava/lang/String;)I
      //   2145: istore #11
      //   2147: iload #12
      //   2149: iflt -> 2243
      //   2152: iload #12
      //   2154: ldc_w 65535
      //   2157: if_icmpgt -> 2243
      //   2160: iload #11
      //   2162: iflt -> 2243
      //   2165: iload #11
      //   2167: ldc_w 65535
      //   2170: if_icmple -> 2176
      //   2173: goto -> 2243
      //   2176: aload #6
      //   2178: astore #5
      //   2180: aload #6
      //   2182: astore_3
      //   2183: aload_0
      //   2184: iload #12
      //   2186: i2c
      //   2187: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   2190: astore #13
      //   2192: aload #6
      //   2194: astore #5
      //   2196: aload #6
      //   2198: astore_3
      //   2199: aload #4
      //   2201: invokevirtual nextToken : ()Ljava/lang/String;
      //   2204: pop
      //   2205: aload #6
      //   2207: astore #5
      //   2209: aload #6
      //   2211: astore_3
      //   2212: aload #4
      //   2214: invokevirtual nextToken : ()Ljava/lang/String;
      //   2217: invokestatic parseInt : (Ljava/lang/String;)I
      //   2220: istore #12
      //   2222: aload #13
      //   2224: ifnull -> 2243
      //   2227: aload #6
      //   2229: astore #5
      //   2231: aload #6
      //   2233: astore_3
      //   2234: aload #13
      //   2236: iload #11
      //   2238: iload #12
      //   2240: invokevirtual setKerning : (II)V
      //   2243: aload #6
      //   2245: astore_3
      //   2246: goto -> 944
      //   2249: aload_3
      //   2250: astore #6
      //   2252: aload #6
      //   2254: astore #5
      //   2256: aload #6
      //   2258: astore_3
      //   2259: aload #13
      //   2261: ldc_w 'char '
      //   2264: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   2267: ifne -> 2276
      //   2270: aload #6
      //   2272: astore_3
      //   2273: goto -> 868
      //   2276: aload #6
      //   2278: astore #5
      //   2280: aload #6
      //   2282: astore_3
      //   2283: new com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
      //   2286: astore #4
      //   2288: aload #6
      //   2290: astore #5
      //   2292: aload #6
      //   2294: astore_3
      //   2295: aload #4
      //   2297: invokespecial <init> : ()V
      //   2300: aload #6
      //   2302: astore #5
      //   2304: aload #6
      //   2306: astore_3
      //   2307: new java/util/StringTokenizer
      //   2310: astore #14
      //   2312: aload #6
      //   2314: astore #5
      //   2316: aload #6
      //   2318: astore_3
      //   2319: aload #14
      //   2321: aload #13
      //   2323: ldc_w ' ='
      //   2326: invokespecial <init> : (Ljava/lang/String;Ljava/lang/String;)V
      //   2329: aload #6
      //   2331: astore #5
      //   2333: aload #6
      //   2335: astore_3
      //   2336: aload #14
      //   2338: invokevirtual nextToken : ()Ljava/lang/String;
      //   2341: pop
      //   2342: aload #6
      //   2344: astore #5
      //   2346: aload #6
      //   2348: astore_3
      //   2349: aload #14
      //   2351: invokevirtual nextToken : ()Ljava/lang/String;
      //   2354: pop
      //   2355: aload #6
      //   2357: astore #5
      //   2359: aload #6
      //   2361: astore_3
      //   2362: aload #14
      //   2364: invokevirtual nextToken : ()Ljava/lang/String;
      //   2367: invokestatic parseInt : (Ljava/lang/String;)I
      //   2370: istore #11
      //   2372: iload #11
      //   2374: ifgt -> 2393
      //   2377: aload #6
      //   2379: astore #5
      //   2381: aload #6
      //   2383: astore_3
      //   2384: aload_0
      //   2385: aload #4
      //   2387: putfield missingGlyph : Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
      //   2390: goto -> 2416
      //   2393: iload #11
      //   2395: ldc_w 65535
      //   2398: if_icmpgt -> 2270
      //   2401: aload #6
      //   2403: astore #5
      //   2405: aload #6
      //   2407: astore_3
      //   2408: aload_0
      //   2409: iload #11
      //   2411: aload #4
      //   2413: invokevirtual setGlyph : (ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V
      //   2416: aload #6
      //   2418: astore #5
      //   2420: aload #6
      //   2422: astore_3
      //   2423: aload #4
      //   2425: iload #11
      //   2427: putfield id : I
      //   2430: aload #6
      //   2432: astore #5
      //   2434: aload #6
      //   2436: astore_3
      //   2437: aload #14
      //   2439: invokevirtual nextToken : ()Ljava/lang/String;
      //   2442: pop
      //   2443: aload #6
      //   2445: astore #5
      //   2447: aload #6
      //   2449: astore_3
      //   2450: aload #4
      //   2452: aload #14
      //   2454: invokevirtual nextToken : ()Ljava/lang/String;
      //   2457: invokestatic parseInt : (Ljava/lang/String;)I
      //   2460: putfield srcX : I
      //   2463: aload #6
      //   2465: astore #5
      //   2467: aload #6
      //   2469: astore_3
      //   2470: aload #14
      //   2472: invokevirtual nextToken : ()Ljava/lang/String;
      //   2475: pop
      //   2476: aload #6
      //   2478: astore #5
      //   2480: aload #6
      //   2482: astore_3
      //   2483: aload #4
      //   2485: aload #14
      //   2487: invokevirtual nextToken : ()Ljava/lang/String;
      //   2490: invokestatic parseInt : (Ljava/lang/String;)I
      //   2493: putfield srcY : I
      //   2496: aload #6
      //   2498: astore #5
      //   2500: aload #6
      //   2502: astore_3
      //   2503: aload #14
      //   2505: invokevirtual nextToken : ()Ljava/lang/String;
      //   2508: pop
      //   2509: aload #6
      //   2511: astore #5
      //   2513: aload #6
      //   2515: astore_3
      //   2516: aload #4
      //   2518: aload #14
      //   2520: invokevirtual nextToken : ()Ljava/lang/String;
      //   2523: invokestatic parseInt : (Ljava/lang/String;)I
      //   2526: putfield width : I
      //   2529: aload #6
      //   2531: astore #5
      //   2533: aload #6
      //   2535: astore_3
      //   2536: aload #14
      //   2538: invokevirtual nextToken : ()Ljava/lang/String;
      //   2541: pop
      //   2542: aload #6
      //   2544: astore #5
      //   2546: aload #6
      //   2548: astore_3
      //   2549: aload #4
      //   2551: aload #14
      //   2553: invokevirtual nextToken : ()Ljava/lang/String;
      //   2556: invokestatic parseInt : (Ljava/lang/String;)I
      //   2559: putfield height : I
      //   2562: aload #6
      //   2564: astore #5
      //   2566: aload #6
      //   2568: astore_3
      //   2569: aload #14
      //   2571: invokevirtual nextToken : ()Ljava/lang/String;
      //   2574: pop
      //   2575: aload #6
      //   2577: astore #5
      //   2579: aload #6
      //   2581: astore_3
      //   2582: aload #4
      //   2584: aload #14
      //   2586: invokevirtual nextToken : ()Ljava/lang/String;
      //   2589: invokestatic parseInt : (Ljava/lang/String;)I
      //   2592: putfield xoffset : I
      //   2595: aload #6
      //   2597: astore #5
      //   2599: aload #6
      //   2601: astore_3
      //   2602: aload #14
      //   2604: invokevirtual nextToken : ()Ljava/lang/String;
      //   2607: pop
      //   2608: iload_2
      //   2609: ifeq -> 2635
      //   2612: aload #6
      //   2614: astore #5
      //   2616: aload #6
      //   2618: astore_3
      //   2619: aload #4
      //   2621: aload #14
      //   2623: invokevirtual nextToken : ()Ljava/lang/String;
      //   2626: invokestatic parseInt : (Ljava/lang/String;)I
      //   2629: putfield yoffset : I
      //   2632: goto -> 2662
      //   2635: aload #6
      //   2637: astore #5
      //   2639: aload #6
      //   2641: astore_3
      //   2642: aload #4
      //   2644: aload #4
      //   2646: getfield height : I
      //   2649: aload #14
      //   2651: invokevirtual nextToken : ()Ljava/lang/String;
      //   2654: invokestatic parseInt : (Ljava/lang/String;)I
      //   2657: iadd
      //   2658: ineg
      //   2659: putfield yoffset : I
      //   2662: aload #6
      //   2664: astore #5
      //   2666: aload #6
      //   2668: astore_3
      //   2669: aload #14
      //   2671: invokevirtual nextToken : ()Ljava/lang/String;
      //   2674: pop
      //   2675: aload #6
      //   2677: astore #5
      //   2679: aload #6
      //   2681: astore_3
      //   2682: aload #4
      //   2684: aload #14
      //   2686: invokevirtual nextToken : ()Ljava/lang/String;
      //   2689: invokestatic parseInt : (Ljava/lang/String;)I
      //   2692: putfield xadvance : I
      //   2695: aload #6
      //   2697: astore #5
      //   2699: aload #6
      //   2701: astore_3
      //   2702: aload #14
      //   2704: invokevirtual hasMoreTokens : ()Z
      //   2707: ifeq -> 2723
      //   2710: aload #6
      //   2712: astore #5
      //   2714: aload #6
      //   2716: astore_3
      //   2717: aload #14
      //   2719: invokevirtual nextToken : ()Ljava/lang/String;
      //   2722: pop
      //   2723: aload #6
      //   2725: astore #5
      //   2727: aload #6
      //   2729: astore_3
      //   2730: aload #14
      //   2732: invokevirtual hasMoreTokens : ()Z
      //   2735: istore #10
      //   2737: iload #10
      //   2739: ifeq -> 2762
      //   2742: aload #6
      //   2744: astore #5
      //   2746: aload #6
      //   2748: astore_3
      //   2749: aload #4
      //   2751: aload #14
      //   2753: invokevirtual nextToken : ()Ljava/lang/String;
      //   2756: invokestatic parseInt : (Ljava/lang/String;)I
      //   2759: putfield page : I
      //   2762: aload #6
      //   2764: astore #5
      //   2766: aload #6
      //   2768: astore_3
      //   2769: aload #4
      //   2771: getfield width : I
      //   2774: ifle -> 2270
      //   2777: aload #6
      //   2779: astore #5
      //   2781: aload #6
      //   2783: astore_3
      //   2784: aload #4
      //   2786: getfield height : I
      //   2789: ifle -> 2270
      //   2792: aload #6
      //   2794: astore #5
      //   2796: aload #6
      //   2798: astore_3
      //   2799: aload_0
      //   2800: aload #4
      //   2802: getfield yoffset : I
      //   2805: i2f
      //   2806: fload #9
      //   2808: fadd
      //   2809: aload_0
      //   2810: getfield descent : F
      //   2813: invokestatic min : (FF)F
      //   2816: putfield descent : F
      //   2819: goto -> 2270
      //   2822: aload_3
      //   2823: astore #6
      //   2825: aload #6
      //   2827: astore #5
      //   2829: aload #6
      //   2831: astore_3
      //   2832: new com/badlogic/gdx/utils/GdxRuntimeException
      //   2835: astore #4
      //   2837: aload #6
      //   2839: astore #5
      //   2841: aload #6
      //   2843: astore_3
      //   2844: aload #4
      //   2846: ldc_w 'Missing: base'
      //   2849: invokespecial <init> : (Ljava/lang/String;)V
      //   2852: aload #6
      //   2854: astore #5
      //   2856: aload #6
      //   2858: astore_3
      //   2859: aload #4
      //   2861: athrow
      //   2862: aload_3
      //   2863: astore #6
      //   2865: aload #6
      //   2867: astore #5
      //   2869: aload #6
      //   2871: astore_3
      //   2872: new com/badlogic/gdx/utils/GdxRuntimeException
      //   2875: astore #4
      //   2877: aload #6
      //   2879: astore #5
      //   2881: aload #6
      //   2883: astore_3
      //   2884: aload #4
      //   2886: ldc_w 'Missing: lineHeight'
      //   2889: invokespecial <init> : (Ljava/lang/String;)V
      //   2892: aload #6
      //   2894: astore #5
      //   2896: aload #6
      //   2898: astore_3
      //   2899: aload #4
      //   2901: athrow
      //   2902: aload_3
      //   2903: astore #6
      //   2905: aload #6
      //   2907: astore #5
      //   2909: aload #6
      //   2911: astore_3
      //   2912: new com/badlogic/gdx/utils/GdxRuntimeException
      //   2915: astore #4
      //   2917: aload #6
      //   2919: astore #5
      //   2921: aload #6
      //   2923: astore_3
      //   2924: aload #4
      //   2926: ldc_w 'Invalid common header.'
      //   2929: invokespecial <init> : (Ljava/lang/String;)V
      //   2932: aload #6
      //   2934: astore #5
      //   2936: aload #6
      //   2938: astore_3
      //   2939: aload #4
      //   2941: athrow
      //   2942: aload_3
      //   2943: astore #6
      //   2945: aload #6
      //   2947: astore #5
      //   2949: aload #6
      //   2951: astore_3
      //   2952: new com/badlogic/gdx/utils/GdxRuntimeException
      //   2955: astore #4
      //   2957: aload #6
      //   2959: astore #5
      //   2961: aload #6
      //   2963: astore_3
      //   2964: aload #4
      //   2966: ldc_w 'Missing common header.'
      //   2969: invokespecial <init> : (Ljava/lang/String;)V
      //   2972: aload #6
      //   2974: astore #5
      //   2976: aload #6
      //   2978: astore_3
      //   2979: aload #4
      //   2981: athrow
      //   2982: aload_3
      //   2983: astore #6
      //   2985: aload #6
      //   2987: astore #5
      //   2989: aload #6
      //   2991: astore_3
      //   2992: new com/badlogic/gdx/utils/GdxRuntimeException
      //   2995: astore #4
      //   2997: aload #6
      //   2999: astore #5
      //   3001: aload #6
      //   3003: astore_3
      //   3004: aload #4
      //   3006: ldc_w 'Invalid padding.'
      //   3009: invokespecial <init> : (Ljava/lang/String;)V
      //   3012: aload #6
      //   3014: astore #5
      //   3016: aload #6
      //   3018: astore_3
      //   3019: aload #4
      //   3021: athrow
      //   3022: aload_3
      //   3023: astore #6
      //   3025: aload #6
      //   3027: astore #5
      //   3029: aload #6
      //   3031: astore_3
      //   3032: new com/badlogic/gdx/utils/GdxRuntimeException
      //   3035: astore #4
      //   3037: aload #6
      //   3039: astore #5
      //   3041: aload #6
      //   3043: astore_3
      //   3044: aload #4
      //   3046: ldc_w 'File is empty.'
      //   3049: invokespecial <init> : (Ljava/lang/String;)V
      //   3052: aload #6
      //   3054: astore #5
      //   3056: aload #6
      //   3058: astore_3
      //   3059: aload #4
      //   3061: athrow
      //   3062: astore #6
      //   3064: goto -> 3076
      //   3067: astore_1
      //   3068: aload #4
      //   3070: astore_3
      //   3071: goto -> 3147
      //   3074: astore #6
      //   3076: aload #5
      //   3078: astore_3
      //   3079: new com/badlogic/gdx/utils/GdxRuntimeException
      //   3082: astore #4
      //   3084: aload #5
      //   3086: astore_3
      //   3087: new java/lang/StringBuilder
      //   3090: astore #13
      //   3092: aload #5
      //   3094: astore_3
      //   3095: aload #13
      //   3097: invokespecial <init> : ()V
      //   3100: aload #5
      //   3102: astore_3
      //   3103: aload #13
      //   3105: ldc_w 'Error loading font file: '
      //   3108: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   3111: pop
      //   3112: aload #5
      //   3114: astore_3
      //   3115: aload #13
      //   3117: aload_1
      //   3118: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   3121: pop
      //   3122: aload #5
      //   3124: astore_3
      //   3125: aload #4
      //   3127: aload #13
      //   3129: invokevirtual toString : ()Ljava/lang/String;
      //   3132: aload #6
      //   3134: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
      //   3137: aload #5
      //   3139: astore_3
      //   3140: aload #4
      //   3142: athrow
      //   3143: astore_1
      //   3144: goto -> 3071
      //   3147: aload_3
      //   3148: invokestatic closeQuietly : (Ljava/io/Closeable;)V
      //   3151: aload_1
      //   3152: athrow
      //   3153: new java/lang/IllegalStateException
      //   3156: dup
      //   3157: ldc_w 'Already loaded.'
      //   3160: invokespecial <init> : (Ljava/lang/String;)V
      //   3163: astore_1
      //   3164: goto -> 3169
      //   3167: aload_1
      //   3168: athrow
      //   3169: goto -> 3167
      //   3172: astore #5
      //   3174: goto -> 410
      //   3177: astore_3
      //   3178: goto -> 2762
      // Exception table:
      //   from	to	target	type
      //   43	49	3074	java/lang/Exception
      //   43	49	3067	finally
      //   60	77	3074	java/lang/Exception
      //   60	77	3067	finally
      //   83	105	3074	java/lang/Exception
      //   83	105	3067	finally
      //   111	118	3074	java/lang/Exception
      //   111	118	3067	finally
      //   124	136	3074	java/lang/Exception
      //   124	136	3067	finally
      //   145	157	3074	java/lang/Exception
      //   145	157	3067	finally
      //   163	175	3074	java/lang/Exception
      //   163	175	3067	finally
      //   181	193	3074	java/lang/Exception
      //   181	193	3067	finally
      //   199	210	3074	java/lang/Exception
      //   199	210	3067	finally
      //   216	222	3074	java/lang/Exception
      //   216	222	3067	finally
      //   233	245	3074	java/lang/Exception
      //   233	245	3067	finally
      //   251	258	3074	java/lang/Exception
      //   251	258	3067	finally
      //   264	277	3074	java/lang/Exception
      //   264	277	3067	finally
      //   283	300	3074	java/lang/Exception
      //   283	300	3067	finally
      //   306	319	3074	java/lang/Exception
      //   306	319	3067	finally
      //   325	339	3074	java/lang/Exception
      //   325	339	3067	finally
      //   345	353	3074	java/lang/Exception
      //   345	353	3067	finally
      //   366	378	3074	java/lang/Exception
      //   366	378	3067	finally
      //   389	407	3172	java/lang/NumberFormatException
      //   389	407	3074	java/lang/Exception
      //   389	407	3067	finally
      //   419	428	3074	java/lang/Exception
      //   419	428	3067	finally
      //   444	450	3074	java/lang/Exception
      //   444	450	3067	finally
      //   461	474	3074	java/lang/Exception
      //   461	474	3067	finally
      //   480	488	3074	java/lang/Exception
      //   480	488	3067	finally
      //   494	502	3074	java/lang/Exception
      //   494	502	3067	finally
      //   508	518	608	java/lang/NumberFormatException
      //   508	518	3074	java/lang/Exception
      //   508	518	3067	finally
      //   527	532	608	java/lang/NumberFormatException
      //   527	532	3074	java/lang/Exception
      //   527	532	3067	finally
      //   538	543	608	java/lang/NumberFormatException
      //   538	543	3074	java/lang/Exception
      //   538	543	3067	finally
      //   549	554	608	java/lang/NumberFormatException
      //   549	554	3074	java/lang/Exception
      //   549	554	3067	finally
      //   560	569	608	java/lang/NumberFormatException
      //   560	569	3074	java/lang/Exception
      //   560	569	3067	finally
      //   575	583	608	java/lang/NumberFormatException
      //   575	583	3074	java/lang/Exception
      //   575	583	3067	finally
      //   589	599	608	java/lang/NumberFormatException
      //   589	599	3074	java/lang/Exception
      //   589	599	3067	finally
      //   605	608	608	java/lang/NumberFormatException
      //   605	608	3074	java/lang/Exception
      //   605	608	3067	finally
      //   616	621	3074	java/lang/Exception
      //   616	621	3067	finally
      //   627	632	3074	java/lang/Exception
      //   627	632	3067	finally
      //   638	643	3074	java/lang/Exception
      //   638	643	3067	finally
      //   649	658	3074	java/lang/Exception
      //   649	658	3067	finally
      //   664	672	3074	java/lang/Exception
      //   664	672	3067	finally
      //   678	690	3074	java/lang/Exception
      //   678	690	3067	finally
      //   696	699	3074	java/lang/Exception
      //   696	699	3067	finally
      //   705	718	3074	java/lang/Exception
      //   705	718	3067	finally
      //   724	732	3074	java/lang/Exception
      //   724	732	3067	finally
      //   738	746	3074	java/lang/Exception
      //   738	746	3067	finally
      //   752	780	3074	java/lang/Exception
      //   752	780	3067	finally
      //   792	797	3074	java/lang/Exception
      //   792	797	3067	finally
      //   803	811	3074	java/lang/Exception
      //   803	811	3067	finally
      //   817	820	3074	java/lang/Exception
      //   817	820	3067	finally
      //   826	831	3074	java/lang/Exception
      //   826	831	3067	finally
      //   837	845	3074	java/lang/Exception
      //   837	845	3067	finally
      //   851	854	3074	java/lang/Exception
      //   851	854	3067	finally
      //   863	868	3074	java/lang/Exception
      //   863	868	3067	finally
      //   874	880	3074	java/lang/Exception
      //   874	880	3067	finally
      //   894	905	3074	java/lang/Exception
      //   894	905	3067	finally
      //   914	925	3074	java/lang/Exception
      //   914	925	3067	finally
      //   931	944	3074	java/lang/Exception
      //   931	944	3067	finally
      //   950	956	3074	java/lang/Exception
      //   950	956	3067	finally
      //   970	981	3074	java/lang/Exception
      //   970	981	3067	finally
      //   992	1003	3074	java/lang/Exception
      //   992	1003	3067	finally
      //   1009	1014	3074	java/lang/Exception
      //   1009	1014	3067	finally
      //   1020	1030	3074	java/lang/Exception
      //   1020	1030	3067	finally
      //   1036	1042	3074	java/lang/Exception
      //   1036	1042	3067	finally
      //   1048	1054	3074	java/lang/Exception
      //   1048	1054	3067	finally
      //   1060	1070	3074	java/lang/Exception
      //   1060	1070	3067	finally
      //   1076	1082	3074	java/lang/Exception
      //   1076	1082	3067	finally
      //   1088	1098	3074	java/lang/Exception
      //   1088	1098	3067	finally
      //   1104	1110	3074	java/lang/Exception
      //   1104	1110	3067	finally
      //   1116	1126	3074	java/lang/Exception
      //   1116	1126	3067	finally
      //   1132	1138	3074	java/lang/Exception
      //   1132	1138	3067	finally
      //   1144	1154	3074	java/lang/Exception
      //   1144	1154	3067	finally
      //   1160	1166	3074	java/lang/Exception
      //   1160	1166	3067	finally
      //   1172	1182	3074	java/lang/Exception
      //   1172	1182	3067	finally
      //   1188	1194	3074	java/lang/Exception
      //   1188	1194	3067	finally
      //   1200	1210	3074	java/lang/Exception
      //   1200	1210	3067	finally
      //   1216	1222	3074	java/lang/Exception
      //   1216	1222	3067	finally
      //   1228	1238	3074	java/lang/Exception
      //   1228	1238	3067	finally
      //   1272	1280	3074	java/lang/Exception
      //   1272	1280	3067	finally
      //   1295	1300	3074	java/lang/Exception
      //   1295	1300	3067	finally
      //   1306	1311	3074	java/lang/Exception
      //   1306	1311	3067	finally
      //   1317	1324	3074	java/lang/Exception
      //   1317	1324	3067	finally
      //   1330	1338	3074	java/lang/Exception
      //   1330	1338	3067	finally
      //   1353	1359	3074	java/lang/Exception
      //   1353	1359	3067	finally
      //   1365	1375	3074	java/lang/Exception
      //   1365	1375	3067	finally
      //   1381	1389	3074	java/lang/Exception
      //   1381	1389	3067	finally
      //   1399	1407	3074	java/lang/Exception
      //   1399	1407	3067	finally
      //   1413	1435	3074	java/lang/Exception
      //   1413	1435	3067	finally
      //   1441	1452	3074	java/lang/Exception
      //   1441	1452	3067	finally
      //   1458	1468	3074	java/lang/Exception
      //   1458	1468	3067	finally
      //   1474	1480	3074	java/lang/Exception
      //   1474	1480	3067	finally
      //   1486	1491	3074	java/lang/Exception
      //   1486	1491	3067	finally
      //   1510	1521	3074	java/lang/Exception
      //   1510	1521	3067	finally
      //   1558	1564	3074	java/lang/Exception
      //   1558	1564	3067	finally
      //   1570	1583	3074	java/lang/Exception
      //   1570	1583	3067	finally
      //   1589	1595	3074	java/lang/Exception
      //   1589	1595	3067	finally
      //   1601	1606	3074	java/lang/Exception
      //   1601	1606	3067	finally
      //   1629	1640	3074	java/lang/Exception
      //   1629	1640	3067	finally
      //   1673	1679	3074	java/lang/Exception
      //   1673	1679	3067	finally
      //   1685	1690	3074	java/lang/Exception
      //   1685	1690	3067	finally
      //   1726	1731	3074	java/lang/Exception
      //   1726	1731	3067	finally
      //   1764	1772	3062	java/lang/Exception
      //   1764	1772	3143	finally
      //   1779	1787	3062	java/lang/Exception
      //   1779	1787	3143	finally
      //   1797	1814	3062	java/lang/Exception
      //   1797	1814	3143	finally
      //   1842	1852	3062	java/lang/Exception
      //   1842	1852	3143	finally
      //   1859	1870	3062	java/lang/Exception
      //   1859	1870	3143	finally
      //   1877	1888	3062	java/lang/Exception
      //   1877	1888	3143	finally
      //   1895	1904	3062	java/lang/Exception
      //   1895	1904	3143	finally
      //   1915	1924	3062	java/lang/Exception
      //   1915	1924	3143	finally
      //   1931	1940	3062	java/lang/Exception
      //   1931	1940	3143	finally
      //   1952	1958	3062	java/lang/Exception
      //   1952	1958	3143	finally
      //   1965	1971	3062	java/lang/Exception
      //   1965	1971	3143	finally
      //   1978	1984	3062	java/lang/Exception
      //   1978	1984	3143	finally
      //   1991	1997	3062	java/lang/Exception
      //   1991	1997	3143	finally
      //   2004	2010	3062	java/lang/Exception
      //   2004	2010	3143	finally
      //   2017	2023	3062	java/lang/Exception
      //   2017	2023	3143	finally
      //   2030	2036	3062	java/lang/Exception
      //   2030	2036	3143	finally
      //   2052	2057	3062	java/lang/Exception
      //   2052	2057	3143	finally
      //   2064	2074	3062	java/lang/Exception
      //   2064	2074	3143	finally
      //   2081	2087	3062	java/lang/Exception
      //   2081	2087	3143	finally
      //   2094	2100	3062	java/lang/Exception
      //   2094	2100	3143	finally
      //   2107	2117	3062	java/lang/Exception
      //   2107	2117	3143	finally
      //   2124	2130	3062	java/lang/Exception
      //   2124	2130	3143	finally
      //   2137	2147	3062	java/lang/Exception
      //   2137	2147	3143	finally
      //   2183	2192	3062	java/lang/Exception
      //   2183	2192	3143	finally
      //   2199	2205	3062	java/lang/Exception
      //   2199	2205	3143	finally
      //   2212	2222	3062	java/lang/Exception
      //   2212	2222	3143	finally
      //   2234	2243	3062	java/lang/Exception
      //   2234	2243	3143	finally
      //   2259	2270	3062	java/lang/Exception
      //   2259	2270	3143	finally
      //   2283	2288	3062	java/lang/Exception
      //   2283	2288	3143	finally
      //   2295	2300	3062	java/lang/Exception
      //   2295	2300	3143	finally
      //   2307	2312	3062	java/lang/Exception
      //   2307	2312	3143	finally
      //   2319	2329	3062	java/lang/Exception
      //   2319	2329	3143	finally
      //   2336	2342	3062	java/lang/Exception
      //   2336	2342	3143	finally
      //   2349	2355	3062	java/lang/Exception
      //   2349	2355	3143	finally
      //   2362	2372	3062	java/lang/Exception
      //   2362	2372	3143	finally
      //   2384	2390	3062	java/lang/Exception
      //   2384	2390	3143	finally
      //   2408	2416	3062	java/lang/Exception
      //   2408	2416	3143	finally
      //   2423	2430	3062	java/lang/Exception
      //   2423	2430	3143	finally
      //   2437	2443	3062	java/lang/Exception
      //   2437	2443	3143	finally
      //   2450	2463	3062	java/lang/Exception
      //   2450	2463	3143	finally
      //   2470	2476	3062	java/lang/Exception
      //   2470	2476	3143	finally
      //   2483	2496	3062	java/lang/Exception
      //   2483	2496	3143	finally
      //   2503	2509	3062	java/lang/Exception
      //   2503	2509	3143	finally
      //   2516	2529	3062	java/lang/Exception
      //   2516	2529	3143	finally
      //   2536	2542	3062	java/lang/Exception
      //   2536	2542	3143	finally
      //   2549	2562	3062	java/lang/Exception
      //   2549	2562	3143	finally
      //   2569	2575	3062	java/lang/Exception
      //   2569	2575	3143	finally
      //   2582	2595	3062	java/lang/Exception
      //   2582	2595	3143	finally
      //   2602	2608	3062	java/lang/Exception
      //   2602	2608	3143	finally
      //   2619	2632	3062	java/lang/Exception
      //   2619	2632	3143	finally
      //   2642	2662	3062	java/lang/Exception
      //   2642	2662	3143	finally
      //   2669	2675	3062	java/lang/Exception
      //   2669	2675	3143	finally
      //   2682	2695	3062	java/lang/Exception
      //   2682	2695	3143	finally
      //   2702	2710	3062	java/lang/Exception
      //   2702	2710	3143	finally
      //   2717	2723	3062	java/lang/Exception
      //   2717	2723	3143	finally
      //   2730	2737	3062	java/lang/Exception
      //   2730	2737	3143	finally
      //   2749	2762	3177	java/lang/NumberFormatException
      //   2749	2762	3062	java/lang/Exception
      //   2749	2762	3143	finally
      //   2769	2777	3062	java/lang/Exception
      //   2769	2777	3143	finally
      //   2784	2792	3062	java/lang/Exception
      //   2784	2792	3143	finally
      //   2799	2819	3062	java/lang/Exception
      //   2799	2819	3143	finally
      //   2832	2837	3062	java/lang/Exception
      //   2832	2837	3143	finally
      //   2844	2852	3062	java/lang/Exception
      //   2844	2852	3143	finally
      //   2859	2862	3062	java/lang/Exception
      //   2859	2862	3143	finally
      //   2872	2877	3062	java/lang/Exception
      //   2872	2877	3143	finally
      //   2884	2892	3062	java/lang/Exception
      //   2884	2892	3143	finally
      //   2899	2902	3062	java/lang/Exception
      //   2899	2902	3143	finally
      //   2912	2917	3062	java/lang/Exception
      //   2912	2917	3143	finally
      //   2924	2932	3062	java/lang/Exception
      //   2924	2932	3143	finally
      //   2939	2942	3062	java/lang/Exception
      //   2939	2942	3143	finally
      //   2952	2957	3062	java/lang/Exception
      //   2952	2957	3143	finally
      //   2964	2972	3062	java/lang/Exception
      //   2964	2972	3143	finally
      //   2979	2982	3062	java/lang/Exception
      //   2979	2982	3143	finally
      //   2992	2997	3062	java/lang/Exception
      //   2992	2997	3143	finally
      //   3004	3012	3062	java/lang/Exception
      //   3004	3012	3143	finally
      //   3019	3022	3062	java/lang/Exception
      //   3019	3022	3143	finally
      //   3032	3037	3062	java/lang/Exception
      //   3032	3037	3143	finally
      //   3044	3052	3062	java/lang/Exception
      //   3044	3052	3143	finally
      //   3059	3062	3062	java/lang/Exception
      //   3059	3062	3143	finally
      //   3079	3084	3143	finally
      //   3087	3092	3143	finally
      //   3095	3100	3143	finally
      //   3103	3112	3143	finally
      //   3115	3122	3143	finally
      //   3125	3137	3143	finally
      //   3140	3143	3143	finally }
    
    public void scale(float param1Float) { setScale(this.scaleX + param1Float, this.scaleY + param1Float); }
    
    public void setGlyph(int param1Int, BitmapFont.Glyph param1Glyph) {
      BitmapFont.Glyph[][] arrayOfGlyph = this.glyphs;
      int i = param1Int / 512;
      BitmapFont.Glyph[] arrayOfGlyph1 = arrayOfGlyph[i];
      BitmapFont.Glyph[] arrayOfGlyph2 = arrayOfGlyph1;
      if (arrayOfGlyph1 == null) {
        arrayOfGlyph2 = new BitmapFont.Glyph[512];
        arrayOfGlyph[i] = arrayOfGlyph2;
      } 
      arrayOfGlyph2[param1Int & 0x1FF] = param1Glyph;
    }
    
    public void setGlyphRegion(BitmapFont.Glyph param1Glyph, TextureRegion param1TextureRegion) {
      float f8;
      float f7;
      Texture texture = param1TextureRegion.getTexture();
      float f1 = 1.0F / texture.getWidth();
      float f2 = 1.0F / texture.getHeight();
      float f3 = param1TextureRegion.u;
      float f4 = param1TextureRegion.v;
      float f5 = param1TextureRegion.getRegionWidth();
      float f6 = param1TextureRegion.getRegionHeight();
      if (param1TextureRegion instanceof TextureAtlas.AtlasRegion) {
        param1TextureRegion = (TextureAtlas.AtlasRegion)param1TextureRegion;
        f7 = param1TextureRegion.offsetX;
        f8 = (param1TextureRegion.originalHeight - param1TextureRegion.packedHeight) - param1TextureRegion.offsetY;
      } else {
        f8 = 0.0F;
        f7 = 0.0F;
      } 
      float f9 = param1Glyph.srcX;
      float f10 = (param1Glyph.srcX + param1Glyph.width);
      float f11 = param1Glyph.srcY;
      float f12 = (param1Glyph.srcY + param1Glyph.height);
      if (f7 > 0.0F) {
        float f = f9 - f7;
        f9 = f;
        if (f < 0.0F) {
          param1Glyph.width = (int)(param1Glyph.width + f);
          param1Glyph.xoffset = (int)(param1Glyph.xoffset - f);
          f9 = 0.0F;
        } 
        f7 = f10 - f7;
        if (f7 > f5) {
          param1Glyph.width = (int)(param1Glyph.width - f7 - f5);
          f7 = f5;
          f5 = f9;
        } else {
          f5 = f9;
        } 
      } else {
        f7 = f10;
        f5 = f9;
      } 
      if (f8 > 0.0F) {
        f9 = f11 - f8;
        if (f9 < 0.0F) {
          param1Glyph.height = (int)(param1Glyph.height + f9);
          if (param1Glyph.height < 0)
            param1Glyph.height = 0; 
          f9 = 0.0F;
        } 
        f11 = f12 - f8;
        f12 = f9;
        f8 = f11;
        if (f11 > f6) {
          f8 = f11 - f6;
          param1Glyph.height = (int)(param1Glyph.height - f8);
          param1Glyph.yoffset = (int)(param1Glyph.yoffset + f8);
          f8 = f6;
          f12 = f9;
        } 
      } else {
        f8 = f12;
        f12 = f11;
      } 
      param1Glyph.u = f5 * f1 + f3;
      param1Glyph.u2 = f3 + f7 * f1;
      if (this.flipped) {
        param1Glyph.v = f12 * f2 + f4;
        param1Glyph.v2 = f4 + f8 * f2;
      } else {
        param1Glyph.v2 = f12 * f2 + f4;
        param1Glyph.v = f4 + f8 * f2;
      } 
    }
    
    public void setLineHeight(float param1Float) {
      this.lineHeight = param1Float * this.scaleY;
      if (this.flipped) {
        param1Float = this.lineHeight;
      } else {
        param1Float = -this.lineHeight;
      } 
      this.down = param1Float;
    }
    
    public void setScale(float param1Float) { setScale(param1Float, param1Float); }
    
    public void setScale(float param1Float1, float param1Float2) {
      if (param1Float1 != 0.0F) {
        if (param1Float2 != 0.0F) {
          float f1 = param1Float1 / this.scaleX;
          float f2 = param1Float2 / this.scaleY;
          this.lineHeight *= f2;
          this.spaceXadvance *= f1;
          this.xHeight *= f2;
          this.capHeight *= f2;
          this.ascent *= f2;
          this.descent *= f2;
          this.down *= f2;
          this.padLeft *= f1;
          this.padRight *= f1;
          this.padTop *= f2;
          this.padBottom *= f2;
          this.scaleX = param1Float1;
          this.scaleY = param1Float2;
          return;
        } 
        throw new IllegalArgumentException("scaleY cannot be 0.");
      } 
      throw new IllegalArgumentException("scaleX cannot be 0.");
    }
    
    public String toString() {
      String str = this.name;
      if (str == null)
        str = super.toString(); 
      return str;
    }
  }
  
  public static class Glyph {
    public boolean fixedWidth;
    
    public int height;
    
    public int id;
    
    public byte[][] kerning;
    
    public int page = 0;
    
    public int srcX;
    
    public int srcY;
    
    public float u;
    
    public float u2;
    
    public float v;
    
    public float v2;
    
    public int width;
    
    public int xadvance;
    
    public int xoffset;
    
    public int yoffset;
    
    public int getKerning(char param1Char) {
      byte[][] arrayOfByte = this.kerning;
      if (arrayOfByte != null) {
        byte[] arrayOfByte1 = arrayOfByte[param1Char >>> '\t'];
        if (arrayOfByte1 != null)
          return arrayOfByte1[param1Char & 0x1FF]; 
      } 
      return 0;
    }
    
    public void setKerning(int param1Int1, int param1Int2) {
      if (this.kerning == null)
        this.kerning = new byte[128][]; 
      byte[][] arrayOfByte = this.kerning;
      int i = param1Int1 >>> 9;
      byte[] arrayOfByte1 = arrayOfByte[i];
      byte[] arrayOfByte2 = arrayOfByte1;
      if (arrayOfByte1 == null) {
        arrayOfByte2 = new byte[512];
        arrayOfByte[i] = arrayOfByte2;
      } 
      arrayOfByte2[param1Int1 & 0x1FF] = (byte)(byte)param1Int2;
    }
    
    public String toString() { return Character.toString((char)this.id); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/BitmapFont.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */