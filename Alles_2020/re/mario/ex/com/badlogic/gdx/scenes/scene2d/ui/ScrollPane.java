package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;

public class ScrollPane extends WidgetGroup {
  float amountX;
  
  float amountY;
  
  float areaHeight;
  
  float areaWidth;
  
  boolean cancelTouchFocus = true;
  
  private boolean clamp = true;
  
  boolean disableX;
  
  boolean disableY;
  
  int draggingPointer = -1;
  
  float fadeAlpha;
  
  float fadeAlphaSeconds = 1.0F;
  
  float fadeDelay;
  
  float fadeDelaySeconds = 1.0F;
  
  boolean fadeScrollBars = true;
  
  boolean flickScroll = true;
  
  private ActorGestureListener flickScrollListener;
  
  float flingTime = 1.0F;
  
  float flingTimer;
  
  private boolean forceScrollX;
  
  private boolean forceScrollY;
  
  final Rectangle hKnobBounds = new Rectangle();
  
  final Rectangle hScrollBounds = new Rectangle();
  
  boolean hScrollOnBottom = true;
  
  final Vector2 lastPoint = new Vector2();
  
  float maxX;
  
  float maxY;
  
  private float overscrollDistance = 50.0F;
  
  private float overscrollSpeedMax = 200.0F;
  
  private float overscrollSpeedMin = 30.0F;
  
  private boolean overscrollX = true;
  
  private boolean overscrollY = true;
  
  boolean scrollBarTouch = true;
  
  boolean scrollX;
  
  boolean scrollY;
  
  private boolean scrollbarsOnTop;
  
  boolean smoothScrolling = true;
  
  private ScrollPaneStyle style;
  
  boolean touchScrollH;
  
  boolean touchScrollV;
  
  final Rectangle vKnobBounds = new Rectangle();
  
  final Rectangle vScrollBounds = new Rectangle();
  
  boolean vScrollOnRight = true;
  
  private boolean variableSizeKnobs = true;
  
  float velocityX;
  
  float velocityY;
  
  float visualAmountX;
  
  float visualAmountY;
  
  private Actor widget;
  
  private final Rectangle widgetAreaBounds = new Rectangle();
  
  private final Rectangle widgetCullingArea = new Rectangle();
  
  public ScrollPane(Actor paramActor) { this(paramActor, new ScrollPaneStyle()); }
  
  public ScrollPane(Actor paramActor, ScrollPaneStyle paramScrollPaneStyle) {
    if (paramScrollPaneStyle != null) {
      this.style = paramScrollPaneStyle;
      setActor(paramActor);
      setSize(150.0F, 150.0F);
      addCaptureListener(new InputListener() {
            private float handlePosition;
            
            public boolean mouseMoved(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
              if (!ScrollPane.this.flickScroll)
                ScrollPane.this.setScrollbarsVisible(true); 
              return false;
            }
            
            public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
              ScrollPane scrollPane;
              int i = ScrollPane.this.draggingPointer;
              byte b = -1;
              if (i != -1)
                return false; 
              if (param1Int1 == 0 && param1Int2 != 0)
                return false; 
              if (ScrollPane.this.getStage() != null)
                ScrollPane.this.getStage().setScrollFocus(ScrollPane.this); 
              if (!ScrollPane.this.flickScroll)
                ScrollPane.this.setScrollbarsVisible(true); 
              if (ScrollPane.this.fadeAlpha == 0.0F)
                return false; 
              if (ScrollPane.this.scrollBarTouch && ScrollPane.this.scrollX && ScrollPane.this.hScrollBounds.contains(param1Float1, param1Float2)) {
                param1InputEvent.stop();
                ScrollPane.this.setScrollbarsVisible(true);
                if (ScrollPane.this.hKnobBounds.contains(param1Float1, param1Float2)) {
                  ScrollPane.this.lastPoint.set(param1Float1, param1Float2);
                  this.handlePosition = this.this$0.hKnobBounds.x;
                  ScrollPane scrollPane1 = ScrollPane.this;
                  scrollPane1.touchScrollH = true;
                  scrollPane1.draggingPointer = param1Int1;
                  return true;
                } 
                scrollPane = ScrollPane.this;
                float f = scrollPane.amountX;
                param1Float2 = ScrollPane.this.areaWidth;
                if (param1Float1 >= this.this$0.hKnobBounds.x)
                  b = 1; 
                scrollPane.setScrollX(f + param1Float2 * b);
                return true;
              } 
              if (ScrollPane.this.scrollBarTouch && ScrollPane.this.scrollY && ScrollPane.this.vScrollBounds.contains(param1Float1, param1Float2)) {
                scrollPane.stop();
                ScrollPane.this.setScrollbarsVisible(true);
                if (ScrollPane.this.vKnobBounds.contains(param1Float1, param1Float2)) {
                  ScrollPane.this.lastPoint.set(param1Float1, param1Float2);
                  this.handlePosition = this.this$0.vKnobBounds.y;
                  scrollPane = ScrollPane.this;
                  scrollPane.touchScrollV = true;
                  scrollPane.draggingPointer = param1Int1;
                  return true;
                } 
                scrollPane = ScrollPane.this;
                float f = scrollPane.amountY;
                param1Float1 = ScrollPane.this.areaHeight;
                if (param1Float2 < this.this$0.vKnobBounds.y)
                  b = 1; 
                scrollPane.setScrollY(f + param1Float1 * b);
                return true;
              } 
              return false;
            }
            
            public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
              if (param1Int != ScrollPane.this.draggingPointer)
                return; 
              if (ScrollPane.this.touchScrollH) {
                float f1 = this.this$0.lastPoint.x;
                f1 = this.handlePosition + param1Float1 - f1;
                this.handlePosition = f1;
                f1 = Math.max(this.this$0.hScrollBounds.x, f1);
                float f2 = Math.min(this.this$0.hScrollBounds.x + this.this$0.hScrollBounds.width - this.this$0.hKnobBounds.width, f1);
                f1 = this.this$0.hScrollBounds.width - this.this$0.hKnobBounds.width;
                if (f1 != 0.0F) {
                  ScrollPane scrollPane = ScrollPane.this;
                  scrollPane.setScrollPercentX((f2 - scrollPane.hScrollBounds.x) / f1);
                } 
                ScrollPane.this.lastPoint.set(param1Float1, param1Float2);
              } else if (ScrollPane.this.touchScrollV) {
                float f1 = this.this$0.lastPoint.y;
                f1 = this.handlePosition + param1Float2 - f1;
                this.handlePosition = f1;
                f1 = Math.max(this.this$0.vScrollBounds.y, f1);
                f1 = Math.min(this.this$0.vScrollBounds.y + this.this$0.vScrollBounds.height - this.this$0.vKnobBounds.height, f1);
                float f2 = this.this$0.vScrollBounds.height - this.this$0.vKnobBounds.height;
                if (f2 != 0.0F) {
                  ScrollPane scrollPane = ScrollPane.this;
                  scrollPane.setScrollPercentY(1.0F - (f1 - scrollPane.vScrollBounds.y) / f2);
                } 
                ScrollPane.this.lastPoint.set(param1Float1, param1Float2);
              } 
            }
            
            public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
              if (param1Int1 != ScrollPane.this.draggingPointer)
                return; 
              ScrollPane.this.cancel();
            }
          });
      this.flickScrollListener = new ActorGestureListener() {
          public void fling(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
            if (Math.abs(param1Float1) > 150.0F && ScrollPane.this.scrollX) {
              ScrollPane scrollPane = ScrollPane.this;
              scrollPane.flingTimer = scrollPane.flingTime;
              scrollPane = ScrollPane.this;
              scrollPane.velocityX = param1Float1;
              if (scrollPane.cancelTouchFocus)
                ScrollPane.this.cancelTouchFocus(); 
            } 
            if (Math.abs(param1Float2) > 150.0F && ScrollPane.this.scrollY) {
              ScrollPane scrollPane = ScrollPane.this;
              scrollPane.flingTimer = scrollPane.flingTime;
              scrollPane = ScrollPane.this;
              scrollPane.velocityY = -param1Float2;
              if (scrollPane.cancelTouchFocus)
                ScrollPane.this.cancelTouchFocus(); 
            } 
          }
          
          public boolean handle(Event param1Event) {
            if (super.handle(param1Event)) {
              if (((InputEvent)param1Event).getType() == InputEvent.Type.touchDown)
                ScrollPane.this.flingTimer = 0.0F; 
              return true;
            } 
            if (param1Event instanceof InputEvent && ((InputEvent)param1Event).isTouchFocusCancel())
              ScrollPane.this.cancel(); 
            return false;
          }
          
          public void pan(InputEvent param1InputEvent, float param1Float1, float param1Float2, float param1Float3, float param1Float4) {
            ScrollPane.this.setScrollbarsVisible(true);
            ScrollPane scrollPane = ScrollPane.this;
            scrollPane.amountX -= param1Float3;
            scrollPane = ScrollPane.this;
            scrollPane.amountY += param1Float4;
            ScrollPane.this.clamp();
            if (ScrollPane.this.cancelTouchFocus && ((ScrollPane.this.scrollX && param1Float3 != 0.0F) || (ScrollPane.this.scrollY && param1Float4 != 0.0F)))
              ScrollPane.this.cancelTouchFocus(); 
          }
        };
      addListener(this.flickScrollListener);
      addListener(new InputListener() {
            public boolean scrolled(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
              ScrollPane.this.setScrollbarsVisible(true);
              if (ScrollPane.this.scrollY) {
                ScrollPane scrollPane = ScrollPane.this;
                scrollPane.setScrollY(scrollPane.amountY + ScrollPane.this.getMouseWheelY() * param1Int);
              } else {
                if (ScrollPane.this.scrollX) {
                  ScrollPane scrollPane = ScrollPane.this;
                  scrollPane.setScrollX(scrollPane.amountX + ScrollPane.this.getMouseWheelX() * param1Int);
                  return true;
                } 
                return false;
              } 
              return true;
            }
          });
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public ScrollPane(Actor paramActor, Skin paramSkin) { this(paramActor, (ScrollPaneStyle)paramSkin.get(ScrollPaneStyle.class)); }
  
  public ScrollPane(Actor paramActor, Skin paramSkin, String paramString) { this(paramActor, (ScrollPaneStyle)paramSkin.get(paramString, ScrollPaneStyle.class)); }
  
  private void updateWidgetPosition() {
    float f1 = this.widgetAreaBounds.y;
    if (!this.scrollY) {
      f2 = this.maxY;
    } else {
      f2 = this.maxY - this.visualAmountY;
    } 
    float f3 = f1 - (int)f2;
    f1 = this.widgetAreaBounds.x;
    float f2 = f1;
    if (this.scrollX)
      f2 = f1 - (int)this.visualAmountX; 
    float f4 = f3;
    float f5 = f2;
    if (!this.fadeScrollBars) {
      f4 = f3;
      f5 = f2;
      if (this.scrollbarsOnTop) {
        boolean bool = this.scrollX;
        float f = 0.0F;
        f1 = f3;
        if (bool) {
          f1 = f3;
          if (this.hScrollOnBottom) {
            if (this.style.hScrollKnob != null) {
              f1 = this.style.hScrollKnob.getMinHeight();
            } else {
              f1 = 0.0F;
            } 
            f5 = f1;
            if (this.style.hScroll != null)
              f5 = Math.max(f1, this.style.hScroll.getMinHeight()); 
            f1 = f3 + f5;
          } 
        } 
        f4 = f1;
        f5 = f2;
        if (this.scrollY) {
          f4 = f1;
          f5 = f2;
          if (!this.vScrollOnRight) {
            f3 = f;
            if (this.style.hScrollKnob != null)
              f3 = this.style.hScrollKnob.getMinWidth(); 
            f5 = f3;
            if (this.style.hScroll != null)
              f5 = Math.max(f3, this.style.hScroll.getMinWidth()); 
            f5 = f2 + f5;
            f4 = f1;
          } 
        } 
      } 
    } 
    this.widget.setPosition(f5, f4);
    if (this.widget instanceof Cullable) {
      this.widgetAreaBounds.x -= f5;
      this.widgetAreaBounds.y -= f4;
      this.widgetCullingArea.width = this.widgetAreaBounds.width;
      this.widgetCullingArea.height = this.widgetAreaBounds.height;
      ((Cullable)this.widget).setCullingArea(this.widgetCullingArea);
    } 
  }
  
  public void act(float paramFloat) { // Byte code:
    //   0: aload_0
    //   1: fload_1
    //   2: invokespecial act : (F)V
    //   5: aload_0
    //   6: getfield flickScrollListener : Lcom/badlogic/gdx/scenes/scene2d/utils/ActorGestureListener;
    //   9: invokevirtual getGestureDetector : ()Lcom/badlogic/gdx/input/GestureDetector;
    //   12: invokevirtual isPanning : ()Z
    //   15: istore_2
    //   16: aload_0
    //   17: getfield fadeAlpha : F
    //   20: fstore_3
    //   21: fload_3
    //   22: fconst_0
    //   23: fcmpl
    //   24: ifle -> 88
    //   27: aload_0
    //   28: getfield fadeScrollBars : Z
    //   31: ifeq -> 88
    //   34: iload_2
    //   35: ifne -> 88
    //   38: aload_0
    //   39: getfield touchScrollH : Z
    //   42: ifne -> 88
    //   45: aload_0
    //   46: getfield touchScrollV : Z
    //   49: ifne -> 88
    //   52: aload_0
    //   53: aload_0
    //   54: getfield fadeDelay : F
    //   57: fload_1
    //   58: fsub
    //   59: putfield fadeDelay : F
    //   62: aload_0
    //   63: getfield fadeDelay : F
    //   66: fconst_0
    //   67: fcmpg
    //   68: ifgt -> 82
    //   71: aload_0
    //   72: fconst_0
    //   73: fload_3
    //   74: fload_1
    //   75: fsub
    //   76: invokestatic max : (FF)F
    //   79: putfield fadeAlpha : F
    //   82: iconst_1
    //   83: istore #4
    //   85: goto -> 91
    //   88: iconst_0
    //   89: istore #4
    //   91: aload_0
    //   92: getfield flingTimer : F
    //   95: fconst_0
    //   96: fcmpl
    //   97: ifle -> 265
    //   100: aload_0
    //   101: iconst_1
    //   102: invokevirtual setScrollbarsVisible : (Z)V
    //   105: aload_0
    //   106: getfield flingTimer : F
    //   109: aload_0
    //   110: getfield flingTime : F
    //   113: fdiv
    //   114: fstore_3
    //   115: aload_0
    //   116: aload_0
    //   117: getfield amountX : F
    //   120: aload_0
    //   121: getfield velocityX : F
    //   124: fload_3
    //   125: fmul
    //   126: fload_1
    //   127: fmul
    //   128: fsub
    //   129: putfield amountX : F
    //   132: aload_0
    //   133: aload_0
    //   134: getfield amountY : F
    //   137: aload_0
    //   138: getfield velocityY : F
    //   141: fload_3
    //   142: fmul
    //   143: fload_1
    //   144: fmul
    //   145: fsub
    //   146: putfield amountY : F
    //   149: aload_0
    //   150: invokevirtual clamp : ()V
    //   153: aload_0
    //   154: getfield amountX : F
    //   157: aload_0
    //   158: getfield overscrollDistance : F
    //   161: fneg
    //   162: fcmpl
    //   163: ifne -> 171
    //   166: aload_0
    //   167: fconst_0
    //   168: putfield velocityX : F
    //   171: aload_0
    //   172: getfield amountX : F
    //   175: aload_0
    //   176: getfield maxX : F
    //   179: aload_0
    //   180: getfield overscrollDistance : F
    //   183: fadd
    //   184: fcmpl
    //   185: iflt -> 193
    //   188: aload_0
    //   189: fconst_0
    //   190: putfield velocityX : F
    //   193: aload_0
    //   194: getfield amountY : F
    //   197: aload_0
    //   198: getfield overscrollDistance : F
    //   201: fneg
    //   202: fcmpl
    //   203: ifne -> 211
    //   206: aload_0
    //   207: fconst_0
    //   208: putfield velocityY : F
    //   211: aload_0
    //   212: getfield amountY : F
    //   215: aload_0
    //   216: getfield maxY : F
    //   219: aload_0
    //   220: getfield overscrollDistance : F
    //   223: fadd
    //   224: fcmpl
    //   225: iflt -> 233
    //   228: aload_0
    //   229: fconst_0
    //   230: putfield velocityY : F
    //   233: aload_0
    //   234: aload_0
    //   235: getfield flingTimer : F
    //   238: fload_1
    //   239: fsub
    //   240: putfield flingTimer : F
    //   243: aload_0
    //   244: getfield flingTimer : F
    //   247: fconst_0
    //   248: fcmpg
    //   249: ifgt -> 262
    //   252: aload_0
    //   253: fconst_0
    //   254: putfield velocityX : F
    //   257: aload_0
    //   258: fconst_0
    //   259: putfield velocityY : F
    //   262: iconst_1
    //   263: istore #4
    //   265: aload_0
    //   266: getfield smoothScrolling : Z
    //   269: ifeq -> 558
    //   272: aload_0
    //   273: getfield flingTimer : F
    //   276: fconst_0
    //   277: fcmpg
    //   278: ifgt -> 558
    //   281: iload_2
    //   282: ifne -> 558
    //   285: aload_0
    //   286: getfield touchScrollH : Z
    //   289: ifeq -> 331
    //   292: aload_0
    //   293: getfield scrollX : Z
    //   296: ifeq -> 558
    //   299: aload_0
    //   300: getfield maxX : F
    //   303: aload_0
    //   304: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   307: getfield width : F
    //   310: aload_0
    //   311: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   314: getfield width : F
    //   317: fsub
    //   318: fdiv
    //   319: aload_0
    //   320: getfield areaWidth : F
    //   323: ldc_w 0.1
    //   326: fmul
    //   327: fcmpl
    //   328: ifle -> 558
    //   331: aload_0
    //   332: getfield touchScrollV : Z
    //   335: ifeq -> 377
    //   338: aload_0
    //   339: getfield scrollY : Z
    //   342: ifeq -> 558
    //   345: aload_0
    //   346: getfield maxY : F
    //   349: aload_0
    //   350: getfield vScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   353: getfield height : F
    //   356: aload_0
    //   357: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   360: getfield height : F
    //   363: fsub
    //   364: fdiv
    //   365: aload_0
    //   366: getfield areaHeight : F
    //   369: ldc_w 0.1
    //   372: fmul
    //   373: fcmpl
    //   374: ifle -> 558
    //   377: aload_0
    //   378: getfield visualAmountX : F
    //   381: fstore_3
    //   382: aload_0
    //   383: getfield amountX : F
    //   386: fstore #5
    //   388: iload #4
    //   390: istore #6
    //   392: fload_3
    //   393: fload #5
    //   395: fcmpl
    //   396: ifeq -> 468
    //   399: fload_3
    //   400: fload #5
    //   402: fcmpg
    //   403: ifge -> 437
    //   406: aload_0
    //   407: fload #5
    //   409: fload_3
    //   410: fload_1
    //   411: ldc 200.0
    //   413: fmul
    //   414: fload #5
    //   416: fload_3
    //   417: fsub
    //   418: ldc_w 7.0
    //   421: fmul
    //   422: fload_1
    //   423: fmul
    //   424: invokestatic max : (FF)F
    //   427: fadd
    //   428: invokestatic min : (FF)F
    //   431: invokevirtual visualScrollX : (F)V
    //   434: goto -> 465
    //   437: aload_0
    //   438: fload #5
    //   440: fload_3
    //   441: fload_1
    //   442: ldc 200.0
    //   444: fmul
    //   445: fload_3
    //   446: fload #5
    //   448: fsub
    //   449: ldc_w 7.0
    //   452: fmul
    //   453: fload_1
    //   454: fmul
    //   455: invokestatic max : (FF)F
    //   458: fsub
    //   459: invokestatic max : (FF)F
    //   462: invokevirtual visualScrollX : (F)V
    //   465: iconst_1
    //   466: istore #6
    //   468: aload_0
    //   469: getfield visualAmountY : F
    //   472: fstore_3
    //   473: aload_0
    //   474: getfield amountY : F
    //   477: fstore #5
    //   479: fload_3
    //   480: fload #5
    //   482: fcmpl
    //   483: ifeq -> 613
    //   486: fload_3
    //   487: fload #5
    //   489: fcmpg
    //   490: ifge -> 524
    //   493: aload_0
    //   494: fload #5
    //   496: fload_3
    //   497: ldc 200.0
    //   499: fload_1
    //   500: fmul
    //   501: fload #5
    //   503: fload_3
    //   504: fsub
    //   505: ldc_w 7.0
    //   508: fmul
    //   509: fload_1
    //   510: fmul
    //   511: invokestatic max : (FF)F
    //   514: fadd
    //   515: invokestatic min : (FF)F
    //   518: invokevirtual visualScrollY : (F)V
    //   521: goto -> 552
    //   524: aload_0
    //   525: fload #5
    //   527: fload_3
    //   528: ldc 200.0
    //   530: fload_1
    //   531: fmul
    //   532: fload_3
    //   533: fload #5
    //   535: fsub
    //   536: ldc_w 7.0
    //   539: fmul
    //   540: fload_1
    //   541: fmul
    //   542: invokestatic max : (FF)F
    //   545: fsub
    //   546: invokestatic max : (FF)F
    //   549: invokevirtual visualScrollY : (F)V
    //   552: iconst_1
    //   553: istore #6
    //   555: goto -> 613
    //   558: aload_0
    //   559: getfield visualAmountX : F
    //   562: fstore_3
    //   563: aload_0
    //   564: getfield amountX : F
    //   567: fstore #5
    //   569: fload_3
    //   570: fload #5
    //   572: fcmpl
    //   573: ifeq -> 582
    //   576: aload_0
    //   577: fload #5
    //   579: invokevirtual visualScrollX : (F)V
    //   582: aload_0
    //   583: getfield visualAmountY : F
    //   586: fstore #5
    //   588: aload_0
    //   589: getfield amountY : F
    //   592: fstore_3
    //   593: iload #4
    //   595: istore #6
    //   597: fload #5
    //   599: fload_3
    //   600: fcmpl
    //   601: ifeq -> 613
    //   604: aload_0
    //   605: fload_3
    //   606: invokevirtual visualScrollY : (F)V
    //   609: iload #4
    //   611: istore #6
    //   613: iload #6
    //   615: istore #7
    //   617: iload_2
    //   618: ifne -> 985
    //   621: iload #6
    //   623: istore #4
    //   625: aload_0
    //   626: getfield overscrollX : Z
    //   629: ifeq -> 802
    //   632: iload #6
    //   634: istore #4
    //   636: aload_0
    //   637: getfield scrollX : Z
    //   640: ifeq -> 802
    //   643: aload_0
    //   644: getfield amountX : F
    //   647: fstore_3
    //   648: fload_3
    //   649: fconst_0
    //   650: fcmpg
    //   651: ifge -> 716
    //   654: aload_0
    //   655: iconst_1
    //   656: invokevirtual setScrollbarsVisible : (Z)V
    //   659: aload_0
    //   660: getfield amountX : F
    //   663: fstore_3
    //   664: aload_0
    //   665: getfield overscrollSpeedMin : F
    //   668: fstore #5
    //   670: aload_0
    //   671: fload_3
    //   672: fload #5
    //   674: aload_0
    //   675: getfield overscrollSpeedMax : F
    //   678: fload #5
    //   680: fsub
    //   681: fload_3
    //   682: fneg
    //   683: fmul
    //   684: aload_0
    //   685: getfield overscrollDistance : F
    //   688: fdiv
    //   689: fadd
    //   690: fload_1
    //   691: fmul
    //   692: fadd
    //   693: putfield amountX : F
    //   696: aload_0
    //   697: getfield amountX : F
    //   700: fconst_0
    //   701: fcmpl
    //   702: ifle -> 710
    //   705: aload_0
    //   706: fconst_0
    //   707: invokevirtual scrollX : (F)V
    //   710: iconst_1
    //   711: istore #4
    //   713: goto -> 802
    //   716: iload #6
    //   718: istore #4
    //   720: fload_3
    //   721: aload_0
    //   722: getfield maxX : F
    //   725: fcmpl
    //   726: ifle -> 802
    //   729: aload_0
    //   730: iconst_1
    //   731: invokevirtual setScrollbarsVisible : (Z)V
    //   734: aload_0
    //   735: getfield amountX : F
    //   738: fstore #5
    //   740: aload_0
    //   741: getfield overscrollSpeedMin : F
    //   744: fstore #8
    //   746: aload_0
    //   747: getfield overscrollSpeedMax : F
    //   750: fstore #9
    //   752: aload_0
    //   753: getfield maxX : F
    //   756: fstore_3
    //   757: aload_0
    //   758: fload #5
    //   760: fload #8
    //   762: fload #9
    //   764: fload #8
    //   766: fsub
    //   767: fload_3
    //   768: fload #5
    //   770: fsub
    //   771: fneg
    //   772: fmul
    //   773: aload_0
    //   774: getfield overscrollDistance : F
    //   777: fdiv
    //   778: fadd
    //   779: fload_1
    //   780: fmul
    //   781: fsub
    //   782: putfield amountX : F
    //   785: aload_0
    //   786: getfield amountX : F
    //   789: fload_3
    //   790: fcmpg
    //   791: ifge -> 710
    //   794: aload_0
    //   795: fload_3
    //   796: invokevirtual scrollX : (F)V
    //   799: goto -> 710
    //   802: iload #4
    //   804: istore #7
    //   806: aload_0
    //   807: getfield overscrollY : Z
    //   810: ifeq -> 985
    //   813: iload #4
    //   815: istore #7
    //   817: aload_0
    //   818: getfield scrollY : Z
    //   821: ifeq -> 985
    //   824: aload_0
    //   825: getfield amountY : F
    //   828: fstore_3
    //   829: fload_3
    //   830: fconst_0
    //   831: fcmpg
    //   832: ifge -> 897
    //   835: aload_0
    //   836: iconst_1
    //   837: invokevirtual setScrollbarsVisible : (Z)V
    //   840: aload_0
    //   841: getfield amountY : F
    //   844: fstore #5
    //   846: aload_0
    //   847: getfield overscrollSpeedMin : F
    //   850: fstore_3
    //   851: aload_0
    //   852: fload #5
    //   854: fload_3
    //   855: aload_0
    //   856: getfield overscrollSpeedMax : F
    //   859: fload_3
    //   860: fsub
    //   861: fload #5
    //   863: fneg
    //   864: fmul
    //   865: aload_0
    //   866: getfield overscrollDistance : F
    //   869: fdiv
    //   870: fadd
    //   871: fload_1
    //   872: fmul
    //   873: fadd
    //   874: putfield amountY : F
    //   877: aload_0
    //   878: getfield amountY : F
    //   881: fconst_0
    //   882: fcmpl
    //   883: ifle -> 891
    //   886: aload_0
    //   887: fconst_0
    //   888: invokevirtual scrollY : (F)V
    //   891: iconst_1
    //   892: istore #7
    //   894: goto -> 985
    //   897: iload #4
    //   899: istore #7
    //   901: fload_3
    //   902: aload_0
    //   903: getfield maxY : F
    //   906: fcmpl
    //   907: ifle -> 985
    //   910: aload_0
    //   911: iconst_1
    //   912: invokevirtual setScrollbarsVisible : (Z)V
    //   915: aload_0
    //   916: getfield amountY : F
    //   919: fstore #5
    //   921: aload_0
    //   922: getfield overscrollSpeedMin : F
    //   925: fstore #9
    //   927: aload_0
    //   928: getfield overscrollSpeedMax : F
    //   931: fstore_3
    //   932: aload_0
    //   933: getfield maxY : F
    //   936: fstore #8
    //   938: aload_0
    //   939: fload #5
    //   941: fload #9
    //   943: fload_3
    //   944: fload #9
    //   946: fsub
    //   947: fload #8
    //   949: fload #5
    //   951: fsub
    //   952: fneg
    //   953: fmul
    //   954: aload_0
    //   955: getfield overscrollDistance : F
    //   958: fdiv
    //   959: fadd
    //   960: fload_1
    //   961: fmul
    //   962: fsub
    //   963: putfield amountY : F
    //   966: aload_0
    //   967: getfield amountY : F
    //   970: fload #8
    //   972: fcmpg
    //   973: ifge -> 891
    //   976: aload_0
    //   977: fload #8
    //   979: invokevirtual scrollY : (F)V
    //   982: goto -> 891
    //   985: iload #7
    //   987: ifeq -> 1017
    //   990: aload_0
    //   991: invokevirtual getStage : ()Lcom/badlogic/gdx/scenes/scene2d/Stage;
    //   994: astore #10
    //   996: aload #10
    //   998: ifnull -> 1017
    //   1001: aload #10
    //   1003: invokevirtual getActionsRequestRendering : ()Z
    //   1006: ifeq -> 1017
    //   1009: getstatic com/badlogic/gdx/Gdx.graphics : Lcom/badlogic/gdx/Graphics;
    //   1012: invokeinterface requestRendering : ()V
    //   1017: return }
  
  public void addActor(Actor paramActor) { throw new UnsupportedOperationException("Use ScrollPane#setWidget."); }
  
  public void addActorAfter(Actor paramActor1, Actor paramActor2) { throw new UnsupportedOperationException("Use ScrollPane#setWidget."); }
  
  public void addActorAt(int paramInt, Actor paramActor) { throw new UnsupportedOperationException("Use ScrollPane#setWidget."); }
  
  public void addActorBefore(Actor paramActor1, Actor paramActor2) { throw new UnsupportedOperationException("Use ScrollPane#setWidget."); }
  
  public void cancel() {
    this.draggingPointer = -1;
    this.touchScrollH = false;
    this.touchScrollV = false;
    this.flickScrollListener.getGestureDetector().cancel();
  }
  
  public void cancelTouchFocus() {
    Stage stage = getStage();
    if (stage != null)
      stage.cancelTouchFocusExcept(this.flickScrollListener, this); 
  }
  
  void clamp() {
    float f;
    if (!this.clamp)
      return; 
    if (this.overscrollX) {
      float f1 = this.amountX;
      f = this.overscrollDistance;
      f = MathUtils.clamp(f1, -f, this.maxX + f);
    } else {
      f = MathUtils.clamp(this.amountX, 0.0F, this.maxX);
    } 
    scrollX(f);
    if (this.overscrollY) {
      f = this.amountY;
      float f1 = this.overscrollDistance;
      f = MathUtils.clamp(f, -f1, this.maxY + f1);
    } else {
      f = MathUtils.clamp(this.amountY, 0.0F, this.maxY);
    } 
    scrollY(f);
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    if (this.widget == null)
      return; 
    validate();
    applyTransform(paramBatch, computeTransform());
    if (this.scrollX)
      this.hScrollBounds.x += (int)((this.hScrollBounds.width - this.hKnobBounds.width) * getVisualScrollPercentX()); 
    if (this.scrollY)
      this.vScrollBounds.y += (int)((this.vScrollBounds.height - this.vKnobBounds.height) * (1.0F - getVisualScrollPercentY())); 
    updateWidgetPosition();
    Color color = getColor();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    if (this.style.background != null)
      this.style.background.draw(paramBatch, 0.0F, 0.0F, getWidth(), getHeight()); 
    paramBatch.flush();
    if (clipBegin(this.widgetAreaBounds.x, this.widgetAreaBounds.y, this.widgetAreaBounds.width, this.widgetAreaBounds.height)) {
      drawChildren(paramBatch, paramFloat);
      paramBatch.flush();
      clipEnd();
    } 
    float f1 = color.a * paramFloat;
    float f2 = f1;
    if (this.fadeScrollBars)
      f2 = f1 * Interpolation.fade.apply(this.fadeAlpha / this.fadeAlphaSeconds); 
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    drawScrollBars(paramBatch, color.r, color.g, color.b, f2);
    resetTransform(paramBatch);
  }
  
  public void drawDebug(ShapeRenderer paramShapeRenderer) {
    drawDebugBounds(paramShapeRenderer);
    applyTransform(paramShapeRenderer, computeTransform());
    if (clipBegin(this.widgetAreaBounds.x, this.widgetAreaBounds.y, this.widgetAreaBounds.width, this.widgetAreaBounds.height)) {
      drawDebugChildren(paramShapeRenderer);
      paramShapeRenderer.flush();
      clipEnd();
    } 
    resetTransform(paramShapeRenderer);
  }
  
  protected void drawScrollBars(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    boolean bool2;
    if (paramFloat4 <= 0.0F)
      return; 
    paramBatch.setColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    boolean bool = this.scrollX;
    boolean bool1 = true;
    if (bool && this.hKnobBounds.width > 0.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    if (!this.scrollY || this.vKnobBounds.height <= 0.0F)
      bool1 = false; 
    if (bool2 && bool1 && this.style.corner != null)
      this.style.corner.draw(paramBatch, this.hScrollBounds.x + this.hScrollBounds.width, this.hScrollBounds.y, this.vScrollBounds.width, this.vScrollBounds.y); 
    if (bool2) {
      if (this.style.hScroll != null)
        this.style.hScroll.draw(paramBatch, this.hScrollBounds.x, this.hScrollBounds.y, this.hScrollBounds.width, this.hScrollBounds.height); 
      if (this.style.hScrollKnob != null)
        this.style.hScrollKnob.draw(paramBatch, this.hKnobBounds.x, this.hKnobBounds.y, this.hKnobBounds.width, this.hKnobBounds.height); 
    } 
    if (bool1) {
      if (this.style.vScroll != null)
        this.style.vScroll.draw(paramBatch, this.vScrollBounds.x, this.vScrollBounds.y, this.vScrollBounds.width, this.vScrollBounds.height); 
      if (this.style.vScrollKnob != null)
        this.style.vScrollKnob.draw(paramBatch, this.vKnobBounds.x, this.vKnobBounds.y, this.vKnobBounds.width, this.vKnobBounds.height); 
    } 
  }
  
  public void fling(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.flingTimer = paramFloat1;
    this.velocityX = paramFloat2;
    this.velocityY = paramFloat3;
  }
  
  public Actor getActor() { return this.widget; }
  
  public boolean getFadeScrollBars() { return this.fadeScrollBars; }
  
  public float getMaxX() { return this.maxX; }
  
  public float getMaxY() { return this.maxY; }
  
  public float getMinHeight() { return 0.0F; }
  
  public float getMinWidth() { return 0.0F; }
  
  protected float getMouseWheelX() {
    float f = this.areaWidth;
    return Math.min(f, Math.max(0.9F * f, this.maxX * 0.1F) / 4.0F);
  }
  
  protected float getMouseWheelY() {
    float f = this.areaHeight;
    return Math.min(f, Math.max(0.9F * f, this.maxY * 0.1F) / 4.0F);
  }
  
  public float getOverscrollDistance() { return this.overscrollDistance; }
  
  public float getPrefHeight() {
    Actor actor = this.widget;
    boolean bool = actor instanceof Layout;
    float f1 = 0.0F;
    if (bool) {
      validate();
      f2 = ((Layout)this.widget).getPrefHeight();
    } else if (actor != null) {
      f2 = actor.getHeight();
    } else {
      f2 = 0.0F;
    } 
    float f3 = f2;
    if (this.style.background != null)
      f3 = f2 + this.style.background.getTopHeight() + this.style.background.getBottomHeight(); 
    float f2 = f3;
    if (this.scrollX) {
      f2 = f1;
      if (this.style.hScrollKnob != null)
        f2 = this.style.hScrollKnob.getMinHeight(); 
      f1 = f2;
      if (this.style.hScroll != null)
        f1 = Math.max(f2, this.style.hScroll.getMinHeight()); 
      f2 = f3 + f1;
    } 
    return f2;
  }
  
  public float getPrefWidth() {
    Actor actor = this.widget;
    boolean bool = actor instanceof Layout;
    float f1 = 0.0F;
    if (bool) {
      validate();
      f2 = ((Layout)this.widget).getPrefWidth();
    } else if (actor != null) {
      f2 = actor.getWidth();
    } else {
      f2 = 0.0F;
    } 
    float f3 = f2;
    if (this.style.background != null)
      f3 = f2 + this.style.background.getLeftWidth() + this.style.background.getRightWidth(); 
    float f2 = f3;
    if (this.scrollY) {
      f2 = f1;
      if (this.style.vScrollKnob != null)
        f2 = this.style.vScrollKnob.getMinWidth(); 
      f1 = f2;
      if (this.style.vScroll != null)
        f1 = Math.max(f2, this.style.vScroll.getMinWidth()); 
      f2 = f3 + f1;
    } 
    return f2;
  }
  
  public float getScrollBarHeight() {
    boolean bool = this.scrollX;
    float f1 = 0.0F;
    if (!bool)
      return 0.0F; 
    if (this.style.hScrollKnob != null)
      f1 = this.style.hScrollKnob.getMinHeight(); 
    float f2 = f1;
    if (this.style.hScroll != null)
      f2 = Math.max(f1, this.style.hScroll.getMinHeight()); 
    return f2;
  }
  
  public float getScrollBarWidth() {
    boolean bool = this.scrollY;
    float f1 = 0.0F;
    if (!bool)
      return 0.0F; 
    if (this.style.vScrollKnob != null)
      f1 = this.style.vScrollKnob.getMinWidth(); 
    float f2 = f1;
    if (this.style.vScroll != null)
      f2 = Math.max(f1, this.style.vScroll.getMinWidth()); 
    return f2;
  }
  
  public float getScrollHeight() { return this.areaHeight; }
  
  public float getScrollPercentX() {
    float f = this.maxX;
    return (f == 0.0F) ? 0.0F : MathUtils.clamp(this.amountX / f, 0.0F, 1.0F);
  }
  
  public float getScrollPercentY() {
    float f = this.maxY;
    return (f == 0.0F) ? 0.0F : MathUtils.clamp(this.amountY / f, 0.0F, 1.0F);
  }
  
  public float getScrollWidth() { return this.areaWidth; }
  
  public float getScrollX() { return this.amountX; }
  
  public float getScrollY() { return this.amountY; }
  
  public ScrollPaneStyle getStyle() { return this.style; }
  
  public boolean getVariableSizeKnobs() { return this.variableSizeKnobs; }
  
  public float getVelocityX() { return this.velocityX; }
  
  public float getVelocityY() { return this.velocityY; }
  
  public float getVisualScrollPercentX() {
    float f = this.maxX;
    return (f == 0.0F) ? 0.0F : MathUtils.clamp(this.visualAmountX / f, 0.0F, 1.0F);
  }
  
  public float getVisualScrollPercentY() {
    float f = this.maxY;
    return (f == 0.0F) ? 0.0F : MathUtils.clamp(this.visualAmountY / f, 0.0F, 1.0F);
  }
  
  public float getVisualScrollX() {
    float f;
    if (!this.scrollX) {
      f = 0.0F;
    } else {
      f = this.visualAmountX;
    } 
    return f;
  }
  
  public float getVisualScrollY() {
    float f;
    if (!this.scrollY) {
      f = 0.0F;
    } else {
      f = this.visualAmountY;
    } 
    return f;
  }
  
  public Actor getWidget() { return this.widget; }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    if (paramFloat1 < 0.0F || paramFloat1 >= getWidth() || paramFloat2 < 0.0F || paramFloat2 >= getHeight())
      return null; 
    if (paramBoolean && getTouchable() == Touchable.enabled && isVisible()) {
      if (this.scrollX && this.touchScrollH && this.hScrollBounds.contains(paramFloat1, paramFloat2))
        return this; 
      if (this.scrollY && this.touchScrollV && this.vScrollBounds.contains(paramFloat1, paramFloat2))
        return this; 
    } 
    return super.hit(paramFloat1, paramFloat2, paramBoolean);
  }
  
  public boolean isBottomEdge() { return (!this.scrollY || this.amountY >= this.maxY); }
  
  public boolean isDragging() {
    boolean bool;
    if (this.draggingPointer != -1) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isFlinging() {
    boolean bool;
    if (this.flingTimer > 0.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isForceScrollX() { return this.forceScrollX; }
  
  public boolean isForceScrollY() { return this.forceScrollY; }
  
  public boolean isLeftEdge() { return (!this.scrollX || this.amountX <= 0.0F); }
  
  public boolean isPanning() { return this.flickScrollListener.getGestureDetector().isPanning(); }
  
  public boolean isRightEdge() { return (!this.scrollX || this.amountX >= this.maxX); }
  
  public boolean isScrollX() { return this.scrollX; }
  
  public boolean isScrollY() { return this.scrollY; }
  
  public boolean isScrollingDisabledX() { return this.disableX; }
  
  public boolean isScrollingDisabledY() { return this.disableY; }
  
  public boolean isTopEdge() { return (!this.scrollY || this.amountY <= 0.0F); }
  
  public void layout() { // Byte code:
    //   0: aload_0
    //   1: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   4: getfield background : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   7: astore_1
    //   8: aload_0
    //   9: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   12: getfield hScrollKnob : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   15: astore_2
    //   16: aload_0
    //   17: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   20: getfield vScrollKnob : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   23: astore_3
    //   24: aload_1
    //   25: ifnull -> 63
    //   28: aload_1
    //   29: invokeinterface getLeftWidth : ()F
    //   34: fstore #4
    //   36: aload_1
    //   37: invokeinterface getRightWidth : ()F
    //   42: fstore #5
    //   44: aload_1
    //   45: invokeinterface getTopHeight : ()F
    //   50: fstore #6
    //   52: aload_1
    //   53: invokeinterface getBottomHeight : ()F
    //   58: fstore #7
    //   60: goto -> 75
    //   63: fconst_0
    //   64: fstore #7
    //   66: fconst_0
    //   67: fstore #4
    //   69: fconst_0
    //   70: fstore #5
    //   72: fconst_0
    //   73: fstore #6
    //   75: aload_0
    //   76: invokevirtual getWidth : ()F
    //   79: fstore #8
    //   81: aload_0
    //   82: invokevirtual getHeight : ()F
    //   85: fstore #9
    //   87: aload_2
    //   88: ifnull -> 102
    //   91: aload_2
    //   92: invokeinterface getMinHeight : ()F
    //   97: fstore #10
    //   99: goto -> 105
    //   102: fconst_0
    //   103: fstore #10
    //   105: fload #10
    //   107: fstore #11
    //   109: aload_0
    //   110: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   113: getfield hScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   116: ifnull -> 138
    //   119: fload #10
    //   121: aload_0
    //   122: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   125: getfield hScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   128: invokeinterface getMinHeight : ()F
    //   133: invokestatic max : (FF)F
    //   136: fstore #11
    //   138: aload_3
    //   139: ifnull -> 153
    //   142: aload_3
    //   143: invokeinterface getMinWidth : ()F
    //   148: fstore #10
    //   150: goto -> 156
    //   153: fconst_0
    //   154: fstore #10
    //   156: fload #10
    //   158: fstore #12
    //   160: aload_0
    //   161: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   164: getfield vScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   167: ifnull -> 189
    //   170: fload #10
    //   172: aload_0
    //   173: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   176: getfield vScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   179: invokeinterface getMinWidth : ()F
    //   184: invokestatic max : (FF)F
    //   187: fstore #12
    //   189: aload_0
    //   190: fload #8
    //   192: fload #4
    //   194: fsub
    //   195: fload #5
    //   197: fsub
    //   198: putfield areaWidth : F
    //   201: fload #9
    //   203: fload #6
    //   205: fsub
    //   206: fstore #13
    //   208: aload_0
    //   209: fload #13
    //   211: fload #7
    //   213: fsub
    //   214: putfield areaHeight : F
    //   217: aload_0
    //   218: getfield widget : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   221: astore_1
    //   222: aload_1
    //   223: ifnonnull -> 227
    //   226: return
    //   227: aload_1
    //   228: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   231: ifeq -> 258
    //   234: aload_1
    //   235: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   238: astore_1
    //   239: aload_1
    //   240: invokeinterface getPrefWidth : ()F
    //   245: fstore #10
    //   247: aload_1
    //   248: invokeinterface getPrefHeight : ()F
    //   253: fstore #6
    //   255: goto -> 273
    //   258: aload_1
    //   259: invokevirtual getWidth : ()F
    //   262: fstore #10
    //   264: aload_0
    //   265: getfield widget : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   268: invokevirtual getHeight : ()F
    //   271: fstore #6
    //   273: aload_0
    //   274: getfield forceScrollX : Z
    //   277: istore #14
    //   279: iconst_0
    //   280: istore #15
    //   282: iload #14
    //   284: ifne -> 313
    //   287: fload #10
    //   289: aload_0
    //   290: getfield areaWidth : F
    //   293: fcmpl
    //   294: ifle -> 307
    //   297: aload_0
    //   298: getfield disableX : Z
    //   301: ifne -> 307
    //   304: goto -> 313
    //   307: iconst_0
    //   308: istore #14
    //   310: goto -> 316
    //   313: iconst_1
    //   314: istore #14
    //   316: aload_0
    //   317: iload #14
    //   319: putfield scrollX : Z
    //   322: aload_0
    //   323: getfield forceScrollY : Z
    //   326: ifne -> 354
    //   329: iload #15
    //   331: istore #14
    //   333: fload #6
    //   335: aload_0
    //   336: getfield areaHeight : F
    //   339: fcmpl
    //   340: ifle -> 357
    //   343: iload #15
    //   345: istore #14
    //   347: aload_0
    //   348: getfield disableY : Z
    //   351: ifne -> 357
    //   354: iconst_1
    //   355: istore #14
    //   357: aload_0
    //   358: iload #14
    //   360: putfield scrollY : Z
    //   363: aload_0
    //   364: getfield fadeScrollBars : Z
    //   367: istore #14
    //   369: iload #14
    //   371: ifne -> 479
    //   374: aload_0
    //   375: getfield scrollY : Z
    //   378: ifeq -> 421
    //   381: aload_0
    //   382: aload_0
    //   383: getfield areaWidth : F
    //   386: fload #12
    //   388: fsub
    //   389: putfield areaWidth : F
    //   392: aload_0
    //   393: getfield scrollX : Z
    //   396: ifne -> 421
    //   399: fload #10
    //   401: aload_0
    //   402: getfield areaWidth : F
    //   405: fcmpl
    //   406: ifle -> 421
    //   409: aload_0
    //   410: getfield disableX : Z
    //   413: ifne -> 421
    //   416: aload_0
    //   417: iconst_1
    //   418: putfield scrollX : Z
    //   421: aload_0
    //   422: getfield scrollX : Z
    //   425: ifeq -> 479
    //   428: aload_0
    //   429: aload_0
    //   430: getfield areaHeight : F
    //   433: fload #11
    //   435: fsub
    //   436: putfield areaHeight : F
    //   439: aload_0
    //   440: getfield scrollY : Z
    //   443: ifne -> 479
    //   446: fload #6
    //   448: aload_0
    //   449: getfield areaHeight : F
    //   452: fcmpl
    //   453: ifle -> 479
    //   456: aload_0
    //   457: getfield disableY : Z
    //   460: ifne -> 479
    //   463: aload_0
    //   464: iconst_1
    //   465: putfield scrollY : Z
    //   468: aload_0
    //   469: aload_0
    //   470: getfield areaWidth : F
    //   473: fload #12
    //   475: fsub
    //   476: putfield areaWidth : F
    //   479: aload_0
    //   480: getfield widgetAreaBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   483: fload #4
    //   485: fload #7
    //   487: aload_0
    //   488: getfield areaWidth : F
    //   491: aload_0
    //   492: getfield areaHeight : F
    //   495: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   498: pop
    //   499: iload #14
    //   501: ifeq -> 543
    //   504: aload_0
    //   505: getfield scrollX : Z
    //   508: ifeq -> 659
    //   511: aload_0
    //   512: getfield scrollY : Z
    //   515: ifeq -> 659
    //   518: aload_0
    //   519: aload_0
    //   520: getfield areaHeight : F
    //   523: fload #11
    //   525: fsub
    //   526: putfield areaHeight : F
    //   529: aload_0
    //   530: aload_0
    //   531: getfield areaWidth : F
    //   534: fload #12
    //   536: fsub
    //   537: putfield areaWidth : F
    //   540: goto -> 659
    //   543: aload_0
    //   544: getfield scrollbarsOnTop : Z
    //   547: ifeq -> 599
    //   550: aload_0
    //   551: getfield scrollX : Z
    //   554: ifeq -> 573
    //   557: aload_0
    //   558: getfield widgetAreaBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   561: astore_1
    //   562: aload_1
    //   563: aload_1
    //   564: getfield height : F
    //   567: fload #11
    //   569: fadd
    //   570: putfield height : F
    //   573: aload_0
    //   574: getfield scrollY : Z
    //   577: ifeq -> 659
    //   580: aload_0
    //   581: getfield widgetAreaBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   584: astore_1
    //   585: aload_1
    //   586: aload_1
    //   587: getfield width : F
    //   590: fload #12
    //   592: fadd
    //   593: putfield width : F
    //   596: goto -> 659
    //   599: aload_0
    //   600: getfield scrollX : Z
    //   603: ifeq -> 629
    //   606: aload_0
    //   607: getfield hScrollOnBottom : Z
    //   610: ifeq -> 629
    //   613: aload_0
    //   614: getfield widgetAreaBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   617: astore_1
    //   618: aload_1
    //   619: aload_1
    //   620: getfield y : F
    //   623: fload #11
    //   625: fadd
    //   626: putfield y : F
    //   629: aload_0
    //   630: getfield scrollY : Z
    //   633: ifeq -> 659
    //   636: aload_0
    //   637: getfield vScrollOnRight : Z
    //   640: ifne -> 659
    //   643: aload_0
    //   644: getfield widgetAreaBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   647: astore_1
    //   648: aload_1
    //   649: aload_1
    //   650: getfield x : F
    //   653: fload #12
    //   655: fadd
    //   656: putfield x : F
    //   659: aload_0
    //   660: getfield disableX : Z
    //   663: ifeq -> 675
    //   666: aload_0
    //   667: getfield areaWidth : F
    //   670: fstore #10
    //   672: goto -> 686
    //   675: aload_0
    //   676: getfield areaWidth : F
    //   679: fload #10
    //   681: invokestatic max : (FF)F
    //   684: fstore #10
    //   686: aload_0
    //   687: getfield disableY : Z
    //   690: ifeq -> 702
    //   693: aload_0
    //   694: getfield areaHeight : F
    //   697: fstore #6
    //   699: goto -> 713
    //   702: aload_0
    //   703: getfield areaHeight : F
    //   706: fload #6
    //   708: invokestatic max : (FF)F
    //   711: fstore #6
    //   713: aload_0
    //   714: fload #10
    //   716: aload_0
    //   717: getfield areaWidth : F
    //   720: fsub
    //   721: putfield maxX : F
    //   724: aload_0
    //   725: fload #6
    //   727: aload_0
    //   728: getfield areaHeight : F
    //   731: fsub
    //   732: putfield maxY : F
    //   735: iload #14
    //   737: ifeq -> 776
    //   740: aload_0
    //   741: getfield scrollX : Z
    //   744: ifeq -> 776
    //   747: aload_0
    //   748: getfield scrollY : Z
    //   751: ifeq -> 776
    //   754: aload_0
    //   755: aload_0
    //   756: getfield maxY : F
    //   759: fload #11
    //   761: fsub
    //   762: putfield maxY : F
    //   765: aload_0
    //   766: aload_0
    //   767: getfield maxX : F
    //   770: fload #12
    //   772: fsub
    //   773: putfield maxX : F
    //   776: aload_0
    //   777: aload_0
    //   778: getfield amountX : F
    //   781: fconst_0
    //   782: aload_0
    //   783: getfield maxX : F
    //   786: invokestatic clamp : (FFF)F
    //   789: invokevirtual scrollX : (F)V
    //   792: aload_0
    //   793: aload_0
    //   794: getfield amountY : F
    //   797: fconst_0
    //   798: aload_0
    //   799: getfield maxY : F
    //   802: invokestatic clamp : (FFF)F
    //   805: invokevirtual scrollY : (F)V
    //   808: aload_0
    //   809: getfield scrollX : Z
    //   812: ifeq -> 1082
    //   815: aload_2
    //   816: ifnull -> 1058
    //   819: aload_0
    //   820: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   823: getfield hScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   826: ifnull -> 846
    //   829: aload_0
    //   830: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   833: getfield hScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   836: invokeinterface getMinHeight : ()F
    //   841: fstore #11
    //   843: goto -> 854
    //   846: aload_2
    //   847: invokeinterface getMinHeight : ()F
    //   852: fstore #11
    //   854: aload_0
    //   855: getfield vScrollOnRight : Z
    //   858: ifeq -> 868
    //   861: fload #4
    //   863: fstore #12
    //   865: goto -> 875
    //   868: fload #12
    //   870: fload #4
    //   872: fadd
    //   873: fstore #12
    //   875: aload_0
    //   876: getfield hScrollOnBottom : Z
    //   879: ifeq -> 889
    //   882: fload #7
    //   884: fstore #9
    //   886: goto -> 896
    //   889: fload #13
    //   891: fload #11
    //   893: fsub
    //   894: fstore #9
    //   896: aload_0
    //   897: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   900: fload #12
    //   902: fload #9
    //   904: aload_0
    //   905: getfield areaWidth : F
    //   908: fload #11
    //   910: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   913: pop
    //   914: aload_0
    //   915: getfield variableSizeKnobs : Z
    //   918: ifeq -> 957
    //   921: aload_0
    //   922: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   925: aload_2
    //   926: invokeinterface getMinWidth : ()F
    //   931: aload_0
    //   932: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   935: getfield width : F
    //   938: aload_0
    //   939: getfield areaWidth : F
    //   942: fmul
    //   943: fload #10
    //   945: fdiv
    //   946: f2i
    //   947: i2f
    //   948: invokestatic max : (FF)F
    //   951: putfield width : F
    //   954: goto -> 970
    //   957: aload_0
    //   958: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   961: aload_2
    //   962: invokeinterface getMinWidth : ()F
    //   967: putfield width : F
    //   970: aload_0
    //   971: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   974: getfield width : F
    //   977: fload #10
    //   979: fcmpl
    //   980: ifle -> 991
    //   983: aload_0
    //   984: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   987: fconst_0
    //   988: putfield width : F
    //   991: aload_0
    //   992: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   995: aload_2
    //   996: invokeinterface getMinHeight : ()F
    //   1001: putfield height : F
    //   1004: aload_0
    //   1005: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1008: aload_0
    //   1009: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1012: getfield x : F
    //   1015: aload_0
    //   1016: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1019: getfield width : F
    //   1022: aload_0
    //   1023: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1026: getfield width : F
    //   1029: fsub
    //   1030: aload_0
    //   1031: invokevirtual getScrollPercentX : ()F
    //   1034: fmul
    //   1035: f2i
    //   1036: i2f
    //   1037: fadd
    //   1038: putfield x : F
    //   1041: aload_0
    //   1042: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1045: aload_0
    //   1046: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1049: getfield y : F
    //   1052: putfield y : F
    //   1055: goto -> 1082
    //   1058: aload_0
    //   1059: getfield hScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1062: fconst_0
    //   1063: fconst_0
    //   1064: fconst_0
    //   1065: fconst_0
    //   1066: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   1069: pop
    //   1070: aload_0
    //   1071: getfield hKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1074: fconst_0
    //   1075: fconst_0
    //   1076: fconst_0
    //   1077: fconst_0
    //   1078: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   1081: pop
    //   1082: aload_0
    //   1083: getfield scrollY : Z
    //   1086: ifeq -> 1380
    //   1089: aload_3
    //   1090: ifnull -> 1356
    //   1093: aload_0
    //   1094: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   1097: getfield vScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   1100: ifnull -> 1120
    //   1103: aload_0
    //   1104: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   1107: getfield vScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   1110: invokeinterface getMinWidth : ()F
    //   1115: fstore #11
    //   1117: goto -> 1128
    //   1120: aload_3
    //   1121: invokeinterface getMinWidth : ()F
    //   1126: fstore #11
    //   1128: aload_0
    //   1129: getfield hScrollOnBottom : Z
    //   1132: ifeq -> 1144
    //   1135: fload #13
    //   1137: aload_0
    //   1138: getfield areaHeight : F
    //   1141: fsub
    //   1142: fstore #7
    //   1144: aload_0
    //   1145: getfield vScrollOnRight : Z
    //   1148: ifeq -> 1164
    //   1151: fload #8
    //   1153: fload #5
    //   1155: fsub
    //   1156: fload #11
    //   1158: fsub
    //   1159: fstore #12
    //   1161: goto -> 1168
    //   1164: fload #4
    //   1166: fstore #12
    //   1168: aload_0
    //   1169: getfield vScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1172: fload #12
    //   1174: fload #7
    //   1176: fload #11
    //   1178: aload_0
    //   1179: getfield areaHeight : F
    //   1182: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   1185: pop
    //   1186: aload_0
    //   1187: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1190: aload_3
    //   1191: invokeinterface getMinWidth : ()F
    //   1196: putfield width : F
    //   1199: aload_0
    //   1200: getfield variableSizeKnobs : Z
    //   1203: ifeq -> 1242
    //   1206: aload_0
    //   1207: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1210: aload_3
    //   1211: invokeinterface getMinHeight : ()F
    //   1216: aload_0
    //   1217: getfield vScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1220: getfield height : F
    //   1223: aload_0
    //   1224: getfield areaHeight : F
    //   1227: fmul
    //   1228: fload #6
    //   1230: fdiv
    //   1231: f2i
    //   1232: i2f
    //   1233: invokestatic max : (FF)F
    //   1236: putfield height : F
    //   1239: goto -> 1255
    //   1242: aload_0
    //   1243: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1246: aload_3
    //   1247: invokeinterface getMinHeight : ()F
    //   1252: putfield height : F
    //   1255: aload_0
    //   1256: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1259: getfield height : F
    //   1262: fload #6
    //   1264: fcmpl
    //   1265: ifle -> 1276
    //   1268: aload_0
    //   1269: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1272: fconst_0
    //   1273: putfield height : F
    //   1276: aload_0
    //   1277: getfield vScrollOnRight : Z
    //   1280: ifeq -> 1305
    //   1283: aload_0
    //   1284: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1287: fload #8
    //   1289: fload #5
    //   1291: fsub
    //   1292: aload_3
    //   1293: invokeinterface getMinWidth : ()F
    //   1298: fsub
    //   1299: putfield x : F
    //   1302: goto -> 1314
    //   1305: aload_0
    //   1306: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1309: fload #4
    //   1311: putfield x : F
    //   1314: aload_0
    //   1315: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1318: aload_0
    //   1319: getfield vScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1322: getfield y : F
    //   1325: aload_0
    //   1326: getfield vScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1329: getfield height : F
    //   1332: aload_0
    //   1333: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1336: getfield height : F
    //   1339: fsub
    //   1340: fconst_1
    //   1341: aload_0
    //   1342: invokevirtual getScrollPercentY : ()F
    //   1345: fsub
    //   1346: fmul
    //   1347: f2i
    //   1348: i2f
    //   1349: fadd
    //   1350: putfield y : F
    //   1353: goto -> 1380
    //   1356: aload_0
    //   1357: getfield vScrollBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1360: fconst_0
    //   1361: fconst_0
    //   1362: fconst_0
    //   1363: fconst_0
    //   1364: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   1367: pop
    //   1368: aload_0
    //   1369: getfield vKnobBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   1372: fconst_0
    //   1373: fconst_0
    //   1374: fconst_0
    //   1375: fconst_0
    //   1376: invokevirtual set : (FFFF)Lcom/badlogic/gdx/math/Rectangle;
    //   1379: pop
    //   1380: aload_0
    //   1381: invokespecial updateWidgetPosition : ()V
    //   1384: aload_0
    //   1385: getfield widget : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   1388: astore_3
    //   1389: aload_3
    //   1390: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   1393: ifeq -> 1416
    //   1396: aload_3
    //   1397: fload #10
    //   1399: fload #6
    //   1401: invokevirtual setSize : (FF)V
    //   1404: aload_0
    //   1405: getfield widget : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   1408: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   1411: invokeinterface validate : ()V
    //   1416: return }
  
  public boolean removeActor(Actor paramActor) {
    if (paramActor != null) {
      if (paramActor != this.widget)
        return false; 
      setActor(null);
      return true;
    } 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public boolean removeActor(Actor paramActor, boolean paramBoolean) {
    if (paramActor != null) {
      if (paramActor != this.widget)
        return false; 
      this.widget = null;
      return super.removeActor(paramActor, paramBoolean);
    } 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public void scrollTo(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { scrollTo(paramFloat1, paramFloat2, paramFloat3, paramFloat4, false, false); }
  
  public void scrollTo(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, boolean paramBoolean1, boolean paramBoolean2) {
    validate();
    float f = this.amountX;
    if (paramBoolean1) {
      paramFloat1 = paramFloat1 - this.areaWidth / 2.0F + paramFloat3 / 2.0F;
    } else {
      paramFloat3 += paramFloat1;
      float f1 = this.areaWidth;
      if (paramFloat3 > f + f1) {
        paramFloat3 -= f1;
      } else {
        paramFloat3 = f;
      } 
      if (paramFloat1 >= paramFloat3)
        paramFloat1 = paramFloat3; 
    } 
    scrollX(MathUtils.clamp(paramFloat1, 0.0F, this.maxX));
    paramFloat3 = this.amountY;
    if (paramBoolean2) {
      paramFloat3 = this.maxY - paramFloat2 + this.areaHeight / 2.0F - paramFloat4 / 2.0F;
    } else {
      f = this.maxY;
      float f1 = this.areaHeight;
      paramFloat1 = paramFloat3;
      if (paramFloat3 > f - paramFloat2 - paramFloat4 + f1)
        paramFloat1 = f - paramFloat2 - paramFloat4 + f1; 
      paramFloat4 = this.maxY;
      paramFloat3 = paramFloat1;
      if (paramFloat1 < paramFloat4 - paramFloat2)
        paramFloat3 = paramFloat4 - paramFloat2; 
    } 
    scrollY(MathUtils.clamp(paramFloat3, 0.0F, this.maxY));
  }
  
  protected void scrollX(float paramFloat) { this.amountX = paramFloat; }
  
  protected void scrollY(float paramFloat) { this.amountY = paramFloat; }
  
  public void setActor(Actor paramActor) {
    Actor actor = this.widget;
    if (actor != this) {
      if (actor != null)
        super.removeActor(actor); 
      this.widget = paramActor;
      paramActor = this.widget;
      if (paramActor != null)
        super.addActor(paramActor); 
      return;
    } 
    throw new IllegalArgumentException("widget cannot be the ScrollPane.");
  }
  
  public void setCancelTouchFocus(boolean paramBoolean) { this.cancelTouchFocus = paramBoolean; }
  
  public void setClamp(boolean paramBoolean) { this.clamp = paramBoolean; }
  
  public void setFadeScrollBars(boolean paramBoolean) {
    if (this.fadeScrollBars == paramBoolean)
      return; 
    this.fadeScrollBars = paramBoolean;
    if (!paramBoolean)
      this.fadeAlpha = this.fadeAlphaSeconds; 
    invalidate();
  }
  
  public void setFlickScroll(boolean paramBoolean) {
    if (this.flickScroll == paramBoolean)
      return; 
    this.flickScroll = paramBoolean;
    if (paramBoolean) {
      addListener(this.flickScrollListener);
    } else {
      removeListener(this.flickScrollListener);
    } 
    invalidate();
  }
  
  public void setFlickScrollTapSquareSize(float paramFloat) { this.flickScrollListener.getGestureDetector().setTapSquareSize(paramFloat); }
  
  public void setFlingTime(float paramFloat) { this.flingTime = paramFloat; }
  
  public void setForceScroll(boolean paramBoolean1, boolean paramBoolean2) {
    this.forceScrollX = paramBoolean1;
    this.forceScrollY = paramBoolean2;
  }
  
  public void setOverscroll(boolean paramBoolean1, boolean paramBoolean2) {
    this.overscrollX = paramBoolean1;
    this.overscrollY = paramBoolean2;
  }
  
  public void setScrollBarPositions(boolean paramBoolean1, boolean paramBoolean2) {
    this.hScrollOnBottom = paramBoolean1;
    this.vScrollOnRight = paramBoolean2;
  }
  
  public void setScrollBarTouch(boolean paramBoolean) { this.scrollBarTouch = paramBoolean; }
  
  public void setScrollPercentX(float paramFloat) { scrollX(this.maxX * MathUtils.clamp(paramFloat, 0.0F, 1.0F)); }
  
  public void setScrollPercentY(float paramFloat) { scrollY(this.maxY * MathUtils.clamp(paramFloat, 0.0F, 1.0F)); }
  
  public void setScrollX(float paramFloat) { scrollX(MathUtils.clamp(paramFloat, 0.0F, this.maxX)); }
  
  public void setScrollY(float paramFloat) { scrollY(MathUtils.clamp(paramFloat, 0.0F, this.maxY)); }
  
  public void setScrollbarsOnTop(boolean paramBoolean) {
    this.scrollbarsOnTop = paramBoolean;
    invalidate();
  }
  
  public void setScrollbarsVisible(boolean paramBoolean) {
    if (paramBoolean) {
      this.fadeAlpha = this.fadeAlphaSeconds;
      this.fadeDelay = this.fadeDelaySeconds;
    } else {
      this.fadeAlpha = 0.0F;
      this.fadeDelay = 0.0F;
    } 
  }
  
  public void setScrollingDisabled(boolean paramBoolean1, boolean paramBoolean2) {
    this.disableX = paramBoolean1;
    this.disableY = paramBoolean2;
    invalidate();
  }
  
  public void setSmoothScrolling(boolean paramBoolean) { this.smoothScrolling = paramBoolean; }
  
  public void setStyle(ScrollPaneStyle paramScrollPaneStyle) {
    if (paramScrollPaneStyle != null) {
      this.style = paramScrollPaneStyle;
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public void setVariableSizeKnobs(boolean paramBoolean) { this.variableSizeKnobs = paramBoolean; }
  
  public void setVelocityX(float paramFloat) { this.velocityX = paramFloat; }
  
  public void setVelocityY(float paramFloat) { this.velocityY = paramFloat; }
  
  public void setWidget(Actor paramActor) { setActor(paramActor); }
  
  public void setupFadeScrollBars(float paramFloat1, float paramFloat2) {
    this.fadeAlphaSeconds = paramFloat1;
    this.fadeDelaySeconds = paramFloat2;
  }
  
  public void setupOverscroll(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.overscrollDistance = paramFloat1;
    this.overscrollSpeedMin = paramFloat2;
    this.overscrollSpeedMax = paramFloat3;
  }
  
  public void updateVisualScroll() {
    this.visualAmountX = this.amountX;
    this.visualAmountY = this.amountY;
  }
  
  protected void visualScrollX(float paramFloat) { this.visualAmountX = paramFloat; }
  
  protected void visualScrollY(float paramFloat) { this.visualAmountY = paramFloat; }
  
  public static class ScrollPaneStyle {
    public Drawable background;
    
    public Drawable corner;
    
    public Drawable hScroll;
    
    public Drawable hScrollKnob;
    
    public Drawable vScroll;
    
    public Drawable vScrollKnob;
    
    public ScrollPaneStyle() {}
    
    public ScrollPaneStyle(ScrollPaneStyle param1ScrollPaneStyle) {
      this.background = param1ScrollPaneStyle.background;
      this.corner = param1ScrollPaneStyle.corner;
      this.hScroll = param1ScrollPaneStyle.hScroll;
      this.hScrollKnob = param1ScrollPaneStyle.hScrollKnob;
      this.vScroll = param1ScrollPaneStyle.vScroll;
      this.vScrollKnob = param1ScrollPaneStyle.vScrollKnob;
    }
    
    public ScrollPaneStyle(Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3, Drawable param1Drawable4, Drawable param1Drawable5) {
      this.background = param1Drawable1;
      this.hScroll = param1Drawable2;
      this.hScrollKnob = param1Drawable3;
      this.vScroll = param1Drawable4;
      this.vScrollKnob = param1Drawable5;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/ScrollPane.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */