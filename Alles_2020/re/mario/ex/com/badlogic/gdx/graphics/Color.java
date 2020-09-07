package com.badlogic.gdx.graphics;

import com.badlogic.gdx.utils.NumberUtils;

public class Color {
  public static final Color BLACK;
  
  public static final Color BLUE;
  
  public static final Color BROWN;
  
  public static final Color CHARTREUSE;
  
  public static final Color CLEAR;
  
  public static final Color CORAL;
  
  public static final Color CYAN;
  
  public static final Color DARK_GRAY;
  
  public static final Color FIREBRICK;
  
  public static final Color FOREST;
  
  public static final Color GOLD;
  
  public static final Color GOLDENROD;
  
  public static final Color GRAY;
  
  public static final Color GREEN;
  
  public static final Color LIGHT_GRAY;
  
  public static final Color LIME;
  
  public static final Color MAGENTA;
  
  public static final Color MAROON;
  
  public static final Color NAVY;
  
  public static final Color OLIVE;
  
  public static final Color ORANGE;
  
  public static final Color PINK;
  
  public static final Color PURPLE;
  
  public static final Color RED;
  
  public static final Color ROYAL;
  
  public static final Color SALMON;
  
  public static final Color SCARLET;
  
  public static final Color SKY;
  
  public static final Color SLATE;
  
  public static final Color TAN;
  
  public static final Color TEAL;
  
  public static final Color VIOLET;
  
  public static final Color WHITE = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  public static final float WHITE_FLOAT_BITS;
  
  public static final Color YELLOW;
  
  public float a;
  
  public float b;
  
  public float g;
  
  public float r;
  
  static  {
    LIGHT_GRAY = new Color(-1077952513);
    GRAY = new Color(2139062271);
    DARK_GRAY = new Color(1061109759);
    BLACK = new Color(0.0F, 0.0F, 0.0F, 1.0F);
    WHITE_FLOAT_BITS = WHITE.toFloatBits();
    CLEAR = new Color(0.0F, 0.0F, 0.0F, 0.0F);
    BLUE = new Color(0.0F, 0.0F, 1.0F, 1.0F);
    NAVY = new Color(0.0F, 0.0F, 0.5F, 1.0F);
    ROYAL = new Color(1097458175);
    SLATE = new Color(1887473919);
    SKY = new Color(-2016482305);
    CYAN = new Color(0.0F, 1.0F, 1.0F, 1.0F);
    TEAL = new Color(0.0F, 0.5F, 0.5F, 1.0F);
    GREEN = new Color(16711935);
    CHARTREUSE = new Color(2147418367);
    LIME = new Color(852308735);
    FOREST = new Color(579543807);
    OLIVE = new Color(1804477439);
    YELLOW = new Color(-65281);
    GOLD = new Color(-2686721);
    GOLDENROD = new Color(-626712321);
    ORANGE = new Color(-5963521);
    BROWN = new Color(-1958407169);
    TAN = new Color(-759919361);
    FIREBRICK = new Color(-1306385665);
    RED = new Color(-16776961);
    SCARLET = new Color(-13361921);
    CORAL = new Color(-8433409);
    SALMON = new Color(-92245249);
    PINK = new Color(-9849601);
    MAGENTA = new Color(1.0F, 0.0F, 1.0F, 1.0F);
    PURPLE = new Color(-1608453889);
    VIOLET = new Color(-293409025);
    MAROON = new Color(-1339006721);
  }
  
  public Color() {}
  
  public Color(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.r = paramFloat1;
    this.g = paramFloat2;
    this.b = paramFloat3;
    this.a = paramFloat4;
    clamp();
  }
  
  public Color(int paramInt) { rgba8888ToColor(this, paramInt); }
  
  public Color(Color paramColor) { set(paramColor); }
  
  public static void abgr8888ToColor(Color paramColor, float paramFloat) {
    int i = NumberUtils.floatToIntColor(paramFloat);
    paramColor.a = ((0xFF000000 & i) >>> 24) / 255.0F;
    paramColor.b = ((0xFF0000 & i) >>> 16) / 255.0F;
    paramColor.g = ((0xFF00 & i) >>> 8) / 255.0F;
    paramColor.r = (i & 0xFF) / 255.0F;
  }
  
  public static int alpha(float paramFloat) { return (int)(paramFloat * 255.0F); }
  
  public static int argb8888(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return (int)(paramFloat1 * 255.0F) << 24 | (int)(paramFloat2 * 255.0F) << 16 | (int)(paramFloat3 * 255.0F) << 8 | (int)(paramFloat4 * 255.0F); }
  
  public static int argb8888(Color paramColor) {
    int i = (int)(paramColor.a * 255.0F);
    int j = (int)(paramColor.r * 255.0F);
    int k = (int)(paramColor.g * 255.0F);
    return (int)(paramColor.b * 255.0F) | i << 24 | j << 16 | k << 8;
  }
  
  public static void argb8888ToColor(Color paramColor, int paramInt) {
    paramColor.a = ((0xFF000000 & paramInt) >>> 24) / 255.0F;
    paramColor.r = ((0xFF0000 & paramInt) >>> 16) / 255.0F;
    paramColor.g = ((0xFF00 & paramInt) >>> 8) / 255.0F;
    paramColor.b = (paramInt & 0xFF) / 255.0F;
  }
  
  public static int luminanceAlpha(float paramFloat1, float paramFloat2) { return (int)(paramFloat1 * 255.0F) << 8 | (int)(paramFloat2 * 255.0F); }
  
  public static int rgb565(float paramFloat1, float paramFloat2, float paramFloat3) { return (int)(paramFloat1 * 31.0F) << 11 | (int)(paramFloat2 * 63.0F) << 5 | (int)(paramFloat3 * 31.0F); }
  
  public static int rgb565(Color paramColor) {
    int i = (int)(paramColor.r * 31.0F);
    int j = (int)(paramColor.g * 63.0F);
    return (int)(paramColor.b * 31.0F) | i << 11 | j << 5;
  }
  
  public static void rgb565ToColor(Color paramColor, int paramInt) {
    paramColor.r = ((0xF800 & paramInt) >>> 11) / 31.0F;
    paramColor.g = ((paramInt & 0x7E0) >>> 5) / 63.0F;
    paramColor.b = ((paramInt & 0x1F) >>> 0) / 31.0F;
  }
  
  public static int rgb888(float paramFloat1, float paramFloat2, float paramFloat3) { return (int)(paramFloat1 * 255.0F) << 16 | (int)(paramFloat2 * 255.0F) << 8 | (int)(paramFloat3 * 255.0F); }
  
  public static int rgb888(Color paramColor) {
    int i = (int)(paramColor.r * 255.0F);
    int j = (int)(paramColor.g * 255.0F);
    return (int)(paramColor.b * 255.0F) | i << 16 | j << 8;
  }
  
  public static void rgb888ToColor(Color paramColor, int paramInt) {
    paramColor.r = ((0xFF0000 & paramInt) >>> 16) / 255.0F;
    paramColor.g = ((0xFF00 & paramInt) >>> 8) / 255.0F;
    paramColor.b = (paramInt & 0xFF) / 255.0F;
  }
  
  public static int rgba4444(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return (int)(paramFloat1 * 15.0F) << 12 | (int)(paramFloat2 * 15.0F) << 8 | (int)(paramFloat3 * 15.0F) << 4 | (int)(paramFloat4 * 15.0F); }
  
  public static int rgba4444(Color paramColor) {
    int i = (int)(paramColor.r * 15.0F);
    int j = (int)(paramColor.g * 15.0F);
    int k = (int)(paramColor.b * 15.0F);
    return (int)(paramColor.a * 15.0F) | i << 12 | j << 8 | k << 4;
  }
  
  public static void rgba4444ToColor(Color paramColor, int paramInt) {
    paramColor.r = ((0xF000 & paramInt) >>> 12) / 15.0F;
    paramColor.g = ((paramInt & 0xF00) >>> 8) / 15.0F;
    paramColor.b = ((paramInt & 0xF0) >>> 4) / 15.0F;
    paramColor.a = (paramInt & 0xF) / 15.0F;
  }
  
  public static int rgba8888(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return (int)(paramFloat1 * 255.0F) << 24 | (int)(paramFloat2 * 255.0F) << 16 | (int)(paramFloat3 * 255.0F) << 8 | (int)(paramFloat4 * 255.0F); }
  
  public static int rgba8888(Color paramColor) {
    int i = (int)(paramColor.r * 255.0F);
    int j = (int)(paramColor.g * 255.0F);
    int k = (int)(paramColor.b * 255.0F);
    return (int)(paramColor.a * 255.0F) | i << 24 | j << 16 | k << 8;
  }
  
  public static void rgba8888ToColor(Color paramColor, int paramInt) {
    paramColor.r = ((0xFF000000 & paramInt) >>> 24) / 255.0F;
    paramColor.g = ((0xFF0000 & paramInt) >>> 16) / 255.0F;
    paramColor.b = ((0xFF00 & paramInt) >>> 8) / 255.0F;
    paramColor.a = (paramInt & 0xFF) / 255.0F;
  }
  
  public static float toFloatBits(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    int i = (int)(paramFloat4 * 255.0F);
    int j = (int)(paramFloat3 * 255.0F);
    int k = (int)(paramFloat2 * 255.0F);
    return NumberUtils.intToFloatColor((int)(paramFloat1 * 255.0F) | k << 8 | j << 16 | i << 24);
  }
  
  public static float toFloatBits(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { return NumberUtils.intToFloatColor(paramInt1 | paramInt2 << 8 | paramInt3 << 16 | paramInt4 << 24); }
  
  public static int toIntBits(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { return paramInt1 | paramInt2 << 8 | paramInt3 << 16 | paramInt4 << 24; }
  
  public static Color valueOf(String paramString) {
    int m;
    String str = paramString;
    if (paramString.charAt(0) == '#')
      str = paramString.substring(1); 
    int i = Integer.valueOf(str.substring(0, 2), 16).intValue();
    int j = Integer.valueOf(str.substring(2, 4), 16).intValue();
    int k = Integer.valueOf(str.substring(4, 6), 16).intValue();
    if (str.length() != 8) {
      m = 255;
    } else {
      m = Integer.valueOf(str.substring(6, 8), 16).intValue();
    } 
    return new Color(i / 255.0F, j / 255.0F, k / 255.0F, m / 255.0F);
  }
  
  public Color add(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.r += paramFloat1;
    this.g += paramFloat2;
    this.b += paramFloat3;
    this.a += paramFloat4;
    return clamp();
  }
  
  public Color add(Color paramColor) {
    this.r += paramColor.r;
    this.g += paramColor.g;
    this.b += paramColor.b;
    this.a += paramColor.a;
    return clamp();
  }
  
  public Color clamp() {
    float f = this.r;
    if (f < 0.0F) {
      this.r = 0.0F;
    } else if (f > 1.0F) {
      this.r = 1.0F;
    } 
    f = this.g;
    if (f < 0.0F) {
      this.g = 0.0F;
    } else if (f > 1.0F) {
      this.g = 1.0F;
    } 
    f = this.b;
    if (f < 0.0F) {
      this.b = 0.0F;
    } else if (f > 1.0F) {
      this.b = 1.0F;
    } 
    f = this.a;
    if (f < 0.0F) {
      this.a = 0.0F;
    } else if (f > 1.0F) {
      this.a = 1.0F;
    } 
    return this;
  }
  
  public Color cpy() { return new Color(this); }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (this == paramObject)
      return true; 
    if (paramObject == null || getClass() != paramObject.getClass())
      return false; 
    paramObject = (Color)paramObject;
    if (toIntBits() != paramObject.toIntBits())
      bool = false; 
    return bool;
  }
  
  public Color fromHsv(float paramFloat1, float paramFloat2, float paramFloat3) {
    paramFloat1 = (paramFloat1 / 60.0F + 6.0F) % 6.0F;
    int i = (int)paramFloat1;
    float f1 = paramFloat1 - i;
    float f2 = (1.0F - paramFloat2) * paramFloat3;
    paramFloat1 = (1.0F - paramFloat2 * f1) * paramFloat3;
    paramFloat2 = (1.0F - paramFloat2 * (1.0F - f1)) * paramFloat3;
    if (i != 0) {
      if (i != 1) {
        if (i != 2) {
          if (i != 3) {
            if (i != 4) {
              this.r = paramFloat3;
              this.g = f2;
              this.b = paramFloat1;
            } else {
              this.r = paramFloat2;
              this.g = f2;
              this.b = paramFloat3;
            } 
          } else {
            this.r = f2;
            this.g = paramFloat1;
            this.b = paramFloat3;
          } 
        } else {
          this.r = f2;
          this.g = paramFloat3;
          this.b = paramFloat2;
        } 
      } else {
        this.r = paramFloat1;
        this.g = paramFloat3;
        this.b = f2;
      } 
    } else {
      this.r = paramFloat3;
      this.g = paramFloat2;
      this.b = f2;
    } 
    return clamp();
  }
  
  public Color fromHsv(float[] paramArrayOfFloat) { return fromHsv(paramArrayOfFloat[0], paramArrayOfFloat[1], paramArrayOfFloat[2]); }
  
  public int hashCode() {
    byte b2;
    byte b1;
    boolean bool;
    float f = this.r;
    int i = 0;
    if (f != 0.0F) {
      bool = NumberUtils.floatToIntBits(f);
    } else {
      bool = false;
    } 
    f = this.g;
    if (f != 0.0F) {
      b1 = NumberUtils.floatToIntBits(f);
    } else {
      b1 = 0;
    } 
    f = this.b;
    if (f != 0.0F) {
      b2 = NumberUtils.floatToIntBits(f);
    } else {
      b2 = 0;
    } 
    f = this.a;
    if (f != 0.0F)
      i = NumberUtils.floatToIntBits(f); 
    return ((bool * 31 + b1) * 31 + b2) * 31 + i;
  }
  
  public Color lerp(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    float f = this.r;
    this.r = f + (paramFloat1 - f) * paramFloat5;
    paramFloat1 = this.g;
    this.g = paramFloat1 + (paramFloat2 - paramFloat1) * paramFloat5;
    paramFloat1 = this.b;
    this.b = paramFloat1 + (paramFloat3 - paramFloat1) * paramFloat5;
    paramFloat1 = this.a;
    this.a = paramFloat1 + paramFloat5 * (paramFloat4 - paramFloat1);
    return clamp();
  }
  
  public Color lerp(Color paramColor, float paramFloat) {
    float f = this.r;
    this.r = f + (paramColor.r - f) * paramFloat;
    f = this.g;
    this.g = f + (paramColor.g - f) * paramFloat;
    f = this.b;
    this.b = f + (paramColor.b - f) * paramFloat;
    f = this.a;
    this.a = f + paramFloat * (paramColor.a - f);
    return clamp();
  }
  
  public Color mul(float paramFloat) {
    this.r *= paramFloat;
    this.g *= paramFloat;
    this.b *= paramFloat;
    this.a *= paramFloat;
    return clamp();
  }
  
  public Color mul(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.r *= paramFloat1;
    this.g *= paramFloat2;
    this.b *= paramFloat3;
    this.a *= paramFloat4;
    return clamp();
  }
  
  public Color mul(Color paramColor) {
    this.r *= paramColor.r;
    this.g *= paramColor.g;
    this.b *= paramColor.b;
    this.a *= paramColor.a;
    return clamp();
  }
  
  public Color premultiplyAlpha() {
    float f1 = this.r;
    float f2 = this.a;
    this.r = f1 * f2;
    this.g *= f2;
    this.b *= f2;
    return this;
  }
  
  public Color set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.r = paramFloat1;
    this.g = paramFloat2;
    this.b = paramFloat3;
    this.a = paramFloat4;
    return clamp();
  }
  
  public Color set(int paramInt) {
    rgba8888ToColor(this, paramInt);
    return this;
  }
  
  public Color set(Color paramColor) {
    this.r = paramColor.r;
    this.g = paramColor.g;
    this.b = paramColor.b;
    this.a = paramColor.a;
    return this;
  }
  
  public Color sub(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.r -= paramFloat1;
    this.g -= paramFloat2;
    this.b -= paramFloat3;
    this.a -= paramFloat4;
    return clamp();
  }
  
  public Color sub(Color paramColor) {
    this.r -= paramColor.r;
    this.g -= paramColor.g;
    this.b -= paramColor.b;
    this.a -= paramColor.a;
    return clamp();
  }
  
  public float toFloatBits() { return NumberUtils.intToFloatColor((int)(this.a * 255.0F) << 24 | (int)(this.b * 255.0F) << 16 | (int)(this.g * 255.0F) << 8 | (int)(this.r * 255.0F)); }
  
  public float[] toHsv(float[] paramArrayOfFloat) {
    float f1 = Math.max(Math.max(this.r, this.g), this.b);
    float f2 = Math.min(Math.min(this.r, this.g), this.b);
    float f3 = f1 - f2;
    if (f3 == 0.0F) {
      paramArrayOfFloat[0] = 0.0F;
    } else {
      float f = this.r;
      if (f1 == f) {
        paramArrayOfFloat[0] = ((this.g - this.b) * 60.0F / f3 + 360.0F) % 360.0F;
      } else {
        float f4 = this.g;
        if (f1 == f4) {
          paramArrayOfFloat[0] = (this.b - f) * 60.0F / f3 + 120.0F;
        } else {
          paramArrayOfFloat[0] = (f - f4) * 60.0F / f3 + 240.0F;
        } 
      } 
    } 
    if (f1 > 0.0F) {
      paramArrayOfFloat[1] = 1.0F - f2 / f1;
    } else {
      paramArrayOfFloat[1] = 0.0F;
    } 
    paramArrayOfFloat[2] = f1;
    return paramArrayOfFloat;
  }
  
  public int toIntBits() { return (int)(this.a * 255.0F) << 24 | (int)(this.b * 255.0F) << 16 | (int)(this.g * 255.0F) << 8 | (int)(this.r * 255.0F); }
  
  public String toString() {
    String str;
    for (str = Integer.toHexString((int)(this.r * 255.0F) << 24 | (int)(this.g * 255.0F) << 16 | (int)(this.b * 255.0F) << 8 | (int)(this.a * 255.0F)); str.length() < 8; str = stringBuilder.toString()) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("0");
      stringBuilder.append(str);
    } 
    return str;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Color.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */