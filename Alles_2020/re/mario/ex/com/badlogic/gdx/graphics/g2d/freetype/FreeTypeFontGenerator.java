package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.graphics.g2d.PixmapPacker;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

public class FreeTypeFontGenerator implements Disposable {
  public static final String DEFAULT_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?'.,;:()[]{}<>|/@\\^$-%+=#_&~* ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
  
  public static final int NO_MAXIMUM = -1;
  
  private static int maxTextureSize = 1024;
  
  boolean bitmapped = false;
  
  final FreeType.Face face;
  
  final FreeType.Library library;
  
  final String name;
  
  private int pixelHeight;
  
  private int pixelWidth;
  
  static  {
  
  }
  
  public FreeTypeFontGenerator(FileHandle paramFileHandle) {
    this.name = paramFileHandle.pathWithoutExtension();
    int i = (int)paramFileHandle.length();
    this.library = FreeType.initFreeType();
    if (this.library != null) {
      InputStream inputStream = paramFileHandle.read();
      if (i == 0) {
        if (i > 0) {
          i = (int)(i * 1.5F);
        } else {
          i = 16384;
        } 
        try {
          byte[] arrayOfByte = StreamUtils.copyStreamToByteArray(inputStream, i);
          ByteBuffer byteBuffer = BufferUtils.newUnsafeByteBuffer(arrayOfByte.length);
          BufferUtils.copy(arrayOfByte, 0, byteBuffer, arrayOfByte.length);
          StreamUtils.closeQuietly(inputStream);
          this.face = this.library.newMemoryFace(byteBuffer, 0);
        } catch (IOException paramFileHandle) {
          GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
          this(paramFileHandle);
          throw gdxRuntimeException;
        } finally {}
      } else {
        ByteBuffer byteBuffer = BufferUtils.newUnsafeByteBuffer(i);
        StreamUtils.copyStream(inputStream, byteBuffer);
        StreamUtils.closeQuietly(inputStream);
        this.face = this.library.newMemoryFace(byteBuffer, 0);
      } 
      StreamUtils.closeQuietly(inputStream);
      throw paramFileHandle;
    } 
    throw new GdxRuntimeException("Couldn't initialize FreeType");
  }
  
  private boolean checkForBitmapFont() {
    if ((this.face.getFaceFlags() & FreeType.FT_FACE_FLAG_FIXED_SIZES) == FreeType.FT_FACE_FLAG_FIXED_SIZES && (this.face.getFaceFlags() & FreeType.FT_FACE_FLAG_HORIZONTAL) == FreeType.FT_FACE_FLAG_HORIZONTAL && this.face.loadChar(32, FreeType.FT_LOAD_DEFAULT) && this.face.getGlyph().getFormat() == 1651078259)
      this.bitmapped = true; 
    return this.bitmapped;
  }
  
  public static int getMaxTextureSize() { return maxTextureSize; }
  
  public static void setMaxTextureSize(int paramInt) { maxTextureSize = paramInt; }
  
  BitmapFont.Glyph createGlyph(char paramChar, FreeTypeBitmapFontData paramFreeTypeBitmapFontData, FreeTypeFontParameter paramFreeTypeFontParameter, FreeType.Stroker paramStroker, float paramFloat, PixmapPacker paramPixmapPacker) { // Byte code:
    //   0: aload_0
    //   1: getfield face : Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
    //   4: iload_1
    //   5: invokevirtual getCharIndex : (I)I
    //   8: ifne -> 17
    //   11: iconst_1
    //   12: istore #7
    //   14: goto -> 20
    //   17: iconst_0
    //   18: istore #7
    //   20: iload #7
    //   22: ifeq -> 40
    //   25: aload_2
    //   26: iconst_0
    //   27: invokevirtual getGlyph : (C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
    //   30: astore #8
    //   32: aload #8
    //   34: ifnull -> 40
    //   37: aload #8
    //   39: areturn
    //   40: aload_0
    //   41: getfield face : Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
    //   44: iload_1
    //   45: getstatic com/badlogic/gdx/graphics/g2d/freetype/FreeType.FT_LOAD_DEFAULT : I
    //   48: invokevirtual loadChar : (II)Z
    //   51: ifne -> 100
    //   54: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   57: astore_3
    //   58: new java/lang/StringBuilder
    //   61: dup
    //   62: invokespecial <init> : ()V
    //   65: astore_2
    //   66: aload_2
    //   67: ldc 'Couldn't load char ''
    //   69: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   72: pop
    //   73: aload_2
    //   74: iload_1
    //   75: invokevirtual append : (C)Ljava/lang/StringBuilder;
    //   78: pop
    //   79: aload_2
    //   80: ldc '''
    //   82: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: pop
    //   86: aload_3
    //   87: ldc 'FreeTypeFontGenerator'
    //   89: aload_2
    //   90: invokevirtual toString : ()Ljava/lang/String;
    //   93: invokeinterface log : (Ljava/lang/String;Ljava/lang/String;)V
    //   98: aconst_null
    //   99: areturn
    //   100: aload_0
    //   101: getfield face : Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;
    //   104: invokevirtual getGlyph : ()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;
    //   107: astore #9
    //   109: aload #9
    //   111: invokevirtual getGlyph : ()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;
    //   114: astore #10
    //   116: aload #10
    //   118: getstatic com/badlogic/gdx/graphics/g2d/freetype/FreeType.FT_RENDER_MODE_NORMAL : I
    //   121: invokevirtual toBitmap : (I)V
    //   124: aload #10
    //   126: invokevirtual getBitmap : ()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;
    //   129: astore #11
    //   131: aload #11
    //   133: getstatic com/badlogic/gdx/graphics/Pixmap$Format.RGBA8888 : Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   136: aload_3
    //   137: getfield color : Lcom/badlogic/gdx/graphics/Color;
    //   140: invokevirtual getPixmap : (Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;
    //   143: astore #12
    //   145: aload_3
    //   146: getfield borderWidth : F
    //   149: fconst_0
    //   150: fcmpl
    //   151: ifgt -> 176
    //   154: aload_3
    //   155: getfield shadowOffsetX : I
    //   158: ifne -> 176
    //   161: aload #12
    //   163: astore #13
    //   165: aload #10
    //   167: astore #8
    //   169: aload_3
    //   170: getfield shadowOffsetY : I
    //   173: ifeq -> 435
    //   176: aload_3
    //   177: getfield borderWidth : F
    //   180: fconst_0
    //   181: fcmpl
    //   182: ifle -> 280
    //   185: aload #9
    //   187: invokevirtual getGlyph : ()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;
    //   190: astore #8
    //   192: aload #8
    //   194: aload #4
    //   196: iconst_0
    //   197: invokevirtual strokeBorder : (Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;Z)V
    //   200: aload #8
    //   202: getstatic com/badlogic/gdx/graphics/g2d/freetype/FreeType.FT_RENDER_MODE_NORMAL : I
    //   205: invokevirtual toBitmap : (I)V
    //   208: aload #8
    //   210: invokevirtual getBitmap : ()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;
    //   213: astore #14
    //   215: aload #14
    //   217: getstatic com/badlogic/gdx/graphics/Pixmap$Format.RGBA8888 : Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   220: aload_3
    //   221: getfield borderColor : Lcom/badlogic/gdx/graphics/Color;
    //   224: invokevirtual getPixmap : (Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;
    //   227: astore #4
    //   229: aload #4
    //   231: aload #12
    //   233: aload #10
    //   235: invokevirtual getLeft : ()I
    //   238: aload #8
    //   240: invokevirtual getLeft : ()I
    //   243: isub
    //   244: aload #10
    //   246: invokevirtual getTop : ()I
    //   249: aload #8
    //   251: invokevirtual getTop : ()I
    //   254: isub
    //   255: ineg
    //   256: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;II)V
    //   259: aload #12
    //   261: invokevirtual dispose : ()V
    //   264: aload #10
    //   266: invokevirtual dispose : ()V
    //   269: aload #4
    //   271: astore #12
    //   273: aload #8
    //   275: astore #4
    //   277: goto -> 288
    //   280: aload #11
    //   282: astore #14
    //   284: aload #10
    //   286: astore #4
    //   288: aload_3
    //   289: getfield shadowOffsetX : I
    //   292: ifne -> 310
    //   295: aload #12
    //   297: astore #13
    //   299: aload #4
    //   301: astore #8
    //   303: aload_3
    //   304: getfield shadowOffsetY : I
    //   307: ifeq -> 435
    //   310: aload #14
    //   312: getstatic com/badlogic/gdx/graphics/Pixmap$Format.RGBA8888 : Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   315: aload_3
    //   316: getfield shadowColor : Lcom/badlogic/gdx/graphics/Color;
    //   319: invokevirtual getPixmap : (Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;
    //   322: astore #10
    //   324: new com/badlogic/gdx/graphics/Pixmap
    //   327: dup
    //   328: aload #10
    //   330: invokevirtual getWidth : ()I
    //   333: aload_3
    //   334: getfield shadowOffsetX : I
    //   337: invokestatic abs : (I)I
    //   340: iadd
    //   341: aload #10
    //   343: invokevirtual getHeight : ()I
    //   346: aload_3
    //   347: getfield shadowOffsetY : I
    //   350: invokestatic abs : (I)I
    //   353: iadd
    //   354: getstatic com/badlogic/gdx/graphics/Pixmap$Format.RGBA8888 : Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   357: invokespecial <init> : (IILcom/badlogic/gdx/graphics/Pixmap$Format;)V
    //   360: astore #13
    //   362: invokestatic getBlending : ()Lcom/badlogic/gdx/graphics/Pixmap$Blending;
    //   365: astore #8
    //   367: getstatic com/badlogic/gdx/graphics/Pixmap$Blending.None : Lcom/badlogic/gdx/graphics/Pixmap$Blending;
    //   370: invokestatic setBlending : (Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V
    //   373: aload #13
    //   375: aload #10
    //   377: aload_3
    //   378: getfield shadowOffsetX : I
    //   381: iconst_0
    //   382: invokestatic max : (II)I
    //   385: aload_3
    //   386: getfield shadowOffsetY : I
    //   389: iconst_0
    //   390: invokestatic max : (II)I
    //   393: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;II)V
    //   396: aload #8
    //   398: invokestatic setBlending : (Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V
    //   401: aload #13
    //   403: aload #12
    //   405: aload_3
    //   406: getfield shadowOffsetX : I
    //   409: ineg
    //   410: iconst_0
    //   411: invokestatic max : (II)I
    //   414: aload_3
    //   415: getfield shadowOffsetY : I
    //   418: ineg
    //   419: iconst_0
    //   420: invokestatic max : (II)I
    //   423: invokevirtual drawPixmap : (Lcom/badlogic/gdx/graphics/Pixmap;II)V
    //   426: aload #12
    //   428: invokevirtual dispose : ()V
    //   431: aload #4
    //   433: astore #8
    //   435: aload #9
    //   437: invokevirtual getMetrics : ()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;
    //   440: astore #12
    //   442: new com/badlogic/gdx/graphics/g2d/BitmapFont$Glyph
    //   445: dup
    //   446: invokespecial <init> : ()V
    //   449: astore #4
    //   451: aload #4
    //   453: iload_1
    //   454: putfield id : I
    //   457: aload #4
    //   459: aload #13
    //   461: invokevirtual getWidth : ()I
    //   464: putfield width : I
    //   467: aload #4
    //   469: aload #13
    //   471: invokevirtual getHeight : ()I
    //   474: putfield height : I
    //   477: aload #4
    //   479: aload #8
    //   481: invokevirtual getLeft : ()I
    //   484: putfield xoffset : I
    //   487: aload_3
    //   488: getfield flip : Z
    //   491: ifeq -> 509
    //   494: aload #8
    //   496: invokevirtual getTop : ()I
    //   499: ineg
    //   500: fload #5
    //   502: f2i
    //   503: iadd
    //   504: istore #15
    //   506: goto -> 527
    //   509: aload #4
    //   511: getfield height : I
    //   514: aload #8
    //   516: invokevirtual getTop : ()I
    //   519: isub
    //   520: ineg
    //   521: fload #5
    //   523: f2i
    //   524: isub
    //   525: istore #15
    //   527: aload #4
    //   529: iload #15
    //   531: putfield yoffset : I
    //   534: aload #4
    //   536: aload #12
    //   538: invokevirtual getHoriAdvance : ()I
    //   541: invokestatic toInt : (I)I
    //   544: aload_3
    //   545: getfield borderWidth : F
    //   548: f2i
    //   549: iadd
    //   550: putfield xadvance : I
    //   553: aload_0
    //   554: getfield bitmapped : Z
    //   557: ifeq -> 700
    //   560: aload #13
    //   562: getstatic com/badlogic/gdx/graphics/Color.CLEAR : Lcom/badlogic/gdx/graphics/Color;
    //   565: invokevirtual setColor : (Lcom/badlogic/gdx/graphics/Color;)V
    //   568: aload #13
    //   570: invokevirtual fill : ()V
    //   573: aload #11
    //   575: invokevirtual getBuffer : ()Ljava/nio/ByteBuffer;
    //   578: astore #12
    //   580: getstatic com/badlogic/gdx/graphics/Color.WHITE : Lcom/badlogic/gdx/graphics/Color;
    //   583: invokevirtual toIntBits : ()I
    //   586: istore #16
    //   588: getstatic com/badlogic/gdx/graphics/Color.CLEAR : Lcom/badlogic/gdx/graphics/Color;
    //   591: invokevirtual toIntBits : ()I
    //   594: istore #17
    //   596: iconst_0
    //   597: istore #15
    //   599: iload #15
    //   601: aload #4
    //   603: getfield height : I
    //   606: if_icmpge -> 700
    //   609: aload #11
    //   611: invokevirtual getPitch : ()I
    //   614: istore #18
    //   616: iconst_0
    //   617: istore #19
    //   619: iload #19
    //   621: aload #4
    //   623: getfield width : I
    //   626: aload #4
    //   628: getfield xoffset : I
    //   631: iadd
    //   632: if_icmpge -> 694
    //   635: aload #12
    //   637: iload #19
    //   639: bipush #8
    //   641: idiv
    //   642: iload #18
    //   644: iload #15
    //   646: imul
    //   647: iadd
    //   648: invokevirtual get : (I)B
    //   651: bipush #7
    //   653: iload #19
    //   655: bipush #8
    //   657: irem
    //   658: isub
    //   659: iushr
    //   660: iconst_1
    //   661: iand
    //   662: iconst_1
    //   663: if_icmpne -> 673
    //   666: iload #16
    //   668: istore #20
    //   670: goto -> 677
    //   673: iload #17
    //   675: istore #20
    //   677: aload #13
    //   679: iload #19
    //   681: iload #15
    //   683: iload #20
    //   685: invokevirtual drawPixel : (III)V
    //   688: iinc #19, 1
    //   691: goto -> 619
    //   694: iinc #15, 1
    //   697: goto -> 599
    //   700: aload #6
    //   702: aload #13
    //   704: invokevirtual pack : (Lcom/badlogic/gdx/graphics/Pixmap;)Lcom/badlogic/gdx/math/Rectangle;
    //   707: astore #12
    //   709: aload #4
    //   711: aload #6
    //   713: invokevirtual getPages : ()Lcom/badlogic/gdx/utils/Array;
    //   716: getfield size : I
    //   719: iconst_1
    //   720: isub
    //   721: putfield page : I
    //   724: aload #4
    //   726: aload #12
    //   728: getfield x : F
    //   731: f2i
    //   732: putfield srcX : I
    //   735: aload #4
    //   737: aload #12
    //   739: getfield y : F
    //   742: f2i
    //   743: putfield srcY : I
    //   746: aload_3
    //   747: getfield incremental : Z
    //   750: ifeq -> 796
    //   753: aload_2
    //   754: getfield regions : Lcom/badlogic/gdx/utils/Array;
    //   757: ifnull -> 796
    //   760: aload_2
    //   761: getfield regions : Lcom/badlogic/gdx/utils/Array;
    //   764: getfield size : I
    //   767: aload #4
    //   769: getfield page : I
    //   772: if_icmpgt -> 796
    //   775: aload #6
    //   777: aload_2
    //   778: getfield regions : Lcom/badlogic/gdx/utils/Array;
    //   781: aload_3
    //   782: getfield minFilter : Lcom/badlogic/gdx/graphics/Texture$TextureFilter;
    //   785: aload_3
    //   786: getfield magFilter : Lcom/badlogic/gdx/graphics/Texture$TextureFilter;
    //   789: aload_3
    //   790: getfield genMipMaps : Z
    //   793: invokevirtual updateTextureRegions : (Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V
    //   796: aload #13
    //   798: invokevirtual dispose : ()V
    //   801: aload #8
    //   803: invokevirtual dispose : ()V
    //   806: iload #7
    //   808: ifeq -> 818
    //   811: aload_2
    //   812: iconst_0
    //   813: aload #4
    //   815: invokevirtual setGlyph : (ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V
    //   818: aload #4
    //   820: areturn
    //   821: astore_2
    //   822: aload #10
    //   824: invokevirtual dispose : ()V
    //   827: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   830: astore_3
    //   831: new java/lang/StringBuilder
    //   834: dup
    //   835: invokespecial <init> : ()V
    //   838: astore_2
    //   839: aload_2
    //   840: ldc_w 'Couldn't render char ''
    //   843: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   846: pop
    //   847: aload_2
    //   848: iload_1
    //   849: invokevirtual append : (C)Ljava/lang/StringBuilder;
    //   852: pop
    //   853: aload_2
    //   854: ldc '''
    //   856: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   859: pop
    //   860: aload_3
    //   861: ldc 'FreeTypeFontGenerator'
    //   863: aload_2
    //   864: invokevirtual toString : ()Ljava/lang/String;
    //   867: invokeinterface log : (Ljava/lang/String;Ljava/lang/String;)V
    //   872: aconst_null
    //   873: areturn
    // Exception table:
    //   from	to	target	type
    //   116	124	821	com/badlogic/gdx/utils/GdxRuntimeException }
  
  public void dispose() {
    this.face.dispose();
    this.library.dispose();
  }
  
  public FreeTypeBitmapFontData generateData(int paramInt) { return generateData(paramInt, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?'.,;:()[]{}<>|/@\\^$-%+=#_&~* ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ", false, null); }
  
  public FreeTypeBitmapFontData generateData(int paramInt, String paramString, boolean paramBoolean) { return generateData(paramInt, paramString, paramBoolean, null); }
  
  public FreeTypeBitmapFontData generateData(int paramInt, String paramString, boolean paramBoolean, PixmapPacker paramPixmapPacker) {
    FreeTypeFontParameter freeTypeFontParameter = new FreeTypeFontParameter();
    freeTypeFontParameter.size = paramInt;
    freeTypeFontParameter.characters = paramString;
    freeTypeFontParameter.flip = paramBoolean;
    freeTypeFontParameter.packer = paramPixmapPacker;
    return generateData(freeTypeFontParameter);
  }
  
  public FreeTypeBitmapFontData generateData(FreeTypeFontParameter paramFreeTypeFontParameter) { return generateData(paramFreeTypeFontParameter, new FreeTypeBitmapFontData()); }
  
  public FreeTypeBitmapFontData generateData(FreeTypeFontParameter paramFreeTypeFontParameter, FreeTypeBitmapFontData paramFreeTypeBitmapFontData) {
    FreeTypeFontParameter freeTypeFontParameter;
    if (paramFreeTypeFontParameter == null) {
      freeTypeFontParameter = new FreeTypeFontParameter();
    } else {
      freeTypeFontParameter = paramFreeTypeFontParameter;
    } 
    String str = freeTypeFontParameter.characters;
    int i = str.length();
    boolean bool = freeTypeFontParameter.incremental;
    setPixelSizes(0, freeTypeFontParameter.size);
    FreeType.SizeMetrics sizeMetrics = this.face.getSize().getMetrics();
    paramFreeTypeBitmapFontData.flipped = freeTypeFontParameter.flip;
    paramFreeTypeBitmapFontData.ascent = FreeType.toInt(sizeMetrics.getAscender());
    paramFreeTypeBitmapFontData.descent = FreeType.toInt(sizeMetrics.getDescender());
    paramFreeTypeBitmapFontData.lineHeight = FreeType.toInt(sizeMetrics.getHeight());
    float f = paramFreeTypeBitmapFontData.ascent;
    if (this.bitmapped && paramFreeTypeBitmapFontData.lineHeight == 0.0F)
      for (byte b = 32; b < this.face.getNumGlyphs() + 32; b++) {
        if (this.face.loadChar(b, FreeType.FT_LOAD_DEFAULT)) {
          float f1 = FreeType.toInt(this.face.getGlyph().getMetrics().getHeight());
          if (f1 <= paramFreeTypeBitmapFontData.lineHeight)
            f1 = paramFreeTypeBitmapFontData.lineHeight; 
          paramFreeTypeBitmapFontData.lineHeight = f1;
        } 
      }  
    if (this.face.loadChar(32, FreeType.FT_LOAD_DEFAULT)) {
      paramFreeTypeBitmapFontData.spaceWidth = FreeType.toInt(this.face.getGlyph().getMetrics().getHoriAdvance());
    } else {
      paramFreeTypeBitmapFontData.spaceWidth = this.face.getMaxAdvanceWidth();
    } 
    BitmapFont.Glyph glyph = new BitmapFont.Glyph();
    glyph.xadvance = (int)paramFreeTypeBitmapFontData.spaceWidth;
    glyph.id = 32;
    paramFreeTypeBitmapFontData.setGlyph(32, glyph);
    char[] arrayOfChar = paramFreeTypeBitmapFontData.xChars;
    int k = arrayOfChar.length;
    int j = 0;
    while (j < k) {
      char c = arrayOfChar[j];
      if (!this.face.loadChar(c, FreeType.FT_LOAD_DEFAULT)) {
        j++;
        continue;
      } 
      paramFreeTypeBitmapFontData.xHeight = FreeType.toInt(this.face.getGlyph().getMetrics().getHeight());
    } 
    if (paramFreeTypeBitmapFontData.xHeight != 0.0F) {
      arrayOfChar = paramFreeTypeBitmapFontData.capChars;
      k = arrayOfChar.length;
      j = 0;
      while (j < k) {
        char c = arrayOfChar[j];
        if (!this.face.loadChar(c, FreeType.FT_LOAD_DEFAULT)) {
          j++;
          continue;
        } 
        paramFreeTypeBitmapFontData.capHeight = FreeType.toInt(this.face.getGlyph().getMetrics().getHeight());
      } 
      if (this.bitmapped || paramFreeTypeBitmapFontData.capHeight != 1.0F) {
        FreeType.Stroker stroker;
        paramFreeTypeBitmapFontData.ascent -= paramFreeTypeBitmapFontData.capHeight;
        paramFreeTypeBitmapFontData.down = -paramFreeTypeBitmapFontData.lineHeight;
        if (freeTypeFontParameter.flip) {
          paramFreeTypeBitmapFontData.ascent = -paramFreeTypeBitmapFontData.ascent;
          paramFreeTypeBitmapFontData.down = -paramFreeTypeBitmapFontData.down;
        } 
        PixmapPacker pixmapPacker = freeTypeFontParameter.packer;
        if (pixmapPacker == null) {
          if (bool) {
            j = maxTextureSize;
          } else {
            j = (int)Math.ceil(paramFreeTypeBitmapFontData.lineHeight);
            k = MathUtils.nextPowerOfTwo((int)Math.sqrt((j * j * i)));
            int m = maxTextureSize;
            j = k;
            if (m > 0)
              j = Math.min(k, m); 
          } 
          pixmapPacker = new PixmapPacker(j, j, Pixmap.Format.RGBA8888, 2, false);
          k = 1;
        } else {
          k = 0;
        } 
        arrayOfChar = null;
        if (freeTypeFontParameter.borderWidth > 0.0F) {
          int m;
          stroker = this.library.createStroker();
          int n = (int)(freeTypeFontParameter.borderWidth * 64.0F);
          if (freeTypeFontParameter.borderStraight) {
            j = FreeType.FT_STROKER_LINECAP_BUTT;
          } else {
            j = FreeType.FT_STROKER_LINECAP_ROUND;
          } 
          if (freeTypeFontParameter.borderStraight) {
            m = FreeType.FT_STROKER_LINEJOIN_MITER_FIXED;
          } else {
            m = FreeType.FT_STROKER_LINEJOIN_ROUND;
          } 
          stroker.set(n, j, m, 0);
        } 
        if (bool) {
          paramFreeTypeBitmapFontData.generator = this;
          paramFreeTypeBitmapFontData.parameter = freeTypeFontParameter;
          paramFreeTypeBitmapFontData.stroker = stroker;
          paramFreeTypeBitmapFontData.packer = pixmapPacker;
          paramFreeTypeBitmapFontData.glyphs = new Array(i + 32);
        } 
        for (j = 0; j < i; j++) {
          char c = str.charAt(j);
          BitmapFont.Glyph glyph1 = createGlyph(c, paramFreeTypeBitmapFontData, freeTypeFontParameter, stroker, f, pixmapPacker);
          if (glyph1 != null) {
            paramFreeTypeBitmapFontData.setGlyph(c, glyph1);
            if (bool)
              paramFreeTypeBitmapFontData.glyphs.add(glyph1); 
          } 
        } 
        if (stroker != null && !bool)
          stroker.dispose(); 
        if (freeTypeFontParameter.kerning)
          for (j = 0; j < i; j++) {
            char c = str.charAt(j);
            BitmapFont.Glyph glyph1 = paramFreeTypeBitmapFontData.getGlyph(c);
            if (glyph1 != null) {
              int n = this.face.getCharIndex(c);
              for (int m = j; m < i; m++) {
                char c1 = str.charAt(m);
                BitmapFont.Glyph glyph2 = paramFreeTypeBitmapFontData.getGlyph(c1);
                if (glyph2 != null) {
                  int i1 = this.face.getCharIndex(c1);
                  int i2 = this.face.getKerning(n, i1, 0);
                  if (i2 != 0)
                    glyph1.setKerning(c1, FreeType.toInt(i2)); 
                  i1 = this.face.getKerning(i1, n, 0);
                  if (i1 != 0)
                    glyph2.setKerning(c, FreeType.toInt(i1)); 
                } 
              } 
            } 
          }  
        if (k != 0) {
          paramFreeTypeBitmapFontData.regions = new Array();
          pixmapPacker.updateTextureRegions(paramFreeTypeBitmapFontData.regions, freeTypeFontParameter.minFilter, freeTypeFontParameter.magFilter, freeTypeFontParameter.genMipMaps);
        } 
        return paramFreeTypeBitmapFontData;
      } 
      throw new GdxRuntimeException("No cap character found in font");
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("No x-height character found in font");
    throw gdxRuntimeException;
  }
  
  public BitmapFont generateFont(int paramInt) { return generateFont(paramInt, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?'.,;:()[]{}<>|/@\\^$-%+=#_&~* ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ", false); }
  
  public BitmapFont generateFont(int paramInt, String paramString, boolean paramBoolean) {
    FreeTypeBitmapFontData freeTypeBitmapFontData = generateData(paramInt, paramString, paramBoolean, null);
    BitmapFont bitmapFont = new BitmapFont(freeTypeBitmapFontData, freeTypeBitmapFontData.regions, false);
    bitmapFont.setOwnsTexture(true);
    return bitmapFont;
  }
  
  public BitmapFont generateFont(FreeTypeFontParameter paramFreeTypeFontParameter) { return generateFont(paramFreeTypeFontParameter, new FreeTypeBitmapFontData()); }
  
  public BitmapFont generateFont(FreeTypeFontParameter paramFreeTypeFontParameter, FreeTypeBitmapFontData paramFreeTypeBitmapFontData) {
    generateData(paramFreeTypeFontParameter, paramFreeTypeBitmapFontData);
    if (paramFreeTypeBitmapFontData.regions == null && paramFreeTypeFontParameter.packer != null) {
      paramFreeTypeBitmapFontData.regions = new Array();
      paramFreeTypeFontParameter.packer.updateTextureRegions(paramFreeTypeBitmapFontData.regions, paramFreeTypeFontParameter.minFilter, paramFreeTypeFontParameter.magFilter, paramFreeTypeFontParameter.genMipMaps);
    } 
    Array array = paramFreeTypeBitmapFontData.regions;
    boolean bool = false;
    BitmapFont bitmapFont = new BitmapFont(paramFreeTypeBitmapFontData, array, false);
    if (paramFreeTypeFontParameter.packer == null)
      bool = true; 
    bitmapFont.setOwnsTexture(bool);
    return bitmapFont;
  }
  
  public GlyphAndBitmap generateGlyphAndBitmap(int paramInt1, int paramInt2, boolean paramBoolean) {
    setPixelSizes(0, paramInt2);
    paramInt2 = FreeType.toInt(this.face.getSize().getMetrics().getAscender());
    int i = this.face.getCharIndex(paramInt1);
    FreeType.Bitmap bitmap = null;
    if (i == 0)
      return null; 
    if (this.face.loadChar(paramInt1, FreeType.FT_LOAD_DEFAULT)) {
      FreeType.GlyphSlot glyphSlot = this.face.getGlyph();
      if (this.bitmapped) {
        bitmap = glyphSlot.getBitmap();
      } else if (glyphSlot.renderGlyph(FreeType.FT_RENDER_MODE_LIGHT)) {
        bitmap = glyphSlot.getBitmap();
      } 
      FreeType.GlyphMetrics glyphMetrics = glyphSlot.getMetrics();
      BitmapFont.Glyph glyph = new BitmapFont.Glyph();
      if (bitmap != null) {
        glyph.width = bitmap.getWidth();
        glyph.height = bitmap.getRows();
      } else {
        glyph.width = 0;
        glyph.height = 0;
      } 
      glyph.xoffset = glyphSlot.getBitmapLeft();
      if (paramBoolean) {
        paramInt2 = -glyphSlot.getBitmapTop() + paramInt2;
      } else {
        paramInt2 = -(glyph.height - glyphSlot.getBitmapTop()) - paramInt2;
      } 
      glyph.yoffset = paramInt2;
      glyph.xadvance = FreeType.toInt(glyphMetrics.getHoriAdvance());
      glyph.srcX = 0;
      glyph.srcY = 0;
      glyph.id = paramInt1;
      GlyphAndBitmap glyphAndBitmap = new GlyphAndBitmap();
      glyphAndBitmap.glyph = glyph;
      glyphAndBitmap.bitmap = bitmap;
      return glyphAndBitmap;
    } 
    throw new GdxRuntimeException("Unable to load character!");
  }
  
  public int scaleForPixelHeight(int paramInt) {
    setPixelSizes(0, paramInt);
    FreeType.SizeMetrics sizeMetrics = this.face.getSize().getMetrics();
    return paramInt * paramInt / (FreeType.toInt(sizeMetrics.getAscender()) - FreeType.toInt(sizeMetrics.getDescender()));
  }
  
  public int scaleForPixelWidth(int paramInt1, int paramInt2) {
    FreeType.SizeMetrics sizeMetrics = this.face.getSize().getMetrics();
    int i = FreeType.toInt(sizeMetrics.getMaxAdvance());
    paramInt1 = (FreeType.toInt(sizeMetrics.getAscender()) - FreeType.toInt(sizeMetrics.getDescender())) * paramInt1 / i * paramInt2;
    setPixelSizes(0, paramInt1);
    return paramInt1;
  }
  
  public int scaleToFitSquare(int paramInt1, int paramInt2, int paramInt3) { return Math.min(scaleForPixelHeight(paramInt2), scaleForPixelWidth(paramInt1, paramInt3)); }
  
  void setPixelSizes(int paramInt1, int paramInt2) {
    this.pixelWidth = paramInt1;
    this.pixelHeight = paramInt2;
    if (this.bitmapped || this.face.setPixelSizes(paramInt1, paramInt2))
      return; 
    throw new GdxRuntimeException("Couldn't set size for font");
  }
  
  public static class FreeTypeBitmapFontData extends BitmapFont.BitmapFontData implements Disposable {
    FreeTypeFontGenerator generator;
    
    Array<BitmapFont.Glyph> glyphs;
    
    PixmapPacker packer;
    
    FreeTypeFontGenerator.FreeTypeFontParameter parameter;
    
    Array<TextureRegion> regions;
    
    FreeType.Stroker stroker;
    
    public void dispose() {
      FreeType.Stroker stroker1 = this.stroker;
      if (stroker1 != null)
        stroker1.dispose(); 
      PixmapPacker pixmapPacker = this.packer;
      if (pixmapPacker != null)
        pixmapPacker.dispose(); 
    }
    
    public BitmapFont.Glyph getGlyph(char param1Char) {
      BitmapFont.Glyph glyph1 = super.getGlyph(param1Char);
      BitmapFont.Glyph glyph2 = glyph1;
      if (glyph1 == null) {
        FreeTypeFontGenerator freeTypeFontGenerator = this.generator;
        glyph2 = glyph1;
        if (freeTypeFontGenerator != null) {
          glyph2 = glyph1;
          if (param1Char != '\000') {
            freeTypeFontGenerator.setPixelSizes(0, this.parameter.size);
            glyph1 = this.generator.createGlyph(param1Char, this, this.parameter, this.stroker, (this.ascent + this.capHeight) / this.scaleY, this.packer);
            if (glyph1 == null)
              return null; 
            setGlyph(param1Char, glyph1);
            setGlyphRegion(glyph1, (TextureRegion)this.regions.get(glyph1.page));
            this.glyphs.add(glyph1);
            glyph2 = glyph1;
            if (this.parameter.kerning) {
              FreeType.Face face = this.generator.face;
              int i = face.getCharIndex(param1Char);
              int j = this.glyphs.size;
              byte b = 0;
              while (true) {
                glyph2 = glyph1;
                if (b < j) {
                  glyph2 = (BitmapFont.Glyph)this.glyphs.get(b);
                  int k = face.getCharIndex(glyph2.id);
                  int m = face.getKerning(i, k, 0);
                  if (m != 0)
                    glyph1.setKerning(glyph2.id, FreeType.toInt(m)); 
                  k = face.getKerning(k, i, 0);
                  if (k != 0)
                    glyph2.setKerning(param1Char, FreeType.toInt(k)); 
                  b++;
                  continue;
                } 
                break;
              } 
            } 
          } 
        } 
      } 
      return glyph2;
    }
    
    public void getGlyphs(GlyphLayout.GlyphRun param1GlyphRun, CharSequence param1CharSequence, int param1Int1, int param1Int2) {
      PixmapPacker pixmapPacker = this.packer;
      if (pixmapPacker != null)
        pixmapPacker.setPackToTexture(true); 
      super.getGlyphs(param1GlyphRun, param1CharSequence, param1Int1, param1Int2);
    }
  }
  
  public static class FreeTypeFontParameter {
    public Color borderColor = Color.BLACK;
    
    public boolean borderStraight = false;
    
    public float borderWidth = 0.0F;
    
    public String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?'.,;:()[]{}<>|/@\\^$-%+=#_&~* ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
    
    public Color color = Color.WHITE;
    
    public boolean flip = false;
    
    public boolean genMipMaps = false;
    
    public boolean incremental;
    
    public boolean kerning = true;
    
    public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
    
    public PixmapPacker packer = null;
    
    public Color shadowColor = new Color(0.0F, 0.0F, 0.0F, 0.75F);
    
    public int shadowOffsetX = 0;
    
    public int shadowOffsetY = 0;
    
    public int size = 16;
  }
  
  public class GlyphAndBitmap {
    public FreeType.Bitmap bitmap;
    
    public BitmapFont.Glyph glyph;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */