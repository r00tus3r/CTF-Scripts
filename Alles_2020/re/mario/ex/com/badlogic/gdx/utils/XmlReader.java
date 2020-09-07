package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Iterator;

public class XmlReader {
  private static final byte[] _xml_actions = init__xml_actions_0();
  
  private static final short[] _xml_index_offsets;
  
  private static final byte[] _xml_indicies;
  
  private static final byte[] _xml_key_offsets = init__xml_key_offsets_0();
  
  private static final byte[] _xml_range_lengths;
  
  private static final byte[] _xml_single_lengths;
  
  private static final byte[] _xml_trans_actions;
  
  private static final char[] _xml_trans_keys = init__xml_trans_keys_0();
  
  private static final byte[] _xml_trans_targs;
  
  static final int xml_en_elementBody = 15;
  
  static final int xml_en_main = 1;
  
  static final int xml_error = 0;
  
  static final int xml_first_final = 34;
  
  static final int xml_start = 1;
  
  private Element current;
  
  private final Array<Element> elements = new Array(8);
  
  private Element root;
  
  private final StringBuilder textBuffer = new StringBuilder(64);
  
  static  {
    _xml_single_lengths = init__xml_single_lengths_0();
    _xml_range_lengths = init__xml_range_lengths_0();
    _xml_index_offsets = init__xml_index_offsets_0();
    _xml_indicies = init__xml_indicies_0();
    _xml_trans_targs = init__xml_trans_targs_0();
    _xml_trans_actions = init__xml_trans_actions_0();
  }
  
  private static byte[] init__xml_actions_0() { return new byte[] { 
        0, 1, 0, 1, 1, 1, 2, 1, 3, 1, 
        4, 1, 5, 1, 6, 1, 7, 2, 0, 6, 
        2, 1, 4, 2, 2, 4 }; }
  
  private static short[] init__xml_index_offsets_0() { return new short[] { 
        0, 0, 4, 9, 14, 20, 26, 30, 35, 37, 
        39, 44, 48, 52, 54, 56, 60, 62, 67, 72, 
        78, 84, 88, 93, 95, 97, 102, 106, 110, 112, 
        116, 118, 120, 122, 124, 127 }; }
  
  private static byte[] init__xml_indicies_0() { return new byte[] { 
        0, 2, 0, 1, 2, 1, 1, 2, 3, 5, 
        6, 7, 5, 4, 9, 10, 1, 11, 9, 8, 
        13, 1, 14, 1, 13, 12, 15, 16, 15, 1, 
        16, 17, 18, 16, 1, 20, 19, 22, 21, 9, 
        10, 11, 9, 1, 23, 24, 23, 1, 25, 11, 
        25, 1, 20, 26, 22, 27, 29, 30, 29, 28, 
        32, 31, 30, 34, 1, 30, 33, 36, 37, 38, 
        36, 35, 40, 41, 1, 42, 40, 39, 44, 1, 
        45, 1, 44, 43, 46, 47, 46, 1, 47, 48, 
        49, 47, 1, 51, 50, 53, 52, 40, 41, 42, 
        40, 1, 54, 55, 54, 1, 56, 42, 56, 1, 
        57, 1, 57, 34, 57, 1, 1, 58, 59, 58, 
        51, 60, 53, 61, 62, 62, 1, 1, 0 }; }
  
  private static byte[] init__xml_key_offsets_0() { return new byte[] { 
        0, 0, 4, 9, 14, 20, 26, 30, 35, 36, 
        37, 42, 46, 50, 51, 52, 56, 57, 62, 67, 
        73, 79, 83, 88, 89, 90, 95, 99, 103, 104, 
        108, 109, 110, 111, 112, 115 }; }
  
  private static byte[] init__xml_range_lengths_0() { return new byte[] { 
        0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 
        1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 
        1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 
        0, 0, 0, 0, 1, 0 }; }
  
  private static byte[] init__xml_single_lengths_0() { return new byte[] { 
        0, 2, 3, 3, 4, 4, 2, 3, 1, 1, 
        3, 2, 2, 1, 1, 2, 1, 3, 3, 4, 
        4, 2, 3, 1, 1, 3, 2, 2, 1, 2, 
        1, 1, 1, 1, 1, 0 }; }
  
  private static byte[] init__xml_trans_actions_0() { return new byte[] { 
        0, 0, 0, 1, 0, 3, 3, 20, 1, 0, 
        0, 9, 0, 11, 11, 0, 0, 0, 0, 1, 
        17, 0, 13, 5, 23, 0, 1, 0, 1, 0, 
        0, 0, 15, 1, 0, 0, 3, 3, 20, 1, 
        0, 0, 9, 0, 11, 11, 0, 0, 0, 0, 
        1, 17, 0, 13, 5, 23, 0, 0, 0, 7, 
        1, 0, 0 }; }
  
  private static char[] init__xml_trans_keys_0() { return new char[] { 
        ' ', '<', '\t', '\r', ' ', '/', '>', '\t', '\r', ' ', 
        '/', '>', '\t', '\r', ' ', '/', '=', '>', '\t', '\r', 
        ' ', '/', '=', '>', '\t', '\r', ' ', '=', '\t', '\r', 
        ' ', '"', '\'', '\t', '\r', '"', '"', ' ', '/', '>', 
        '\t', '\r', ' ', '>', '\t', '\r', ' ', '>', '\t', '\r', 
        '\'', '\'', ' ', '<', '\t', '\r', '<', ' ', '/', '>', 
        '\t', '\r', ' ', '/', '>', '\t', '\r', ' ', '/', '=', 
        '>', '\t', '\r', ' ', '/', '=', '>', '\t', '\r', ' ', 
        '=', '\t', '\r', ' ', '"', '\'', '\t', '\r', '"', '"', 
        ' ', '/', '>', '\t', '\r', ' ', '>', '\t', '\r', ' ', 
        '>', '\t', '\r', '<', ' ', '/', '\t', '\r', '>', '>', 
        '\'', '\'', ' ', '\t', '\r', Character.MIN_VALUE }; }
  
  private static byte[] init__xml_trans_targs_0() { return new byte[] { 
        1, 0, 2, 3, 3, 4, 11, 34, 5, 4, 
        11, 34, 5, 6, 7, 6, 7, 8, 13, 9, 
        10, 9, 10, 12, 34, 12, 14, 14, 16, 15, 
        17, 16, 17, 18, 30, 18, 19, 26, 28, 20, 
        19, 26, 28, 20, 21, 22, 21, 22, 23, 32, 
        24, 25, 24, 25, 27, 28, 27, 29, 31, 35, 
        33, 33, 34 }; }
  
  protected void attribute(String paramString1, String paramString2) { this.current.setAttribute(paramString1, paramString2); }
  
  protected void close() {
    Object object;
    this.root = (Element)this.elements.pop();
    if (this.elements.size > 0) {
      object = (Element)this.elements.peek();
    } else {
      object = null;
    } 
    this.current = object;
  }
  
  protected String entity(String paramString) { return paramString.equals("lt") ? "<" : (paramString.equals("gt") ? ">" : (paramString.equals("amp") ? "&" : (paramString.equals("apos") ? "'" : (paramString.equals("quot") ? "\"" : (paramString.startsWith("#x") ? Character.toString((char)Integer.parseInt(paramString.substring(2), 16)) : null))))); }
  
  protected void open(String paramString) {
    Element element1 = new Element(paramString, this.current);
    Element element2 = this.current;
    if (element2 != null)
      element2.addChild(element1); 
    this.elements.add(element1);
    this.current = element1;
  }
  
  public Element parse(FileHandle paramFileHandle) {
    try {
      return parse(paramFileHandle.reader("UTF-8"));
    } catch (Exception exception) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error parsing file: ");
      stringBuilder.append(paramFileHandle);
      throw new SerializationException(stringBuilder.toString(), exception);
    } 
  }
  
  public Element parse(InputStream paramInputStream) {
    InputStream inputStream;
    try {
      InputStreamReader inputStreamReader = new InputStreamReader();
      this(paramInputStream, "UTF-8");
      inputStream = parse(inputStreamReader);
      StreamUtils.closeQuietly(paramInputStream);
      return inputStream;
    } catch (IOException null) {
      SerializationException serializationException = new SerializationException();
      this(inputStream);
      throw serializationException;
    } finally {}
    StreamUtils.closeQuietly(paramInputStream);
    throw inputStream;
  }
  
  public Element parse(Reader paramReader) {
    InputStream inputStream;
    try {
      inputStream = new char[1024];
      for (int i = 0;; i += j) {
        Element element;
        int j = paramReader.read(inputStream, i, inputStream.length - i);
        if (j == -1) {
          element = parse(inputStream, 0, i);
          StreamUtils.closeQuietly(paramReader);
          return element;
        } 
        if (j == 0) {
          char[] arrayOfChar2 = new char[element.length * 2];
          System.arraycopy(element, 0, arrayOfChar2, 0, element.length);
          char[] arrayOfChar1 = arrayOfChar2;
          continue;
        } 
      } 
    } catch (IOException null) {
      SerializationException serializationException = new SerializationException();
      this(inputStream);
      throw serializationException;
    } finally {}
    StreamUtils.closeQuietly(paramReader);
    throw inputStream;
  }
  
  public Element parse(String paramString) {
    char[] arrayOfChar = paramString.toCharArray();
    return parse(arrayOfChar, 0, arrayOfChar.length);
  }
  
  public Element parse(char[] paramArrayOfChar, int paramInt1, int paramInt2) { // Byte code:
    //   0: iload_2
    //   1: istore #4
    //   3: iconst_0
    //   4: istore #5
    //   6: iconst_1
    //   7: istore #6
    //   9: aconst_null
    //   10: astore #7
    //   12: iconst_0
    //   13: istore_2
    //   14: iconst_1
    //   15: istore #8
    //   17: iconst_2
    //   18: istore #9
    //   20: iconst_0
    //   21: istore #10
    //   23: iload #5
    //   25: ifeq -> 59
    //   28: iload #5
    //   30: iload #8
    //   32: if_icmpeq -> 79
    //   35: iload #5
    //   37: iload #9
    //   39: if_icmpeq -> 45
    //   42: goto -> 1307
    //   45: iload #10
    //   47: istore #11
    //   49: iload_2
    //   50: istore #12
    //   52: aload #7
    //   54: astore #13
    //   56: goto -> 1240
    //   59: iload #4
    //   61: iload_3
    //   62: if_icmpne -> 71
    //   65: iconst_4
    //   66: istore #5
    //   68: goto -> 23
    //   71: iload #6
    //   73: ifne -> 79
    //   76: goto -> 1262
    //   79: getstatic com/badlogic/gdx/utils/XmlReader._xml_key_offsets : [B
    //   82: iload #6
    //   84: baload
    //   85: istore #5
    //   87: getstatic com/badlogic/gdx/utils/XmlReader._xml_index_offsets : [S
    //   90: iload #6
    //   92: saload
    //   93: istore #14
    //   95: getstatic com/badlogic/gdx/utils/XmlReader._xml_single_lengths : [B
    //   98: iload #6
    //   100: baload
    //   101: istore #15
    //   103: iload #15
    //   105: ifle -> 222
    //   108: iload #5
    //   110: iload #15
    //   112: iadd
    //   113: istore #16
    //   115: iload #5
    //   117: istore #11
    //   119: iload #16
    //   121: iconst_1
    //   122: isub
    //   123: istore #12
    //   125: iload #12
    //   127: iload #11
    //   129: if_icmpge -> 146
    //   132: iload #14
    //   134: iload #15
    //   136: iadd
    //   137: istore #5
    //   139: iload #16
    //   141: istore #12
    //   143: goto -> 230
    //   146: iload #11
    //   148: iload #12
    //   150: iload #11
    //   152: isub
    //   153: iconst_1
    //   154: ishr
    //   155: iadd
    //   156: istore #17
    //   158: aload_1
    //   159: iload #4
    //   161: caload
    //   162: istore #18
    //   164: getstatic com/badlogic/gdx/utils/XmlReader._xml_trans_keys : [C
    //   167: astore #13
    //   169: iload #18
    //   171: aload #13
    //   173: iload #17
    //   175: caload
    //   176: if_icmpge -> 188
    //   179: iload #17
    //   181: iconst_1
    //   182: isub
    //   183: istore #12
    //   185: goto -> 125
    //   188: aload_1
    //   189: iload #4
    //   191: caload
    //   192: aload #13
    //   194: iload #17
    //   196: caload
    //   197: if_icmple -> 209
    //   200: iload #17
    //   202: iconst_1
    //   203: iadd
    //   204: istore #11
    //   206: goto -> 125
    //   209: iload #14
    //   211: iload #17
    //   213: iload #5
    //   215: isub
    //   216: iadd
    //   217: istore #6
    //   219: goto -> 365
    //   222: iload #5
    //   224: istore #12
    //   226: iload #14
    //   228: istore #5
    //   230: getstatic com/badlogic/gdx/utils/XmlReader._xml_range_lengths : [B
    //   233: iload #6
    //   235: baload
    //   236: istore #11
    //   238: iload #5
    //   240: istore #6
    //   242: iload #11
    //   244: ifle -> 365
    //   247: iload #12
    //   249: iload #11
    //   251: iconst_1
    //   252: ishl
    //   253: iadd
    //   254: iload #9
    //   256: isub
    //   257: istore #9
    //   259: iload #12
    //   261: istore #6
    //   263: iload #9
    //   265: iload #6
    //   267: if_icmpge -> 284
    //   270: iload #11
    //   272: istore #6
    //   274: iload #5
    //   276: iload #6
    //   278: iadd
    //   279: istore #6
    //   281: goto -> 365
    //   284: iload #9
    //   286: iload #6
    //   288: isub
    //   289: iload #8
    //   291: ishr
    //   292: bipush #-2
    //   294: iand
    //   295: iload #6
    //   297: iadd
    //   298: istore #16
    //   300: aload_1
    //   301: iload #4
    //   303: caload
    //   304: istore #14
    //   306: getstatic com/badlogic/gdx/utils/XmlReader._xml_trans_keys : [C
    //   309: astore #13
    //   311: iload #14
    //   313: aload #13
    //   315: iload #16
    //   317: caload
    //   318: if_icmpge -> 330
    //   321: iload #16
    //   323: iconst_2
    //   324: isub
    //   325: istore #9
    //   327: goto -> 263
    //   330: aload_1
    //   331: iload #4
    //   333: caload
    //   334: aload #13
    //   336: iload #16
    //   338: iconst_1
    //   339: iadd
    //   340: caload
    //   341: if_icmple -> 353
    //   344: iload #16
    //   346: iconst_2
    //   347: iadd
    //   348: istore #6
    //   350: goto -> 327
    //   353: iload #16
    //   355: iload #12
    //   357: isub
    //   358: iconst_1
    //   359: ishr
    //   360: istore #6
    //   362: goto -> 274
    //   365: getstatic com/badlogic/gdx/utils/XmlReader._xml_indicies : [B
    //   368: iload #6
    //   370: baload
    //   371: istore #5
    //   373: getstatic com/badlogic/gdx/utils/XmlReader._xml_trans_targs : [B
    //   376: iload #5
    //   378: baload
    //   379: istore #16
    //   381: getstatic com/badlogic/gdx/utils/XmlReader._xml_trans_actions : [B
    //   384: astore #19
    //   386: iload #16
    //   388: istore #6
    //   390: aload #7
    //   392: astore #13
    //   394: iload_2
    //   395: istore #12
    //   397: iload #10
    //   399: istore #11
    //   401: aload #19
    //   403: iload #5
    //   405: baload
    //   406: ifeq -> 56
    //   409: aload #19
    //   411: iload #5
    //   413: baload
    //   414: istore #6
    //   416: getstatic com/badlogic/gdx/utils/XmlReader._xml_actions : [B
    //   419: astore #13
    //   421: iload #6
    //   423: iconst_1
    //   424: iadd
    //   425: istore #8
    //   427: aload #13
    //   429: iload #6
    //   431: baload
    //   432: istore #9
    //   434: iload #16
    //   436: istore #6
    //   438: aload #7
    //   440: astore #13
    //   442: iload_2
    //   443: istore #12
    //   445: iload #10
    //   447: istore #11
    //   449: iload #9
    //   451: ifle -> 56
    //   454: getstatic com/badlogic/gdx/utils/XmlReader._xml_actions : [B
    //   457: iload #8
    //   459: baload
    //   460: tableswitch default -> 508, 0 -> 1228, 1 -> 914, 2 -> 900, 3 -> 874, 4 -> 856, 5 -> 828, 6 -> 799, 7 -> 511
    //   508: goto -> 1231
    //   511: iload #4
    //   513: istore #12
    //   515: iload #12
    //   517: iload_2
    //   518: if_icmpeq -> 566
    //   521: aload_1
    //   522: iload #12
    //   524: iconst_1
    //   525: isub
    //   526: caload
    //   527: istore #6
    //   529: iload #6
    //   531: bipush #9
    //   533: if_icmpeq -> 560
    //   536: iload #6
    //   538: bipush #10
    //   540: if_icmpeq -> 560
    //   543: iload #6
    //   545: bipush #13
    //   547: if_icmpeq -> 560
    //   550: iload #6
    //   552: bipush #32
    //   554: if_icmpeq -> 560
    //   557: goto -> 566
    //   560: iinc #12, -1
    //   563: goto -> 515
    //   566: iload_2
    //   567: istore #6
    //   569: iconst_0
    //   570: istore #11
    //   572: iload_2
    //   573: istore #5
    //   575: iload #6
    //   577: istore_2
    //   578: iload #11
    //   580: istore #6
    //   582: iload #5
    //   584: iload #12
    //   586: if_icmpeq -> 725
    //   589: iload #5
    //   591: iconst_1
    //   592: iadd
    //   593: istore #11
    //   595: aload_1
    //   596: iload #5
    //   598: caload
    //   599: bipush #38
    //   601: if_icmpeq -> 611
    //   604: iload #11
    //   606: istore #5
    //   608: goto -> 582
    //   611: iload #11
    //   613: istore #5
    //   615: iload #5
    //   617: iload #12
    //   619: if_icmpeq -> 722
    //   622: iload #5
    //   624: iconst_1
    //   625: iadd
    //   626: istore #14
    //   628: aload_1
    //   629: iload #5
    //   631: caload
    //   632: bipush #59
    //   634: if_icmpeq -> 644
    //   637: iload #14
    //   639: istore #5
    //   641: goto -> 615
    //   644: aload_0
    //   645: getfield textBuffer : Lcom/badlogic/gdx/utils/StringBuilder;
    //   648: aload_1
    //   649: iload_2
    //   650: iload #11
    //   652: iload_2
    //   653: isub
    //   654: iconst_1
    //   655: isub
    //   656: invokevirtual append : ([CII)Lcom/badlogic/gdx/utils/StringBuilder;
    //   659: pop
    //   660: new java/lang/String
    //   663: dup
    //   664: aload_1
    //   665: iload #11
    //   667: iload #14
    //   669: iload #11
    //   671: isub
    //   672: iconst_1
    //   673: isub
    //   674: invokespecial <init> : ([CII)V
    //   677: astore #13
    //   679: aload_0
    //   680: aload #13
    //   682: invokevirtual entity : (Ljava/lang/String;)Ljava/lang/String;
    //   685: astore #19
    //   687: aload_0
    //   688: getfield textBuffer : Lcom/badlogic/gdx/utils/StringBuilder;
    //   691: astore #20
    //   693: aload #19
    //   695: ifnull -> 702
    //   698: aload #19
    //   700: astore #13
    //   702: aload #20
    //   704: aload #13
    //   706: invokevirtual append : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    //   709: pop
    //   710: iload #14
    //   712: istore_2
    //   713: iload_2
    //   714: istore #5
    //   716: iconst_1
    //   717: istore #6
    //   719: goto -> 722
    //   722: goto -> 608
    //   725: iload #6
    //   727: ifeq -> 772
    //   730: iload_2
    //   731: iload #12
    //   733: if_icmpge -> 750
    //   736: aload_0
    //   737: getfield textBuffer : Lcom/badlogic/gdx/utils/StringBuilder;
    //   740: aload_1
    //   741: iload_2
    //   742: iload #12
    //   744: iload_2
    //   745: isub
    //   746: invokevirtual append : ([CII)Lcom/badlogic/gdx/utils/StringBuilder;
    //   749: pop
    //   750: aload_0
    //   751: aload_0
    //   752: getfield textBuffer : Lcom/badlogic/gdx/utils/StringBuilder;
    //   755: invokevirtual toString : ()Ljava/lang/String;
    //   758: invokevirtual text : (Ljava/lang/String;)V
    //   761: aload_0
    //   762: getfield textBuffer : Lcom/badlogic/gdx/utils/StringBuilder;
    //   765: iconst_0
    //   766: invokevirtual setLength : (I)V
    //   769: goto -> 789
    //   772: aload_0
    //   773: new java/lang/String
    //   776: dup
    //   777: aload_1
    //   778: iload_2
    //   779: iload #12
    //   781: iload_2
    //   782: isub
    //   783: invokespecial <init> : ([CII)V
    //   786: invokevirtual text : (Ljava/lang/String;)V
    //   789: aload #7
    //   791: astore #13
    //   793: iload_2
    //   794: istore #6
    //   796: goto -> 846
    //   799: aload_0
    //   800: aload #7
    //   802: new java/lang/String
    //   805: dup
    //   806: aload_1
    //   807: iload_2
    //   808: iload #4
    //   810: iload_2
    //   811: isub
    //   812: invokespecial <init> : ([CII)V
    //   815: invokevirtual attribute : (Ljava/lang/String;Ljava/lang/String;)V
    //   818: aload #7
    //   820: astore #13
    //   822: iload_2
    //   823: istore #6
    //   825: goto -> 846
    //   828: new java/lang/String
    //   831: dup
    //   832: aload_1
    //   833: iload_2
    //   834: iload #4
    //   836: iload_2
    //   837: isub
    //   838: invokespecial <init> : ([CII)V
    //   841: astore #13
    //   843: iload_2
    //   844: istore #6
    //   846: aload #13
    //   848: astore #7
    //   850: iload #6
    //   852: istore_2
    //   853: goto -> 1231
    //   856: aload #7
    //   858: astore #13
    //   860: iload_2
    //   861: istore #6
    //   863: iload #10
    //   865: ifeq -> 846
    //   868: iload_2
    //   869: istore #12
    //   871: goto -> 881
    //   874: aload_0
    //   875: invokevirtual close : ()V
    //   878: iload_2
    //   879: istore #12
    //   881: iconst_2
    //   882: istore #9
    //   884: iconst_1
    //   885: istore #8
    //   887: iconst_2
    //   888: istore #5
    //   890: bipush #15
    //   892: istore #6
    //   894: iload #12
    //   896: istore_2
    //   897: goto -> 23
    //   900: aload_0
    //   901: invokevirtual close : ()V
    //   904: iconst_2
    //   905: istore #5
    //   907: bipush #15
    //   909: istore #6
    //   911: goto -> 14
    //   914: aload_1
    //   915: iload_2
    //   916: caload
    //   917: istore #5
    //   919: iload #5
    //   921: bipush #63
    //   923: if_icmpeq -> 959
    //   926: iload #5
    //   928: bipush #33
    //   930: if_icmpne -> 936
    //   933: goto -> 959
    //   936: aload_0
    //   937: new java/lang/String
    //   940: dup
    //   941: aload_1
    //   942: iload_2
    //   943: iload #4
    //   945: iload_2
    //   946: isub
    //   947: invokespecial <init> : ([CII)V
    //   950: invokevirtual open : (Ljava/lang/String;)V
    //   953: iconst_1
    //   954: istore #10
    //   956: goto -> 1231
    //   959: iload_2
    //   960: iconst_1
    //   961: iadd
    //   962: istore #8
    //   964: aload_1
    //   965: iload #8
    //   967: caload
    //   968: bipush #91
    //   970: if_icmpne -> 1109
    //   973: aload_1
    //   974: iload_2
    //   975: iconst_2
    //   976: iadd
    //   977: caload
    //   978: bipush #67
    //   980: if_icmpne -> 1109
    //   983: aload_1
    //   984: iload_2
    //   985: iconst_3
    //   986: iadd
    //   987: caload
    //   988: bipush #68
    //   990: if_icmpne -> 1109
    //   993: aload_1
    //   994: iload_2
    //   995: iconst_4
    //   996: iadd
    //   997: caload
    //   998: bipush #65
    //   1000: if_icmpne -> 1109
    //   1003: aload_1
    //   1004: iload_2
    //   1005: iconst_5
    //   1006: iadd
    //   1007: caload
    //   1008: bipush #84
    //   1010: if_icmpne -> 1109
    //   1013: aload_1
    //   1014: iload_2
    //   1015: bipush #6
    //   1017: iadd
    //   1018: caload
    //   1019: bipush #65
    //   1021: if_icmpne -> 1109
    //   1024: aload_1
    //   1025: iload_2
    //   1026: bipush #7
    //   1028: iadd
    //   1029: caload
    //   1030: bipush #91
    //   1032: if_icmpne -> 1109
    //   1035: iload_2
    //   1036: bipush #8
    //   1038: iadd
    //   1039: istore #12
    //   1041: iload #12
    //   1043: iconst_2
    //   1044: iadd
    //   1045: istore_2
    //   1046: aload_1
    //   1047: iload_2
    //   1048: iconst_2
    //   1049: isub
    //   1050: caload
    //   1051: bipush #93
    //   1053: if_icmpne -> 1103
    //   1056: aload_1
    //   1057: iload_2
    //   1058: iconst_1
    //   1059: isub
    //   1060: caload
    //   1061: bipush #93
    //   1063: if_icmpne -> 1103
    //   1066: aload_1
    //   1067: iload_2
    //   1068: caload
    //   1069: bipush #62
    //   1071: if_icmpeq -> 1077
    //   1074: goto -> 1103
    //   1077: aload_0
    //   1078: new java/lang/String
    //   1081: dup
    //   1082: aload_1
    //   1083: iload #12
    //   1085: iload_2
    //   1086: iload #12
    //   1088: isub
    //   1089: iconst_2
    //   1090: isub
    //   1091: invokespecial <init> : ([CII)V
    //   1094: invokevirtual text : (Ljava/lang/String;)V
    //   1097: iload_2
    //   1098: istore #4
    //   1100: goto -> 881
    //   1103: iinc #2, 1
    //   1106: goto -> 1046
    //   1109: iload #4
    //   1111: istore #6
    //   1113: iload #5
    //   1115: bipush #33
    //   1117: if_icmpne -> 1206
    //   1120: iload #4
    //   1122: istore #6
    //   1124: aload_1
    //   1125: iload #8
    //   1127: caload
    //   1128: bipush #45
    //   1130: if_icmpne -> 1206
    //   1133: iload #4
    //   1135: istore #6
    //   1137: aload_1
    //   1138: iload_2
    //   1139: iconst_2
    //   1140: iadd
    //   1141: caload
    //   1142: bipush #45
    //   1144: if_icmpne -> 1206
    //   1147: iload_2
    //   1148: iconst_3
    //   1149: iadd
    //   1150: istore #4
    //   1152: aload_1
    //   1153: iload #4
    //   1155: caload
    //   1156: bipush #45
    //   1158: if_icmpne -> 1200
    //   1161: aload_1
    //   1162: iload #4
    //   1164: iconst_1
    //   1165: iadd
    //   1166: caload
    //   1167: bipush #45
    //   1169: if_icmpne -> 1200
    //   1172: iload #4
    //   1174: iconst_2
    //   1175: iadd
    //   1176: istore #6
    //   1178: aload_1
    //   1179: iload #6
    //   1181: caload
    //   1182: bipush #62
    //   1184: if_icmpeq -> 1190
    //   1187: goto -> 1200
    //   1190: iload #6
    //   1192: istore #4
    //   1194: iload_2
    //   1195: istore #12
    //   1197: goto -> 881
    //   1200: iinc #4, 1
    //   1203: goto -> 1152
    //   1206: iload #6
    //   1208: istore #4
    //   1210: iload_2
    //   1211: istore #12
    //   1213: aload_1
    //   1214: iload #6
    //   1216: caload
    //   1217: bipush #62
    //   1219: if_icmpeq -> 881
    //   1222: iinc #6, 1
    //   1225: goto -> 1206
    //   1228: iload #4
    //   1230: istore_2
    //   1231: iinc #9, -1
    //   1234: iinc #8, 1
    //   1237: goto -> 434
    //   1240: iload #6
    //   1242: ifne -> 1268
    //   1245: iconst_2
    //   1246: istore #9
    //   1248: iconst_1
    //   1249: istore #8
    //   1251: iload #11
    //   1253: istore #10
    //   1255: iload #12
    //   1257: istore_2
    //   1258: aload #13
    //   1260: astore #7
    //   1262: iconst_5
    //   1263: istore #5
    //   1265: goto -> 23
    //   1268: iload #4
    //   1270: iconst_1
    //   1271: iadd
    //   1272: istore_2
    //   1273: iload_2
    //   1274: istore #4
    //   1276: iload_2
    //   1277: iload_3
    //   1278: if_icmpeq -> 1307
    //   1281: iconst_2
    //   1282: istore #9
    //   1284: iconst_1
    //   1285: istore #8
    //   1287: iconst_1
    //   1288: istore #5
    //   1290: iload_2
    //   1291: istore #4
    //   1293: aload #13
    //   1295: astore #7
    //   1297: iload #12
    //   1299: istore_2
    //   1300: iload #11
    //   1302: istore #10
    //   1304: goto -> 23
    //   1307: iconst_0
    //   1308: istore_2
    //   1309: iload #4
    //   1311: iload_3
    //   1312: if_icmpge -> 1425
    //   1315: iconst_1
    //   1316: istore #5
    //   1318: iload_2
    //   1319: iload #4
    //   1321: if_icmpge -> 1352
    //   1324: iload #5
    //   1326: istore #6
    //   1328: aload_1
    //   1329: iload_2
    //   1330: caload
    //   1331: bipush #10
    //   1333: if_icmpne -> 1342
    //   1336: iload #5
    //   1338: iconst_1
    //   1339: iadd
    //   1340: istore #6
    //   1342: iinc #2, 1
    //   1345: iload #6
    //   1347: istore #5
    //   1349: goto -> 1318
    //   1352: new java/lang/StringBuilder
    //   1355: dup
    //   1356: invokespecial <init> : ()V
    //   1359: astore #7
    //   1361: aload #7
    //   1363: ldc_w 'Error parsing XML on line '
    //   1366: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1369: pop
    //   1370: aload #7
    //   1372: iload #5
    //   1374: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   1377: pop
    //   1378: aload #7
    //   1380: ldc_w ' near: '
    //   1383: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1386: pop
    //   1387: aload #7
    //   1389: new java/lang/String
    //   1392: dup
    //   1393: aload_1
    //   1394: iload #4
    //   1396: bipush #32
    //   1398: iload_3
    //   1399: iload #4
    //   1401: isub
    //   1402: invokestatic min : (II)I
    //   1405: invokespecial <init> : ([CII)V
    //   1408: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1411: pop
    //   1412: new com/badlogic/gdx/utils/SerializationException
    //   1415: dup
    //   1416: aload #7
    //   1418: invokevirtual toString : ()Ljava/lang/String;
    //   1421: invokespecial <init> : (Ljava/lang/String;)V
    //   1424: athrow
    //   1425: aload_0
    //   1426: getfield elements : Lcom/badlogic/gdx/utils/Array;
    //   1429: getfield size : I
    //   1432: ifne -> 1447
    //   1435: aload_0
    //   1436: getfield root : Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   1439: astore_1
    //   1440: aload_0
    //   1441: aconst_null
    //   1442: putfield root : Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   1445: aload_1
    //   1446: areturn
    //   1447: aload_0
    //   1448: getfield elements : Lcom/badlogic/gdx/utils/Array;
    //   1451: invokevirtual peek : ()Ljava/lang/Object;
    //   1454: checkcast com/badlogic/gdx/utils/XmlReader$Element
    //   1457: astore #7
    //   1459: aload_0
    //   1460: getfield elements : Lcom/badlogic/gdx/utils/Array;
    //   1463: invokevirtual clear : ()V
    //   1466: new java/lang/StringBuilder
    //   1469: dup
    //   1470: invokespecial <init> : ()V
    //   1473: astore_1
    //   1474: aload_1
    //   1475: ldc_w 'Error parsing XML, unclosed element: '
    //   1478: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1481: pop
    //   1482: aload_1
    //   1483: aload #7
    //   1485: invokevirtual getName : ()Ljava/lang/String;
    //   1488: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1491: pop
    //   1492: new com/badlogic/gdx/utils/SerializationException
    //   1495: dup
    //   1496: aload_1
    //   1497: invokevirtual toString : ()Ljava/lang/String;
    //   1500: invokespecial <init> : (Ljava/lang/String;)V
    //   1503: astore_1
    //   1504: goto -> 1509
    //   1507: aload_1
    //   1508: athrow
    //   1509: goto -> 1507 }
  
  protected void text(String paramString) {
    String str1 = this.current.getText();
    Element element = this.current;
    String str2 = paramString;
    if (str1 != null) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(str1);
      stringBuilder.append(paramString);
      str2 = stringBuilder.toString();
    } 
    element.setText(str2);
  }
  
  public static class Element {
    private ObjectMap<String, String> attributes;
    
    private Array<Element> children;
    
    private final String name;
    
    private Element parent;
    
    private String text;
    
    public Element(String param1String, Element param1Element) {
      this.name = param1String;
      this.parent = param1Element;
    }
    
    private void getChildrenByNameRecursively(String param1String, Array<Element> param1Array) {
      if (this.children == null)
        return; 
      for (byte b = 0; b < this.children.size; b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          param1Array.add(element); 
        element.getChildrenByNameRecursively(param1String, param1Array);
      } 
    }
    
    public void addChild(Element param1Element) {
      if (this.children == null)
        this.children = new Array(8); 
      this.children.add(param1Element);
    }
    
    public String get(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return str; 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public String get(String param1String1, String param1String2) {
      ObjectMap objectMap = this.attributes;
      if (objectMap != null) {
        String str1 = (String)objectMap.get(param1String1);
        if (str1 != null)
          return str1; 
      } 
      Element element = getChildByName(param1String1);
      if (element == null)
        return param1String2; 
      String str = element.getText();
      return (str == null) ? param1String2 : str;
    }
    
    public String getAttribute(String param1String) {
      ObjectMap objectMap = this.attributes;
      if (objectMap != null) {
        String str = (String)objectMap.get(param1String);
        if (str != null)
          return str; 
        java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
        stringBuilder1.append("Element ");
        stringBuilder1.append(this.name);
        stringBuilder1.append(" doesn't have attribute: ");
        stringBuilder1.append(param1String);
        throw new GdxRuntimeException(stringBuilder1.toString());
      } 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute: ");
      stringBuilder.append(param1String);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public String getAttribute(String param1String1, String param1String2) {
      ObjectMap objectMap = this.attributes;
      if (objectMap == null)
        return param1String2; 
      param1String1 = (String)objectMap.get(param1String1);
      return (param1String1 == null) ? param1String2 : param1String1;
    }
    
    public ObjectMap<String, String> getAttributes() { return this.attributes; }
    
    public boolean getBoolean(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return Boolean.parseBoolean(str); 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public boolean getBoolean(String param1String, boolean param1Boolean) {
      param1String = get(param1String, null);
      return (param1String == null) ? param1Boolean : Boolean.parseBoolean(param1String);
    }
    
    public boolean getBooleanAttribute(String param1String) { return Boolean.parseBoolean(getAttribute(param1String)); }
    
    public boolean getBooleanAttribute(String param1String, boolean param1Boolean) {
      param1String = getAttribute(param1String, null);
      return (param1String == null) ? param1Boolean : Boolean.parseBoolean(param1String);
    }
    
    public Element getChild(int param1Int) {
      Array array = this.children;
      if (array != null)
        return (Element)array.get(param1Int); 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Element has no children: ");
      stringBuilder.append(this.name);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public Element getChildByName(String param1String) {
      if (this.children == null)
        return null; 
      for (byte b = 0; b < this.children.size; b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          return element; 
      } 
      return null;
    }
    
    public Element getChildByNameRecursive(String param1String) {
      if (this.children == null)
        return null; 
      for (byte b = 0; b < this.children.size; b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          return element; 
        element = element.getChildByNameRecursive(param1String);
        if (element != null)
          return element; 
      } 
      return null;
    }
    
    public int getChildCount() {
      Array array = this.children;
      return (array == null) ? 0 : array.size;
    }
    
    public Array<Element> getChildrenByName(String param1String) {
      Array array = new Array();
      if (this.children == null)
        return array; 
      for (byte b = 0; b < this.children.size; b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          array.add(element); 
      } 
      return array;
    }
    
    public Array<Element> getChildrenByNameRecursively(String param1String) {
      Array array = new Array();
      getChildrenByNameRecursively(param1String, array);
      return array;
    }
    
    public float getFloat(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return Float.parseFloat(str); 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public float getFloat(String param1String, float param1Float) {
      param1String = get(param1String, null);
      return (param1String == null) ? param1Float : Float.parseFloat(param1String);
    }
    
    public float getFloatAttribute(String param1String) { return Float.parseFloat(getAttribute(param1String)); }
    
    public float getFloatAttribute(String param1String, float param1Float) {
      param1String = getAttribute(param1String, null);
      return (param1String == null) ? param1Float : Float.parseFloat(param1String);
    }
    
    public int getInt(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return Integer.parseInt(str); 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public int getInt(String param1String, int param1Int) {
      param1String = get(param1String, null);
      return (param1String == null) ? param1Int : Integer.parseInt(param1String);
    }
    
    public int getIntAttribute(String param1String) { return Integer.parseInt(getAttribute(param1String)); }
    
    public int getIntAttribute(String param1String, int param1Int) {
      param1String = getAttribute(param1String, null);
      return (param1String == null) ? param1Int : Integer.parseInt(param1String);
    }
    
    public String getName() { return this.name; }
    
    public Element getParent() { return this.parent; }
    
    public String getText() { return this.text; }
    
    public boolean hasAttribute(String param1String) {
      ObjectMap objectMap = this.attributes;
      return (objectMap == null) ? false : objectMap.containsKey(param1String);
    }
    
    public boolean hasChild(String param1String) {
      Array array = this.children;
      boolean bool = false;
      if (array == null)
        return false; 
      if (getChildByName(param1String) != null)
        bool = true; 
      return bool;
    }
    
    public boolean hasChildRecursive(String param1String) {
      Array array = this.children;
      boolean bool = false;
      if (array == null)
        return false; 
      if (getChildByNameRecursive(param1String) != null)
        bool = true; 
      return bool;
    }
    
    public void remove() { this.parent.removeChild(this); }
    
    public void removeChild(int param1Int) {
      Array array = this.children;
      if (array != null)
        array.removeIndex(param1Int); 
    }
    
    public void removeChild(Element param1Element) {
      Array array = this.children;
      if (array != null)
        array.removeValue(param1Element, true); 
    }
    
    public void setAttribute(String param1String1, String param1String2) {
      if (this.attributes == null)
        this.attributes = new ObjectMap(8); 
      this.attributes.put(param1String1, param1String2);
    }
    
    public void setText(String param1String) { this.text = param1String; }
    
    public String toString() { return toString(""); }
    
    public String toString(String param1String) {
      StringBuilder stringBuilder = new StringBuilder('');
      stringBuilder.append(param1String);
      stringBuilder.append('<');
      stringBuilder.append(this.name);
      ObjectMap objectMap = this.attributes;
      if (objectMap != null) {
        ObjectMap.Entries entries = objectMap.entries().iterator();
        while (entries.hasNext()) {
          ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
          stringBuilder.append(' ');
          stringBuilder.append((String)entry.key);
          stringBuilder.append("=\"");
          stringBuilder.append((String)entry.value);
          stringBuilder.append('"');
        } 
      } 
      if (this.children == null) {
        String str = this.text;
        if (str == null || str.length() == 0) {
          stringBuilder.append("/>");
          return stringBuilder.toString();
        } 
      } 
      stringBuilder.append(">\n");
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append(param1String);
      stringBuilder1.append('\t');
      String str1 = stringBuilder1.toString();
      String str2 = this.text;
      if (str2 != null && str2.length() > 0) {
        stringBuilder.append(str1);
        stringBuilder.append(this.text);
        stringBuilder.append('\n');
      } 
      Array array = this.children;
      if (array != null) {
        Iterator iterator = array.iterator();
        while (iterator.hasNext()) {
          stringBuilder.append(((Element)iterator.next()).toString(str1));
          stringBuilder.append('\n');
        } 
      } 
      stringBuilder.append(param1String);
      stringBuilder.append("</");
      stringBuilder.append(this.name);
      stringBuilder.append('>');
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/XmlReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */