package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.graphics.Color;

public class AlphaAction extends TemporalAction {
  private Color color;
  
  private float end;
  
  private float start;
  
  protected void begin() {
    if (this.color == null)
      this.color = this.target.getColor(); 
    this.start = this.color.a;
  }
  
  public float getAlpha() { return this.end; }
  
  public Color getColor() { return this.color; }
  
  public void reset() {
    super.reset();
    this.color = null;
  }
  
  public void setAlpha(float paramFloat) { this.end = paramFloat; }
  
  public void setColor(Color paramColor) { this.color = paramColor; }
  
  protected void update(float paramFloat) {
    if (paramFloat == 0.0F) {
      this.color.a = this.start;
    } else if (paramFloat == 1.0F) {
      this.color.a = this.end;
    } else {
      Color color1 = this.color;
      float f = this.start;
      color1.a = f + (this.end - f) * paramFloat;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/AlphaAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */