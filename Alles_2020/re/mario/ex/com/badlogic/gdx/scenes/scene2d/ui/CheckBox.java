package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Scaling;

public class CheckBox extends TextButton {
  private Image image;
  
  private Cell imageCell;
  
  private CheckBoxStyle style;
  
  public CheckBox(String paramString, CheckBoxStyle paramCheckBoxStyle) {
    super(paramString, paramCheckBoxStyle);
    clearChildren();
    Label label = getLabel();
    Image image1 = new Image(paramCheckBoxStyle.checkboxOff, Scaling.none);
    this.image = image1;
    this.imageCell = add(image1);
    add(label);
    label.setAlignment(8);
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public CheckBox(String paramString, Skin paramSkin) { this(paramString, (CheckBoxStyle)paramSkin.get(CheckBoxStyle.class)); }
  
  public CheckBox(String paramString1, Skin paramSkin, String paramString2) { this(paramString1, (CheckBoxStyle)paramSkin.get(paramString2, CheckBoxStyle.class)); }
  
  public void draw(Batch paramBatch, float paramFloat) {
    Object object;
    if (isDisabled()) {
      if (this.isChecked && this.style.checkboxOnDisabled != null) {
        object = this.style.checkboxOnDisabled;
      } else {
        object = this.style.checkboxOffDisabled;
      } 
    } else {
      object = null;
    } 
    Drawable drawable = object;
    if (object == null) {
      boolean bool;
      if (isOver() && !isDisabled()) {
        bool = true;
      } else {
        bool = false;
      } 
      if (this.isChecked && this.style.checkboxOn != null) {
        if (bool && this.style.checkboxOnOver != null) {
          drawable = this.style.checkboxOnOver;
        } else {
          drawable = this.style.checkboxOn;
        } 
      } else if (bool && this.style.checkboxOver != null) {
        drawable = this.style.checkboxOver;
      } else {
        drawable = this.style.checkboxOff;
      } 
    } 
    this.image.setDrawable(drawable);
    super.draw(paramBatch, paramFloat);
  }
  
  public Image getImage() { return this.image; }
  
  public Cell getImageCell() { return this.imageCell; }
  
  public CheckBoxStyle getStyle() { return this.style; }
  
  public void setStyle(Button.ButtonStyle paramButtonStyle) {
    if (paramButtonStyle instanceof CheckBoxStyle) {
      super.setStyle(paramButtonStyle);
      this.style = (CheckBoxStyle)paramButtonStyle;
      return;
    } 
    throw new IllegalArgumentException("style must be a CheckBoxStyle.");
  }
  
  public static class CheckBoxStyle extends TextButton.TextButtonStyle {
    public Drawable checkboxOff;
    
    public Drawable checkboxOffDisabled;
    
    public Drawable checkboxOn;
    
    public Drawable checkboxOnDisabled;
    
    public Drawable checkboxOnOver;
    
    public Drawable checkboxOver;
    
    public CheckBoxStyle() {}
    
    public CheckBoxStyle(CheckBoxStyle param1CheckBoxStyle) {
      super(param1CheckBoxStyle);
      this.checkboxOff = param1CheckBoxStyle.checkboxOff;
      this.checkboxOn = param1CheckBoxStyle.checkboxOn;
      this.checkboxOver = param1CheckBoxStyle.checkboxOver;
      this.checkboxOffDisabled = param1CheckBoxStyle.checkboxOffDisabled;
      this.checkboxOnDisabled = param1CheckBoxStyle.checkboxOnDisabled;
    }
    
    public CheckBoxStyle(Drawable param1Drawable1, Drawable param1Drawable2, BitmapFont param1BitmapFont, Color param1Color) {
      this.checkboxOff = param1Drawable1;
      this.checkboxOn = param1Drawable2;
      this.font = param1BitmapFont;
      this.fontColor = param1Color;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/CheckBox.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */