package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;

public class ParallelAction extends Action {
  Array<Action> actions = new Array(4);
  
  private boolean complete;
  
  public ParallelAction() {}
  
  public ParallelAction(Action paramAction) { addAction(paramAction); }
  
  public ParallelAction(Action paramAction1, Action paramAction2) {
    addAction(paramAction1);
    addAction(paramAction2);
  }
  
  public ParallelAction(Action paramAction1, Action paramAction2, Action paramAction3) {
    addAction(paramAction1);
    addAction(paramAction2);
    addAction(paramAction3);
  }
  
  public ParallelAction(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4) {
    addAction(paramAction1);
    addAction(paramAction2);
    addAction(paramAction3);
    addAction(paramAction4);
  }
  
  public ParallelAction(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4, Action paramAction5) {
    addAction(paramAction1);
    addAction(paramAction2);
    addAction(paramAction3);
    addAction(paramAction4);
    addAction(paramAction5);
  }
  
  public boolean act(float paramFloat) {
    if (this.complete)
      return true; 
    this.complete = true;
    pool = getPool();
    setPool(null);
    try {
      Array array = this.actions;
      int i = array.size;
      for (byte b = 0; b < i && this.actor != null; b++) {
        Action action = (Action)array.get(b);
        if (action.getActor() != null && !action.act(paramFloat))
          this.complete = false; 
        Actor actor = this.actor;
        if (actor == null)
          return true; 
      } 
      return this.complete;
    } finally {
      setPool(pool);
    } 
  }
  
  public void addAction(Action paramAction) {
    this.actions.add(paramAction);
    if (this.actor != null)
      paramAction.setActor(this.actor); 
  }
  
  public Array<Action> getActions() { return this.actions; }
  
  public void reset() {
    super.reset();
    this.actions.clear();
  }
  
  public void restart() {
    byte b = 0;
    this.complete = false;
    Array array = this.actions;
    int i = array.size;
    while (b < i) {
      ((Action)array.get(b)).restart();
      b++;
    } 
  }
  
  public void setActor(Actor paramActor) {
    Array array = this.actions;
    int i = array.size;
    for (byte b = 0; b < i; b++)
      ((Action)array.get(b)).setActor(paramActor); 
    super.setActor(paramActor);
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder(64);
    stringBuilder.append(super.toString());
    stringBuilder.append('(');
    Array array = this.actions;
    int i = array.size;
    for (byte b = 0; b < i; b++) {
      if (b)
        stringBuilder.append(", "); 
      stringBuilder.append(array.get(b));
    } 
    stringBuilder.append(')');
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/ParallelAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */