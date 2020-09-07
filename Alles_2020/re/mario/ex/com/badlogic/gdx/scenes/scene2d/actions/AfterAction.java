package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;

public class AfterAction extends DelegateAction {
  private Array<Action> waitForActions = new Array(false, 4);
  
  protected boolean delegate(float paramFloat) {
    Array array = this.target.getActions();
    if (array.size == 1)
      this.waitForActions.clear(); 
    for (int i = this.waitForActions.size - 1; i >= 0; i--) {
      if (array.indexOf((Action)this.waitForActions.get(i), true) == -1)
        this.waitForActions.removeIndex(i); 
    } 
    return (this.waitForActions.size > 0) ? false : this.action.act(paramFloat);
  }
  
  public void restart() {
    super.restart();
    this.waitForActions.clear();
  }
  
  public void setTarget(Actor paramActor) {
    if (paramActor != null)
      this.waitForActions.addAll(paramActor.getActions()); 
    super.setTarget(paramActor);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/AfterAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */