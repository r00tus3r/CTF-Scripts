package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapGroupLayer;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapLayers;
import com.badlogic.gdx.maps.MapObjects;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile;
import com.badlogic.gdx.maps.tiled.tiles.StaticTiledMapTile;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.SerializationException;
import com.badlogic.gdx.utils.XmlReader;
import java.util.Iterator;
import java.util.StringTokenizer;

public abstract class BaseTmxMapLoader<P extends BaseTmxMapLoader.Parameters> extends AsynchronousAssetLoader<TiledMap, P> {
  protected static final int FLAG_FLIP_DIAGONALLY = 536870912;
  
  protected static final int FLAG_FLIP_HORIZONTALLY = -2147483648;
  
  protected static final int FLAG_FLIP_VERTICALLY = 1073741824;
  
  protected static final int MASK_CLEAR = -536870912;
  
  protected boolean convertObjectToTileSpace;
  
  protected boolean flipY = true;
  
  protected TiledMap map;
  
  protected int mapHeightInPixels;
  
  protected int mapTileHeight;
  
  protected int mapTileWidth;
  
  protected int mapWidthInPixels;
  
  protected XmlReader.Element root;
  
  protected XmlReader xml = new XmlReader();
  
  public BaseTmxMapLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  private Object castProperty(String paramString1, String paramString2, String paramString3) {
    if (paramString3 == null)
      return paramString2; 
    if (paramString3.equals("int"))
      return Integer.valueOf(paramString2); 
    if (paramString3.equals("float"))
      return Float.valueOf(paramString2); 
    if (paramString3.equals("bool"))
      return Boolean.valueOf(paramString2); 
    if (paramString3.equals("color")) {
      paramString1 = paramString2.substring(3);
      paramString3 = paramString2.substring(1, 3);
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append(paramString1);
      stringBuilder1.append(paramString3);
      return Color.valueOf(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Wrong type given for property ");
    stringBuilder.append(paramString1);
    stringBuilder.append(", given : ");
    stringBuilder.append(paramString3);
    stringBuilder.append(", supported : string, bool, int, float, color");
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  protected static FileHandle getRelativeFileHandle(FileHandle paramFileHandle, String paramString) {
    StringTokenizer stringTokenizer = new StringTokenizer(paramString, "\\/");
    for (paramFileHandle = paramFileHandle.parent(); stringTokenizer.hasMoreElements(); paramFileHandle = paramFileHandle.child(str)) {
      String str = stringTokenizer.nextToken();
      if (str.equals("..")) {
        paramFileHandle = paramFileHandle.parent();
        continue;
      } 
    } 
    return paramFileHandle;
  }
  
  public static int[] getTileIds(XmlReader.Element paramElement, int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: ldc 'data'
    //   3: invokevirtual getChildByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   6: astore_3
    //   7: aconst_null
    //   8: astore #4
    //   10: aconst_null
    //   11: astore #5
    //   13: aload_3
    //   14: ldc 'encoding'
    //   16: aconst_null
    //   17: invokevirtual getAttribute : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   20: astore_0
    //   21: aload_0
    //   22: ifnull -> 813
    //   25: iload_1
    //   26: iload_2
    //   27: imul
    //   28: newarray int
    //   30: astore #6
    //   32: aload_0
    //   33: ldc 'csv'
    //   35: invokevirtual equals : (Ljava/lang/Object;)Z
    //   38: istore #7
    //   40: iconst_0
    //   41: istore #8
    //   43: iload #7
    //   45: ifeq -> 87
    //   48: aload_3
    //   49: invokevirtual getText : ()Ljava/lang/String;
    //   52: ldc ','
    //   54: invokevirtual split : (Ljava/lang/String;)[Ljava/lang/String;
    //   57: astore_0
    //   58: iload #8
    //   60: istore_1
    //   61: iload_1
    //   62: aload_0
    //   63: arraylength
    //   64: if_icmpge -> 581
    //   67: aload #6
    //   69: iload_1
    //   70: aload_0
    //   71: iload_1
    //   72: aaload
    //   73: invokevirtual trim : ()Ljava/lang/String;
    //   76: invokestatic parseLong : (Ljava/lang/String;)J
    //   79: l2i
    //   80: iastore
    //   81: iinc #1, 1
    //   84: goto -> 61
    //   87: aload_0
    //   88: ldc 'base64'
    //   90: invokevirtual equals : (Ljava/lang/Object;)Z
    //   93: ifeq -> 768
    //   96: aload #5
    //   98: astore_0
    //   99: aload #4
    //   101: astore #9
    //   103: aload_3
    //   104: ldc 'compression'
    //   106: aconst_null
    //   107: invokevirtual getAttribute : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   110: astore #10
    //   112: aload #5
    //   114: astore_0
    //   115: aload #4
    //   117: astore #9
    //   119: aload_3
    //   120: invokevirtual getText : ()Ljava/lang/String;
    //   123: invokestatic decode : (Ljava/lang/String;)[B
    //   126: astore_3
    //   127: aload #10
    //   129: ifnonnull -> 166
    //   132: aload #5
    //   134: astore_0
    //   135: aload #4
    //   137: astore #9
    //   139: new java/io/ByteArrayInputStream
    //   142: astore #10
    //   144: aload #5
    //   146: astore_0
    //   147: aload #4
    //   149: astore #9
    //   151: aload #10
    //   153: aload_3
    //   154: invokespecial <init> : ([B)V
    //   157: aload #10
    //   159: astore_0
    //   160: aload_0
    //   161: astore #5
    //   163: goto -> 352
    //   166: aload #5
    //   168: astore_0
    //   169: aload #4
    //   171: astore #9
    //   173: aload #10
    //   175: ldc 'gzip'
    //   177: invokevirtual equals : (Ljava/lang/Object;)Z
    //   180: ifeq -> 260
    //   183: aload #5
    //   185: astore_0
    //   186: aload #4
    //   188: astore #9
    //   190: new java/util/zip/GZIPInputStream
    //   193: astore #10
    //   195: aload #5
    //   197: astore_0
    //   198: aload #4
    //   200: astore #9
    //   202: new java/io/ByteArrayInputStream
    //   205: astore #11
    //   207: aload #5
    //   209: astore_0
    //   210: aload #4
    //   212: astore #9
    //   214: aload #11
    //   216: aload_3
    //   217: invokespecial <init> : ([B)V
    //   220: aload #5
    //   222: astore_0
    //   223: aload #4
    //   225: astore #9
    //   227: aload #10
    //   229: aload #11
    //   231: aload_3
    //   232: arraylength
    //   233: invokespecial <init> : (Ljava/io/InputStream;I)V
    //   236: aload #5
    //   238: astore_0
    //   239: aload #4
    //   241: astore #9
    //   243: new java/io/BufferedInputStream
    //   246: dup
    //   247: aload #10
    //   249: invokespecial <init> : (Ljava/io/InputStream;)V
    //   252: astore #5
    //   254: aload #5
    //   256: astore_0
    //   257: goto -> 160
    //   260: aload #5
    //   262: astore_0
    //   263: aload #4
    //   265: astore #9
    //   267: aload #10
    //   269: ldc 'zlib'
    //   271: invokevirtual equals : (Ljava/lang/Object;)Z
    //   274: ifeq -> 584
    //   277: aload #5
    //   279: astore_0
    //   280: aload #4
    //   282: astore #9
    //   284: new java/util/zip/InflaterInputStream
    //   287: astore #10
    //   289: aload #5
    //   291: astore_0
    //   292: aload #4
    //   294: astore #9
    //   296: new java/io/ByteArrayInputStream
    //   299: astore #11
    //   301: aload #5
    //   303: astore_0
    //   304: aload #4
    //   306: astore #9
    //   308: aload #11
    //   310: aload_3
    //   311: invokespecial <init> : ([B)V
    //   314: aload #5
    //   316: astore_0
    //   317: aload #4
    //   319: astore #9
    //   321: aload #10
    //   323: aload #11
    //   325: invokespecial <init> : (Ljava/io/InputStream;)V
    //   328: aload #5
    //   330: astore_0
    //   331: aload #4
    //   333: astore #9
    //   335: new java/io/BufferedInputStream
    //   338: dup
    //   339: aload #10
    //   341: invokespecial <init> : (Ljava/io/InputStream;)V
    //   344: astore #5
    //   346: aload #5
    //   348: astore_0
    //   349: goto -> 160
    //   352: aload #5
    //   354: astore_0
    //   355: aload #5
    //   357: astore #9
    //   359: iconst_4
    //   360: newarray byte
    //   362: astore #4
    //   364: iconst_0
    //   365: istore #8
    //   367: iload #8
    //   369: iload_2
    //   370: if_icmpge -> 576
    //   373: iconst_0
    //   374: istore #12
    //   376: iload #12
    //   378: iload_1
    //   379: if_icmpge -> 570
    //   382: aload #5
    //   384: astore_0
    //   385: aload #5
    //   387: astore #9
    //   389: aload #5
    //   391: aload #4
    //   393: invokevirtual read : ([B)I
    //   396: istore #13
    //   398: aload #5
    //   400: astore_0
    //   401: aload #5
    //   403: astore #9
    //   405: iload #13
    //   407: aload #4
    //   409: arraylength
    //   410: if_icmpge -> 456
    //   413: aload #5
    //   415: astore_0
    //   416: aload #5
    //   418: astore #9
    //   420: aload #5
    //   422: aload #4
    //   424: iload #13
    //   426: aload #4
    //   428: arraylength
    //   429: iload #13
    //   431: isub
    //   432: invokevirtual read : ([BII)I
    //   435: istore #14
    //   437: iload #14
    //   439: iconst_m1
    //   440: if_icmpne -> 446
    //   443: goto -> 456
    //   446: iload #13
    //   448: iload #14
    //   450: iadd
    //   451: istore #13
    //   453: goto -> 398
    //   456: aload #5
    //   458: astore_0
    //   459: aload #5
    //   461: astore #9
    //   463: iload #13
    //   465: aload #4
    //   467: arraylength
    //   468: if_icmpne -> 534
    //   471: aload #5
    //   473: astore_0
    //   474: aload #5
    //   476: astore #9
    //   478: aload #6
    //   480: iload #8
    //   482: iload_1
    //   483: imul
    //   484: iload #12
    //   486: iadd
    //   487: aload #4
    //   489: iconst_0
    //   490: baload
    //   491: invokestatic unsignedByteToInt : (B)I
    //   494: aload #4
    //   496: iconst_1
    //   497: baload
    //   498: invokestatic unsignedByteToInt : (B)I
    //   501: bipush #8
    //   503: ishl
    //   504: ior
    //   505: aload #4
    //   507: iconst_2
    //   508: baload
    //   509: invokestatic unsignedByteToInt : (B)I
    //   512: bipush #16
    //   514: ishl
    //   515: ior
    //   516: aload #4
    //   518: iconst_3
    //   519: baload
    //   520: invokestatic unsignedByteToInt : (B)I
    //   523: bipush #24
    //   525: ishl
    //   526: ior
    //   527: iastore
    //   528: iinc #12, 1
    //   531: goto -> 376
    //   534: aload #5
    //   536: astore_0
    //   537: aload #5
    //   539: astore #9
    //   541: new com/badlogic/gdx/utils/GdxRuntimeException
    //   544: astore #4
    //   546: aload #5
    //   548: astore_0
    //   549: aload #5
    //   551: astore #9
    //   553: aload #4
    //   555: ldc 'Error Reading TMX Layer Data: Premature end of tile data'
    //   557: invokespecial <init> : (Ljava/lang/String;)V
    //   560: aload #5
    //   562: astore_0
    //   563: aload #5
    //   565: astore #9
    //   567: aload #4
    //   569: athrow
    //   570: iinc #8, 1
    //   573: goto -> 367
    //   576: aload #5
    //   578: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   581: aload #6
    //   583: areturn
    //   584: aload #5
    //   586: astore_0
    //   587: aload #4
    //   589: astore #9
    //   591: new com/badlogic/gdx/utils/GdxRuntimeException
    //   594: astore #6
    //   596: aload #5
    //   598: astore_0
    //   599: aload #4
    //   601: astore #9
    //   603: new java/lang/StringBuilder
    //   606: astore_3
    //   607: aload #5
    //   609: astore_0
    //   610: aload #4
    //   612: astore #9
    //   614: aload_3
    //   615: invokespecial <init> : ()V
    //   618: aload #5
    //   620: astore_0
    //   621: aload #4
    //   623: astore #9
    //   625: aload_3
    //   626: ldc 'Unrecognised compression ('
    //   628: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   631: pop
    //   632: aload #5
    //   634: astore_0
    //   635: aload #4
    //   637: astore #9
    //   639: aload_3
    //   640: aload #10
    //   642: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   645: pop
    //   646: aload #5
    //   648: astore_0
    //   649: aload #4
    //   651: astore #9
    //   653: aload_3
    //   654: ldc ') for TMX Layer Data'
    //   656: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   659: pop
    //   660: aload #5
    //   662: astore_0
    //   663: aload #4
    //   665: astore #9
    //   667: aload #6
    //   669: aload_3
    //   670: invokevirtual toString : ()Ljava/lang/String;
    //   673: invokespecial <init> : (Ljava/lang/String;)V
    //   676: aload #5
    //   678: astore_0
    //   679: aload #4
    //   681: astore #9
    //   683: aload #6
    //   685: athrow
    //   686: astore #9
    //   688: goto -> 761
    //   691: astore #4
    //   693: aload #9
    //   695: astore_0
    //   696: new com/badlogic/gdx/utils/GdxRuntimeException
    //   699: astore #5
    //   701: aload #9
    //   703: astore_0
    //   704: new java/lang/StringBuilder
    //   707: astore #10
    //   709: aload #9
    //   711: astore_0
    //   712: aload #10
    //   714: invokespecial <init> : ()V
    //   717: aload #9
    //   719: astore_0
    //   720: aload #10
    //   722: ldc 'Error Reading TMX Layer Data - IOException: '
    //   724: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   727: pop
    //   728: aload #9
    //   730: astore_0
    //   731: aload #10
    //   733: aload #4
    //   735: invokevirtual getMessage : ()Ljava/lang/String;
    //   738: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   741: pop
    //   742: aload #9
    //   744: astore_0
    //   745: aload #5
    //   747: aload #10
    //   749: invokevirtual toString : ()Ljava/lang/String;
    //   752: invokespecial <init> : (Ljava/lang/String;)V
    //   755: aload #9
    //   757: astore_0
    //   758: aload #5
    //   760: athrow
    //   761: aload_0
    //   762: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   765: aload #9
    //   767: athrow
    //   768: new java/lang/StringBuilder
    //   771: dup
    //   772: invokespecial <init> : ()V
    //   775: astore #9
    //   777: aload #9
    //   779: ldc 'Unrecognised encoding ('
    //   781: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   784: pop
    //   785: aload #9
    //   787: aload_0
    //   788: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   791: pop
    //   792: aload #9
    //   794: ldc ') for TMX Layer Data'
    //   796: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   799: pop
    //   800: new com/badlogic/gdx/utils/GdxRuntimeException
    //   803: dup
    //   804: aload #9
    //   806: invokevirtual toString : ()Ljava/lang/String;
    //   809: invokespecial <init> : (Ljava/lang/String;)V
    //   812: athrow
    //   813: new com/badlogic/gdx/utils/GdxRuntimeException
    //   816: dup
    //   817: ldc 'Unsupported encoding (XML) for TMX Layer Data'
    //   819: invokespecial <init> : (Ljava/lang/String;)V
    //   822: astore_0
    //   823: goto -> 828
    //   826: aload_0
    //   827: athrow
    //   828: goto -> 826
    // Exception table:
    //   from	to	target	type
    //   103	112	691	java/io/IOException
    //   103	112	686	finally
    //   119	127	691	java/io/IOException
    //   119	127	686	finally
    //   139	144	691	java/io/IOException
    //   139	144	686	finally
    //   151	157	691	java/io/IOException
    //   151	157	686	finally
    //   173	183	691	java/io/IOException
    //   173	183	686	finally
    //   190	195	691	java/io/IOException
    //   190	195	686	finally
    //   202	207	691	java/io/IOException
    //   202	207	686	finally
    //   214	220	691	java/io/IOException
    //   214	220	686	finally
    //   227	236	691	java/io/IOException
    //   227	236	686	finally
    //   243	254	691	java/io/IOException
    //   243	254	686	finally
    //   267	277	691	java/io/IOException
    //   267	277	686	finally
    //   284	289	691	java/io/IOException
    //   284	289	686	finally
    //   296	301	691	java/io/IOException
    //   296	301	686	finally
    //   308	314	691	java/io/IOException
    //   308	314	686	finally
    //   321	328	691	java/io/IOException
    //   321	328	686	finally
    //   335	346	691	java/io/IOException
    //   335	346	686	finally
    //   359	364	691	java/io/IOException
    //   359	364	686	finally
    //   389	398	691	java/io/IOException
    //   389	398	686	finally
    //   405	413	691	java/io/IOException
    //   405	413	686	finally
    //   420	437	691	java/io/IOException
    //   420	437	686	finally
    //   463	471	691	java/io/IOException
    //   463	471	686	finally
    //   478	528	691	java/io/IOException
    //   478	528	686	finally
    //   541	546	691	java/io/IOException
    //   541	546	686	finally
    //   553	560	691	java/io/IOException
    //   553	560	686	finally
    //   567	570	691	java/io/IOException
    //   567	570	686	finally
    //   591	596	691	java/io/IOException
    //   591	596	686	finally
    //   603	607	691	java/io/IOException
    //   603	607	686	finally
    //   614	618	691	java/io/IOException
    //   614	618	686	finally
    //   625	632	691	java/io/IOException
    //   625	632	686	finally
    //   639	646	691	java/io/IOException
    //   639	646	686	finally
    //   653	660	691	java/io/IOException
    //   653	660	686	finally
    //   667	676	691	java/io/IOException
    //   667	676	686	finally
    //   683	686	691	java/io/IOException
    //   683	686	686	finally
    //   696	701	686	finally
    //   704	709	686	finally
    //   712	717	686	finally
    //   720	728	686	finally
    //   731	742	686	finally
    //   745	755	686	finally
    //   758	761	686	finally }
  
  protected static int unsignedByteToInt(byte paramByte) { return paramByte & 0xFF; }
  
  protected void addAnimatedTile(TiledMapTileSet paramTiledMapTileSet, TiledMapTile paramTiledMapTile, XmlReader.Element paramElement, int paramInt) {
    element = paramElement.getChildByName("animation");
    if (element != null) {
      Array array = new Array();
      IntArray intArray = new IntArray();
      for (XmlReader.Element element : element.getChildrenByName("frame")) {
        array.add((StaticTiledMapTile)paramTiledMapTileSet.getTile(element.getIntAttribute("tileid") + paramInt));
        intArray.add(element.getIntAttribute("duration"));
      } 
      AnimatedTiledMapTile animatedTiledMapTile = new AnimatedTiledMapTile(intArray, array);
      animatedTiledMapTile.setId(paramTiledMapTile.getId());
      paramTiledMapTileSet.putTile(paramTiledMapTile.getId(), animatedTiledMapTile);
    } 
  }
  
  protected void addStaticTiledMapTile(TiledMapTileSet paramTiledMapTileSet, TextureRegion paramTextureRegion, int paramInt, float paramFloat1, float paramFloat2) {
    StaticTiledMapTile staticTiledMapTile = new StaticTiledMapTile(paramTextureRegion);
    staticTiledMapTile.setId(paramInt);
    staticTiledMapTile.setOffsetX(paramFloat1);
    paramFloat1 = paramFloat2;
    if (this.flipY)
      paramFloat1 = -paramFloat2; 
    staticTiledMapTile.setOffsetY(paramFloat1);
    paramTiledMapTileSet.putTile(paramInt, staticTiledMapTile);
  }
  
  protected abstract void addStaticTiles(FileHandle paramFileHandle1, ImageResolver paramImageResolver, TiledMapTileSet paramTiledMapTileSet, XmlReader.Element paramElement, Array<XmlReader.Element> paramArray, String paramString1, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, String paramString2, int paramInt6, int paramInt7, String paramString3, int paramInt8, int paramInt9, FileHandle paramFileHandle2);
  
  protected void addTileObjectGroup(TiledMapTile paramTiledMapTile, XmlReader.Element paramElement) {
    paramElement = paramElement.getChildByName("objectgroup");
    if (paramElement != null)
      for (XmlReader.Element element : paramElement.getChildrenByName("object"))
        loadObject(this.map, paramTiledMapTile, element);  
  }
  
  protected void addTileProperties(TiledMapTile paramTiledMapTile, XmlReader.Element paramElement) {
    String str = paramElement.getAttribute("terrain", null);
    if (str != null)
      paramTiledMapTile.getProperties().put("terrain", str); 
    str = paramElement.getAttribute("probability", null);
    if (str != null)
      paramTiledMapTile.getProperties().put("probability", str); 
    paramElement = paramElement.getChildByName("properties");
    if (paramElement != null)
      loadProperties(paramTiledMapTile.getProperties(), paramElement); 
  }
  
  protected TiledMapTileLayer.Cell createTileLayerCell(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {
    TiledMapTileLayer.Cell cell = new TiledMapTileLayer.Cell();
    if (paramBoolean3) {
      if (paramBoolean1 && paramBoolean2) {
        cell.setFlipHorizontally(true);
        cell.setRotation(3);
      } else if (paramBoolean1) {
        cell.setRotation(3);
      } else if (paramBoolean2) {
        cell.setRotation(1);
      } else {
        cell.setFlipVertically(true);
        cell.setRotation(3);
      } 
    } else {
      cell.setFlipHorizontally(paramBoolean1);
      cell.setFlipVertically(paramBoolean2);
    } 
    return cell;
  }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, P paramP) {
    this.root = this.xml.parse(paramFileHandle);
    TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
    if (paramP != null) {
      textureParameter.genMipMaps = paramP.generateMipMaps;
      textureParameter.minFilter = paramP.textureMinFilter;
      textureParameter.magFilter = paramP.textureMagFilter;
    } 
    return getDependencyAssetDescriptors(paramFileHandle, textureParameter);
  }
  
  protected abstract Array<AssetDescriptor> getDependencyAssetDescriptors(FileHandle paramFileHandle, TextureLoader.TextureParameter paramTextureParameter);
  
  protected void loadBasicLayerInfo(MapLayer paramMapLayer, XmlReader.Element paramElement) {
    String str = paramElement.getAttribute("name", null);
    float f1 = Float.parseFloat(paramElement.getAttribute("opacity", "1.0"));
    boolean bool = true;
    if (paramElement.getIntAttribute("visible", 1) != 1)
      bool = false; 
    float f2 = paramElement.getFloatAttribute("offsetx", 0.0F);
    float f3 = paramElement.getFloatAttribute("offsety", 0.0F);
    paramMapLayer.setName(str);
    paramMapLayer.setOpacity(f1);
    paramMapLayer.setVisible(bool);
    paramMapLayer.setOffsetX(f2);
    paramMapLayer.setOffsetY(f3);
  }
  
  protected void loadImageLayer(TiledMap paramTiledMap, MapLayers paramMapLayers, XmlReader.Element paramElement, FileHandle paramFileHandle, ImageResolver paramImageResolver) {
    if (paramElement.getName().equals("imagelayer")) {
      float f1;
      TextureRegion textureRegion;
      if (paramElement.hasAttribute("offsetx")) {
        f1 = Float.parseFloat(paramElement.getAttribute("offsetx", "0"));
      } else {
        f1 = Float.parseFloat(paramElement.getAttribute("x", "0"));
      } 
      if (paramElement.hasAttribute("offsety")) {
        f2 = Float.parseFloat(paramElement.getAttribute("offsety", "0"));
      } else {
        f2 = Float.parseFloat(paramElement.getAttribute("y", "0"));
      } 
      float f3 = f2;
      if (this.flipY)
        f3 = this.mapHeightInPixels - f2; 
      paramTiledMap = null;
      XmlReader.Element element = paramElement.getChildByName("image");
      float f2 = f3;
      if (element != null) {
        textureRegion = paramImageResolver.getImage(getRelativeFileHandle(paramFileHandle, element.getAttribute("source")).path());
        f2 = f3 - textureRegion.getRegionHeight();
      } 
      TiledMapImageLayer tiledMapImageLayer = new TiledMapImageLayer(textureRegion, f1, f2);
      loadBasicLayerInfo(tiledMapImageLayer, paramElement);
      paramElement = paramElement.getChildByName("properties");
      if (paramElement != null)
        loadProperties(tiledMapImageLayer.getProperties(), paramElement); 
      paramMapLayers.add(tiledMapImageLayer);
    } 
  }
  
  protected void loadLayer(TiledMap paramTiledMap, MapLayers paramMapLayers, XmlReader.Element paramElement, FileHandle paramFileHandle, ImageResolver paramImageResolver) {
    String str = paramElement.getName();
    if (str.equals("group")) {
      loadLayerGroup(paramTiledMap, paramMapLayers, paramElement, paramFileHandle, paramImageResolver);
    } else if (str.equals("layer")) {
      loadTileLayer(paramTiledMap, paramMapLayers, paramElement);
    } else if (str.equals("objectgroup")) {
      loadObjectGroup(paramTiledMap, paramMapLayers, paramElement);
    } else if (str.equals("imagelayer")) {
      loadImageLayer(paramTiledMap, paramMapLayers, paramElement, paramFileHandle, paramImageResolver);
    } 
  }
  
  protected void loadLayerGroup(TiledMap paramTiledMap, MapLayers paramMapLayers, XmlReader.Element paramElement, FileHandle paramFileHandle, ImageResolver paramImageResolver) {
    if (paramElement.getName().equals("group")) {
      MapGroupLayer mapGroupLayer = new MapGroupLayer();
      loadBasicLayerInfo(mapGroupLayer, paramElement);
      XmlReader.Element element = paramElement.getChildByName("properties");
      if (element != null)
        loadProperties(mapGroupLayer.getProperties(), element); 
      byte b = 0;
      int i = paramElement.getChildCount();
      while (b < i) {
        element = paramElement.getChild(b);
        loadLayer(paramTiledMap, mapGroupLayer.getLayers(), element, paramFileHandle, paramImageResolver);
        b++;
      } 
      Iterator iterator = mapGroupLayer.getLayers().iterator();
      while (iterator.hasNext())
        ((MapLayer)iterator.next()).setParent(mapGroupLayer); 
      paramMapLayers.add(mapGroupLayer);
    } 
  }
  
  protected void loadObject(TiledMap paramTiledMap, MapLayer paramMapLayer, XmlReader.Element paramElement) { loadObject(paramTiledMap, paramMapLayer.getObjects(), paramElement, this.mapHeightInPixels); }
  
  protected void loadObject(TiledMap paramTiledMap, MapObjects paramMapObjects, XmlReader.Element paramElement, float paramFloat) { // Byte code:
    //   0: aload_3
    //   1: invokevirtual getName : ()Ljava/lang/String;
    //   4: ldc_w 'object'
    //   7: invokevirtual equals : (Ljava/lang/Object;)Z
    //   10: ifeq -> 1073
    //   13: aload_0
    //   14: getfield convertObjectToTileSpace : Z
    //   17: istore #5
    //   19: fconst_1
    //   20: fstore #6
    //   22: iload #5
    //   24: ifeq -> 39
    //   27: fconst_1
    //   28: aload_0
    //   29: getfield mapTileWidth : I
    //   32: i2f
    //   33: fdiv
    //   34: fstore #7
    //   36: goto -> 42
    //   39: fconst_1
    //   40: fstore #7
    //   42: aload_0
    //   43: getfield convertObjectToTileSpace : Z
    //   46: ifeq -> 58
    //   49: fconst_1
    //   50: aload_0
    //   51: getfield mapTileHeight : I
    //   54: i2f
    //   55: fdiv
    //   56: fstore #6
    //   58: aload_3
    //   59: ldc_w 'x'
    //   62: fconst_0
    //   63: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   66: fload #7
    //   68: fmul
    //   69: fstore #8
    //   71: aload_0
    //   72: getfield flipY : Z
    //   75: istore #5
    //   77: ldc_w 'y'
    //   80: astore #9
    //   82: iload #5
    //   84: ifeq -> 103
    //   87: fload #4
    //   89: aload_3
    //   90: ldc_w 'y'
    //   93: fconst_0
    //   94: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   97: fsub
    //   98: fstore #4
    //   100: goto -> 113
    //   103: aload_3
    //   104: ldc_w 'y'
    //   107: fconst_0
    //   108: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   111: fstore #4
    //   113: fload #4
    //   115: fload #6
    //   117: fmul
    //   118: fstore #4
    //   120: aload_3
    //   121: ldc_w 'width'
    //   124: fconst_0
    //   125: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   128: fload #7
    //   130: fmul
    //   131: fstore #10
    //   133: aload_3
    //   134: ldc_w 'height'
    //   137: fconst_0
    //   138: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   141: fload #6
    //   143: fmul
    //   144: fstore #11
    //   146: aload_3
    //   147: invokevirtual getChildCount : ()I
    //   150: ifle -> 541
    //   153: aload_3
    //   154: ldc_w 'polygon'
    //   157: invokevirtual getChildByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   160: astore #12
    //   162: aload #12
    //   164: ifnull -> 321
    //   167: aload #12
    //   169: ldc_w 'points'
    //   172: invokevirtual getAttribute : (Ljava/lang/String;)Ljava/lang/String;
    //   175: ldc_w ' '
    //   178: invokevirtual split : (Ljava/lang/String;)[Ljava/lang/String;
    //   181: astore #12
    //   183: aload #12
    //   185: arraylength
    //   186: iconst_2
    //   187: imul
    //   188: newarray float
    //   190: astore #13
    //   192: iconst_0
    //   193: istore #14
    //   195: iload #14
    //   197: aload #12
    //   199: arraylength
    //   200: if_icmpge -> 283
    //   203: aload #12
    //   205: iload #14
    //   207: aaload
    //   208: ldc ','
    //   210: invokevirtual split : (Ljava/lang/String;)[Ljava/lang/String;
    //   213: astore #15
    //   215: iload #14
    //   217: iconst_2
    //   218: imul
    //   219: istore #16
    //   221: aload #13
    //   223: iload #16
    //   225: aload #15
    //   227: iconst_0
    //   228: aaload
    //   229: invokestatic parseFloat : (Ljava/lang/String;)F
    //   232: fload #7
    //   234: fmul
    //   235: fastore
    //   236: aload #15
    //   238: iconst_1
    //   239: aaload
    //   240: invokestatic parseFloat : (Ljava/lang/String;)F
    //   243: fstore #17
    //   245: aload_0
    //   246: getfield flipY : Z
    //   249: ifeq -> 258
    //   252: iconst_m1
    //   253: istore #18
    //   255: goto -> 261
    //   258: iconst_1
    //   259: istore #18
    //   261: aload #13
    //   263: iload #16
    //   265: iconst_1
    //   266: iadd
    //   267: fload #17
    //   269: fload #6
    //   271: fmul
    //   272: iload #18
    //   274: i2f
    //   275: fmul
    //   276: fastore
    //   277: iinc #14, 1
    //   280: goto -> 195
    //   283: aload #9
    //   285: astore #12
    //   287: new com/badlogic/gdx/math/Polygon
    //   290: dup
    //   291: aload #13
    //   293: invokespecial <init> : ([F)V
    //   296: astore #9
    //   298: aload #9
    //   300: fload #8
    //   302: fload #4
    //   304: invokevirtual setPosition : (FF)V
    //   307: new com/badlogic/gdx/maps/objects/PolygonMapObject
    //   310: dup
    //   311: aload #9
    //   313: invokespecial <init> : (Lcom/badlogic/gdx/math/Polygon;)V
    //   316: astore #9
    //   318: goto -> 549
    //   321: ldc_w 'y'
    //   324: astore #12
    //   326: aload_3
    //   327: ldc_w 'polyline'
    //   330: invokevirtual getChildByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   333: astore #9
    //   335: aload #9
    //   337: ifnull -> 490
    //   340: aload #9
    //   342: ldc_w 'points'
    //   345: invokevirtual getAttribute : (Ljava/lang/String;)Ljava/lang/String;
    //   348: ldc_w ' '
    //   351: invokevirtual split : (Ljava/lang/String;)[Ljava/lang/String;
    //   354: astore #9
    //   356: aload #9
    //   358: arraylength
    //   359: iconst_2
    //   360: imul
    //   361: newarray float
    //   363: astore #13
    //   365: iconst_0
    //   366: istore #14
    //   368: iload #14
    //   370: aload #9
    //   372: arraylength
    //   373: if_icmpge -> 456
    //   376: aload #9
    //   378: iload #14
    //   380: aaload
    //   381: ldc ','
    //   383: invokevirtual split : (Ljava/lang/String;)[Ljava/lang/String;
    //   386: astore #15
    //   388: iload #14
    //   390: iconst_2
    //   391: imul
    //   392: istore #16
    //   394: aload #13
    //   396: iload #16
    //   398: aload #15
    //   400: iconst_0
    //   401: aaload
    //   402: invokestatic parseFloat : (Ljava/lang/String;)F
    //   405: fload #7
    //   407: fmul
    //   408: fastore
    //   409: aload #15
    //   411: iconst_1
    //   412: aaload
    //   413: invokestatic parseFloat : (Ljava/lang/String;)F
    //   416: fstore #17
    //   418: aload_0
    //   419: getfield flipY : Z
    //   422: ifeq -> 431
    //   425: iconst_m1
    //   426: istore #18
    //   428: goto -> 434
    //   431: iconst_1
    //   432: istore #18
    //   434: aload #13
    //   436: iload #16
    //   438: iconst_1
    //   439: iadd
    //   440: fload #17
    //   442: fload #6
    //   444: fmul
    //   445: iload #18
    //   447: i2f
    //   448: fmul
    //   449: fastore
    //   450: iinc #14, 1
    //   453: goto -> 368
    //   456: new com/badlogic/gdx/math/Polyline
    //   459: dup
    //   460: aload #13
    //   462: invokespecial <init> : ([F)V
    //   465: astore #9
    //   467: aload #9
    //   469: fload #8
    //   471: fload #4
    //   473: invokevirtual setPosition : (FF)V
    //   476: new com/badlogic/gdx/maps/objects/PolylineMapObject
    //   479: dup
    //   480: aload #9
    //   482: invokespecial <init> : (Lcom/badlogic/gdx/math/Polyline;)V
    //   485: astore #9
    //   487: goto -> 549
    //   490: aload_3
    //   491: ldc_w 'ellipse'
    //   494: invokevirtual getChildByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   497: ifnull -> 541
    //   500: aload_0
    //   501: getfield flipY : Z
    //   504: ifeq -> 517
    //   507: fload #4
    //   509: fload #11
    //   511: fsub
    //   512: fstore #17
    //   514: goto -> 521
    //   517: fload #4
    //   519: fstore #17
    //   521: new com/badlogic/gdx/maps/objects/EllipseMapObject
    //   524: dup
    //   525: fload #8
    //   527: fload #17
    //   529: fload #10
    //   531: fload #11
    //   533: invokespecial <init> : (FFFF)V
    //   536: astore #9
    //   538: goto -> 549
    //   541: ldc_w 'y'
    //   544: astore #12
    //   546: aconst_null
    //   547: astore #9
    //   549: aload #9
    //   551: ifnonnull -> 811
    //   554: aload_3
    //   555: ldc_w 'gid'
    //   558: aconst_null
    //   559: invokevirtual getAttribute : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   562: astore #9
    //   564: aload #9
    //   566: ifnull -> 770
    //   569: aload #9
    //   571: invokestatic parseLong : (Ljava/lang/String;)J
    //   574: l2i
    //   575: istore #14
    //   577: ldc -2147483648
    //   579: iload #14
    //   581: iand
    //   582: ifeq -> 591
    //   585: iconst_1
    //   586: istore #5
    //   588: goto -> 594
    //   591: iconst_0
    //   592: istore #5
    //   594: ldc 1073741824
    //   596: iload #14
    //   598: iand
    //   599: ifeq -> 608
    //   602: iconst_1
    //   603: istore #19
    //   605: goto -> 611
    //   608: iconst_0
    //   609: istore #19
    //   611: new com/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject
    //   614: dup
    //   615: aload_1
    //   616: invokevirtual getTileSets : ()Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;
    //   619: iload #14
    //   621: ldc_w 536870911
    //   624: iand
    //   625: invokevirtual getTile : (I)Lcom/badlogic/gdx/maps/tiled/TiledMapTile;
    //   628: iload #5
    //   630: iload #19
    //   632: invokespecial <init> : (Lcom/badlogic/gdx/maps/tiled/TiledMapTile;ZZ)V
    //   635: astore #9
    //   637: aload #9
    //   639: invokevirtual getTextureRegion : ()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    //   642: astore_1
    //   643: aload #9
    //   645: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   648: ldc_w 'gid'
    //   651: iload #14
    //   653: invokestatic valueOf : (I)Ljava/lang/Integer;
    //   656: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   659: aload #9
    //   661: fload #8
    //   663: invokevirtual setX : (F)V
    //   666: aload_0
    //   667: getfield flipY : Z
    //   670: ifeq -> 680
    //   673: fload #4
    //   675: fstore #17
    //   677: goto -> 687
    //   680: fload #4
    //   682: fload #11
    //   684: fsub
    //   685: fstore #17
    //   687: aload #9
    //   689: fload #17
    //   691: invokevirtual setY : (F)V
    //   694: aload_3
    //   695: ldc_w 'width'
    //   698: aload_1
    //   699: invokevirtual getRegionWidth : ()I
    //   702: i2f
    //   703: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   706: fstore #20
    //   708: aload_3
    //   709: ldc_w 'height'
    //   712: aload_1
    //   713: invokevirtual getRegionHeight : ()I
    //   716: i2f
    //   717: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   720: fstore #17
    //   722: aload #9
    //   724: fload #7
    //   726: fload #20
    //   728: aload_1
    //   729: invokevirtual getRegionWidth : ()I
    //   732: i2f
    //   733: fdiv
    //   734: fmul
    //   735: invokevirtual setScaleX : (F)V
    //   738: aload #9
    //   740: fload #6
    //   742: fload #17
    //   744: aload_1
    //   745: invokevirtual getRegionHeight : ()I
    //   748: i2f
    //   749: fdiv
    //   750: fmul
    //   751: invokevirtual setScaleY : (F)V
    //   754: aload #9
    //   756: aload_3
    //   757: ldc_w 'rotation'
    //   760: fconst_0
    //   761: invokevirtual getFloatAttribute : (Ljava/lang/String;F)F
    //   764: invokevirtual setRotation : (F)V
    //   767: goto -> 811
    //   770: aload_0
    //   771: getfield flipY : Z
    //   774: ifeq -> 787
    //   777: fload #4
    //   779: fload #11
    //   781: fsub
    //   782: fstore #7
    //   784: goto -> 791
    //   787: fload #4
    //   789: fstore #7
    //   791: new com/badlogic/gdx/maps/objects/RectangleMapObject
    //   794: dup
    //   795: fload #8
    //   797: fload #7
    //   799: fload #10
    //   801: fload #11
    //   803: invokespecial <init> : (FFFF)V
    //   806: astore #9
    //   808: goto -> 811
    //   811: aload #9
    //   813: aload_3
    //   814: ldc_w 'name'
    //   817: aconst_null
    //   818: invokevirtual getAttribute : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   821: invokevirtual setName : (Ljava/lang/String;)V
    //   824: aload_3
    //   825: ldc_w 'rotation'
    //   828: aconst_null
    //   829: invokevirtual getAttribute : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   832: astore_1
    //   833: aload_1
    //   834: ifnull -> 855
    //   837: aload #9
    //   839: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   842: ldc_w 'rotation'
    //   845: aload_1
    //   846: invokestatic parseFloat : (Ljava/lang/String;)F
    //   849: invokestatic valueOf : (F)Ljava/lang/Float;
    //   852: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   855: aload_3
    //   856: ldc_w 'type'
    //   859: aconst_null
    //   860: invokevirtual getAttribute : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   863: astore_1
    //   864: aload_1
    //   865: ifnull -> 880
    //   868: aload #9
    //   870: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   873: ldc_w 'type'
    //   876: aload_1
    //   877: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   880: iconst_0
    //   881: istore #5
    //   883: aload_3
    //   884: ldc_w 'id'
    //   887: iconst_0
    //   888: invokevirtual getIntAttribute : (Ljava/lang/String;I)I
    //   891: istore #14
    //   893: iload #14
    //   895: ifeq -> 914
    //   898: aload #9
    //   900: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   903: ldc_w 'id'
    //   906: iload #14
    //   908: invokestatic valueOf : (I)Ljava/lang/Integer;
    //   911: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   914: aload #9
    //   916: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   919: ldc_w 'x'
    //   922: fload #8
    //   924: invokestatic valueOf : (F)Ljava/lang/Float;
    //   927: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   930: aload #9
    //   932: instanceof com/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject
    //   935: ifeq -> 956
    //   938: aload #9
    //   940: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   943: aload #12
    //   945: fload #4
    //   947: invokestatic valueOf : (F)Ljava/lang/Float;
    //   950: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   953: goto -> 991
    //   956: aload #9
    //   958: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   961: astore_1
    //   962: fload #4
    //   964: fstore #7
    //   966: aload_0
    //   967: getfield flipY : Z
    //   970: ifeq -> 980
    //   973: fload #4
    //   975: fload #11
    //   977: fsub
    //   978: fstore #7
    //   980: aload_1
    //   981: aload #12
    //   983: fload #7
    //   985: invokestatic valueOf : (F)Ljava/lang/Float;
    //   988: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   991: aload #9
    //   993: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   996: ldc_w 'width'
    //   999: fload #10
    //   1001: invokestatic valueOf : (F)Ljava/lang/Float;
    //   1004: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   1007: aload #9
    //   1009: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   1012: ldc_w 'height'
    //   1015: fload #11
    //   1017: invokestatic valueOf : (F)Ljava/lang/Float;
    //   1020: invokevirtual put : (Ljava/lang/String;Ljava/lang/Object;)V
    //   1023: aload_3
    //   1024: ldc_w 'visible'
    //   1027: iconst_1
    //   1028: invokevirtual getIntAttribute : (Ljava/lang/String;I)I
    //   1031: iconst_1
    //   1032: if_icmpne -> 1038
    //   1035: iconst_1
    //   1036: istore #5
    //   1038: aload #9
    //   1040: iload #5
    //   1042: invokevirtual setVisible : (Z)V
    //   1045: aload_3
    //   1046: ldc_w 'properties'
    //   1049: invokevirtual getChildByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   1052: astore_1
    //   1053: aload_1
    //   1054: ifnull -> 1067
    //   1057: aload_0
    //   1058: aload #9
    //   1060: invokevirtual getProperties : ()Lcom/badlogic/gdx/maps/MapProperties;
    //   1063: aload_1
    //   1064: invokevirtual loadProperties : (Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    //   1067: aload_2
    //   1068: aload #9
    //   1070: invokevirtual add : (Lcom/badlogic/gdx/maps/MapObject;)V
    //   1073: return }
  
  protected void loadObject(TiledMap paramTiledMap, TiledMapTile paramTiledMapTile, XmlReader.Element paramElement) { loadObject(paramTiledMap, paramTiledMapTile.getObjects(), paramElement, paramTiledMapTile.getTextureRegion().getRegionHeight()); }
  
  protected void loadObjectGroup(TiledMap paramTiledMap, MapLayers paramMapLayers, XmlReader.Element paramElement) {
    if (paramElement.getName().equals("objectgroup")) {
      MapLayer mapLayer = new MapLayer();
      loadBasicLayerInfo(mapLayer, paramElement);
      XmlReader.Element element = paramElement.getChildByName("properties");
      if (element != null)
        loadProperties(mapLayer.getProperties(), element); 
      Iterator iterator = paramElement.getChildrenByName("object").iterator();
      while (iterator.hasNext())
        loadObject(paramTiledMap, mapLayer, (XmlReader.Element)iterator.next()); 
      paramMapLayers.add(mapLayer);
    } 
  }
  
  protected void loadProperties(MapProperties paramMapProperties, XmlReader.Element paramElement) {
    if (paramElement == null)
      return; 
    if (paramElement.getName().equals("properties"))
      for (XmlReader.Element element : paramElement.getChildrenByName("property")) {
        String str2 = element.getAttribute("name", null);
        String str3 = element.getAttribute("value", null);
        String str4 = element.getAttribute("type", null);
        String str1 = str3;
        if (str3 == null)
          str1 = element.getText(); 
        paramMapProperties.put(str2, castProperty(str2, str1, str4));
      }  
  }
  
  protected void loadTileLayer(TiledMap paramTiledMap, MapLayers paramMapLayers, XmlReader.Element paramElement) {
    if (paramElement.getName().equals("layer")) {
      int i = paramElement.getIntAttribute("width", 0);
      int j = paramElement.getIntAttribute("height", 0);
      TiledMapTileLayer tiledMapTileLayer = new TiledMapTileLayer(i, j, ((Integer)paramTiledMap.getProperties().get("tilewidth", Integer.class)).intValue(), ((Integer)paramTiledMap.getProperties().get("tileheight", Integer.class)).intValue());
      loadBasicLayerInfo(tiledMapTileLayer, paramElement);
      int[] arrayOfInt = getTileIds(paramElement, i, j);
      TiledMapTileSets tiledMapTileSets = paramTiledMap.getTileSets();
      for (int k = 0; k < j; k++) {
        for (int m = 0; m < i; m++) {
          boolean bool3;
          boolean bool2;
          int n = arrayOfInt[k * i + m];
          boolean bool1 = true;
          if ((0x80000000 & n) != 0) {
            bool2 = true;
          } else {
            bool2 = false;
          } 
          if ((0x40000000 & n) != 0) {
            bool3 = true;
          } else {
            bool3 = false;
          } 
          if ((0x20000000 & n) == 0)
            bool1 = false; 
          TiledMapTile tiledMapTile = tiledMapTileSets.getTile(n & 0x1FFFFFFF);
          if (tiledMapTile != null) {
            TiledMapTileLayer.Cell cell = createTileLayerCell(bool2, bool3, bool1);
            cell.setTile(tiledMapTile);
            if (this.flipY) {
              n = j - 1 - k;
            } else {
              n = k;
            } 
            tiledMapTileLayer.setCell(m, n, cell);
          } 
        } 
      } 
      XmlReader.Element element = paramElement.getChildByName("properties");
      if (element != null)
        loadProperties(tiledMapTileLayer.getProperties(), element); 
      paramMapLayers.add(tiledMapTileLayer);
    } 
  }
  
  protected void loadTileSet(XmlReader.Element paramElement, FileHandle paramFileHandle, ImageResolver paramImageResolver) {
    if (paramElement.getName().equals("tileset")) {
      byte b4;
      byte b3;
      byte b2;
      byte b1;
      XmlReader.Element element1;
      String str1 = "";
      String str2 = paramElement.getAttribute("source", null);
      if (str2 != null) {
        element1 = getRelativeFileHandle(paramFileHandle, str2);
        try {
          FileHandle fileHandle1;
          XmlReader.Element element5 = this.xml.parse(element1);
          XmlReader.Element element6 = element5.getChildByName("image");
          if (element6 != null) {
            fileHandle1 = element6.getAttribute("source");
            b1 = element6.getIntAttribute("width", 0);
            b2 = element6.getIntAttribute("height", 0);
            fileHandle2 = getRelativeFileHandle(element1, fileHandle1);
          } else {
            element1 = null;
            b1 = 0;
            b2 = 0;
            fileHandle1 = fileHandle2;
            fileHandle2 = element1;
          } 
          element1 = fileHandle2;
          FileHandle fileHandle2 = fileHandle1;
          XmlReader.Element element4 = element5;
        } catch (SerializationException paramElement) {
          throw new GdxRuntimeException("Error parsing external tileset.");
        } 
      } else {
        element1 = paramElement.getChildByName("image");
        if (element1 != null) {
          str1 = element1.getAttribute("source");
          b1 = element1.getIntAttribute("width", 0);
          b2 = element1.getIntAttribute("height", 0);
          FileHandle fileHandle = getRelativeFileHandle(paramFileHandle, str1);
        } else {
          str1 = "";
          element1 = null;
          b2 = 0;
          b1 = 0;
        } 
      } 
      String str3 = paramElement.get("name", null);
      int i = paramElement.getIntAttribute("firstgid", 1);
      int j = paramElement.getIntAttribute("tilewidth", 0);
      int k = paramElement.getIntAttribute("tileheight", 0);
      int m = paramElement.getIntAttribute("spacing", 0);
      int n = paramElement.getIntAttribute("margin", 0);
      XmlReader.Element element2 = paramElement.getChildByName("tileoffset");
      if (element2 != null) {
        b3 = element2.getIntAttribute("x", 0);
        b4 = element2.getIntAttribute("y", 0);
      } else {
        b3 = 0;
        b4 = 0;
      } 
      TiledMapTileSet tiledMapTileSet2 = new TiledMapTileSet();
      tiledMapTileSet2.setName(str3);
      MapProperties mapProperties = tiledMapTileSet2.getProperties();
      XmlReader.Element element3 = paramElement.getChildByName("properties");
      if (element3 != null)
        loadProperties(mapProperties, element3); 
      mapProperties.put("firstgid", Integer.valueOf(i));
      Array array = paramElement.getChildrenByName("tile");
      TiledMapTileSet tiledMapTileSet1 = tiledMapTileSet2;
      int i1 = i;
      addStaticTiles(paramFileHandle, paramImageResolver, tiledMapTileSet2, paramElement, array, str3, i, j, k, m, n, str2, b3, b4, str1, b1, b2, element1);
      for (XmlReader.Element element : array) {
        TiledMapTile tiledMapTile = tiledMapTileSet1.getTile(i1 + element.getIntAttribute("id", 0));
        if (tiledMapTile != null) {
          addTileProperties(tiledMapTile, element);
          addTileObjectGroup(tiledMapTile, element);
          addAnimatedTile(tiledMapTileSet1, tiledMapTile, element, i1);
        } 
      } 
      this.map.getTileSets().addTileSet(tiledMapTileSet1);
    } 
  }
  
  protected TiledMap loadTiledMap(FileHandle paramFileHandle, P paramP, ImageResolver paramImageResolver) {
    this.map = new TiledMap();
    if (paramP != null) {
      this.convertObjectToTileSpace = paramP.convertObjectToTileSpace;
      this.flipY = paramP.flipY;
    } else {
      this.convertObjectToTileSpace = false;
      this.flipY = true;
    } 
    String str1 = this.root.getAttribute("orientation", null);
    int i = this.root.getIntAttribute("width", 0);
    int j = this.root.getIntAttribute("height", 0);
    int k = this.root.getIntAttribute("tilewidth", 0);
    int m = this.root.getIntAttribute("tileheight", 0);
    int n = this.root.getIntAttribute("hexsidelength", 0);
    String str2 = this.root.getAttribute("staggeraxis", null);
    String str3 = this.root.getAttribute("staggerindex", null);
    String str4 = this.root.getAttribute("backgroundcolor", null);
    paramP = (P)this.map.getProperties();
    if (str1 != null)
      paramP.put("orientation", str1); 
    paramP.put("width", Integer.valueOf(i));
    paramP.put("height", Integer.valueOf(j));
    paramP.put("tilewidth", Integer.valueOf(k));
    paramP.put("tileheight", Integer.valueOf(m));
    paramP.put("hexsidelength", Integer.valueOf(n));
    if (str2 != null)
      paramP.put("staggeraxis", str2); 
    if (str3 != null)
      paramP.put("staggerindex", str3); 
    if (str4 != null)
      paramP.put("backgroundcolor", str4); 
    this.mapTileWidth = k;
    this.mapTileHeight = m;
    this.mapWidthInPixels = i * k;
    this.mapHeightInPixels = j * m;
    if (str1 != null && "staggered".equals(str1) && j > 1) {
      this.mapWidthInPixels += k / 2;
      this.mapHeightInPixels = this.mapHeightInPixels / 2 + m / 2;
    } 
    paramP = (P)this.root.getChildByName("properties");
    if (paramP != null)
      loadProperties(this.map.getProperties(), paramP); 
    paramP = (P)this.root.getChildrenByName("tileset").iterator();
    while (paramP.hasNext()) {
      XmlReader.Element element = (XmlReader.Element)paramP.next();
      loadTileSet(element, paramFileHandle, paramImageResolver);
      this.root.removeChild(element);
    } 
    j = this.root.getChildCount();
    for (k = 0; k < j; k++) {
      paramP = (P)this.root.getChild(k);
      TiledMap tiledMap = this.map;
      loadLayer(tiledMap, tiledMap.getLayers(), paramP, paramFileHandle, paramImageResolver);
    } 
    return this.map;
  }
  
  public static class Parameters extends AssetLoaderParameters<TiledMap> {
    public boolean convertObjectToTileSpace = false;
    
    public boolean flipY = true;
    
    public boolean generateMipMaps = false;
    
    public Texture.TextureFilter textureMagFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureFilter textureMinFilter = Texture.TextureFilter.Nearest;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/BaseTmxMapLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */