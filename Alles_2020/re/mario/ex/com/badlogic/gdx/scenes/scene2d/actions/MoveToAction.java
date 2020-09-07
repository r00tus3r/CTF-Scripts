package com.badlogic.gdx.scenes.scene2d.actions;

public class MoveToAction extends TemporalAction {
  private int alignment = 12;
  
  private float endX;
  
  private float endY;
  
  private float startX;
  
  private float startY;
  
  protected void begin() {
    this.startX = this.target.getX(this.alignment);
    this.startY = this.target.getY(this.alignment);
  }
  
  public int getAlignment() { return this.alignment; }
  
  public float getStartX() { return this.startX; }
  
  public float getStartY() { return this.startY; }
  
  public float getX() { return this.endX; }
  
  public float getY() { return this.endY; }
  
  public void reset() {
    super.reset();
    this.alignment = 12;
  }
  
  public void setAlignment(int paramInt) { this.alignment = paramInt; }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    this.endX = paramFloat1;
    this.endY = paramFloat2;
  }
  
  public void setPosition(float paramFloat1, float paramFloat2, int paramInt) {
    this.endX = paramFloat1;
    this.endY = paramFloat2;
    this.alignment = paramInt;
  }
  
  public void setStartPosition(float paramFloat1, float paramFloat2) {
    this.startX = paramFloat1;
    this.startY = paramFloat2;
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
      f = this.startX;
      float f1 = this.endX;
      float f2 = this.startY;
      f2 += (this.endY - f2) * paramFloat;
      f += (f1 - f) * paramFloat;
      paramFloat = f2;
    } 
    this.target.setPosition(f, paramFloat, this.alignment);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/MoveToAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */