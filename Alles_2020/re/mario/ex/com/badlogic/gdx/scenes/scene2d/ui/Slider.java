package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Pools;

public class Slider extends ProgressBar {
  int draggingPointer = -1;
  
  boolean mouseOver;
  
  private float[] snapValues;
  
  private float threshold;
  
  private Interpolation visualInterpolationInverse = Interpolation.linear;
  
  public Slider(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, Skin paramSkin) { this(paramFloat1, paramFloat2, paramFloat3, paramBoolean, (SliderStyle)paramSkin.get(stringBuilder.toString(), SliderStyle.class)); }
  
  public Slider(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, Skin paramSkin, String paramString) { this(paramFloat1, paramFloat2, paramFloat3, paramBoolean, (SliderStyle)paramSkin.get(paramString, SliderStyle.class)); }
  
  public Slider(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, SliderStyle paramSliderStyle) {
    super(paramFloat1, paramFloat2, paramFloat3, paramBoolean, paramSliderStyle);
    addListener(new InputListener() {
          public void enter(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, Actor param1Actor) {
            if (param1Int == -1)
              Slider.this.mouseOver = true; 
          }
          
          public void exit(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, Actor param1Actor) {
            if (param1Int == -1)
              Slider.this.mouseOver = false; 
          }
          
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            if (Slider.this.disabled)
              return false; 
            if (Slider.this.draggingPointer != -1)
              return false; 
            Slider slider = Slider.this;
            slider.draggingPointer = param1Int1;
            slider.calculatePositionAndValue(param1Float1, param1Float2);
            return true;
          }
          
          public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) { Slider.this.calculatePositionAndValue(param1Float1, param1Float2); }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            if (param1Int1 != Slider.this.draggingPointer)
              return; 
            Slider.this.draggingPointer = -1;
            if (param1InputEvent.isTouchFocusCancel() || !Slider.this.calculatePositionAndValue(param1Float1, param1Float2)) {
              ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent)Pools.obtain(ChangeListener.ChangeEvent.class);
              Slider.this.fire(changeEvent);
              Pools.free(changeEvent);
            } 
          }
        });
  }
  
  boolean calculatePositionAndValue(float paramFloat1, float paramFloat2) {
    Drawable drawable = getStyle();
    Interpolation interpolation = getKnobDrawable();
    if (this.disabled && drawable.disabledBackground != null) {
      drawable = drawable.disabledBackground;
    } else {
      drawable = drawable.background;
    } 
    float f1 = this.position;
    float f2 = getMinValue();
    float f3 = getMaxValue();
    if (this.vertical) {
      float f4 = getHeight();
      float f5 = drawable.getTopHeight();
      float f6 = drawable.getBottomHeight();
      if (interpolation == null) {
        paramFloat1 = 0.0F;
      } else {
        paramFloat1 = interpolation.getMinHeight();
      } 
      this.position = paramFloat2 - drawable.getBottomHeight() - 0.5F * paramFloat1;
      interpolation = this.visualInterpolationInverse;
      paramFloat2 = this.position;
      f4 = f4 - f5 - f6 - paramFloat1;
      paramFloat1 = f2 + (f3 - f2) * interpolation.apply(paramFloat2 / f4);
      this.position = Math.max(Math.min(0.0F, drawable.getBottomHeight()), this.position);
      this.position = Math.min(f4, this.position);
    } else {
      float f4 = getWidth();
      float f5 = drawable.getLeftWidth();
      float f6 = drawable.getRightWidth();
      if (interpolation == null) {
        paramFloat2 = 0.0F;
      } else {
        paramFloat2 = interpolation.getMinWidth();
      } 
      this.position = paramFloat1 - drawable.getLeftWidth() - 0.5F * paramFloat2;
      interpolation = this.visualInterpolationInverse;
      paramFloat1 = this.position;
      paramFloat2 = f4 - f5 - f6 - paramFloat2;
      paramFloat1 = f2 + (f3 - f2) * interpolation.apply(paramFloat1 / paramFloat2);
      this.position = Math.max(Math.min(0.0F, drawable.getLeftWidth()), this.position);
      this.position = Math.min(paramFloat2, this.position);
    } 
    if (!Gdx.input.isKeyPressed(59) && !Gdx.input.isKeyPressed(60)) {
      paramFloat2 = snap(paramFloat1);
    } else {
      paramFloat2 = paramFloat1;
    } 
    boolean bool = setValue(paramFloat2);
    if (paramFloat2 == paramFloat1)
      this.position = f1; 
    return bool;
  }
  
  protected Drawable getKnobDrawable() {
    Drawable drawable = getStyle();
    if (this.disabled && drawable.disabledKnob != null) {
      drawable = drawable.disabledKnob;
    } else if (isDragging() && drawable.knobDown != null) {
      drawable = drawable.knobDown;
    } else if (this.mouseOver && drawable.knobOver != null) {
      drawable = drawable.knobOver;
    } else {
      drawable = drawable.knob;
    } 
    return drawable;
  }
  
  public SliderStyle getStyle() { return (SliderStyle)super.getStyle(); }
  
  public boolean isDragging() {
    boolean bool;
    if (this.draggingPointer != -1) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void setSnapToValues(float[] paramArrayOfFloat, float paramFloat) {
    this.snapValues = paramArrayOfFloat;
    this.threshold = paramFloat;
  }
  
  public void setStyle(SliderStyle paramSliderStyle) {
    if (paramSliderStyle != null) {
      if (paramSliderStyle instanceof SliderStyle) {
        setStyle(paramSliderStyle);
        return;
      } 
      throw new IllegalArgumentException("style must be a SliderStyle.");
    } 
    throw new NullPointerException("style cannot be null");
  }
  
  public void setVisualInterpolationInverse(Interpolation paramInterpolation) { this.visualInterpolationInverse = paramInterpolation; }
  
  protected float snap(float paramFloat) { // Byte code:
    //   0: aload_0
    //   1: getfield snapValues : [F
    //   4: astore_2
    //   5: fload_1
    //   6: fstore_3
    //   7: aload_2
    //   8: ifnull -> 131
    //   11: aload_2
    //   12: arraylength
    //   13: ifne -> 21
    //   16: fload_1
    //   17: fstore_3
    //   18: goto -> 131
    //   21: iconst_0
    //   22: istore #4
    //   24: ldc -1.0
    //   26: fstore #5
    //   28: fconst_0
    //   29: fstore_3
    //   30: aload_0
    //   31: getfield snapValues : [F
    //   34: astore_2
    //   35: iload #4
    //   37: aload_2
    //   38: arraylength
    //   39: if_icmpge -> 118
    //   42: aload_2
    //   43: iload #4
    //   45: faload
    //   46: fstore #6
    //   48: fload_1
    //   49: fload #6
    //   51: fsub
    //   52: invokestatic abs : (F)F
    //   55: fstore #7
    //   57: fload #5
    //   59: fstore #8
    //   61: fload_3
    //   62: fstore #9
    //   64: fload #7
    //   66: aload_0
    //   67: getfield threshold : F
    //   70: fcmpg
    //   71: ifgt -> 105
    //   74: fload #5
    //   76: ldc -1.0
    //   78: fcmpl
    //   79: ifeq -> 97
    //   82: fload #5
    //   84: fstore #8
    //   86: fload_3
    //   87: fstore #9
    //   89: fload #7
    //   91: fload #5
    //   93: fcmpg
    //   94: ifge -> 105
    //   97: fload #6
    //   99: fstore #9
    //   101: fload #7
    //   103: fstore #8
    //   105: iinc #4, 1
    //   108: fload #8
    //   110: fstore #5
    //   112: fload #9
    //   114: fstore_3
    //   115: goto -> 30
    //   118: fload #5
    //   120: ldc -1.0
    //   122: fcmpl
    //   123: ifne -> 131
    //   126: fload_1
    //   127: fstore_3
    //   128: goto -> 131
    //   131: fload_3
    //   132: freturn }
  
  public static class SliderStyle extends ProgressBar.ProgressBarStyle {
    public Drawable knobDown;
    
    public Drawable knobOver;
    
    public SliderStyle() {}
    
    public SliderStyle(SliderStyle param1SliderStyle) {
      super(param1SliderStyle);
      this.knobOver = param1SliderStyle.knobOver;
      this.knobDown = param1SliderStyle.knobDown;
    }
    
    public SliderStyle(Drawable param1Drawable1, Drawable param1Drawable2) { super(param1Drawable1, param1Drawable2); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Slider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */