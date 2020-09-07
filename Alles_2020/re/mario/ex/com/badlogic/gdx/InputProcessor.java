package com.badlogic.gdx;

public interface InputProcessor {
  boolean keyDown(int paramInt);
  
  boolean keyTyped(char paramChar);
  
  boolean keyUp(int paramInt);
  
  boolean mouseMoved(int paramInt1, int paramInt2);
  
  boolean scrolled(int paramInt);
  
  boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  boolean touchDragged(int paramInt1, int paramInt2, int paramInt3);
  
  boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/InputProcessor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */