package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.SnapshotArray;

public class VerticalGroup extends WidgetGroup {
  private int align = 2;
  
  private int columnAlign;
  
  private FloatArray columnSizes;
  
  private boolean expand;
  
  private float fill;
  
  private float lastPrefWidth;
  
  private float padBottom;
  
  private float padLeft;
  
  private float padRight;
  
  private float padTop;
  
  private float prefHeight;
  
  private float prefWidth;
  
  private boolean reverse;
  
  private boolean round = true;
  
  private boolean sizeInvalid = true;
  
  private float space;
  
  private boolean wrap;
  
  private float wrapSpace;
  
  public VerticalGroup() { setTouchable(Touchable.childrenOnly); }
  
  private void computeSize() {
    int i = 0;
    int j = 0;
    this.sizeInvalid = false;
    SnapshotArray snapshotArray = getChildren();
    int k = snapshotArray.size;
    this.prefWidth = 0.0F;
    if (this.wrap) {
      float f7;
      float f6;
      this.prefHeight = 0.0F;
      FloatArray floatArray = this.columnSizes;
      if (floatArray == null) {
        this.columnSizes = new FloatArray();
      } else {
        floatArray.clear();
      } 
      floatArray = this.columnSizes;
      float f1 = this.space;
      float f2 = this.wrapSpace;
      float f3 = this.padTop + this.padBottom;
      float f4 = getHeight() - f3;
      if (this.reverse) {
        j = k - 1;
        k = -1;
        f5 = 0.0F;
        f6 = 0.0F;
        f7 = 0.0F;
        i = -1;
      } else {
        f5 = 0.0F;
        f6 = 0.0F;
        f7 = 0.0F;
        i = 1;
      } 
      while (j != k) {
        float f10;
        float f9;
        Layout layout = (Actor)snapshotArray.get(j);
        if (layout instanceof Layout) {
          layout = (Layout)layout;
          f8 = layout.getPrefWidth();
          float f = layout.getPrefHeight();
          f9 = f8;
          f10 = f;
          if (f > f4) {
            f10 = Math.max(f4, layout.getMinHeight());
            f9 = f8;
          } 
        } else {
          f9 = layout.getWidth();
          f10 = layout.getHeight();
        } 
        if (f5 > 0.0F) {
          f8 = f1;
        } else {
          f8 = 0.0F;
        } 
        float f8 = f10 + f8;
        if (f5 + f8 > f4 && f5 > 0.0F) {
          floatArray.add(f5);
          floatArray.add(f6);
          this.prefHeight = Math.max(this.prefHeight, f5 + f3);
          f5 = f7;
          if (f7 > 0.0F)
            f5 = f7 + f2; 
          f7 = f5 + f6;
          f5 = 0.0F;
          f6 = 0.0F;
        } else {
          f10 = f8;
        } 
        f5 += f10;
        f6 = Math.max(f6, f9);
        j += i;
      } 
      floatArray.add(f5);
      floatArray.add(f6);
      this.prefHeight = Math.max(this.prefHeight, f5 + f3);
      float f5 = f7;
      if (f7 > 0.0F)
        f5 = f7 + f2; 
      this.prefWidth = Math.max(this.prefWidth, f5 + f6);
    } else {
      this.prefHeight = this.padTop + this.padBottom + this.space * (k - 1);
      for (j = i; j < k; j++) {
        Layout layout = (Actor)snapshotArray.get(j);
        if (layout instanceof Layout) {
          layout = (Layout)layout;
          this.prefWidth = Math.max(this.prefWidth, layout.getPrefWidth());
          this.prefHeight += layout.getPrefHeight();
        } else {
          this.prefWidth = Math.max(this.prefWidth, layout.getWidth());
          this.prefHeight += layout.getHeight();
        } 
      } 
    } 
    this.prefWidth += this.padLeft + this.padRight;
    if (this.round) {
      this.prefWidth = Math.round(this.prefWidth);
      this.prefHeight = Math.round(this.prefHeight);
    } 
  }
  
  private void layoutWrapped() { // Byte code:
    //   0: aload_0
    //   1: astore_1
    //   2: aload_0
    //   3: invokevirtual getPrefWidth : ()F
    //   6: fstore_2
    //   7: fload_2
    //   8: aload_1
    //   9: getfield lastPrefWidth : F
    //   12: fcmpl
    //   13: ifeq -> 25
    //   16: aload_1
    //   17: fload_2
    //   18: putfield lastPrefWidth : F
    //   21: aload_0
    //   22: invokevirtual invalidateHierarchy : ()V
    //   25: aload_1
    //   26: getfield align : I
    //   29: istore_3
    //   30: aload_1
    //   31: getfield round : Z
    //   34: istore #4
    //   36: aload_1
    //   37: getfield space : F
    //   40: fstore #5
    //   42: aload_1
    //   43: getfield padLeft : F
    //   46: fstore #6
    //   48: aload_1
    //   49: getfield fill : F
    //   52: fstore #7
    //   54: aload_1
    //   55: getfield wrapSpace : F
    //   58: fstore #8
    //   60: aload_1
    //   61: getfield prefHeight : F
    //   64: aload_1
    //   65: getfield padTop : F
    //   68: fsub
    //   69: aload_1
    //   70: getfield padBottom : F
    //   73: fsub
    //   74: fstore #9
    //   76: aload_0
    //   77: invokevirtual getHeight : ()F
    //   80: fstore #10
    //   82: aload_1
    //   83: getfield prefHeight : F
    //   86: aload_1
    //   87: getfield padTop : F
    //   90: fsub
    //   91: fload #5
    //   93: fadd
    //   94: fstore #11
    //   96: iload_3
    //   97: bipush #16
    //   99: iand
    //   100: ifeq -> 119
    //   103: aload_0
    //   104: invokevirtual getWidth : ()F
    //   107: fload_2
    //   108: fsub
    //   109: fstore_2
    //   110: fload #6
    //   112: fload_2
    //   113: fadd
    //   114: fstore #12
    //   116: goto -> 142
    //   119: fload #6
    //   121: fstore #12
    //   123: iload_3
    //   124: bipush #8
    //   126: iand
    //   127: ifne -> 142
    //   130: aload_0
    //   131: invokevirtual getWidth : ()F
    //   134: fload_2
    //   135: fsub
    //   136: fconst_2
    //   137: fdiv
    //   138: fstore_2
    //   139: goto -> 110
    //   142: iload_3
    //   143: iconst_2
    //   144: iand
    //   145: ifeq -> 164
    //   148: fload #10
    //   150: aload_1
    //   151: getfield prefHeight : F
    //   154: fsub
    //   155: fstore_2
    //   156: fload #11
    //   158: fload_2
    //   159: fadd
    //   160: fstore_2
    //   161: goto -> 186
    //   164: fload #11
    //   166: fstore_2
    //   167: iload_3
    //   168: iconst_4
    //   169: iand
    //   170: ifne -> 186
    //   173: fload #10
    //   175: aload_1
    //   176: getfield prefHeight : F
    //   179: fsub
    //   180: fconst_2
    //   181: fdiv
    //   182: fstore_2
    //   183: goto -> 156
    //   186: fload #10
    //   188: aload_1
    //   189: getfield padTop : F
    //   192: fsub
    //   193: fstore #13
    //   195: aload_1
    //   196: getfield columnAlign : I
    //   199: istore #14
    //   201: aload_1
    //   202: getfield columnSizes : Lcom/badlogic/gdx/utils/FloatArray;
    //   205: astore #15
    //   207: aload_0
    //   208: invokevirtual getChildren : ()Lcom/badlogic/gdx/utils/SnapshotArray;
    //   211: astore #16
    //   213: aload #16
    //   215: getfield size : I
    //   218: istore_3
    //   219: aload_1
    //   220: getfield reverse : Z
    //   223: istore #17
    //   225: iconst_m1
    //   226: istore #18
    //   228: iload #17
    //   230: ifeq -> 242
    //   233: iinc #3, -1
    //   236: iconst_m1
    //   237: istore #19
    //   239: goto -> 250
    //   242: iload_3
    //   243: istore #18
    //   245: iconst_0
    //   246: istore_3
    //   247: iconst_1
    //   248: istore #19
    //   250: fconst_0
    //   251: fstore #6
    //   253: iconst_0
    //   254: istore #20
    //   256: fconst_0
    //   257: fstore #21
    //   259: iload_3
    //   260: iload #18
    //   262: if_icmpeq -> 698
    //   265: aload #16
    //   267: iload_3
    //   268: invokevirtual get : (I)Ljava/lang/Object;
    //   271: checkcast com/badlogic/gdx/scenes/scene2d/Actor
    //   274: astore #22
    //   276: aconst_null
    //   277: astore_1
    //   278: aload #22
    //   280: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   283: ifeq -> 354
    //   286: aload #22
    //   288: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   291: astore #23
    //   293: aload #23
    //   295: invokeinterface getPrefWidth : ()F
    //   300: fstore #24
    //   302: aload #23
    //   304: invokeinterface getPrefHeight : ()F
    //   309: fstore #25
    //   311: fload #24
    //   313: fstore #11
    //   315: aload #23
    //   317: astore_1
    //   318: fload #25
    //   320: fstore #10
    //   322: fload #25
    //   324: fload #13
    //   326: fcmpl
    //   327: ifle -> 368
    //   330: fload #24
    //   332: fstore #11
    //   334: fload #13
    //   336: aload #23
    //   338: invokeinterface getMinHeight : ()F
    //   343: invokestatic max : (FF)F
    //   346: fstore #24
    //   348: aload #23
    //   350: astore_1
    //   351: goto -> 372
    //   354: aload #22
    //   356: invokevirtual getWidth : ()F
    //   359: fstore #11
    //   361: aload #22
    //   363: invokevirtual getHeight : ()F
    //   366: fstore #10
    //   368: fload #10
    //   370: fstore #24
    //   372: fload #6
    //   374: fload #24
    //   376: fsub
    //   377: fload #5
    //   379: fsub
    //   380: aload_0
    //   381: getfield padBottom : F
    //   384: fcmpg
    //   385: iflt -> 403
    //   388: iload #20
    //   390: ifne -> 396
    //   393: goto -> 403
    //   396: fload #6
    //   398: fstore #10
    //   400: goto -> 499
    //   403: iload #14
    //   405: iconst_4
    //   406: iand
    //   407: ifeq -> 431
    //   410: fload #9
    //   412: aload #15
    //   414: iload #20
    //   416: invokevirtual get : (I)F
    //   419: fsub
    //   420: fstore #6
    //   422: fload_2
    //   423: fload #6
    //   425: fsub
    //   426: fstore #6
    //   428: goto -> 458
    //   431: iload #14
    //   433: iconst_2
    //   434: iand
    //   435: ifne -> 455
    //   438: fload #9
    //   440: aload #15
    //   442: iload #20
    //   444: invokevirtual get : (I)F
    //   447: fsub
    //   448: fconst_2
    //   449: fdiv
    //   450: fstore #6
    //   452: goto -> 422
    //   455: fload_2
    //   456: fstore #6
    //   458: fload #12
    //   460: fstore #10
    //   462: iload #20
    //   464: ifle -> 477
    //   467: fload #12
    //   469: fload #8
    //   471: fadd
    //   472: fload #21
    //   474: fadd
    //   475: fstore #10
    //   477: aload #15
    //   479: iload #20
    //   481: iconst_1
    //   482: iadd
    //   483: invokevirtual get : (I)F
    //   486: fstore #21
    //   488: iinc #20, 2
    //   491: fload #10
    //   493: fstore #12
    //   495: fload #6
    //   497: fstore #10
    //   499: fload #7
    //   501: fconst_0
    //   502: fcmpl
    //   503: ifle -> 513
    //   506: fload #21
    //   508: fload #7
    //   510: fmul
    //   511: fstore #11
    //   513: aload_1
    //   514: ifnull -> 568
    //   517: fload #11
    //   519: aload_1
    //   520: invokeinterface getMinWidth : ()F
    //   525: invokestatic max : (FF)F
    //   528: fstore #25
    //   530: aload_1
    //   531: invokeinterface getMaxWidth : ()F
    //   536: fstore #6
    //   538: fload #25
    //   540: fstore #11
    //   542: fload #6
    //   544: fconst_0
    //   545: fcmpl
    //   546: ifle -> 568
    //   549: fload #25
    //   551: fstore #11
    //   553: fload #25
    //   555: fload #6
    //   557: fcmpl
    //   558: ifle -> 568
    //   561: fload #6
    //   563: fstore #11
    //   565: goto -> 568
    //   568: iload #14
    //   570: bipush #16
    //   572: iand
    //   573: ifeq -> 589
    //   576: fload #12
    //   578: fload #21
    //   580: fload #11
    //   582: fsub
    //   583: fadd
    //   584: fstore #6
    //   586: goto -> 616
    //   589: iload #14
    //   591: bipush #8
    //   593: iand
    //   594: ifne -> 612
    //   597: fload #12
    //   599: fload #21
    //   601: fload #11
    //   603: fsub
    //   604: fconst_2
    //   605: fdiv
    //   606: fadd
    //   607: fstore #6
    //   609: goto -> 616
    //   612: fload #12
    //   614: fstore #6
    //   616: fload #10
    //   618: fload #24
    //   620: fload #5
    //   622: fadd
    //   623: fsub
    //   624: fstore #10
    //   626: iload #4
    //   628: ifeq -> 663
    //   631: aload #22
    //   633: fload #6
    //   635: invokestatic round : (F)I
    //   638: i2f
    //   639: fload #10
    //   641: invokestatic round : (F)I
    //   644: i2f
    //   645: fload #11
    //   647: invokestatic round : (F)I
    //   650: i2f
    //   651: fload #24
    //   653: invokestatic round : (F)I
    //   656: i2f
    //   657: invokevirtual setBounds : (FFFF)V
    //   660: goto -> 676
    //   663: aload #22
    //   665: fload #6
    //   667: fload #10
    //   669: fload #11
    //   671: fload #24
    //   673: invokevirtual setBounds : (FFFF)V
    //   676: aload_1
    //   677: ifnull -> 686
    //   680: aload_1
    //   681: invokeinterface validate : ()V
    //   686: iload_3
    //   687: iload #19
    //   689: iadd
    //   690: istore_3
    //   691: fload #10
    //   693: fstore #6
    //   695: goto -> 259
    //   698: return }
  
  public VerticalGroup align(int paramInt) {
    this.align = paramInt;
    return this;
  }
  
  public VerticalGroup bottom() {
    this.align |= 0x4;
    this.align &= 0xFFFFFFFD;
    return this;
  }
  
  public VerticalGroup center() {
    this.align = 1;
    return this;
  }
  
  public VerticalGroup columnAlign(int paramInt) {
    this.columnAlign = paramInt;
    return this;
  }
  
  public VerticalGroup columnBottom() {
    this.columnAlign |= 0x4;
    this.columnAlign &= 0xFFFFFFFD;
    return this;
  }
  
  public VerticalGroup columnCenter() {
    this.columnAlign = 1;
    return this;
  }
  
  public VerticalGroup columnLeft() {
    this.columnAlign |= 0x8;
    this.columnAlign &= 0xFFFFFFEF;
    return this;
  }
  
  public VerticalGroup columnRight() {
    this.columnAlign |= 0x10;
    this.columnAlign &= 0xFFFFFFF7;
    return this;
  }
  
  public VerticalGroup columnTop() {
    this.columnAlign |= 0x2;
    this.columnAlign &= 0xFFFFFFFB;
    return this;
  }
  
  protected void drawDebugBounds(ShapeRenderer paramShapeRenderer) {
    super.drawDebugBounds(paramShapeRenderer);
    if (!getDebug())
      return; 
    paramShapeRenderer.set(ShapeRenderer.ShapeType.Line);
    if (getStage() != null)
      paramShapeRenderer.setColor(getStage().getDebugColor()); 
    paramShapeRenderer.rect(getX() + this.padLeft, getY() + this.padBottom, getOriginX(), getOriginY(), getWidth() - this.padLeft - this.padRight, getHeight() - this.padBottom - this.padTop, getScaleX(), getScaleY(), getRotation());
  }
  
  public VerticalGroup expand() {
    this.expand = true;
    return this;
  }
  
  public VerticalGroup expand(boolean paramBoolean) {
    this.expand = paramBoolean;
    return this;
  }
  
  public VerticalGroup fill() {
    this.fill = 1.0F;
    return this;
  }
  
  public VerticalGroup fill(float paramFloat) {
    this.fill = paramFloat;
    return this;
  }
  
  public int getAlign() { return this.align; }
  
  public boolean getExpand() { return this.expand; }
  
  public float getFill() { return this.fill; }
  
  public float getPadBottom() { return this.padBottom; }
  
  public float getPadLeft() { return this.padLeft; }
  
  public float getPadRight() { return this.padRight; }
  
  public float getPadTop() { return this.padTop; }
  
  public float getPrefHeight() {
    if (this.wrap)
      return 0.0F; 
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefHeight;
  }
  
  public float getPrefWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefWidth;
  }
  
  public boolean getReverse() { return this.reverse; }
  
  public float getSpace() { return this.space; }
  
  public boolean getWrap() { return this.wrap; }
  
  public float getWrapSpace() { return this.wrapSpace; }
  
  public VerticalGroup grow() {
    this.expand = true;
    this.fill = 1.0F;
    return this;
  }
  
  public void invalidate() {
    super.invalidate();
    this.sizeInvalid = true;
  }
  
  public void layout() { // Byte code:
    //   0: aload_0
    //   1: getfield sizeInvalid : Z
    //   4: ifeq -> 11
    //   7: aload_0
    //   8: invokespecial computeSize : ()V
    //   11: aload_0
    //   12: getfield wrap : Z
    //   15: ifeq -> 23
    //   18: aload_0
    //   19: invokespecial layoutWrapped : ()V
    //   22: return
    //   23: aload_0
    //   24: getfield round : Z
    //   27: istore_1
    //   28: aload_0
    //   29: getfield align : I
    //   32: istore_2
    //   33: aload_0
    //   34: getfield space : F
    //   37: fstore_3
    //   38: aload_0
    //   39: getfield padLeft : F
    //   42: fstore #4
    //   44: aload_0
    //   45: getfield fill : F
    //   48: fstore #5
    //   50: aload_0
    //   51: getfield expand : Z
    //   54: ifeq -> 66
    //   57: aload_0
    //   58: invokevirtual getWidth : ()F
    //   61: fstore #6
    //   63: goto -> 72
    //   66: aload_0
    //   67: getfield prefWidth : F
    //   70: fstore #6
    //   72: fload #6
    //   74: fload #4
    //   76: fsub
    //   77: aload_0
    //   78: getfield padRight : F
    //   81: fsub
    //   82: fstore #7
    //   84: aload_0
    //   85: getfield prefHeight : F
    //   88: aload_0
    //   89: getfield padTop : F
    //   92: fsub
    //   93: fload_3
    //   94: fadd
    //   95: fstore #8
    //   97: iload_2
    //   98: iconst_2
    //   99: iand
    //   100: ifeq -> 124
    //   103: aload_0
    //   104: invokevirtual getHeight : ()F
    //   107: aload_0
    //   108: getfield prefHeight : F
    //   111: fsub
    //   112: fstore #6
    //   114: fload #8
    //   116: fload #6
    //   118: fadd
    //   119: fstore #9
    //   121: goto -> 150
    //   124: fload #8
    //   126: fstore #9
    //   128: iload_2
    //   129: iconst_4
    //   130: iand
    //   131: ifne -> 150
    //   134: aload_0
    //   135: invokevirtual getHeight : ()F
    //   138: aload_0
    //   139: getfield prefHeight : F
    //   142: fsub
    //   143: fconst_2
    //   144: fdiv
    //   145: fstore #6
    //   147: goto -> 114
    //   150: iload_2
    //   151: bipush #8
    //   153: iand
    //   154: ifeq -> 164
    //   157: fload #4
    //   159: fstore #6
    //   161: goto -> 210
    //   164: iload_2
    //   165: bipush #16
    //   167: iand
    //   168: ifeq -> 188
    //   171: aload_0
    //   172: invokevirtual getWidth : ()F
    //   175: aload_0
    //   176: getfield padRight : F
    //   179: fsub
    //   180: fload #7
    //   182: fsub
    //   183: fstore #6
    //   185: goto -> 210
    //   188: fload #4
    //   190: aload_0
    //   191: invokevirtual getWidth : ()F
    //   194: fload #4
    //   196: fsub
    //   197: aload_0
    //   198: getfield padRight : F
    //   201: fsub
    //   202: fload #7
    //   204: fsub
    //   205: fconst_2
    //   206: fdiv
    //   207: fadd
    //   208: fstore #6
    //   210: aload_0
    //   211: getfield columnAlign : I
    //   214: istore #10
    //   216: aload_0
    //   217: invokevirtual getChildren : ()Lcom/badlogic/gdx/utils/SnapshotArray;
    //   220: astore #11
    //   222: iconst_0
    //   223: istore_2
    //   224: aload #11
    //   226: getfield size : I
    //   229: istore #12
    //   231: aload_0
    //   232: getfield reverse : Z
    //   235: istore #13
    //   237: iconst_m1
    //   238: istore #14
    //   240: iload #13
    //   242: ifeq -> 260
    //   245: iload #12
    //   247: iconst_1
    //   248: isub
    //   249: istore_2
    //   250: iconst_m1
    //   251: istore #12
    //   253: fload #9
    //   255: fstore #15
    //   257: goto -> 267
    //   260: iconst_1
    //   261: istore #14
    //   263: fload #9
    //   265: fstore #15
    //   267: iload_2
    //   268: iload #12
    //   270: if_icmpeq -> 540
    //   273: aload #11
    //   275: iload_2
    //   276: invokevirtual get : (I)Ljava/lang/Object;
    //   279: checkcast com/badlogic/gdx/scenes/scene2d/Actor
    //   282: astore #16
    //   284: aconst_null
    //   285: astore #17
    //   287: aload #16
    //   289: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   292: ifeq -> 323
    //   295: aload #16
    //   297: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   300: astore #17
    //   302: aload #17
    //   304: invokeinterface getPrefWidth : ()F
    //   309: fstore #4
    //   311: aload #17
    //   313: invokeinterface getPrefHeight : ()F
    //   318: fstore #9
    //   320: goto -> 337
    //   323: aload #16
    //   325: invokevirtual getWidth : ()F
    //   328: fstore #4
    //   330: aload #16
    //   332: invokevirtual getHeight : ()F
    //   335: fstore #9
    //   337: fload #4
    //   339: fstore #8
    //   341: fload #5
    //   343: fconst_0
    //   344: fcmpl
    //   345: ifle -> 355
    //   348: fload #7
    //   350: fload #5
    //   352: fmul
    //   353: fstore #8
    //   355: fload #8
    //   357: fstore #4
    //   359: aload #17
    //   361: ifnull -> 414
    //   364: fload #8
    //   366: aload #17
    //   368: invokeinterface getMinWidth : ()F
    //   373: invokestatic max : (FF)F
    //   376: fstore #18
    //   378: aload #17
    //   380: invokeinterface getMaxWidth : ()F
    //   385: fstore #8
    //   387: fload #18
    //   389: fstore #4
    //   391: fload #8
    //   393: fconst_0
    //   394: fcmpl
    //   395: ifle -> 414
    //   398: fload #18
    //   400: fstore #4
    //   402: fload #18
    //   404: fload #8
    //   406: fcmpl
    //   407: ifle -> 414
    //   410: fload #8
    //   412: fstore #4
    //   414: iload #10
    //   416: bipush #16
    //   418: iand
    //   419: ifeq -> 435
    //   422: fload #7
    //   424: fload #4
    //   426: fsub
    //   427: fload #6
    //   429: fadd
    //   430: fstore #8
    //   432: goto -> 462
    //   435: iload #10
    //   437: bipush #8
    //   439: iand
    //   440: ifne -> 458
    //   443: fload #7
    //   445: fload #4
    //   447: fsub
    //   448: fconst_2
    //   449: fdiv
    //   450: fload #6
    //   452: fadd
    //   453: fstore #8
    //   455: goto -> 432
    //   458: fload #6
    //   460: fstore #8
    //   462: fload #15
    //   464: fload #9
    //   466: fload_3
    //   467: fadd
    //   468: fsub
    //   469: fstore #15
    //   471: iload_1
    //   472: ifeq -> 507
    //   475: aload #16
    //   477: fload #8
    //   479: invokestatic round : (F)I
    //   482: i2f
    //   483: fload #15
    //   485: invokestatic round : (F)I
    //   488: i2f
    //   489: fload #4
    //   491: invokestatic round : (F)I
    //   494: i2f
    //   495: fload #9
    //   497: invokestatic round : (F)I
    //   500: i2f
    //   501: invokevirtual setBounds : (FFFF)V
    //   504: goto -> 520
    //   507: aload #16
    //   509: fload #8
    //   511: fload #15
    //   513: fload #4
    //   515: fload #9
    //   517: invokevirtual setBounds : (FFFF)V
    //   520: aload #17
    //   522: ifnull -> 532
    //   525: aload #17
    //   527: invokeinterface validate : ()V
    //   532: iload_2
    //   533: iload #14
    //   535: iadd
    //   536: istore_2
    //   537: goto -> 267
    //   540: return }
  
  public VerticalGroup left() {
    this.align |= 0x8;
    this.align &= 0xFFFFFFEF;
    return this;
  }
  
  public VerticalGroup pad(float paramFloat) {
    this.padTop = paramFloat;
    this.padLeft = paramFloat;
    this.padBottom = paramFloat;
    this.padRight = paramFloat;
    return this;
  }
  
  public VerticalGroup pad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.padTop = paramFloat1;
    this.padLeft = paramFloat2;
    this.padBottom = paramFloat3;
    this.padRight = paramFloat4;
    return this;
  }
  
  public VerticalGroup padBottom(float paramFloat) {
    this.padBottom = paramFloat;
    return this;
  }
  
  public VerticalGroup padLeft(float paramFloat) {
    this.padLeft = paramFloat;
    return this;
  }
  
  public VerticalGroup padRight(float paramFloat) {
    this.padRight = paramFloat;
    return this;
  }
  
  public VerticalGroup padTop(float paramFloat) {
    this.padTop = paramFloat;
    return this;
  }
  
  public VerticalGroup reverse() {
    this.reverse = true;
    return this;
  }
  
  public VerticalGroup reverse(boolean paramBoolean) {
    this.reverse = paramBoolean;
    return this;
  }
  
  public VerticalGroup right() {
    this.align |= 0x10;
    this.align &= 0xFFFFFFF7;
    return this;
  }
  
  public void setRound(boolean paramBoolean) { this.round = paramBoolean; }
  
  public VerticalGroup space(float paramFloat) {
    this.space = paramFloat;
    return this;
  }
  
  public VerticalGroup top() {
    this.align |= 0x2;
    this.align &= 0xFFFFFFFB;
    return this;
  }
  
  public VerticalGroup wrap() {
    this.wrap = true;
    return this;
  }
  
  public VerticalGroup wrap(boolean paramBoolean) {
    this.wrap = paramBoolean;
    return this;
  }
  
  public VerticalGroup wrapSpace(float paramFloat) {
    this.wrapSpace = paramFloat;
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/VerticalGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */