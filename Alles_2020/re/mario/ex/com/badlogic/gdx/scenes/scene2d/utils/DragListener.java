package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;

public class DragListener extends InputListener {
  private int button;
  
  private float dragLastX;
  
  private float dragLastY;
  
  private float dragStartX;
  
  private float dragStartY;
  
  private float dragX;
  
  private float dragY;
  
  private boolean dragging;
  
  private int pressedPointer = -1;
  
  private float stageTouchDownX = -1.0F;
  
  private float stageTouchDownY = -1.0F;
  
  private float tapSquareSize = 14.0F;
  
  private float touchDownX = -1.0F;
  
  private float touchDownY = -1.0F;
  
  public void cancel() {
    this.dragging = false;
    this.pressedPointer = -1;
  }
  
  public void drag(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {}
  
  public void dragStart(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {}
  
  public void dragStop(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {}
  
  public int getButton() { return this.button; }
  
  public float getDeltaX() { return this.dragX - this.dragLastX; }
  
  public float getDeltaY() { return this.dragY - this.dragLastY; }
  
  public float getDragDistance() { return Vector2.len(this.dragX - this.dragStartX, this.dragY - this.dragStartY); }
  
  public float getDragStartX() { return this.dragStartX; }
  
  public float getDragStartY() { return this.dragStartY; }
  
  public float getDragX() { return this.dragX; }
  
  public float getDragY() { return this.dragY; }
  
  public float getStageTouchDownX() { return this.stageTouchDownX; }
  
  public float getStageTouchDownY() { return this.stageTouchDownY; }
  
  public float getTapSquareSize() { return this.tapSquareSize; }
  
  public float getTouchDownX() { return this.touchDownX; }
  
  public float getTouchDownY() { return this.touchDownY; }
  
  public boolean isDragging() { return this.dragging; }
  
  public void setButton(int paramInt) { this.button = paramInt; }
  
  public void setDragStartX(float paramFloat) { this.dragStartX = paramFloat; }
  
  public void setDragStartY(float paramFloat) { this.dragStartY = paramFloat; }
  
  public void setTapSquareSize(float paramFloat) { this.tapSquareSize = paramFloat; }
  
  public boolean touchDown(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    if (this.pressedPointer != -1)
      return false; 
    if (paramInt1 == 0) {
      int i = this.button;
      if (i != -1 && paramInt2 != i)
        return false; 
    } 
    this.pressedPointer = paramInt1;
    this.touchDownX = paramFloat1;
    this.touchDownY = paramFloat2;
    this.stageTouchDownX = paramInputEvent.getStageX();
    this.stageTouchDownY = paramInputEvent.getStageY();
    return true;
  }
  
  public void touchDragged(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {
    if (paramInt != this.pressedPointer)
      return; 
    if (!this.dragging && (Math.abs(this.touchDownX - paramFloat1) > this.tapSquareSize || Math.abs(this.touchDownY - paramFloat2) > this.tapSquareSize)) {
      this.dragging = true;
      this.dragStartX = paramFloat1;
      this.dragStartY = paramFloat2;
      dragStart(paramInputEvent, paramFloat1, paramFloat2, paramInt);
      this.dragX = paramFloat1;
      this.dragY = paramFloat2;
    } 
    if (this.dragging) {
      this.dragLastX = this.dragX;
      this.dragLastY = this.dragY;
      this.dragX = paramFloat1;
      this.dragY = paramFloat2;
      drag(paramInputEvent, paramFloat1, paramFloat2, paramInt);
    } 
  }
  
  public void touchUp(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    if (paramInt1 == this.pressedPointer) {
      if (this.dragging)
        dragStop(paramInputEvent, paramFloat1, paramFloat2, paramInt1); 
      cancel();
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/DragListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */