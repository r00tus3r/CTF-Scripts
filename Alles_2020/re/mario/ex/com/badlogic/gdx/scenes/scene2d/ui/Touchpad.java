package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Circle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Pools;

public class Touchpad extends Widget {
  private final Circle deadzoneBounds = new Circle(0.0F, 0.0F, 0.0F);
  
  private float deadzoneRadius;
  
  private final Circle knobBounds = new Circle(0.0F, 0.0F, 0.0F);
  
  private final Vector2 knobPercent = new Vector2();
  
  private final Vector2 knobPosition = new Vector2();
  
  boolean resetOnTouchUp = true;
  
  private TouchpadStyle style;
  
  private final Circle touchBounds = new Circle(0.0F, 0.0F, 0.0F);
  
  boolean touched;
  
  public Touchpad(float paramFloat, Skin paramSkin) { this(paramFloat, (TouchpadStyle)paramSkin.get(TouchpadStyle.class)); }
  
  public Touchpad(float paramFloat, Skin paramSkin, String paramString) { this(paramFloat, (TouchpadStyle)paramSkin.get(paramString, TouchpadStyle.class)); }
  
  public Touchpad(float paramFloat, TouchpadStyle paramTouchpadStyle) {
    if (paramFloat >= 0.0F) {
      this.deadzoneRadius = paramFloat;
      this.knobPosition.set(getWidth() / 2.0F, getHeight() / 2.0F);
      setStyle(paramTouchpadStyle);
      setSize(getPrefWidth(), getPrefHeight());
      addListener(new InputListener() {
            public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
              if (Touchpad.this.touched)
                return false; 
              Touchpad touchpad = Touchpad.this;
              touchpad.touched = true;
              touchpad.calculatePositionAndValue(param1Float1, param1Float2, false);
              return true;
            }
            
            public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) { Touchpad.this.calculatePositionAndValue(param1Float1, param1Float2, false); }
            
            public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
              Touchpad touchpad = Touchpad.this;
              touchpad.touched = false;
              touchpad.calculatePositionAndValue(param1Float1, param1Float2, touchpad.resetOnTouchUp);
            }
          });
      return;
    } 
    throw new IllegalArgumentException("deadzoneRadius must be > 0");
  }
  
  void calculatePositionAndValue(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    float f1 = this.knobPosition.x;
    float f2 = this.knobPosition.y;
    float f3 = this.knobPercent.x;
    float f4 = this.knobPercent.y;
    float f5 = this.knobBounds.x;
    float f6 = this.knobBounds.y;
    this.knobPosition.set(f5, f6);
    this.knobPercent.set(0.0F, 0.0F);
    if (!paramBoolean && !this.deadzoneBounds.contains(paramFloat1, paramFloat2)) {
      this.knobPercent.set((paramFloat1 - f5) / this.knobBounds.radius, (paramFloat2 - f6) / this.knobBounds.radius);
      f5 = this.knobPercent.len();
      if (f5 > 1.0F)
        this.knobPercent.scl(1.0F / f5); 
      if (this.knobBounds.contains(paramFloat1, paramFloat2)) {
        this.knobPosition.set(paramFloat1, paramFloat2);
      } else {
        this.knobPosition.set(this.knobPercent).nor().scl(this.knobBounds.radius).add(this.knobBounds.x, this.knobBounds.y);
      } 
    } 
    if (f3 != this.knobPercent.x || f4 != this.knobPercent.y) {
      ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent)Pools.obtain(ChangeListener.ChangeEvent.class);
      if (fire(changeEvent)) {
        this.knobPercent.set(f3, f4);
        this.knobPosition.set(f1, f2);
      } 
      Pools.free(changeEvent);
    } 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    validate();
    Color color = getColor();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    float f1 = getX();
    float f2 = getY();
    float f3 = getWidth();
    paramFloat = getHeight();
    Drawable drawable = this.style.background;
    if (drawable != null)
      drawable.draw(paramBatch, f1, f2, f3, paramFloat); 
    drawable = this.style.knob;
    if (drawable != null)
      drawable.draw(paramBatch, f1 + this.knobPosition.x - drawable.getMinWidth() / 2.0F, f2 + this.knobPosition.y - drawable.getMinHeight() / 2.0F, drawable.getMinWidth(), drawable.getMinHeight()); 
  }
  
  public float getKnobPercentX() { return this.knobPercent.x; }
  
  public float getKnobPercentY() { return this.knobPercent.y; }
  
  public float getKnobX() { return this.knobPosition.x; }
  
  public float getKnobY() { return this.knobPosition.y; }
  
  public float getPrefHeight() {
    float f;
    if (this.style.background != null) {
      f = this.style.background.getMinHeight();
    } else {
      f = 0.0F;
    } 
    return f;
  }
  
  public float getPrefWidth() {
    float f;
    if (this.style.background != null) {
      f = this.style.background.getMinWidth();
    } else {
      f = 0.0F;
    } 
    return f;
  }
  
  public boolean getResetOnTouchUp() { return this.resetOnTouchUp; }
  
  public TouchpadStyle getStyle() { return this.style; }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    Touchpad touchpad = null;
    if (paramBoolean && getTouchable() != Touchable.enabled)
      return null; 
    if (!isVisible())
      return null; 
    if (this.touchBounds.contains(paramFloat1, paramFloat2))
      touchpad = this; 
    return touchpad;
  }
  
  public boolean isTouched() { return this.touched; }
  
  public void layout() {
    float f1 = getWidth() / 2.0F;
    float f2 = getHeight() / 2.0F;
    float f3 = Math.min(f1, f2);
    this.touchBounds.set(f1, f2, f3);
    float f4 = f3;
    if (this.style.knob != null)
      f4 = f3 - Math.max(this.style.knob.getMinWidth(), this.style.knob.getMinHeight()) / 2.0F; 
    this.knobBounds.set(f1, f2, f4);
    this.deadzoneBounds.set(f1, f2, this.deadzoneRadius);
    this.knobPosition.set(f1, f2);
    this.knobPercent.set(0.0F, 0.0F);
  }
  
  public void setDeadzone(float paramFloat) {
    if (paramFloat >= 0.0F) {
      this.deadzoneRadius = paramFloat;
      invalidate();
      return;
    } 
    throw new IllegalArgumentException("deadzoneRadius must be > 0");
  }
  
  public void setResetOnTouchUp(boolean paramBoolean) { this.resetOnTouchUp = paramBoolean; }
  
  public void setStyle(TouchpadStyle paramTouchpadStyle) {
    if (paramTouchpadStyle != null) {
      this.style = paramTouchpadStyle;
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null");
  }
  
  public static class TouchpadStyle {
    public Drawable background;
    
    public Drawable knob;
    
    public TouchpadStyle() {}
    
    public TouchpadStyle(TouchpadStyle param1TouchpadStyle) {
      this.background = param1TouchpadStyle.background;
      this.knob = param1TouchpadStyle.knob;
    }
    
    public TouchpadStyle(Drawable param1Drawable1, Drawable param1Drawable2) {
      this.background = param1Drawable1;
      this.knob = param1Drawable2;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Touchpad.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */