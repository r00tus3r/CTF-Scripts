package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Pool;

public abstract class DelegateAction extends Action {
  protected Action action;
  
  public final boolean act(float paramFloat) {
    pool = getPool();
    setPool(null);
    try {
      return delegate(paramFloat);
    } finally {
      setPool(pool);
    } 
  }
  
  protected abstract boolean delegate(float paramFloat);
  
  public Action getAction() { return this.action; }
  
  public void reset() {
    super.reset();
    this.action = null;
  }
  
  public void restart() {
    Action action1 = this.action;
    if (action1 != null)
      action1.restart(); 
  }
  
  public void setAction(Action paramAction) { this.action = paramAction; }
  
  public void setActor(Actor paramActor) {
    Action action1 = this.action;
    if (action1 != null)
      action1.setActor(paramActor); 
    super.setActor(paramActor);
  }
  
  public void setTarget(Actor paramActor) {
    Action action1 = this.action;
    if (action1 != null)
      action1.setTarget(paramActor); 
    super.setTarget(paramActor);
  }
  
  public String toString() {
    String str;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(super.toString());
    if (this.action == null) {
      str = "";
    } else {
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("(");
      stringBuilder1.append(this.action);
      stringBuilder1.append(")");
      str = stringBuilder1.toString();
    } 
    stringBuilder.append(str);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/DelegateAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */