package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.SnapshotArray;

public class Table extends WidgetGroup {
  public static Value backgroundBottom;
  
  public static Value backgroundLeft;
  
  public static Value backgroundRight;
  
  public static Value backgroundTop;
  
  static final Pool<Cell> cellPool;
  
  private static float[] columnWeightedWidth;
  
  public static Color debugActorColor;
  
  public static Color debugCellColor;
  
  public static Color debugTableColor = new Color(0.0F, 0.0F, 1.0F, 1.0F);
  
  private static float[] rowWeightedHeight;
  
  int align = 1;
  
  Drawable background;
  
  private final Cell cellDefaults;
  
  private final Array<Cell> cells = new Array(4);
  
  private boolean clip;
  
  private final Array<Cell> columnDefaults = new Array(2);
  
  private float[] columnMinWidth;
  
  private float[] columnPrefWidth;
  
  private float[] columnWidth;
  
  private int columns;
  
  Debug debug = Debug.none;
  
  Array<DebugRect> debugRects;
  
  private float[] expandHeight;
  
  private float[] expandWidth;
  
  private boolean implicitEndRow;
  
  Value padBottom = backgroundBottom;
  
  Value padLeft = backgroundLeft;
  
  Value padRight = backgroundRight;
  
  Value padTop = backgroundTop;
  
  boolean round = true;
  
  private Cell rowDefaults;
  
  private float[] rowHeight;
  
  private float[] rowMinHeight;
  
  private float[] rowPrefHeight;
  
  private int rows;
  
  private boolean sizeInvalid = true;
  
  private Skin skin;
  
  private float tableMinHeight;
  
  private float tableMinWidth;
  
  private float tablePrefHeight;
  
  private float tablePrefWidth;
  
  static  {
    debugCellColor = new Color(1.0F, 0.0F, 0.0F, 1.0F);
    debugActorColor = new Color(0.0F, 1.0F, 0.0F, 1.0F);
    cellPool = new Pool<Cell>() {
        protected Cell newObject() { return new Cell(); }
      };
    backgroundTop = new Value() {
        public float get(Actor param1Actor) {
          float f;
          Drawable drawable = ((Table)param1Actor).background;
          if (drawable == null) {
            f = 0.0F;
          } else {
            f = drawable.getTopHeight();
          } 
          return f;
        }
      };
    backgroundLeft = new Value() {
        public float get(Actor param1Actor) {
          float f;
          Drawable drawable = ((Table)param1Actor).background;
          if (drawable == null) {
            f = 0.0F;
          } else {
            f = drawable.getLeftWidth();
          } 
          return f;
        }
      };
    backgroundBottom = new Value() {
        public float get(Actor param1Actor) {
          float f;
          Drawable drawable = ((Table)param1Actor).background;
          if (drawable == null) {
            f = 0.0F;
          } else {
            f = drawable.getBottomHeight();
          } 
          return f;
        }
      };
    backgroundRight = new Value() {
        public float get(Actor param1Actor) {
          float f;
          Drawable drawable = ((Table)param1Actor).background;
          if (drawable == null) {
            f = 0.0F;
          } else {
            f = drawable.getRightWidth();
          } 
          return f;
        }
      };
  }
  
  public Table() { this(null); }
  
  public Table(Skin paramSkin) {
    this.skin = paramSkin;
    this.cellDefaults = obtainCell();
    setTransform(false);
    setTouchable(Touchable.childrenOnly);
  }
  
  private void addDebugRect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, Color paramColor) {
    if (this.debugRects == null)
      this.debugRects = new Array(); 
    DebugRect debugRect = (DebugRect)DebugRect.pool.obtain();
    debugRect.color = paramColor;
    debugRect.set(paramFloat1, getHeight() - paramFloat2 - paramFloat4, paramFloat3, paramFloat4);
    this.debugRects.add(debugRect);
  }
  
  private void clearDebugRects() {
    if (this.debugRects == null)
      return; 
    DebugRect.pool.freeAll(this.debugRects);
    this.debugRects.clear();
  }
  
  private void computeSize() {
    this.sizeInvalid = false;
    Array array = this.cells;
    int i = array.size;
    if (i > 0 && !((Cell)array.peek()).endRow) {
      endRow();
      this.implicitEndRow = true;
    } 
    int j = this.columns;
    int k = this.rows;
    float[] arrayOfFloat1 = ensureSize(this.columnMinWidth, j);
    this.columnMinWidth = arrayOfFloat1;
    float[] arrayOfFloat2 = ensureSize(this.rowMinHeight, k);
    this.rowMinHeight = arrayOfFloat2;
    float[] arrayOfFloat3 = ensureSize(this.columnPrefWidth, j);
    this.columnPrefWidth = arrayOfFloat3;
    float[] arrayOfFloat4 = ensureSize(this.rowPrefHeight, k);
    this.rowPrefHeight = arrayOfFloat4;
    this.columnWidth = ensureSize(this.columnWidth, j);
    this.rowHeight = ensureSize(this.rowHeight, k);
    float[] arrayOfFloat5 = ensureSize(this.expandWidth, j);
    this.expandWidth = arrayOfFloat5;
    float[] arrayOfFloat6 = ensureSize(this.expandHeight, k);
    this.expandHeight = arrayOfFloat6;
    int m = 0;
    float f1;
    for (f1 = 0.0F; m < i; f1 = f6) {
      Cell cell = (Cell)array.get(m);
      int i1 = cell.column;
      int i2 = cell.row;
      int i3 = cell.colspan.intValue();
      Actor actor = cell.actor;
      if (cell.expandY.intValue() != 0 && arrayOfFloat6[i2] == 0.0F)
        arrayOfFloat6[i2] = cell.expandY.intValue(); 
      if (i3 == 1 && cell.expandX.intValue() != 0 && arrayOfFloat5[i1] == 0.0F)
        arrayOfFloat5[i1] = cell.expandX.intValue(); 
      float f5 = cell.padLeft.get(actor);
      if (i1 == 0) {
        f1 = 0.0F;
      } else {
        f1 = Math.max(0.0F, cell.spaceLeft.get(actor) - f1);
      } 
      cell.computedPadLeft = f5 + f1;
      cell.computedPadTop = cell.padTop.get(actor);
      if (cell.cellAboveIndex != -1) {
        Cell cell1 = (Cell)array.get(cell.cellAboveIndex);
        cell.computedPadTop += Math.max(0.0F, cell.spaceTop.get(actor) - cell1.spaceBottom.get(actor));
      } 
      float f6 = cell.spaceRight.get(actor);
      f5 = cell.padRight.get(actor);
      if (i1 + i3 == j) {
        f1 = 0.0F;
      } else {
        f1 = f6;
      } 
      cell.computedPadRight = f5 + f1;
      f5 = cell.padBottom.get(actor);
      if (i2 == k - 1) {
        f1 = 0.0F;
      } else {
        f1 = cell.spaceBottom.get(actor);
      } 
      cell.computedPadBottom = f5 + f1;
      f1 = cell.prefWidth.get(actor);
      float f7 = cell.prefHeight.get(actor);
      float f8 = cell.minWidth.get(actor);
      float f9 = cell.minHeight.get(actor);
      float f10 = cell.maxWidth.get(actor);
      float f11 = cell.maxHeight.get(actor);
      f5 = f1;
      if (f1 < f8)
        f5 = f8; 
      f1 = f7;
      if (f7 < f9)
        f1 = f9; 
      if (f10 > 0.0F && f5 > f10)
        f5 = f10; 
      if (f11 > 0.0F && f1 > f11)
        f1 = f11; 
      if (i3 == 1) {
        f11 = cell.computedPadLeft + cell.computedPadRight;
        arrayOfFloat3[i1] = Math.max(arrayOfFloat3[i1], f5 + f11);
        arrayOfFloat1[i1] = Math.max(arrayOfFloat1[i1], f8 + f11);
      } 
      f5 = cell.computedPadTop + cell.computedPadBottom;
      arrayOfFloat4[i2] = Math.max(arrayOfFloat4[i2], f1 + f5);
      arrayOfFloat2[i2] = Math.max(arrayOfFloat2[i2], f9 + f5);
      m++;
    } 
    int n = 0;
    float f3 = 0.0F;
    float f2 = 0.0F;
    float f4 = 0.0F;
    label133: for (f1 = 0.0F; n < i; f1 = f6) {
      Cell cell = (Cell)array.get(n);
      m = cell.column;
      int i1 = cell.expandX.intValue();
      if (i1 != 0) {
        int i4 = cell.colspan.intValue() + m;
        int i3;
        for (i3 = m; i3 < i4; i3++) {
          if (arrayOfFloat5[i3] != 0.0F)
            continue label133; 
        } 
        int i2 = m;
        i3 = i4;
        while (i2 < i3) {
          arrayOfFloat5[i2] = i1;
          i2++;
        } 
      } 
      float f7 = f3;
      float f5 = f4;
      if (cell.uniformX == Boolean.TRUE) {
        f7 = f3;
        f5 = f4;
        if (cell.colspan.intValue() == 1) {
          f7 = cell.computedPadLeft + cell.computedPadRight;
          f5 = Math.max(f4, arrayOfFloat1[m] - f7);
          f7 = Math.max(f3, arrayOfFloat3[m] - f7);
        } 
      } 
      f4 = f2;
      float f6 = f1;
      if (cell.uniformY == Boolean.TRUE) {
        f4 = cell.computedPadTop + cell.computedPadBottom;
        f6 = Math.max(f1, arrayOfFloat2[cell.row] - f4);
        f4 = Math.max(f2, arrayOfFloat4[cell.row] - f4);
      } 
      n++;
      f3 = f7;
      f2 = f4;
      f4 = f5;
    } 
    if (f3 > 0.0F || f2 > 0.0F)
      for (m = 0; m < i; m++) {
        Cell cell = (Cell)array.get(m);
        if (f3 > 0.0F && cell.uniformX == Boolean.TRUE && cell.colspan.intValue() == 1) {
          float f = cell.computedPadLeft + cell.computedPadRight;
          arrayOfFloat1[cell.column] = f4 + f;
          arrayOfFloat3[cell.column] = f + f3;
        } 
        if (f2 > 0.0F && cell.uniformY == Boolean.TRUE) {
          float f = cell.computedPadTop + cell.computedPadBottom;
          arrayOfFloat2[cell.row] = f1 + f;
          arrayOfFloat4[cell.row] = f + f2;
        } 
      }  
    for (m = 0; m < i; m++) {
      Cell cell = (Cell)array.get(m);
      int i1 = cell.colspan.intValue();
      if (i1 != 1) {
        n = cell.column;
        Actor actor = cell.actor;
        f3 = cell.minWidth.get(actor);
        f2 = cell.prefWidth.get(actor);
        float f = cell.maxWidth.get(actor);
        f1 = f2;
        if (f2 < f3)
          f1 = f3; 
        if (f <= 0.0F || f1 <= f)
          f = f1; 
        f1 = -(cell.computedPadLeft + cell.computedPadRight);
        int i3 = n + i1;
        f4 = f1;
        int i2 = n;
        f2 = 0.0F;
        while (i2 < i3) {
          f1 += arrayOfFloat1[i2];
          f4 += arrayOfFloat3[i2];
          f2 += arrayOfFloat5[i2];
          i2++;
        } 
        f3 = Math.max(0.0F, f3 - f1);
        f = Math.max(0.0F, f - f4);
        while (n < i3) {
          if (f2 == 0.0F) {
            f1 = 1.0F / i1;
          } else {
            f1 = arrayOfFloat5[n] / f2;
          } 
          arrayOfFloat1[n] = arrayOfFloat1[n] + f3 * f1;
          arrayOfFloat3[n] = arrayOfFloat3[n] + f1 * f;
          n++;
        } 
      } 
    } 
    this.tableMinWidth = 0.0F;
    this.tableMinHeight = 0.0F;
    this.tablePrefWidth = 0.0F;
    this.tablePrefHeight = 0.0F;
    for (i = 0; i < j; i++) {
      this.tableMinWidth += arrayOfFloat1[i];
      this.tablePrefWidth += arrayOfFloat3[i];
    } 
    for (j = 0; j < k; j++) {
      this.tableMinHeight += arrayOfFloat2[j];
      this.tablePrefHeight += Math.max(arrayOfFloat2[j], arrayOfFloat4[j]);
    } 
    f2 = this.padLeft.get(this) + this.padRight.get(this);
    f1 = this.padTop.get(this) + this.padBottom.get(this);
    this.tableMinWidth += f2;
    this.tableMinHeight += f1;
    this.tablePrefWidth = Math.max(this.tablePrefWidth + f2, this.tableMinWidth);
    this.tablePrefHeight = Math.max(this.tablePrefHeight + f1, this.tableMinHeight);
  }
  
  private void drawDebugRects(ShapeRenderer paramShapeRenderer) {
    if (this.debugRects != null && getDebug()) {
      float f2;
      paramShapeRenderer.set(ShapeRenderer.ShapeType.Line);
      if (getStage() != null)
        paramShapeRenderer.setColor(getStage().getDebugColor()); 
      boolean bool = isTransform();
      float f1 = 0.0F;
      if (!bool) {
        f1 = getX();
        f2 = getY();
      } else {
        f2 = 0.0F;
      } 
      byte b = 0;
      int i = this.debugRects.size;
      while (b < i) {
        DebugRect debugRect = (DebugRect)this.debugRects.get(b);
        paramShapeRenderer.setColor(debugRect.color);
        paramShapeRenderer.rect(debugRect.x + f1, debugRect.y + f2, debugRect.width, debugRect.height);
        b++;
      } 
    } 
  }
  
  private void endRow() {
    Array array = this.cells;
    int i = array.size - 1;
    int j = 0;
    while (i >= 0) {
      Cell cell = (Cell)array.get(i);
      if (cell.endRow)
        break; 
      j += cell.colspan.intValue();
      i--;
    } 
    this.columns = Math.max(this.columns, j);
    this.rows++;
    ((Cell)array.peek()).endRow = true;
  }
  
  private float[] ensureSize(float[] paramArrayOfFloat, int paramInt) {
    if (paramArrayOfFloat == null || paramArrayOfFloat.length < paramInt)
      return new float[paramInt]; 
    paramInt = 0;
    int i = paramArrayOfFloat.length;
    while (paramInt < i) {
      paramArrayOfFloat[paramInt] = 0.0F;
      paramInt++;
    } 
    return paramArrayOfFloat;
  }
  
  private void layout(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { // Byte code:
    //   0: aload_0
    //   1: getfield cells : Lcom/badlogic/gdx/utils/Array;
    //   4: astore #5
    //   6: aload #5
    //   8: getfield size : I
    //   11: istore #6
    //   13: aload_0
    //   14: getfield sizeInvalid : Z
    //   17: ifeq -> 24
    //   20: aload_0
    //   21: invokespecial computeSize : ()V
    //   24: aload_0
    //   25: getfield padLeft : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   28: aload_0
    //   29: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   32: fstore #7
    //   34: fload #7
    //   36: aload_0
    //   37: getfield padRight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   40: aload_0
    //   41: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   44: fadd
    //   45: fstore #8
    //   47: aload_0
    //   48: getfield padTop : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   51: aload_0
    //   52: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   55: fstore #9
    //   57: fload #9
    //   59: aload_0
    //   60: getfield padBottom : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   63: aload_0
    //   64: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   67: fadd
    //   68: fstore #10
    //   70: aload_0
    //   71: getfield columns : I
    //   74: istore #11
    //   76: aload_0
    //   77: getfield rows : I
    //   80: istore #12
    //   82: aload_0
    //   83: getfield expandWidth : [F
    //   86: astore #13
    //   88: aload_0
    //   89: getfield expandHeight : [F
    //   92: astore #14
    //   94: aload_0
    //   95: getfield columnWidth : [F
    //   98: astore #15
    //   100: aload_0
    //   101: getfield rowHeight : [F
    //   104: astore #16
    //   106: iconst_0
    //   107: istore #17
    //   109: fconst_0
    //   110: fstore #18
    //   112: iload #17
    //   114: iload #11
    //   116: if_icmpge -> 135
    //   119: fload #18
    //   121: aload #13
    //   123: iload #17
    //   125: faload
    //   126: fadd
    //   127: fstore #18
    //   129: iinc #17, 1
    //   132: goto -> 112
    //   135: iconst_0
    //   136: istore #17
    //   138: fconst_0
    //   139: fstore #19
    //   141: iload #17
    //   143: iload #12
    //   145: if_icmpge -> 164
    //   148: fload #19
    //   150: aload #14
    //   152: iload #17
    //   154: faload
    //   155: fadd
    //   156: fstore #19
    //   158: iinc #17, 1
    //   161: goto -> 141
    //   164: aload_0
    //   165: getfield tablePrefWidth : F
    //   168: fstore #20
    //   170: aload_0
    //   171: getfield tableMinWidth : F
    //   174: fstore #21
    //   176: fload #20
    //   178: fload #21
    //   180: fsub
    //   181: fstore #20
    //   183: fload #20
    //   185: fconst_0
    //   186: fcmpl
    //   187: ifne -> 199
    //   190: aload_0
    //   191: getfield columnMinWidth : [F
    //   194: astore #22
    //   196: goto -> 290
    //   199: fload #20
    //   201: fconst_0
    //   202: fload_3
    //   203: fload #21
    //   205: fsub
    //   206: invokestatic max : (FF)F
    //   209: invokestatic min : (FF)F
    //   212: fstore #21
    //   214: aload_0
    //   215: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table.columnWeightedWidth : [F
    //   218: iload #11
    //   220: invokespecial ensureSize : ([FI)[F
    //   223: astore #22
    //   225: aload #22
    //   227: putstatic com/badlogic/gdx/scenes/scene2d/ui/Table.columnWeightedWidth : [F
    //   230: aload_0
    //   231: getfield columnMinWidth : [F
    //   234: astore #23
    //   236: aload_0
    //   237: getfield columnPrefWidth : [F
    //   240: astore #24
    //   242: iconst_0
    //   243: istore #17
    //   245: iload #17
    //   247: iload #11
    //   249: if_icmpge -> 290
    //   252: aload #24
    //   254: iload #17
    //   256: faload
    //   257: aload #23
    //   259: iload #17
    //   261: faload
    //   262: fsub
    //   263: fload #20
    //   265: fdiv
    //   266: fstore #25
    //   268: aload #22
    //   270: iload #17
    //   272: aload #23
    //   274: iload #17
    //   276: faload
    //   277: fload #25
    //   279: fload #21
    //   281: fmul
    //   282: fadd
    //   283: fastore
    //   284: iinc #17, 1
    //   287: goto -> 245
    //   290: aload_0
    //   291: getfield tablePrefHeight : F
    //   294: aload_0
    //   295: getfield tableMinHeight : F
    //   298: fsub
    //   299: fstore #25
    //   301: fload #25
    //   303: fconst_0
    //   304: fcmpl
    //   305: ifne -> 317
    //   308: aload_0
    //   309: getfield rowMinHeight : [F
    //   312: astore #23
    //   314: goto -> 411
    //   317: aload_0
    //   318: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table.rowWeightedHeight : [F
    //   321: iload #12
    //   323: invokespecial ensureSize : ([FI)[F
    //   326: astore #23
    //   328: aload #23
    //   330: putstatic com/badlogic/gdx/scenes/scene2d/ui/Table.rowWeightedHeight : [F
    //   333: fload #25
    //   335: fconst_0
    //   336: fload #4
    //   338: aload_0
    //   339: getfield tableMinHeight : F
    //   342: fsub
    //   343: invokestatic max : (FF)F
    //   346: invokestatic min : (FF)F
    //   349: fstore #21
    //   351: aload_0
    //   352: getfield rowMinHeight : [F
    //   355: astore #24
    //   357: aload_0
    //   358: getfield rowPrefHeight : [F
    //   361: astore #26
    //   363: iconst_0
    //   364: istore #17
    //   366: iload #17
    //   368: iload #12
    //   370: if_icmpge -> 411
    //   373: aload #26
    //   375: iload #17
    //   377: faload
    //   378: aload #24
    //   380: iload #17
    //   382: faload
    //   383: fsub
    //   384: fload #25
    //   386: fdiv
    //   387: fstore #20
    //   389: aload #23
    //   391: iload #17
    //   393: aload #24
    //   395: iload #17
    //   397: faload
    //   398: fload #20
    //   400: fload #21
    //   402: fmul
    //   403: fadd
    //   404: fastore
    //   405: iinc #17, 1
    //   408: goto -> 366
    //   411: iconst_0
    //   412: istore #27
    //   414: aload #22
    //   416: astore #24
    //   418: aload #5
    //   420: astore #22
    //   422: iload #12
    //   424: istore #17
    //   426: iload #27
    //   428: istore #12
    //   430: iload #12
    //   432: iload #6
    //   434: if_icmpge -> 767
    //   437: aload #22
    //   439: iload #12
    //   441: invokevirtual get : (I)Ljava/lang/Object;
    //   444: checkcast com/badlogic/gdx/scenes/scene2d/ui/Cell
    //   447: astore #26
    //   449: aload #26
    //   451: getfield column : I
    //   454: istore #28
    //   456: aload #26
    //   458: getfield row : I
    //   461: istore #29
    //   463: aload #26
    //   465: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   468: astore #5
    //   470: aload #26
    //   472: getfield colspan : Ljava/lang/Integer;
    //   475: invokevirtual intValue : ()I
    //   478: istore #30
    //   480: iload #28
    //   482: istore #27
    //   484: fconst_0
    //   485: fstore #25
    //   487: iload #27
    //   489: iload #28
    //   491: iload #30
    //   493: iadd
    //   494: if_icmpge -> 513
    //   497: fload #25
    //   499: aload #24
    //   501: iload #27
    //   503: faload
    //   504: fadd
    //   505: fstore #25
    //   507: iinc #27, 1
    //   510: goto -> 487
    //   513: aload #23
    //   515: iload #29
    //   517: faload
    //   518: fstore #31
    //   520: aload #26
    //   522: getfield prefWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   525: aload #5
    //   527: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   530: fstore #20
    //   532: aload #26
    //   534: getfield prefHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   537: aload #5
    //   539: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   542: fstore #32
    //   544: aload #26
    //   546: getfield minWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   549: aload #5
    //   551: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   554: fstore #21
    //   556: aload #26
    //   558: getfield minHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   561: aload #5
    //   563: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   566: fstore #33
    //   568: aload #26
    //   570: getfield maxWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   573: aload #5
    //   575: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   578: fstore #34
    //   580: aload #26
    //   582: getfield maxHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   585: aload #5
    //   587: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   590: fstore #35
    //   592: fload #20
    //   594: fload #21
    //   596: fcmpg
    //   597: ifge -> 603
    //   600: goto -> 607
    //   603: fload #20
    //   605: fstore #21
    //   607: fload #32
    //   609: fstore #20
    //   611: fload #32
    //   613: fload #33
    //   615: fcmpg
    //   616: ifge -> 623
    //   619: fload #33
    //   621: fstore #20
    //   623: fload #21
    //   625: fstore #32
    //   627: fload #34
    //   629: fconst_0
    //   630: fcmpl
    //   631: ifle -> 650
    //   634: fload #21
    //   636: fstore #32
    //   638: fload #21
    //   640: fload #34
    //   642: fcmpl
    //   643: ifle -> 650
    //   646: fload #34
    //   648: fstore #32
    //   650: fload #20
    //   652: fstore #21
    //   654: fload #35
    //   656: fconst_0
    //   657: fcmpl
    //   658: ifle -> 677
    //   661: fload #20
    //   663: fstore #21
    //   665: fload #20
    //   667: fload #35
    //   669: fcmpl
    //   670: ifle -> 677
    //   673: fload #35
    //   675: fstore #21
    //   677: aload #26
    //   679: fload #25
    //   681: aload #26
    //   683: getfield computedPadLeft : F
    //   686: fsub
    //   687: aload #26
    //   689: getfield computedPadRight : F
    //   692: fsub
    //   693: fload #32
    //   695: invokestatic min : (FF)F
    //   698: putfield actorWidth : F
    //   701: aload #26
    //   703: fload #31
    //   705: aload #26
    //   707: getfield computedPadTop : F
    //   710: fsub
    //   711: aload #26
    //   713: getfield computedPadBottom : F
    //   716: fsub
    //   717: fload #21
    //   719: invokestatic min : (FF)F
    //   722: putfield actorHeight : F
    //   725: iload #30
    //   727: iconst_1
    //   728: if_icmpne -> 746
    //   731: aload #15
    //   733: iload #28
    //   735: aload #15
    //   737: iload #28
    //   739: faload
    //   740: fload #25
    //   742: invokestatic max : (FF)F
    //   745: fastore
    //   746: aload #16
    //   748: iload #29
    //   750: aload #16
    //   752: iload #29
    //   754: faload
    //   755: fload #31
    //   757: invokestatic max : (FF)F
    //   760: fastore
    //   761: iinc #12, 1
    //   764: goto -> 430
    //   767: fload #18
    //   769: fconst_0
    //   770: fcmpl
    //   771: ifle -> 908
    //   774: fload_3
    //   775: fload #8
    //   777: fsub
    //   778: fstore #20
    //   780: iload #11
    //   782: istore #28
    //   784: iconst_0
    //   785: istore #12
    //   787: iload #12
    //   789: iload #28
    //   791: if_icmpge -> 810
    //   794: fload #20
    //   796: aload #15
    //   798: iload #12
    //   800: faload
    //   801: fsub
    //   802: fstore #20
    //   804: iinc #12, 1
    //   807: goto -> 787
    //   810: fload #20
    //   812: fconst_0
    //   813: fcmpl
    //   814: ifle -> 908
    //   817: iconst_0
    //   818: istore #12
    //   820: iconst_0
    //   821: istore #27
    //   823: fconst_0
    //   824: fstore #21
    //   826: iload #12
    //   828: iload #28
    //   830: if_icmpge -> 889
    //   833: aload #13
    //   835: iload #12
    //   837: faload
    //   838: fconst_0
    //   839: fcmpl
    //   840: ifne -> 846
    //   843: goto -> 883
    //   846: aload #13
    //   848: iload #12
    //   850: faload
    //   851: fload #20
    //   853: fmul
    //   854: fload #18
    //   856: fdiv
    //   857: fstore #25
    //   859: aload #15
    //   861: iload #12
    //   863: aload #15
    //   865: iload #12
    //   867: faload
    //   868: fload #25
    //   870: fadd
    //   871: fastore
    //   872: fload #21
    //   874: fload #25
    //   876: fadd
    //   877: fstore #21
    //   879: iload #12
    //   881: istore #27
    //   883: iinc #12, 1
    //   886: goto -> 826
    //   889: aload #15
    //   891: iload #27
    //   893: aload #15
    //   895: iload #27
    //   897: faload
    //   898: fload #20
    //   900: fload #21
    //   902: fsub
    //   903: fadd
    //   904: fastore
    //   905: goto -> 908
    //   908: fload #19
    //   910: fconst_0
    //   911: fcmpl
    //   912: ifle -> 1050
    //   915: fload #4
    //   917: fload #10
    //   919: fsub
    //   920: fstore #20
    //   922: iload #17
    //   924: istore #28
    //   926: iconst_0
    //   927: istore #12
    //   929: iload #12
    //   931: iload #28
    //   933: if_icmpge -> 952
    //   936: fload #20
    //   938: aload #16
    //   940: iload #12
    //   942: faload
    //   943: fsub
    //   944: fstore #20
    //   946: iinc #12, 1
    //   949: goto -> 929
    //   952: fload #20
    //   954: fconst_0
    //   955: fcmpl
    //   956: ifle -> 1050
    //   959: iconst_0
    //   960: istore #12
    //   962: iconst_0
    //   963: istore #27
    //   965: fconst_0
    //   966: fstore #21
    //   968: iload #12
    //   970: iload #28
    //   972: if_icmpge -> 1031
    //   975: aload #14
    //   977: iload #12
    //   979: faload
    //   980: fconst_0
    //   981: fcmpl
    //   982: ifne -> 988
    //   985: goto -> 1025
    //   988: aload #14
    //   990: iload #12
    //   992: faload
    //   993: fload #20
    //   995: fmul
    //   996: fload #19
    //   998: fdiv
    //   999: fstore #18
    //   1001: aload #16
    //   1003: iload #12
    //   1005: aload #16
    //   1007: iload #12
    //   1009: faload
    //   1010: fload #18
    //   1012: fadd
    //   1013: fastore
    //   1014: fload #21
    //   1016: fload #18
    //   1018: fadd
    //   1019: fstore #21
    //   1021: iload #12
    //   1023: istore #27
    //   1025: iinc #12, 1
    //   1028: goto -> 968
    //   1031: aload #16
    //   1033: iload #27
    //   1035: aload #16
    //   1037: iload #27
    //   1039: faload
    //   1040: fload #20
    //   1042: fload #21
    //   1044: fsub
    //   1045: fadd
    //   1046: fastore
    //   1047: goto -> 1050
    //   1050: iconst_0
    //   1051: istore #27
    //   1053: iload #27
    //   1055: iload #6
    //   1057: if_icmpge -> 1214
    //   1060: aload #22
    //   1062: iload #27
    //   1064: invokevirtual get : (I)Ljava/lang/Object;
    //   1067: checkcast com/badlogic/gdx/scenes/scene2d/ui/Cell
    //   1070: astore #23
    //   1072: aload #23
    //   1074: getfield colspan : Ljava/lang/Integer;
    //   1077: invokevirtual intValue : ()I
    //   1080: istore #30
    //   1082: iload #30
    //   1084: iconst_1
    //   1085: if_icmpne -> 1091
    //   1088: goto -> 1208
    //   1091: aload #23
    //   1093: getfield column : I
    //   1096: istore #28
    //   1098: fconst_0
    //   1099: fstore #20
    //   1101: iload #28
    //   1103: istore #12
    //   1105: iload #12
    //   1107: iload #28
    //   1109: iload #30
    //   1111: iadd
    //   1112: if_icmpge -> 1137
    //   1115: fload #20
    //   1117: aload #24
    //   1119: iload #12
    //   1121: faload
    //   1122: aload #15
    //   1124: iload #12
    //   1126: faload
    //   1127: fsub
    //   1128: fadd
    //   1129: fstore #20
    //   1131: iinc #12, 1
    //   1134: goto -> 1105
    //   1137: fload #20
    //   1139: fconst_0
    //   1140: aload #23
    //   1142: getfield computedPadLeft : F
    //   1145: aload #23
    //   1147: getfield computedPadRight : F
    //   1150: fadd
    //   1151: invokestatic max : (FF)F
    //   1154: fsub
    //   1155: iload #30
    //   1157: i2f
    //   1158: fdiv
    //   1159: fstore #20
    //   1161: fload #20
    //   1163: fconst_0
    //   1164: fcmpl
    //   1165: ifle -> 1208
    //   1168: aload #23
    //   1170: getfield column : I
    //   1173: istore #28
    //   1175: iload #28
    //   1177: istore #12
    //   1179: iload #12
    //   1181: iload #30
    //   1183: iload #28
    //   1185: iadd
    //   1186: if_icmpge -> 1208
    //   1189: aload #15
    //   1191: iload #12
    //   1193: aload #15
    //   1195: iload #12
    //   1197: faload
    //   1198: fload #20
    //   1200: fadd
    //   1201: fastore
    //   1202: iinc #12, 1
    //   1205: goto -> 1179
    //   1208: iinc #27, 1
    //   1211: goto -> 1053
    //   1214: fload #8
    //   1216: fstore #18
    //   1218: iconst_0
    //   1219: istore #12
    //   1221: iload #12
    //   1223: iload #11
    //   1225: if_icmpge -> 1244
    //   1228: fload #18
    //   1230: aload #15
    //   1232: iload #12
    //   1234: faload
    //   1235: fadd
    //   1236: fstore #18
    //   1238: iinc #12, 1
    //   1241: goto -> 1221
    //   1244: fload #10
    //   1246: fstore #25
    //   1248: iconst_0
    //   1249: istore #11
    //   1251: iload #11
    //   1253: iload #17
    //   1255: if_icmpge -> 1274
    //   1258: fload #25
    //   1260: aload #16
    //   1262: iload #11
    //   1264: faload
    //   1265: fadd
    //   1266: fstore #25
    //   1268: iinc #11, 1
    //   1271: goto -> 1251
    //   1274: aload_0
    //   1275: getfield align : I
    //   1278: istore #17
    //   1280: fload_1
    //   1281: fload #7
    //   1283: fadd
    //   1284: fstore #21
    //   1286: iload #17
    //   1288: bipush #16
    //   1290: iand
    //   1291: ifeq -> 1310
    //   1294: fload_3
    //   1295: fload #18
    //   1297: fsub
    //   1298: fstore #20
    //   1300: fload #21
    //   1302: fload #20
    //   1304: fadd
    //   1305: fstore #20
    //   1307: goto -> 1333
    //   1310: fload #21
    //   1312: fstore #20
    //   1314: iload #17
    //   1316: bipush #8
    //   1318: iand
    //   1319: ifne -> 1333
    //   1322: fload_3
    //   1323: fload #18
    //   1325: fsub
    //   1326: fconst_2
    //   1327: fdiv
    //   1328: fstore #20
    //   1330: goto -> 1300
    //   1333: fload_2
    //   1334: fload #9
    //   1336: fadd
    //   1337: fstore #19
    //   1339: iload #17
    //   1341: iconst_4
    //   1342: iand
    //   1343: ifeq -> 1363
    //   1346: fload #4
    //   1348: fload #25
    //   1350: fsub
    //   1351: fstore #21
    //   1353: fload #19
    //   1355: fload #21
    //   1357: fadd
    //   1358: fstore #21
    //   1360: goto -> 1386
    //   1363: fload #19
    //   1365: fstore #21
    //   1367: iload #17
    //   1369: iconst_2
    //   1370: iand
    //   1371: ifne -> 1386
    //   1374: fload #4
    //   1376: fload #25
    //   1378: fsub
    //   1379: fconst_2
    //   1380: fdiv
    //   1381: fstore #21
    //   1383: goto -> 1353
    //   1386: fload #20
    //   1388: fstore #32
    //   1390: fload #21
    //   1392: fstore #19
    //   1394: iconst_0
    //   1395: istore #11
    //   1397: aload #15
    //   1399: astore #23
    //   1401: iload #11
    //   1403: iload #6
    //   1405: if_icmpge -> 1913
    //   1408: aload #22
    //   1410: iload #11
    //   1412: invokevirtual get : (I)Ljava/lang/Object;
    //   1415: checkcast com/badlogic/gdx/scenes/scene2d/ui/Cell
    //   1418: astore #24
    //   1420: aload #24
    //   1422: getfield column : I
    //   1425: istore #12
    //   1427: aload #24
    //   1429: getfield colspan : Ljava/lang/Integer;
    //   1432: invokevirtual intValue : ()I
    //   1435: istore #27
    //   1437: fconst_0
    //   1438: fstore #35
    //   1440: iload #12
    //   1442: istore #17
    //   1444: iload #17
    //   1446: iload #27
    //   1448: iload #12
    //   1450: iadd
    //   1451: if_icmpge -> 1470
    //   1454: fload #35
    //   1456: aload #23
    //   1458: iload #17
    //   1460: faload
    //   1461: fadd
    //   1462: fstore #35
    //   1464: iinc #17, 1
    //   1467: goto -> 1444
    //   1470: fload #35
    //   1472: aload #24
    //   1474: getfield computedPadLeft : F
    //   1477: aload #24
    //   1479: getfield computedPadRight : F
    //   1482: fadd
    //   1483: fsub
    //   1484: fstore #35
    //   1486: fload #32
    //   1488: aload #24
    //   1490: getfield computedPadLeft : F
    //   1493: fadd
    //   1494: fstore #32
    //   1496: aload #24
    //   1498: getfield fillX : Ljava/lang/Float;
    //   1501: invokevirtual floatValue : ()F
    //   1504: fstore #33
    //   1506: aload #24
    //   1508: getfield fillY : Ljava/lang/Float;
    //   1511: invokevirtual floatValue : ()F
    //   1514: fstore #34
    //   1516: fload #33
    //   1518: fconst_0
    //   1519: fcmpl
    //   1520: ifle -> 1589
    //   1523: aload #24
    //   1525: fload #33
    //   1527: fload #35
    //   1529: fmul
    //   1530: aload #24
    //   1532: getfield minWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   1535: aload #24
    //   1537: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   1540: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   1543: invokestatic max : (FF)F
    //   1546: putfield actorWidth : F
    //   1549: aload #24
    //   1551: getfield maxWidth : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   1554: aload #24
    //   1556: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   1559: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   1562: fstore #33
    //   1564: fload #33
    //   1566: fconst_0
    //   1567: fcmpl
    //   1568: ifle -> 1589
    //   1571: aload #24
    //   1573: aload #24
    //   1575: getfield actorWidth : F
    //   1578: fload #33
    //   1580: invokestatic min : (FF)F
    //   1583: putfield actorWidth : F
    //   1586: goto -> 1589
    //   1589: fload #34
    //   1591: fconst_0
    //   1592: fcmpl
    //   1593: ifle -> 1680
    //   1596: aload #24
    //   1598: aload #16
    //   1600: aload #24
    //   1602: getfield row : I
    //   1605: faload
    //   1606: fload #34
    //   1608: fmul
    //   1609: aload #24
    //   1611: getfield computedPadTop : F
    //   1614: fsub
    //   1615: aload #24
    //   1617: getfield computedPadBottom : F
    //   1620: fsub
    //   1621: aload #24
    //   1623: getfield minHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   1626: aload #24
    //   1628: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   1631: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   1634: invokestatic max : (FF)F
    //   1637: putfield actorHeight : F
    //   1640: aload #24
    //   1642: getfield maxHeight : Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    //   1645: aload #24
    //   1647: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   1650: invokevirtual get : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    //   1653: fstore #34
    //   1655: fload #34
    //   1657: fconst_0
    //   1658: fcmpl
    //   1659: ifle -> 1680
    //   1662: aload #24
    //   1664: aload #24
    //   1666: getfield actorHeight : F
    //   1669: fload #34
    //   1671: invokestatic min : (FF)F
    //   1674: putfield actorHeight : F
    //   1677: goto -> 1680
    //   1680: aload #24
    //   1682: getfield align : Ljava/lang/Integer;
    //   1685: invokevirtual intValue : ()I
    //   1688: istore #17
    //   1690: iload #17
    //   1692: bipush #8
    //   1694: iand
    //   1695: ifeq -> 1708
    //   1698: aload #24
    //   1700: fload #32
    //   1702: putfield actorX : F
    //   1705: goto -> 1753
    //   1708: iload #17
    //   1710: bipush #16
    //   1712: iand
    //   1713: ifeq -> 1735
    //   1716: aload #24
    //   1718: fload #32
    //   1720: fload #35
    //   1722: fadd
    //   1723: aload #24
    //   1725: getfield actorWidth : F
    //   1728: fsub
    //   1729: putfield actorX : F
    //   1732: goto -> 1753
    //   1735: aload #24
    //   1737: fload #35
    //   1739: aload #24
    //   1741: getfield actorWidth : F
    //   1744: fsub
    //   1745: fconst_2
    //   1746: fdiv
    //   1747: fload #32
    //   1749: fadd
    //   1750: putfield actorX : F
    //   1753: iload #17
    //   1755: iconst_2
    //   1756: iand
    //   1757: ifeq -> 1776
    //   1760: aload #24
    //   1762: aload #24
    //   1764: getfield computedPadTop : F
    //   1767: fload #19
    //   1769: fadd
    //   1770: putfield actorY : F
    //   1773: goto -> 1850
    //   1776: iload #17
    //   1778: iconst_4
    //   1779: iand
    //   1780: ifeq -> 1814
    //   1783: aload #24
    //   1785: aload #16
    //   1787: aload #24
    //   1789: getfield row : I
    //   1792: faload
    //   1793: fload #19
    //   1795: fadd
    //   1796: aload #24
    //   1798: getfield actorHeight : F
    //   1801: fsub
    //   1802: aload #24
    //   1804: getfield computedPadBottom : F
    //   1807: fsub
    //   1808: putfield actorY : F
    //   1811: goto -> 1773
    //   1814: aload #24
    //   1816: aload #16
    //   1818: aload #24
    //   1820: getfield row : I
    //   1823: faload
    //   1824: aload #24
    //   1826: getfield actorHeight : F
    //   1829: fsub
    //   1830: aload #24
    //   1832: getfield computedPadTop : F
    //   1835: fadd
    //   1836: aload #24
    //   1838: getfield computedPadBottom : F
    //   1841: fsub
    //   1842: fconst_2
    //   1843: fdiv
    //   1844: fload #19
    //   1846: fadd
    //   1847: putfield actorY : F
    //   1850: aload #24
    //   1852: getfield endRow : Z
    //   1855: ifeq -> 1878
    //   1858: fload #19
    //   1860: aload #16
    //   1862: aload #24
    //   1864: getfield row : I
    //   1867: faload
    //   1868: fadd
    //   1869: fstore #35
    //   1871: fload #20
    //   1873: fstore #19
    //   1875: goto -> 1899
    //   1878: fload #32
    //   1880: fload #35
    //   1882: aload #24
    //   1884: getfield computedPadRight : F
    //   1887: fadd
    //   1888: fadd
    //   1889: fstore #32
    //   1891: fload #19
    //   1893: fstore #35
    //   1895: fload #32
    //   1897: fstore #19
    //   1899: iinc #11, 1
    //   1902: fload #19
    //   1904: fstore #32
    //   1906: fload #35
    //   1908: fstore #19
    //   1910: goto -> 1401
    //   1913: aload_0
    //   1914: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   1917: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.none : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   1920: if_acmpne -> 1924
    //   1923: return
    //   1924: aload_0
    //   1925: invokespecial clearDebugRects : ()V
    //   1928: aload_0
    //   1929: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   1932: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.table : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   1935: if_acmpeq -> 1948
    //   1938: aload_0
    //   1939: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   1942: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.all : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   1945: if_acmpne -> 1981
    //   1948: aload_0
    //   1949: fload_1
    //   1950: fload_2
    //   1951: fload_3
    //   1952: fload #4
    //   1954: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table.debugTableColor : Lcom/badlogic/gdx/graphics/Color;
    //   1957: invokespecial addDebugRect : (FFFFLcom/badlogic/gdx/graphics/Color;)V
    //   1960: aload_0
    //   1961: fload #20
    //   1963: fload #21
    //   1965: fload #18
    //   1967: fload #8
    //   1969: fsub
    //   1970: fload #25
    //   1972: fload #10
    //   1974: fsub
    //   1975: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table.debugTableColor : Lcom/badlogic/gdx/graphics/Color;
    //   1978: invokespecial addDebugRect : (FFFFLcom/badlogic/gdx/graphics/Color;)V
    //   1981: fload #20
    //   1983: fstore_1
    //   1984: iconst_0
    //   1985: istore #11
    //   1987: iload #11
    //   1989: iload #6
    //   1991: if_icmpge -> 2222
    //   1994: aload #22
    //   1996: iload #11
    //   1998: invokevirtual get : (I)Ljava/lang/Object;
    //   2001: checkcast com/badlogic/gdx/scenes/scene2d/ui/Cell
    //   2004: astore #24
    //   2006: aload_0
    //   2007: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2010: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.actor : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2013: if_acmpeq -> 2026
    //   2016: aload_0
    //   2017: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2020: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.all : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2023: if_acmpne -> 2053
    //   2026: aload_0
    //   2027: aload #24
    //   2029: getfield actorX : F
    //   2032: aload #24
    //   2034: getfield actorY : F
    //   2037: aload #24
    //   2039: getfield actorWidth : F
    //   2042: aload #24
    //   2044: getfield actorHeight : F
    //   2047: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table.debugActorColor : Lcom/badlogic/gdx/graphics/Color;
    //   2050: invokespecial addDebugRect : (FFFFLcom/badlogic/gdx/graphics/Color;)V
    //   2053: aload #24
    //   2055: getfield column : I
    //   2058: istore #12
    //   2060: aload #24
    //   2062: getfield colspan : Ljava/lang/Integer;
    //   2065: invokevirtual intValue : ()I
    //   2068: istore #27
    //   2070: fconst_0
    //   2071: fstore_2
    //   2072: iload #12
    //   2074: istore #17
    //   2076: iload #17
    //   2078: iload #27
    //   2080: iload #12
    //   2082: iadd
    //   2083: if_icmpge -> 2100
    //   2086: fload_2
    //   2087: aload #23
    //   2089: iload #17
    //   2091: faload
    //   2092: fadd
    //   2093: fstore_2
    //   2094: iinc #17, 1
    //   2097: goto -> 2076
    //   2100: fload_2
    //   2101: aload #24
    //   2103: getfield computedPadLeft : F
    //   2106: aload #24
    //   2108: getfield computedPadRight : F
    //   2111: fadd
    //   2112: fsub
    //   2113: fstore_2
    //   2114: fload_1
    //   2115: aload #24
    //   2117: getfield computedPadLeft : F
    //   2120: fadd
    //   2121: fstore_1
    //   2122: aload_0
    //   2123: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2126: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.cell : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2129: if_acmpeq -> 2142
    //   2132: aload_0
    //   2133: getfield debug : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2136: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table$Debug.all : Lcom/badlogic/gdx/scenes/scene2d/ui/Table$Debug;
    //   2139: if_acmpne -> 2179
    //   2142: aload_0
    //   2143: fload_1
    //   2144: fload #21
    //   2146: aload #24
    //   2148: getfield computedPadTop : F
    //   2151: fadd
    //   2152: fload_2
    //   2153: aload #16
    //   2155: aload #24
    //   2157: getfield row : I
    //   2160: faload
    //   2161: aload #24
    //   2163: getfield computedPadTop : F
    //   2166: fsub
    //   2167: aload #24
    //   2169: getfield computedPadBottom : F
    //   2172: fsub
    //   2173: getstatic com/badlogic/gdx/scenes/scene2d/ui/Table.debugCellColor : Lcom/badlogic/gdx/graphics/Color;
    //   2176: invokespecial addDebugRect : (FFFFLcom/badlogic/gdx/graphics/Color;)V
    //   2179: aload #24
    //   2181: getfield endRow : Z
    //   2184: ifeq -> 2206
    //   2187: fload #21
    //   2189: aload #16
    //   2191: aload #24
    //   2193: getfield row : I
    //   2196: faload
    //   2197: fadd
    //   2198: fstore #21
    //   2200: fload #20
    //   2202: fstore_1
    //   2203: goto -> 2216
    //   2206: fload_1
    //   2207: fload_2
    //   2208: aload #24
    //   2210: getfield computedPadRight : F
    //   2213: fadd
    //   2214: fadd
    //   2215: fstore_1
    //   2216: iinc #11, 1
    //   2219: goto -> 1987
    //   2222: return }
  
  private Cell obtainCell() {
    Cell cell = (Cell)cellPool.obtain();
    cell.setTable(this);
    return cell;
  }
  
  public Cell add() { return add((Actor)null); }
  
  public <T extends Actor> Cell<T> add(T paramT) {
    Cell cell = obtainCell();
    cell.actor = paramT;
    if (this.implicitEndRow) {
      this.implicitEndRow = false;
      this.rows--;
      ((Cell)this.cells.peek()).endRow = false;
    } 
    Array array = this.cells;
    int i = array.size;
    if (i > 0) {
      Cell cell1 = (Cell)array.peek();
      if (!cell1.endRow) {
        cell1.column += cell1.colspan.intValue();
        cell.row = cell1.row;
      } else {
        cell.column = 0;
        cell1.row++;
      } 
      if (cell.row > 0)
        for (int j = i - 1; j >= 0; j--) {
          cell1 = (Cell)array.get(j);
          int k = cell1.column;
          int m = cell1.colspan.intValue();
          for (i = k; i < m + k; i++) {
            if (i == cell.column) {
              cell.cellAboveIndex = j;
              // Byte code: goto -> 225
            } 
          } 
        }  
    } else {
      cell.column = 0;
      cell.row = 0;
    } 
    array.add(cell);
    cell.set(this.cellDefaults);
    if (cell.column < this.columnDefaults.size) {
      Cell cell1 = (Cell)this.columnDefaults.get(cell.column);
      if (cell1 != null)
        cell.merge(cell1); 
    } 
    cell.merge(this.rowDefaults);
    if (paramT != null)
      addActor(paramT); 
    return cell;
  }
  
  public Cell<Label> add(CharSequence paramCharSequence) {
    Skin skin1 = this.skin;
    if (skin1 != null)
      return add(new Label(paramCharSequence, skin1)); 
    throw new IllegalStateException("Table must have a skin set to use this method.");
  }
  
  public Cell<Label> add(CharSequence paramCharSequence, String paramString) {
    Skin skin1 = this.skin;
    if (skin1 != null)
      return add(new Label(paramCharSequence, (Label.LabelStyle)skin1.get(paramString, Label.LabelStyle.class))); 
    throw new IllegalStateException("Table must have a skin set to use this method.");
  }
  
  public Cell<Label> add(CharSequence paramCharSequence, String paramString, Color paramColor) {
    Skin skin1 = this.skin;
    if (skin1 != null)
      return add(new Label(paramCharSequence, new Label.LabelStyle(skin1.getFont(paramString), paramColor))); 
    throw new IllegalStateException("Table must have a skin set to use this method.");
  }
  
  public Cell<Label> add(CharSequence paramCharSequence, String paramString1, String paramString2) {
    Skin skin1 = this.skin;
    if (skin1 != null)
      return add(new Label(paramCharSequence, new Label.LabelStyle(skin1.getFont(paramString1), this.skin.getColor(paramString2)))); 
    throw new IllegalStateException("Table must have a skin set to use this method.");
  }
  
  public Table add(Actor... paramVarArgs) {
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      add(paramVarArgs[b]); 
    return this;
  }
  
  public Table align(int paramInt) {
    this.align = paramInt;
    return this;
  }
  
  public Table background(Drawable paramDrawable) {
    setBackground(paramDrawable);
    return this;
  }
  
  public Table background(String paramString) {
    setBackground(paramString);
    return this;
  }
  
  public Table bottom() {
    this.align |= 0x4;
    this.align &= 0xFFFFFFFD;
    return this;
  }
  
  public Table center() {
    this.align = 1;
    return this;
  }
  
  public void clearChildren() {
    Array array = this.cells;
    for (int i = array.size - 1; i >= 0; i--) {
      Actor actor = ((Cell)array.get(i)).actor;
      if (actor != null)
        actor.remove(); 
    } 
    cellPool.freeAll(array);
    array.clear();
    this.rows = 0;
    this.columns = 0;
    Cell cell = this.rowDefaults;
    if (cell != null)
      cellPool.free(cell); 
    this.rowDefaults = null;
    this.implicitEndRow = false;
    super.clearChildren();
  }
  
  public Cell columnDefaults(int paramInt) {
    Object object;
    if (this.columnDefaults.size > paramInt) {
      object = (Cell)this.columnDefaults.get(paramInt);
    } else {
      object = null;
    } 
    Cell cell = object;
    if (object == null) {
      cell = obtainCell();
      cell.clear();
      if (paramInt >= this.columnDefaults.size) {
        for (int i = this.columnDefaults.size; i < paramInt; i++)
          this.columnDefaults.add(null); 
        this.columnDefaults.add(cell);
      } else {
        this.columnDefaults.set(paramInt, cell);
      } 
    } 
    return cell;
  }
  
  public Table debug() {
    super.debug();
    return this;
  }
  
  public Table debug(Debug paramDebug) {
    boolean bool;
    if (paramDebug != Debug.none) {
      bool = true;
    } else {
      bool = false;
    } 
    super.setDebug(bool);
    if (this.debug != paramDebug) {
      this.debug = paramDebug;
      if (paramDebug == Debug.none) {
        clearDebugRects();
      } else {
        invalidate();
      } 
    } 
    return this;
  }
  
  public Table debugActor() {
    super.setDebug(true);
    if (this.debug != Debug.actor) {
      this.debug = Debug.actor;
      invalidate();
    } 
    return this;
  }
  
  public Table debugAll() {
    super.debugAll();
    return this;
  }
  
  public Table debugCell() {
    super.setDebug(true);
    if (this.debug != Debug.cell) {
      this.debug = Debug.cell;
      invalidate();
    } 
    return this;
  }
  
  public Table debugTable() {
    super.setDebug(true);
    if (this.debug != Debug.table) {
      this.debug = Debug.table;
      invalidate();
    } 
    return this;
  }
  
  public Cell defaults() { return this.cellDefaults; }
  
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
    if (isTransform()) {
      applyTransform(paramShapeRenderer, computeTransform());
      drawDebugRects(paramShapeRenderer);
      if (this.clip) {
        float f4;
        paramShapeRenderer.flush();
        float f1 = getWidth();
        float f2 = getHeight();
        Drawable drawable = this.background;
        float f3 = 0.0F;
        if (drawable != null) {
          f3 = this.padLeft.get(this);
          f4 = this.padBottom.get(this);
          f1 -= this.padRight.get(this) + f3;
          f2 -= this.padTop.get(this) + f4;
        } else {
          f4 = 0.0F;
        } 
        if (clipBegin(f3, f4, f1, f2)) {
          drawDebugChildren(paramShapeRenderer);
          clipEnd();
        } 
      } else {
        drawDebugChildren(paramShapeRenderer);
      } 
      resetTransform(paramShapeRenderer);
    } else {
      drawDebugRects(paramShapeRenderer);
      super.drawDebug(paramShapeRenderer);
    } 
  }
  
  protected void drawDebugBounds(ShapeRenderer paramShapeRenderer) {}
  
  public int getAlign() { return this.align; }
  
  public Drawable getBackground() { return this.background; }
  
  public <T extends Actor> Cell<T> getCell(T paramT) {
    Array array = this.cells;
    int i = array.size;
    for (byte b = 0; b < i; b++) {
      Cell cell = (Cell)array.get(b);
      if (cell.actor == paramT)
        return cell; 
    } 
    return null;
  }
  
  public Array<Cell> getCells() { return this.cells; }
  
  public boolean getClip() { return this.clip; }
  
  public float getColumnMinWidth(int paramInt) {
    if (this.sizeInvalid)
      computeSize(); 
    return this.columnMinWidth[paramInt];
  }
  
  public float getColumnPrefWidth(int paramInt) {
    if (this.sizeInvalid)
      computeSize(); 
    return this.columnPrefWidth[paramInt];
  }
  
  public float getColumnWidth(int paramInt) {
    float[] arrayOfFloat = this.columnWidth;
    return (arrayOfFloat == null) ? 0.0F : arrayOfFloat[paramInt];
  }
  
  public int getColumns() { return this.columns; }
  
  public float getMinHeight() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.tableMinHeight;
  }
  
  public float getMinWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.tableMinWidth;
  }
  
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
    if (this.sizeInvalid)
      computeSize(); 
    float f1 = this.tablePrefHeight;
    Drawable drawable = this.background;
    float f2 = f1;
    if (drawable != null)
      f2 = Math.max(f1, drawable.getMinHeight()); 
    return f2;
  }
  
  public float getPrefWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    float f1 = this.tablePrefWidth;
    Drawable drawable = this.background;
    float f2 = f1;
    if (drawable != null)
      f2 = Math.max(f1, drawable.getMinWidth()); 
    return f2;
  }
  
  public int getRow(float paramFloat) {
    Array array = this.cells;
    float f = getPadTop();
    int i = array.size;
    if (i == 0)
      return -1; 
    byte b1 = 0;
    if (i == 1)
      return 0; 
    byte b2;
    for (b2 = 0; b1 < i; b2 = b) {
      Cell cell = (Cell)array.get(b1);
      if (cell.actorY + cell.computedPadTop < paramFloat + f)
        break; 
      byte b = b2;
      if (cell.endRow)
        b = b2 + true; 
      b1++;
    } 
    return Math.min(b2, this.rows - 1);
  }
  
  public float getRowHeight(int paramInt) {
    float[] arrayOfFloat = this.rowHeight;
    return (arrayOfFloat == null) ? 0.0F : arrayOfFloat[paramInt];
  }
  
  public float getRowMinHeight(int paramInt) {
    if (this.sizeInvalid)
      computeSize(); 
    return this.rowMinHeight[paramInt];
  }
  
  public float getRowPrefHeight(int paramInt) {
    if (this.sizeInvalid)
      computeSize(); 
    return this.rowPrefHeight[paramInt];
  }
  
  public int getRows() { return this.rows; }
  
  public Skin getSkin() { return this.skin; }
  
  public Debug getTableDebug() { return this.debug; }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    if (this.clip) {
      if (paramBoolean && getTouchable() == Touchable.disabled)
        return null; 
      if (paramFloat1 < 0.0F || paramFloat1 >= getWidth() || paramFloat2 < 0.0F || paramFloat2 >= getHeight())
        return null; 
    } 
    return super.hit(paramFloat1, paramFloat2, paramBoolean);
  }
  
  public void invalidate() {
    this.sizeInvalid = true;
    super.invalidate();
  }
  
  public void layout() {
    float f1 = getWidth();
    float f2 = getHeight();
    layout(0.0F, 0.0F, f1, f2);
    Array array = this.cells;
    boolean bool = this.round;
    boolean bool1 = false;
    if (bool) {
      int j = array.size;
      for (byte b1 = 0; b1 < j; b1++) {
        Cell cell = (Cell)array.get(b1);
        float f3 = Math.round(cell.actorWidth);
        float f4 = Math.round(cell.actorHeight);
        float f5 = Math.round(cell.actorX);
        f1 = f2 - Math.round(cell.actorY) - f4;
        cell.setActorBounds(f5, f1, f3, f4);
        Actor actor = cell.actor;
        if (actor != null)
          actor.setBounds(f5, f1, f3, f4); 
      } 
    } else {
      int j = array.size;
      for (byte b1 = 0; b1 < j; b1++) {
        Cell cell = (Cell)array.get(b1);
        float f = cell.actorHeight;
        f1 = f2 - cell.actorY - f;
        cell.setActorY(f1);
        Actor actor = cell.actor;
        if (actor != null)
          actor.setBounds(cell.actorX, f1, cell.actorWidth, f); 
      } 
    } 
    SnapshotArray snapshotArray = getChildren();
    int i = snapshotArray.size;
    for (byte b = bool1; b < i; b++) {
      Actor actor = (Actor)snapshotArray.get(b);
      if (actor instanceof Layout)
        ((Layout)actor).validate(); 
    } 
  }
  
  public Table left() {
    this.align |= 0x8;
    this.align &= 0xFFFFFFEF;
    return this;
  }
  
  public Table pad(float paramFloat) {
    pad(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Table pad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.padTop = Value.Fixed.valueOf(paramFloat1);
    this.padLeft = Value.Fixed.valueOf(paramFloat2);
    this.padBottom = Value.Fixed.valueOf(paramFloat3);
    this.padRight = Value.Fixed.valueOf(paramFloat4);
    this.sizeInvalid = true;
    return this;
  }
  
  public Table pad(Value paramValue) {
    if (paramValue != null) {
      this.padTop = paramValue;
      this.padLeft = paramValue;
      this.padBottom = paramValue;
      this.padRight = paramValue;
      this.sizeInvalid = true;
      return this;
    } 
    throw new IllegalArgumentException("pad cannot be null.");
  }
  
  public Table pad(Value paramValue1, Value paramValue2, Value paramValue3, Value paramValue4) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        if (paramValue3 != null) {
          if (paramValue4 != null) {
            this.padTop = paramValue1;
            this.padLeft = paramValue2;
            this.padBottom = paramValue3;
            this.padRight = paramValue4;
            this.sizeInvalid = true;
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
  
  public Table padBottom(float paramFloat) {
    this.padBottom = Value.Fixed.valueOf(paramFloat);
    this.sizeInvalid = true;
    return this;
  }
  
  public Table padBottom(Value paramValue) {
    if (paramValue != null) {
      this.padBottom = paramValue;
      this.sizeInvalid = true;
      return this;
    } 
    throw new IllegalArgumentException("padBottom cannot be null.");
  }
  
  public Table padLeft(float paramFloat) {
    this.padLeft = Value.Fixed.valueOf(paramFloat);
    this.sizeInvalid = true;
    return this;
  }
  
  public Table padLeft(Value paramValue) {
    if (paramValue != null) {
      this.padLeft = paramValue;
      this.sizeInvalid = true;
      return this;
    } 
    throw new IllegalArgumentException("padLeft cannot be null.");
  }
  
  public Table padRight(float paramFloat) {
    this.padRight = Value.Fixed.valueOf(paramFloat);
    this.sizeInvalid = true;
    return this;
  }
  
  public Table padRight(Value paramValue) {
    if (paramValue != null) {
      this.padRight = paramValue;
      this.sizeInvalid = true;
      return this;
    } 
    throw new IllegalArgumentException("padRight cannot be null.");
  }
  
  public Table padTop(float paramFloat) {
    this.padTop = Value.Fixed.valueOf(paramFloat);
    this.sizeInvalid = true;
    return this;
  }
  
  public Table padTop(Value paramValue) {
    if (paramValue != null) {
      this.padTop = paramValue;
      this.sizeInvalid = true;
      return this;
    } 
    throw new IllegalArgumentException("padTop cannot be null.");
  }
  
  public boolean removeActor(Actor paramActor) { return removeActor(paramActor, true); }
  
  public boolean removeActor(Actor paramActor, boolean paramBoolean) {
    if (!super.removeActor(paramActor, paramBoolean))
      return false; 
    Cell cell = getCell(paramActor);
    if (cell != null)
      cell.actor = null; 
    return true;
  }
  
  public void reset() {
    clearChildren();
    this.padTop = backgroundTop;
    this.padLeft = backgroundLeft;
    this.padBottom = backgroundBottom;
    this.padRight = backgroundRight;
    this.align = 1;
    debug(Debug.none);
    this.cellDefaults.reset();
    int i = this.columnDefaults.size;
    for (byte b = 0; b < i; b++) {
      Cell cell = (Cell)this.columnDefaults.get(b);
      if (cell != null)
        cellPool.free(cell); 
    } 
    this.columnDefaults.clear();
  }
  
  public Table right() {
    this.align |= 0x10;
    this.align &= 0xFFFFFFF7;
    return this;
  }
  
  public Cell row() {
    if (this.cells.size > 0) {
      if (!this.implicitEndRow) {
        if (((Cell)this.cells.peek()).endRow)
          return this.rowDefaults; 
        endRow();
      } 
      invalidate();
    } 
    this.implicitEndRow = false;
    Cell cell = this.rowDefaults;
    if (cell != null)
      cellPool.free(cell); 
    this.rowDefaults = obtainCell();
    this.rowDefaults.clear();
    return this.rowDefaults;
  }
  
  public void setBackground(Drawable paramDrawable) {
    if (this.background == paramDrawable)
      return; 
    float f1 = getPadTop();
    float f2 = getPadLeft();
    float f3 = getPadBottom();
    float f4 = getPadRight();
    this.background = paramDrawable;
    float f5 = getPadTop();
    float f6 = getPadLeft();
    float f7 = getPadBottom();
    float f8 = getPadRight();
    if (f1 + f3 != f5 + f7 || f2 + f4 != f6 + f8) {
      invalidateHierarchy();
      return;
    } 
    if (f1 != f5 || f2 != f6 || f3 != f7 || f4 != f8)
      invalidate(); 
  }
  
  public void setBackground(String paramString) {
    Skin skin1 = this.skin;
    if (skin1 != null) {
      setBackground(skin1.getDrawable(paramString));
      return;
    } 
    throw new IllegalStateException("Table must have a skin set to use this method.");
  }
  
  public void setClip(boolean paramBoolean) {
    this.clip = paramBoolean;
    setTransform(paramBoolean);
    invalidate();
  }
  
  public void setDebug(boolean paramBoolean) {
    Debug debug1;
    if (paramBoolean) {
      debug1 = Debug.all;
    } else {
      debug1 = Debug.none;
    } 
    debug(debug1);
  }
  
  public void setRound(boolean paramBoolean) { this.round = paramBoolean; }
  
  public void setSkin(Skin paramSkin) { this.skin = paramSkin; }
  
  public Cell<Stack> stack(Actor... paramVarArgs) {
    Stack stack = new Stack();
    if (paramVarArgs != null) {
      byte b = 0;
      int i = paramVarArgs.length;
      while (b < i) {
        stack.addActor(paramVarArgs[b]);
        b++;
      } 
    } 
    return add(stack);
  }
  
  public Table top() {
    this.align |= 0x2;
    this.align &= 0xFFFFFFFB;
    return this;
  }
  
  public enum Debug {
    actor, all, cell, none, table;
    
    static  {
      all = new Debug("all", true);
      table = new Debug("table", 2);
      cell = new Debug("cell", 3);
      actor = new Debug("actor", 4);
      $VALUES = new Debug[] { none, all, table, cell, actor };
    }
  }
  
  public static class DebugRect extends Rectangle {
    static Pool<DebugRect> pool = Pools.get(DebugRect.class);
    
    Color color;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Table.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */