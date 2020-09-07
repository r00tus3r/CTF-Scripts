package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.SnapshotArray;

public class HorizontalGroup extends WidgetGroup {
  private int align = 8;
  
  private boolean expand;
  
  private float fill;
  
  private float lastPrefHeight;
  
  private float padBottom;
  
  private float padLeft;
  
  private float padRight;
  
  private float padTop;
  
  private float prefHeight;
  
  private float prefWidth;
  
  private boolean reverse;
  
  private boolean round = true;
  
  private int rowAlign;
  
  private FloatArray rowSizes;
  
  private boolean sizeInvalid = true;
  
  private float space;
  
  private boolean wrap;
  
  private float wrapSpace;
  
  public HorizontalGroup() { setTouchable(Touchable.childrenOnly); }
  
  private void computeSize() {
    int i = 0;
    int j = 0;
    this.sizeInvalid = false;
    SnapshotArray snapshotArray = getChildren();
    int k = snapshotArray.size;
    this.prefHeight = 0.0F;
    if (this.wrap) {
      float f7;
      float f6;
      this.prefWidth = 0.0F;
      FloatArray floatArray = this.rowSizes;
      if (floatArray == null) {
        this.rowSizes = new FloatArray();
      } else {
        floatArray.clear();
      } 
      floatArray = this.rowSizes;
      float f1 = this.space;
      float f2 = this.wrapSpace;
      float f3 = this.padLeft + this.padRight;
      float f4 = getWidth() - f3;
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
        float f9;
        float f8;
        Layout layout = (Actor)snapshotArray.get(j);
        if (layout instanceof Layout) {
          layout = (Layout)layout;
          f8 = layout.getPrefWidth();
          f9 = f8;
          if (f8 > f4)
            f9 = Math.max(f4, layout.getMinWidth()); 
          f8 = layout.getPrefHeight();
        } else {
          f9 = layout.getWidth();
          f8 = layout.getHeight();
        } 
        if (f5 > 0.0F) {
          f10 = f1;
        } else {
          f10 = 0.0F;
        } 
        float f10 = f9 + f10;
        if (f5 + f10 > f4 && f5 > 0.0F) {
          floatArray.add(f5);
          floatArray.add(f6);
          this.prefWidth = Math.max(this.prefWidth, f5 + f3);
          f5 = f7;
          if (f7 > 0.0F)
            f5 = f7 + f2; 
          f7 = f5 + f6;
          f5 = 0.0F;
          f6 = 0.0F;
        } else {
          f9 = f10;
        } 
        f5 += f9;
        f6 = Math.max(f6, f8);
        j += i;
      } 
      floatArray.add(f5);
      floatArray.add(f6);
      this.prefWidth = Math.max(this.prefWidth, f5 + f3);
      float f5 = f7;
      if (f7 > 0.0F)
        f5 = f7 + f2; 
      this.prefHeight = Math.max(this.prefHeight, f5 + f6);
    } else {
      this.prefWidth = this.padLeft + this.padRight + this.space * (k - 1);
      for (j = i; j < k; j++) {
        Layout layout = (Actor)snapshotArray.get(j);
        if (layout instanceof Layout) {
          layout = (Layout)layout;
          this.prefWidth += layout.getPrefWidth();
          this.prefHeight = Math.max(this.prefHeight, layout.getPrefHeight());
        } else {
          this.prefWidth += layout.getWidth();
          this.prefHeight = Math.max(this.prefHeight, layout.getHeight());
        } 
      } 
    } 
    this.prefHeight += this.padTop + this.padBottom;
    if (this.round) {
      this.prefWidth = Math.round(this.prefWidth);
      this.prefHeight = Math.round(this.prefHeight);
    } 
  }
  
  private void layoutWrapped() { // Byte code:
    //   0: aload_0
    //   1: invokevirtual getPrefHeight : ()F
    //   4: fstore_1
    //   5: fload_1
    //   6: aload_0
    //   7: getfield lastPrefHeight : F
    //   10: fcmpl
    //   11: ifeq -> 23
    //   14: aload_0
    //   15: fload_1
    //   16: putfield lastPrefHeight : F
    //   19: aload_0
    //   20: invokevirtual invalidateHierarchy : ()V
    //   23: aload_0
    //   24: getfield align : I
    //   27: istore_2
    //   28: aload_0
    //   29: getfield round : Z
    //   32: istore_3
    //   33: aload_0
    //   34: getfield space : F
    //   37: fstore #4
    //   39: aload_0
    //   40: getfield padBottom : F
    //   43: fstore #5
    //   45: aload_0
    //   46: getfield fill : F
    //   49: fstore #6
    //   51: aload_0
    //   52: getfield wrapSpace : F
    //   55: fstore #7
    //   57: aload_0
    //   58: getfield prefWidth : F
    //   61: aload_0
    //   62: getfield padLeft : F
    //   65: fsub
    //   66: aload_0
    //   67: getfield padRight : F
    //   70: fsub
    //   71: fstore #8
    //   73: fload_1
    //   74: aload_0
    //   75: getfield padTop : F
    //   78: fsub
    //   79: fstore #9
    //   81: aload_0
    //   82: invokevirtual getWidth : ()F
    //   85: fstore #10
    //   87: aload_0
    //   88: getfield padLeft : F
    //   91: fstore #11
    //   93: iload_2
    //   94: iconst_2
    //   95: iand
    //   96: ifeq -> 115
    //   99: aload_0
    //   100: invokevirtual getHeight : ()F
    //   103: fload_1
    //   104: fsub
    //   105: fstore_1
    //   106: fload #9
    //   108: fload_1
    //   109: fadd
    //   110: fstore #5
    //   112: goto -> 137
    //   115: fload #9
    //   117: fstore #5
    //   119: iload_2
    //   120: iconst_4
    //   121: iand
    //   122: ifne -> 137
    //   125: aload_0
    //   126: invokevirtual getHeight : ()F
    //   129: fload_1
    //   130: fsub
    //   131: fconst_2
    //   132: fdiv
    //   133: fstore_1
    //   134: goto -> 106
    //   137: iload_2
    //   138: bipush #16
    //   140: iand
    //   141: ifeq -> 160
    //   144: fload #10
    //   146: aload_0
    //   147: getfield prefWidth : F
    //   150: fsub
    //   151: fstore_1
    //   152: fload #11
    //   154: fload_1
    //   155: fadd
    //   156: fstore_1
    //   157: goto -> 183
    //   160: fload #11
    //   162: fstore_1
    //   163: iload_2
    //   164: bipush #8
    //   166: iand
    //   167: ifne -> 183
    //   170: fload #10
    //   172: aload_0
    //   173: getfield prefWidth : F
    //   176: fsub
    //   177: fconst_2
    //   178: fdiv
    //   179: fstore_1
    //   180: goto -> 152
    //   183: fload #10
    //   185: aload_0
    //   186: getfield padRight : F
    //   189: fsub
    //   190: fstore #12
    //   192: aload_0
    //   193: getfield rowAlign : I
    //   196: istore #13
    //   198: aload_0
    //   199: getfield rowSizes : Lcom/badlogic/gdx/utils/FloatArray;
    //   202: astore #14
    //   204: aload_0
    //   205: invokevirtual getChildren : ()Lcom/badlogic/gdx/utils/SnapshotArray;
    //   208: astore #15
    //   210: aload #15
    //   212: getfield size : I
    //   215: istore_2
    //   216: aload_0
    //   217: getfield reverse : Z
    //   220: istore #16
    //   222: iconst_m1
    //   223: istore #17
    //   225: iload #16
    //   227: ifeq -> 239
    //   230: iinc #2, -1
    //   233: iconst_m1
    //   234: istore #18
    //   236: goto -> 247
    //   239: iload_2
    //   240: istore #17
    //   242: iconst_0
    //   243: istore_2
    //   244: iconst_1
    //   245: istore #18
    //   247: fconst_0
    //   248: fstore #10
    //   250: iconst_0
    //   251: istore #19
    //   253: fconst_0
    //   254: fstore #9
    //   256: iload_2
    //   257: iload #17
    //   259: if_icmpeq -> 685
    //   262: aload #15
    //   264: iload_2
    //   265: invokevirtual get : (I)Ljava/lang/Object;
    //   268: checkcast com/badlogic/gdx/scenes/scene2d/Actor
    //   271: astore #20
    //   273: aconst_null
    //   274: astore #21
    //   276: aload #20
    //   278: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   281: ifeq -> 346
    //   284: aload #20
    //   286: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   289: astore #21
    //   291: aload #21
    //   293: invokeinterface getPrefWidth : ()F
    //   298: fstore #22
    //   300: fload #22
    //   302: fstore #11
    //   304: fload #22
    //   306: fload #12
    //   308: fcmpl
    //   309: ifle -> 326
    //   312: fload #12
    //   314: aload #21
    //   316: invokeinterface getMinWidth : ()F
    //   321: invokestatic max : (FF)F
    //   324: fstore #11
    //   326: aload #21
    //   328: invokeinterface getPrefHeight : ()F
    //   333: fstore #23
    //   335: fload #11
    //   337: fstore #22
    //   339: fload #23
    //   341: fstore #11
    //   343: goto -> 360
    //   346: aload #20
    //   348: invokevirtual getWidth : ()F
    //   351: fstore #22
    //   353: aload #20
    //   355: invokevirtual getHeight : ()F
    //   358: fstore #11
    //   360: fload #10
    //   362: fload #22
    //   364: fadd
    //   365: fload #12
    //   367: fcmpl
    //   368: ifgt -> 386
    //   371: iload #19
    //   373: ifne -> 379
    //   376: goto -> 386
    //   379: fload #10
    //   381: fstore #23
    //   383: goto -> 488
    //   386: iload #13
    //   388: bipush #16
    //   390: iand
    //   391: ifeq -> 415
    //   394: fload #8
    //   396: aload #14
    //   398: iload #19
    //   400: invokevirtual get : (I)F
    //   403: fsub
    //   404: fstore #9
    //   406: fload #9
    //   408: fload_1
    //   409: fadd
    //   410: fstore #9
    //   412: goto -> 443
    //   415: iload #13
    //   417: bipush #8
    //   419: iand
    //   420: ifne -> 440
    //   423: fload #8
    //   425: aload #14
    //   427: iload #19
    //   429: invokevirtual get : (I)F
    //   432: fsub
    //   433: fconst_2
    //   434: fdiv
    //   435: fstore #9
    //   437: goto -> 406
    //   440: fload_1
    //   441: fstore #9
    //   443: aload #14
    //   445: iload #19
    //   447: iconst_1
    //   448: iadd
    //   449: invokevirtual get : (I)F
    //   452: fstore #24
    //   454: fload #5
    //   456: fstore #10
    //   458: iload #19
    //   460: ifle -> 470
    //   463: fload #5
    //   465: fload #7
    //   467: fsub
    //   468: fstore #10
    //   470: fload #10
    //   472: fload #24
    //   474: fsub
    //   475: fstore #5
    //   477: iinc #19, 2
    //   480: fload #9
    //   482: fstore #23
    //   484: fload #24
    //   486: fstore #9
    //   488: fload #6
    //   490: fconst_0
    //   491: fcmpl
    //   492: ifle -> 502
    //   495: fload #9
    //   497: fload #6
    //   499: fmul
    //   500: fstore #11
    //   502: aload #21
    //   504: ifnull -> 560
    //   507: fload #11
    //   509: aload #21
    //   511: invokeinterface getMinHeight : ()F
    //   516: invokestatic max : (FF)F
    //   519: fstore #10
    //   521: aload #21
    //   523: invokeinterface getMaxHeight : ()F
    //   528: fstore #24
    //   530: fload #10
    //   532: fstore #11
    //   534: fload #24
    //   536: fconst_0
    //   537: fcmpl
    //   538: ifle -> 560
    //   541: fload #10
    //   543: fstore #11
    //   545: fload #10
    //   547: fload #24
    //   549: fcmpl
    //   550: ifle -> 560
    //   553: fload #24
    //   555: fstore #11
    //   557: goto -> 560
    //   560: iload #13
    //   562: iconst_2
    //   563: iand
    //   564: ifeq -> 580
    //   567: fload #5
    //   569: fload #9
    //   571: fload #11
    //   573: fsub
    //   574: fadd
    //   575: fstore #10
    //   577: goto -> 606
    //   580: iload #13
    //   582: iconst_4
    //   583: iand
    //   584: ifne -> 602
    //   587: fload #5
    //   589: fload #9
    //   591: fload #11
    //   593: fsub
    //   594: fconst_2
    //   595: fdiv
    //   596: fadd
    //   597: fstore #10
    //   599: goto -> 606
    //   602: fload #5
    //   604: fstore #10
    //   606: iload_3
    //   607: ifeq -> 642
    //   610: aload #20
    //   612: fload #23
    //   614: invokestatic round : (F)I
    //   617: i2f
    //   618: fload #10
    //   620: invokestatic round : (F)I
    //   623: i2f
    //   624: fload #22
    //   626: invokestatic round : (F)I
    //   629: i2f
    //   630: fload #11
    //   632: invokestatic round : (F)I
    //   635: i2f
    //   636: invokevirtual setBounds : (FFFF)V
    //   639: goto -> 655
    //   642: aload #20
    //   644: fload #23
    //   646: fload #10
    //   648: fload #22
    //   650: fload #11
    //   652: invokevirtual setBounds : (FFFF)V
    //   655: fload #23
    //   657: fload #22
    //   659: fload #4
    //   661: fadd
    //   662: fadd
    //   663: fstore #10
    //   665: aload #21
    //   667: ifnull -> 677
    //   670: aload #21
    //   672: invokeinterface validate : ()V
    //   677: iload_2
    //   678: iload #18
    //   680: iadd
    //   681: istore_2
    //   682: goto -> 256
    //   685: return }
  
  public HorizontalGroup align(int paramInt) {
    this.align = paramInt;
    return this;
  }
  
  public HorizontalGroup bottom() {
    this.align |= 0x4;
    this.align &= 0xFFFFFFFD;
    return this;
  }
  
  public HorizontalGroup center() {
    this.align = 1;
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
  
  public HorizontalGroup expand() {
    this.expand = true;
    return this;
  }
  
  public HorizontalGroup expand(boolean paramBoolean) {
    this.expand = paramBoolean;
    return this;
  }
  
  public HorizontalGroup fill() {
    this.fill = 1.0F;
    return this;
  }
  
  public HorizontalGroup fill(float paramFloat) {
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
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefHeight;
  }
  
  public float getPrefWidth() {
    if (this.wrap)
      return 0.0F; 
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefWidth;
  }
  
  public boolean getReverse() { return this.reverse; }
  
  public float getSpace() { return this.space; }
  
  public boolean getWrap() { return this.wrap; }
  
  public float getWrapSpace() { return this.wrapSpace; }
  
  public HorizontalGroup grow() {
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
    //   39: getfield padBottom : F
    //   42: fstore #4
    //   44: aload_0
    //   45: getfield fill : F
    //   48: fstore #5
    //   50: aload_0
    //   51: getfield expand : Z
    //   54: ifeq -> 66
    //   57: aload_0
    //   58: invokevirtual getHeight : ()F
    //   61: fstore #6
    //   63: goto -> 72
    //   66: aload_0
    //   67: getfield prefHeight : F
    //   70: fstore #6
    //   72: fload #6
    //   74: aload_0
    //   75: getfield padTop : F
    //   78: fsub
    //   79: fload #4
    //   81: fsub
    //   82: fstore #7
    //   84: aload_0
    //   85: getfield padLeft : F
    //   88: fstore #8
    //   90: iload_2
    //   91: bipush #16
    //   93: iand
    //   94: ifeq -> 118
    //   97: aload_0
    //   98: invokevirtual getWidth : ()F
    //   101: aload_0
    //   102: getfield prefWidth : F
    //   105: fsub
    //   106: fstore #6
    //   108: fload #8
    //   110: fload #6
    //   112: fadd
    //   113: fstore #9
    //   115: goto -> 145
    //   118: fload #8
    //   120: fstore #9
    //   122: iload_2
    //   123: bipush #8
    //   125: iand
    //   126: ifne -> 145
    //   129: aload_0
    //   130: invokevirtual getWidth : ()F
    //   133: aload_0
    //   134: getfield prefWidth : F
    //   137: fsub
    //   138: fconst_2
    //   139: fdiv
    //   140: fstore #6
    //   142: goto -> 108
    //   145: iload_2
    //   146: iconst_4
    //   147: iand
    //   148: ifeq -> 158
    //   151: fload #4
    //   153: fstore #6
    //   155: goto -> 203
    //   158: iload_2
    //   159: iconst_2
    //   160: iand
    //   161: ifeq -> 181
    //   164: aload_0
    //   165: invokevirtual getHeight : ()F
    //   168: aload_0
    //   169: getfield padTop : F
    //   172: fsub
    //   173: fload #7
    //   175: fsub
    //   176: fstore #6
    //   178: goto -> 203
    //   181: fload #4
    //   183: aload_0
    //   184: invokevirtual getHeight : ()F
    //   187: fload #4
    //   189: fsub
    //   190: aload_0
    //   191: getfield padTop : F
    //   194: fsub
    //   195: fload #7
    //   197: fsub
    //   198: fconst_2
    //   199: fdiv
    //   200: fadd
    //   201: fstore #6
    //   203: aload_0
    //   204: getfield rowAlign : I
    //   207: istore #10
    //   209: aload_0
    //   210: invokevirtual getChildren : ()Lcom/badlogic/gdx/utils/SnapshotArray;
    //   213: astore #11
    //   215: iconst_0
    //   216: istore_2
    //   217: aload #11
    //   219: getfield size : I
    //   222: istore #12
    //   224: aload_0
    //   225: getfield reverse : Z
    //   228: istore #13
    //   230: iconst_m1
    //   231: istore #14
    //   233: iload #13
    //   235: ifeq -> 253
    //   238: iload #12
    //   240: iconst_1
    //   241: isub
    //   242: istore_2
    //   243: iconst_m1
    //   244: istore #12
    //   246: fload #9
    //   248: fstore #8
    //   250: goto -> 260
    //   253: iconst_1
    //   254: istore #14
    //   256: fload #9
    //   258: fstore #8
    //   260: iload_2
    //   261: iload #12
    //   263: if_icmpeq -> 531
    //   266: aload #11
    //   268: iload_2
    //   269: invokevirtual get : (I)Ljava/lang/Object;
    //   272: checkcast com/badlogic/gdx/scenes/scene2d/Actor
    //   275: astore #15
    //   277: aconst_null
    //   278: astore #16
    //   280: aload #15
    //   282: instanceof com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   285: ifeq -> 316
    //   288: aload #15
    //   290: checkcast com/badlogic/gdx/scenes/scene2d/utils/Layout
    //   293: astore #16
    //   295: aload #16
    //   297: invokeinterface getPrefWidth : ()F
    //   302: fstore #17
    //   304: aload #16
    //   306: invokeinterface getPrefHeight : ()F
    //   311: fstore #9
    //   313: goto -> 330
    //   316: aload #15
    //   318: invokevirtual getWidth : ()F
    //   321: fstore #17
    //   323: aload #15
    //   325: invokevirtual getHeight : ()F
    //   328: fstore #9
    //   330: fload #5
    //   332: fconst_0
    //   333: fcmpl
    //   334: ifle -> 344
    //   337: fload #7
    //   339: fload #5
    //   341: fmul
    //   342: fstore #9
    //   344: fload #9
    //   346: fstore #4
    //   348: fload #4
    //   350: fstore #9
    //   352: aload #16
    //   354: ifnull -> 407
    //   357: fload #4
    //   359: aload #16
    //   361: invokeinterface getMinHeight : ()F
    //   366: invokestatic max : (FF)F
    //   369: fstore #18
    //   371: aload #16
    //   373: invokeinterface getMaxHeight : ()F
    //   378: fstore #4
    //   380: fload #18
    //   382: fstore #9
    //   384: fload #4
    //   386: fconst_0
    //   387: fcmpl
    //   388: ifle -> 407
    //   391: fload #18
    //   393: fstore #9
    //   395: fload #18
    //   397: fload #4
    //   399: fcmpl
    //   400: ifle -> 407
    //   403: fload #4
    //   405: fstore #9
    //   407: iload #10
    //   409: iconst_2
    //   410: iand
    //   411: ifeq -> 427
    //   414: fload #7
    //   416: fload #9
    //   418: fsub
    //   419: fload #6
    //   421: fadd
    //   422: fstore #4
    //   424: goto -> 453
    //   427: iload #10
    //   429: iconst_4
    //   430: iand
    //   431: ifne -> 449
    //   434: fload #7
    //   436: fload #9
    //   438: fsub
    //   439: fconst_2
    //   440: fdiv
    //   441: fload #6
    //   443: fadd
    //   444: fstore #4
    //   446: goto -> 453
    //   449: fload #6
    //   451: fstore #4
    //   453: iload_1
    //   454: ifeq -> 489
    //   457: aload #15
    //   459: fload #8
    //   461: invokestatic round : (F)I
    //   464: i2f
    //   465: fload #4
    //   467: invokestatic round : (F)I
    //   470: i2f
    //   471: fload #17
    //   473: invokestatic round : (F)I
    //   476: i2f
    //   477: fload #9
    //   479: invokestatic round : (F)I
    //   482: i2f
    //   483: invokevirtual setBounds : (FFFF)V
    //   486: goto -> 502
    //   489: aload #15
    //   491: fload #8
    //   493: fload #4
    //   495: fload #17
    //   497: fload #9
    //   499: invokevirtual setBounds : (FFFF)V
    //   502: fload #8
    //   504: fload #17
    //   506: fload_3
    //   507: fadd
    //   508: fadd
    //   509: fstore #8
    //   511: aload #16
    //   513: ifnull -> 523
    //   516: aload #16
    //   518: invokeinterface validate : ()V
    //   523: iload_2
    //   524: iload #14
    //   526: iadd
    //   527: istore_2
    //   528: goto -> 260
    //   531: return }
  
  public HorizontalGroup left() {
    this.align |= 0x8;
    this.align &= 0xFFFFFFEF;
    return this;
  }
  
  public HorizontalGroup pad(float paramFloat) {
    this.padTop = paramFloat;
    this.padLeft = paramFloat;
    this.padBottom = paramFloat;
    this.padRight = paramFloat;
    return this;
  }
  
  public HorizontalGroup pad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.padTop = paramFloat1;
    this.padLeft = paramFloat2;
    this.padBottom = paramFloat3;
    this.padRight = paramFloat4;
    return this;
  }
  
  public HorizontalGroup padBottom(float paramFloat) {
    this.padBottom = paramFloat;
    return this;
  }
  
  public HorizontalGroup padLeft(float paramFloat) {
    this.padLeft = paramFloat;
    return this;
  }
  
  public HorizontalGroup padRight(float paramFloat) {
    this.padRight = paramFloat;
    return this;
  }
  
  public HorizontalGroup padTop(float paramFloat) {
    this.padTop = paramFloat;
    return this;
  }
  
  public HorizontalGroup reverse() {
    this.reverse = true;
    return this;
  }
  
  public HorizontalGroup reverse(boolean paramBoolean) {
    this.reverse = paramBoolean;
    return this;
  }
  
  public HorizontalGroup right() {
    this.align |= 0x10;
    this.align &= 0xFFFFFFF7;
    return this;
  }
  
  public HorizontalGroup rowAlign(int paramInt) {
    this.rowAlign = paramInt;
    return this;
  }
  
  public HorizontalGroup rowBottom() {
    this.rowAlign |= 0x4;
    this.rowAlign &= 0xFFFFFFFD;
    return this;
  }
  
  public HorizontalGroup rowCenter() {
    this.rowAlign = 1;
    return this;
  }
  
  public HorizontalGroup rowLeft() {
    this.rowAlign |= 0x8;
    this.rowAlign &= 0xFFFFFFEF;
    return this;
  }
  
  public HorizontalGroup rowRight() {
    this.rowAlign |= 0x10;
    this.rowAlign &= 0xFFFFFFF7;
    return this;
  }
  
  public HorizontalGroup rowTop() {
    this.rowAlign |= 0x2;
    this.rowAlign &= 0xFFFFFFFB;
    return this;
  }
  
  public void setRound(boolean paramBoolean) { this.round = paramBoolean; }
  
  public HorizontalGroup space(float paramFloat) {
    this.space = paramFloat;
    return this;
  }
  
  public HorizontalGroup top() {
    this.align |= 0x2;
    this.align &= 0xFFFFFFFB;
    return this;
  }
  
  public HorizontalGroup wrap() {
    this.wrap = true;
    return this;
  }
  
  public HorizontalGroup wrap(boolean paramBoolean) {
    this.wrap = paramBoolean;
    return this;
  }
  
  public HorizontalGroup wrapSpace(float paramFloat) {
    this.wrapSpace = paramFloat;
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */