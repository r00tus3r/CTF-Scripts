package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.utils.reflect.ClassReflection;

public abstract class EventAction<T extends Event> extends Action {
  boolean active;
  
  final Class<? extends T> eventClass;
  
  private final EventListener listener = new EventListener() {
      public boolean handle(Event param1Event) {
        if (!EventAction.this.active || !ClassReflection.isInstance(EventAction.this.eventClass, param1Event))
          return false; 
        EventAction eventAction = EventAction.this;
        eventAction.result = eventAction.handle(param1Event);
        return EventAction.this.result;
      }
    };
  
  boolean result;
  
  public EventAction(Class<? extends T> paramClass) { this.eventClass = paramClass; }
  
  public boolean act(float paramFloat) {
    this.active = true;
    return this.result;
  }
  
  public abstract boolean handle(T paramT);
  
  public boolean isActive() { return this.active; }
  
  public void restart() {
    this.result = false;
    this.active = false;
  }
  
  public void setActive(boolean paramBoolean) { this.active = paramBoolean; }
  
  public void setTarget(Actor paramActor) {
    if (this.target != null)
      this.target.removeListener(this.listener); 
    super.setTarget(paramActor);
    if (paramActor != null)
      paramActor.addListener(this.listener); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/EventAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */