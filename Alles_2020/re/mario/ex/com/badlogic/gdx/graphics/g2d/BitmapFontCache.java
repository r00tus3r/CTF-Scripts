package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.NumberUtils;
import com.badlogic.gdx.utils.Pools;

public class BitmapFontCache {
  private static final Color tempColor = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private float currentTint;
  
  private final BitmapFont font;
  
  private int glyphCount;
  
  private int[] idx;
  
  private boolean integer;
  
  private final Array<GlyphLayout> layouts = new Array();
  
  private IntArray[] pageGlyphIndices;
  
  private float[][] pageVertices;
  
  private final Array<GlyphLayout> pooledLayouts = new Array();
  
  private int[] tempGlyphCount;
  
  private float x;
  
  private float y;
  
  public BitmapFontCache(BitmapFont paramBitmapFont) { this(paramBitmapFont, paramBitmapFont.usesIntegerPositions()); }
  
  public BitmapFontCache(BitmapFont paramBitmapFont, boolean paramBoolean) {
    this.font = paramBitmapFont;
    this.integer = paramBoolean;
    int i = paramBitmapFont.regions.size;
    if (i != 0) {
      this.pageVertices = new float[i][];
      this.idx = new int[i];
      if (i > 1) {
        this.pageGlyphIndices = new IntArray[i];
        byte b = 0;
        int j = this.pageGlyphIndices.length;
        while (b < j) {
          this.pageGlyphIndices[b] = new IntArray();
          b++;
        } 
      } 
      this.tempGlyphCount = new int[i];
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("The specified font must contain at least one texture page.");
    throw illegalArgumentException;
  }
  
  private void addGlyph(BitmapFont.Glyph paramGlyph, float paramFloat1, float paramFloat2, float paramFloat3) {
    float f1 = this.font.data.scaleX;
    float f2 = this.font.data.scaleY;
    float f3 = paramFloat1 + paramGlyph.xoffset * f1;
    float f4 = paramFloat2 + paramGlyph.yoffset * f2;
    float f5 = paramGlyph.width * f1;
    float f6 = paramGlyph.height * f2;
    float f7 = paramGlyph.u;
    float f8 = paramGlyph.u2;
    float f9 = paramGlyph.v;
    float f10 = paramGlyph.v2;
    f2 = f6;
    f1 = f5;
    paramFloat2 = f3;
    paramFloat1 = f4;
    if (this.integer) {
      paramFloat2 = Math.round(f3);
      paramFloat1 = Math.round(f4);
      f1 = Math.round(f5);
      f2 = Math.round(f6);
    } 
    f1 += paramFloat2;
    f2 += paramFloat1;
    int i = paramGlyph.page;
    int[] arrayOfInt = this.idx;
    int j = arrayOfInt[i];
    arrayOfInt[i] = arrayOfInt[i] + 20;
    IntArray[] arrayOfIntArray = this.pageGlyphIndices;
    if (arrayOfIntArray != null) {
      IntArray intArray = arrayOfIntArray[i];
      int m = this.glyphCount;
      this.glyphCount = m + 1;
      intArray.add(m);
    } 
    float[] arrayOfFloat = this.pageVertices[i];
    i = j + 1;
    arrayOfFloat[j] = paramFloat2;
    int k = i + 1;
    arrayOfFloat[i] = paramFloat1;
    j = k + 1;
    arrayOfFloat[k] = paramFloat3;
    i = j + 1;
    arrayOfFloat[j] = f7;
    j = i + 1;
    arrayOfFloat[i] = f9;
    i = j + 1;
    arrayOfFloat[j] = paramFloat2;
    j = i + 1;
    arrayOfFloat[i] = f2;
    i = j + 1;
    arrayOfFloat[j] = paramFloat3;
    j = i + 1;
    arrayOfFloat[i] = f7;
    i = j + 1;
    arrayOfFloat[j] = f10;
    k = i + 1;
    arrayOfFloat[i] = f1;
    j = k + 1;
    arrayOfFloat[k] = f2;
    i = j + 1;
    arrayOfFloat[j] = paramFloat3;
    j = i + 1;
    arrayOfFloat[i] = f8;
    i = j + 1;
    arrayOfFloat[j] = f10;
    k = i + 1;
    arrayOfFloat[i] = f1;
    j = k + 1;
    arrayOfFloat[k] = paramFloat1;
    i = j + 1;
    arrayOfFloat[j] = paramFloat3;
    arrayOfFloat[i] = f8;
    arrayOfFloat[i + 1] = f9;
  }
  
  private void addToCache(GlyphLayout paramGlyphLayout, float paramFloat1, float paramFloat2) {
    int i = this.font.regions.size;
    float[][] arrayOfFloat = this.pageVertices;
    if (arrayOfFloat.length < i) {
      byte b1;
      float[][] arrayOfFloat1 = new float[i][];
      System.arraycopy(arrayOfFloat, 0, arrayOfFloat1, 0, arrayOfFloat.length);
      this.pageVertices = arrayOfFloat1;
      int[] arrayOfInt2 = new int[i];
      int[] arrayOfInt1 = this.idx;
      System.arraycopy(arrayOfInt1, 0, arrayOfInt2, 0, arrayOfInt1.length);
      this.idx = arrayOfInt2;
      IntArray[] arrayOfIntArray1 = new IntArray[i];
      IntArray[] arrayOfIntArray2 = this.pageGlyphIndices;
      if (arrayOfIntArray2 != null) {
        b1 = arrayOfIntArray2.length;
        System.arraycopy(arrayOfIntArray2, 0, arrayOfIntArray1, 0, arrayOfIntArray2.length);
      } else {
        b1 = 0;
      } 
      while (b1 < i) {
        arrayOfIntArray1[b1] = new IntArray();
        b1++;
      } 
      this.pageGlyphIndices = arrayOfIntArray1;
      this.tempGlyphCount = new int[i];
    } 
    this.layouts.add(paramGlyphLayout);
    requireGlyphs(paramGlyphLayout);
    int j = paramGlyphLayout.runs.size;
    for (byte b = 0; b < j; b++) {
      GlyphLayout.GlyphRun glyphRun = (GlyphLayout.GlyphRun)paramGlyphLayout.runs.get(b);
      Array array = glyphRun.glyphs;
      FloatArray floatArray = glyphRun.xAdvances;
      float f1 = glyphRun.color.toFloatBits();
      float f2 = glyphRun.x;
      float f3 = glyphRun.y;
      int k = array.size;
      f2 += paramFloat1;
      for (i = 0; i < k; i++) {
        BitmapFont.Glyph glyph = (BitmapFont.Glyph)array.get(i);
        f2 += floatArray.get(i);
        addGlyph(glyph, f2, f3 + paramFloat2, f1);
      } 
    } 
    this.currentTint = Color.WHITE_FLOAT_BITS;
  }
  
  private void requireGlyphs(GlyphLayout paramGlyphLayout) {
    int i = this.pageVertices.length;
    int j = 0;
    if (i == 1) {
      j = paramGlyphLayout.runs.size;
      i = 0;
      int k = 0;
      while (i < j) {
        k += ((GlyphLayout.GlyphRun)paramGlyphLayout.runs.get(i)).glyphs.size;
        i++;
      } 
      requirePageGlyphs(0, k);
    } else {
      int[] arrayOfInt = this.tempGlyphCount;
      int k = arrayOfInt.length;
      for (i = 0; i < k; i++)
        arrayOfInt[i] = 0; 
      int m = paramGlyphLayout.runs.size;
      for (i = 0; i < m; i++) {
        Array array = ((GlyphLayout.GlyphRun)paramGlyphLayout.runs.get(i)).glyphs;
        int n = array.size;
        for (k = 0; k < n; k++) {
          int i1 = ((BitmapFont.Glyph)array.get(k)).page;
          arrayOfInt[i1] = arrayOfInt[i1] + 1;
        } 
      } 
      k = arrayOfInt.length;
      for (i = j; i < k; i++)
        requirePageGlyphs(i, arrayOfInt[i]); 
    } 
  }
  
  private void requirePageGlyphs(int paramInt1, int paramInt2) {
    IntArray[] arrayOfIntArray = this.pageGlyphIndices;
    if (arrayOfIntArray != null && paramInt2 > (arrayOfIntArray[paramInt1]).items.length) {
      arrayOfIntArray = this.pageGlyphIndices;
      arrayOfIntArray[paramInt1].ensureCapacity(paramInt2 - (arrayOfIntArray[paramInt1]).items.length);
    } 
    int[] arrayOfInt = this.idx;
    paramInt2 = arrayOfInt[paramInt1] + paramInt2 * 20;
    float[][] arrayOfFloat1 = this.pageVertices;
    float[] arrayOfFloat = arrayOfFloat1[paramInt1];
    if (arrayOfFloat == null) {
      arrayOfFloat1[paramInt1] = new float[paramInt2];
    } else if (arrayOfFloat.length < paramInt2) {
      float[] arrayOfFloat2 = new float[paramInt2];
      System.arraycopy(arrayOfFloat, 0, arrayOfFloat2, 0, arrayOfInt[paramInt1]);
      this.pageVertices[paramInt1] = arrayOfFloat2;
    } 
  }
  
  public GlyphLayout addText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2) { return addText(paramCharSequence, paramFloat1, paramFloat2, 0, paramCharSequence.length(), 0.0F, 8, false, null); }
  
  public GlyphLayout addText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, boolean paramBoolean) { return addText(paramCharSequence, paramFloat1, paramFloat2, 0, paramCharSequence.length(), paramFloat3, paramInt, paramBoolean, null); }
  
  public GlyphLayout addText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, int paramInt3, boolean paramBoolean) { return addText(paramCharSequence, paramFloat1, paramFloat2, paramInt1, paramInt2, paramFloat3, paramInt3, paramBoolean, null); }
  
  public GlyphLayout addText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, int paramInt3, boolean paramBoolean, String paramString) {
    GlyphLayout glyphLayout = (GlyphLayout)Pools.obtain(GlyphLayout.class);
    this.pooledLayouts.add(glyphLayout);
    glyphLayout.setText(this.font, paramCharSequence, paramInt1, paramInt2, this.color, paramFloat3, paramInt3, paramBoolean, paramString);
    addText(glyphLayout, paramFloat1, paramFloat2);
    return glyphLayout;
  }
  
  public void addText(GlyphLayout paramGlyphLayout, float paramFloat1, float paramFloat2) { addToCache(paramGlyphLayout, paramFloat1, paramFloat2 + this.font.data.ascent); }
  
  public void clear() {
    this.x = 0.0F;
    this.y = 0.0F;
    Pools.freeAll(this.pooledLayouts, true);
    this.pooledLayouts.clear();
    this.layouts.clear();
    int i = this.idx.length;
    for (byte b = 0; b < i; b++) {
      IntArray[] arrayOfIntArray = this.pageGlyphIndices;
      if (arrayOfIntArray != null)
        arrayOfIntArray[b].clear(); 
      this.idx[b] = 0;
    } 
  }
  
  public void draw(Batch paramBatch) {
    Array array = this.font.getRegions();
    int i = this.pageVertices.length;
    for (byte b = 0; b < i; b++) {
      if (this.idx[b] > 0) {
        float[] arrayOfFloat = this.pageVertices[b];
        paramBatch.draw(((TextureRegion)array.get(b)).getTexture(), arrayOfFloat, 0, this.idx[b]);
      } 
    } 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    if (paramFloat == 1.0F) {
      draw(paramBatch);
      return;
    } 
    Color color1 = getColor();
    float f = color1.a;
    color1.a *= paramFloat;
    setColors(color1);
    draw(paramBatch);
    color1.a = f;
    setColors(color1);
  }
  
  public void draw(Batch paramBatch, int paramInt1, int paramInt2) {
    if (this.pageVertices.length == 1) {
      paramBatch.draw(this.font.getRegion().getTexture(), this.pageVertices[0], paramInt1 * 20, (paramInt2 - paramInt1) * 20);
      return;
    } 
    Array array = this.font.getRegions();
    int i = this.pageVertices.length;
    for (byte b = 0; b < i; b++) {
      IntArray intArray = this.pageGlyphIndices[b];
      int j = intArray.size;
      byte b1 = 0;
      byte b2 = -1;
      byte b3;
      for (b3 = 0; b1 < j; b3 = b5) {
        int k = intArray.get(b1);
        if (k >= paramInt2)
          break; 
        byte b4 = b2;
        if (b2 == -1) {
          b4 = b2;
          if (k >= paramInt1)
            b4 = b1; 
        } 
        byte b5 = b3;
        if (k >= paramInt1)
          b5 = b3 + true; 
        b1++;
        b2 = b4;
      } 
      if (b2 != -1 && b3 != 0)
        paramBatch.draw(((TextureRegion)array.get(b)).getTexture(), this.pageVertices[b], b2 * 20, b3 * 20); 
    } 
  }
  
  public Color getColor() { return this.color; }
  
  public BitmapFont getFont() { return this.font; }
  
  public Array<GlyphLayout> getLayouts() { return this.layouts; }
  
  public int getVertexCount(int paramInt) { return this.idx[paramInt]; }
  
  public float[] getVertices() { return getVertices(0); }
  
  public float[] getVertices(int paramInt) { return this.pageVertices[paramInt]; }
  
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public void setAlphas(float paramFloat) {
    int i = (int)(paramFloat * 254.0F);
    int j = this.pageVertices.length;
    paramFloat = 0.0F;
    byte b = 0;
    float f;
    for (f = 0.0F; b < j; f = f1) {
      float[] arrayOfFloat = this.pageVertices[b];
      int k = this.idx[b];
      float f1 = paramFloat;
      byte b1 = 2;
      paramFloat = f;
      f = f1;
      while (b1 < k) {
        f1 = arrayOfFloat[b1];
        if (f1 == f && b1 != 2) {
          arrayOfFloat[b1] = paramFloat;
        } else {
          paramFloat = NumberUtils.intToFloatColor(NumberUtils.floatToIntColor(f1) & 0xFFFFFF | i << 24);
          arrayOfFloat[b1] = paramFloat;
          f = f1;
        } 
        b1 += 5;
      } 
      b++;
      f1 = paramFloat;
      paramFloat = f;
    } 
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setColor(Color paramColor) { this.color.set(paramColor); }
  
  public void setColors(float paramFloat) {
    int i = this.pageVertices.length;
    for (byte b = 0; b < i; b++) {
      float[] arrayOfFloat = this.pageVertices[b];
      byte b1 = 2;
      int j = this.idx[b];
      while (b1 < j) {
        arrayOfFloat[b1] = paramFloat;
        b1 += 5;
      } 
    } 
  }
  
  public void setColors(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    int i = (int)(paramFloat4 * 255.0F);
    int j = (int)(paramFloat3 * 255.0F);
    int k = (int)(paramFloat2 * 255.0F);
    setColors(NumberUtils.intToFloatColor((int)(paramFloat1 * 255.0F) | k << 8 | j << 16 | i << 24));
  }
  
  public void setColors(float paramFloat, int paramInt1, int paramInt2) {
    float[] arrayOfFloat = this.pageVertices;
    if (arrayOfFloat.length == 1) {
      arrayOfFloat = arrayOfFloat[0];
      for (paramInt1 = paramInt1 * 20 + 2; paramInt1 < paramInt2 * 20; paramInt1 += 5)
        arrayOfFloat[paramInt1] = paramFloat; 
      return;
    } 
    int i = arrayOfFloat.length;
    for (byte b = 0; b < i; b++) {
      float[] arrayOfFloat1 = this.pageVertices[b];
      IntArray intArray = this.pageGlyphIndices[b];
      int j = intArray.size;
      for (byte b1 = 0; b1 < j; b1++) {
        int k = intArray.items[b1];
        if (k >= paramInt2)
          break; 
        if (k >= paramInt1)
          for (k = 0; k < 20; k += 5)
            arrayOfFloat1[b1 * 20 + 2 + k] = paramFloat;  
      } 
    } 
  }
  
  public void setColors(Color paramColor) { setColors(paramColor.toFloatBits()); }
  
  public void setColors(Color paramColor, int paramInt1, int paramInt2) { setColors(paramColor.toFloatBits(), paramInt1, paramInt2); }
  
  public void setPosition(float paramFloat1, float paramFloat2) { translate(paramFloat1 - this.x, paramFloat2 - this.y); }
  
  public GlyphLayout setText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2) {
    clear();
    return addText(paramCharSequence, paramFloat1, paramFloat2, 0, paramCharSequence.length(), 0.0F, 8, false);
  }
  
  public GlyphLayout setText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, boolean paramBoolean) {
    clear();
    return addText(paramCharSequence, paramFloat1, paramFloat2, 0, paramCharSequence.length(), paramFloat3, paramInt, paramBoolean);
  }
  
  public GlyphLayout setText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, int paramInt3, boolean paramBoolean) {
    clear();
    return addText(paramCharSequence, paramFloat1, paramFloat2, paramInt1, paramInt2, paramFloat3, paramInt3, paramBoolean);
  }
  
  public GlyphLayout setText(CharSequence paramCharSequence, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, int paramInt3, boolean paramBoolean, String paramString) {
    clear();
    return addText(paramCharSequence, paramFloat1, paramFloat2, paramInt1, paramInt2, paramFloat3, paramInt3, paramBoolean, paramString);
  }
  
  public void setText(GlyphLayout paramGlyphLayout, float paramFloat1, float paramFloat2) {
    clear();
    addText(paramGlyphLayout, paramFloat1, paramFloat2);
  }
  
  public void setUseIntegerPositions(boolean paramBoolean) { this.integer = paramBoolean; }
  
  public void tint(Color paramColor) {
    float f = paramColor.toFloatBits();
    if (this.currentTint == f)
      return; 
    this.currentTint = f;
    int[] arrayOfInt = this.tempGlyphCount;
    int i = arrayOfInt.length;
    byte b;
    for (b = 0; b < i; b++)
      arrayOfInt[b] = 0; 
    int j = this.layouts.size;
    for (b = 0; b < j; b++) {
      GlyphLayout glyphLayout = (GlyphLayout)this.layouts.get(b);
      int k = glyphLayout.runs.size;
      for (i = 0; i < k; i++) {
        GlyphLayout.GlyphRun glyphRun = (GlyphLayout.GlyphRun)glyphLayout.runs.get(i);
        Array array = glyphRun.glyphs;
        f = tempColor.set(glyphRun.color).mul(paramColor).toFloatBits();
        int m = array.size;
        for (byte b1 = 0; b1 < m; b1++) {
          int n = ((BitmapFont.Glyph)array.get(b1)).page;
          int i1 = arrayOfInt[n];
          arrayOfInt[n] = arrayOfInt[n] + 1;
          float[] arrayOfFloat = this.pageVertices[n];
          for (n = 0; n < 20; n += 5)
            arrayOfFloat[i1 * 20 + 2 + n] = f; 
        } 
      } 
    } 
  }
  
  public void translate(float paramFloat1, float paramFloat2) {
    if (paramFloat1 == 0.0F && paramFloat2 == 0.0F)
      return; 
    float f1 = paramFloat1;
    float f2 = paramFloat2;
    if (this.integer) {
      f1 = Math.round(paramFloat1);
      f2 = Math.round(paramFloat2);
    } 
    this.x += f1;
    this.y += f2;
    for (float[] arrayOfFloat : this.pageVertices) {
      int i = this.idx[null];
      for (boolean bool = false; bool < i; bool += true) {
        arrayOfFloat[bool] = arrayOfFloat[bool] + f1;
        boolean bool1 = bool + true;
        arrayOfFloat[bool1] = arrayOfFloat[bool1] + f2;
      } 
    } 
  }
  
  public boolean usesIntegerPositions() { return this.integer; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/BitmapFontCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */