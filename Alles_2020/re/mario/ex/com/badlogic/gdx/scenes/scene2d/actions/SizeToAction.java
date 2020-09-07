package com.badlogic.gdx.scenes.scene2d.actions;

public class SizeToAction extends TemporalAction {
  private float endHeight;
  
  private float endWidth;
  
  private float startHeight;
  
  private float startWidth;
  
  protected void begin() {
    this.startWidth = this.target.getWidth();
    this.startHeight = this.target.getHeight();
  }
  
  public float getHeight() { return this.endHeight; }
  
  public float getWidth() { return this.endWidth; }
  
  public void setHeight(float paramFloat) { this.endHeight = paramFloat; }
  
  public void setSize(float paramFloat1, float paramFloat2) {
    this.endWidth = paramFloat1;
    this.endHeight = paramFloat2;
  }
  
  public void setWidth(float paramFloat) { this.endWidth = paramFloat; }
  
  protected void update(float paramFloat) {
    float f;
    if (paramFloat == 0.0F) {
      f = this.startWidth;
      paramFloat = this.startHeight;
    } else if (paramFloat == 1.0F) {
      f = this.endWidth;
      paramFloat = this.endHeight;
    } else {
      f = this.startWidth;
      float f1 = this.endWidth;
      float f2 = this.startHeight;
      f2 += (this.endHeight - f2) * paramFloat;
      f += (f1 - f) * paramFloat;
      paramFloat = f2;
    } 
    this.target.setSize(f, paramFloat);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/SizeToAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */