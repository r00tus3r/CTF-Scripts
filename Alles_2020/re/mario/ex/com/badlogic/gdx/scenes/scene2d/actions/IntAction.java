package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.Interpolation;

public class IntAction extends TemporalAction {
  private int end = 1;
  
  private int start = 0;
  
  private int value;
  
  public IntAction() {}
  
  public IntAction(int paramInt1, int paramInt2) {}
  
  public IntAction(int paramInt1, int paramInt2, float paramFloat) { super(paramFloat); }
  
  public IntAction(int paramInt1, int paramInt2, float paramFloat, Interpolation paramInterpolation) { super(paramFloat, paramInterpolation); }
  
  protected void begin() { this.value = this.start; }
  
  public int getEnd() { return this.end; }
  
  public int getStart() { return this.start; }
  
  public int getValue() { return this.value; }
  
  public void setEnd(int paramInt) { this.end = paramInt; }
  
  public void setStart(int paramInt) { this.start = paramInt; }
  
  public void setValue(int paramInt) { this.value = paramInt; }
  
  protected void update(float paramFloat) {
    if (paramFloat == 0.0F) {
      this.value = this.start;
    } else if (paramFloat == 1.0F) {
      this.value = this.end;
    } else {
      int i = this.start;
      this.value = (int)(i + (this.end - i) * paramFloat);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/IntAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */