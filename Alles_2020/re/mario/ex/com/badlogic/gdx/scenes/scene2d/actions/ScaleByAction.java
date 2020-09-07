package com.badlogic.gdx.scenes.scene2d.actions;

public class ScaleByAction extends RelativeTemporalAction {
  private float amountX;
  
  private float amountY;
  
  public float getAmountX() { return this.amountX; }
  
  public float getAmountY() { return this.amountY; }
  
  public void setAmount(float paramFloat) {
    this.amountX = paramFloat;
    this.amountY = paramFloat;
  }
  
  public void setAmount(float paramFloat1, float paramFloat2) {
    this.amountX = paramFloat1;
    this.amountY = paramFloat2;
  }
  
  public void setAmountX(float paramFloat) { this.amountX = paramFloat; }
  
  public void setAmountY(float paramFloat) { this.amountY = paramFloat; }
  
  protected void updateRelative(float paramFloat) { this.target.scaleBy(this.amountX * paramFloat, this.amountY * paramFloat); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/ScaleByAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */