package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.utils.Pool;

public abstract class Action implements Pool.Poolable {
  protected Actor actor;
  
  private Pool pool;
  
  protected Actor target;
  
  public abstract boolean act(float paramFloat);
  
  public Actor getActor() { return this.actor; }
  
  public Pool getPool() { return this.pool; }
  
  public Actor getTarget() { return this.target; }
  
  public void reset() {
    this.actor = null;
    this.target = null;
    this.pool = null;
    restart();
  }
  
  public void restart() {}
  
  public void setActor(Actor paramActor) {
    this.actor = paramActor;
    if (this.target == null)
      setTarget(paramActor); 
    if (paramActor == null) {
      Pool pool1 = this.pool;
      if (pool1 != null) {
        pool1.free(this);
        this.pool = null;
      } 
    } 
  }
  
  public void setPool(Pool paramPool) { this.pool = paramPool; }
  
  public void setTarget(Actor paramActor) { this.target = paramActor; }
  
  public String toString() {
    String str1 = getClass().getName();
    int i = str1.lastIndexOf('.');
    String str2 = str1;
    if (i != -1)
      str2 = str1.substring(i + 1); 
    str1 = str2;
    if (str2.endsWith("Action"))
      str1 = str2.substring(0, str2.length() - 6); 
    return str1;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/Action.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */