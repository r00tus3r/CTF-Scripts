package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;

public abstract class ChangeListener implements EventListener {
  public abstract void changed(ChangeEvent paramChangeEvent, Actor paramActor);
  
  public boolean handle(Event paramEvent) {
    if (!(paramEvent instanceof ChangeEvent))
      return false; 
    changed((ChangeEvent)paramEvent, paramEvent.getTarget());
    return false;
  }
  
  public static class ChangeEvent extends Event {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/ChangeListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */