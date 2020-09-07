package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.EventListener;

public class AddListenerAction extends Action {
  private boolean capture;
  
  private EventListener listener;
  
  public boolean act(float paramFloat) {
    if (this.capture) {
      this.target.addCaptureListener(this.listener);
    } else {
      this.target.addListener(this.listener);
    } 
    return true;
  }
  
  public boolean getCapture() { return this.capture; }
  
  public EventListener getListener() { return this.listener; }
  
  public void reset() {
    super.reset();
    this.listener = null;
  }
  
  public void setCapture(boolean paramBoolean) { this.capture = paramBoolean; }
  
  public void setListener(EventListener paramEventListener) { this.listener = paramEventListener; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/AddListenerAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */