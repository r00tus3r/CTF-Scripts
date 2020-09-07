package com.badlogic.gdx.scenes.scene2d.actions;

public abstract class RelativeTemporalAction extends TemporalAction {
  private float lastPercent;
  
  protected void begin() { this.lastPercent = 0.0F; }
  
  protected void update(float paramFloat) {
    updateRelative(paramFloat - this.lastPercent);
    this.lastPercent = paramFloat;
  }
  
  protected abstract void updateRelative(float paramFloat);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/RelativeTemporalAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */