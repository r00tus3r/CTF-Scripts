package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.SnapshotArray;

public class Stack extends WidgetGroup {
  private float maxHeight;
  
  private float maxWidth;
  
  private float minHeight;
  
  private float minWidth;
  
  private float prefHeight;
  
  private float prefWidth;
  
  private boolean sizeInvalid = true;
  
  public Stack() {
    setTransform(false);
    setWidth(150.0F);
    setHeight(150.0F);
    setTouchable(Touchable.childrenOnly);
  }
  
  public Stack(Actor... paramVarArgs) {
    this();
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      addActor(paramVarArgs[b]); 
  }
  
  private void computeSize() {
    byte b = 0;
    this.sizeInvalid = false;
    this.prefWidth = 0.0F;
    this.prefHeight = 0.0F;
    this.minWidth = 0.0F;
    this.minHeight = 0.0F;
    this.maxWidth = 0.0F;
    this.maxHeight = 0.0F;
    SnapshotArray snapshotArray = getChildren();
    int i = snapshotArray.size;
    while (b < i) {
      float f2;
      float f1;
      Layout layout = (Actor)snapshotArray.get(b);
      if (layout instanceof Layout) {
        layout = (Layout)layout;
        this.prefWidth = Math.max(this.prefWidth, layout.getPrefWidth());
        this.prefHeight = Math.max(this.prefHeight, layout.getPrefHeight());
        this.minWidth = Math.max(this.minWidth, layout.getMinWidth());
        this.minHeight = Math.max(this.minHeight, layout.getMinHeight());
        f1 = layout.getMaxWidth();
        f2 = layout.getMaxHeight();
      } else {
        this.prefWidth = Math.max(this.prefWidth, layout.getWidth());
        this.prefHeight = Math.max(this.prefHeight, layout.getHeight());
        this.minWidth = Math.max(this.minWidth, layout.getWidth());
        this.minHeight = Math.max(this.minHeight, layout.getHeight());
        f2 = 0.0F;
        f1 = 0.0F;
      } 
      if (f1 > 0.0F) {
        float f = this.maxWidth;
        if (f != 0.0F)
          f1 = Math.min(f, f1); 
        this.maxWidth = f1;
      } 
      if (f2 > 0.0F) {
        f1 = this.maxHeight;
        if (f1 != 0.0F)
          f2 = Math.min(f1, f2); 
        this.maxHeight = f2;
      } 
      b++;
    } 
  }
  
  public void add(Actor paramActor) { addActor(paramActor); }
  
  public float getMaxHeight() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.maxHeight;
  }
  
  public float getMaxWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.maxWidth;
  }
  
  public float getMinHeight() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.minHeight;
  }
  
  public float getMinWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.minWidth;
  }
  
  public float getPrefHeight() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefHeight;
  }
  
  public float getPrefWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefWidth;
  }
  
  public void invalidate() {
    super.invalidate();
    this.sizeInvalid = true;
  }
  
  public void layout() {
    if (this.sizeInvalid)
      computeSize(); 
    float f1 = getWidth();
    float f2 = getHeight();
    SnapshotArray snapshotArray = getChildren();
    byte b = 0;
    int i = snapshotArray.size;
    while (b < i) {
      Actor actor = (Actor)snapshotArray.get(b);
      actor.setBounds(0.0F, 0.0F, f1, f2);
      if (actor instanceof Layout)
        ((Layout)actor).validate(); 
      b++;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Stack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */