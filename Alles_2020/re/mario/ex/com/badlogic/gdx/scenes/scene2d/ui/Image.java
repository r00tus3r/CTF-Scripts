package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.NinePatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.NinePatchDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.TextureRegionDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.TransformDrawable;
import com.badlogic.gdx.utils.Scaling;

public class Image extends Widget {
  private int align = 1;
  
  private Drawable drawable;
  
  private float imageHeight;
  
  private float imageWidth;
  
  private float imageX;
  
  private float imageY;
  
  private Scaling scaling;
  
  public Image() { this((Drawable)null); }
  
  public Image(Texture paramTexture) { this(new TextureRegionDrawable(new TextureRegion(paramTexture))); }
  
  public Image(NinePatch paramNinePatch) { this(new NinePatchDrawable(paramNinePatch), Scaling.stretch, 1); }
  
  public Image(TextureRegion paramTextureRegion) { this(new TextureRegionDrawable(paramTextureRegion), Scaling.stretch, 1); }
  
  public Image(Skin paramSkin, String paramString) { this(paramSkin.getDrawable(paramString), Scaling.stretch, 1); }
  
  public Image(Drawable paramDrawable) { this(paramDrawable, Scaling.stretch, 1); }
  
  public Image(Drawable paramDrawable, Scaling paramScaling) { this(paramDrawable, paramScaling, 1); }
  
  public Image(Drawable paramDrawable, Scaling paramScaling, int paramInt) {
    setDrawable(paramDrawable);
    this.scaling = paramScaling;
    this.align = paramInt;
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    validate();
    Color color = getColor();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    float f1 = getX();
    paramFloat = getY();
    float f2 = getScaleX();
    float f3 = getScaleY();
    if (this.drawable instanceof TransformDrawable) {
      float f = getRotation();
      if (f2 != 1.0F || f3 != 1.0F || f != 0.0F) {
        ((TransformDrawable)this.drawable).draw(paramBatch, f1 + this.imageX, paramFloat + this.imageY, getOriginX() - this.imageX, getOriginY() - this.imageY, this.imageWidth, this.imageHeight, f2, f3, f);
        return;
      } 
    } 
    Drawable drawable1 = this.drawable;
    if (drawable1 != null)
      drawable1.draw(paramBatch, f1 + this.imageX, paramFloat + this.imageY, this.imageWidth * f2, this.imageHeight * f3); 
  }
  
  public Drawable getDrawable() { return this.drawable; }
  
  public float getImageHeight() { return this.imageHeight; }
  
  public float getImageWidth() { return this.imageWidth; }
  
  public float getImageX() { return this.imageX; }
  
  public float getImageY() { return this.imageY; }
  
  public float getMinHeight() { return 0.0F; }
  
  public float getMinWidth() { return 0.0F; }
  
  public float getPrefHeight() {
    Drawable drawable1 = this.drawable;
    return (drawable1 != null) ? drawable1.getMinHeight() : 0.0F;
  }
  
  public float getPrefWidth() {
    Drawable drawable1 = this.drawable;
    return (drawable1 != null) ? drawable1.getMinWidth() : 0.0F;
  }
  
  public void layout() {
    Drawable drawable1 = this.drawable;
    if (drawable1 == null)
      return; 
    float f1 = drawable1.getMinWidth();
    float f2 = this.drawable.getMinHeight();
    float f3 = getWidth();
    float f4 = getHeight();
    Vector2 vector2 = this.scaling.apply(f1, f2, f3, f4);
    this.imageWidth = vector2.x;
    this.imageHeight = vector2.y;
    int i = this.align;
    if ((i & 0x8) != 0) {
      this.imageX = 0.0F;
    } else if ((i & 0x10) != 0) {
      this.imageX = (int)(f3 - this.imageWidth);
    } else {
      this.imageX = (int)(f3 / 2.0F - this.imageWidth / 2.0F);
    } 
    i = this.align;
    if ((i & 0x2) != 0) {
      this.imageY = (int)(f4 - this.imageHeight);
    } else if ((i & 0x4) != 0) {
      this.imageY = 0.0F;
    } else {
      this.imageY = (int)(f4 / 2.0F - this.imageHeight / 2.0F);
    } 
  }
  
  public void setAlign(int paramInt) {
    this.align = paramInt;
    invalidate();
  }
  
  public void setDrawable(Skin paramSkin, String paramString) { setDrawable(paramSkin.getDrawable(paramString)); }
  
  public void setDrawable(Drawable paramDrawable) {
    if (this.drawable == paramDrawable)
      return; 
    if (paramDrawable != null) {
      if (getPrefWidth() != paramDrawable.getMinWidth() || getPrefHeight() != paramDrawable.getMinHeight())
        invalidateHierarchy(); 
    } else {
      invalidateHierarchy();
    } 
    this.drawable = paramDrawable;
  }
  
  public void setScaling(Scaling paramScaling) {
    if (paramScaling != null) {
      this.scaling = paramScaling;
      invalidate();
      return;
    } 
    throw new IllegalArgumentException("scaling cannot be null.");
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
      str2 = "Image ";
    } else {
      str2 = "";
    } 
    stringBuilder.append(str2);
    stringBuilder.append(str1);
    stringBuilder.append(": ");
    stringBuilder.append(this.drawable);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Image.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */