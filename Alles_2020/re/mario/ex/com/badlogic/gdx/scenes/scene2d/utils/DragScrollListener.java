package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.ui.ScrollPane;
import com.badlogic.gdx.utils.Timer;

public class DragScrollListener extends DragListener {
  static final Vector2 tmpCoords = new Vector2();
  
  Interpolation interpolation = Interpolation.exp5In;
  
  float maxSpeed = 75.0F;
  
  float minSpeed = 15.0F;
  
  long rampTime = 1750L;
  
  private ScrollPane scroll;
  
  private Timer.Task scrollDown;
  
  private Timer.Task scrollUp;
  
  long startTime;
  
  float tickSecs = 0.05F;
  
  public DragScrollListener(final ScrollPane scroll) {
    this.scroll = paramScrollPane;
    this.scrollUp = new Timer.Task() {
        public void run() { DragScrollListener.this.scroll(scroll.getScrollY() - DragScrollListener.this.getScrollPixels()); }
      };
    this.scrollDown = new Timer.Task() {
        public void run() { DragScrollListener.this.scroll(scroll.getScrollY() + DragScrollListener.this.getScrollPixels()); }
      };
  }
  
  public void drag(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {
    paramInputEvent.getListenerActor().localToActorCoordinates(this.scroll, tmpCoords.set(paramFloat1, paramFloat2));
    if (tmpCoords.y >= this.scroll.getHeight()) {
      this.scrollDown.cancel();
      if (!this.scrollUp.isScheduled()) {
        this.startTime = System.currentTimeMillis();
        Timer.Task task = this.scrollUp;
        paramFloat1 = this.tickSecs;
        Timer.schedule(task, paramFloat1, paramFloat1);
      } 
      return;
    } 
    if (tmpCoords.y < 0.0F) {
      this.scrollUp.cancel();
      if (!this.scrollDown.isScheduled()) {
        this.startTime = System.currentTimeMillis();
        Timer.Task task = this.scrollDown;
        paramFloat1 = this.tickSecs;
        Timer.schedule(task, paramFloat1, paramFloat1);
      } 
      return;
    } 
    this.scrollUp.cancel();
    this.scrollDown.cancel();
  }
  
  public void dragStop(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {
    this.scrollUp.cancel();
    this.scrollDown.cancel();
  }
  
  float getScrollPixels() { return this.interpolation.apply(this.minSpeed, this.maxSpeed, Math.min(1.0F, (float)(System.currentTimeMillis() - this.startTime) / (float)this.rampTime)); }
  
  protected void scroll(float paramFloat) { this.scroll.setScrollY(paramFloat); }
  
  public void setup(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.minSpeed = paramFloat1;
    this.maxSpeed = paramFloat2;
    this.tickSecs = paramFloat3;
    this.rampTime = (long)(paramFloat4 * 1000.0F);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/DragScrollListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */