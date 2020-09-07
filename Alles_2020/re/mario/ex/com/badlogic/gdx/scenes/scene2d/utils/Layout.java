package com.badlogic.gdx.scenes.scene2d.utils;

public interface Layout {
  float getMaxHeight();
  
  float getMaxWidth();
  
  float getMinHeight();
  
  float getMinWidth();
  
  float getPrefHeight();
  
  float getPrefWidth();
  
  void invalidate();
  
  void invalidateHierarchy();
  
  void layout();
  
  void pack();
  
  void setFillParent(boolean paramBoolean);
  
  void setLayoutEnabled(boolean paramBoolean);
  
  void validate();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/Layout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */