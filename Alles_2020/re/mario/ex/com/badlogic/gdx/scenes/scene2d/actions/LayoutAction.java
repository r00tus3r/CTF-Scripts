package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class LayoutAction extends Action {
  private boolean enabled;
  
  public boolean act(float paramFloat) {
    ((Layout)this.target).setLayoutEnabled(this.enabled);
    return true;
  }
  
  public boolean isEnabled() { return this.enabled; }
  
  public void setLayoutEnabled(boolean paramBoolean) { this.enabled = paramBoolean; }
  
  public void setTarget(Actor paramActor) {
    if (paramActor == null || paramActor instanceof Layout) {
      super.setTarget(paramActor);
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Actor must implement layout: ");
    stringBuilder.append(paramActor);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/LayoutAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */