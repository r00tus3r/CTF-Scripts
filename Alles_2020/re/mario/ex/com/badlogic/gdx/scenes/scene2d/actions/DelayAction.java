package com.badlogic.gdx.scenes.scene2d.actions;

public class DelayAction extends DelegateAction {
  private float duration;
  
  private float time;
  
  public DelayAction() {}
  
  public DelayAction(float paramFloat) { this.duration = paramFloat; }
  
  protected boolean delegate(float paramFloat) {
    float f1 = this.time;
    float f2 = this.duration;
    float f3 = paramFloat;
    if (f1 < f2) {
      this.time = f1 + paramFloat;
      paramFloat = this.time;
      if (paramFloat < f2)
        return false; 
      f3 = paramFloat - f2;
    } 
    return (this.action == null) ? true : this.action.act(f3);
  }
  
  public void finish() { this.time = this.duration; }
  
  public float getDuration() { return this.duration; }
  
  public float getTime() { return this.time; }
  
  public void restart() {
    super.restart();
    this.time = 0.0F;
  }
  
  public void setDuration(float paramFloat) { this.duration = paramFloat; }
  
  public void setTime(float paramFloat) { this.time = paramFloat; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/DelayAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */