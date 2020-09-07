package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Event;

public class CountdownEventAction<T extends Event> extends EventAction<T> {
  int count;
  
  int current;
  
  public CountdownEventAction(Class<? extends T> paramClass, int paramInt) {
    super(paramClass);
    this.count = paramInt;
  }
  
  public boolean handle(T paramT) {
    int i = this.current;
    boolean bool = true;
    this.current = i + 1;
    if (this.current < this.count)
      bool = false; 
    return bool;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/CountdownEventAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */