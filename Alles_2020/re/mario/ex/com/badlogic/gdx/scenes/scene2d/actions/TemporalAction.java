package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.utils.Pool;

public abstract class TemporalAction extends Action {
  private boolean began;
  
  private boolean complete;
  
  private float duration;
  
  private Interpolation interpolation;
  
  private boolean reverse;
  
  private float time;
  
  public TemporalAction() {}
  
  public TemporalAction(float paramFloat) { this.duration = paramFloat; }
  
  public TemporalAction(float paramFloat, Interpolation paramInterpolation) {
    this.duration = paramFloat;
    this.interpolation = paramInterpolation;
  }
  
  public boolean act(float paramFloat) {
    boolean bool = this.complete;
    null = true;
    if (bool)
      return true; 
    pool = getPool();
    setPool(null);
    try {
      if (!this.began) {
        begin();
        this.began = true;
      } 
      this.time += paramFloat;
      if (this.time < this.duration)
        null = false; 
      this.complete = null;
      if (this.complete) {
        f = 1.0F;
      } else {
        f = this.time / this.duration;
      } 
      paramFloat = f;
      if (this.interpolation != null)
        paramFloat = this.interpolation.apply(f); 
      float f = paramFloat;
      if (this.reverse)
        f = 1.0F - paramFloat; 
      update(f);
      if (this.complete)
        end(); 
      return this.complete;
    } finally {
      setPool(pool);
    } 
  }
  
  protected void begin() {}
  
  protected void end() {}
  
  public void finish() { this.time = this.duration; }
  
  public float getDuration() { return this.duration; }
  
  public Interpolation getInterpolation() { return this.interpolation; }
  
  public float getTime() { return this.time; }
  
  public boolean isComplete() { return this.complete; }
  
  public boolean isReverse() { return this.reverse; }
  
  public void reset() {
    super.reset();
    this.reverse = false;
    this.interpolation = null;
  }
  
  public void restart() {
    this.time = 0.0F;
    this.began = false;
    this.complete = false;
  }
  
  public void setDuration(float paramFloat) { this.duration = paramFloat; }
  
  public void setInterpolation(Interpolation paramInterpolation) { this.interpolation = paramInterpolation; }
  
  public void setReverse(boolean paramBoolean) { this.reverse = paramBoolean; }
  
  public void setTime(float paramFloat) { this.time = paramFloat; }
  
  protected abstract void update(float paramFloat);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/TemporalAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */