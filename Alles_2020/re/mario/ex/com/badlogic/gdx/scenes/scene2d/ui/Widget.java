package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;

public class Widget extends Actor implements Layout {
  private boolean fillParent;
  
  private boolean layoutEnabled = true;
  
  private boolean needsLayout = true;
  
  public void draw(Batch paramBatch, float paramFloat) { validate(); }
  
  public float getMaxHeight() { return 0.0F; }
  
  public float getMaxWidth() { return 0.0F; }
  
  public float getMinHeight() { return getPrefHeight(); }
  
  public float getMinWidth() { return getPrefWidth(); }
  
  public float getPrefHeight() { return 0.0F; }
  
  public float getPrefWidth() { return 0.0F; }
  
  public void invalidate() { this.needsLayout = true; }
  
  public void invalidateHierarchy() {
    if (!this.layoutEnabled)
      return; 
    invalidate();
    Group group = getParent();
    if (group instanceof Layout)
      ((Layout)group).invalidateHierarchy(); 
  }
  
  public void layout() {}
  
  public boolean needsLayout() { return this.needsLayout; }
  
  public void pack() {
    setSize(getPrefWidth(), getPrefHeight());
    validate();
  }
  
  public void setFillParent(boolean paramBoolean) { this.fillParent = paramBoolean; }
  
  public void setLayoutEnabled(boolean paramBoolean) {
    this.layoutEnabled = paramBoolean;
    if (paramBoolean)
      invalidateHierarchy(); 
  }
  
  protected void sizeChanged() { invalidate(); }
  
  public void validate() {
    if (!this.layoutEnabled)
      return; 
    Group group = getParent();
    if (this.fillParent && group != null) {
      float f2;
      float f1;
      Stage stage = getStage();
      if (stage != null && group == stage.getRoot()) {
        f1 = stage.getWidth();
        f2 = stage.getHeight();
      } else {
        f1 = group.getWidth();
        f2 = group.getHeight();
      } 
      setSize(f1, f2);
    } 
    if (!this.needsLayout)
      return; 
    this.needsLayout = false;
    layout();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Widget.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */