package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.math.Vector2;

public class InputEvent extends Event {
  private int button;
  
  private char character;
  
  private int keyCode;
  
  private int pointer;
  
  private Actor relatedActor;
  
  private int scrollAmount;
  
  private float stageX;
  
  private float stageY;
  
  private Type type;
  
  public int getButton() { return this.button; }
  
  public char getCharacter() { return this.character; }
  
  public int getKeyCode() { return this.keyCode; }
  
  public int getPointer() { return this.pointer; }
  
  public Actor getRelatedActor() { return this.relatedActor; }
  
  public int getScrollAmount() { return this.scrollAmount; }
  
  public float getStageX() { return this.stageX; }
  
  public float getStageY() { return this.stageY; }
  
  public Type getType() { return this.type; }
  
  public boolean isTouchFocusCancel() { return (this.stageX == -2.14748365E9F || this.stageY == -2.14748365E9F); }
  
  public void reset() {
    super.reset();
    this.relatedActor = null;
    this.button = -1;
  }
  
  public void setButton(int paramInt) { this.button = paramInt; }
  
  public void setCharacter(char paramChar) { this.character = (char)paramChar; }
  
  public void setKeyCode(int paramInt) { this.keyCode = paramInt; }
  
  public void setPointer(int paramInt) { this.pointer = paramInt; }
  
  public void setRelatedActor(Actor paramActor) { this.relatedActor = paramActor; }
  
  public void setScrollAmount(int paramInt) { this.scrollAmount = paramInt; }
  
  public void setStageX(float paramFloat) { this.stageX = paramFloat; }
  
  public void setStageY(float paramFloat) { this.stageY = paramFloat; }
  
  public void setType(Type paramType) { this.type = paramType; }
  
  public Vector2 toCoordinates(Actor paramActor, Vector2 paramVector2) {
    paramVector2.set(this.stageX, this.stageY);
    paramActor.stageToLocalCoordinates(paramVector2);
    return paramVector2;
  }
  
  public String toString() { return this.type.toString(); }
  
  public enum Type {
    enter, exit, keyDown, keyTyped, keyUp, mouseMoved, scrolled, touchDown, touchDragged, touchUp;
    
    static  {
      touchDragged = new Type("touchDragged", 2);
      mouseMoved = new Type("mouseMoved", 3);
      enter = new Type("enter", 4);
      exit = new Type("exit", 5);
      scrolled = new Type("scrolled", 6);
      keyDown = new Type("keyDown", 7);
      keyUp = new Type("keyUp", 8);
      keyTyped = new Type("keyTyped", 9);
      $VALUES = new Type[] { touchDown, touchUp, touchDragged, mouseMoved, enter, exit, scrolled, keyDown, keyUp, keyTyped };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/InputEvent.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */