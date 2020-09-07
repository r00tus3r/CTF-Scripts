package com.badlogic.gdx.scenes.scene2d.actions;

public class TimeScaleAction extends DelegateAction {
  private float scale;
  
  protected boolean delegate(float paramFloat) { return (this.action == null) ? true : this.action.act(paramFloat * this.scale); }
  
  public float getScale() { return this.scale; }
  
  public void setScale(float paramFloat) { this.scale = paramFloat; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */