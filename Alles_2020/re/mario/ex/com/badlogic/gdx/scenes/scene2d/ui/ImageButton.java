package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Scaling;

public class ImageButton extends Button {
  private final Image image = new Image();
  
  private ImageButtonStyle style;
  
  public ImageButton(ImageButtonStyle paramImageButtonStyle) {
    super(paramImageButtonStyle);
    this.image.setScaling(Scaling.fit);
    add(this.image);
    setStyle(paramImageButtonStyle);
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public ImageButton(Skin paramSkin) {
    this((ImageButtonStyle)paramSkin.get(ImageButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public ImageButton(Skin paramSkin, String paramString) {
    this((ImageButtonStyle)paramSkin.get(paramString, ImageButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public ImageButton(Drawable paramDrawable) { this(new ImageButtonStyle(null, null, null, paramDrawable, null, null)); }
  
  public ImageButton(Drawable paramDrawable1, Drawable paramDrawable2) { this(new ImageButtonStyle(null, null, null, paramDrawable1, paramDrawable2, null)); }
  
  public ImageButton(Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3) { this(new ImageButtonStyle(null, null, null, paramDrawable1, paramDrawable2, paramDrawable3)); }
  
  public void draw(Batch paramBatch, float paramFloat) {
    updateImage();
    super.draw(paramBatch, paramFloat);
  }
  
  public Image getImage() { return this.image; }
  
  public Cell getImageCell() { return getCell(this.image); }
  
  public ImageButtonStyle getStyle() { return this.style; }
  
  public void setStyle(Button.ButtonStyle paramButtonStyle) {
    if (paramButtonStyle instanceof ImageButtonStyle) {
      super.setStyle(paramButtonStyle);
      this.style = (ImageButtonStyle)paramButtonStyle;
      if (this.image != null)
        updateImage(); 
      return;
    } 
    throw new IllegalArgumentException("style must be an ImageButtonStyle.");
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
      str2 = "ImageButton ";
    } else {
      str2 = "";
    } 
    stringBuilder.append(str2);
    stringBuilder.append(str1);
    stringBuilder.append(": ");
    stringBuilder.append(this.image.getDrawable());
    return stringBuilder.toString();
  }
  
  protected void updateImage() {
    Drawable drawable;
    if (isDisabled() && this.style.imageDisabled != null) {
      drawable = this.style.imageDisabled;
    } else if (isPressed() && this.style.imageDown != null) {
      drawable = this.style.imageDown;
    } else if (this.isChecked && this.style.imageChecked != null) {
      if (this.style.imageCheckedOver != null && isOver()) {
        drawable = this.style.imageCheckedOver;
      } else {
        drawable = this.style.imageChecked;
      } 
    } else if (isOver() && this.style.imageOver != null) {
      drawable = this.style.imageOver;
    } else if (this.style.imageUp != null) {
      drawable = this.style.imageUp;
    } else {
      drawable = null;
    } 
    this.image.setDrawable(drawable);
  }
  
  public static class ImageButtonStyle extends Button.ButtonStyle {
    public Drawable imageChecked;
    
    public Drawable imageCheckedOver;
    
    public Drawable imageDisabled;
    
    public Drawable imageDown;
    
    public Drawable imageOver;
    
    public Drawable imageUp;
    
    public ImageButtonStyle() {}
    
    public ImageButtonStyle(Button.ButtonStyle param1ButtonStyle) { super(param1ButtonStyle); }
    
    public ImageButtonStyle(ImageButtonStyle param1ImageButtonStyle) {
      super(param1ImageButtonStyle);
      this.imageUp = param1ImageButtonStyle.imageUp;
      this.imageDown = param1ImageButtonStyle.imageDown;
      this.imageOver = param1ImageButtonStyle.imageOver;
      this.imageChecked = param1ImageButtonStyle.imageChecked;
      this.imageCheckedOver = param1ImageButtonStyle.imageCheckedOver;
      this.imageDisabled = param1ImageButtonStyle.imageDisabled;
    }
    
    public ImageButtonStyle(Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3, Drawable param1Drawable4, Drawable param1Drawable5, Drawable param1Drawable6) {
      super(param1Drawable1, param1Drawable2, param1Drawable3);
      this.imageUp = param1Drawable4;
      this.imageDown = param1Drawable5;
      this.imageChecked = param1Drawable6;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/ImageButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */