package com.badlogic.gdx.scenes.scene2d.actions;

public class RotateByAction extends RelativeTemporalAction {
  private float amount;
  
  public float getAmount() { return this.amount; }
  
  public void setAmount(float paramFloat) { this.amount = paramFloat; }
  
  protected void updateRelative(float paramFloat) { this.target.rotateBy(this.amount * paramFloat); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/RotateByAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */