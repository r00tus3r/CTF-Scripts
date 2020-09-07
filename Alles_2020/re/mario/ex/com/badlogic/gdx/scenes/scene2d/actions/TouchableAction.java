package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Touchable;

public class TouchableAction extends Action {
  private Touchable touchable;
  
  public boolean act(float paramFloat) {
    this.target.setTouchable(this.touchable);
    return true;
  }
  
  public Touchable getTouchable() { return this.touchable; }
  
  public void setTouchable(Touchable paramTouchable) { this.touchable = paramTouchable; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/TouchableAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */