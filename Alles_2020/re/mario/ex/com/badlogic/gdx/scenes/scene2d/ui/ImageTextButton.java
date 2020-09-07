package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Scaling;

public class ImageTextButton extends Button {
  private final Image image;
  
  private Label label;
  
  private ImageTextButtonStyle style;
  
  public ImageTextButton(String paramString, ImageTextButtonStyle paramImageTextButtonStyle) {
    super(paramImageTextButtonStyle);
    this.style = paramImageTextButtonStyle;
    defaults().space(3.0F);
    this.image = new Image();
    this.image.setScaling(Scaling.fit);
    this.label = new Label(paramString, new Label.LabelStyle(paramImageTextButtonStyle.font, paramImageTextButtonStyle.fontColor));
    this.label.setAlignment(1);
    add(this.image);
    add(this.label);
    setStyle(paramImageTextButtonStyle);
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public ImageTextButton(String paramString, Skin paramSkin) {
    this(paramString, (ImageTextButtonStyle)paramSkin.get(ImageTextButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public ImageTextButton(String paramString1, Skin paramSkin, String paramString2) {
    this(paramString1, (ImageTextButtonStyle)paramSkin.get(paramString2, ImageTextButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    Color color;
    updateImage();
    if (isDisabled() && this.style.disabledFontColor != null) {
      color = this.style.disabledFontColor;
    } else if (isPressed() && this.style.downFontColor != null) {
      color = this.style.downFontColor;
    } else if (this.isChecked && this.style.checkedFontColor != null) {
      if (isOver() && this.style.checkedOverFontColor != null) {
        color = this.style.checkedOverFontColor;
      } else {
        color = this.style.checkedFontColor;
      } 
    } else if (isOver() && this.style.overFontColor != null) {
      color = this.style.overFontColor;
    } else {
      color = this.style.fontColor;
    } 
    if (color != null)
      (this.label.getStyle()).fontColor = color; 
    super.draw(paramBatch, paramFloat);
  }
  
  public Image getImage() { return this.image; }
  
  public Cell getImageCell() { return getCell(this.image); }
  
  public Label getLabel() { return this.label; }
  
  public Cell getLabelCell() { return getCell(this.label); }
  
  public ImageTextButtonStyle getStyle() { return this.style; }
  
  public CharSequence getText() { return this.label.getText(); }
  
  public void setLabel(Label paramLabel) {
    getLabelCell().setActor(paramLabel);
    this.label = paramLabel;
  }
  
  public void setStyle(Button.ButtonStyle paramButtonStyle) {
    if (paramButtonStyle instanceof ImageTextButtonStyle) {
      super.setStyle(paramButtonStyle);
      paramButtonStyle = (ImageTextButtonStyle)paramButtonStyle;
      this.style = paramButtonStyle;
      if (this.image != null)
        updateImage(); 
      Label label1 = this.label;
      if (label1 != null) {
        Label.LabelStyle labelStyle = label1.getStyle();
        labelStyle.font = paramButtonStyle.font;
        labelStyle.fontColor = paramButtonStyle.fontColor;
        this.label.setStyle(labelStyle);
      } 
      return;
    } 
    throw new IllegalArgumentException("style must be a ImageTextButtonStyle.");
  }
  
  public void setText(CharSequence paramCharSequence) { this.label.setText(paramCharSequence); }
  
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
      str2 = "ImageTextButton ";
    } else {
      str2 = "";
    } 
    stringBuilder.append(str2);
    stringBuilder.append(str1);
    stringBuilder.append(": ");
    stringBuilder.append(this.image.getDrawable());
    stringBuilder.append(" ");
    stringBuilder.append(this.label.getText());
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
  
  public static class ImageTextButtonStyle extends TextButton.TextButtonStyle {
    public Drawable imageChecked;
    
    public Drawable imageCheckedOver;
    
    public Drawable imageDisabled;
    
    public Drawable imageDown;
    
    public Drawable imageOver;
    
    public Drawable imageUp;
    
    public ImageTextButtonStyle() {}
    
    public ImageTextButtonStyle(ImageTextButtonStyle param1ImageTextButtonStyle) {
      super(param1ImageTextButtonStyle);
      Drawable drawable2 = param1ImageTextButtonStyle.imageUp;
      if (drawable2 != null)
        this.imageUp = drawable2; 
      drawable2 = param1ImageTextButtonStyle.imageDown;
      if (drawable2 != null)
        this.imageDown = drawable2; 
      drawable2 = param1ImageTextButtonStyle.imageOver;
      if (drawable2 != null)
        this.imageOver = drawable2; 
      drawable2 = param1ImageTextButtonStyle.imageChecked;
      if (drawable2 != null)
        this.imageChecked = drawable2; 
      drawable2 = param1ImageTextButtonStyle.imageCheckedOver;
      if (drawable2 != null)
        this.imageCheckedOver = drawable2; 
      Drawable drawable1 = param1ImageTextButtonStyle.imageDisabled;
      if (drawable1 != null)
        this.imageDisabled = drawable1; 
    }
    
    public ImageTextButtonStyle(TextButton.TextButtonStyle param1TextButtonStyle) { super(param1TextButtonStyle); }
    
    public ImageTextButtonStyle(Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3, BitmapFont param1BitmapFont) { super(param1Drawable1, param1Drawable2, param1Drawable3, param1BitmapFont); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/ImageTextButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */