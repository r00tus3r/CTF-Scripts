package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class Container<T extends Actor> extends WidgetGroup {
  private T actor;
  
  private int align;
  
  private Drawable background;
  
  private boolean clip;
  
  private float fillX;
  
  private float fillY;
  
  private Value maxHeight = Value.zero;
  
  private Value maxWidth = Value.zero;
  
  private Value minHeight = Value.minHeight;
  
  private Value minWidth = Value.minWidth;
  
  private Value padBottom = Value.zero;
  
  private Value padLeft = Value.zero;
  
  private Value padRight = Value.zero;
  
  private Value padTop = Value.zero;
  
  private Value prefHeight = Value.prefHeight;
  
  private Value prefWidth = Value.prefWidth;
  
  private boolean round = true;
  
  public Container() {
    setTouchable(Touchable.childrenOnly);
    setTransform(false);
  }
  
  public Container(T paramT) {
    this();
    setActor(paramT);
  }
  
  public void addActor(Actor paramActor) { throw new UnsupportedOperationException("Use Container#setActor."); }
  
  public void addActorAfter(Actor paramActor1, Actor paramActor2) { throw new UnsupportedOperationException("Use Container#setActor."); }
  
  public void addActorAt(int paramInt, Actor paramActor) { throw new UnsupportedOperationException("Use Container#setActor."); }
  
  public void addActorBefore(Actor paramActor1, Actor paramActor2) { throw new UnsupportedOperationException("Use Container#setActor."); }
  
  public Container<T> align(int paramInt) {
    this.align = paramInt;
    return this;
  }
  
  public Container<T> background(Drawable paramDrawable) {
    setBackground(paramDrawable);
    return this;
  }
  
  public Container<T> bottom() {
    this.align |= 0x4;
    this.align &= 0xFFFFFFFD;
    return this;
  }
  
  public Container<T> center() {
    this.align = 1;
    return this;
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    validate();
    if (isTransform()) {
      applyTransform(paramBatch, computeTransform());
      drawBackground(paramBatch, paramFloat, 0.0F, 0.0F);
      if (this.clip) {
        paramBatch.flush();
        float f1 = this.padLeft.get(this);
        float f2 = this.padBottom.get(this);
        if (clipBegin(f1, f2, getWidth() - f1 - this.padRight.get(this), getHeight() - f2 - this.padTop.get(this))) {
          drawChildren(paramBatch, paramFloat);
          paramBatch.flush();
          clipEnd();
        } 
      } else {
        drawChildren(paramBatch, paramFloat);
      } 
      resetTransform(paramBatch);
    } else {
      drawBackground(paramBatch, paramFloat, getX(), getY());
      super.draw(paramBatch, paramFloat);
    } 
  }
  
  protected void drawBackground(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3) {
    if (this.background == null)
      return; 
    Color color = getColor();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat1);
    this.background.draw(paramBatch, paramFloat2, paramFloat3, getWidth(), getHeight());
  }
  
  public void drawDebug(ShapeRenderer paramShapeRenderer) {
    validate();
    if (isTransform()) {
      applyTransform(paramShapeRenderer, computeTransform());
      if (this.clip) {
        boolean bool;
        paramShapeRenderer.flush();
        float f1 = this.padLeft.get(this);
        float f2 = this.padBottom.get(this);
        if (this.background == null) {
          bool = clipBegin(0.0F, 0.0F, getWidth(), getHeight());
        } else {
          bool = clipBegin(f1, f2, getWidth() - f1 - this.padRight.get(this), getHeight() - f2 - this.padTop.get(this));
        } 
        if (bool) {
          drawDebugChildren(paramShapeRenderer);
          clipEnd();
        } 
      } else {
        drawDebugChildren(paramShapeRenderer);
      } 
      resetTransform(paramShapeRenderer);
    } else {
      super.drawDebug(paramShapeRenderer);
    } 
  }
  
  public Container<T> fill() {
    this.fillX = 1.0F;
    this.fillY = 1.0F;
    return this;
  }
  
  public Container<T> fill(float paramFloat1, float paramFloat2) {
    this.fillX = paramFloat1;
    this.fillY = paramFloat2;
    return this;
  }
  
  public Container<T> fill(boolean paramBoolean) {
    float f2;
    float f1 = 1.0F;
    if (paramBoolean) {
      f2 = 1.0F;
    } else {
      f2 = 0.0F;
    } 
    this.fillX = f2;
    if (paramBoolean) {
      f2 = f1;
    } else {
      f2 = 0.0F;
    } 
    this.fillY = f2;
    return this;
  }
  
  public Container<T> fill(boolean paramBoolean1, boolean paramBoolean2) {
    float f2;
    float f1 = 1.0F;
    if (paramBoolean1) {
      f2 = 1.0F;
    } else {
      f2 = 0.0F;
    } 
    this.fillX = f2;
    if (paramBoolean2) {
      f2 = f1;
    } else {
      f2 = 0.0F;
    } 
    this.fillY = f2;
    return this;
  }
  
  public Container<T> fillX() {
    this.fillX = 1.0F;
    return this;
  }
  
  public Container<T> fillY() {
    this.fillY = 1.0F;
    return this;
  }
  
  public T getActor() { return (T)this.actor; }
  
  public int getAlign() { return this.align; }
  
  public Drawable getBackground() { return this.background; }
  
  public boolean getClip() { return this.clip; }
  
  public float getFillX() { return this.fillX; }
  
  public float getFillY() { return this.fillY; }
  
  public float getMaxHeight() {
    float f1 = this.maxHeight.get(this.actor);
    float f2 = f1;
    if (f1 > 0.0F)
      f2 = f1 + this.padTop.get(this) + this.padBottom.get(this); 
    return f2;
  }
  
  public Value getMaxHeightValue() { return this.maxHeight; }
  
  public float getMaxWidth() {
    float f1 = this.maxWidth.get(this.actor);
    float f2 = f1;
    if (f1 > 0.0F)
      f2 = f1 + this.padLeft.get(this) + this.padRight.get(this); 
    return f2;
  }
  
  public Value getMaxWidthValue() { return this.maxWidth; }
  
  public float getMinHeight() { return this.minHeight.get(this.actor) + this.padTop.get(this) + this.padBottom.get(this); }
  
  public Value getMinHeightValue() { return this.minHeight; }
  
  public float getMinWidth() { return this.minWidth.get(this.actor) + this.padLeft.get(this) + this.padRight.get(this); }
  
  public float getPadBottom() { return this.padBottom.get(this); }
  
  public Value getPadBottomValue() { return this.padBottom; }
  
  public float getPadLeft() { return this.padLeft.get(this); }
  
  public Value getPadLeftValue() { return this.padLeft; }
  
  public float getPadRight() { return this.padRight.get(this); }
  
  public Value getPadRightValue() { return this.padRight; }
  
  public float getPadTop() { return this.padTop.get(this); }
  
  public Value getPadTopValue() { return this.padTop; }
  
  public float getPadX() { return this.padLeft.get(this) + this.padRight.get(this); }
  
  public float getPadY() { return this.padTop.get(this) + this.padBottom.get(this); }
  
  public float getPrefHeight() {
    float f1 = this.prefHeight.get(this.actor);
    Drawable drawable = this.background;
    float f2 = f1;
    if (drawable != null)
      f2 = Math.max(f1, drawable.getMinHeight()); 
    return Math.max(getMinHeight(), f2 + this.padTop.get(this) + this.padBottom.get(this));
  }
  
  public Value getPrefHeightValue() { return this.prefHeight; }
  
  public float getPrefWidth() {
    float f1 = this.prefWidth.get(this.actor);
    Drawable drawable = this.background;
    float f2 = f1;
    if (drawable != null)
      f2 = Math.max(f1, drawable.getMinWidth()); 
    return Math.max(getMinWidth(), f2 + this.padLeft.get(this) + this.padRight.get(this));
  }
  
  public Value getPrefWidthValue() { return this.prefWidth; }
  
  public Container<T> height(float paramFloat) {
    height(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Container<T> height(Value paramValue) {
    if (paramValue != null) {
      this.minHeight = paramValue;
      this.prefHeight = paramValue;
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("height cannot be null.");
  }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    if (this.clip) {
      if (paramBoolean && getTouchable() == Touchable.disabled)
        return null; 
      if (paramFloat1 < 0.0F || paramFloat1 >= getWidth() || paramFloat2 < 0.0F || paramFloat2 >= getHeight())
        return null; 
    } 
    return super.hit(paramFloat1, paramFloat2, paramBoolean);
  }
  
  public void layout() { // Byte code:
    //   0: aload_0
    //   1: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   4: ifnonnull -> 8
    //   7: return
    //   8: aload_0
    //   9: getfield padLeft : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   12: aload_0
    //   13: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   16: fstore_1
    //   17: aload_0
    //   18: getfield padBottom : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   21: aload_0
    //   22: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   25: fstore_2
    //   26: aload_0
    //   27: invokevirtual getWidth : ()F
    //   30: fload_1
    //   31: fsub
    //   32: aload_0
    //   33: getfield padRight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   36: aload_0
    //   37: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   40: fsub
    //   41: fstore_3
    //   42: aload_0
    //   43: invokevirtual getHeight : ()F
    //   46: fload_2
    //   47: fsub
    //   48: aload_0
    //   49: getfield padTop : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   52: aload_0
    //   53: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   56: fsub
    //   57: fstore #4
    //   59: aload_0
    //   60: getfield minWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   63: aload_0
    //   64: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   67: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   70: fstore #5
    //   72: aload_0
    //   73: getfield minHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   76: aload_0
    //   77: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   80: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   83: fstore #6
    //   85: aload_0
    //   86: getfield prefWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   89: aload_0
    //   90: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   93: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   96: fstore #7
    //   98: aload_0
    //   99: getfield prefHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   102: aload_0
    //   103: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   106: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   109: fstore #8
    //   111: aload_0
    //   112: getfield maxWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   115: aload_0
    //   116: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   119: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   122: fstore #9
    //   124: aload_0
    //   125: getfield maxHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   128: aload_0
    //   129: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   132: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   135: fstore #10
    //   137: aload_0
    //   138: getfield fillX : F
    //   141: fstore #11
    //   143: fload #11
    //   145: fconst_0
    //   146: fcmpl
    //   147: ifle -> 159
    //   150: fload #11
    //   152: fload_3
    //   153: fmul
    //   154: fstore #7
    //   156: goto -> 167
    //   159: fload #7
    //   161: fload_3
    //   162: invokestatic min : (FF)F
    //   165: fstore #7
    //   167: fload #7
    //   169: fload #5
    //   171: fcmpg
    //   172: ifge -> 178
    //   175: goto -> 182
    //   178: fload #7
    //   180: fstore #5
    //   182: fload #5
    //   184: fstore #7
    //   186: fload #9
    //   188: fconst_0
    //   189: fcmpl
    //   190: ifle -> 209
    //   193: fload #5
    //   195: fstore #7
    //   197: fload #5
    //   199: fload #9
    //   201: fcmpl
    //   202: ifle -> 209
    //   205: fload #9
    //   207: fstore #7
    //   209: aload_0
    //   210: getfield fillY : F
    //   213: fstore #5
    //   215: fload #5
    //   217: fconst_0
    //   218: fcmpl
    //   219: ifle -> 232
    //   222: fload #5
    //   224: fload #4
    //   226: fmul
    //   227: fstore #5
    //   229: goto -> 241
    //   232: fload #8
    //   234: fload #4
    //   236: invokestatic min : (FF)F
    //   239: fstore #5
    //   241: fload #5
    //   243: fload #6
    //   245: fcmpg
    //   246: ifge -> 252
    //   249: goto -> 256
    //   252: fload #5
    //   254: fstore #6
    //   256: fload #6
    //   258: fstore #5
    //   260: fload #10
    //   262: fconst_0
    //   263: fcmpl
    //   264: ifle -> 283
    //   267: fload #6
    //   269: fstore #5
    //   271: fload #6
    //   273: fload #10
    //   275: fcmpl
    //   276: ifle -> 283
    //   279: fload #10
    //   281: fstore #5
    //   283: aload_0
    //   284: getfield align : I
    //   287: istore #12
    //   289: iload #12
    //   291: bipush #16
    //   293: iand
    //   294: ifeq -> 312
    //   297: fload_3
    //   298: fload #7
    //   300: fsub
    //   301: fstore #6
    //   303: fload_1
    //   304: fload #6
    //   306: fadd
    //   307: fstore #6
    //   309: goto -> 334
    //   312: fload_1
    //   313: fstore #6
    //   315: iload #12
    //   317: bipush #8
    //   319: iand
    //   320: ifne -> 334
    //   323: fload_3
    //   324: fload #7
    //   326: fsub
    //   327: fconst_2
    //   328: fdiv
    //   329: fstore #6
    //   331: goto -> 303
    //   334: aload_0
    //   335: getfield align : I
    //   338: istore #12
    //   340: iload #12
    //   342: iconst_2
    //   343: iand
    //   344: ifeq -> 360
    //   347: fload #4
    //   349: fload #5
    //   351: fsub
    //   352: fstore_1
    //   353: fload_2
    //   354: fload_1
    //   355: fadd
    //   356: fstore_1
    //   357: goto -> 380
    //   360: fload_2
    //   361: fstore_1
    //   362: iload #12
    //   364: iconst_4
    //   365: iand
    //   366: ifne -> 380
    //   369: fload #4
    //   371: fload #5
    //   373: fsub
    //   374: fconst_2
    //   375: fdiv
    //   376: fstore_1
    //   377: goto -> 353
    //   380: fload #6
    //   382: fstore #4
    //   384: fload_1
    //   385: fstore #9
    //   387: fload #7
    //   389: fstore #10
    //   391: fload #5
    //   393: fstore_2
    //   394: aload_0
    //   395: getfield round : Z
    //   398: ifeq -> 431
    //   401: fload #6
    //   403: invokestatic round : (F)I
    //   406: i2f
    //   407: fstore #4
    //   409: fload_1
    //   410: invokestatic round : (F)I
    //   413: i2f
    //   414: fstore #9
    //   416: fload #7
    //   418: invokestatic round : (F)I
    //   421: i2f
    //   422: fstore #10
    //   424: fload #5
    //   426: invokestatic round : (F)I
    //   429: i2f
    //   430: fstore_2
    //   431: aload_0
    //   432: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   435: fload #4
    //   437: fload #9
    //   439: fload #10
    //   441: fload_2
    //   442: invokevirtual setBounds : (FFFF)V
    //   445: aload_0
    //   446: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   449: astore #13
    //   451: aload #13
    //   453: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   456: ifeq -> 469
    //   459: aload #13
    //   461: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   464: invokeinterface validate : ()V
    //   469: return }
  
  public Container<T> left() {
    this.align |= 0x8;
    this.align &= 0xFFFFFFEF;
    return this;
  }
  
  public Container<T> maxHeight(float paramFloat) {
    this.maxHeight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> maxHeight(Value paramValue) {
    if (paramValue != null) {
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("maxHeight cannot be null.");
  }
  
  public Container<T> maxSize(float paramFloat) {
    maxSize(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Container<T> maxSize(float paramFloat1, float paramFloat2) {
    maxSize(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Container<T> maxSize(Value paramValue) {
    if (paramValue != null) {
      this.maxWidth = paramValue;
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Container<T> maxSize(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.maxWidth = paramValue1;
        this.maxHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Container<T> maxWidth(float paramFloat) {
    this.maxWidth = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> maxWidth(Value paramValue) {
    if (paramValue != null) {
      this.maxWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("maxWidth cannot be null.");
  }
  
  public Container<T> minHeight(float paramFloat) {
    this.minHeight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> minHeight(Value paramValue) {
    if (paramValue != null) {
      this.minHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("minHeight cannot be null.");
  }
  
  public Container<T> minSize(float paramFloat) {
    minSize(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Container<T> minSize(float paramFloat1, float paramFloat2) {
    minSize(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Container<T> minSize(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      this.minHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Container<T> minSize(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.minWidth = paramValue1;
        this.minHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Container<T> minWidth(float paramFloat) {
    this.minWidth = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> minWidth(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("minWidth cannot be null.");
  }
  
  public Container<T> pad(float paramFloat) {
    Value.Fixed fixed = Value.Fixed.valueOf(paramFloat);
    this.padTop = fixed;
    this.padLeft = fixed;
    this.padBottom = fixed;
    this.padRight = fixed;
    return this;
  }
  
  public Container<T> pad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.padTop = Value.Fixed.valueOf(paramFloat1);
    this.padLeft = Value.Fixed.valueOf(paramFloat2);
    this.padBottom = Value.Fixed.valueOf(paramFloat3);
    this.padRight = Value.Fixed.valueOf(paramFloat4);
    return this;
  }
  
  public Container<T> pad(Value paramValue) {
    if (paramValue != null) {
      this.padTop = paramValue;
      this.padLeft = paramValue;
      this.padBottom = paramValue;
      this.padRight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("pad cannot be null.");
  }
  
  public Container<T> pad(Value paramValue1, Value paramValue2, Value paramValue3, Value paramValue4) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        if (paramValue3 != null) {
          if (paramValue4 != null) {
            this.padTop = paramValue1;
            this.padLeft = paramValue2;
            this.padBottom = paramValue3;
            this.padRight = paramValue4;
            return this;
          } 
          throw new IllegalArgumentException("right cannot be null.");
        } 
        throw new IllegalArgumentException("bottom cannot be null.");
      } 
      throw new IllegalArgumentException("left cannot be null.");
    } 
    throw new IllegalArgumentException("top cannot be null.");
  }
  
  public Container<T> padBottom(float paramFloat) {
    this.padBottom = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> padBottom(Value paramValue) {
    if (paramValue != null) {
      this.padBottom = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padBottom cannot be null.");
  }
  
  public Container<T> padLeft(float paramFloat) {
    this.padLeft = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> padLeft(Value paramValue) {
    if (paramValue != null) {
      this.padLeft = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padLeft cannot be null.");
  }
  
  public Container<T> padRight(float paramFloat) {
    this.padRight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> padRight(Value paramValue) {
    if (paramValue != null) {
      this.padRight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padRight cannot be null.");
  }
  
  public Container<T> padTop(float paramFloat) {
    this.padTop = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> padTop(Value paramValue) {
    if (paramValue != null) {
      this.padTop = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padTop cannot be null.");
  }
  
  public Container<T> prefHeight(float paramFloat) {
    this.prefHeight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> prefHeight(Value paramValue) {
    if (paramValue != null) {
      this.prefHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("prefHeight cannot be null.");
  }
  
  public Container<T> prefSize(float paramFloat) {
    prefSize(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Container<T> prefSize(float paramFloat1, float paramFloat2) {
    prefSize(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Container<T> prefSize(Value paramValue) {
    if (paramValue != null) {
      this.prefWidth = paramValue;
      this.prefHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Container<T> prefSize(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.prefWidth = paramValue1;
        this.prefHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Container<T> prefWidth(float paramFloat) {
    this.prefWidth = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Container<T> prefWidth(Value paramValue) {
    if (paramValue != null) {
      this.prefWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("prefWidth cannot be null.");
  }
  
  public boolean removeActor(Actor paramActor) {
    if (paramActor != null) {
      if (paramActor != this.actor)
        return false; 
      setActor(null);
      return true;
    } 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public boolean removeActor(Actor paramActor, boolean paramBoolean) {
    if (paramActor != null) {
      if (paramActor != this.actor)
        return false; 
      this.actor = null;
      return super.removeActor(paramActor, paramBoolean);
    } 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public Container<T> right() {
    this.align |= 0x10;
    this.align &= 0xFFFFFFF7;
    return this;
  }
  
  public void setActor(T paramT) {
    if (paramT != this) {
      Actor actor1 = this.actor;
      if (paramT == actor1)
        return; 
      if (actor1 != null)
        super.removeActor(actor1); 
      this.actor = paramT;
      if (paramT != null)
        super.addActor(paramT); 
      return;
    } 
    throw new IllegalArgumentException("actor cannot be the Container.");
  }
  
  public void setBackground(Drawable paramDrawable) { setBackground(paramDrawable, true); }
  
  public void setBackground(Drawable paramDrawable, boolean paramBoolean) {
    if (this.background == paramDrawable)
      return; 
    this.background = paramDrawable;
    if (paramBoolean) {
      if (paramDrawable == null) {
        pad(Value.zero);
      } else {
        pad(paramDrawable.getTopHeight(), paramDrawable.getLeftWidth(), paramDrawable.getBottomHeight(), paramDrawable.getRightWidth());
      } 
      invalidate();
    } 
  }
  
  public void setClip(boolean paramBoolean) {
    this.clip = paramBoolean;
    setTransform(paramBoolean);
    invalidate();
  }
  
  public void setCullingArea(Rectangle paramRectangle) {
    super.setCullingArea(paramRectangle);
    if (this.fillX == 1.0F && this.fillY == 1.0F) {
      Actor actor1 = this.actor;
      if (actor1 instanceof Cullable)
        ((Cullable)actor1).setCullingArea(paramRectangle); 
    } 
  }
  
  public void setRound(boolean paramBoolean) { this.round = paramBoolean; }
  
  public Container<T> size(float paramFloat) {
    size(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Container<T> size(float paramFloat1, float paramFloat2) {
    size(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Container<T> size(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      this.minHeight = paramValue;
      this.prefWidth = paramValue;
      this.prefHeight = paramValue;
      this.maxWidth = paramValue;
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Container<T> size(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.minWidth = paramValue1;
        this.minHeight = paramValue2;
        this.prefWidth = paramValue1;
        this.prefHeight = paramValue2;
        this.maxWidth = paramValue1;
        this.maxHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Container<T> top() {
    this.align |= 0x2;
    this.align &= 0xFFFFFFFB;
    return this;
  }
  
  public Container<T> width(float paramFloat) {
    width(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Container<T> width(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      this.prefWidth = paramValue;
      this.maxWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Container.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */