package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Pools;

public class ProgressBar extends Widget implements Disableable {
  private float animateDuration;
  
  private float animateFromValue;
  
  private Interpolation animateInterpolation = Interpolation.linear;
  
  private float animateTime;
  
  boolean disabled;
  
  private float max;
  
  private float min;
  
  float position;
  
  private boolean round = true;
  
  private float stepSize;
  
  private ProgressBarStyle style;
  
  private float value;
  
  final boolean vertical;
  
  private Interpolation visualInterpolation = Interpolation.linear;
  
  public ProgressBar(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, ProgressBarStyle paramProgressBarStyle) {
    if (paramFloat1 <= paramFloat2) {
      if (paramFloat3 > 0.0F) {
        setStyle(paramProgressBarStyle);
        this.min = paramFloat1;
        this.max = paramFloat2;
        this.stepSize = paramFloat3;
        this.vertical = paramBoolean;
        this.value = paramFloat1;
        setSize(getPrefWidth(), getPrefHeight());
        return;
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("stepSize must be > 0: ");
      stringBuilder1.append(paramFloat3);
      throw new IllegalArgumentException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("max must be > min. min,max: ");
    stringBuilder.append(paramFloat1);
    stringBuilder.append(", ");
    stringBuilder.append(paramFloat2);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public ProgressBar(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, Skin paramSkin) { this(paramFloat1, paramFloat2, paramFloat3, paramBoolean, (ProgressBarStyle)paramSkin.get(stringBuilder.toString(), ProgressBarStyle.class)); }
  
  public ProgressBar(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, Skin paramSkin, String paramString) { this(paramFloat1, paramFloat2, paramFloat3, paramBoolean, (ProgressBarStyle)paramSkin.get(paramString, ProgressBarStyle.class)); }
  
  public void act(float paramFloat) {
    super.act(paramFloat);
    float f = this.animateTime;
    if (f > 0.0F) {
      this.animateTime = f - paramFloat;
      Stage stage = getStage();
      if (stage != null && stage.getActionsRequestRendering())
        Gdx.graphics.requestRendering(); 
    } 
  }
  
  protected float clamp(float paramFloat) { return MathUtils.clamp(paramFloat, this.min, this.max); }
  
  public void draw(Batch paramBatch, float paramFloat) {
    float f6;
    float f5;
    Drawable drawable4;
    Drawable drawable3;
    Drawable drawable1 = this.style;
    boolean bool = this.disabled;
    Drawable drawable2 = getKnobDrawable();
    if (bool && drawable1.disabledBackground != null) {
      drawable3 = drawable1.disabledBackground;
    } else {
      drawable3 = drawable1.background;
    } 
    if (bool && drawable1.disabledKnobBefore != null) {
      drawable4 = drawable1.disabledKnobBefore;
    } else {
      drawable4 = drawable1.knobBefore;
    } 
    if (bool && drawable1.disabledKnobAfter != null) {
      drawable1 = drawable1.disabledKnobAfter;
    } else {
      drawable1 = drawable1.knobAfter;
    } 
    Color color = getColor();
    float f1 = getX();
    float f2 = getY();
    float f3 = getWidth();
    float f4 = getHeight();
    if (drawable2 == null) {
      f5 = 0.0F;
    } else {
      f5 = drawable2.getMinHeight();
    } 
    if (drawable2 == null) {
      f6 = 0.0F;
    } else {
      f6 = drawable2.getMinWidth();
    } 
    float f7 = getVisualPercent();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    if (this.vertical) {
      float f10;
      float f9;
      float f8;
      if (drawable3 != null) {
        if (this.round) {
          drawable3.draw(paramBatch, Math.round((f3 - drawable3.getMinWidth()) * 0.5F + f1), f2, Math.round(drawable3.getMinWidth()), f4);
        } else {
          drawable3.draw(paramBatch, f1 + f3 - drawable3.getMinWidth() * 0.5F, f2, drawable3.getMinWidth(), f4);
        } 
        f8 = drawable3.getTopHeight();
        f9 = drawable3.getBottomHeight();
        f10 = f4 - f8 + f9;
      } else {
        f10 = f4;
        f9 = 0.0F;
        f8 = 0.0F;
      } 
      if (drawable2 == null) {
        if (drawable4 == null) {
          paramFloat = 0.0F;
        } else {
          paramFloat = drawable4.getMinHeight() * 0.5F;
        } 
        f10 -= paramFloat;
        this.position = f10 * f7;
        this.position = Math.min(f10, this.position);
      } else {
        paramFloat = f5 * 0.5F;
        f10 -= f5;
        this.position = f10 * f7;
        this.position = Math.min(f10, this.position) + f9;
      } 
      this.position = Math.max(Math.min(0.0F, f9), this.position);
      if (drawable4 != null)
        if (this.round) {
          drawable4.draw(paramBatch, Math.round((f3 - drawable4.getMinWidth()) * 0.5F + f1), Math.round(f8 + f2), Math.round(drawable4.getMinWidth()), Math.round(this.position + paramFloat));
        } else {
          drawable4.draw(paramBatch, f1 + (f3 - drawable4.getMinWidth()) * 0.5F, f2 + f8, drawable4.getMinWidth(), this.position + paramFloat);
        }  
      if (drawable1 != null)
        if (this.round) {
          drawable1.draw(paramBatch, Math.round((f3 - drawable1.getMinWidth()) * 0.5F + f1), Math.round(this.position + f2 + paramFloat), Math.round(drawable1.getMinWidth()), Math.round(f4 - this.position - paramFloat));
        } else {
          drawable1.draw(paramBatch, f1 + (f3 - drawable1.getMinWidth()) * 0.5F, this.position + f2 + paramFloat, drawable1.getMinWidth(), f4 - this.position - paramFloat);
        }  
      if (drawable2 != null)
        if (this.round) {
          drawable2.draw(paramBatch, Math.round(f1 + (f3 - f6) * 0.5F), Math.round(f2 + this.position), Math.round(f6), Math.round(f5));
        } else {
          drawable2.draw(paramBatch, f1 + (f3 - f6) * 0.5F, f2 + this.position, f6, f5);
        }  
    } else {
      float f9;
      float f8;
      if (drawable3 != null) {
        if (this.round) {
          drawable3.draw(paramBatch, f1, Math.round((f4 - drawable3.getMinHeight()) * 0.5F + f2), f3, Math.round(drawable3.getMinHeight()));
        } else {
          drawable3.draw(paramBatch, f1, f2 + (f4 - drawable3.getMinHeight()) * 0.5F, f3, drawable3.getMinHeight());
        } 
        f8 = drawable3.getLeftWidth();
        f9 = f3 - drawable3.getRightWidth() + f8;
      } else {
        f9 = f3;
        f8 = 0.0F;
      } 
      if (drawable2 == null) {
        if (drawable4 == null) {
          paramFloat = 0.0F;
        } else {
          paramFloat = drawable4.getMinWidth() * 0.5F;
        } 
        f9 -= paramFloat;
        this.position = f9 * f7;
        this.position = Math.min(f9, this.position);
      } else {
        paramFloat = f6 * 0.5F;
        f9 -= f6;
        this.position = f9 * f7;
        this.position = Math.min(f9, this.position) + f8;
      } 
      this.position = Math.max(Math.min(0.0F, f8), this.position);
      if (drawable4 != null)
        if (this.round) {
          drawable4.draw(paramBatch, Math.round(f8 + f1), Math.round((f4 - drawable4.getMinHeight()) * 0.5F + f2), Math.round(this.position + paramFloat), Math.round(drawable4.getMinHeight()));
        } else {
          drawable4.draw(paramBatch, f1 + f8, f2 + (f4 - drawable4.getMinHeight()) * 0.5F, this.position + paramFloat, drawable4.getMinHeight());
        }  
      if (drawable1 != null)
        if (this.round) {
          drawable1.draw(paramBatch, Math.round(this.position + f1 + paramFloat), Math.round((f4 - drawable1.getMinHeight()) * 0.5F + f2), Math.round(f3 - this.position - paramFloat), Math.round(drawable1.getMinHeight()));
        } else {
          drawable1.draw(paramBatch, this.position + f1 + paramFloat, f2 + (f4 - drawable1.getMinHeight()) * 0.5F, f3 - this.position - paramFloat, drawable1.getMinHeight());
        }  
      if (drawable2 != null)
        if (this.round) {
          drawable2.draw(paramBatch, Math.round(f1 + this.position), Math.round(f2 + (f4 - f5) * 0.5F), Math.round(f6), Math.round(f5));
        } else {
          drawable2.draw(paramBatch, f1 + this.position, f2 + (f4 - f5) * 0.5F, f6, f5);
        }  
    } 
  }
  
  protected Drawable getKnobDrawable() {
    Drawable drawable;
    if (this.disabled && this.style.disabledKnob != null) {
      drawable = this.style.disabledKnob;
    } else {
      drawable = this.style.knob;
    } 
    return drawable;
  }
  
  protected float getKnobPosition() { return this.position; }
  
  public float getMaxValue() { return this.max; }
  
  public float getMinValue() { return this.min; }
  
  public float getPercent() {
    float f1 = this.min;
    float f2 = this.max;
    return (f1 == f2) ? 0.0F : ((this.value - f1) / (f2 - f1));
  }
  
  public float getPrefHeight() {
    float f2;
    Drawable drawable2;
    if (this.vertical)
      return 140.0F; 
    Drawable drawable1 = getKnobDrawable();
    if (this.disabled && this.style.disabledBackground != null) {
      drawable2 = this.style.disabledBackground;
    } else {
      drawable2 = this.style.background;
    } 
    float f1 = 0.0F;
    if (drawable1 == null) {
      f2 = 0.0F;
    } else {
      f2 = drawable1.getMinHeight();
    } 
    if (drawable2 != null)
      f1 = drawable2.getMinHeight(); 
    return Math.max(f2, f1);
  }
  
  public float getPrefWidth() {
    if (this.vertical) {
      float f2;
      Drawable drawable2;
      Drawable drawable1 = getKnobDrawable();
      if (this.disabled && this.style.disabledBackground != null) {
        drawable2 = this.style.disabledBackground;
      } else {
        drawable2 = this.style.background;
      } 
      float f1 = 0.0F;
      if (drawable1 == null) {
        f2 = 0.0F;
      } else {
        f2 = drawable1.getMinWidth();
      } 
      if (drawable2 != null)
        f1 = drawable2.getMinWidth(); 
      return Math.max(f2, f1);
    } 
    return 140.0F;
  }
  
  public float getStepSize() { return this.stepSize; }
  
  public ProgressBarStyle getStyle() { return this.style; }
  
  public float getValue() { return this.value; }
  
  public float getVisualPercent() {
    if (this.min == this.max)
      return 0.0F; 
    Interpolation interpolation = this.visualInterpolation;
    float f1 = getVisualValue();
    float f2 = this.min;
    return interpolation.apply((f1 - f2) / (this.max - f2));
  }
  
  public float getVisualValue() {
    float f = this.animateTime;
    return (f > 0.0F) ? this.animateInterpolation.apply(this.animateFromValue, this.value, 1.0F - f / this.animateDuration) : this.value;
  }
  
  public boolean isDisabled() { return this.disabled; }
  
  public boolean isVertical() { return this.vertical; }
  
  public void setAnimateDuration(float paramFloat) { this.animateDuration = paramFloat; }
  
  public void setAnimateInterpolation(Interpolation paramInterpolation) {
    if (paramInterpolation != null) {
      this.animateInterpolation = paramInterpolation;
      return;
    } 
    throw new IllegalArgumentException("animateInterpolation cannot be null.");
  }
  
  public void setDisabled(boolean paramBoolean) { this.disabled = paramBoolean; }
  
  public void setRange(float paramFloat1, float paramFloat2) {
    if (paramFloat1 <= paramFloat2) {
      this.min = paramFloat1;
      this.max = paramFloat2;
      float f = this.value;
      if (f < paramFloat1) {
        setValue(paramFloat1);
      } else if (f > paramFloat2) {
        setValue(paramFloat2);
      } 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("min must be <= max: ");
    stringBuilder.append(paramFloat1);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramFloat2);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void setRound(boolean paramBoolean) { this.round = paramBoolean; }
  
  public void setStepSize(float paramFloat) {
    if (paramFloat > 0.0F) {
      this.stepSize = paramFloat;
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("steps must be > 0: ");
    stringBuilder.append(paramFloat);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void setStyle(ProgressBarStyle paramProgressBarStyle) {
    if (paramProgressBarStyle != null) {
      this.style = paramProgressBarStyle;
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public boolean setValue(float paramFloat) {
    float f1 = clamp(Math.round(paramFloat / this.stepSize) * this.stepSize);
    float f2 = this.value;
    if (f1 == f2)
      return false; 
    paramFloat = getVisualValue();
    this.value = f1;
    ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent)Pools.obtain(ChangeListener.ChangeEvent.class);
    boolean bool = fire(changeEvent);
    if (bool) {
      this.value = f2;
    } else {
      f2 = this.animateDuration;
      if (f2 > 0.0F) {
        this.animateFromValue = paramFloat;
        this.animateTime = f2;
      } 
    } 
    Pools.free(changeEvent);
    return bool ^ true;
  }
  
  public void setVisualInterpolation(Interpolation paramInterpolation) { this.visualInterpolation = paramInterpolation; }
  
  public static class ProgressBarStyle {
    public Drawable background;
    
    public Drawable disabledBackground;
    
    public Drawable disabledKnob;
    
    public Drawable disabledKnobAfter;
    
    public Drawable disabledKnobBefore;
    
    public Drawable knob;
    
    public Drawable knobAfter;
    
    public Drawable knobBefore;
    
    public ProgressBarStyle() {}
    
    public ProgressBarStyle(ProgressBarStyle param1ProgressBarStyle) {
      this.background = param1ProgressBarStyle.background;
      this.disabledBackground = param1ProgressBarStyle.disabledBackground;
      this.knob = param1ProgressBarStyle.knob;
      this.disabledKnob = param1ProgressBarStyle.disabledKnob;
      this.knobBefore = param1ProgressBarStyle.knobBefore;
      this.knobAfter = param1ProgressBarStyle.knobAfter;
      this.disabledKnobBefore = param1ProgressBarStyle.disabledKnobBefore;
      this.disabledKnobAfter = param1ProgressBarStyle.disabledKnobAfter;
    }
    
    public ProgressBarStyle(Drawable param1Drawable1, Drawable param1Drawable2) {
      this.background = param1Drawable1;
      this.knob = param1Drawable2;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/ProgressBar.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */