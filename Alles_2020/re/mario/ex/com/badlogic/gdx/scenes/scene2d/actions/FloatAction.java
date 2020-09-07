package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.Interpolation;

public class FloatAction extends TemporalAction {
  private float end = 1.0F;
  
  private float start = 0.0F;
  
  private float value;
  
  public FloatAction() {}
  
  public FloatAction(float paramFloat1, float paramFloat2) {}
  
  public FloatAction(float paramFloat1, float paramFloat2, float paramFloat3) { super(paramFloat3); }
  
  public FloatAction(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) { super(paramFloat3, paramInterpolation); }
  
  protected void begin() { this.value = this.start; }
  
  public float getEnd() { return this.end; }
  
  public float getStart() { return this.start; }
  
  public float getValue() { return this.value; }
  
  public void setEnd(float paramFloat) { this.end = paramFloat; }
  
  public void setStart(float paramFloat) { this.start = paramFloat; }
  
  public void setValue(float paramFloat) { this.value = paramFloat; }
  
  protected void update(float paramFloat) {
    if (paramFloat == 0.0F) {
      this.value = this.start;
    } else if (paramFloat == 1.0F) {
      this.value = this.end;
    } else {
      float f = this.start;
      this.value = f + (this.end - f) * paramFloat;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/FloatAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */