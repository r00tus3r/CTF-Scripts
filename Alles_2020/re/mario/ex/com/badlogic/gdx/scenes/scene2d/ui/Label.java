package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.BitmapFontCache;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.StringBuilder;

public class Label extends Widget {
  private static final GlyphLayout prefSizeLayout;
  
  private static final Color tempColor = new Color();
  
  private BitmapFontCache cache;
  
  private String ellipsis;
  
  private boolean fontScaleChanged = false;
  
  private float fontScaleX = 1.0F;
  
  private float fontScaleY = 1.0F;
  
  private int intValue = Integer.MIN_VALUE;
  
  private int labelAlign = 8;
  
  private float lastPrefHeight;
  
  private final GlyphLayout layout = new GlyphLayout();
  
  private int lineAlign = 8;
  
  private final Vector2 prefSize = new Vector2();
  
  private boolean prefSizeInvalid = true;
  
  private LabelStyle style;
  
  private final StringBuilder text = new StringBuilder();
  
  private boolean wrap;
  
  static  {
    prefSizeLayout = new GlyphLayout();
  }
  
  public Label(CharSequence paramCharSequence, LabelStyle paramLabelStyle) {
    if (paramCharSequence != null)
      this.text.append(paramCharSequence); 
    setStyle(paramLabelStyle);
    if (paramCharSequence != null && paramCharSequence.length() > 0)
      setSize(getPrefWidth(), getPrefHeight()); 
  }
  
  public Label(CharSequence paramCharSequence, Skin paramSkin) { this(paramCharSequence, (LabelStyle)paramSkin.get(LabelStyle.class)); }
  
  public Label(CharSequence paramCharSequence, Skin paramSkin, String paramString) { this(paramCharSequence, (LabelStyle)paramSkin.get(paramString, LabelStyle.class)); }
  
  public Label(CharSequence paramCharSequence, Skin paramSkin, String paramString, Color paramColor) { this(paramCharSequence, new LabelStyle(paramSkin.getFont(paramString), paramColor)); }
  
  public Label(CharSequence paramCharSequence, Skin paramSkin, String paramString1, String paramString2) { this(paramCharSequence, new LabelStyle(paramSkin.getFont(paramString1), paramSkin.getColor(paramString2))); }
  
  private void computePrefSize() {
    this.prefSizeInvalid = false;
    GlyphLayout glyphLayout = prefSizeLayout;
    if (this.wrap && this.ellipsis == null) {
      float f1 = getWidth();
      float f2 = f1;
      if (this.style.background != null)
        f2 = f1 - this.style.background.getLeftWidth() + this.style.background.getRightWidth(); 
      glyphLayout.setText(this.cache.getFont(), this.text, Color.WHITE, f2, 8, true);
    } else {
      glyphLayout.setText(this.cache.getFont(), this.text);
    } 
    this.prefSize.set(glyphLayout.width, glyphLayout.height);
  }
  
  private void scaleAndComputePrefSize() {
    BitmapFont bitmapFont = this.cache.getFont();
    float f1 = bitmapFont.getScaleX();
    float f2 = bitmapFont.getScaleY();
    if (this.fontScaleChanged)
      bitmapFont.getData().setScale(this.fontScaleX, this.fontScaleY); 
    computePrefSize();
    if (this.fontScaleChanged)
      bitmapFont.getData().setScale(f1, f2); 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    validate();
    Color color = tempColor.set(getColor());
    color.a *= paramFloat;
    if (this.style.background != null) {
      paramBatch.setColor(color.r, color.g, color.b, color.a);
      this.style.background.draw(paramBatch, getX(), getY(), getWidth(), getHeight());
    } 
    if (this.style.fontColor != null)
      color.mul(this.style.fontColor); 
    this.cache.tint(color);
    this.cache.setPosition(getX(), getY());
    this.cache.draw(paramBatch);
  }
  
  protected BitmapFontCache getBitmapFontCache() { return this.cache; }
  
  public float getFontScaleX() { return this.fontScaleX; }
  
  public float getFontScaleY() { return this.fontScaleY; }
  
  public GlyphLayout getGlyphLayout() { return this.layout; }
  
  public int getLabelAlign() { return this.labelAlign; }
  
  public int getLineAlign() { return this.lineAlign; }
  
  public float getPrefHeight() {
    if (this.prefSizeInvalid)
      scaleAndComputePrefSize(); 
    float f1 = 1.0F;
    if (this.fontScaleChanged)
      f1 = this.fontScaleY / this.style.font.getScaleY(); 
    float f2 = this.prefSize.y - this.style.font.getDescent() * f1 * 2.0F;
    Drawable drawable = this.style.background;
    f1 = f2;
    if (drawable != null)
      f1 = f2 + drawable.getTopHeight() + drawable.getBottomHeight(); 
    return f1;
  }
  
  public float getPrefWidth() {
    if (this.wrap)
      return 0.0F; 
    if (this.prefSizeInvalid)
      scaleAndComputePrefSize(); 
    float f1 = this.prefSize.x;
    Drawable drawable = this.style.background;
    float f2 = f1;
    if (drawable != null)
      f2 = f1 + drawable.getLeftWidth() + drawable.getRightWidth(); 
    return f2;
  }
  
  public LabelStyle getStyle() { return this.style; }
  
  public StringBuilder getText() { return this.text; }
  
  public void invalidate() {
    super.invalidate();
    this.prefSizeInvalid = true;
  }
  
  public void layout() {
    float f8;
    float f7;
    float f3;
    boolean bool;
    BitmapFont bitmapFont = this.cache.getFont();
    float f1 = bitmapFont.getScaleX();
    float f2 = bitmapFont.getScaleY();
    if (this.fontScaleChanged)
      bitmapFont.getData().setScale(this.fontScaleX, this.fontScaleY); 
    if (this.wrap && this.ellipsis == null) {
      bool = true;
    } else {
      bool = false;
    } 
    if (bool) {
      f3 = getPrefHeight();
      if (f3 != this.lastPrefHeight) {
        this.lastPrefHeight = f3;
        invalidateHierarchy();
      } 
    } 
    float f4 = getWidth();
    float f5 = getHeight();
    Drawable drawable = this.style.background;
    if (drawable != null) {
      f3 = drawable.getLeftWidth();
      f6 = drawable.getBottomHeight();
      float f9 = drawable.getLeftWidth();
      float f10 = drawable.getRightWidth();
      f7 = drawable.getBottomHeight();
      f8 = drawable.getTopHeight();
      f4 -= f9 + f10;
      f5 -= f7 + f8;
    } else {
      f3 = 0.0F;
      f6 = 0.0F;
    } 
    GlyphLayout glyphLayout = this.layout;
    if (bool || this.text.indexOf("\n") != -1) {
      StringBuilder stringBuilder1 = this.text;
      int j = stringBuilder1.length;
      Color color = Color.WHITE;
      int k = this.lineAlign;
      String str = this.ellipsis;
      GlyphLayout glyphLayout1 = glyphLayout;
      glyphLayout.setText(bitmapFont, stringBuilder1, 0, j, color, f4, k, bool, str);
      float f = glyphLayout1.width;
      f8 = glyphLayout1.height;
      k = this.labelAlign;
      f7 = f3;
      if ((k & 0x8) == 0) {
        if ((k & 0x10) != 0) {
          f4 -= f;
        } else {
          f4 = (f4 - f) / 2.0F;
        } 
        f7 = f3 + f4;
      } 
      f4 = f;
    } else {
      f8 = (bitmapFont.getData()).capHeight;
      f7 = f3;
    } 
    int i = this.labelAlign;
    if ((i & 0x2) != 0) {
      if (this.cache.getFont().isFlipped()) {
        f3 = 0.0F;
      } else {
        f3 = f5 - f8;
      } 
      f3 = f6 + f3 + this.style.font.getDescent();
    } else if ((i & 0x4) != 0) {
      if (this.cache.getFont().isFlipped()) {
        f3 = f5 - f8;
      } else {
        f3 = 0.0F;
      } 
      f3 = f6 + f3 - this.style.font.getDescent();
    } else {
      f3 = f6 + (f5 - f8) / 2.0F;
    } 
    float f6 = f3;
    if (!this.cache.getFont().isFlipped())
      f6 = f3 + f8; 
    StringBuilder stringBuilder = this.text;
    glyphLayout.setText(bitmapFont, stringBuilder, 0, stringBuilder.length, Color.WHITE, f4, this.lineAlign, bool, this.ellipsis);
    this.cache.setText(glyphLayout, f7, f6);
    if (this.fontScaleChanged)
      bitmapFont.getData().setScale(f1, f2); 
  }
  
  public void setAlignment(int paramInt) { setAlignment(paramInt, paramInt); }
  
  public void setAlignment(int paramInt1, int paramInt2) {
    this.labelAlign = paramInt1;
    if ((paramInt2 & 0x8) != 0) {
      this.lineAlign = 8;
    } else if ((paramInt2 & 0x10) != 0) {
      this.lineAlign = 16;
    } else {
      this.lineAlign = 1;
    } 
    invalidate();
  }
  
  public void setEllipsis(String paramString) { this.ellipsis = paramString; }
  
  public void setEllipsis(boolean paramBoolean) {
    if (paramBoolean) {
      this.ellipsis = "...";
    } else {
      this.ellipsis = null;
    } 
  }
  
  public void setFontScale(float paramFloat) { setFontScale(paramFloat, paramFloat); }
  
  public void setFontScale(float paramFloat1, float paramFloat2) {
    this.fontScaleChanged = true;
    this.fontScaleX = paramFloat1;
    this.fontScaleY = paramFloat2;
    invalidateHierarchy();
  }
  
  public void setFontScaleX(float paramFloat) { setFontScale(paramFloat, this.fontScaleY); }
  
  public void setFontScaleY(float paramFloat) { setFontScale(this.fontScaleX, paramFloat); }
  
  public void setStyle(LabelStyle paramLabelStyle) {
    if (paramLabelStyle != null) {
      if (paramLabelStyle.font != null) {
        this.style = paramLabelStyle;
        this.cache = paramLabelStyle.font.newFontCache();
        invalidateHierarchy();
        return;
      } 
      throw new IllegalArgumentException("Missing LabelStyle font.");
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public void setText(CharSequence paramCharSequence) {
    CharSequence charSequence = paramCharSequence;
    if (paramCharSequence == null)
      charSequence = ""; 
    if (charSequence instanceof StringBuilder) {
      if (this.text.equals(charSequence))
        return; 
      this.text.setLength(0);
      this.text.append((StringBuilder)charSequence);
    } else {
      if (textEquals(charSequence))
        return; 
      this.text.setLength(0);
      this.text.append(charSequence);
    } 
    this.intValue = Integer.MIN_VALUE;
    invalidateHierarchy();
  }
  
  public boolean setText(int paramInt) {
    if (this.intValue == paramInt)
      return false; 
    setText(Integer.toString(paramInt));
    this.intValue = paramInt;
    return true;
  }
  
  public void setWrap(boolean paramBoolean) {
    this.wrap = paramBoolean;
    invalidateHierarchy();
  }
  
  public boolean textEquals(CharSequence paramCharSequence) {
    int i = this.text.length;
    char[] arrayOfChar = this.text.chars;
    if (i != paramCharSequence.length())
      return false; 
    for (byte b = 0; b < i; b++) {
      if (arrayOfChar[b] != paramCharSequence.charAt(b))
        return false; 
    } 
    return true;
  }
  
  public String toString() {
    String str1 = getName();
    if (str1 != null)
      return str1; 
    String str2 = getClass().getName();
    int i = str2.lastIndexOf('.');
    str1 = str2;
    if (i != -1)
      str1 = str2.substring(i + 1); 
    StringBuilder stringBuilder = new StringBuilder();
    if (str1.indexOf('$') != -1) {
      str2 = "Label ";
    } else {
      str2 = "";
    } 
    stringBuilder.append(str2);
    stringBuilder.append(str1);
    stringBuilder.append(": ");
    stringBuilder.append(this.text);
    return stringBuilder.toString();
  }
  
  public static class LabelStyle {
    public Drawable background;
    
    public BitmapFont font;
    
    public Color fontColor;
    
    public LabelStyle() {}
    
    public LabelStyle(BitmapFont param1BitmapFont, Color param1Color) {
      this.font = param1BitmapFont;
      this.fontColor = param1Color;
    }
    
    public LabelStyle(LabelStyle param1LabelStyle) {
      this.font = param1LabelStyle.font;
      Color color = param1LabelStyle.fontColor;
      if (color != null)
        this.fontColor = new Color(color); 
      this.background = param1LabelStyle.background;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Label.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */