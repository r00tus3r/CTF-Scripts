package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Pool;

public class SequenceAction extends ParallelAction {
  private int index;
  
  public SequenceAction() {}
  
  public SequenceAction(Action paramAction) { addAction(paramAction); }
  
  public SequenceAction(Action paramAction1, Action paramAction2) {
    addAction(paramAction1);
    addAction(paramAction2);
  }
  
  public SequenceAction(Action paramAction1, Action paramAction2, Action paramAction3) {
    addAction(paramAction1);
    addAction(paramAction2);
    addAction(paramAction3);
  }
  
  public SequenceAction(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4) {
    addAction(paramAction1);
    addAction(paramAction2);
    addAction(paramAction3);
    addAction(paramAction4);
  }
  
  public SequenceAction(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4, Action paramAction5) {
    addAction(paramAction1);
    addAction(paramAction2);
    addAction(paramAction3);
    addAction(paramAction4);
    addAction(paramAction5);
  }
  
  public boolean act(float paramFloat) {
    if (this.index >= this.actions.size)
      return true; 
    pool = getPool();
    setPool(null);
    try {
      if (((Action)this.actions.get(this.index)).act(paramFloat)) {
        Actor actor = this.actor;
        if (actor == null)
          return true; 
        int i = ++this.index;
        int j = this.actions.size;
        if (i >= j)
          return true; 
      } 
      return false;
    } finally {
      setPool(pool);
    } 
  }
  
  public void restart() {
    super.restart();
    this.index = 0;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/SequenceAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */