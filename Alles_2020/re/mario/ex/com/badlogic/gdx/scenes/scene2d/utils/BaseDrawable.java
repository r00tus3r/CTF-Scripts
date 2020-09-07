package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.utils.reflect.ClassReflection;

public class BaseDrawable implements Drawable {
  private float bottomHeight;
  
  private float leftWidth;
  
  private float minHeight;
  
  private float minWidth;
  
  private String name;
  
  private float rightWidth;
  
  private float topHeight;
  
  public BaseDrawable() {}
  
  public BaseDrawable(Drawable paramDrawable) {
    if (paramDrawable instanceof BaseDrawable)
      this.name = ((BaseDrawable)paramDrawable).getName(); 
    this.leftWidth = paramDrawable.getLeftWidth();
    this.rightWidth = paramDrawable.getRightWidth();
    this.topHeight = paramDrawable.getTopHeight();
    this.bottomHeight = paramDrawable.getBottomHeight();
    this.minWidth = paramDrawable.getMinWidth();
    this.minHeight = paramDrawable.getMinHeight();
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {}
  
  public float getBottomHeight() { return this.bottomHeight; }
  
  public float getLeftWidth() { return this.leftWidth; }
  
  public float getMinHeight() { return this.minHeight; }
  
  public float getMinWidth() { return this.minWidth; }
  
  public String getName() { return this.name; }
  
  public float getRightWidth() { return this.rightWidth; }
  
  public float getTopHeight() { return this.topHeight; }
  
  public void setBottomHeight(float paramFloat) { this.bottomHeight = paramFloat; }
  
  public void setLeftWidth(float paramFloat) { this.leftWidth = paramFloat; }
  
  public void setMinHeight(float paramFloat) { this.minHeight = paramFloat; }
  
  public void setMinSize(float paramFloat1, float paramFloat2) {
    setMinWidth(paramFloat1);
    setMinHeight(paramFloat1);
  }
  
  public void setMinWidth(float paramFloat) { this.minWidth = paramFloat; }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public void setPadding(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    setTopHeight(paramFloat1);
    setLeftWidth(paramFloat2);
    setBottomHeight(paramFloat3);
    setRightWidth(paramFloat4);
  }
  
  public void setRightWidth(float paramFloat) { this.rightWidth = paramFloat; }
  
  public void setTopHeight(float paramFloat) { this.topHeight = paramFloat; }
  
  public String toString() {
    String str1 = this.name;
    String str2 = str1;
    if (str1 == null)
      str2 = ClassReflection.getSimpleName(getClass()); 
    return str2;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/BaseDrawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */