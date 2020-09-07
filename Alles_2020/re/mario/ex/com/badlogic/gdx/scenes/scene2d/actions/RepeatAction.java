package com.badlogic.gdx.scenes.scene2d.actions;

public class RepeatAction extends DelegateAction {
  public static final int FOREVER = -1;
  
  private int executedCount;
  
  private boolean finished;
  
  private int repeatCount;
  
  protected boolean delegate(float paramFloat) {
    if (this.executedCount == this.repeatCount)
      return true; 
    if (this.action.act(paramFloat)) {
      if (this.finished)
        return true; 
      if (this.repeatCount > 0)
        this.executedCount++; 
      if (this.executedCount == this.repeatCount)
        return true; 
      if (this.action != null)
        this.action.restart(); 
    } 
    return false;
  }
  
  public void finish() { this.finished = true; }
  
  public int getCount() { return this.repeatCount; }
  
  public void restart() {
    super.restart();
    this.executedCount = 0;
    this.finished = false;
  }
  
  public void setCount(int paramInt) { this.repeatCount = paramInt; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/RepeatAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */