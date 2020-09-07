package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;

public class RemoveActorAction extends Action {
  private boolean removed;
  
  public boolean act(float paramFloat) {
    if (!this.removed) {
      this.removed = true;
      this.target.remove();
    } 
    return true;
  }
  
  public void restart() { this.removed = false; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */