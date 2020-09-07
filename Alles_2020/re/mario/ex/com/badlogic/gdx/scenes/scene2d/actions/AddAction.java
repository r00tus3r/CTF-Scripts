package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;

public class AddAction extends Action {
  private Action action;
  
  public boolean act(float paramFloat) {
    this.target.addAction(this.action);
    return true;
  }
  
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
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/AddAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */