package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.math.Vector2;

public class InputListener implements EventListener {
  private static final Vector2 tmpCoords = new Vector2();
  
  public void enter(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt, Actor paramActor) {}
  
  public void exit(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt, Actor paramActor) {}
  
  public boolean handle(Event paramEvent) {
    if (!(paramEvent instanceof InputEvent))
      return false; 
    paramEvent = (InputEvent)paramEvent;
    int i = null.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type[paramEvent.getType().ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          paramEvent.toCoordinates(paramEvent.getListenerActor(), tmpCoords);
          switch (paramEvent.getType()) {
            default:
              return false;
            case exit:
              exit(paramEvent, tmpCoords.x, tmpCoords.y, paramEvent.getPointer(), paramEvent.getRelatedActor());
              return false;
            case enter:
              enter(paramEvent, tmpCoords.x, tmpCoords.y, paramEvent.getPointer(), paramEvent.getRelatedActor());
              return false;
            case scrolled:
              return scrolled(paramEvent, tmpCoords.x, tmpCoords.y, paramEvent.getScrollAmount());
            case mouseMoved:
              return mouseMoved(paramEvent, tmpCoords.x, tmpCoords.y);
            case touchDragged:
              touchDragged(paramEvent, tmpCoords.x, tmpCoords.y, paramEvent.getPointer());
              return true;
            case touchUp:
              touchUp(paramEvent, tmpCoords.x, tmpCoords.y, paramEvent.getPointer(), paramEvent.getButton());
              return true;
            case touchDown:
              break;
          } 
          return touchDown(paramEvent, tmpCoords.x, tmpCoords.y, paramEvent.getPointer(), paramEvent.getButton());
        } 
        return keyTyped(paramEvent, paramEvent.getCharacter());
      } 
      return keyUp(paramEvent, paramEvent.getKeyCode());
    } 
    return keyDown(paramEvent, paramEvent.getKeyCode());
  }
  
  public boolean keyDown(InputEvent paramInputEvent, int paramInt) { return false; }
  
  public boolean keyTyped(InputEvent paramInputEvent, char paramChar) { return false; }
  
  public boolean keyUp(InputEvent paramInputEvent, int paramInt) { return false; }
  
  public boolean mouseMoved(InputEvent paramInputEvent, float paramFloat1, float paramFloat2) { return false; }
  
  public boolean scrolled(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) { return false; }
  
  public boolean touchDown(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) { return false; }
  
  public void touchDragged(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt) {}
  
  public void touchUp(InputEvent paramInputEvent, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/InputListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */