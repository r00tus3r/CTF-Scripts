package com.badlogic.gdx.scenes.scene2d.actions;

public class ScaleToAction extends TemporalAction {
  private float endX;
  
  private float endY;
  
  private float startX;
  
  private float startY;
  
  protected void begin() {
    this.startX = this.target.getScaleX();
    this.startY = this.target.getScaleY();
  }
  
  public float getX() { return this.endX; }
  
  public float getY() { return this.endY; }
  
  public void setScale(float paramFloat) {
    this.endX = paramFloat;
    this.endY = paramFloat;
  }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    this.endX = paramFloat1;
    this.endY = paramFloat2;
  }
  
  public void setX(float paramFloat) { this.endX = paramFloat; }
  
  public void setY(float paramFloat) { this.endY = paramFloat; }
  
  protected void update(float paramFloat) {
    float f;
    if (paramFloat == 0.0F) {
      f = this.startX;
      paramFloat = this.startY;
    } else if (paramFloat == 1.0F) {
      f = this.endX;
      paramFloat = this.endY;
    } else {
      float f1 = this.startX;
      f = this.endX;
      float f2 = this.startY;
      f2 += (this.endY - f2) * paramFloat;
      f = f1 + (f - f1) * paramFloat;
      paramFloat = f2;
    } 
    this.target.setScale(f, paramFloat);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/ScaleToAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */