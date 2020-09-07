package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.graphics.glutils.PixmapTextureData;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.OrderedMap;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.Comparator;
import java.util.regex.Pattern;

public class PixmapPacker implements Disposable {
  static Pattern indexPattern = Pattern.compile("(.+)_(\\d+)$");
  
  int alphaThreshold;
  
  private Color c = new Color();
  
  boolean disposed;
  
  boolean duplicateBorder;
  
  PackStrategy packStrategy;
  
  boolean packToTexture;
  
  int padding;
  
  Pixmap.Format pageFormat;
  
  int pageHeight;
  
  int pageWidth;
  
  final Array<Page> pages = new Array();
  
  boolean stripWhitespaceX;
  
  boolean stripWhitespaceY;
  
  Color transparentColor = new Color(0.0F, 0.0F, 0.0F, 0.0F);
  
  public PixmapPacker(int paramInt1, int paramInt2, Pixmap.Format paramFormat, int paramInt3, boolean paramBoolean) { this(paramInt1, paramInt2, paramFormat, paramInt3, paramBoolean, false, false, new GuillotineStrategy()); }
  
  public PixmapPacker(int paramInt1, int paramInt2, Pixmap.Format paramFormat, int paramInt3, boolean paramBoolean, PackStrategy paramPackStrategy) { this(paramInt1, paramInt2, paramFormat, paramInt3, paramBoolean, false, false, paramPackStrategy); }
  
  public PixmapPacker(int paramInt1, int paramInt2, Pixmap.Format paramFormat, int paramInt3, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, PackStrategy paramPackStrategy) {
    this.pageWidth = paramInt1;
    this.pageHeight = paramInt2;
    this.pageFormat = paramFormat;
    this.padding = paramInt3;
    this.duplicateBorder = paramBoolean1;
    this.stripWhitespaceX = paramBoolean2;
    this.stripWhitespaceY = paramBoolean3;
    this.packStrategy = paramPackStrategy;
  }
  
  private int[] getPads(Pixmap paramPixmap, int[] paramArrayOfInt) {
    int i1;
    int n;
    int i = paramPixmap.getHeight() - 1;
    int j = paramPixmap.getWidth() - 1;
    int k = getSplitPoint(paramPixmap, 1, i, true, true);
    int m = getSplitPoint(paramPixmap, j, 1, true, false);
    if (k != 0) {
      n = getSplitPoint(paramPixmap, k + 1, i, false, true);
    } else {
      n = 0;
    } 
    if (m != 0) {
      i1 = getSplitPoint(paramPixmap, j, m + 1, false, false);
    } else {
      i1 = 0;
    } 
    getSplitPoint(paramPixmap, n + true, i, true, true);
    getSplitPoint(paramPixmap, j, i1 + true, true, false);
    if (k == 0 && !n && m == 0 && !i1)
      return null; 
    j = -1;
    if (k == 0 && !n) {
      n = -1;
      k = -1;
    } else if (k > 0) {
      k--;
      n = paramPixmap.getWidth() - 2 - n - 1;
    } else {
      n = paramPixmap.getWidth() - 2;
    } 
    if (m == 0 && !i1) {
      m = -1;
      i1 = j;
    } else if (m > 0) {
      m--;
      i1 = paramPixmap.getHeight() - 2 - i1 - 1;
    } else {
      i1 = paramPixmap.getHeight() - 2;
    } 
    int[] arrayOfInt = new int[4];
    arrayOfInt[0] = k;
    arrayOfInt[1] = n;
    arrayOfInt[2] = m;
    arrayOfInt[3] = i1;
    return (paramArrayOfInt != null && Arrays.equals(arrayOfInt, paramArrayOfInt)) ? null : arrayOfInt;
  }
  
  private int getSplitPoint(Pixmap paramPixmap, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2) {
    boolean bool;
    int j;
    int i;
    int[] arrayOfInt = new int[4];
    if (paramBoolean2) {
      i = paramInt1;
    } else {
      i = paramInt2;
    } 
    if (paramBoolean2) {
      j = paramPixmap.getWidth();
    } else {
      j = paramPixmap.getHeight();
    } 
    if (paramBoolean1) {
      bool = true;
    } else {
      bool = false;
    } 
    while (i != j) {
      if (paramBoolean2) {
        paramInt1 = i;
      } else {
        paramInt2 = i;
      } 
      int k = paramPixmap.getPixel(paramInt1, paramInt2);
      this.c.set(k);
      arrayOfInt[0] = (int)(this.c.r * 255.0F);
      arrayOfInt[1] = (int)(this.c.g * 255.0F);
      arrayOfInt[2] = (int)(this.c.b * 255.0F);
      arrayOfInt[3] = (int)(this.c.a * 255.0F);
      if (arrayOfInt[3] == bool)
        return i; 
      if (!paramBoolean1 && (arrayOfInt[0] != 0 || arrayOfInt[1] != 0 || arrayOfInt[2] != 0 || arrayOfInt[3] != 255)) {
        PrintStream printStream = System.out;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(paramInt1);
        stringBuilder.append("  ");
        stringBuilder.append(paramInt2);
        stringBuilder.append(" ");
        stringBuilder.append(arrayOfInt);
        stringBuilder.append(" ");
        printStream.println(stringBuilder.toString());
      } 
      i++;
    } 
    return 0;
  }
  
  private int[] getSplits(Pixmap paramPixmap) {
    int i = getSplitPoint(paramPixmap, 1, 0, true, true);
    int j = getSplitPoint(paramPixmap, i, 0, false, true);
    int k = getSplitPoint(paramPixmap, 0, 1, true, false);
    int m = getSplitPoint(paramPixmap, 0, k, false, false);
    getSplitPoint(paramPixmap, j + 1, 0, true, true);
    getSplitPoint(paramPixmap, 0, m + 1, true, false);
    if (i == 0 && j == 0 && k == 0 && m == 0)
      return null; 
    if (i != 0) {
      i--;
      j = paramPixmap.getWidth() - 2 - j - 1;
    } else {
      j = paramPixmap.getWidth() - 2;
    } 
    if (k != 0) {
      k--;
      m = paramPixmap.getHeight() - 2 - m - 1;
    } else {
      m = paramPixmap.getHeight() - 2;
    } 
    return new int[] { i, j, k, m };
  }
  
  public void dispose() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   6: invokevirtual iterator : ()Ljava/util/Iterator;
    //   9: astore_1
    //   10: aload_1
    //   11: invokeinterface hasNext : ()Z
    //   16: ifeq -> 46
    //   19: aload_1
    //   20: invokeinterface next : ()Ljava/lang/Object;
    //   25: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   28: astore_2
    //   29: aload_2
    //   30: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   33: ifnonnull -> 10
    //   36: aload_2
    //   37: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   40: invokevirtual dispose : ()V
    //   43: goto -> 10
    //   46: aload_0
    //   47: iconst_1
    //   48: putfield disposed : Z
    //   51: aload_0
    //   52: monitorexit
    //   53: return
    //   54: astore_2
    //   55: aload_0
    //   56: monitorexit
    //   57: goto -> 62
    //   60: aload_2
    //   61: athrow
    //   62: goto -> 60
    // Exception table:
    //   from	to	target	type
    //   2	10	54	finally
    //   10	43	54	finally
    //   46	51	54	finally }
  
  public TextureAtlas generateTextureAtlas(Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new com/badlogic/gdx/graphics/g2d/TextureAtlas
    //   5: astore #4
    //   7: aload #4
    //   9: invokespecial <init> : ()V
    //   12: aload_0
    //   13: aload #4
    //   15: aload_1
    //   16: aload_2
    //   17: iload_3
    //   18: invokevirtual updateTextureAtlas : (Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V
    //   21: aload_0
    //   22: monitorexit
    //   23: aload #4
    //   25: areturn
    //   26: astore_1
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_1
    //   30: athrow
    // Exception table:
    //   from	to	target	type
    //   2	21	26	finally }
  
  public boolean getDuplicateBorder() { return this.duplicateBorder; }
  
  public boolean getPackToTexture() { return this.packToTexture; }
  
  public int getPadding() { return this.padding; }
  
  public Page getPage(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   6: invokevirtual iterator : ()Ljava/util/Iterator;
    //   9: astore_2
    //   10: aload_2
    //   11: invokeinterface hasNext : ()Z
    //   16: ifeq -> 51
    //   19: aload_2
    //   20: invokeinterface next : ()Ljava/lang/Object;
    //   25: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   28: astore_3
    //   29: aload_3
    //   30: getfield rects : Lcom/badlogic/gdx/utils/OrderedMap;
    //   33: aload_1
    //   34: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   37: checkcast com/badlogic/gdx/math/Rectangle
    //   40: astore #4
    //   42: aload #4
    //   44: ifnull -> 10
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_3
    //   50: areturn
    //   51: aload_0
    //   52: monitorexit
    //   53: aconst_null
    //   54: areturn
    //   55: astore_1
    //   56: aload_0
    //   57: monitorexit
    //   58: goto -> 63
    //   61: aload_1
    //   62: athrow
    //   63: goto -> 61
    // Exception table:
    //   from	to	target	type
    //   2	10	55	finally
    //   10	42	55	finally }
  
  public Pixmap.Format getPageFormat() { return this.pageFormat; }
  
  public int getPageHeight() { return this.pageHeight; }
  
  public int getPageIndex(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore_2
    //   4: iload_2
    //   5: aload_0
    //   6: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   9: getfield size : I
    //   12: if_icmpge -> 51
    //   15: aload_0
    //   16: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   19: iload_2
    //   20: invokevirtual get : (I)Ljava/lang/Object;
    //   23: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   26: getfield rects : Lcom/badlogic/gdx/utils/OrderedMap;
    //   29: aload_1
    //   30: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   33: checkcast com/badlogic/gdx/math/Rectangle
    //   36: astore_3
    //   37: aload_3
    //   38: ifnull -> 45
    //   41: aload_0
    //   42: monitorexit
    //   43: iload_2
    //   44: ireturn
    //   45: iinc #2, 1
    //   48: goto -> 4
    //   51: aload_0
    //   52: monitorexit
    //   53: iconst_m1
    //   54: ireturn
    //   55: astore_1
    //   56: aload_0
    //   57: monitorexit
    //   58: goto -> 63
    //   61: aload_1
    //   62: athrow
    //   63: goto -> 61
    // Exception table:
    //   from	to	target	type
    //   4	37	55	finally }
  
  public int getPageWidth() { return this.pageWidth; }
  
  public Array<Page> getPages() { return this.pages; }
  
  public Rectangle getRect(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   6: invokevirtual iterator : ()Ljava/util/Iterator;
    //   9: astore_2
    //   10: aload_2
    //   11: invokeinterface hasNext : ()Z
    //   16: ifeq -> 47
    //   19: aload_2
    //   20: invokeinterface next : ()Ljava/lang/Object;
    //   25: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   28: getfield rects : Lcom/badlogic/gdx/utils/OrderedMap;
    //   31: aload_1
    //   32: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   35: checkcast com/badlogic/gdx/math/Rectangle
    //   38: astore_3
    //   39: aload_3
    //   40: ifnull -> 10
    //   43: aload_0
    //   44: monitorexit
    //   45: aload_3
    //   46: areturn
    //   47: aload_0
    //   48: monitorexit
    //   49: aconst_null
    //   50: areturn
    //   51: astore_1
    //   52: aload_0
    //   53: monitorexit
    //   54: goto -> 59
    //   57: aload_1
    //   58: athrow
    //   59: goto -> 57
    // Exception table:
    //   from	to	target	type
    //   2	10	51	finally
    //   10	39	51	finally }
  
  public Color getTransparentColor() { return this.transparentColor; }
  
  public Rectangle pack(Pixmap paramPixmap) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aconst_null
    //   4: aload_1
    //   5: invokevirtual pack : (Ljava/lang/String;Lcom/badlogic/gdx/graphics/Pixmap;)Lcom/badlogic/gdx/math/Rectangle;
    //   8: astore_1
    //   9: aload_0
    //   10: monitorexit
    //   11: aload_1
    //   12: areturn
    //   13: astore_1
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_1
    //   17: athrow
    // Exception table:
    //   from	to	target	type
    //   2	9	13	finally }
  
  public Rectangle pack(String paramString, Pixmap paramPixmap) { // Byte code:
    //   0: aload_1
    //   1: astore_3
    //   2: aload_2
    //   3: astore #4
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield disposed : Z
    //   11: istore #5
    //   13: aconst_null
    //   14: astore #6
    //   16: iload #5
    //   18: ifeq -> 25
    //   21: aload_0
    //   22: monitorexit
    //   23: aconst_null
    //   24: areturn
    //   25: aload_3
    //   26: ifnull -> 76
    //   29: aload_0
    //   30: aload_1
    //   31: invokevirtual getRect : (Ljava/lang/String;)Lcom/badlogic/gdx/math/Rectangle;
    //   34: ifnonnull -> 40
    //   37: goto -> 76
    //   40: new com/badlogic/gdx/utils/GdxRuntimeException
    //   43: astore_2
    //   44: new java/lang/StringBuilder
    //   47: astore_1
    //   48: aload_1
    //   49: invokespecial <init> : ()V
    //   52: aload_1
    //   53: ldc_w 'Pixmap has already been packed with name: '
    //   56: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: pop
    //   60: aload_1
    //   61: aload_3
    //   62: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: pop
    //   66: aload_2
    //   67: aload_1
    //   68: invokevirtual toString : ()Ljava/lang/String;
    //   71: invokespecial <init> : (Ljava/lang/String;)V
    //   74: aload_2
    //   75: athrow
    //   76: iconst_0
    //   77: istore #7
    //   79: aload_3
    //   80: ifnull -> 99
    //   83: aload_3
    //   84: ldc_w '.9'
    //   87: invokevirtual endsWith : (Ljava/lang/String;)Z
    //   90: ifeq -> 99
    //   93: iconst_1
    //   94: istore #8
    //   96: goto -> 102
    //   99: iconst_0
    //   100: istore #8
    //   102: iload #8
    //   104: ifeq -> 229
    //   107: new com/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle
    //   110: astore #6
    //   112: aload #6
    //   114: iconst_0
    //   115: iconst_0
    //   116: aload_2
    //   117: invokevirtual getWidth : ()I
    //   120: iconst_2
    //   121: isub
    //   122: aload_2
    //   123: invokevirtual getHeight : ()I
    //   126: iconst_2
    //   127: isub
    //   128: invokespecial <init> : (IIII)V
    //   131: new com/badlogic/gdx/graphics/Pixmap
    //   134: astore_1
    //   135: aload_1
    //   136: aload_2
    //   137: invokevirtual getWidth : ()I
    //   140: iconst_2
    //   141: isub
    //   142: aload_2
    //   143: invokevirtual getHeight : ()I
    //   146: iconst_2
    //   147: isub
    //   148: aload_2
    //   149: invokevirtual getFormat : ()Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   152: invokespecial <init> : (IILcom/badlogic/gdx/graphics/Pixmap$Format;)V
    //   155: aload_1
    //   156: getstatic com/badlogic/gdx/graphics/Pixmap$Blending.None : Lcom/badlogic/gdx/graphics/Pixmap$Blending;
    //   159: invokevirtual setBlending : (Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V
    //   162: aload #6
    //   164: aload_0
    //   165: aload #4
    //   167: invokespecial getSplits : (Lcom/badlogic/gdx/graphics/Pixmap;)[I
    //   170: putfield splits : [I
    //   173: aload #6
    //   175: aload_0
    //   176: aload #4
    //   178: aload #6
    //   180: getfield splits : [I
    //   183: invokespecial getPads : (Lcom/badlogic/gdx/graphics/Pixmap;[I)[I
    //   186: putfield pads : [I
    //   189: aload_1
    //   190: aload_2
    //   191: iconst_0
    //   192: iconst_0
    //   193: iconst_1
    //   194: iconst_1
    //   195: aload_2
    //   196: invokevirtual getWidth : ()I
    //   199: iconst_1
    //   200: isub
    //   201: aload_2
    //   202: invokevirtual getHeight : ()I
    //   205: iconst_1
    //   206: isub
    //   207: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIII)V
    //   210: aload_3
    //   211: ldc_w '\.'
    //   214: invokevirtual split : (Ljava/lang/String;)[Ljava/lang/String;
    //   217: iconst_0
    //   218: aaload
    //   219: astore_3
    //   220: aload_1
    //   221: astore_2
    //   222: aload #6
    //   224: astore #4
    //   226: goto -> 680
    //   229: aload_0
    //   230: getfield stripWhitespaceX : Z
    //   233: ifne -> 278
    //   236: aload_0
    //   237: getfield stripWhitespaceY : Z
    //   240: ifeq -> 246
    //   243: goto -> 278
    //   246: new com/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle
    //   249: dup
    //   250: iconst_0
    //   251: iconst_0
    //   252: aload_2
    //   253: invokevirtual getWidth : ()I
    //   256: aload_2
    //   257: invokevirtual getHeight : ()I
    //   260: invokespecial <init> : (IIII)V
    //   263: astore #9
    //   265: aload #4
    //   267: astore_1
    //   268: aload #6
    //   270: astore_2
    //   271: aload #9
    //   273: astore #4
    //   275: goto -> 680
    //   278: aload_2
    //   279: invokevirtual getWidth : ()I
    //   282: istore #10
    //   284: aload_2
    //   285: invokevirtual getHeight : ()I
    //   288: istore #11
    //   290: aload_2
    //   291: invokevirtual getHeight : ()I
    //   294: istore #12
    //   296: aload_0
    //   297: getfield stripWhitespaceY : Z
    //   300: ifeq -> 445
    //   303: iconst_0
    //   304: istore #13
    //   306: iconst_0
    //   307: istore #8
    //   309: iload #13
    //   311: aload_2
    //   312: invokevirtual getHeight : ()I
    //   315: if_icmpge -> 368
    //   318: iconst_0
    //   319: istore #14
    //   321: iload #14
    //   323: aload_2
    //   324: invokevirtual getWidth : ()I
    //   327: if_icmpge -> 359
    //   330: aload #4
    //   332: iload #14
    //   334: iload #13
    //   336: invokevirtual getPixel : (II)I
    //   339: sipush #255
    //   342: iand
    //   343: aload_0
    //   344: getfield alphaThreshold : I
    //   347: if_icmple -> 353
    //   350: goto -> 368
    //   353: iinc #14, 1
    //   356: goto -> 321
    //   359: iinc #8, 1
    //   362: iinc #13, 1
    //   365: goto -> 309
    //   368: aload_2
    //   369: invokevirtual getHeight : ()I
    //   372: istore #13
    //   374: iload #13
    //   376: iconst_1
    //   377: isub
    //   378: istore #14
    //   380: iload #14
    //   382: iload #8
    //   384: if_icmplt -> 438
    //   387: iconst_0
    //   388: istore #13
    //   390: iload #13
    //   392: aload_2
    //   393: invokevirtual getWidth : ()I
    //   396: if_icmpge -> 428
    //   399: aload #4
    //   401: iload #13
    //   403: iload #14
    //   405: invokevirtual getPixel : (II)I
    //   408: sipush #255
    //   411: iand
    //   412: aload_0
    //   413: getfield alphaThreshold : I
    //   416: if_icmple -> 422
    //   419: goto -> 438
    //   422: iinc #13, 1
    //   425: goto -> 390
    //   428: iinc #12, -1
    //   431: iload #14
    //   433: istore #13
    //   435: goto -> 374
    //   438: iload #12
    //   440: istore #14
    //   442: goto -> 452
    //   445: iconst_0
    //   446: istore #8
    //   448: iload #12
    //   450: istore #14
    //   452: aload_2
    //   453: invokevirtual getWidth : ()I
    //   456: istore #13
    //   458: aload_0
    //   459: getfield stripWhitespaceX : Z
    //   462: ifeq -> 598
    //   465: iconst_0
    //   466: istore #12
    //   468: iload #7
    //   470: aload_2
    //   471: invokevirtual getWidth : ()I
    //   474: if_icmpge -> 526
    //   477: iload #8
    //   479: istore #15
    //   481: iload #15
    //   483: iload #14
    //   485: if_icmpge -> 517
    //   488: aload #4
    //   490: iload #7
    //   492: iload #15
    //   494: invokevirtual getPixel : (II)I
    //   497: sipush #255
    //   500: iand
    //   501: aload_0
    //   502: getfield alphaThreshold : I
    //   505: if_icmple -> 511
    //   508: goto -> 526
    //   511: iinc #15, 1
    //   514: goto -> 481
    //   517: iinc #12, 1
    //   520: iinc #7, 1
    //   523: goto -> 468
    //   526: aload_2
    //   527: invokevirtual getWidth : ()I
    //   530: istore #7
    //   532: iload #7
    //   534: iconst_1
    //   535: isub
    //   536: istore #15
    //   538: iload #15
    //   540: iload #12
    //   542: if_icmplt -> 595
    //   545: iload #8
    //   547: istore #7
    //   549: iload #7
    //   551: iload #14
    //   553: if_icmpge -> 585
    //   556: aload #4
    //   558: iload #15
    //   560: iload #7
    //   562: invokevirtual getPixel : (II)I
    //   565: sipush #255
    //   568: iand
    //   569: aload_0
    //   570: getfield alphaThreshold : I
    //   573: if_icmple -> 579
    //   576: goto -> 595
    //   579: iinc #7, 1
    //   582: goto -> 549
    //   585: iinc #13, -1
    //   588: iload #15
    //   590: istore #7
    //   592: goto -> 532
    //   595: goto -> 601
    //   598: iconst_0
    //   599: istore #12
    //   601: iload #13
    //   603: iload #12
    //   605: isub
    //   606: istore #13
    //   608: iload #14
    //   610: iload #8
    //   612: isub
    //   613: istore #14
    //   615: new com/badlogic/gdx/graphics/Pixmap
    //   618: astore_1
    //   619: aload_1
    //   620: iload #13
    //   622: iload #14
    //   624: aload_2
    //   625: invokevirtual getFormat : ()Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   628: invokespecial <init> : (IILcom/badlogic/gdx/graphics/Pixmap$Format;)V
    //   631: aload_1
    //   632: getstatic com/badlogic/gdx/graphics/Pixmap$Blending.None : Lcom/badlogic/gdx/graphics/Pixmap$Blending;
    //   635: invokevirtual setBlending : (Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V
    //   638: aload_1
    //   639: aload_2
    //   640: iconst_0
    //   641: iconst_0
    //   642: iload #12
    //   644: iload #8
    //   646: iload #13
    //   648: iload #14
    //   650: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIII)V
    //   653: aload_1
    //   654: astore_2
    //   655: new com/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle
    //   658: dup
    //   659: iconst_0
    //   660: iconst_0
    //   661: iload #13
    //   663: iload #14
    //   665: iload #12
    //   667: iload #8
    //   669: iload #10
    //   671: iload #11
    //   673: invokespecial <init> : (IIIIIIII)V
    //   676: astore #4
    //   678: aload_2
    //   679: astore_1
    //   680: aload #4
    //   682: invokevirtual getWidth : ()F
    //   685: aload_0
    //   686: getfield pageWidth : I
    //   689: i2f
    //   690: fcmpl
    //   691: ifgt -> 1122
    //   694: aload #4
    //   696: invokevirtual getHeight : ()F
    //   699: aload_0
    //   700: getfield pageHeight : I
    //   703: i2f
    //   704: fcmpl
    //   705: ifle -> 711
    //   708: goto -> 1122
    //   711: aload_0
    //   712: getfield packStrategy : Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$PackStrategy;
    //   715: aload_0
    //   716: aload_3
    //   717: aload #4
    //   719: invokeinterface pack : (Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;Ljava/lang/String;Lcom/badlogic/gdx/math/Rectangle;)Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;
    //   724: astore #6
    //   726: aload_3
    //   727: ifnull -> 751
    //   730: aload #6
    //   732: getfield rects : Lcom/badlogic/gdx/utils/OrderedMap;
    //   735: aload_3
    //   736: aload #4
    //   738: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   741: pop
    //   742: aload #6
    //   744: getfield addedRects : Lcom/badlogic/gdx/utils/Array;
    //   747: aload_3
    //   748: invokevirtual add : (Ljava/lang/Object;)V
    //   751: aload #4
    //   753: getfield x : F
    //   756: f2i
    //   757: istore #11
    //   759: aload #4
    //   761: getfield y : F
    //   764: f2i
    //   765: istore #14
    //   767: aload #4
    //   769: getfield width : F
    //   772: f2i
    //   773: istore #16
    //   775: aload #4
    //   777: getfield height : F
    //   780: f2i
    //   781: istore #8
    //   783: aload_0
    //   784: getfield packToTexture : Z
    //   787: ifeq -> 861
    //   790: aload_0
    //   791: getfield duplicateBorder : Z
    //   794: ifne -> 861
    //   797: aload #6
    //   799: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   802: ifnull -> 861
    //   805: aload #6
    //   807: getfield dirty : Z
    //   810: ifne -> 861
    //   813: aload #6
    //   815: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   818: invokevirtual bind : ()V
    //   821: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   824: aload #6
    //   826: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   829: getfield glTarget : I
    //   832: iconst_0
    //   833: iload #11
    //   835: iload #14
    //   837: iload #16
    //   839: iload #8
    //   841: aload_1
    //   842: invokevirtual getGLFormat : ()I
    //   845: aload_1
    //   846: invokevirtual getGLType : ()I
    //   849: aload_1
    //   850: invokevirtual getPixels : ()Ljava/nio/ByteBuffer;
    //   853: invokeinterface glTexSubImage2D : (IIIIIIIILjava/nio/Buffer;)V
    //   858: goto -> 867
    //   861: aload #6
    //   863: iconst_1
    //   864: putfield dirty : Z
    //   867: aload #6
    //   869: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   872: aload_1
    //   873: iload #11
    //   875: iload #14
    //   877: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;II)V
    //   880: aload_0
    //   881: getfield duplicateBorder : Z
    //   884: ifeq -> 1109
    //   887: aload_1
    //   888: invokevirtual getWidth : ()I
    //   891: istore #17
    //   893: aload_1
    //   894: invokevirtual getHeight : ()I
    //   897: istore #10
    //   899: aload #6
    //   901: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   904: astore_3
    //   905: iload #11
    //   907: iconst_1
    //   908: isub
    //   909: istore #18
    //   911: iload #14
    //   913: iconst_1
    //   914: isub
    //   915: istore #19
    //   917: aload_3
    //   918: aload_1
    //   919: iconst_0
    //   920: iconst_0
    //   921: iconst_1
    //   922: iconst_1
    //   923: iload #18
    //   925: iload #19
    //   927: iconst_1
    //   928: iconst_1
    //   929: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   932: aload #6
    //   934: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   937: astore_3
    //   938: iload #17
    //   940: iconst_1
    //   941: isub
    //   942: istore #12
    //   944: iload #11
    //   946: iload #16
    //   948: iadd
    //   949: istore #7
    //   951: aload_3
    //   952: aload_1
    //   953: iload #12
    //   955: iconst_0
    //   956: iconst_1
    //   957: iconst_1
    //   958: iload #7
    //   960: iload #19
    //   962: iconst_1
    //   963: iconst_1
    //   964: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   967: aload #6
    //   969: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   972: astore_3
    //   973: iload #10
    //   975: iconst_1
    //   976: isub
    //   977: istore #13
    //   979: iload #14
    //   981: iload #8
    //   983: iadd
    //   984: istore #15
    //   986: aload_3
    //   987: aload_1
    //   988: iconst_0
    //   989: iload #13
    //   991: iconst_1
    //   992: iconst_1
    //   993: iload #18
    //   995: iload #15
    //   997: iconst_1
    //   998: iconst_1
    //   999: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   1002: aload #6
    //   1004: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   1007: aload_1
    //   1008: iload #12
    //   1010: iload #13
    //   1012: iconst_1
    //   1013: iconst_1
    //   1014: iload #7
    //   1016: iload #15
    //   1018: iconst_1
    //   1019: iconst_1
    //   1020: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   1023: aload #6
    //   1025: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   1028: aload_1
    //   1029: iconst_0
    //   1030: iconst_0
    //   1031: iload #17
    //   1033: iconst_1
    //   1034: iload #11
    //   1036: iload #19
    //   1038: iload #16
    //   1040: iconst_1
    //   1041: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   1044: aload #6
    //   1046: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   1049: aload_1
    //   1050: iconst_0
    //   1051: iload #13
    //   1053: iload #17
    //   1055: iconst_1
    //   1056: iload #11
    //   1058: iload #15
    //   1060: iload #16
    //   1062: iconst_1
    //   1063: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   1066: aload #6
    //   1068: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   1071: aload_1
    //   1072: iconst_0
    //   1073: iconst_0
    //   1074: iconst_1
    //   1075: iload #10
    //   1077: iload #18
    //   1079: iload #14
    //   1081: iconst_1
    //   1082: iload #8
    //   1084: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   1087: aload #6
    //   1089: getfield image : Lcom/badlogic/gdx/graphics/Pixmap;
    //   1092: aload_1
    //   1093: iload #12
    //   1095: iconst_0
    //   1096: iconst_1
    //   1097: iload #10
    //   1099: iload #7
    //   1101: iload #14
    //   1103: iconst_1
    //   1104: iload #8
    //   1106: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    //   1109: aload_2
    //   1110: ifnull -> 1117
    //   1113: aload_2
    //   1114: invokevirtual dispose : ()V
    //   1117: aload_0
    //   1118: monitorexit
    //   1119: aload #4
    //   1121: areturn
    //   1122: aload_3
    //   1123: ifnonnull -> 1139
    //   1126: new com/badlogic/gdx/utils/GdxRuntimeException
    //   1129: astore_1
    //   1130: aload_1
    //   1131: ldc_w 'Page size too small for pixmap.'
    //   1134: invokespecial <init> : (Ljava/lang/String;)V
    //   1137: aload_1
    //   1138: athrow
    //   1139: new com/badlogic/gdx/utils/GdxRuntimeException
    //   1142: astore_1
    //   1143: new java/lang/StringBuilder
    //   1146: astore_2
    //   1147: aload_2
    //   1148: invokespecial <init> : ()V
    //   1151: aload_2
    //   1152: ldc_w 'Page size too small for pixmap: '
    //   1155: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1158: pop
    //   1159: aload_2
    //   1160: aload_3
    //   1161: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1164: pop
    //   1165: aload_1
    //   1166: aload_2
    //   1167: invokevirtual toString : ()Ljava/lang/String;
    //   1170: invokespecial <init> : (Ljava/lang/String;)V
    //   1173: aload_1
    //   1174: athrow
    //   1175: astore_1
    //   1176: aload_0
    //   1177: monitorexit
    //   1178: goto -> 1183
    //   1181: aload_1
    //   1182: athrow
    //   1183: goto -> 1181
    // Exception table:
    //   from	to	target	type
    //   7	13	1175	finally
    //   29	37	1175	finally
    //   40	76	1175	finally
    //   83	93	1175	finally
    //   107	220	1175	finally
    //   229	243	1175	finally
    //   246	265	1175	finally
    //   278	303	1175	finally
    //   309	318	1175	finally
    //   321	350	1175	finally
    //   368	374	1175	finally
    //   390	419	1175	finally
    //   452	465	1175	finally
    //   468	477	1175	finally
    //   488	508	1175	finally
    //   526	532	1175	finally
    //   556	576	1175	finally
    //   615	653	1175	finally
    //   655	678	1175	finally
    //   680	708	1175	finally
    //   711	726	1175	finally
    //   730	751	1175	finally
    //   751	858	1175	finally
    //   861	867	1175	finally
    //   867	905	1175	finally
    //   917	938	1175	finally
    //   951	973	1175	finally
    //   986	1109	1175	finally
    //   1113	1117	1175	finally
    //   1126	1139	1175	finally
    //   1139	1175	1175	finally }
  
  public void setDuplicateBorder(boolean paramBoolean) { this.duplicateBorder = paramBoolean; }
  
  public void setPackToTexture(boolean paramBoolean) { this.packToTexture = paramBoolean; }
  
  public void setPadding(int paramInt) { this.padding = paramInt; }
  
  public void setPageFormat(Pixmap.Format paramFormat) { this.pageFormat = paramFormat; }
  
  public void setPageHeight(int paramInt) { this.pageHeight = paramInt; }
  
  public void setPageWidth(int paramInt) { this.pageWidth = paramInt; }
  
  public void setTransparentColor(Color paramColor) { this.transparentColor.set(paramColor); }
  
  public void sort(Array<Pixmap> paramArray) { this.packStrategy.sort(paramArray); }
  
  public void updatePageTextures(Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   6: invokevirtual iterator : ()Ljava/util/Iterator;
    //   9: astore #4
    //   11: aload #4
    //   13: invokeinterface hasNext : ()Z
    //   18: ifeq -> 41
    //   21: aload #4
    //   23: invokeinterface next : ()Ljava/lang/Object;
    //   28: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   31: aload_1
    //   32: aload_2
    //   33: iload_3
    //   34: invokevirtual updateTexture : (Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)Z
    //   37: pop
    //   38: goto -> 11
    //   41: aload_0
    //   42: monitorexit
    //   43: return
    //   44: astore_1
    //   45: aload_0
    //   46: monitorexit
    //   47: goto -> 52
    //   50: aload_1
    //   51: athrow
    //   52: goto -> 50
    // Exception table:
    //   from	to	target	type
    //   2	11	44	finally
    //   11	38	44	finally }
  
  public void updateTextureAtlas(TextureAtlas paramTextureAtlas, Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: aload_2
    //   5: aload_3
    //   6: iload #4
    //   8: iconst_1
    //   9: invokevirtual updateTextureAtlas : (Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;ZZ)V
    //   12: aload_0
    //   13: monitorexit
    //   14: return
    //   15: astore_1
    //   16: aload_0
    //   17: monitorexit
    //   18: aload_1
    //   19: athrow
    // Exception table:
    //   from	to	target	type
    //   2	12	15	finally }
  
  public void updateTextureAtlas(TextureAtlas paramTextureAtlas, Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_2
    //   4: aload_3
    //   5: iload #4
    //   7: invokevirtual updatePageTextures : (Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V
    //   10: aload_0
    //   11: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   14: invokevirtual iterator : ()Ljava/util/Iterator;
    //   17: astore #6
    //   19: aload #6
    //   21: invokeinterface hasNext : ()Z
    //   26: ifeq -> 325
    //   29: aload #6
    //   31: invokeinterface next : ()Ljava/lang/Object;
    //   36: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   39: astore #7
    //   41: aload #7
    //   43: getfield addedRects : Lcom/badlogic/gdx/utils/Array;
    //   46: getfield size : I
    //   49: ifle -> 19
    //   52: aload #7
    //   54: getfield addedRects : Lcom/badlogic/gdx/utils/Array;
    //   57: invokevirtual iterator : ()Ljava/util/Iterator;
    //   60: astore #8
    //   62: aload #8
    //   64: invokeinterface hasNext : ()Z
    //   69: ifeq -> 301
    //   72: aload #8
    //   74: invokeinterface next : ()Ljava/lang/Object;
    //   79: checkcast java/lang/String
    //   82: astore_3
    //   83: aload #7
    //   85: getfield rects : Lcom/badlogic/gdx/utils/OrderedMap;
    //   88: aload_3
    //   89: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   92: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$PixmapPackerRectangle
    //   95: astore #9
    //   97: new com/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion
    //   100: astore #10
    //   102: aload #10
    //   104: aload #7
    //   106: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   109: aload #9
    //   111: getfield x : F
    //   114: f2i
    //   115: aload #9
    //   117: getfield y : F
    //   120: f2i
    //   121: aload #9
    //   123: getfield width : F
    //   126: f2i
    //   127: aload #9
    //   129: getfield height : F
    //   132: f2i
    //   133: invokespecial <init> : (Lcom/badlogic/gdx/graphics/Texture;IIII)V
    //   136: aload #9
    //   138: getfield splits : [I
    //   141: ifnull -> 164
    //   144: aload #10
    //   146: aload #9
    //   148: getfield splits : [I
    //   151: putfield splits : [I
    //   154: aload #10
    //   156: aload #9
    //   158: getfield pads : [I
    //   161: putfield pads : [I
    //   164: iconst_m1
    //   165: istore #11
    //   167: aload_3
    //   168: astore_2
    //   169: iload #11
    //   171: istore #12
    //   173: iload #5
    //   175: ifeq -> 219
    //   178: getstatic com/badlogic/gdx/graphics/g2d/PixmapPacker.indexPattern : Ljava/util/regex/Pattern;
    //   181: aload_3
    //   182: invokevirtual matcher : (Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    //   185: astore #13
    //   187: aload_3
    //   188: astore_2
    //   189: iload #11
    //   191: istore #12
    //   193: aload #13
    //   195: invokevirtual matches : ()Z
    //   198: ifeq -> 219
    //   201: aload #13
    //   203: iconst_1
    //   204: invokevirtual group : (I)Ljava/lang/String;
    //   207: astore_2
    //   208: aload #13
    //   210: iconst_2
    //   211: invokevirtual group : (I)Ljava/lang/String;
    //   214: invokestatic parseInt : (Ljava/lang/String;)I
    //   217: istore #12
    //   219: aload #10
    //   221: aload_2
    //   222: putfield name : Ljava/lang/String;
    //   225: aload #10
    //   227: iload #12
    //   229: putfield index : I
    //   232: aload #10
    //   234: aload #9
    //   236: getfield offsetX : I
    //   239: i2f
    //   240: putfield offsetX : F
    //   243: aload #10
    //   245: aload #9
    //   247: getfield originalHeight : I
    //   250: i2f
    //   251: aload #9
    //   253: getfield height : F
    //   256: fsub
    //   257: aload #9
    //   259: getfield offsetY : I
    //   262: i2f
    //   263: fsub
    //   264: f2i
    //   265: i2f
    //   266: putfield offsetY : F
    //   269: aload #10
    //   271: aload #9
    //   273: getfield originalWidth : I
    //   276: putfield originalWidth : I
    //   279: aload #10
    //   281: aload #9
    //   283: getfield originalHeight : I
    //   286: putfield originalHeight : I
    //   289: aload_1
    //   290: invokevirtual getRegions : ()Lcom/badlogic/gdx/utils/Array;
    //   293: aload #10
    //   295: invokevirtual add : (Ljava/lang/Object;)V
    //   298: goto -> 62
    //   301: aload #7
    //   303: getfield addedRects : Lcom/badlogic/gdx/utils/Array;
    //   306: invokevirtual clear : ()V
    //   309: aload_1
    //   310: invokevirtual getTextures : ()Lcom/badlogic/gdx/utils/ObjectSet;
    //   313: aload #7
    //   315: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   318: invokevirtual add : (Ljava/lang/Object;)Z
    //   321: pop
    //   322: goto -> 19
    //   325: aload_0
    //   326: monitorexit
    //   327: return
    //   328: astore_1
    //   329: aload_0
    //   330: monitorexit
    //   331: goto -> 336
    //   334: aload_1
    //   335: athrow
    //   336: goto -> 334
    // Exception table:
    //   from	to	target	type
    //   2	19	328	finally
    //   19	62	328	finally
    //   62	164	328	finally
    //   178	187	328	finally
    //   193	219	328	finally
    //   219	298	328	finally
    //   301	322	328	finally }
  
  public void updateTextureRegions(Array<TextureRegion> paramArray, Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_2
    //   4: aload_3
    //   5: iload #4
    //   7: invokevirtual updatePageTextures : (Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V
    //   10: aload_1
    //   11: getfield size : I
    //   14: aload_0
    //   15: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   18: getfield size : I
    //   21: if_icmpge -> 57
    //   24: new com/badlogic/gdx/graphics/g2d/TextureRegion
    //   27: astore_2
    //   28: aload_2
    //   29: aload_0
    //   30: getfield pages : Lcom/badlogic/gdx/utils/Array;
    //   33: aload_1
    //   34: getfield size : I
    //   37: invokevirtual get : (I)Ljava/lang/Object;
    //   40: checkcast com/badlogic/gdx/graphics/g2d/PixmapPacker$Page
    //   43: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   46: invokespecial <init> : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   49: aload_1
    //   50: aload_2
    //   51: invokevirtual add : (Ljava/lang/Object;)V
    //   54: goto -> 10
    //   57: aload_0
    //   58: monitorexit
    //   59: return
    //   60: astore_1
    //   61: aload_0
    //   62: monitorexit
    //   63: goto -> 68
    //   66: aload_1
    //   67: athrow
    //   68: goto -> 66
    // Exception table:
    //   from	to	target	type
    //   2	10	60	finally
    //   10	54	60	finally }
  
  public static class GuillotineStrategy implements PackStrategy {
    Comparator<Pixmap> comparator;
    
    private Node insert(Node param1Node, Rectangle param1Rectangle) {
      if (!param1Node.full && param1Node.leftChild != null && param1Node.rightChild != null) {
        Node node1 = insert(param1Node.leftChild, param1Rectangle);
        Node node2 = node1;
        if (node1 == null)
          node2 = insert(param1Node.rightChild, param1Rectangle); 
        return node2;
      } 
      if (param1Node.full)
        return null; 
      if (param1Node.rect.width == param1Rectangle.width && param1Node.rect.height == param1Rectangle.height)
        return param1Node; 
      if (param1Node.rect.width < param1Rectangle.width || param1Node.rect.height < param1Rectangle.height)
        return null; 
      param1Node.leftChild = new Node();
      param1Node.rightChild = new Node();
      if ((int)param1Node.rect.width - (int)param1Rectangle.width > (int)param1Node.rect.height - (int)param1Rectangle.height) {
        param1Node.leftChild.rect.x = param1Node.rect.x;
        param1Node.leftChild.rect.y = param1Node.rect.y;
        param1Node.leftChild.rect.width = param1Rectangle.width;
        param1Node.leftChild.rect.height = param1Node.rect.height;
        param1Node.rect.x += param1Rectangle.width;
        param1Node.rightChild.rect.y = param1Node.rect.y;
        param1Node.rect.width -= param1Rectangle.width;
        param1Node.rightChild.rect.height = param1Node.rect.height;
      } else {
        param1Node.leftChild.rect.x = param1Node.rect.x;
        param1Node.leftChild.rect.y = param1Node.rect.y;
        param1Node.leftChild.rect.width = param1Node.rect.width;
        param1Node.leftChild.rect.height = param1Rectangle.height;
        param1Node.rightChild.rect.x = param1Node.rect.x;
        param1Node.rect.y += param1Rectangle.height;
        param1Node.rightChild.rect.width = param1Node.rect.width;
        param1Node.rect.height -= param1Rectangle.height;
      } 
      return insert(param1Node.leftChild, param1Rectangle);
    }
    
    public PixmapPacker.Page pack(PixmapPacker param1PixmapPacker, String param1String, Rectangle param1Rectangle) {
      GuillotinePage guillotinePage;
      if (param1PixmapPacker.pages.size == 0) {
        guillotinePage = new GuillotinePage(param1PixmapPacker);
        param1PixmapPacker.pages.add(guillotinePage);
      } else {
        guillotinePage = (GuillotinePage)param1PixmapPacker.pages.peek();
      } 
      int i = param1PixmapPacker.padding;
      float f1 = param1Rectangle.width;
      float f2 = i;
      param1Rectangle.width = f1 + f2;
      param1Rectangle.height += f2;
      Node node1 = insert(guillotinePage.root, param1Rectangle);
      Node node2 = node1;
      if (node1 == null) {
        guillotinePage = new GuillotinePage(param1PixmapPacker);
        param1PixmapPacker.pages.add(guillotinePage);
        node2 = insert(guillotinePage.root, param1Rectangle);
      } 
      node2.full = true;
      param1Rectangle.set(node2.rect.x, node2.rect.y, node2.rect.width - f2, node2.rect.height - f2);
      return guillotinePage;
    }
    
    public void sort(Array<Pixmap> param1Array) {
      if (this.comparator == null)
        this.comparator = new Comparator<Pixmap>() {
            public int compare(Pixmap param2Pixmap1, Pixmap param2Pixmap2) { return Math.max(param2Pixmap1.getWidth(), param2Pixmap1.getHeight()) - Math.max(param2Pixmap2.getWidth(), param2Pixmap2.getHeight()); }
          }; 
      param1Array.sort(this.comparator);
    }
    
    static class GuillotinePage extends PixmapPacker.Page {
      PixmapPacker.GuillotineStrategy.Node root = new PixmapPacker.GuillotineStrategy.Node();
      
      public GuillotinePage(PixmapPacker param2PixmapPacker) {
        super(param2PixmapPacker);
        this.root.rect.x = param2PixmapPacker.padding;
        this.root.rect.y = param2PixmapPacker.padding;
        this.root.rect.width = (param2PixmapPacker.pageWidth - param2PixmapPacker.padding * 2);
        this.root.rect.height = (param2PixmapPacker.pageHeight - param2PixmapPacker.padding * 2);
      }
    }
    
    static final class Node {
      public boolean full;
      
      public Node leftChild;
      
      public final Rectangle rect = new Rectangle();
      
      public Node rightChild;
    }
  }
  
  class null extends Object implements Comparator<Pixmap> {
    null() {}
    
    public int compare(Pixmap param1Pixmap1, Pixmap param1Pixmap2) { return Math.max(param1Pixmap1.getWidth(), param1Pixmap1.getHeight()) - Math.max(param1Pixmap2.getWidth(), param1Pixmap2.getHeight()); }
  }
  
  static class GuillotinePage extends Page {
    PixmapPacker.GuillotineStrategy.Node root = new PixmapPacker.GuillotineStrategy.Node();
    
    public GuillotinePage(PixmapPacker param1PixmapPacker) {
      super(param1PixmapPacker);
      this.root.rect.x = param1PixmapPacker.padding;
      this.root.rect.y = param1PixmapPacker.padding;
      this.root.rect.width = (param1PixmapPacker.pageWidth - param1PixmapPacker.padding * 2);
      this.root.rect.height = (param1PixmapPacker.pageHeight - param1PixmapPacker.padding * 2);
    }
  }
  
  static final class Node {
    public boolean full;
    
    public Node leftChild;
    
    public final Rectangle rect = new Rectangle();
    
    public Node rightChild;
  }
  
  public static interface PackStrategy {
    PixmapPacker.Page pack(PixmapPacker param1PixmapPacker, String param1String, Rectangle param1Rectangle);
    
    void sort(Array<Pixmap> param1Array);
  }
  
  public static class Page {
    final Array<String> addedRects = new Array();
    
    boolean dirty;
    
    Pixmap image;
    
    OrderedMap<String, PixmapPacker.PixmapPackerRectangle> rects = new OrderedMap();
    
    Texture texture;
    
    public Page(PixmapPacker param1PixmapPacker) {
      this.image = new Pixmap(param1PixmapPacker.pageWidth, param1PixmapPacker.pageHeight, param1PixmapPacker.pageFormat);
      this.image.setBlending(Pixmap.Blending.None);
      this.image.setColor(param1PixmapPacker.getTransparentColor());
      this.image.fill();
    }
    
    public Pixmap getPixmap() { return this.image; }
    
    public OrderedMap<String, PixmapPacker.PixmapPackerRectangle> getRects() { return this.rects; }
    
    public Texture getTexture() { return this.texture; }
    
    public boolean updateTexture(Texture.TextureFilter param1TextureFilter1, Texture.TextureFilter param1TextureFilter2, boolean param1Boolean) {
      Texture texture1 = this.texture;
      if (texture1 != null) {
        if (!this.dirty)
          return false; 
        texture1.load(texture1.getTextureData());
      } else {
        Pixmap pixmap = this.image;
        this.texture = new Texture(new PixmapTextureData(pixmap, pixmap.getFormat(), param1Boolean, false, true)) {
            public void dispose() {
              super.dispose();
              PixmapPacker.Page.this.image.dispose();
            }
          };
        this.texture.setFilter(param1TextureFilter1, param1TextureFilter2);
      } 
      this.dirty = false;
      return true;
    }
  }
  
  class null extends Texture {
    null(TextureData param1TextureData) { super(param1TextureData); }
    
    public void dispose() {
      super.dispose();
      this.this$0.image.dispose();
    }
  }
  
  public static class PixmapPackerRectangle extends Rectangle {
    int offsetX = 0;
    
    int offsetY = 0;
    
    int originalHeight;
    
    int originalWidth;
    
    int[] pads;
    
    int[] splits;
    
    PixmapPackerRectangle(int param1Int1, int param1Int2, int param1Int3, int param1Int4) {
      super(param1Int1, param1Int2, param1Int3, param1Int4);
      this.originalWidth = param1Int3;
      this.originalHeight = param1Int4;
    }
    
    PixmapPackerRectangle(int param1Int1, int param1Int2, int param1Int3, int param1Int4, int param1Int5, int param1Int6, int param1Int7, int param1Int8) {
      super(param1Int1, param1Int2, param1Int3, param1Int4);
      this.originalWidth = param1Int7;
      this.originalHeight = param1Int8;
    }
  }
  
  public static class SkylineStrategy implements PackStrategy {
    Comparator<Pixmap> comparator;
    
    public PixmapPacker.Page pack(PixmapPacker param1PixmapPacker, String param1String, Rectangle param1Rectangle) {
      int i = param1PixmapPacker.padding;
      int j = param1PixmapPacker.pageWidth;
      int k = i * 2;
      int m = j - k;
      int n = param1PixmapPacker.pageHeight - k;
      int i1 = (int)param1Rectangle.width + i;
      int i2 = (int)param1Rectangle.height + i;
      int i3 = param1PixmapPacker.pages.size;
      for (k = 0; k < i3; k++) {
        Object object1;
        SkylinePage skylinePage1 = (SkylinePage)param1PixmapPacker.pages.get(k);
        int i4 = skylinePage1.rows.size;
        param1String = null;
        j = 0;
        while (true) {
          j++;
          object1 = SYNTHETIC_LOCAL_VARIABLE_15;
        } 
        Object object2 = object1;
        if (object1 == null) {
          SkylinePage.Row row1 = (SkylinePage.Row)skylinePage1.rows.peek();
          if (row1.y + i2 >= n)
            continue; 
          if (row1.x + i1 < m) {
            row1.height = Math.max(row1.height, i2);
            object2 = row1;
          } else {
            object2 = object1;
            if (row1.y + row1.height + i2 < n) {
              object2 = new SkylinePage.Row();
              object2.y = row1.y + row1.height;
              object2.height = i2;
              skylinePage1.rows.add(object2);
            } 
          } 
        } 
        if (object2 != null) {
          param1Rectangle.x = object2.x;
          param1Rectangle.y = object2.y;
          object2.x += i1;
          return skylinePage1;
        } 
        continue;
      } 
      SkylinePage skylinePage = new SkylinePage(param1PixmapPacker);
      param1PixmapPacker.pages.add(skylinePage);
      SkylinePage.Row row = new SkylinePage.Row();
      row.x = i1 + i;
      row.y = i;
      row.height = i2;
      skylinePage.rows.add(row);
      float f = i;
      param1Rectangle.x = f;
      param1Rectangle.y = f;
      return skylinePage;
    }
    
    public void sort(Array<Pixmap> param1Array) {
      if (this.comparator == null)
        this.comparator = new Comparator<Pixmap>() {
            public int compare(Pixmap param2Pixmap1, Pixmap param2Pixmap2) { return param2Pixmap1.getHeight() - param2Pixmap2.getHeight(); }
          }; 
      param1Array.sort(this.comparator);
    }
    
    static class SkylinePage extends PixmapPacker.Page {
      Array<Row> rows = new Array();
      
      public SkylinePage(PixmapPacker param2PixmapPacker) { super(param2PixmapPacker); }
      
      static class Row {
        int height;
        
        int x;
        
        int y;
      }
    }
    
    static class Row {
      int height;
      
      int x;
      
      int y;
    }
  }
  
  class null extends Object implements Comparator<Pixmap> {
    null() {}
    
    public int compare(Pixmap param1Pixmap1, Pixmap param1Pixmap2) { return param1Pixmap1.getHeight() - param1Pixmap2.getHeight(); }
  }
  
  static class SkylinePage extends Page {
    Array<Row> rows = new Array();
    
    public SkylinePage(PixmapPacker param1PixmapPacker) { super(param1PixmapPacker); }
    
    static class Row {
      int height;
      
      int x;
      
      int y;
    }
  }
  
  static class Row {
    int height;
    
    int x;
    
    int y;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PixmapPacker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */