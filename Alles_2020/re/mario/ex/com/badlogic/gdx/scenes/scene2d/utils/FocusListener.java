package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;

public abstract class FocusListener implements EventListener {
  public boolean handle(Event paramEvent) {
    if (!(paramEvent instanceof FocusEvent))
      return false; 
    FocusEvent focusEvent = (FocusEvent)paramEvent;
    int i = null.$SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type[focusEvent.getType().ordinal()];
    if (i != 1) {
      if (i == 2)
        scrollFocusChanged(focusEvent, paramEvent.getTarget(), focusEvent.isFocused()); 
    } else {
      keyboardFocusChanged(focusEvent, paramEvent.getTarget(), focusEvent.isFocused());
    } 
    return false;
  }
  
  public void keyboardFocusChanged(FocusEvent paramFocusEvent, Actor paramActor, boolean paramBoolean) {}
  
  public void scrollFocusChanged(FocusEvent paramFocusEvent, Actor paramActor, boolean paramBoolean) {}
  
  public static class FocusEvent extends Event {
    private boolean focused;
    
    private Actor relatedActor;
    
    private Type type;
    
    public Actor getRelatedActor() { return this.relatedActor; }
    
    public Type getType() { return this.type; }
    
    public boolean isFocused() { return this.focused; }
    
    public void reset() {
      super.reset();
      this.relatedActor = null;
    }
    
    public void setFocused(boolean param1Boolean) { this.focused = param1Boolean; }
    
    public void setRelatedActor(Actor param1Actor) { this.relatedActor = param1Actor; }
    
    public void setType(Type param1Type) { this.type = param1Type; }
    
    public enum Type {
      keyboard, scroll;
      
      static  {
        $VALUES = new Type[] { keyboard, scroll };
      }
    }
  }
  
  public enum Type {
    keyboard, scroll;
    
    static  {
      $VALUES = new Type[] { keyboard, scroll };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/FocusListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */