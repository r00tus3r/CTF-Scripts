package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.SnapshotArray;

public class WidgetGroup extends Group implements Layout {
  private boolean fillParent;
  
  private boolean layoutEnabled = true;
  
  private boolean needsLayout = true;
  
  public WidgetGroup() {}
  
  public WidgetGroup(Actor... paramVarArgs) {
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      addActor(paramVarArgs[b]); 
  }
  
  private void setLayoutEnabled(Group paramGroup, boolean paramBoolean) {
    SnapshotArray snapshotArray = paramGroup.getChildren();
    int i = snapshotArray.size;
    for (byte b = 0; b < i; b++) {
      Actor actor = (Actor)snapshotArray.get(b);
      if (actor instanceof Layout) {
        ((Layout)actor).setLayoutEnabled(paramBoolean);
      } else if (actor instanceof Group) {
        setLayoutEnabled((Group)actor, paramBoolean);
      } 
    } 
  }
  
  protected void childrenChanged() { invalidateHierarchy(); }
  
  public void draw(Batch paramBatch, float paramFloat) {
    validate();
    super.draw(paramBatch, paramFloat);
  }
  
  public float getMaxHeight() { return 0.0F; }
  
  public float getMaxWidth() { return 0.0F; }
  
  public float getMinHeight() { return getPrefHeight(); }
  
  public float getMinWidth() { return getPrefWidth(); }
  
  public float getPrefHeight() { return 0.0F; }
  
  public float getPrefWidth() { return 0.0F; }
  
  public void invalidate() { this.needsLayout = true; }
  
  public void invalidateHierarchy() {
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
    setSize(getPrefWidth(), getPrefHeight());
    validate();
  }
  
  public void setFillParent(boolean paramBoolean) { this.fillParent = paramBoolean; }
  
  public void setLayoutEnabled(boolean paramBoolean) {
    this.layoutEnabled = paramBoolean;
    setLayoutEnabled(this, paramBoolean);
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
      if (getWidth() != f1 || getHeight() != f2) {
        setWidth(f1);
        setHeight(f2);
        invalidate();
      } 
    } 
    if (!this.needsLayout)
      return; 
    this.needsLayout = false;
    layout();
    if (this.needsLayout) {
      if (group instanceof WidgetGroup)
        return; 
      for (byte b = 0; b < 5; b++) {
        this.needsLayout = false;
        layout();
        if (!this.needsLayout)
          break; 
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/WidgetGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */