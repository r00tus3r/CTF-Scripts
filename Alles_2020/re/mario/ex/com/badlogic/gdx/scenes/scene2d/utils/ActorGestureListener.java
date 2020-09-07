package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.input.GestureDetector;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.scenes.scene2d.InputEvent;

public class ActorGestureListener implements EventListener {
  static final Vector2 tmpCoords = new Vector2();
  
  static final Vector2 tmpCoords2 = new Vector2();
  
  Actor actor;
  
  private final GestureDetector detector;
  
  InputEvent event;
  
  Actor touchDownTarget;
  
  public ActorGestureListener() { this(20.0F, 0.4F, 1.1F, 0.15F); }
  
  public ActorGestureListener(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.detector = new GestureDetector(paramFloat1, paramFloat2, paramFloat3, paramFloat4, new GestureDetector.GestureAdapter(this) {
          private final Vector2 initialPointer1 = new Vector2();
          
          private final Vector2 initialPointer2 = new Vector2();
          
          private final Vector2 pointer1 = new Vector2();
          
          private final Vector2 pointer2 = new Vector2();
          
          private void stageToLocalAmount(Vector2 param1Vector2) {
            ActorGestureListener.this.actor.stageToLocalCoordinates(param1Vector2);
            param1Vector2.sub(ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords2.set(0.0F, 0.0F)));
          }
          
          public boolean fling(float param1Float1, float param1Float2, int param1Int) {
            stageToLocalAmount(ActorGestureListener.tmpCoords.set(param1Float1, param1Float2));
            ActorGestureListener actorGestureListener = ActorGestureListener.this;
            actorGestureListener.fling(actorGestureListener.event, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y, param1Int);
            return true;
          }
          
          public boolean longPress(float param1Float1, float param1Float2) {
            ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords.set(param1Float1, param1Float2));
            ActorGestureListener actorGestureListener = ActorGestureListener.this;
            return actorGestureListener.longPress(actorGestureListener.actor, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y);
          }
          
          public boolean pan(float param1Float1, float param1Float2, float param1Float3, float param1Float4) {
            stageToLocalAmount(ActorGestureListener.tmpCoords.set(param1Float3, param1Float4));
            param1Float3 = ActorGestureListener.tmpCoords.x;
            param1Float4 = ActorGestureListener.tmpCoords.y;
            ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords.set(param1Float1, param1Float2));
            ActorGestureListener actorGestureListener = ActorGestureListener.this;
            actorGestureListener.pan(actorGestureListener.event, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y, param1Float3, param1Float4);
            return true;
          }
          
          public boolean pinch(Vector2 param1Vector21, Vector2 param1Vector22, Vector2 param1Vector23, Vector2 param1Vector24) {
            ActorGestureListener.this.actor.stageToLocalCoordinates(this.initialPointer1.set(param1Vector21));
            ActorGestureListener.this.actor.stageToLocalCoordinates(this.initialPointer2.set(param1Vector22));
            ActorGestureListener.this.actor.stageToLocalCoordinates(this.pointer1.set(param1Vector23));
            ActorGestureListener.this.actor.stageToLocalCoordinates(this.pointer2.set(param1Vector24));
            ActorGestureListener actorGestureListener = ActorGestureListener.this;
            actorGestureListener.pinch(actorGestureListener.event, this.initialPointer1, this.initialPointer2, this.pointer1, this.pointer2);
            return true;
          }
          
          public boolean tap(float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords.set(param1Float1, param1Float2));
            ActorGestureListener actorGestureListener = ActorGestureListener.this;
            actorGestureListener.tap(actorGestureListener.event, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y, param1Int1, param1Int2);
            return true;
          }
          
          public boolean zoom(float param1Float1, float param1Float2) {
            ActorGestureListener actorGestureListener = ActorGestureListener.this;
            actorGestureListener.zoom(actorGestureListener.event, param1Float1, param1Float2);
            return true;
          }
        }); }
  
  public void fling(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {}
  
  public GestureDetector getGestureDetector() { return this.detector; }
  
  public Actor getTouchDownTarget() { return this.touchDownTarget; }
  
  public boolean handle(Event paramEvent) {
    if (!(paramEvent instanceof InputEvent))
      return false; 
    InputEvent inputEvent = (InputEvent)paramEvent;
    int i = null.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type[inputEvent.getType().ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3)
          return false; 
        this.event = inputEvent;
        this.actor = inputEvent.getListenerActor();
        this.detector.touchDragged(inputEvent.getStageX(), inputEvent.getStageY(), inputEvent.getPointer());
        return true;
      } 
      if (inputEvent.isTouchFocusCancel()) {
        this.detector.reset();
        return false;
      } 
      this.event = inputEvent;
      this.actor = inputEvent.getListenerActor();
      this.detector.touchUp(inputEvent.getStageX(), inputEvent.getStageY(), inputEvent.getPointer(), inputEvent.getButton());
      this.actor.stageToLocalCoordinates(tmpCoords.set(inputEvent.getStageX(), inputEvent.getStageY()));
      touchUp(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getButton());
      return true;
    } 
    this.actor = inputEvent.getListenerActor();
    this.touchDownTarget = inputEvent.getTarget();
    this.detector.touchDown(inputEvent.getStageX(), inputEvent.getStageY(), inputEvent.getPointer(), inputEvent.getButton());
    this.actor.stageToLocalCoordinates(tmpCoords.set(inputEvent.getStageX(), inputEvent.getStageY()));
    touchDown(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getButton());
    return true;
  }
  
  public boolean longPress(Actor paramActor, float paramFloat1, float paramFloat2) { return false; }
  
  public void pan(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {}
  
  public void pinch(InputEvent paramInputEvent, Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24) {}
  
  public void tap(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {}
  
  public void touchDown(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {}
  
  public void touchUp(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {}
  
  public void zoom(InputEvent paramInputEvent, float paramFloat1, float paramFloat2) {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */