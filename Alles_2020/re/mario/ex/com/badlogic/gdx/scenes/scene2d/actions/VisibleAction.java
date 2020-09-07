package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;

public class VisibleAction extends Action {
  private boolean visible;
  
  public boolean act(float paramFloat) {
    this.target.setVisible(this.visible);
    return true;
  }
  
  public boolean isVisible() { return this.visible; }
  
  public void setVisible(boolean paramBoolean) { this.visible = paramBoolean; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/VisibleAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */