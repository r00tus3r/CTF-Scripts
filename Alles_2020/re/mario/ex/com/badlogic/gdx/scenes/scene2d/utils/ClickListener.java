package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.utils.TimeUtils;

public class ClickListener extends InputListener {
  public static float visualPressedDuration = 0.1F;
  
  private int button;
  
  private boolean cancelled;
  
  private long lastTapTime;
  
  private boolean over;
  
  private boolean pressed;
  
  private int pressedButton = -1;
  
  private int pressedPointer = -1;
  
  private int tapCount;
  
  private long tapCountInterval = 400000000L;
  
  private float tapSquareSize = 14.0F;
  
  private float touchDownX = -1.0F;
  
  private float touchDownY = -1.0F;
  
  private long visualPressedTime;
  
  static  {
  
  }
  
  public ClickListener() {}
  
  public ClickListener(int paramInt) { this.button = paramInt; }
  
  public void cancel() {
    if (this.pressedPointer == -1)
      return; 
    this.cancelled = true;
    this.pressed = false;
  }
  
  public void clicked(InputEvent paramInputEvent, float paramFloat1, float paramFloat2) {}
  
  public void enter(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt, Actor paramActor) {
    if (paramInt == -1 && !this.cancelled)
      this.over = true; 
  }
  
  public void exit(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt, Actor paramActor) {
    if (paramInt == -1 && !this.cancelled)
      this.over = false; 
  }
  
  public int getButton() { return this.button; }
  
  public int getPressedButton() { return this.pressedButton; }
  
  public int getPressedPointer() { return this.pressedPointer; }
  
  public int getTapCount() { return this.tapCount; }
  
  public float getTapSquareSize() { return this.tapSquareSize; }
  
  public float getTouchDownX() { return this.touchDownX; }
  
  public float getTouchDownY() { return this.touchDownY; }
  
  public boolean inTapSquare() {
    boolean bool;
    if (this.touchDownX != -1.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean inTapSquare(float paramFloat1, float paramFloat2) {
    float f = this.touchDownX;
    byte b = 0;
    if (f == -1.0F && this.touchDownY == -1.0F)
      return false; 
    int i = b;
    if (Math.abs(paramFloat1 - this.touchDownX) < this.tapSquareSize) {
      i = b;
      if (Math.abs(paramFloat2 - this.touchDownY) < this.tapSquareSize)
        i = 1; 
    } 
    return i;
  }
  
  public void invalidateTapSquare() {
    this.touchDownX = -1.0F;
    this.touchDownY = -1.0F;
  }
  
  public boolean isOver() { return (this.over || this.pressed); }
  
  public boolean isOver(Actor paramActor, float paramFloat1, float paramFloat2) {
    Actor actor = paramActor.hit(paramFloat1, paramFloat2, true);
    return (actor == null || !actor.isDescendantOf(paramActor)) ? inTapSquare(paramFloat1, paramFloat2) : 1;
  }
  
  public boolean isPressed() { return this.pressed; }
  
  public boolean isVisualPressed() {
    if (this.pressed)
      return true; 
    long l = this.visualPressedTime;
    if (l <= 0L)
      return false; 
    if (l > TimeUtils.millis())
      return true; 
    this.visualPressedTime = 0L;
    return false;
  }
  
  public void setButton(int paramInt) { this.button = paramInt; }
  
  public void setTapCount(int paramInt) { this.tapCount = paramInt; }
  
  public void setTapCountInterval(float paramFloat) { this.tapCountInterval = (long)(paramFloat * 1.0E9F); }
  
  public void setTapSquareSize(float paramFloat) { this.tapSquareSize = paramFloat; }
  
  public void setVisualPressed(boolean paramBoolean) {
    if (paramBoolean) {
      this.visualPressedTime = TimeUtils.millis() + (long)(visualPressedDuration * 1000.0F);
    } else {
      this.visualPressedTime = 0L;
    } 
  }
  
  public boolean touchDown(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    if (this.pressed)
      return false; 
    if (paramInt1 == 0) {
      int i = this.button;
      if (i != -1 && paramInt2 != i)
        return false; 
    } 
    this.pressed = true;
    this.pressedPointer = paramInt1;
    this.pressedButton = paramInt2;
    this.touchDownX = paramFloat1;
    this.touchDownY = paramFloat2;
    setVisualPressed(true);
    return true;
  }
  
  public void touchDragged(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {
    if (paramInt == this.pressedPointer && !this.cancelled) {
      this.pressed = isOver(paramInputEvent.getListenerActor(), paramFloat1, paramFloat2);
      if (!this.pressed)
        invalidateTapSquare(); 
    } 
  }
  
  public void touchUp(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    if (paramInt1 == this.pressedPointer) {
      if (!this.cancelled) {
        boolean bool1 = isOver(paramInputEvent.getListenerActor(), paramFloat1, paramFloat2);
        boolean bool2 = bool1;
        if (bool1) {
          bool2 = bool1;
          if (paramInt1 == 0) {
            paramInt1 = this.button;
            bool2 = bool1;
            if (paramInt1 != -1) {
              bool2 = bool1;
              if (paramInt2 != paramInt1)
                bool2 = false; 
            } 
          } 
        } 
        if (bool2) {
          long l = TimeUtils.nanoTime();
          if (l - this.lastTapTime > this.tapCountInterval)
            this.tapCount = 0; 
          this.tapCount++;
          this.lastTapTime = l;
          clicked(paramInputEvent, paramFloat1, paramFloat2);
        } 
      } 
      this.pressed = false;
      this.pressedPointer = -1;
      this.pressedButton = -1;
      this.cancelled = false;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/ClickListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */