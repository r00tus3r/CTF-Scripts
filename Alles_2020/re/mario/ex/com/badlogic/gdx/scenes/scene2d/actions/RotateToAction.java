package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.MathUtils;

public class RotateToAction extends TemporalAction {
  private float end;
  
  private float start;
  
  private boolean useShortestDirection = false;
  
  public RotateToAction() {}
  
  public RotateToAction(boolean paramBoolean) { this.useShortestDirection = paramBoolean; }
  
  protected void begin() { this.start = this.target.getRotation(); }
  
  public float getRotation() { return this.end; }
  
  public boolean isUseShortestDirection() { return this.useShortestDirection; }
  
  public void setRotation(float paramFloat) { this.end = paramFloat; }
  
  public void setUseShortestDirection(boolean paramBoolean) { this.useShortestDirection = paramBoolean; }
  
  protected void update(float paramFloat) {
    if (paramFloat == 0.0F) {
      paramFloat = this.start;
    } else if (paramFloat == 1.0F) {
      paramFloat = this.end;
    } else if (this.useShortestDirection) {
      paramFloat = MathUtils.lerpAngleDeg(this.start, this.end, paramFloat);
    } else {
      float f = this.start;
      paramFloat = f + (this.end - f) * paramFloat;
    } 
    this.target.setRotation(paramFloat);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/RotateToAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */