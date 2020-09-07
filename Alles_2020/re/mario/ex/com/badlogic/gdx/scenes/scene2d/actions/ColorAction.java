package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.graphics.Color;

public class ColorAction extends TemporalAction {
  private Color color;
  
  private final Color end = new Color();
  
  private float startA;
  
  private float startB;
  
  private float startG;
  
  private float startR;
  
  protected void begin() {
    if (this.color == null)
      this.color = this.target.getColor(); 
    this.startR = this.color.r;
    this.startG = this.color.g;
    this.startB = this.color.b;
    this.startA = this.color.a;
  }
  
  public Color getColor() { return this.color; }
  
  public Color getEndColor() { return this.end; }
  
  public void reset() {
    super.reset();
    this.color = null;
  }
  
  public void setColor(Color paramColor) { this.color = paramColor; }
  
  public void setEndColor(Color paramColor) { this.end.set(paramColor); }
  
  protected void update(float paramFloat) {
    if (paramFloat == 0.0F) {
      this.color.set(this.startR, this.startG, this.startB, this.startA);
    } else if (paramFloat == 1.0F) {
      this.color.set(this.end);
    } else {
      float f1 = this.startR;
      float f2 = this.end.r;
      float f3 = this.startR;
      float f4 = this.startG;
      float f5 = this.end.g;
      float f6 = this.startG;
      float f7 = this.startB;
      float f8 = this.end.b;
      float f9 = this.startB;
      float f10 = this.startA;
      float f11 = this.end.a;
      float f12 = this.startA;
      this.color.set(f1 + (f2 - f3) * paramFloat, f4 + (f5 - f6) * paramFloat, f7 + (f8 - f9) * paramFloat, f10 + (f11 - f12) * paramFloat);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/ColorAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */