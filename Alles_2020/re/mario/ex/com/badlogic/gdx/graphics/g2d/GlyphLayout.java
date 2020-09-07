package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Colors;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class GlyphLayout implements Pool.Poolable {
  private final Array<Color> colorStack = new Array(4);
  
  public float height;
  
  public final Array<GlyphRun> runs = new Array();
  
  public float width;
  
  public GlyphLayout() {}
  
  public GlyphLayout(BitmapFont paramBitmapFont, CharSequence paramCharSequence) { setText(paramBitmapFont, paramCharSequence); }
  
  public GlyphLayout(BitmapFont paramBitmapFont, CharSequence paramCharSequence, int paramInt1, int paramInt2, Color paramColor, float paramFloat, int paramInt3, boolean paramBoolean, String paramString) { setText(paramBitmapFont, paramCharSequence, paramInt1, paramInt2, paramColor, paramFloat, paramInt3, paramBoolean, paramString); }
  
  public GlyphLayout(BitmapFont paramBitmapFont, CharSequence paramCharSequence, Color paramColor, float paramFloat, int paramInt, boolean paramBoolean) { setText(paramBitmapFont, paramCharSequence, paramColor, paramFloat, paramInt, paramBoolean); }
  
  private void adjustLastGlyph(BitmapFont.BitmapFontData paramBitmapFontData, GlyphRun paramGlyphRun) {
    BitmapFont.Glyph glyph = (BitmapFont.Glyph)paramGlyphRun.glyphs.peek();
    if (glyph.fixedWidth)
      return; 
    float f = (glyph.width + glyph.xoffset) * paramBitmapFontData.scaleX - paramBitmapFontData.padRight;
    paramGlyphRun.width += f - paramGlyphRun.xAdvances.peek();
    paramGlyphRun.xAdvances.set(paramGlyphRun.xAdvances.size - 1, f);
  }
  
  private int parseColorMarkup(CharSequence paramCharSequence, int paramInt1, int paramInt2, Pool<Color> paramPool) {
    Color color2;
    Color color1;
    if (paramInt1 == paramInt2)
      return -1; 
    char c = paramCharSequence.charAt(paramInt1);
    byte b = 0;
    if (c != '#') {
      if (c != '[') {
        if (c != ']') {
          int j = paramInt1 + 1;
          while (j < paramInt2) {
            if (paramCharSequence.charAt(j) != ']') {
              j++;
              continue;
            } 
            color1 = Colors.get(paramCharSequence.subSequence(paramInt1, j).toString());
            if (color1 == null)
              return -1; 
            color2 = (Color)paramPool.obtain();
            this.colorStack.add(color2);
            color2.set(color1);
            return j - paramInt1;
          } 
          return -1;
        } 
        if (this.colorStack.size > 1)
          color2.free(this.colorStack.pop()); 
        return 0;
      } 
      return -2;
    } 
    int i = paramInt1 + 1;
    c = Character.MIN_VALUE;
    while (i < paramInt2) {
      char c1 = color1.charAt(i);
      if (c1 == ']') {
        if (i < paramInt1 + 2 || i > paramInt1 + 9)
          break; 
        paramInt2 = i - paramInt1;
        char c2 = c;
        if (paramInt2 <= 7) {
          for (c2 = b; c2 < 9 - paramInt2; c2++)
            c <<= '\004'; 
          c2 = c | 0xFF;
        } 
        color1 = (Color)color2.obtain();
        this.colorStack.add(color1);
        Color.rgba8888ToColor(color1, c2);
        return paramInt2;
      } 
      if (c1 >= '0' && c1 <= '9') {
        c *= '\020';
        c1 -= '0';
      } else if (c1 >= 'a' && c1 <= 'f') {
        c *= '\020';
        c1 -= 'W';
      } else if (c1 >= 'A' && c1 <= 'F') {
        c *= '\020';
        c1 -= '7';
      } else {
        break;
      } 
      c += c1;
      i++;
    } 
    return -1;
  }
  
  private void truncate(BitmapFont.BitmapFontData paramBitmapFontData, GlyphRun paramGlyphRun, float paramFloat, String paramString, int paramInt, Pool<GlyphRun> paramPool) {
    GlyphRun glyphRun = (GlyphRun)paramPool.obtain();
    paramBitmapFontData.getGlyphs(glyphRun, paramString, 0, paramString.length(), null);
    paramInt = glyphRun.xAdvances.size;
    float f1 = 0.0F;
    if (paramInt > 0) {
      adjustLastGlyph(paramBitmapFontData, glyphRun);
      int i = glyphRun.xAdvances.size;
      paramInt = 1;
      f1 = 0.0F;
      while (paramInt < i) {
        f1 += glyphRun.xAdvances.get(paramInt);
        paramInt++;
      } 
    } 
    float f2 = paramGlyphRun.x;
    for (paramInt = 0; paramInt < paramGlyphRun.xAdvances.size; paramInt++) {
      float f = paramGlyphRun.xAdvances.get(paramInt);
      f2 += f;
      if (f2 > paramFloat - f1) {
        paramGlyphRun.width = f2 - paramGlyphRun.x - f;
        break;
      } 
    } 
    if (paramInt > 1) {
      paramGlyphRun.glyphs.truncate(paramInt - 1);
      paramGlyphRun.xAdvances.truncate(paramInt);
      adjustLastGlyph(paramBitmapFontData, paramGlyphRun);
      if (glyphRun.xAdvances.size > 0)
        paramGlyphRun.xAdvances.addAll(glyphRun.xAdvances, 1, glyphRun.xAdvances.size - 1); 
    } else {
      paramGlyphRun.glyphs.clear();
      paramGlyphRun.xAdvances.clear();
      paramGlyphRun.xAdvances.addAll(glyphRun.xAdvances);
      if (glyphRun.xAdvances.size > 0)
        paramGlyphRun.width += glyphRun.xAdvances.get(0); 
    } 
    paramGlyphRun.glyphs.addAll(glyphRun.glyphs);
    paramGlyphRun.width += f1;
    paramPool.free(glyphRun);
  }
  
  private GlyphRun wrap(BitmapFont.BitmapFontData paramBitmapFontData, GlyphRun paramGlyphRun, Pool<GlyphRun> paramPool, int paramInt1, int paramInt2) {
    int k;
    Array array = paramGlyphRun.glyphs;
    int i = paramGlyphRun.glyphs.size;
    FloatArray floatArray = paramGlyphRun.xAdvances;
    int j = paramInt1;
    while (true) {
      k = paramInt1;
      if (j > 0) {
        if (!paramBitmapFontData.isWhitespace((char)((BitmapFont.Glyph)array.get(j - 1)).id)) {
          k = paramInt1;
          break;
        } 
        j--;
        continue;
      } 
      break;
    } 
    while (true) {
      paramInt1 = paramInt2;
      if (k < i) {
        if (!paramBitmapFontData.isWhitespace((char)((BitmapFont.Glyph)array.get(k)).id)) {
          paramInt1 = paramInt2;
          break;
        } 
        k++;
        continue;
      } 
      break;
    } 
    while (paramInt1 < j) {
      paramGlyphRun.width += floatArray.get(paramInt1);
      paramInt1++;
    } 
    paramInt2 = j + 1;
    while (paramInt1 > paramInt2) {
      float f = paramGlyphRun.width;
      paramGlyphRun.width = f - floatArray.get(--paramInt1);
    } 
    GlyphRun glyphRun = null;
    if (k < i) {
      glyphRun = (GlyphRun)paramPool.obtain();
      glyphRun.color.set(paramGlyphRun.color);
      Array array1 = glyphRun.glyphs;
      array1.addAll(array, 0, j);
      array.removeRange(0, k - 1);
      paramGlyphRun.glyphs = array1;
      glyphRun.glyphs = array;
      FloatArray floatArray1 = glyphRun.xAdvances;
      floatArray1.addAll(floatArray, 0, paramInt2);
      floatArray.removeRange(1, k);
      floatArray.set(0, -((BitmapFont.Glyph)array.first()).xoffset * paramBitmapFontData.scaleX - paramBitmapFontData.padLeft);
      paramGlyphRun.xAdvances = floatArray1;
      glyphRun.xAdvances = floatArray;
    } else {
      array.truncate(j);
      floatArray.truncate(paramInt2);
    } 
    if (j == 0) {
      paramPool.free(paramGlyphRun);
      this.runs.pop();
    } else {
      adjustLastGlyph(paramBitmapFontData, paramGlyphRun);
    } 
    return glyphRun;
  }
  
  public void reset() {
    Pools.get(GlyphRun.class).freeAll(this.runs);
    this.runs.clear();
    this.width = 0.0F;
    this.height = 0.0F;
  }
  
  public void setText(BitmapFont paramBitmapFont, CharSequence paramCharSequence) { setText(paramBitmapFont, paramCharSequence, 0, paramCharSequence.length(), paramBitmapFont.getColor(), 0.0F, 8, false, null); }
  
  public void setText(BitmapFont paramBitmapFont, CharSequence paramCharSequence, int paramInt1, int paramInt2, Color paramColor, float paramFloat, int paramInt3, boolean paramBoolean, String paramString) { // Byte code:
    //   0: aload_1
    //   1: getfield data : Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;
    //   4: astore #10
    //   6: aload #9
    //   8: ifnull -> 17
    //   11: iconst_1
    //   12: istore #8
    //   14: goto -> 37
    //   17: fload #6
    //   19: aload #10
    //   21: getfield spaceXadvance : F
    //   24: ldc 3.0
    //   26: fmul
    //   27: fcmpg
    //   28: ifgt -> 37
    //   31: iconst_0
    //   32: istore #8
    //   34: goto -> 37
    //   37: aload #10
    //   39: getfield markupEnabled : Z
    //   42: istore #11
    //   44: ldc com/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun
    //   46: invokestatic get : (Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;
    //   49: astore #12
    //   51: aload_0
    //   52: getfield runs : Lcom/badlogic/gdx/utils/Array;
    //   55: astore #13
    //   57: aload #12
    //   59: aload #13
    //   61: invokevirtual freeAll : (Lcom/badlogic/gdx/utils/Array;)V
    //   64: aload #13
    //   66: invokevirtual clear : ()V
    //   69: aload_0
    //   70: getfield colorStack : Lcom/badlogic/gdx/utils/Array;
    //   73: astore #14
    //   75: aload #14
    //   77: aload #5
    //   79: invokevirtual add : (Ljava/lang/Object;)V
    //   82: ldc com/badlogic/gdx/graphics/Color
    //   84: invokestatic get : (Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;
    //   87: astore_1
    //   88: iload_3
    //   89: istore #15
    //   91: aload #5
    //   93: astore #16
    //   95: aload #16
    //   97: astore #5
    //   99: aconst_null
    //   100: astore #17
    //   102: fconst_0
    //   103: fstore #18
    //   105: fconst_0
    //   106: fstore #19
    //   108: fconst_0
    //   109: fstore #20
    //   111: iconst_0
    //   112: istore_3
    //   113: iconst_0
    //   114: istore #21
    //   116: iload #15
    //   118: istore #22
    //   120: aload #16
    //   122: astore #23
    //   124: aload #17
    //   126: astore #16
    //   128: aload_2
    //   129: astore #17
    //   131: iload #22
    //   133: iload #4
    //   135: if_icmpne -> 161
    //   138: iload #15
    //   140: iload #4
    //   142: if_icmpne -> 151
    //   145: iload_3
    //   146: istore #4
    //   148: goto -> 755
    //   151: iload #4
    //   153: istore #24
    //   155: iconst_0
    //   156: istore #25
    //   158: goto -> 285
    //   161: iload #22
    //   163: iconst_1
    //   164: iadd
    //   165: istore #24
    //   167: aload #17
    //   169: iload #22
    //   171: invokeinterface charAt : (I)C
    //   176: istore #22
    //   178: iload #22
    //   180: bipush #10
    //   182: if_icmpeq -> 275
    //   185: iload #22
    //   187: bipush #91
    //   189: if_icmpeq -> 195
    //   192: goto -> 262
    //   195: iload #11
    //   197: ifeq -> 262
    //   200: aload_0
    //   201: aload #17
    //   203: iload #24
    //   205: iload #4
    //   207: aload_1
    //   208: invokespecial parseColorMarkup : (Ljava/lang/CharSequence;IILcom/badlogic/gdx/utils/Pool;)I
    //   211: istore #22
    //   213: iload #22
    //   215: iflt -> 246
    //   218: aload #14
    //   220: invokevirtual peek : ()Ljava/lang/Object;
    //   223: checkcast com/badlogic/gdx/graphics/Color
    //   226: astore #5
    //   228: iload #24
    //   230: iload #22
    //   232: iconst_1
    //   233: iadd
    //   234: iadd
    //   235: istore #22
    //   237: iconst_0
    //   238: istore #25
    //   240: iinc #24, -1
    //   243: goto -> 285
    //   246: iload #22
    //   248: bipush #-2
    //   250: if_icmpne -> 262
    //   253: iload #24
    //   255: iconst_1
    //   256: iadd
    //   257: istore #22
    //   259: goto -> 128
    //   262: iconst_0
    //   263: istore #25
    //   265: iload #24
    //   267: istore #22
    //   269: iconst_m1
    //   270: istore #24
    //   272: goto -> 285
    //   275: iconst_1
    //   276: istore #25
    //   278: iload #24
    //   280: istore #22
    //   282: iinc #24, -1
    //   285: iload #24
    //   287: iconst_m1
    //   288: if_icmpeq -> 1758
    //   291: iload #24
    //   293: iload #15
    //   295: if_icmpeq -> 1646
    //   298: aload #12
    //   300: invokevirtual obtain : ()Ljava/lang/Object;
    //   303: checkcast com/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun
    //   306: astore #17
    //   308: aload #17
    //   310: getfield color : Lcom/badlogic/gdx/graphics/Color;
    //   313: aload #23
    //   315: invokevirtual set : (Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;
    //   318: pop
    //   319: aload_1
    //   320: astore #23
    //   322: aload #10
    //   324: aload #17
    //   326: aload_2
    //   327: iload #15
    //   329: iload #24
    //   331: aload #16
    //   333: invokevirtual getGlyphs : (Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Ljava/lang/CharSequence;IILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V
    //   336: aload #17
    //   338: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   341: getfield size : I
    //   344: ifne -> 357
    //   347: aload #12
    //   349: aload #17
    //   351: invokevirtual free : (Ljava/lang/Object;)V
    //   354: goto -> 1646
    //   357: fload #19
    //   359: fstore #26
    //   361: aload #16
    //   363: ifnull -> 424
    //   366: aload #16
    //   368: getfield fixedWidth : Z
    //   371: ifeq -> 391
    //   374: aload #16
    //   376: getfield xadvance : I
    //   379: i2f
    //   380: aload #10
    //   382: getfield scaleX : F
    //   385: fmul
    //   386: fstore #26
    //   388: goto -> 417
    //   391: aload #16
    //   393: getfield width : I
    //   396: aload #16
    //   398: getfield xoffset : I
    //   401: iadd
    //   402: i2f
    //   403: aload #10
    //   405: getfield scaleX : F
    //   408: fmul
    //   409: aload #10
    //   411: getfield padRight : F
    //   414: fsub
    //   415: fstore #26
    //   417: fload #19
    //   419: fload #26
    //   421: fsub
    //   422: fstore #26
    //   424: aload #17
    //   426: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   429: invokevirtual peek : ()Ljava/lang/Object;
    //   432: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
    //   435: astore #16
    //   437: aload #17
    //   439: fload #26
    //   441: putfield x : F
    //   444: aload #17
    //   446: fload #18
    //   448: putfield y : F
    //   451: iload #25
    //   453: ifne -> 463
    //   456: iload #24
    //   458: iload #4
    //   460: if_icmpne -> 471
    //   463: aload_0
    //   464: aload #10
    //   466: aload #17
    //   468: invokespecial adjustLastGlyph : (Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V
    //   471: aload #13
    //   473: aload #17
    //   475: invokevirtual add : (Ljava/lang/Object;)V
    //   478: aload #17
    //   480: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   483: getfield items : [F
    //   486: astore #27
    //   488: aload #17
    //   490: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   493: getfield size : I
    //   496: istore #28
    //   498: iload #8
    //   500: ifne -> 553
    //   503: iconst_0
    //   504: istore #29
    //   506: fconst_0
    //   507: fstore #19
    //   509: iload #29
    //   511: iload #28
    //   513: if_icmpge -> 532
    //   516: fload #19
    //   518: aload #27
    //   520: iload #29
    //   522: faload
    //   523: fadd
    //   524: fstore #19
    //   526: iinc #29, 1
    //   529: goto -> 509
    //   532: fload #26
    //   534: fload #19
    //   536: fadd
    //   537: fstore #26
    //   539: aload #17
    //   541: fload #19
    //   543: putfield width : F
    //   546: fload #26
    //   548: fstore #19
    //   550: goto -> 577
    //   553: fload #26
    //   555: aload #27
    //   557: iconst_0
    //   558: faload
    //   559: fadd
    //   560: fstore #19
    //   562: aload #17
    //   564: aload #27
    //   566: iconst_0
    //   567: faload
    //   568: putfield width : F
    //   571: iload #28
    //   573: iconst_1
    //   574: if_icmpge -> 583
    //   577: aload #23
    //   579: astore_1
    //   580: goto -> 1646
    //   583: fload #19
    //   585: aload #27
    //   587: iconst_1
    //   588: faload
    //   589: fadd
    //   590: fstore #19
    //   592: aload #17
    //   594: aload #17
    //   596: getfield width : F
    //   599: aload #27
    //   601: iconst_1
    //   602: faload
    //   603: fadd
    //   604: putfield width : F
    //   607: iconst_2
    //   608: istore #29
    //   610: aload #23
    //   612: astore_1
    //   613: aload #17
    //   615: astore #23
    //   617: aload #27
    //   619: astore #17
    //   621: iload #29
    //   623: iload #28
    //   625: if_icmpge -> 1643
    //   628: aload #23
    //   630: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   633: astore #27
    //   635: iload #29
    //   637: iconst_1
    //   638: isub
    //   639: istore #30
    //   641: aload #27
    //   643: iload #30
    //   645: invokevirtual get : (I)Ljava/lang/Object;
    //   648: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
    //   651: astore #27
    //   653: aload #27
    //   655: getfield width : I
    //   658: aload #27
    //   660: getfield xoffset : I
    //   663: iadd
    //   664: i2f
    //   665: aload #10
    //   667: getfield scaleX : F
    //   670: fmul
    //   671: aload #10
    //   673: getfield padRight : F
    //   676: fsub
    //   677: fload #19
    //   679: fadd
    //   680: fload #6
    //   682: fcmpg
    //   683: ifgt -> 715
    //   686: fload #19
    //   688: aload #17
    //   690: iload #29
    //   692: faload
    //   693: fadd
    //   694: fstore #19
    //   696: aload #23
    //   698: aload #23
    //   700: getfield width : F
    //   703: aload #17
    //   705: iload #29
    //   707: faload
    //   708: fadd
    //   709: putfield width : F
    //   712: goto -> 1637
    //   715: aload #9
    //   717: ifnull -> 1124
    //   720: aload_0
    //   721: aload #10
    //   723: aload #23
    //   725: fload #6
    //   727: aload #9
    //   729: iload #29
    //   731: aload #12
    //   733: invokespecial truncate : (Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;FLjava/lang/String;ILcom/badlogic/gdx/utils/Pool;)V
    //   736: aload #23
    //   738: getfield x : F
    //   741: aload #23
    //   743: getfield width : F
    //   746: fadd
    //   747: fstore #19
    //   749: iload_3
    //   750: istore #4
    //   752: goto -> 148
    //   755: fload #20
    //   757: fload #19
    //   759: invokestatic max : (FF)F
    //   762: fstore #31
    //   764: aload #14
    //   766: getfield size : I
    //   769: istore #22
    //   771: iconst_1
    //   772: istore_3
    //   773: iload_3
    //   774: iload #22
    //   776: if_icmpge -> 795
    //   779: aload_1
    //   780: aload #14
    //   782: iload_3
    //   783: invokevirtual get : (I)Ljava/lang/Object;
    //   786: invokevirtual free : (Ljava/lang/Object;)V
    //   789: iinc #3, 1
    //   792: goto -> 773
    //   795: aload #14
    //   797: invokevirtual clear : ()V
    //   800: iload #7
    //   802: bipush #8
    //   804: iand
    //   805: ifne -> 1034
    //   808: iload #7
    //   810: iconst_1
    //   811: iand
    //   812: ifeq -> 821
    //   815: iconst_1
    //   816: istore #7
    //   818: goto -> 824
    //   821: iconst_0
    //   822: istore #7
    //   824: aload #13
    //   826: getfield size : I
    //   829: istore #24
    //   831: iconst_0
    //   832: istore #22
    //   834: fconst_0
    //   835: fstore #20
    //   837: ldc_w -2.14748365E9
    //   840: fstore #19
    //   842: iconst_0
    //   843: istore_3
    //   844: iload #22
    //   846: iload #24
    //   848: if_icmpge -> 979
    //   851: aload #13
    //   853: iload #22
    //   855: invokevirtual get : (I)Ljava/lang/Object;
    //   858: checkcast com/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun
    //   861: astore_2
    //   862: fload #20
    //   864: fstore #26
    //   866: fload #19
    //   868: fstore #18
    //   870: iload_3
    //   871: istore #15
    //   873: aload_2
    //   874: getfield y : F
    //   877: fload #19
    //   879: fcmpl
    //   880: ifeq -> 950
    //   883: aload_2
    //   884: getfield y : F
    //   887: fstore #18
    //   889: fload #6
    //   891: fload #20
    //   893: fsub
    //   894: fstore #19
    //   896: fload #19
    //   898: fstore #20
    //   900: iload #7
    //   902: ifeq -> 911
    //   905: fload #19
    //   907: fconst_2
    //   908: fdiv
    //   909: fstore #20
    //   911: iload_3
    //   912: iload #22
    //   914: if_icmpge -> 944
    //   917: aload #13
    //   919: iload_3
    //   920: invokevirtual get : (I)Ljava/lang/Object;
    //   923: checkcast com/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun
    //   926: astore_1
    //   927: aload_1
    //   928: aload_1
    //   929: getfield x : F
    //   932: fload #20
    //   934: fadd
    //   935: putfield x : F
    //   938: iinc #3, 1
    //   941: goto -> 911
    //   944: fconst_0
    //   945: fstore #26
    //   947: iload_3
    //   948: istore #15
    //   950: fload #26
    //   952: aload_2
    //   953: getfield x : F
    //   956: aload_2
    //   957: getfield width : F
    //   960: fadd
    //   961: invokestatic max : (FF)F
    //   964: fstore #20
    //   966: iinc #22, 1
    //   969: fload #18
    //   971: fstore #19
    //   973: iload #15
    //   975: istore_3
    //   976: goto -> 844
    //   979: fload #6
    //   981: fload #20
    //   983: fsub
    //   984: fstore #20
    //   986: fload #20
    //   988: fstore #6
    //   990: iload #7
    //   992: ifeq -> 1001
    //   995: fload #20
    //   997: fconst_2
    //   998: fdiv
    //   999: fstore #6
    //   1001: iload_3
    //   1002: iload #24
    //   1004: if_icmpge -> 1034
    //   1007: aload #13
    //   1009: iload_3
    //   1010: invokevirtual get : (I)Ljava/lang/Object;
    //   1013: checkcast com/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun
    //   1016: astore_1
    //   1017: aload_1
    //   1018: aload_1
    //   1019: getfield x : F
    //   1022: fload #6
    //   1024: fadd
    //   1025: putfield x : F
    //   1028: iinc #3, 1
    //   1031: goto -> 1001
    //   1034: aload_0
    //   1035: fload #31
    //   1037: putfield width : F
    //   1040: aload #10
    //   1042: getfield flipped : Z
    //   1045: ifeq -> 1086
    //   1048: aload_0
    //   1049: aload #10
    //   1051: getfield capHeight : F
    //   1054: iload #4
    //   1056: i2f
    //   1057: aload #10
    //   1059: getfield down : F
    //   1062: fmul
    //   1063: fadd
    //   1064: iload #21
    //   1066: i2f
    //   1067: aload #10
    //   1069: getfield down : F
    //   1072: fmul
    //   1073: aload #10
    //   1075: getfield blankLineScale : F
    //   1078: fmul
    //   1079: fadd
    //   1080: putfield height : F
    //   1083: goto -> 1123
    //   1086: aload_0
    //   1087: aload #10
    //   1089: getfield capHeight : F
    //   1092: iload #4
    //   1094: i2f
    //   1095: aload #10
    //   1097: getfield down : F
    //   1100: fneg
    //   1101: fmul
    //   1102: fadd
    //   1103: iload #21
    //   1105: i2f
    //   1106: aload #10
    //   1108: getfield down : F
    //   1111: fneg
    //   1112: fmul
    //   1113: aload #10
    //   1115: getfield blankLineScale : F
    //   1118: fmul
    //   1119: fadd
    //   1120: putfield height : F
    //   1123: return
    //   1124: aload #10
    //   1126: aload #23
    //   1128: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1131: iload #29
    //   1133: invokevirtual getWrapIndex : (Lcom/badlogic/gdx/utils/Array;I)I
    //   1136: istore #32
    //   1138: aload #23
    //   1140: getfield x : F
    //   1143: fconst_0
    //   1144: fcmpl
    //   1145: ifne -> 1157
    //   1148: iload #30
    //   1150: istore #28
    //   1152: iload #32
    //   1154: ifeq -> 1181
    //   1157: iload #32
    //   1159: aload #23
    //   1161: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1164: getfield size : I
    //   1167: if_icmplt -> 1177
    //   1170: iload #30
    //   1172: istore #28
    //   1174: goto -> 1181
    //   1177: iload #32
    //   1179: istore #28
    //   1181: iload #28
    //   1183: ifne -> 1469
    //   1186: aload #23
    //   1188: fconst_0
    //   1189: putfield width : F
    //   1192: aload #23
    //   1194: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1197: getfield size : I
    //   1200: istore #30
    //   1202: iload #28
    //   1204: istore #29
    //   1206: iload #29
    //   1208: iload #30
    //   1210: if_icmpge -> 1247
    //   1213: aload #10
    //   1215: aload #23
    //   1217: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1220: iload #29
    //   1222: invokevirtual get : (I)Ljava/lang/Object;
    //   1225: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
    //   1228: getfield id : I
    //   1231: i2c
    //   1232: invokevirtual isWhitespace : (C)Z
    //   1235: ifne -> 1241
    //   1238: goto -> 1247
    //   1241: iinc #29, 1
    //   1244: goto -> 1206
    //   1247: iload #29
    //   1249: ifle -> 1276
    //   1252: aload #23
    //   1254: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1257: iconst_0
    //   1258: iload #29
    //   1260: iconst_1
    //   1261: isub
    //   1262: invokevirtual removeRange : (II)V
    //   1265: aload #23
    //   1267: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   1270: iconst_1
    //   1271: iload #29
    //   1273: invokevirtual removeRange : (II)V
    //   1276: aload #23
    //   1278: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   1281: iconst_0
    //   1282: aload #23
    //   1284: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1287: invokevirtual first : ()Ljava/lang/Object;
    //   1290: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
    //   1293: getfield xoffset : I
    //   1296: ineg
    //   1297: i2f
    //   1298: aload #10
    //   1300: getfield scaleX : F
    //   1303: fmul
    //   1304: aload #10
    //   1306: getfield padLeft : F
    //   1309: fsub
    //   1310: invokevirtual set : (IF)V
    //   1313: aload #13
    //   1315: getfield size : I
    //   1318: iconst_1
    //   1319: if_icmple -> 1466
    //   1322: aload #13
    //   1324: aload #13
    //   1326: getfield size : I
    //   1329: iconst_2
    //   1330: isub
    //   1331: invokevirtual get : (I)Ljava/lang/Object;
    //   1334: checkcast com/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun
    //   1337: astore #16
    //   1339: aload #16
    //   1341: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1344: getfield size : I
    //   1347: iconst_1
    //   1348: isub
    //   1349: istore #29
    //   1351: iload #29
    //   1353: ifle -> 1413
    //   1356: aload #10
    //   1358: aload #16
    //   1360: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1363: iload #29
    //   1365: invokevirtual get : (I)Ljava/lang/Object;
    //   1368: checkcast com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
    //   1371: getfield id : I
    //   1374: i2c
    //   1375: invokevirtual isWhitespace : (C)Z
    //   1378: ifne -> 1384
    //   1381: goto -> 1413
    //   1384: aload #16
    //   1386: aload #16
    //   1388: getfield width : F
    //   1391: aload #16
    //   1393: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   1396: iload #29
    //   1398: iconst_1
    //   1399: iadd
    //   1400: invokevirtual get : (I)F
    //   1403: fsub
    //   1404: putfield width : F
    //   1407: iinc #29, -1
    //   1410: goto -> 1351
    //   1413: aload #16
    //   1415: getfield glyphs : Lcom/badlogic/gdx/utils/Array;
    //   1418: iload #29
    //   1420: iconst_1
    //   1421: iadd
    //   1422: invokevirtual truncate : (I)V
    //   1425: aload #16
    //   1427: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   1430: iload #29
    //   1432: iconst_2
    //   1433: iadd
    //   1434: invokevirtual truncate : (I)V
    //   1437: aload_0
    //   1438: aload #10
    //   1440: aload #16
    //   1442: invokespecial adjustLastGlyph : (Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;)V
    //   1445: fload #20
    //   1447: aload #16
    //   1449: getfield x : F
    //   1452: aload #16
    //   1454: getfield width : F
    //   1457: fadd
    //   1458: invokestatic max : (FF)F
    //   1461: fstore #20
    //   1463: goto -> 1547
    //   1466: goto -> 1547
    //   1469: aload_1
    //   1470: astore #17
    //   1472: aload_0
    //   1473: aload #10
    //   1475: aload #23
    //   1477: aload #12
    //   1479: iload #28
    //   1481: iload #29
    //   1483: invokespecial wrap : (Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;Lcom/badlogic/gdx/utils/Pool;II)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout$GlyphRun;
    //   1486: astore #16
    //   1488: fload #20
    //   1490: aload #23
    //   1492: getfield x : F
    //   1495: aload #23
    //   1497: getfield width : F
    //   1500: fadd
    //   1501: invokestatic max : (FF)F
    //   1504: fstore #20
    //   1506: aload #16
    //   1508: ifnonnull -> 1536
    //   1511: fload #18
    //   1513: aload #10
    //   1515: getfield down : F
    //   1518: fadd
    //   1519: fstore #18
    //   1521: iinc #3, 1
    //   1524: aconst_null
    //   1525: astore #16
    //   1527: fconst_0
    //   1528: fstore #19
    //   1530: aload #17
    //   1532: astore_1
    //   1533: goto -> 580
    //   1536: aload #13
    //   1538: aload #16
    //   1540: invokevirtual add : (Ljava/lang/Object;)V
    //   1543: aload #16
    //   1545: astore #23
    //   1547: aload #23
    //   1549: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   1552: getfield size : I
    //   1555: istore #28
    //   1557: aload #23
    //   1559: getfield xAdvances : Lcom/badlogic/gdx/utils/FloatArray;
    //   1562: getfield items : [F
    //   1565: astore #17
    //   1567: aload #17
    //   1569: iconst_0
    //   1570: faload
    //   1571: fstore #26
    //   1573: fload #26
    //   1575: fstore #19
    //   1577: iload #28
    //   1579: iconst_1
    //   1580: if_icmple -> 1592
    //   1583: fload #26
    //   1585: aload #17
    //   1587: iconst_1
    //   1588: faload
    //   1589: fadd
    //   1590: fstore #19
    //   1592: aload #23
    //   1594: aload #23
    //   1596: getfield width : F
    //   1599: fload #19
    //   1601: fadd
    //   1602: putfield width : F
    //   1605: fload #18
    //   1607: aload #10
    //   1609: getfield down : F
    //   1612: fadd
    //   1613: fstore #18
    //   1615: iinc #3, 1
    //   1618: aload #23
    //   1620: fconst_0
    //   1621: putfield x : F
    //   1624: aload #23
    //   1626: fload #18
    //   1628: putfield y : F
    //   1631: aconst_null
    //   1632: astore #16
    //   1634: iconst_1
    //   1635: istore #29
    //   1637: iinc #29, 1
    //   1640: goto -> 621
    //   1643: goto -> 1646
    //   1646: fload #19
    //   1648: fstore #33
    //   1650: fload #20
    //   1652: fstore #31
    //   1654: fload #18
    //   1656: fstore #26
    //   1658: iload_3
    //   1659: istore #28
    //   1661: iload #21
    //   1663: istore #29
    //   1665: iload #25
    //   1667: ifeq -> 1732
    //   1670: fload #20
    //   1672: fload #19
    //   1674: invokestatic max : (FF)F
    //   1677: fstore #31
    //   1679: aload #10
    //   1681: getfield down : F
    //   1684: fstore #20
    //   1686: iload #24
    //   1688: iload #15
    //   1690: if_icmpne -> 1709
    //   1693: fload #20
    //   1695: aload #10
    //   1697: getfield blankLineScale : F
    //   1700: fmul
    //   1701: fstore #20
    //   1703: iinc #21, 1
    //   1706: goto -> 1712
    //   1709: iinc #3, 1
    //   1712: fload #18
    //   1714: fload #20
    //   1716: fadd
    //   1717: fstore #26
    //   1719: aconst_null
    //   1720: astore #16
    //   1722: fconst_0
    //   1723: fstore #33
    //   1725: iload #21
    //   1727: istore #29
    //   1729: iload_3
    //   1730: istore #28
    //   1732: fload #31
    //   1734: fstore #20
    //   1736: iload #22
    //   1738: istore_3
    //   1739: aload #5
    //   1741: astore #23
    //   1743: fload #26
    //   1745: fstore #18
    //   1747: fload #33
    //   1749: fstore #19
    //   1751: iload #29
    //   1753: istore #21
    //   1755: goto -> 1764
    //   1758: iload_3
    //   1759: istore #28
    //   1761: iload #15
    //   1763: istore_3
    //   1764: iload_3
    //   1765: istore #15
    //   1767: iload #28
    //   1769: istore_3
    //   1770: goto -> 128 }
  
  public void setText(BitmapFont paramBitmapFont, CharSequence paramCharSequence, Color paramColor, float paramFloat, int paramInt, boolean paramBoolean) { setText(paramBitmapFont, paramCharSequence, 0, paramCharSequence.length(), paramColor, paramFloat, paramInt, paramBoolean, null); }
  
  public String toString() {
    if (this.runs.size == 0)
      return ""; 
    StringBuilder stringBuilder = new StringBuilder('');
    stringBuilder.append(this.width);
    stringBuilder.append('x');
    stringBuilder.append(this.height);
    stringBuilder.append('\n');
    byte b = 0;
    int i = this.runs.size;
    while (b < i) {
      stringBuilder.append(((GlyphRun)this.runs.get(b)).toString());
      stringBuilder.append('\n');
      b++;
    } 
    stringBuilder.setLength(stringBuilder.length() - 1);
    return stringBuilder.toString();
  }
  
  public static class GlyphRun implements Pool.Poolable {
    public final Color color = new Color();
    
    public Array<BitmapFont.Glyph> glyphs = new Array();
    
    public float width;
    
    public float x;
    
    public FloatArray xAdvances = new FloatArray();
    
    public float y;
    
    public void reset() {
      this.glyphs.clear();
      this.xAdvances.clear();
      this.width = 0.0F;
    }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder(this.glyphs.size);
      Array array = this.glyphs;
      int i = array.size;
      for (byte b = 0; b < i; b++)
        stringBuilder.append((char)((BitmapFont.Glyph)array.get(b)).id); 
      stringBuilder.append(", #");
      stringBuilder.append(this.color);
      stringBuilder.append(", ");
      stringBuilder.append(this.x);
      stringBuilder.append(", ");
      stringBuilder.append(this.y);
      stringBuilder.append(", ");
      stringBuilder.append(this.width);
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/GlyphLayout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */