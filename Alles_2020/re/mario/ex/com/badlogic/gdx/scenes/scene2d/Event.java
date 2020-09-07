package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.utils.Pool;

public class Event implements Pool.Poolable {
  private boolean bubbles = true;
  
  private boolean cancelled;
  
  private boolean capture;
  
  private boolean handled;
  
  private Actor listenerActor;
  
  private Stage stage;
  
  private boolean stopped;
  
  private Actor targetActor;
  
  public void cancel() {
    this.cancelled = true;
    this.stopped = true;
    this.handled = true;
  }
  
  public boolean getBubbles() { return this.bubbles; }
  
  public Actor getListenerActor() { return this.listenerActor; }
  
  public Stage getStage() { return this.stage; }
  
  public Actor getTarget() { return this.targetActor; }
  
  public void handle() { this.handled = true; }
  
  public boolean isCancelled() { return this.cancelled; }
  
  public boolean isCapture() { return this.capture; }
  
  public boolean isHandled() { return this.handled; }
  
  public boolean isStopped() { return this.stopped; }
  
  public void reset() {
    this.stage = null;
    this.targetActor = null;
    this.listenerActor = null;
    this.capture = false;
    this.bubbles = true;
    this.handled = false;
    this.stopped = false;
    this.cancelled = false;
  }
  
  public void setBubbles(boolean paramBoolean) { this.bubbles = paramBoolean; }
  
  public void setCapture(boolean paramBoolean) { this.capture = paramBoolean; }
  
  public void setListenerActor(Actor paramActor) { this.listenerActor = paramActor; }
  
  public void setStage(Stage paramStage) { this.stage = paramStage; }
  
  public void setTarget(Actor paramActor) { this.targetActor = paramActor; }
  
  public void stop() { this.stopped = true; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/Event.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */