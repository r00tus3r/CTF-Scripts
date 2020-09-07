package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.CubemapData;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;

public class KTXTextureData implements TextureData, CubemapData {
  private static final int GL_TEXTURE_1D = 4660;
  
  private static final int GL_TEXTURE_1D_ARRAY_EXT = 4660;
  
  private static final int GL_TEXTURE_2D_ARRAY_EXT = 4660;
  
  private static final int GL_TEXTURE_3D = 4660;
  
  private ByteBuffer compressedData;
  
  private FileHandle file;
  
  private int glBaseInternalFormat;
  
  private int glFormat;
  
  private int glInternalFormat;
  
  private int glType;
  
  private int glTypeSize;
  
  private int imagePos;
  
  private int numberOfArrayElements;
  
  private int numberOfFaces;
  
  private int numberOfMipmapLevels;
  
  private int pixelDepth = -1;
  
  private int pixelHeight = -1;
  
  private int pixelWidth = -1;
  
  private boolean useMipMaps;
  
  public KTXTextureData(FileHandle paramFileHandle, boolean paramBoolean) {
    this.file = paramFileHandle;
    this.useMipMaps = paramBoolean;
  }
  
  public void consumeCubemapData() { consumeCustomData(34067); }
  
  public void consumeCustomData(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: getfield compressedData : Ljava/nio/ByteBuffer;
    //   4: ifnull -> 891
    //   7: bipush #16
    //   9: invokestatic newIntBuffer : (I)Ljava/nio/IntBuffer;
    //   12: astore_2
    //   13: aload_0
    //   14: getfield glType : I
    //   17: ifeq -> 35
    //   20: aload_0
    //   21: getfield glFormat : I
    //   24: ifne -> 30
    //   27: goto -> 35
    //   30: iconst_0
    //   31: istore_3
    //   32: goto -> 49
    //   35: aload_0
    //   36: getfield glType : I
    //   39: aload_0
    //   40: getfield glFormat : I
    //   43: iadd
    //   44: ifne -> 881
    //   47: iconst_1
    //   48: istore_3
    //   49: aload_0
    //   50: getfield pixelHeight : I
    //   53: ifle -> 67
    //   56: iconst_2
    //   57: istore #4
    //   59: sipush #3553
    //   62: istore #5
    //   64: goto -> 75
    //   67: iconst_1
    //   68: istore #4
    //   70: sipush #4660
    //   73: istore #5
    //   75: aload_0
    //   76: getfield pixelDepth : I
    //   79: ifle -> 90
    //   82: iconst_3
    //   83: istore #4
    //   85: sipush #4660
    //   88: istore #5
    //   90: aload_0
    //   91: getfield numberOfFaces : I
    //   94: istore #6
    //   96: iload #6
    //   98: bipush #6
    //   100: if_icmpne -> 126
    //   103: iload #4
    //   105: iconst_2
    //   106: if_icmpne -> 116
    //   109: ldc 34067
    //   111: istore #5
    //   113: goto -> 132
    //   116: new com/badlogic/gdx/utils/GdxRuntimeException
    //   119: dup
    //   120: ldc 'cube map needs 2D faces'
    //   122: invokespecial <init> : (Ljava/lang/String;)V
    //   125: athrow
    //   126: iload #6
    //   128: iconst_1
    //   129: if_icmpne -> 871
    //   132: iload #4
    //   134: istore #6
    //   136: iload #5
    //   138: istore #7
    //   140: aload_0
    //   141: getfield numberOfArrayElements : I
    //   144: ifle -> 190
    //   147: iload #5
    //   149: sipush #4660
    //   152: if_icmpne -> 158
    //   155: goto -> 166
    //   158: iload #5
    //   160: sipush #3553
    //   163: if_icmpne -> 180
    //   166: iload #4
    //   168: iconst_1
    //   169: iadd
    //   170: istore #6
    //   172: sipush #4660
    //   175: istore #7
    //   177: goto -> 190
    //   180: new com/badlogic/gdx/utils/GdxRuntimeException
    //   183: dup
    //   184: ldc 'No API for 3D and cube arrays yet'
    //   186: invokespecial <init> : (Ljava/lang/String;)V
    //   189: athrow
    //   190: iload #7
    //   192: sipush #4660
    //   195: if_icmpeq -> 861
    //   198: aload_0
    //   199: getfield numberOfFaces : I
    //   202: istore #4
    //   204: ldc 34069
    //   206: istore #5
    //   208: iload #4
    //   210: bipush #6
    //   212: if_icmpne -> 256
    //   215: iload_1
    //   216: ldc 34067
    //   218: if_icmpeq -> 256
    //   221: ldc 34069
    //   223: iload_1
    //   224: if_icmpgt -> 246
    //   227: iload_1
    //   228: ldc 34074
    //   230: if_icmpgt -> 246
    //   233: iload_1
    //   234: ldc 34069
    //   236: isub
    //   237: istore #4
    //   239: iload #5
    //   241: istore #7
    //   243: goto -> 364
    //   246: new com/badlogic/gdx/utils/GdxRuntimeException
    //   249: dup
    //   250: ldc 'You must specify either GL_TEXTURE_CUBE_MAP to bind all 6 faces of the cube or the requested face GL_TEXTURE_CUBE_MAP_POSITIVE_X and followings.'
    //   252: invokespecial <init> : (Ljava/lang/String;)V
    //   255: athrow
    //   256: aload_0
    //   257: getfield numberOfFaces : I
    //   260: bipush #6
    //   262: if_icmpne -> 277
    //   265: iload_1
    //   266: ldc 34067
    //   268: if_icmpne -> 277
    //   271: iload #5
    //   273: istore_1
    //   274: goto -> 358
    //   277: iload_1
    //   278: iload #7
    //   280: if_icmpeq -> 358
    //   283: ldc 34069
    //   285: iload_1
    //   286: if_icmpgt -> 305
    //   289: iload_1
    //   290: ldc 34074
    //   292: if_icmpgt -> 305
    //   295: iload_1
    //   296: sipush #3553
    //   299: if_icmpne -> 305
    //   302: goto -> 358
    //   305: new java/lang/StringBuilder
    //   308: dup
    //   309: invokespecial <init> : ()V
    //   312: astore_2
    //   313: aload_2
    //   314: ldc 'Invalid target requested : 0x'
    //   316: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   319: pop
    //   320: aload_2
    //   321: iload_1
    //   322: invokestatic toHexString : (I)Ljava/lang/String;
    //   325: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   328: pop
    //   329: aload_2
    //   330: ldc ', expecting : 0x'
    //   332: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   335: pop
    //   336: aload_2
    //   337: iload #7
    //   339: invokestatic toHexString : (I)Ljava/lang/String;
    //   342: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   345: pop
    //   346: new com/badlogic/gdx/utils/GdxRuntimeException
    //   349: dup
    //   350: aload_2
    //   351: invokevirtual toString : ()Ljava/lang/String;
    //   354: invokespecial <init> : (Ljava/lang/String;)V
    //   357: athrow
    //   358: iconst_m1
    //   359: istore #4
    //   361: iload_1
    //   362: istore #7
    //   364: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   367: sipush #3317
    //   370: aload_2
    //   371: invokeinterface glGetIntegerv : (ILjava/nio/IntBuffer;)V
    //   376: aload_2
    //   377: iconst_0
    //   378: invokevirtual get : (I)I
    //   381: istore #8
    //   383: iload #8
    //   385: iconst_4
    //   386: if_icmpeq -> 401
    //   389: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   392: sipush #3317
    //   395: iconst_4
    //   396: invokeinterface glPixelStorei : (II)V
    //   401: aload_0
    //   402: getfield glInternalFormat : I
    //   405: istore #9
    //   407: aload_0
    //   408: getfield glFormat : I
    //   411: istore #10
    //   413: aload_0
    //   414: getfield imagePos : I
    //   417: istore #5
    //   419: iconst_0
    //   420: istore #11
    //   422: iload_3
    //   423: istore_1
    //   424: iload #4
    //   426: istore_3
    //   427: iload #11
    //   429: aload_0
    //   430: getfield numberOfMipmapLevels : I
    //   433: if_icmpge -> 820
    //   436: iconst_1
    //   437: aload_0
    //   438: getfield pixelWidth : I
    //   441: iload #11
    //   443: ishr
    //   444: invokestatic max : (II)I
    //   447: istore #12
    //   449: iconst_1
    //   450: aload_0
    //   451: getfield pixelHeight : I
    //   454: iload #11
    //   456: ishr
    //   457: invokestatic max : (II)I
    //   460: istore #4
    //   462: iconst_1
    //   463: aload_0
    //   464: getfield pixelDepth : I
    //   467: iload #11
    //   469: ishr
    //   470: invokestatic max : (II)I
    //   473: pop
    //   474: aload_0
    //   475: getfield compressedData : Ljava/nio/ByteBuffer;
    //   478: iload #5
    //   480: invokevirtual position : (I)Ljava/nio/Buffer;
    //   483: pop
    //   484: aload_0
    //   485: getfield compressedData : Ljava/nio/ByteBuffer;
    //   488: invokevirtual getInt : ()I
    //   491: istore #13
    //   493: iload #13
    //   495: iconst_3
    //   496: iadd
    //   497: bipush #-4
    //   499: iand
    //   500: istore #14
    //   502: iinc #5, 4
    //   505: iconst_0
    //   506: istore #15
    //   508: iload #15
    //   510: aload_0
    //   511: getfield numberOfFaces : I
    //   514: if_icmpge -> 814
    //   517: aload_0
    //   518: getfield compressedData : Ljava/nio/ByteBuffer;
    //   521: iload #5
    //   523: invokevirtual position : (I)Ljava/nio/Buffer;
    //   526: pop
    //   527: iload #5
    //   529: iload #14
    //   531: iadd
    //   532: istore #5
    //   534: iload_3
    //   535: iconst_m1
    //   536: if_icmpeq -> 548
    //   539: iload_3
    //   540: iload #15
    //   542: if_icmpeq -> 548
    //   545: goto -> 569
    //   548: aload_0
    //   549: getfield compressedData : Ljava/nio/ByteBuffer;
    //   552: invokevirtual slice : ()Ljava/nio/ByteBuffer;
    //   555: astore_2
    //   556: aload_2
    //   557: iload #14
    //   559: invokevirtual limit : (I)Ljava/nio/Buffer;
    //   562: pop
    //   563: iload #6
    //   565: iconst_1
    //   566: if_icmpne -> 576
    //   569: iload #4
    //   571: istore #16
    //   573: goto -> 804
    //   576: iload #6
    //   578: iconst_2
    //   579: if_icmpne -> 784
    //   582: aload_0
    //   583: getfield numberOfArrayElements : I
    //   586: istore #16
    //   588: iload #16
    //   590: ifle -> 600
    //   593: iload #16
    //   595: istore #4
    //   597: goto -> 600
    //   600: iload_1
    //   601: ifeq -> 748
    //   604: iload #9
    //   606: getstatic com/badlogic/gdx/graphics/glutils/ETC1.ETC1_RGB8_OES : I
    //   609: if_icmpne -> 720
    //   612: getstatic com/badlogic/gdx/Gdx.graphics : Lcom/badlogic/gdx/Graphics;
    //   615: ldc 'GL_OES_compressed_ETC1_RGB8_texture'
    //   617: invokeinterface supportsExtension : (Ljava/lang/String;)Z
    //   622: ifne -> 692
    //   625: new com/badlogic/gdx/graphics/glutils/ETC1$ETC1Data
    //   628: dup
    //   629: iload #12
    //   631: iload #4
    //   633: aload_2
    //   634: iconst_0
    //   635: invokespecial <init> : (IILjava/nio/ByteBuffer;I)V
    //   638: getstatic com/badlogic/gdx/graphics/Pixmap$Format.RGB888 : Lcom/badlogic/gdx/graphics/Pixmap$Format;
    //   641: invokestatic decodeImage : (Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/Pixmap;
    //   644: astore_2
    //   645: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   648: iload #7
    //   650: iload #15
    //   652: iadd
    //   653: iload #11
    //   655: aload_2
    //   656: invokevirtual getGLInternalFormat : ()I
    //   659: aload_2
    //   660: invokevirtual getWidth : ()I
    //   663: aload_2
    //   664: invokevirtual getHeight : ()I
    //   667: iconst_0
    //   668: aload_2
    //   669: invokevirtual getGLFormat : ()I
    //   672: aload_2
    //   673: invokevirtual getGLType : ()I
    //   676: aload_2
    //   677: invokevirtual getPixels : ()Ljava/nio/ByteBuffer;
    //   680: invokeinterface glTexImage2D : (IIIIIIIILjava/nio/Buffer;)V
    //   685: aload_2
    //   686: invokevirtual dispose : ()V
    //   689: goto -> 777
    //   692: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   695: iload #7
    //   697: iload #15
    //   699: iadd
    //   700: iload #11
    //   702: iload #9
    //   704: iload #12
    //   706: iload #4
    //   708: iconst_0
    //   709: iload #13
    //   711: aload_2
    //   712: invokeinterface glCompressedTexImage2D : (IIIIIIILjava/nio/Buffer;)V
    //   717: goto -> 777
    //   720: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   723: iload #7
    //   725: iload #15
    //   727: iadd
    //   728: iload #11
    //   730: iload #9
    //   732: iload #12
    //   734: iload #4
    //   736: iconst_0
    //   737: iload #13
    //   739: aload_2
    //   740: invokeinterface glCompressedTexImage2D : (IIIIIIILjava/nio/Buffer;)V
    //   745: goto -> 777
    //   748: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   751: iload #7
    //   753: iload #15
    //   755: iadd
    //   756: iload #11
    //   758: iload #9
    //   760: iload #12
    //   762: iload #4
    //   764: iconst_0
    //   765: iload #10
    //   767: aload_0
    //   768: getfield glType : I
    //   771: aload_2
    //   772: invokeinterface glTexImage2D : (IIIIIIIILjava/nio/Buffer;)V
    //   777: iload #4
    //   779: istore #16
    //   781: goto -> 804
    //   784: iload #4
    //   786: istore #16
    //   788: iload #6
    //   790: iconst_3
    //   791: if_icmpne -> 804
    //   794: aload_0
    //   795: getfield numberOfArrayElements : I
    //   798: istore #16
    //   800: iload #4
    //   802: istore #16
    //   804: iinc #15, 1
    //   807: iload #16
    //   809: istore #4
    //   811: goto -> 508
    //   814: iinc #11, 1
    //   817: goto -> 427
    //   820: iload #8
    //   822: iconst_4
    //   823: if_icmpeq -> 839
    //   826: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   829: sipush #3317
    //   832: iload #8
    //   834: invokeinterface glPixelStorei : (II)V
    //   839: aload_0
    //   840: invokevirtual useMipMaps : ()Z
    //   843: ifeq -> 856
    //   846: getstatic com/badlogic/gdx/Gdx.gl : Lcom/badlogic/gdx/graphics/GL20;
    //   849: iload #7
    //   851: invokeinterface glGenerateMipmap : (I)V
    //   856: aload_0
    //   857: invokevirtual disposePreparedData : ()V
    //   860: return
    //   861: new com/badlogic/gdx/utils/GdxRuntimeException
    //   864: dup
    //   865: ldc 'Unsupported texture format (only 2D texture are supported in LibGdx for the time being)'
    //   867: invokespecial <init> : (Ljava/lang/String;)V
    //   870: athrow
    //   871: new com/badlogic/gdx/utils/GdxRuntimeException
    //   874: dup
    //   875: ldc 'numberOfFaces must be either 1 or 6'
    //   877: invokespecial <init> : (Ljava/lang/String;)V
    //   880: athrow
    //   881: new com/badlogic/gdx/utils/GdxRuntimeException
    //   884: dup
    //   885: ldc 'either both or none of glType, glFormat must be zero'
    //   887: invokespecial <init> : (Ljava/lang/String;)V
    //   890: athrow
    //   891: new com/badlogic/gdx/utils/GdxRuntimeException
    //   894: dup
    //   895: ldc 'Call prepare() before calling consumeCompressedData()'
    //   897: invokespecial <init> : (Ljava/lang/String;)V
    //   900: astore_2
    //   901: goto -> 906
    //   904: aload_2
    //   905: athrow
    //   906: goto -> 904 }
  
  public Pixmap consumePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public boolean disposePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public void disposePreparedData() {
    ByteBuffer byteBuffer = this.compressedData;
    if (byteBuffer != null)
      BufferUtils.disposeUnsafeByteBuffer(byteBuffer); 
    this.compressedData = null;
  }
  
  public ByteBuffer getData(int paramInt1, int paramInt2) {
    int i = this.imagePos;
    for (byte b = 0; b < this.numberOfMipmapLevels; b++) {
      int j = this.compressedData.getInt(i) + 3 & 0xFFFFFFFC;
      i += 4;
      if (b == paramInt1) {
        for (byte b1 = 0; b1 < this.numberOfFaces; b1++) {
          if (b1 == paramInt2) {
            this.compressedData.position(i);
            ByteBuffer byteBuffer = this.compressedData.slice();
            byteBuffer.limit(j);
            return byteBuffer;
          } 
          i += j;
        } 
      } else {
        i += j * this.numberOfFaces;
      } 
    } 
    return null;
  }
  
  public Pixmap.Format getFormat() { throw new GdxRuntimeException("This TextureData implementation directly handles texture formats."); }
  
  public int getGlInternalFormat() { return this.glInternalFormat; }
  
  public int getHeight() { return this.pixelHeight; }
  
  public int getNumberOfFaces() { return this.numberOfFaces; }
  
  public int getNumberOfMipMapLevels() { return this.numberOfMipmapLevels; }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Custom; }
  
  public int getWidth() { return this.pixelWidth; }
  
  public boolean isManaged() { return true; }
  
  public boolean isPrepared() {
    boolean bool;
    if (this.compressedData != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void prepare() { // Byte code:
    //   0: aload_0
    //   1: getfield compressedData : Ljava/nio/ByteBuffer;
    //   4: ifnonnull -> 937
    //   7: aload_0
    //   8: getfield file : Lcom/badlogic/gdx/files/FileHandle;
    //   11: astore_1
    //   12: aload_1
    //   13: ifnull -> 926
    //   16: aload_1
    //   17: invokevirtual name : ()Ljava/lang/String;
    //   20: ldc_w '.zktx'
    //   23: invokevirtual endsWith : (Ljava/lang/String;)Z
    //   26: ifeq -> 281
    //   29: sipush #10240
    //   32: newarray byte
    //   34: astore_2
    //   35: aconst_null
    //   36: astore_3
    //   37: aconst_null
    //   38: astore #4
    //   40: aload #4
    //   42: astore_1
    //   43: new java/io/DataInputStream
    //   46: astore #5
    //   48: aload #4
    //   50: astore_1
    //   51: new java/io/BufferedInputStream
    //   54: astore #6
    //   56: aload #4
    //   58: astore_1
    //   59: new java/util/zip/GZIPInputStream
    //   62: astore #7
    //   64: aload #4
    //   66: astore_1
    //   67: aload #7
    //   69: aload_0
    //   70: getfield file : Lcom/badlogic/gdx/files/FileHandle;
    //   73: invokevirtual read : ()Ljava/io/InputStream;
    //   76: invokespecial <init> : (Ljava/io/InputStream;)V
    //   79: aload #4
    //   81: astore_1
    //   82: aload #6
    //   84: aload #7
    //   86: invokespecial <init> : (Ljava/io/InputStream;)V
    //   89: aload #4
    //   91: astore_1
    //   92: aload #5
    //   94: aload #6
    //   96: invokespecial <init> : (Ljava/io/InputStream;)V
    //   99: aload_0
    //   100: aload #5
    //   102: invokevirtual readInt : ()I
    //   105: invokestatic newUnsafeByteBuffer : (I)Ljava/nio/ByteBuffer;
    //   108: putfield compressedData : Ljava/nio/ByteBuffer;
    //   111: aload #5
    //   113: aload_2
    //   114: invokevirtual read : ([B)I
    //   117: istore #8
    //   119: iload #8
    //   121: iconst_m1
    //   122: if_icmpeq -> 140
    //   125: aload_0
    //   126: getfield compressedData : Ljava/nio/ByteBuffer;
    //   129: aload_2
    //   130: iconst_0
    //   131: iload #8
    //   133: invokevirtual put : ([BII)Ljava/nio/ByteBuffer;
    //   136: pop
    //   137: goto -> 111
    //   140: aload_0
    //   141: getfield compressedData : Ljava/nio/ByteBuffer;
    //   144: iconst_0
    //   145: invokevirtual position : (I)Ljava/nio/Buffer;
    //   148: pop
    //   149: aload_0
    //   150: getfield compressedData : Ljava/nio/ByteBuffer;
    //   153: aload_0
    //   154: getfield compressedData : Ljava/nio/ByteBuffer;
    //   157: invokevirtual capacity : ()I
    //   160: invokevirtual limit : (I)Ljava/nio/Buffer;
    //   163: pop
    //   164: aload #5
    //   166: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   169: goto -> 295
    //   172: astore_1
    //   173: aload #5
    //   175: astore #4
    //   177: aload_1
    //   178: astore #5
    //   180: aload #4
    //   182: astore_1
    //   183: goto -> 274
    //   186: astore #4
    //   188: goto -> 201
    //   191: astore #5
    //   193: goto -> 274
    //   196: astore #4
    //   198: aload_3
    //   199: astore #5
    //   201: aload #5
    //   203: astore_1
    //   204: new com/badlogic/gdx/utils/GdxRuntimeException
    //   207: astore_2
    //   208: aload #5
    //   210: astore_1
    //   211: new java/lang/StringBuilder
    //   214: astore_3
    //   215: aload #5
    //   217: astore_1
    //   218: aload_3
    //   219: invokespecial <init> : ()V
    //   222: aload #5
    //   224: astore_1
    //   225: aload_3
    //   226: ldc_w 'Couldn't load zktx file ''
    //   229: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   232: pop
    //   233: aload #5
    //   235: astore_1
    //   236: aload_3
    //   237: aload_0
    //   238: getfield file : Lcom/badlogic/gdx/files/FileHandle;
    //   241: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   244: pop
    //   245: aload #5
    //   247: astore_1
    //   248: aload_3
    //   249: ldc_w '''
    //   252: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   255: pop
    //   256: aload #5
    //   258: astore_1
    //   259: aload_2
    //   260: aload_3
    //   261: invokevirtual toString : ()Ljava/lang/String;
    //   264: aload #4
    //   266: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   269: aload #5
    //   271: astore_1
    //   272: aload_2
    //   273: athrow
    //   274: aload_1
    //   275: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   278: aload #5
    //   280: athrow
    //   281: aload_0
    //   282: aload_0
    //   283: getfield file : Lcom/badlogic/gdx/files/FileHandle;
    //   286: invokevirtual readBytes : ()[B
    //   289: invokestatic wrap : ([B)Ljava/nio/ByteBuffer;
    //   292: putfield compressedData : Ljava/nio/ByteBuffer;
    //   295: aload_0
    //   296: getfield compressedData : Ljava/nio/ByteBuffer;
    //   299: invokevirtual get : ()B
    //   302: bipush #-85
    //   304: if_icmpne -> 915
    //   307: aload_0
    //   308: getfield compressedData : Ljava/nio/ByteBuffer;
    //   311: invokevirtual get : ()B
    //   314: bipush #75
    //   316: if_icmpne -> 904
    //   319: aload_0
    //   320: getfield compressedData : Ljava/nio/ByteBuffer;
    //   323: invokevirtual get : ()B
    //   326: bipush #84
    //   328: if_icmpne -> 893
    //   331: aload_0
    //   332: getfield compressedData : Ljava/nio/ByteBuffer;
    //   335: invokevirtual get : ()B
    //   338: bipush #88
    //   340: if_icmpne -> 882
    //   343: aload_0
    //   344: getfield compressedData : Ljava/nio/ByteBuffer;
    //   347: invokevirtual get : ()B
    //   350: bipush #32
    //   352: if_icmpne -> 871
    //   355: aload_0
    //   356: getfield compressedData : Ljava/nio/ByteBuffer;
    //   359: invokevirtual get : ()B
    //   362: bipush #49
    //   364: if_icmpne -> 860
    //   367: aload_0
    //   368: getfield compressedData : Ljava/nio/ByteBuffer;
    //   371: invokevirtual get : ()B
    //   374: bipush #49
    //   376: if_icmpne -> 849
    //   379: aload_0
    //   380: getfield compressedData : Ljava/nio/ByteBuffer;
    //   383: invokevirtual get : ()B
    //   386: bipush #-69
    //   388: if_icmpne -> 838
    //   391: aload_0
    //   392: getfield compressedData : Ljava/nio/ByteBuffer;
    //   395: invokevirtual get : ()B
    //   398: bipush #13
    //   400: if_icmpne -> 827
    //   403: aload_0
    //   404: getfield compressedData : Ljava/nio/ByteBuffer;
    //   407: invokevirtual get : ()B
    //   410: bipush #10
    //   412: if_icmpne -> 816
    //   415: aload_0
    //   416: getfield compressedData : Ljava/nio/ByteBuffer;
    //   419: invokevirtual get : ()B
    //   422: bipush #26
    //   424: if_icmpne -> 805
    //   427: aload_0
    //   428: getfield compressedData : Ljava/nio/ByteBuffer;
    //   431: invokevirtual get : ()B
    //   434: bipush #10
    //   436: if_icmpne -> 794
    //   439: aload_0
    //   440: getfield compressedData : Ljava/nio/ByteBuffer;
    //   443: invokevirtual getInt : ()I
    //   446: istore #8
    //   448: iload #8
    //   450: ldc_w 67305985
    //   453: if_icmpeq -> 478
    //   456: iload #8
    //   458: ldc_w 16909060
    //   461: if_icmpne -> 467
    //   464: goto -> 478
    //   467: new com/badlogic/gdx/utils/GdxRuntimeException
    //   470: dup
    //   471: ldc_w 'Invalid KTX Header'
    //   474: invokespecial <init> : (Ljava/lang/String;)V
    //   477: athrow
    //   478: iload #8
    //   480: ldc_w 67305985
    //   483: if_icmpeq -> 521
    //   486: aload_0
    //   487: getfield compressedData : Ljava/nio/ByteBuffer;
    //   490: astore #5
    //   492: aload #5
    //   494: invokevirtual order : ()Ljava/nio/ByteOrder;
    //   497: getstatic java/nio/ByteOrder.BIG_ENDIAN : Ljava/nio/ByteOrder;
    //   500: if_acmpne -> 510
    //   503: getstatic java/nio/ByteOrder.LITTLE_ENDIAN : Ljava/nio/ByteOrder;
    //   506: astore_1
    //   507: goto -> 514
    //   510: getstatic java/nio/ByteOrder.BIG_ENDIAN : Ljava/nio/ByteOrder;
    //   513: astore_1
    //   514: aload #5
    //   516: aload_1
    //   517: invokevirtual order : (Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;
    //   520: pop
    //   521: aload_0
    //   522: aload_0
    //   523: getfield compressedData : Ljava/nio/ByteBuffer;
    //   526: invokevirtual getInt : ()I
    //   529: putfield glType : I
    //   532: aload_0
    //   533: aload_0
    //   534: getfield compressedData : Ljava/nio/ByteBuffer;
    //   537: invokevirtual getInt : ()I
    //   540: putfield glTypeSize : I
    //   543: aload_0
    //   544: aload_0
    //   545: getfield compressedData : Ljava/nio/ByteBuffer;
    //   548: invokevirtual getInt : ()I
    //   551: putfield glFormat : I
    //   554: aload_0
    //   555: aload_0
    //   556: getfield compressedData : Ljava/nio/ByteBuffer;
    //   559: invokevirtual getInt : ()I
    //   562: putfield glInternalFormat : I
    //   565: aload_0
    //   566: aload_0
    //   567: getfield compressedData : Ljava/nio/ByteBuffer;
    //   570: invokevirtual getInt : ()I
    //   573: putfield glBaseInternalFormat : I
    //   576: aload_0
    //   577: aload_0
    //   578: getfield compressedData : Ljava/nio/ByteBuffer;
    //   581: invokevirtual getInt : ()I
    //   584: putfield pixelWidth : I
    //   587: aload_0
    //   588: aload_0
    //   589: getfield compressedData : Ljava/nio/ByteBuffer;
    //   592: invokevirtual getInt : ()I
    //   595: putfield pixelHeight : I
    //   598: aload_0
    //   599: aload_0
    //   600: getfield compressedData : Ljava/nio/ByteBuffer;
    //   603: invokevirtual getInt : ()I
    //   606: putfield pixelDepth : I
    //   609: aload_0
    //   610: aload_0
    //   611: getfield compressedData : Ljava/nio/ByteBuffer;
    //   614: invokevirtual getInt : ()I
    //   617: putfield numberOfArrayElements : I
    //   620: aload_0
    //   621: aload_0
    //   622: getfield compressedData : Ljava/nio/ByteBuffer;
    //   625: invokevirtual getInt : ()I
    //   628: putfield numberOfFaces : I
    //   631: aload_0
    //   632: aload_0
    //   633: getfield compressedData : Ljava/nio/ByteBuffer;
    //   636: invokevirtual getInt : ()I
    //   639: putfield numberOfMipmapLevels : I
    //   642: aload_0
    //   643: getfield numberOfMipmapLevels : I
    //   646: ifne -> 659
    //   649: aload_0
    //   650: iconst_1
    //   651: putfield numberOfMipmapLevels : I
    //   654: aload_0
    //   655: iconst_1
    //   656: putfield useMipMaps : Z
    //   659: aload_0
    //   660: getfield compressedData : Ljava/nio/ByteBuffer;
    //   663: invokevirtual getInt : ()I
    //   666: istore #8
    //   668: aload_0
    //   669: aload_0
    //   670: getfield compressedData : Ljava/nio/ByteBuffer;
    //   673: invokevirtual position : ()I
    //   676: iload #8
    //   678: iadd
    //   679: putfield imagePos : I
    //   682: aload_0
    //   683: getfield compressedData : Ljava/nio/ByteBuffer;
    //   686: invokevirtual isDirect : ()Z
    //   689: ifne -> 793
    //   692: aload_0
    //   693: getfield imagePos : I
    //   696: istore #9
    //   698: iconst_0
    //   699: istore #8
    //   701: iload #8
    //   703: aload_0
    //   704: getfield numberOfMipmapLevels : I
    //   707: if_icmpge -> 742
    //   710: iload #9
    //   712: aload_0
    //   713: getfield compressedData : Ljava/nio/ByteBuffer;
    //   716: iload #9
    //   718: invokevirtual getInt : (I)I
    //   721: iconst_3
    //   722: iadd
    //   723: bipush #-4
    //   725: iand
    //   726: aload_0
    //   727: getfield numberOfFaces : I
    //   730: imul
    //   731: iconst_4
    //   732: iadd
    //   733: iadd
    //   734: istore #9
    //   736: iinc #8, 1
    //   739: goto -> 701
    //   742: aload_0
    //   743: getfield compressedData : Ljava/nio/ByteBuffer;
    //   746: iload #9
    //   748: invokevirtual limit : (I)Ljava/nio/Buffer;
    //   751: pop
    //   752: aload_0
    //   753: getfield compressedData : Ljava/nio/ByteBuffer;
    //   756: iconst_0
    //   757: invokevirtual position : (I)Ljava/nio/Buffer;
    //   760: pop
    //   761: iload #9
    //   763: invokestatic newUnsafeByteBuffer : (I)Ljava/nio/ByteBuffer;
    //   766: astore_1
    //   767: aload_1
    //   768: aload_0
    //   769: getfield compressedData : Ljava/nio/ByteBuffer;
    //   772: invokevirtual order : ()Ljava/nio/ByteOrder;
    //   775: invokevirtual order : (Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;
    //   778: pop
    //   779: aload_1
    //   780: aload_0
    //   781: getfield compressedData : Ljava/nio/ByteBuffer;
    //   784: invokevirtual put : (Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    //   787: pop
    //   788: aload_0
    //   789: aload_1
    //   790: putfield compressedData : Ljava/nio/ByteBuffer;
    //   793: return
    //   794: new com/badlogic/gdx/utils/GdxRuntimeException
    //   797: dup
    //   798: ldc_w 'Invalid KTX Header'
    //   801: invokespecial <init> : (Ljava/lang/String;)V
    //   804: athrow
    //   805: new com/badlogic/gdx/utils/GdxRuntimeException
    //   808: dup
    //   809: ldc_w 'Invalid KTX Header'
    //   812: invokespecial <init> : (Ljava/lang/String;)V
    //   815: athrow
    //   816: new com/badlogic/gdx/utils/GdxRuntimeException
    //   819: dup
    //   820: ldc_w 'Invalid KTX Header'
    //   823: invokespecial <init> : (Ljava/lang/String;)V
    //   826: athrow
    //   827: new com/badlogic/gdx/utils/GdxRuntimeException
    //   830: dup
    //   831: ldc_w 'Invalid KTX Header'
    //   834: invokespecial <init> : (Ljava/lang/String;)V
    //   837: athrow
    //   838: new com/badlogic/gdx/utils/GdxRuntimeException
    //   841: dup
    //   842: ldc_w 'Invalid KTX Header'
    //   845: invokespecial <init> : (Ljava/lang/String;)V
    //   848: athrow
    //   849: new com/badlogic/gdx/utils/GdxRuntimeException
    //   852: dup
    //   853: ldc_w 'Invalid KTX Header'
    //   856: invokespecial <init> : (Ljava/lang/String;)V
    //   859: athrow
    //   860: new com/badlogic/gdx/utils/GdxRuntimeException
    //   863: dup
    //   864: ldc_w 'Invalid KTX Header'
    //   867: invokespecial <init> : (Ljava/lang/String;)V
    //   870: athrow
    //   871: new com/badlogic/gdx/utils/GdxRuntimeException
    //   874: dup
    //   875: ldc_w 'Invalid KTX Header'
    //   878: invokespecial <init> : (Ljava/lang/String;)V
    //   881: athrow
    //   882: new com/badlogic/gdx/utils/GdxRuntimeException
    //   885: dup
    //   886: ldc_w 'Invalid KTX Header'
    //   889: invokespecial <init> : (Ljava/lang/String;)V
    //   892: athrow
    //   893: new com/badlogic/gdx/utils/GdxRuntimeException
    //   896: dup
    //   897: ldc_w 'Invalid KTX Header'
    //   900: invokespecial <init> : (Ljava/lang/String;)V
    //   903: athrow
    //   904: new com/badlogic/gdx/utils/GdxRuntimeException
    //   907: dup
    //   908: ldc_w 'Invalid KTX Header'
    //   911: invokespecial <init> : (Ljava/lang/String;)V
    //   914: athrow
    //   915: new com/badlogic/gdx/utils/GdxRuntimeException
    //   918: dup
    //   919: ldc_w 'Invalid KTX Header'
    //   922: invokespecial <init> : (Ljava/lang/String;)V
    //   925: athrow
    //   926: new com/badlogic/gdx/utils/GdxRuntimeException
    //   929: dup
    //   930: ldc_w 'Need a file to load from'
    //   933: invokespecial <init> : (Ljava/lang/String;)V
    //   936: athrow
    //   937: new com/badlogic/gdx/utils/GdxRuntimeException
    //   940: dup
    //   941: ldc_w 'Already prepared'
    //   944: invokespecial <init> : (Ljava/lang/String;)V
    //   947: astore_1
    //   948: goto -> 953
    //   951: aload_1
    //   952: athrow
    //   953: goto -> 951
    // Exception table:
    //   from	to	target	type
    //   43	48	196	java/lang/Exception
    //   43	48	191	finally
    //   51	56	196	java/lang/Exception
    //   51	56	191	finally
    //   59	64	196	java/lang/Exception
    //   59	64	191	finally
    //   67	79	196	java/lang/Exception
    //   67	79	191	finally
    //   82	89	196	java/lang/Exception
    //   82	89	191	finally
    //   92	99	196	java/lang/Exception
    //   92	99	191	finally
    //   99	111	186	java/lang/Exception
    //   99	111	172	finally
    //   111	119	186	java/lang/Exception
    //   111	119	172	finally
    //   125	137	186	java/lang/Exception
    //   125	137	172	finally
    //   140	164	186	java/lang/Exception
    //   140	164	172	finally
    //   204	208	191	finally
    //   211	215	191	finally
    //   218	222	191	finally
    //   225	233	191	finally
    //   236	245	191	finally
    //   248	256	191	finally
    //   259	269	191	finally
    //   272	274	191	finally }
  
  public boolean useMipMaps() { return this.useMipMaps; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/KTXTextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */