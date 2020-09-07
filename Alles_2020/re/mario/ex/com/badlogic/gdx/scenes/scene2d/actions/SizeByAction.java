package com.badlogic.gdx.scenes.scene2d.actions;

public class SizeByAction extends RelativeTemporalAction {
  private float amountHeight;
  
  private float amountWidth;
  
  public float getAmountHeight() { return this.amountHeight; }
  
  public float getAmountWidth() { return this.amountWidth; }
  
  public void setAmount(float paramFloat1, float paramFloat2) {
    this.amountWidth = paramFloat1;
    this.amountHeight = paramFloat2;
  }
  
  public void setAmountHeight(float paramFloat) { this.amountHeight = paramFloat; }
  
  public void setAmountWidth(float paramFloat) { this.amountWidth = paramFloat; }
  
  protected void updateRelative(float paramFloat) { this.target.sizeBy(this.amountWidth * paramFloat, this.amountHeight * paramFloat); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/SizeByAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */