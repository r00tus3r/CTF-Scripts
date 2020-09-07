package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;

public class Tooltip<T extends Actor> extends InputListener {
  static Vector2 tmp = new Vector2();
  
  boolean always;
  
  final Container<T> container;
  
  boolean instant;
  
  private final TooltipManager manager;
  
  Actor targetActor;
  
  public Tooltip(T paramT) { this(paramT, TooltipManager.getInstance()); }
  
  public Tooltip(T paramT, TooltipManager paramTooltipManager) {
    this.manager = paramTooltipManager;
    this.container = new Container(paramT) {
        public void act(float param1Float) {
          super.act(param1Float);
          if (Tooltip.this.targetActor != null && Tooltip.this.targetActor.getStage() == null)
            remove(); 
        }
      };
    this.container.setTouchable(Touchable.disabled);
  }
  
  private void setContainerPosition(Actor paramActor, float paramFloat1, float paramFloat2) {
    this.targetActor = paramActor;
    Stage stage = paramActor.getStage();
    if (stage == null)
      return; 
    this.container.pack();
    float f1 = this.manager.offsetX;
    float f2 = this.manager.offsetY;
    float f3 = this.manager.edgeDistance;
    Vector2 vector22 = tmp;
    paramFloat1 += f1;
    Vector2 vector23 = paramActor.localToStageCoordinates(vector22.set(paramFloat1, paramFloat2 - f2 - this.container.getHeight()));
    vector22 = vector23;
    if (vector23.y < f3)
      vector22 = paramActor.localToStageCoordinates(tmp.set(paramFloat1, paramFloat2 + f2)); 
    if (vector22.x < f3)
      vector22.x = f3; 
    if (vector22.x + this.container.getWidth() > stage.getWidth() - f3)
      vector22.x = stage.getWidth() - f3 - this.container.getWidth(); 
    if (vector22.y + this.container.getHeight() > stage.getHeight() - f3)
      vector22.y = stage.getHeight() - f3 - this.container.getHeight(); 
    this.container.setPosition(vector22.x, vector22.y);
    Vector2 vector21 = paramActor.localToStageCoordinates(tmp.set(paramActor.getWidth() / 2.0F, paramActor.getHeight() / 2.0F));
    vector21.sub(this.container.getX(), this.container.getY());
    this.container.setOrigin(vector21.x, vector21.y);
  }
  
  public void enter(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt, Actor paramActor) {
    if (paramInt != -1)
      return; 
    if (Gdx.input.isTouched())
      return; 
    Actor actor = paramInputEvent.getListenerActor();
    if (paramActor != null && paramActor.isDescendantOf(actor))
      return; 
    setContainerPosition(actor, paramFloat1, paramFloat2);
    this.manager.enter(this);
  }
  
  public void exit(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt, Actor paramActor) {
    if (paramActor != null && paramActor.isDescendantOf(paramInputEvent.getListenerActor()))
      return; 
    hide();
  }
  
  public T getActor() { return (T)this.container.getActor(); }
  
  public Container<T> getContainer() { return this.container; }
  
  public TooltipManager getManager() { return this.manager; }
  
  public void hide() { this.manager.hide(this); }
  
  public boolean mouseMoved(InputEvent paramInputEvent, float paramFloat1, float paramFloat2) {
    if (this.container.hasParent())
      return false; 
    setContainerPosition(paramInputEvent.getListenerActor(), paramFloat1, paramFloat2);
    return true;
  }
  
  public void setActor(T paramT) { this.container.setActor(paramT); }
  
  public void setAlways(boolean paramBoolean) { this.always = paramBoolean; }
  
  public void setInstant(boolean paramBoolean) { this.instant = paramBoolean; }
  
  public boolean touchDown(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    if (this.instant) {
      this.container.toFront();
      return false;
    } 
    this.manager.touchDown(this);
    return false;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Tooltip.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */