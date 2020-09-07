package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.utils.Pool;

public class RunnableAction extends Action {
  private boolean ran;
  
  private Runnable runnable;
  
  public boolean act(float paramFloat) {
    if (!this.ran) {
      this.ran = true;
      run();
    } 
    return true;
  }
  
  public Runnable getRunnable() { return this.runnable; }
  
  public void reset() {
    super.reset();
    this.runnable = null;
  }
  
  public void restart() { this.ran = false; }
  
  public void run() {
    pool = getPool();
    setPool(null);
    try {
      this.runnable.run();
      return;
    } finally {
      setPool(pool);
    } 
  }
  
  public void setRunnable(Runnable paramRunnable) { this.runnable = paramRunnable; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/RunnableAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */