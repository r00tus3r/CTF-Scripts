package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class TextButton extends Button {
  private Label label;
  
  private TextButtonStyle style;
  
  public TextButton(String paramString, Skin paramSkin) {
    this(paramString, (TextButtonStyle)paramSkin.get(TextButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public TextButton(String paramString1, Skin paramSkin, String paramString2) {
    this(paramString1, (TextButtonStyle)paramSkin.get(paramString2, TextButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public TextButton(String paramString, TextButtonStyle paramTextButtonStyle) {
    setStyle(paramTextButtonStyle);
    this.style = paramTextButtonStyle;
    this.label = new Label(paramString, new Label.LabelStyle(paramTextButtonStyle.font, paramTextButtonStyle.fontColor));
    this.label.setAlignment(1);
    add(this.label).expand().fill();
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    Color color;
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
  
  public Label getLabel() { return this.label; }
  
  public Cell<Label> getLabelCell() { return getCell(this.label); }
  
  public TextButtonStyle getStyle() { return this.style; }
  
  public CharSequence getText() { return this.label.getText(); }
  
  public void setLabel(Label paramLabel) {
    getLabelCell().setActor(paramLabel);
    this.label = paramLabel;
  }
  
  public void setStyle(Button.ButtonStyle paramButtonStyle) {
    if (paramButtonStyle != null) {
      if (paramButtonStyle instanceof TextButtonStyle) {
        super.setStyle(paramButtonStyle);
        paramButtonStyle = (TextButtonStyle)paramButtonStyle;
        this.style = paramButtonStyle;
        Label label1 = this.label;
        if (label1 != null) {
          Label.LabelStyle labelStyle = label1.getStyle();
          labelStyle.font = paramButtonStyle.font;
          labelStyle.fontColor = paramButtonStyle.fontColor;
          this.label.setStyle(labelStyle);
        } 
        return;
      } 
      throw new IllegalArgumentException("style must be a TextButtonStyle.");
    } 
    throw new NullPointerException("style cannot be null");
  }
  
  public void setText(String paramString) { this.label.setText(paramString); }
  
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
      str2 = "TextButton ";
    } else {
      str2 = "";
    } 
    stringBuilder.append(str2);
    stringBuilder.append(str1);
    stringBuilder.append(": ");
    stringBuilder.append(this.label.getText());
    return stringBuilder.toString();
  }
  
  public static class TextButtonStyle extends Button.ButtonStyle {
    public Color checkedFontColor;
    
    public Color checkedOverFontColor;
    
    public Color disabledFontColor;
    
    public Color downFontColor;
    
    public BitmapFont font;
    
    public Color fontColor;
    
    public Color overFontColor;
    
    public TextButtonStyle() {}
    
    public TextButtonStyle(TextButtonStyle param1TextButtonStyle) {
      super(param1TextButtonStyle);
      this.font = param1TextButtonStyle.font;
      Color color2 = param1TextButtonStyle.fontColor;
      if (color2 != null)
        this.fontColor = new Color(color2); 
      color2 = param1TextButtonStyle.downFontColor;
      if (color2 != null)
        this.downFontColor = new Color(color2); 
      color2 = param1TextButtonStyle.overFontColor;
      if (color2 != null)
        this.overFontColor = new Color(color2); 
      color2 = param1TextButtonStyle.checkedFontColor;
      if (color2 != null)
        this.checkedFontColor = new Color(color2); 
      color2 = param1TextButtonStyle.checkedOverFontColor;
      if (color2 != null)
        this.checkedOverFontColor = new Color(color2); 
      Color color1 = param1TextButtonStyle.disabledFontColor;
      if (color1 != null)
        this.disabledFontColor = new Color(color1); 
    }
    
    public TextButtonStyle(Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3, BitmapFont param1BitmapFont) {
      super(param1Drawable1, param1Drawable2, param1Drawable3);
      this.font = param1BitmapFont;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/TextButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */