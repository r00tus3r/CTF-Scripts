package com.brashmonkey.spriter;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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
  
  private final ArrayList<Element> elements = new ArrayList(8);
  
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
    ArrayList arrayList = this.elements;
    this.root = (Element)arrayList.get(arrayList.size() - 1);
    arrayList = this.elements;
    arrayList.remove(arrayList.size() - 1);
    if (this.elements.size() > 0) {
      arrayList = this.elements;
      Element element = (Element)arrayList.get(arrayList.size() - 1);
    } else {
      arrayList = null;
    } 
    this.current = arrayList;
  }
  
  protected String entity(String paramString) { return paramString.equals("lt") ? "<" : (paramString.equals("gt") ? ">" : (paramString.equals("amp") ? "&" : (paramString.equals("apos") ? "'" : (paramString.equals("quot") ? "\"" : null)))); }
  
  protected void open(String paramString) {
    Element element2 = new Element(paramString, this.current);
    Element element1 = this.current;
    if (element1 != null)
      element1.addChild(element2); 
    this.elements.add(element2);
    this.current = element2;
  }
  
  public Element parse(InputStream paramInputStream) throws IOException { return parse(new InputStreamReader(paramInputStream, "ISO-8859-1")); }
  
  public Element parse(Reader paramReader) throws IOException {
    char[] arrayOfChar = new char[1024];
    for (int i = 0;; i += j) {
      int j = paramReader.read(arrayOfChar, i, arrayOfChar.length - i);
      if (j == -1)
        return parse(arrayOfChar, 0, i); 
      if (j == 0) {
        char[] arrayOfChar1 = new char[arrayOfChar.length * 2];
        System.arraycopy(arrayOfChar, 0, arrayOfChar1, 0, arrayOfChar.length);
        arrayOfChar = arrayOfChar1;
        continue;
      } 
    } 
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
    //   25: ifeq -> 48
    //   28: iload #5
    //   30: iload #8
    //   32: if_icmpeq -> 68
    //   35: iload #5
    //   37: iload #9
    //   39: if_icmpeq -> 45
    //   42: goto -> 1207
    //   45: goto -> 1158
    //   48: iload #4
    //   50: iload_3
    //   51: if_icmpne -> 60
    //   54: iconst_4
    //   55: istore #5
    //   57: goto -> 23
    //   60: iload #6
    //   62: ifne -> 68
    //   65: goto -> 1169
    //   68: getstatic com/brashmonkey/spriter/XmlReader._xml_key_offsets : [B
    //   71: iload #6
    //   73: baload
    //   74: istore #5
    //   76: getstatic com/brashmonkey/spriter/XmlReader._xml_index_offsets : [S
    //   79: iload #6
    //   81: saload
    //   82: istore #11
    //   84: getstatic com/brashmonkey/spriter/XmlReader._xml_single_lengths : [B
    //   87: iload #6
    //   89: baload
    //   90: istore #12
    //   92: iload #12
    //   94: ifle -> 211
    //   97: iload #5
    //   99: iload #12
    //   101: iadd
    //   102: istore #13
    //   104: iload #5
    //   106: istore #14
    //   108: iload #13
    //   110: iconst_1
    //   111: isub
    //   112: istore #15
    //   114: iload #15
    //   116: iload #14
    //   118: if_icmpge -> 135
    //   121: iload #11
    //   123: iload #12
    //   125: iadd
    //   126: istore #5
    //   128: iload #13
    //   130: istore #15
    //   132: goto -> 219
    //   135: iload #14
    //   137: iload #15
    //   139: iload #14
    //   141: isub
    //   142: iconst_1
    //   143: ishr
    //   144: iadd
    //   145: istore #16
    //   147: aload_1
    //   148: iload #4
    //   150: caload
    //   151: istore #17
    //   153: getstatic com/brashmonkey/spriter/XmlReader._xml_trans_keys : [C
    //   156: astore #18
    //   158: iload #17
    //   160: aload #18
    //   162: iload #16
    //   164: caload
    //   165: if_icmpge -> 177
    //   168: iload #16
    //   170: iconst_1
    //   171: isub
    //   172: istore #15
    //   174: goto -> 114
    //   177: aload_1
    //   178: iload #4
    //   180: caload
    //   181: aload #18
    //   183: iload #16
    //   185: caload
    //   186: if_icmple -> 198
    //   189: iload #16
    //   191: iconst_1
    //   192: iadd
    //   193: istore #14
    //   195: goto -> 114
    //   198: iload #11
    //   200: iload #16
    //   202: iload #5
    //   204: isub
    //   205: iadd
    //   206: istore #6
    //   208: goto -> 354
    //   211: iload #5
    //   213: istore #15
    //   215: iload #11
    //   217: istore #5
    //   219: getstatic com/brashmonkey/spriter/XmlReader._xml_range_lengths : [B
    //   222: iload #6
    //   224: baload
    //   225: istore #14
    //   227: iload #5
    //   229: istore #6
    //   231: iload #14
    //   233: ifle -> 354
    //   236: iload #15
    //   238: iload #14
    //   240: iconst_1
    //   241: ishl
    //   242: iadd
    //   243: iload #9
    //   245: isub
    //   246: istore #9
    //   248: iload #15
    //   250: istore #6
    //   252: iload #9
    //   254: iload #6
    //   256: if_icmpge -> 273
    //   259: iload #14
    //   261: istore #8
    //   263: iload #5
    //   265: iload #8
    //   267: iadd
    //   268: istore #6
    //   270: goto -> 354
    //   273: iload #9
    //   275: iload #6
    //   277: isub
    //   278: iload #8
    //   280: ishr
    //   281: bipush #-2
    //   283: iand
    //   284: iload #6
    //   286: iadd
    //   287: istore #11
    //   289: aload_1
    //   290: iload #4
    //   292: caload
    //   293: istore #13
    //   295: getstatic com/brashmonkey/spriter/XmlReader._xml_trans_keys : [C
    //   298: astore #18
    //   300: iload #13
    //   302: aload #18
    //   304: iload #11
    //   306: caload
    //   307: if_icmpge -> 319
    //   310: iload #11
    //   312: iconst_2
    //   313: isub
    //   314: istore #9
    //   316: goto -> 252
    //   319: aload_1
    //   320: iload #4
    //   322: caload
    //   323: aload #18
    //   325: iload #11
    //   327: iconst_1
    //   328: iadd
    //   329: caload
    //   330: if_icmple -> 342
    //   333: iload #11
    //   335: iconst_2
    //   336: iadd
    //   337: istore #6
    //   339: goto -> 316
    //   342: iload #11
    //   344: iload #15
    //   346: isub
    //   347: iconst_1
    //   348: ishr
    //   349: istore #8
    //   351: goto -> 263
    //   354: getstatic com/brashmonkey/spriter/XmlReader._xml_indicies : [B
    //   357: iload #6
    //   359: baload
    //   360: istore #9
    //   362: getstatic com/brashmonkey/spriter/XmlReader._xml_trans_targs : [B
    //   365: iload #9
    //   367: baload
    //   368: istore #17
    //   370: getstatic com/brashmonkey/spriter/XmlReader._xml_trans_actions : [B
    //   373: astore #19
    //   375: aload #7
    //   377: astore #18
    //   379: iload_2
    //   380: istore #5
    //   382: iload #10
    //   384: istore #8
    //   386: aload #19
    //   388: iload #9
    //   390: baload
    //   391: ifeq -> 1143
    //   394: aload #19
    //   396: iload #9
    //   398: baload
    //   399: istore #5
    //   401: getstatic com/brashmonkey/spriter/XmlReader._xml_actions : [B
    //   404: astore #18
    //   406: iload #5
    //   408: iconst_1
    //   409: iadd
    //   410: istore #14
    //   412: aload #18
    //   414: iload #5
    //   416: baload
    //   417: istore #13
    //   419: aload #7
    //   421: astore #18
    //   423: iload_2
    //   424: istore #5
    //   426: iload #10
    //   428: istore #8
    //   430: iload #13
    //   432: ifle -> 1143
    //   435: getstatic com/brashmonkey/spriter/XmlReader._xml_actions : [B
    //   438: iload #14
    //   440: baload
    //   441: tableswitch default -> 488, 0 -> 1131, 1 -> 914, 2 -> 900, 3 -> 874, 4 -> 856, 5 -> 828, 6 -> 799, 7 -> 498
    //   488: aload #7
    //   490: astore #18
    //   492: iload_2
    //   493: istore #5
    //   495: goto -> 846
    //   498: iload #4
    //   500: istore #11
    //   502: iload #11
    //   504: iload_2
    //   505: if_icmpeq -> 553
    //   508: aload_1
    //   509: iload #11
    //   511: iconst_1
    //   512: isub
    //   513: caload
    //   514: istore #5
    //   516: iload #5
    //   518: bipush #9
    //   520: if_icmpeq -> 547
    //   523: iload #5
    //   525: bipush #10
    //   527: if_icmpeq -> 547
    //   530: iload #5
    //   532: bipush #13
    //   534: if_icmpeq -> 547
    //   537: iload #5
    //   539: bipush #32
    //   541: if_icmpeq -> 547
    //   544: goto -> 553
    //   547: iinc #11, -1
    //   550: goto -> 502
    //   553: iload_2
    //   554: istore #5
    //   556: iconst_0
    //   557: istore #9
    //   559: iload_2
    //   560: istore #8
    //   562: iload #5
    //   564: istore_2
    //   565: iload #9
    //   567: istore #5
    //   569: iload #8
    //   571: iload #11
    //   573: if_icmpeq -> 725
    //   576: iload #8
    //   578: iconst_1
    //   579: iadd
    //   580: istore #12
    //   582: aload_1
    //   583: iload #8
    //   585: caload
    //   586: bipush #38
    //   588: if_icmpeq -> 598
    //   591: iload #12
    //   593: istore #8
    //   595: goto -> 569
    //   598: iload #12
    //   600: istore #6
    //   602: iload #5
    //   604: istore #15
    //   606: iload_2
    //   607: istore #9
    //   609: iload #6
    //   611: istore #8
    //   613: iload #6
    //   615: iload #11
    //   617: if_icmpeq -> 715
    //   620: iload #6
    //   622: iconst_1
    //   623: iadd
    //   624: istore #9
    //   626: aload_1
    //   627: iload #6
    //   629: caload
    //   630: bipush #59
    //   632: if_icmpeq -> 642
    //   635: iload #9
    //   637: istore #6
    //   639: goto -> 602
    //   642: aload_0
    //   643: getfield textBuffer : Ljava/lang/StringBuilder;
    //   646: aload_1
    //   647: iload_2
    //   648: iload #12
    //   650: iload_2
    //   651: isub
    //   652: iconst_1
    //   653: isub
    //   654: invokevirtual append : ([CII)Ljava/lang/StringBuilder;
    //   657: pop
    //   658: new java/lang/String
    //   661: dup
    //   662: aload_1
    //   663: iload #12
    //   665: iload #9
    //   667: iload #12
    //   669: isub
    //   670: iconst_1
    //   671: isub
    //   672: invokespecial <init> : ([CII)V
    //   675: astore #18
    //   677: aload_0
    //   678: aload #18
    //   680: invokevirtual entity : (Ljava/lang/String;)Ljava/lang/String;
    //   683: astore #19
    //   685: aload_0
    //   686: getfield textBuffer : Ljava/lang/StringBuilder;
    //   689: astore #20
    //   691: aload #19
    //   693: ifnull -> 700
    //   696: aload #19
    //   698: astore #18
    //   700: aload #20
    //   702: aload #18
    //   704: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   707: pop
    //   708: iload #9
    //   710: istore #8
    //   712: iconst_1
    //   713: istore #15
    //   715: iload #15
    //   717: istore #5
    //   719: iload #9
    //   721: istore_2
    //   722: goto -> 595
    //   725: iload #5
    //   727: ifeq -> 772
    //   730: iload_2
    //   731: iload #11
    //   733: if_icmpge -> 750
    //   736: aload_0
    //   737: getfield textBuffer : Ljava/lang/StringBuilder;
    //   740: aload_1
    //   741: iload_2
    //   742: iload #11
    //   744: iload_2
    //   745: isub
    //   746: invokevirtual append : ([CII)Ljava/lang/StringBuilder;
    //   749: pop
    //   750: aload_0
    //   751: aload_0
    //   752: getfield textBuffer : Ljava/lang/StringBuilder;
    //   755: invokevirtual toString : ()Ljava/lang/String;
    //   758: invokevirtual text : (Ljava/lang/String;)V
    //   761: aload_0
    //   762: getfield textBuffer : Ljava/lang/StringBuilder;
    //   765: iconst_0
    //   766: invokevirtual setLength : (I)V
    //   769: goto -> 789
    //   772: aload_0
    //   773: new java/lang/String
    //   776: dup
    //   777: aload_1
    //   778: iload_2
    //   779: iload #11
    //   781: iload_2
    //   782: isub
    //   783: invokespecial <init> : ([CII)V
    //   786: invokevirtual text : (Ljava/lang/String;)V
    //   789: aload #7
    //   791: astore #18
    //   793: iload_2
    //   794: istore #5
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
    //   820: astore #18
    //   822: iload_2
    //   823: istore #5
    //   825: goto -> 846
    //   828: new java/lang/String
    //   831: dup
    //   832: aload_1
    //   833: iload_2
    //   834: iload #4
    //   836: iload_2
    //   837: isub
    //   838: invokespecial <init> : ([CII)V
    //   841: astore #18
    //   843: iload_2
    //   844: istore #5
    //   846: aload #18
    //   848: astore #7
    //   850: iload #5
    //   852: istore_2
    //   853: goto -> 1134
    //   856: aload #7
    //   858: astore #18
    //   860: iload_2
    //   861: istore #5
    //   863: iload #10
    //   865: ifeq -> 846
    //   868: iload_2
    //   869: istore #15
    //   871: goto -> 881
    //   874: aload_0
    //   875: invokevirtual close : ()V
    //   878: iload_2
    //   879: istore #15
    //   881: iconst_2
    //   882: istore #9
    //   884: iconst_1
    //   885: istore #8
    //   887: iconst_2
    //   888: istore #5
    //   890: bipush #15
    //   892: istore #6
    //   894: iload #15
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
    //   956: goto -> 1134
    //   959: aload_1
    //   960: iload_2
    //   961: iconst_1
    //   962: iadd
    //   963: caload
    //   964: bipush #91
    //   966: if_icmpne -> 1105
    //   969: aload_1
    //   970: iload_2
    //   971: iconst_2
    //   972: iadd
    //   973: caload
    //   974: bipush #67
    //   976: if_icmpne -> 1105
    //   979: aload_1
    //   980: iload_2
    //   981: iconst_3
    //   982: iadd
    //   983: caload
    //   984: bipush #68
    //   986: if_icmpne -> 1105
    //   989: aload_1
    //   990: iload_2
    //   991: iconst_4
    //   992: iadd
    //   993: caload
    //   994: bipush #65
    //   996: if_icmpne -> 1105
    //   999: aload_1
    //   1000: iload_2
    //   1001: iconst_5
    //   1002: iadd
    //   1003: caload
    //   1004: bipush #84
    //   1006: if_icmpne -> 1105
    //   1009: aload_1
    //   1010: iload_2
    //   1011: bipush #6
    //   1013: iadd
    //   1014: caload
    //   1015: bipush #65
    //   1017: if_icmpne -> 1105
    //   1020: aload_1
    //   1021: iload_2
    //   1022: bipush #7
    //   1024: iadd
    //   1025: caload
    //   1026: bipush #91
    //   1028: if_icmpne -> 1105
    //   1031: iload_2
    //   1032: bipush #8
    //   1034: iadd
    //   1035: istore #15
    //   1037: iload #15
    //   1039: iconst_2
    //   1040: iadd
    //   1041: istore_2
    //   1042: aload_1
    //   1043: iload_2
    //   1044: iconst_2
    //   1045: isub
    //   1046: caload
    //   1047: bipush #93
    //   1049: if_icmpne -> 1099
    //   1052: aload_1
    //   1053: iload_2
    //   1054: iconst_1
    //   1055: isub
    //   1056: caload
    //   1057: bipush #93
    //   1059: if_icmpne -> 1099
    //   1062: aload_1
    //   1063: iload_2
    //   1064: caload
    //   1065: bipush #62
    //   1067: if_icmpeq -> 1073
    //   1070: goto -> 1099
    //   1073: aload_0
    //   1074: new java/lang/String
    //   1077: dup
    //   1078: aload_1
    //   1079: iload #15
    //   1081: iload_2
    //   1082: iload #15
    //   1084: isub
    //   1085: iconst_2
    //   1086: isub
    //   1087: invokespecial <init> : ([CII)V
    //   1090: invokevirtual text : (Ljava/lang/String;)V
    //   1093: iload_2
    //   1094: istore #4
    //   1096: goto -> 881
    //   1099: iinc #2, 1
    //   1102: goto -> 1042
    //   1105: iload #4
    //   1107: istore #5
    //   1109: iload #5
    //   1111: istore #4
    //   1113: iload_2
    //   1114: istore #15
    //   1116: aload_1
    //   1117: iload #5
    //   1119: caload
    //   1120: bipush #62
    //   1122: if_icmpeq -> 881
    //   1125: iinc #5, 1
    //   1128: goto -> 1109
    //   1131: iload #4
    //   1133: istore_2
    //   1134: iinc #13, -1
    //   1137: iinc #14, 1
    //   1140: goto -> 419
    //   1143: iload #17
    //   1145: istore #6
    //   1147: iload #8
    //   1149: istore #10
    //   1151: iload #5
    //   1153: istore_2
    //   1154: aload #18
    //   1156: astore #7
    //   1158: iload #6
    //   1160: ifne -> 1175
    //   1163: iconst_2
    //   1164: istore #9
    //   1166: iconst_1
    //   1167: istore #8
    //   1169: iconst_5
    //   1170: istore #5
    //   1172: goto -> 23
    //   1175: iload #4
    //   1177: iconst_1
    //   1178: iadd
    //   1179: istore #15
    //   1181: iload #15
    //   1183: istore #4
    //   1185: iload #15
    //   1187: iload_3
    //   1188: if_icmpeq -> 1207
    //   1191: iconst_2
    //   1192: istore #9
    //   1194: iconst_1
    //   1195: istore #8
    //   1197: iconst_1
    //   1198: istore #5
    //   1200: iload #15
    //   1202: istore #4
    //   1204: goto -> 23
    //   1207: iconst_0
    //   1208: istore_2
    //   1209: iload #4
    //   1211: iload_3
    //   1212: if_icmpge -> 1325
    //   1215: iconst_1
    //   1216: istore #10
    //   1218: iload_2
    //   1219: iload #4
    //   1221: if_icmpge -> 1252
    //   1224: iload #10
    //   1226: istore #5
    //   1228: aload_1
    //   1229: iload_2
    //   1230: caload
    //   1231: bipush #10
    //   1233: if_icmpne -> 1242
    //   1236: iload #10
    //   1238: iconst_1
    //   1239: iadd
    //   1240: istore #5
    //   1242: iinc #2, 1
    //   1245: iload #5
    //   1247: istore #10
    //   1249: goto -> 1218
    //   1252: new java/lang/StringBuilder
    //   1255: dup
    //   1256: invokespecial <init> : ()V
    //   1259: astore #7
    //   1261: aload #7
    //   1263: ldc_w 'Error parsing XML on line '
    //   1266: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1269: pop
    //   1270: aload #7
    //   1272: iload #10
    //   1274: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   1277: pop
    //   1278: aload #7
    //   1280: ldc_w ' near: '
    //   1283: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1286: pop
    //   1287: aload #7
    //   1289: new java/lang/String
    //   1292: dup
    //   1293: aload_1
    //   1294: iload #4
    //   1296: bipush #32
    //   1298: iload_3
    //   1299: iload #4
    //   1301: isub
    //   1302: invokestatic min : (II)I
    //   1305: invokespecial <init> : ([CII)V
    //   1308: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1311: pop
    //   1312: new com/brashmonkey/spriter/SpriterException
    //   1315: dup
    //   1316: aload #7
    //   1318: invokevirtual toString : ()Ljava/lang/String;
    //   1321: invokespecial <init> : (Ljava/lang/String;)V
    //   1324: athrow
    //   1325: aload_0
    //   1326: getfield elements : Ljava/util/ArrayList;
    //   1329: invokevirtual size : ()I
    //   1332: ifne -> 1347
    //   1335: aload_0
    //   1336: getfield root : Lcom/brashmonkey/spriter/XmlReader$Element;
    //   1339: astore_1
    //   1340: aload_0
    //   1341: aconst_null
    //   1342: putfield root : Lcom/brashmonkey/spriter/XmlReader$Element;
    //   1345: aload_1
    //   1346: areturn
    //   1347: aload_0
    //   1348: getfield elements : Ljava/util/ArrayList;
    //   1351: astore_1
    //   1352: aload_1
    //   1353: aload_1
    //   1354: invokevirtual size : ()I
    //   1357: iconst_1
    //   1358: isub
    //   1359: invokevirtual get : (I)Ljava/lang/Object;
    //   1362: checkcast com/brashmonkey/spriter/XmlReader$Element
    //   1365: astore #7
    //   1367: aload_0
    //   1368: getfield elements : Ljava/util/ArrayList;
    //   1371: invokevirtual clear : ()V
    //   1374: new java/lang/StringBuilder
    //   1377: dup
    //   1378: invokespecial <init> : ()V
    //   1381: astore_1
    //   1382: aload_1
    //   1383: ldc_w 'Error parsing XML, unclosed element: '
    //   1386: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1389: pop
    //   1390: aload_1
    //   1391: aload #7
    //   1393: invokevirtual getName : ()Ljava/lang/String;
    //   1396: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1399: pop
    //   1400: new com/brashmonkey/spriter/SpriterException
    //   1403: dup
    //   1404: aload_1
    //   1405: invokevirtual toString : ()Ljava/lang/String;
    //   1408: invokespecial <init> : (Ljava/lang/String;)V
    //   1411: astore_1
    //   1412: goto -> 1417
    //   1415: aload_1
    //   1416: athrow
    //   1417: goto -> 1415 }
  
  protected void text(String paramString) {
    String str1 = this.current.getText();
    Element element = this.current;
    String str2 = paramString;
    if (str1 != null) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str1);
      stringBuilder.append(paramString);
      str2 = stringBuilder.toString();
    } 
    element.setText(str2);
  }
  
  public static class Element {
    private HashMap<String, String> attributes;
    
    private ArrayList<Element> children;
    
    private final String name;
    
    private Element parent;
    
    private String text;
    
    public Element(String param1String, Element param1Element) {
      this.name = param1String;
      this.parent = param1Element;
    }
    
    private void getChildrenByNameRecursively(String param1String, ArrayList<Element> param1ArrayList) {
      if (this.children == null)
        return; 
      for (byte b = 0; b < this.children.size(); b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          param1ArrayList.add(element); 
        element.getChildrenByNameRecursively(param1String, param1ArrayList);
      } 
    }
    
    public void addChild(Element param1Element) {
      if (this.children == null)
        this.children = new ArrayList(8); 
      this.children.add(param1Element);
    }
    
    public String get(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return str; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new RuntimeException(stringBuilder.toString());
    }
    
    public String get(String param1String1, String param1String2) {
      HashMap hashMap = this.attributes;
      if (hashMap != null) {
        String str1 = (String)hashMap.get(param1String1);
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
      HashMap hashMap = this.attributes;
      if (hashMap != null) {
        String str = (String)hashMap.get(param1String);
        if (str != null)
          return str; 
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append("Element ");
        stringBuilder1.append(param1String);
        stringBuilder1.append(" doesn't have attribute: ");
        stringBuilder1.append(param1String);
        throw new RuntimeException(stringBuilder1.toString());
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(param1String);
      stringBuilder.append(" doesn't have attribute: ");
      stringBuilder.append(param1String);
      throw new RuntimeException(stringBuilder.toString());
    }
    
    public String getAttribute(String param1String1, String param1String2) {
      HashMap hashMap = this.attributes;
      if (hashMap == null)
        return param1String2; 
      param1String1 = (String)hashMap.get(param1String1);
      return (param1String1 == null) ? param1String2 : param1String1;
    }
    
    public HashMap<String, String> getAttributes() { return this.attributes; }
    
    public boolean getBoolean(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return Boolean.parseBoolean(str); 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new RuntimeException(stringBuilder.toString());
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
      ArrayList arrayList = this.children;
      if (arrayList != null)
        return (Element)arrayList.get(param1Int); 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Element has no children: ");
      stringBuilder.append(this.name);
      throw new RuntimeException(stringBuilder.toString());
    }
    
    public Element getChildByName(String param1String) {
      if (this.children == null)
        return null; 
      for (byte b = 0; b < this.children.size(); b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          return element; 
      } 
      return null;
    }
    
    public Element getChildByNameRecursive(String param1String) {
      if (this.children == null)
        return null; 
      for (byte b = 0; b < this.children.size(); b++) {
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
      ArrayList arrayList = this.children;
      return (arrayList == null) ? 0 : arrayList.size();
    }
    
    public ArrayList<Element> getChildrenByName(String param1String) {
      ArrayList arrayList = new ArrayList();
      if (this.children == null)
        return arrayList; 
      for (byte b = 0; b < this.children.size(); b++) {
        Element element = (Element)this.children.get(b);
        if (element.name.equals(param1String))
          arrayList.add(element); 
      } 
      return arrayList;
    }
    
    public ArrayList<Element> getChildrenByNameRecursively(String param1String) {
      ArrayList arrayList = new ArrayList();
      getChildrenByNameRecursively(param1String, arrayList);
      return arrayList;
    }
    
    public float getFloat(String param1String) {
      String str = get(param1String, null);
      if (str != null)
        return Float.parseFloat(str); 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new RuntimeException(stringBuilder.toString());
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
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Element ");
      stringBuilder.append(this.name);
      stringBuilder.append(" doesn't have attribute or child: ");
      stringBuilder.append(param1String);
      throw new RuntimeException(stringBuilder.toString());
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
    
    public void remove() { this.parent.removeChild(this); }
    
    public void removeChild(int param1Int) {
      ArrayList arrayList = this.children;
      if (arrayList != null)
        arrayList.remove(param1Int); 
    }
    
    public void removeChild(Element param1Element) {
      ArrayList arrayList = this.children;
      if (arrayList != null)
        arrayList.remove(param1Element); 
    }
    
    public void setAttribute(String param1String1, String param1String2) {
      if (this.attributes == null)
        this.attributes = new HashMap(8); 
      this.attributes.put(param1String1, param1String2);
    }
    
    public void setText(String param1String) { this.text = param1String; }
    
    public String toString() { return toString(""); }
    
    public String toString(String param1String) {
      StringBuilder stringBuilder1 = new StringBuilder('');
      stringBuilder1.append(param1String);
      stringBuilder1.append('<');
      stringBuilder1.append(this.name);
      HashMap hashMap = this.attributes;
      if (hashMap != null)
        for (Map.Entry entry : hashMap.entrySet()) {
          stringBuilder1.append(' ');
          stringBuilder1.append((String)entry.getKey());
          stringBuilder1.append("=\"");
          stringBuilder1.append((String)entry.getKey());
          stringBuilder1.append('"');
        }  
      if (this.children == null) {
        String str = this.text;
        if (str == null || str.length() == 0) {
          stringBuilder1.append("/>");
          return stringBuilder1.toString();
        } 
      } 
      stringBuilder1.append(">\n");
      StringBuilder stringBuilder2 = new StringBuilder();
      stringBuilder2.append(param1String);
      stringBuilder2.append('\t');
      String str1 = stringBuilder2.toString();
      String str2 = this.text;
      if (str2 != null && str2.length() > 0) {
        stringBuilder1.append(str1);
        stringBuilder1.append(this.text);
        stringBuilder1.append('\n');
      } 
      ArrayList arrayList = this.children;
      if (arrayList != null) {
        Iterator iterator = arrayList.iterator();
        while (iterator.hasNext()) {
          stringBuilder1.append(((Element)iterator.next()).toString(str1));
          stringBuilder1.append('\n');
        } 
      } 
      stringBuilder1.append(param1String);
      stringBuilder1.append("</");
      stringBuilder1.append(this.name);
      stringBuilder1.append('>');
      return stringBuilder1.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/XmlReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */