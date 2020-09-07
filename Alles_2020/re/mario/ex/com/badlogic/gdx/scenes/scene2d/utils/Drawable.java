package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.g2d.Batch;

public interface Drawable {
  void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  float getBottomHeight();
  
  float getLeftWidth();
  
  float getMinHeight();
  
  float getMinWidth();
  
  float getRightWidth();
  
  float getTopHeight();
  
  void setBottomHeight(float paramFloat);
  
  void setLeftWidth(float paramFloat);
  
  void setMinHeight(float paramFloat);
  
  void setMinWidth(float paramFloat);
  
  void setRightWidth(float paramFloat);
  
  void setTopHeight(float paramFloat);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/Drawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */