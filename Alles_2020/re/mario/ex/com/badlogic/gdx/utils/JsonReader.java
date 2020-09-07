package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public class JsonReader implements BaseJsonReader {
  private static final byte[] _json_actions = init__json_actions_0();
  
  private static final byte[] _json_eof_actions;
  
  private static final short[] _json_index_offsets;
  
  private static final byte[] _json_indicies;
  
  private static final short[] _json_key_offsets = init__json_key_offsets_0();
  
  private static final byte[] _json_range_lengths;
  
  private static final byte[] _json_single_lengths;
  
  private static final byte[] _json_trans_actions;
  
  private static final char[] _json_trans_keys = init__json_trans_keys_0();
  
  private static final byte[] _json_trans_targs;
  
  static final int json_en_array = 23;
  
  static final int json_en_main = 1;
  
  static final int json_en_object = 5;
  
  static final int json_error = 0;
  
  static final int json_first_final = 35;
  
  static final int json_start = 1;
  
  private JsonValue current;
  
  private final Array<JsonValue> elements = new Array(8);
  
  private final Array<JsonValue> lastChild = new Array(8);
  
  private JsonValue root;
  
  static  {
    _json_single_lengths = init__json_single_lengths_0();
    _json_range_lengths = init__json_range_lengths_0();
    _json_index_offsets = init__json_index_offsets_0();
    _json_indicies = init__json_indicies_0();
    _json_trans_targs = init__json_trans_targs_0();
    _json_trans_actions = init__json_trans_actions_0();
    _json_eof_actions = init__json_eof_actions_0();
  }
  
  private void addChild(String paramString, JsonValue paramJsonValue) {
    paramJsonValue.setName(paramString);
    JsonValue jsonValue = this.current;
    if (jsonValue == null) {
      this.current = paramJsonValue;
      this.root = paramJsonValue;
    } else {
      if (jsonValue.isArray() || this.current.isObject()) {
        jsonValue = this.current;
        paramJsonValue.parent = jsonValue;
        if (jsonValue.size == 0) {
          this.current.child = paramJsonValue;
        } else {
          jsonValue = (JsonValue)this.lastChild.pop();
          jsonValue.next = paramJsonValue;
          paramJsonValue.prev = jsonValue;
        } 
        this.lastChild.add(paramJsonValue);
        jsonValue = this.current;
        jsonValue.size++;
        return;
      } 
      this.root = this.current;
    } 
  }
  
  private static byte[] init__json_actions_0() { return new byte[] { 
        0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 
        5, 1, 6, 1, 7, 1, 8, 2, 0, 7, 
        2, 0, 8, 2, 1, 3, 2, 1, 5 }; }
  
  private static byte[] init__json_eof_actions_0() { return new byte[] { 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
        0, 0, 0, 0, 0, 1, 0, 0, 0 }; }
  
  private static short[] init__json_index_offsets_0() { return new short[] { 
        0, 0, 11, 14, 16, 19, 28, 34, 40, 43, 
        54, 62, 70, 79, 81, 90, 93, 96, 105, 108, 
        111, 113, 116, 119, 130, 138, 146, 157, 159, 170, 
        173, 176, 187, 190, 193, 196, 201, 206, 207 }; }
  
  private static byte[] init__json_indicies_0() { return new byte[] { 
        1, 1, 2, 3, 4, 3, 5, 3, 6, 1, 
        0, 7, 7, 3, 8, 3, 9, 9, 3, 11, 
        11, 12, 13, 14, 3, 15, 11, 10, 16, 16, 
        17, 18, 16, 3, 19, 19, 20, 21, 19, 3, 
        22, 22, 3, 21, 21, 24, 3, 25, 3, 26, 
        3, 27, 21, 23, 28, 29, 29, 28, 30, 31, 
        32, 3, 33, 34, 34, 33, 13, 35, 15, 3, 
        34, 34, 12, 36, 37, 3, 15, 34, 10, 16, 
        3, 36, 36, 12, 3, 38, 3, 3, 36, 10, 
        39, 39, 3, 40, 40, 3, 13, 13, 12, 3, 
        41, 3, 15, 13, 10, 42, 42, 3, 43, 43, 
        3, 28, 3, 44, 44, 3, 45, 45, 3, 47, 
        47, 48, 49, 50, 3, 51, 52, 53, 47, 46, 
        54, 55, 55, 54, 56, 57, 58, 3, 59, 60, 
        60, 59, 49, 61, 52, 3, 60, 60, 48, 62, 
        63, 3, 51, 52, 53, 60, 46, 54, 3, 62, 
        62, 48, 3, 64, 3, 51, 3, 53, 62, 46, 
        65, 65, 3, 66, 66, 3, 49, 49, 48, 3, 
        67, 3, 51, 52, 53, 49, 46, 68, 68, 3, 
        69, 69, 3, 70, 70, 3, 8, 8, 71, 8, 
        3, 72, 72, 73, 72, 3, 3, 3, 0 }; }
  
  private static short[] init__json_key_offsets_0() { return new short[] { 
        0, 0, 11, 13, 14, 16, 25, 31, 37, 39, 
        50, 57, 64, 73, 74, 83, 85, 87, 96, 98, 
        100, 101, 103, 105, 116, 123, 130, 141, 142, 153, 
        155, 157, 168, 170, 172, 174, 179, 184, 184 }; }
  
  private static byte[] init__json_range_lengths_0() { return new byte[] { 
        0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 
        0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 
        0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 
        0, 1, 0, 0, 0, 1, 1, 0, 0 }; }
  
  private static byte[] init__json_single_lengths_0() { return new byte[] { 
        0, 9, 2, 1, 2, 7, 4, 4, 2, 9, 
        7, 7, 7, 1, 7, 2, 2, 7, 2, 2, 
        1, 2, 2, 9, 7, 7, 9, 1, 9, 2, 
        2, 9, 2, 2, 2, 3, 3, 0, 0 }; }
  
  private static byte[] init__json_trans_actions_0() { return new byte[] { 
        13, 0, 15, 0, 0, 7, 3, 11, 1, 11, 
        17, 0, 20, 0, 0, 5, 1, 1, 1, 0, 
        0, 0, 11, 13, 15, 0, 7, 3, 1, 1, 
        1, 1, 23, 0, 0, 0, 0, 0, 0, 11, 
        11, 0, 11, 11, 11, 11, 13, 0, 15, 0, 
        0, 7, 9, 3, 1, 1, 1, 1, 26, 0, 
        0, 0, 0, 0, 0, 11, 11, 0, 11, 11, 
        11, 1, 0, 0 }; }
  
  private static char[] init__json_trans_keys_0() { return new char[] { 
        '\r', ' ', '"', ',', '/', ':', '[', ']', '{', '\t', 
        '\n', '*', '/', '"', '*', '/', '\r', ' ', '"', ',', 
        '/', ':', '}', '\t', '\n', '\r', ' ', '/', ':', '\t', 
        '\n', '\r', ' ', '/', ':', '\t', '\n', '*', '/', '\r', 
        ' ', '"', ',', '/', ':', '[', ']', '{', '\t', '\n', 
        '\t', '\n', '\r', ' ', ',', '/', '}', '\t', '\n', '\r', 
        ' ', ',', '/', '}', '\r', ' ', '"', ',', '/', ':', 
        '}', '\t', '\n', '"', '\r', ' ', '"', ',', '/', ':', 
        '}', '\t', '\n', '*', '/', '*', '/', '\r', ' ', '"', 
        ',', '/', ':', '}', '\t', '\n', '*', '/', '*', '/', 
        '"', '*', '/', '*', '/', '\r', ' ', '"', ',', '/', 
        ':', '[', ']', '{', '\t', '\n', '\t', '\n', '\r', ' ', 
        ',', '/', ']', '\t', '\n', '\r', ' ', ',', '/', ']', 
        '\r', ' ', '"', ',', '/', ':', '[', ']', '{', '\t', 
        '\n', '"', '\r', ' ', '"', ',', '/', ':', '[', ']', 
        '{', '\t', '\n', '*', '/', '*', '/', '\r', ' ', '"', 
        ',', '/', ':', '[', ']', '{', '\t', '\n', '*', '/', 
        '*', '/', '*', '/', '\r', ' ', '/', '\t', '\n', '\r', 
        ' ', '/', '\t', '\n', Character.MIN_VALUE }; }
  
  private static byte[] init__json_trans_targs_0() { return new byte[] { 
        35, 1, 3, 0, 4, 36, 36, 36, 36, 1, 
        6, 5, 13, 17, 22, 37, 7, 8, 9, 7, 
        8, 9, 7, 10, 20, 21, 11, 11, 11, 12, 
        17, 19, 37, 11, 12, 19, 14, 16, 15, 14, 
        12, 18, 17, 11, 9, 5, 24, 23, 27, 31, 
        34, 25, 38, 25, 25, 26, 31, 33, 38, 25, 
        26, 33, 28, 30, 29, 28, 26, 32, 31, 25, 
        23, 2, 36, 2 }; }
  
  private String unescape(String paramString) {
    int i = paramString.length();
    StringBuilder stringBuilder = new StringBuilder(i + 16);
    byte b = 0;
    while (b < i) {
      char c = b + true;
      char c1 = paramString.charAt(b);
      if (c1 != '\\') {
        stringBuilder.append(c1);
        b = c;
        continue;
      } 
      if (c == i)
        break; 
      b = c + 1;
      c1 = paramString.charAt(c);
      if (c1 == 'u') {
        c = b + 4;
        stringBuilder.append(Character.toChars(Integer.parseInt(paramString.substring(b, c), 16)));
        b = c;
        continue;
      } 
      char c2 = c1;
      if (c1 != '"') {
        c2 = c1;
        if (c1 != '/') {
          c2 = c1;
          if (c1 != '\\')
            if (c1 != 'b') {
              if (c1 != 'f') {
                if (c1 != 'n') {
                  if (c1 != 'r') {
                    if (c1 == 't') {
                      c = '\t';
                      c2 = c;
                    } else {
                      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
                      stringBuilder1.append("Illegal escaped character: \\");
                      stringBuilder1.append(c1);
                      throw new SerializationException(stringBuilder1.toString());
                    } 
                  } else {
                    c = '\r';
                    c2 = c;
                  } 
                } else {
                  c = '\n';
                  c2 = c;
                } 
              } else {
                c = '\f';
                c2 = c;
              } 
            } else {
              c = '\b';
              c2 = c;
            }  
        } 
      } 
      stringBuilder.append(c2);
    } 
    return stringBuilder.toString();
  }
  
  protected void bool(String paramString, boolean paramBoolean) { addChild(paramString, new JsonValue(paramBoolean)); }
  
  protected void number(String paramString1, double paramDouble, String paramString2) { addChild(paramString1, new JsonValue(paramDouble, paramString2)); }
  
  protected void number(String paramString1, long paramLong, String paramString2) { addChild(paramString1, new JsonValue(paramLong, paramString2)); }
  
  public JsonValue parse(FileHandle paramFileHandle) {
    try {
      return parse(paramFileHandle.reader("UTF-8"));
    } catch (Exception exception) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error parsing file: ");
      stringBuilder.append(paramFileHandle);
      throw new SerializationException(stringBuilder.toString(), exception);
    } 
  }
  
  public JsonValue parse(InputStream paramInputStream) {
    Object object;
    try {
      InputStreamReader inputStreamReader = new InputStreamReader();
      this(paramInputStream, "UTF-8");
      object = parse(inputStreamReader);
      StreamUtils.closeQuietly(paramInputStream);
      return object;
    } catch (IOException iOException) {
      object = new SerializationException();
      this(iOException);
      throw object;
    } finally {}
    StreamUtils.closeQuietly(paramInputStream);
    throw object;
  }
  
  public JsonValue parse(Reader paramReader) {
    Object object;
    try {
      object = new char[1024];
      for (int i = 0;; i += j) {
        JsonValue jsonValue;
        int j = paramReader.read(object, i, object.length - i);
        if (j == -1) {
          jsonValue = parse(object, 0, i);
          StreamUtils.closeQuietly(paramReader);
          return jsonValue;
        } 
        if (j == 0) {
          char[] arrayOfChar2 = new char[jsonValue.length * 2];
          System.arraycopy(jsonValue, 0, arrayOfChar2, 0, jsonValue.length);
          char[] arrayOfChar1 = arrayOfChar2;
          continue;
        } 
      } 
    } catch (IOException null) {
      SerializationException serializationException = new SerializationException();
      this(object);
      throw serializationException;
    } finally {}
    StreamUtils.closeQuietly(paramReader);
    throw object;
  }
  
  public JsonValue parse(String paramString) {
    char[] arrayOfChar = paramString.toCharArray();
    return parse(arrayOfChar, 0, arrayOfChar.length);
  }
  
  public JsonValue parse(char[] paramArrayOfChar, int paramInt1, int paramInt2) { // Byte code:
    //   0: iconst_4
    //   1: newarray int
    //   3: astore #4
    //   5: new com/badlogic/gdx/utils/Array
    //   8: dup
    //   9: bipush #8
    //   11: invokespecial <init> : (I)V
    //   14: astore #5
    //   16: iload_2
    //   17: istore #6
    //   19: iconst_0
    //   20: istore #7
    //   22: iconst_0
    //   23: istore #8
    //   25: iconst_1
    //   26: istore #9
    //   28: iconst_0
    //   29: istore_2
    //   30: iconst_0
    //   31: istore #10
    //   33: iconst_0
    //   34: istore #11
    //   36: iconst_0
    //   37: istore #12
    //   39: ldc_w 'null'
    //   42: astore #13
    //   44: iload #7
    //   46: ifeq -> 102
    //   49: iload #7
    //   51: iconst_1
    //   52: if_icmpeq -> 99
    //   55: iload #7
    //   57: iconst_2
    //   58: if_icmpeq -> 96
    //   61: iload #7
    //   63: iconst_4
    //   64: if_icmpeq -> 74
    //   67: iload #6
    //   69: istore #8
    //   71: goto -> 2572
    //   74: iload #9
    //   76: istore #14
    //   78: iload_2
    //   79: istore #15
    //   81: iload #10
    //   83: istore #16
    //   85: iload #11
    //   87: istore #17
    //   89: iload #12
    //   91: istore #18
    //   93: goto -> 1974
    //   96: goto -> 1918
    //   99: goto -> 122
    //   102: iload #6
    //   104: iload_3
    //   105: if_icmpne -> 114
    //   108: iconst_4
    //   109: istore #7
    //   111: goto -> 39
    //   114: iload #9
    //   116: ifne -> 122
    //   119: goto -> 1923
    //   122: iload #6
    //   124: istore #7
    //   126: getstatic com/badlogic/gdx/utils/JsonReader._json_key_offsets : [S
    //   129: iload #9
    //   131: saload
    //   132: istore #18
    //   134: iload #6
    //   136: istore #7
    //   138: getstatic com/badlogic/gdx/utils/JsonReader._json_index_offsets : [S
    //   141: iload #9
    //   143: saload
    //   144: istore #14
    //   146: iload #6
    //   148: istore #7
    //   150: getstatic com/badlogic/gdx/utils/JsonReader._json_single_lengths : [B
    //   153: iload #9
    //   155: baload
    //   156: istore #19
    //   158: iload #19
    //   160: ifle -> 278
    //   163: iload #18
    //   165: iload #19
    //   167: iadd
    //   168: istore #16
    //   170: iload #16
    //   172: iconst_1
    //   173: isub
    //   174: istore #17
    //   176: iload #18
    //   178: istore #15
    //   180: iload #17
    //   182: iload #15
    //   184: if_icmpge -> 201
    //   187: iload #14
    //   189: iload #19
    //   191: iadd
    //   192: istore #15
    //   194: iload #16
    //   196: istore #17
    //   198: goto -> 286
    //   201: iload #15
    //   203: iload #17
    //   205: iload #15
    //   207: isub
    //   208: iconst_1
    //   209: ishr
    //   210: iadd
    //   211: istore #20
    //   213: iload #6
    //   215: istore #7
    //   217: aload_1
    //   218: iload #6
    //   220: caload
    //   221: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_keys : [C
    //   224: iload #20
    //   226: caload
    //   227: if_icmpge -> 239
    //   230: iload #20
    //   232: iconst_1
    //   233: isub
    //   234: istore #17
    //   236: goto -> 180
    //   239: iload #6
    //   241: istore #7
    //   243: aload_1
    //   244: iload #6
    //   246: caload
    //   247: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_keys : [C
    //   250: iload #20
    //   252: caload
    //   253: if_icmple -> 265
    //   256: iload #20
    //   258: iconst_1
    //   259: iadd
    //   260: istore #15
    //   262: goto -> 180
    //   265: iload #14
    //   267: iload #20
    //   269: iload #18
    //   271: isub
    //   272: iadd
    //   273: istore #9
    //   275: goto -> 424
    //   278: iload #14
    //   280: istore #15
    //   282: iload #18
    //   284: istore #17
    //   286: iload #6
    //   288: istore #7
    //   290: getstatic com/badlogic/gdx/utils/JsonReader._json_range_lengths : [B
    //   293: iload #9
    //   295: baload
    //   296: istore #14
    //   298: iload #15
    //   300: istore #9
    //   302: iload #14
    //   304: ifle -> 424
    //   307: iload #14
    //   309: iconst_1
    //   310: ishl
    //   311: iload #17
    //   313: iadd
    //   314: iconst_2
    //   315: isub
    //   316: istore #18
    //   318: iload #17
    //   320: istore #16
    //   322: iload #14
    //   324: istore #9
    //   326: iload #18
    //   328: iload #16
    //   330: if_icmpge -> 343
    //   333: iload #15
    //   335: iload #9
    //   337: iadd
    //   338: istore #9
    //   340: goto -> 424
    //   343: iload #16
    //   345: iload #18
    //   347: iload #16
    //   349: isub
    //   350: iconst_1
    //   351: ishr
    //   352: bipush #-2
    //   354: iand
    //   355: iadd
    //   356: istore #14
    //   358: iload #6
    //   360: istore #7
    //   362: aload_1
    //   363: iload #6
    //   365: caload
    //   366: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_keys : [C
    //   369: iload #14
    //   371: caload
    //   372: if_icmpge -> 384
    //   375: iload #14
    //   377: iconst_2
    //   378: isub
    //   379: istore #18
    //   381: goto -> 326
    //   384: iload #6
    //   386: istore #7
    //   388: aload_1
    //   389: iload #6
    //   391: caload
    //   392: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_keys : [C
    //   395: iload #14
    //   397: iconst_1
    //   398: iadd
    //   399: caload
    //   400: if_icmple -> 412
    //   403: iload #14
    //   405: iconst_2
    //   406: iadd
    //   407: istore #16
    //   409: goto -> 326
    //   412: iload #14
    //   414: iload #17
    //   416: isub
    //   417: iconst_1
    //   418: ishr
    //   419: istore #9
    //   421: goto -> 333
    //   424: iload #6
    //   426: istore #7
    //   428: getstatic com/badlogic/gdx/utils/JsonReader._json_indicies : [B
    //   431: iload #9
    //   433: baload
    //   434: istore #15
    //   436: iload #6
    //   438: istore #7
    //   440: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_targs : [B
    //   443: iload #15
    //   445: baload
    //   446: istore #9
    //   448: iload #6
    //   450: istore #7
    //   452: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_actions : [B
    //   455: iload #15
    //   457: baload
    //   458: ifeq -> 1918
    //   461: iload #6
    //   463: istore #7
    //   465: getstatic com/badlogic/gdx/utils/JsonReader._json_trans_actions : [B
    //   468: iload #15
    //   470: baload
    //   471: istore #15
    //   473: iload #6
    //   475: istore #7
    //   477: getstatic com/badlogic/gdx/utils/JsonReader._json_actions : [B
    //   480: iload #15
    //   482: baload
    //   483: istore #16
    //   485: iload #15
    //   487: iconst_1
    //   488: iadd
    //   489: istore #18
    //   491: iload #12
    //   493: istore #17
    //   495: iload #11
    //   497: istore #12
    //   499: iload #10
    //   501: istore #11
    //   503: iload_2
    //   504: istore #10
    //   506: iload #6
    //   508: istore_2
    //   509: iload #8
    //   511: istore #15
    //   513: iload #16
    //   515: ifle -> 1893
    //   518: getstatic com/badlogic/gdx/utils/JsonReader._json_actions : [B
    //   521: iload #18
    //   523: baload
    //   524: istore #6
    //   526: iload #6
    //   528: tableswitch default -> 580, 0 -> 1876, 1 -> 1490, 2 -> 1366, 3 -> 1322, 4 -> 1217, 5 -> 1194, 6 -> 1097, 7 -> 666, 8 -> 583
    //   580: goto -> 1879
    //   583: iload_2
    //   584: iconst_1
    //   585: iadd
    //   586: istore #10
    //   588: iload #10
    //   590: istore_2
    //   591: iconst_0
    //   592: istore #6
    //   594: aload_1
    //   595: iload_2
    //   596: caload
    //   597: istore #11
    //   599: iload #6
    //   601: istore #8
    //   603: iload_2
    //   604: istore #7
    //   606: iload #11
    //   608: bipush #34
    //   610: if_icmpeq -> 654
    //   613: iload #11
    //   615: bipush #92
    //   617: if_icmpeq -> 627
    //   620: iload #6
    //   622: istore #8
    //   624: goto -> 636
    //   627: iinc #2, 1
    //   630: iconst_1
    //   631: istore #8
    //   633: goto -> 624
    //   636: iload_2
    //   637: iconst_1
    //   638: iadd
    //   639: istore #7
    //   641: iload #8
    //   643: istore #6
    //   645: iload #7
    //   647: istore_2
    //   648: iload #7
    //   650: iload_3
    //   651: if_icmpne -> 594
    //   654: iload #7
    //   656: iconst_1
    //   657: isub
    //   658: istore_2
    //   659: iload #8
    //   661: istore #11
    //   663: goto -> 580
    //   666: iload #12
    //   668: ifeq -> 855
    //   671: iload_2
    //   672: istore #10
    //   674: iconst_0
    //   675: istore #7
    //   677: aload_1
    //   678: iload #10
    //   680: caload
    //   681: istore #11
    //   683: iload #10
    //   685: istore #6
    //   687: iload #7
    //   689: istore #8
    //   691: iload #11
    //   693: bipush #10
    //   695: if_icmpeq -> 832
    //   698: iload #10
    //   700: istore #6
    //   702: iload #7
    //   704: istore #8
    //   706: iload #11
    //   708: bipush #13
    //   710: if_icmpeq -> 832
    //   713: iload #11
    //   715: bipush #47
    //   717: if_icmpeq -> 751
    //   720: iload #10
    //   722: istore #6
    //   724: iload #7
    //   726: istore #8
    //   728: iload #11
    //   730: bipush #58
    //   732: if_icmpeq -> 832
    //   735: iload #11
    //   737: bipush #92
    //   739: if_icmpeq -> 745
    //   742: goto -> 805
    //   745: iconst_1
    //   746: istore #6
    //   748: goto -> 809
    //   751: iload #10
    //   753: iconst_1
    //   754: iadd
    //   755: istore #6
    //   757: iload #6
    //   759: iload_3
    //   760: if_icmpne -> 766
    //   763: goto -> 805
    //   766: aload_1
    //   767: iload #6
    //   769: caload
    //   770: istore #11
    //   772: iload #10
    //   774: istore #6
    //   776: iload #7
    //   778: istore #8
    //   780: iload #11
    //   782: bipush #47
    //   784: if_icmpeq -> 832
    //   787: iload #11
    //   789: bipush #42
    //   791: if_icmpne -> 805
    //   794: iload #10
    //   796: istore #6
    //   798: iload #7
    //   800: istore #8
    //   802: goto -> 832
    //   805: iload #7
    //   807: istore #6
    //   809: iload #10
    //   811: iconst_1
    //   812: iadd
    //   813: istore #8
    //   815: iload #8
    //   817: istore #10
    //   819: iload #6
    //   821: istore #7
    //   823: iload #8
    //   825: iload_3
    //   826: if_icmpne -> 677
    //   829: goto -> 1075
    //   832: iload #8
    //   834: istore #10
    //   836: iload #6
    //   838: istore #8
    //   840: iload #10
    //   842: istore #6
    //   844: goto -> 1075
    //   847: astore #4
    //   849: iload #10
    //   851: istore_2
    //   852: goto -> 2586
    //   855: iload_2
    //   856: istore #10
    //   858: iconst_0
    //   859: istore #7
    //   861: aload_1
    //   862: iload #10
    //   864: caload
    //   865: istore #11
    //   867: iload #10
    //   869: istore #6
    //   871: iload #7
    //   873: istore #8
    //   875: iload #11
    //   877: bipush #10
    //   879: if_icmpeq -> 832
    //   882: iload #10
    //   884: istore #6
    //   886: iload #7
    //   888: istore #8
    //   890: iload #11
    //   892: bipush #13
    //   894: if_icmpeq -> 832
    //   897: iload #10
    //   899: istore #6
    //   901: iload #7
    //   903: istore #8
    //   905: iload #11
    //   907: bipush #44
    //   909: if_icmpeq -> 832
    //   912: iload #11
    //   914: bipush #47
    //   916: if_icmpeq -> 969
    //   919: iload #10
    //   921: istore #6
    //   923: iload #7
    //   925: istore #8
    //   927: iload #11
    //   929: bipush #125
    //   931: if_icmpeq -> 832
    //   934: iload #11
    //   936: bipush #92
    //   938: if_icmpeq -> 963
    //   941: iload #10
    //   943: istore #6
    //   945: iload #7
    //   947: istore #8
    //   949: iload #11
    //   951: bipush #93
    //   953: if_icmpeq -> 832
    //   956: iload #7
    //   958: istore #8
    //   960: goto -> 1031
    //   963: iconst_1
    //   964: istore #8
    //   966: goto -> 1031
    //   969: iload #10
    //   971: iconst_1
    //   972: iadd
    //   973: istore #6
    //   975: iload #6
    //   977: iload_3
    //   978: if_icmpne -> 988
    //   981: iload #7
    //   983: istore #8
    //   985: goto -> 1031
    //   988: aload_1
    //   989: iload #6
    //   991: caload
    //   992: istore #11
    //   994: iload #10
    //   996: istore #6
    //   998: iload #7
    //   1000: istore #8
    //   1002: iload #11
    //   1004: bipush #47
    //   1006: if_icmpeq -> 832
    //   1009: iload #7
    //   1011: istore #8
    //   1013: iload #11
    //   1015: bipush #42
    //   1017: if_icmpne -> 1031
    //   1020: iload #10
    //   1022: istore #6
    //   1024: iload #7
    //   1026: istore #8
    //   1028: goto -> 832
    //   1031: iload #10
    //   1033: iconst_1
    //   1034: iadd
    //   1035: istore #6
    //   1037: iload #6
    //   1039: iload_3
    //   1040: if_icmpne -> 1046
    //   1043: goto -> 832
    //   1046: iload #6
    //   1048: istore #10
    //   1050: iload #8
    //   1052: istore #7
    //   1054: goto -> 861
    //   1057: iload #8
    //   1059: istore #10
    //   1061: aload_1
    //   1062: iload #8
    //   1064: caload
    //   1065: invokestatic isSpace : (C)Z
    //   1068: istore #21
    //   1070: iload #21
    //   1072: ifeq -> 1081
    //   1075: iinc #8, -1
    //   1078: goto -> 1057
    //   1081: iconst_1
    //   1082: istore #17
    //   1084: iload_2
    //   1085: istore #10
    //   1087: iload #8
    //   1089: istore_2
    //   1090: iload #6
    //   1092: istore #11
    //   1094: goto -> 1879
    //   1097: iload_2
    //   1098: iconst_1
    //   1099: iadd
    //   1100: istore #6
    //   1102: aload_1
    //   1103: iload_2
    //   1104: caload
    //   1105: istore_2
    //   1106: iload_2
    //   1107: bipush #47
    //   1109: if_icmpne -> 1144
    //   1112: iload #6
    //   1114: istore_2
    //   1115: iload_2
    //   1116: iload_3
    //   1117: if_icmpeq -> 1138
    //   1120: aload_1
    //   1121: iload_2
    //   1122: caload
    //   1123: istore #6
    //   1125: iload #6
    //   1127: bipush #10
    //   1129: if_icmpeq -> 1138
    //   1132: iinc #2, 1
    //   1135: goto -> 1115
    //   1138: iinc #2, -1
    //   1141: goto -> 1191
    //   1144: iload #6
    //   1146: iconst_1
    //   1147: iadd
    //   1148: istore_2
    //   1149: iload_2
    //   1150: iload_3
    //   1151: if_icmpge -> 1173
    //   1154: aload_1
    //   1155: iload #6
    //   1157: caload
    //   1158: istore #6
    //   1160: iload #6
    //   1162: bipush #42
    //   1164: if_icmpne -> 1170
    //   1167: goto -> 1173
    //   1170: goto -> 1185
    //   1173: aload_1
    //   1174: iload_2
    //   1175: caload
    //   1176: istore #6
    //   1178: iload #6
    //   1180: bipush #47
    //   1182: if_icmpeq -> 1191
    //   1185: iload_2
    //   1186: istore #6
    //   1188: goto -> 1144
    //   1191: goto -> 580
    //   1194: iload_2
    //   1195: istore #7
    //   1197: aload_0
    //   1198: invokevirtual pop : ()V
    //   1201: iload #15
    //   1203: iconst_1
    //   1204: isub
    //   1205: istore #8
    //   1207: aload #4
    //   1209: iload #8
    //   1211: iaload
    //   1212: istore #9
    //   1214: goto -> 1342
    //   1217: iload_2
    //   1218: istore #7
    //   1220: aload #5
    //   1222: getfield size : I
    //   1225: ifle -> 1244
    //   1228: iload_2
    //   1229: istore #7
    //   1231: aload #5
    //   1233: invokevirtual pop : ()Ljava/lang/Object;
    //   1236: checkcast java/lang/String
    //   1239: astore #13
    //   1241: goto -> 1247
    //   1244: aconst_null
    //   1245: astore #13
    //   1247: iload_2
    //   1248: istore #7
    //   1250: aload_0
    //   1251: aload #13
    //   1253: invokevirtual startArray : (Ljava/lang/String;)V
    //   1256: aload #4
    //   1258: astore #13
    //   1260: iload_2
    //   1261: istore #7
    //   1263: iload #15
    //   1265: aload #4
    //   1267: arraylength
    //   1268: if_icmpne -> 1298
    //   1271: iload_2
    //   1272: istore #7
    //   1274: aload #4
    //   1276: arraylength
    //   1277: iconst_2
    //   1278: imul
    //   1279: newarray int
    //   1281: astore #13
    //   1283: iload_2
    //   1284: istore #7
    //   1286: aload #4
    //   1288: iconst_0
    //   1289: aload #13
    //   1291: iconst_0
    //   1292: aload #4
    //   1294: arraylength
    //   1295: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   1298: aload #13
    //   1300: iload #15
    //   1302: iload #9
    //   1304: iastore
    //   1305: bipush #23
    //   1307: istore #9
    //   1309: iload #15
    //   1311: iconst_1
    //   1312: iadd
    //   1313: istore #8
    //   1315: aload #13
    //   1317: astore #4
    //   1319: goto -> 1342
    //   1322: iload_2
    //   1323: istore #7
    //   1325: aload_0
    //   1326: invokevirtual pop : ()V
    //   1329: iload #15
    //   1331: iconst_1
    //   1332: isub
    //   1333: istore #8
    //   1335: aload #4
    //   1337: iload #8
    //   1339: iaload
    //   1340: istore #9
    //   1342: iconst_2
    //   1343: istore #7
    //   1345: iload_2
    //   1346: istore #6
    //   1348: iload #10
    //   1350: istore_2
    //   1351: iload #11
    //   1353: istore #10
    //   1355: iload #12
    //   1357: istore #11
    //   1359: iload #17
    //   1361: istore #12
    //   1363: goto -> 39
    //   1366: iload_2
    //   1367: istore #7
    //   1369: aload #5
    //   1371: getfield size : I
    //   1374: ifle -> 1393
    //   1377: iload_2
    //   1378: istore #7
    //   1380: aload #5
    //   1382: invokevirtual pop : ()Ljava/lang/Object;
    //   1385: checkcast java/lang/String
    //   1388: astore #13
    //   1390: goto -> 1396
    //   1393: aconst_null
    //   1394: astore #13
    //   1396: iload_2
    //   1397: istore #7
    //   1399: aload_0
    //   1400: aload #13
    //   1402: invokevirtual startObject : (Ljava/lang/String;)V
    //   1405: iload_2
    //   1406: istore #7
    //   1408: iload #15
    //   1410: aload #4
    //   1412: arraylength
    //   1413: if_icmpne -> 1450
    //   1416: iload_2
    //   1417: istore #7
    //   1419: aload #4
    //   1421: arraylength
    //   1422: iconst_2
    //   1423: imul
    //   1424: newarray int
    //   1426: astore #13
    //   1428: iload_2
    //   1429: istore #7
    //   1431: aload #4
    //   1433: iconst_0
    //   1434: aload #13
    //   1436: iconst_0
    //   1437: aload #4
    //   1439: arraylength
    //   1440: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   1443: aload #13
    //   1445: astore #4
    //   1447: goto -> 1450
    //   1450: iconst_2
    //   1451: istore #7
    //   1453: aload #4
    //   1455: iload #15
    //   1457: iload #9
    //   1459: iastore
    //   1460: iload #15
    //   1462: iconst_1
    //   1463: iadd
    //   1464: istore #8
    //   1466: iconst_5
    //   1467: istore #9
    //   1469: iload_2
    //   1470: istore #6
    //   1472: iload #10
    //   1474: istore_2
    //   1475: iload #11
    //   1477: istore #10
    //   1479: iload #12
    //   1481: istore #11
    //   1483: iload #17
    //   1485: istore #12
    //   1487: goto -> 39
    //   1490: new java/lang/String
    //   1493: astore #22
    //   1495: aload #22
    //   1497: aload_1
    //   1498: iload #10
    //   1500: iload_2
    //   1501: iload #10
    //   1503: isub
    //   1504: invokespecial <init> : ([CII)V
    //   1507: aload #22
    //   1509: astore #23
    //   1511: iload #11
    //   1513: ifeq -> 1527
    //   1516: iload_2
    //   1517: istore #7
    //   1519: aload_0
    //   1520: aload #22
    //   1522: invokespecial unescape : (Ljava/lang/String;)Ljava/lang/String;
    //   1525: astore #23
    //   1527: iload #12
    //   1529: ifeq -> 1548
    //   1532: iload_2
    //   1533: istore #7
    //   1535: aload #5
    //   1537: aload #23
    //   1539: invokevirtual add : (Ljava/lang/Object;)V
    //   1542: iconst_0
    //   1543: istore #12
    //   1545: goto -> 1862
    //   1548: aload #5
    //   1550: getfield size : I
    //   1553: istore #6
    //   1555: iload #6
    //   1557: ifle -> 1576
    //   1560: iload_2
    //   1561: istore #7
    //   1563: aload #5
    //   1565: invokevirtual pop : ()Ljava/lang/Object;
    //   1568: checkcast java/lang/String
    //   1571: astore #24
    //   1573: goto -> 1579
    //   1576: aconst_null
    //   1577: astore #24
    //   1579: iload #17
    //   1581: ifeq -> 1846
    //   1584: aload #23
    //   1586: ldc_w 'true'
    //   1589: invokevirtual equals : (Ljava/lang/Object;)Z
    //   1592: istore #21
    //   1594: iload #21
    //   1596: ifeq -> 1612
    //   1599: iload_2
    //   1600: istore #7
    //   1602: aload_0
    //   1603: aload #24
    //   1605: iconst_1
    //   1606: invokevirtual bool : (Ljava/lang/String;Z)V
    //   1609: goto -> 1545
    //   1612: aload #23
    //   1614: ldc_w 'false'
    //   1617: invokevirtual equals : (Ljava/lang/Object;)Z
    //   1620: istore #21
    //   1622: iload #21
    //   1624: ifeq -> 1640
    //   1627: iload_2
    //   1628: istore #7
    //   1630: aload_0
    //   1631: aload #24
    //   1633: iconst_0
    //   1634: invokevirtual bool : (Ljava/lang/String;Z)V
    //   1637: goto -> 1609
    //   1640: aload #23
    //   1642: aload #13
    //   1644: invokevirtual equals : (Ljava/lang/Object;)Z
    //   1647: istore #21
    //   1649: iload #21
    //   1651: ifeq -> 1667
    //   1654: iload_2
    //   1655: istore #7
    //   1657: aload_0
    //   1658: aload #24
    //   1660: aconst_null
    //   1661: invokevirtual string : (Ljava/lang/String;Ljava/lang/String;)V
    //   1664: goto -> 1545
    //   1667: iconst_0
    //   1668: istore #6
    //   1670: iconst_1
    //   1671: istore #8
    //   1673: iload #10
    //   1675: iload_2
    //   1676: if_icmpge -> 1800
    //   1679: aload_1
    //   1680: iload #10
    //   1682: caload
    //   1683: istore #7
    //   1685: iload #7
    //   1687: bipush #43
    //   1689: if_icmpeq -> 1794
    //   1692: iload #7
    //   1694: bipush #69
    //   1696: if_icmpeq -> 1785
    //   1699: iload #7
    //   1701: bipush #101
    //   1703: if_icmpeq -> 1785
    //   1706: iload #7
    //   1708: bipush #45
    //   1710: if_icmpeq -> 1794
    //   1713: iload #7
    //   1715: bipush #46
    //   1717: if_icmpeq -> 1785
    //   1720: iload #7
    //   1722: tableswitch default -> 1776, 48 -> 1794, 49 -> 1794, 50 -> 1794, 51 -> 1794, 52 -> 1794, 53 -> 1794, 54 -> 1794, 55 -> 1794, 56 -> 1794, 57 -> 1794
    //   1776: iconst_0
    //   1777: istore #6
    //   1779: iconst_0
    //   1780: istore #8
    //   1782: goto -> 1800
    //   1785: iconst_1
    //   1786: istore #6
    //   1788: iconst_0
    //   1789: istore #8
    //   1791: goto -> 1794
    //   1794: iinc #10, 1
    //   1797: goto -> 1673
    //   1800: iload #6
    //   1802: ifeq -> 1821
    //   1805: aload_0
    //   1806: aload #24
    //   1808: aload #23
    //   1810: invokestatic parseDouble : (Ljava/lang/String;)D
    //   1813: aload #23
    //   1815: invokevirtual number : (Ljava/lang/String;DLjava/lang/String;)V
    //   1818: goto -> 1862
    //   1821: aload #4
    //   1823: astore #22
    //   1825: iload #8
    //   1827: ifeq -> 1850
    //   1830: aload_0
    //   1831: aload #24
    //   1833: aload #23
    //   1835: invokestatic parseLong : (Ljava/lang/String;)J
    //   1838: aload #23
    //   1840: invokevirtual number : (Ljava/lang/String;JLjava/lang/String;)V
    //   1843: goto -> 1862
    //   1846: aload #4
    //   1848: astore #22
    //   1850: aload_0
    //   1851: aload #24
    //   1853: aload #23
    //   1855: invokevirtual string : (Ljava/lang/String;Ljava/lang/String;)V
    //   1858: aload #22
    //   1860: astore #4
    //   1862: iload_2
    //   1863: istore #10
    //   1865: iconst_0
    //   1866: istore #17
    //   1868: goto -> 1879
    //   1871: astore #4
    //   1873: goto -> 2586
    //   1876: iconst_1
    //   1877: istore #12
    //   1879: iinc #16, -1
    //   1882: iinc #18, 1
    //   1885: goto -> 513
    //   1888: astore #4
    //   1890: goto -> 2586
    //   1893: iload #15
    //   1895: istore #8
    //   1897: iload_2
    //   1898: istore #6
    //   1900: iload #10
    //   1902: istore_2
    //   1903: iload #11
    //   1905: istore #10
    //   1907: iload #12
    //   1909: istore #11
    //   1911: iload #17
    //   1913: istore #12
    //   1915: goto -> 1918
    //   1918: iload #9
    //   1920: ifne -> 1929
    //   1923: iconst_5
    //   1924: istore #7
    //   1926: goto -> 39
    //   1929: iload #6
    //   1931: iconst_1
    //   1932: iadd
    //   1933: istore #19
    //   1935: iload #19
    //   1937: istore #6
    //   1939: iload #9
    //   1941: istore #14
    //   1943: iload_2
    //   1944: istore #15
    //   1946: iload #10
    //   1948: istore #16
    //   1950: iload #11
    //   1952: istore #17
    //   1954: iload #12
    //   1956: istore #18
    //   1958: iload #19
    //   1960: iload_3
    //   1961: if_icmpeq -> 1974
    //   1964: iconst_1
    //   1965: istore #7
    //   1967: iload #19
    //   1969: istore #6
    //   1971: goto -> 39
    //   1974: iload #6
    //   1976: istore #8
    //   1978: iload #6
    //   1980: iload_3
    //   1981: if_icmpne -> 2572
    //   1984: iload #6
    //   1986: istore #7
    //   1988: getstatic com/badlogic/gdx/utils/JsonReader._json_eof_actions : [B
    //   1991: iload #14
    //   1993: baload
    //   1994: istore_2
    //   1995: iload #6
    //   1997: istore #7
    //   1999: getstatic com/badlogic/gdx/utils/JsonReader._json_actions : [B
    //   2002: astore #4
    //   2004: iload_2
    //   2005: iconst_1
    //   2006: iadd
    //   2007: istore #10
    //   2009: aload #4
    //   2011: iload_2
    //   2012: baload
    //   2013: istore #12
    //   2015: iload #17
    //   2017: istore_2
    //   2018: aload #5
    //   2020: astore #4
    //   2022: iload #12
    //   2024: iconst_1
    //   2025: isub
    //   2026: istore #11
    //   2028: iload #6
    //   2030: istore #8
    //   2032: iload #12
    //   2034: ifle -> 2572
    //   2037: iload #6
    //   2039: istore #7
    //   2041: getstatic com/badlogic/gdx/utils/JsonReader._json_actions : [B
    //   2044: iload #10
    //   2046: baload
    //   2047: iconst_1
    //   2048: if_icmpeq -> 2066
    //   2051: aload #4
    //   2053: astore #22
    //   2055: aload #13
    //   2057: astore #4
    //   2059: aload #22
    //   2061: astore #13
    //   2063: goto -> 2550
    //   2066: iload #6
    //   2068: istore #7
    //   2070: new java/lang/String
    //   2073: astore #22
    //   2075: iload #6
    //   2077: istore #7
    //   2079: aload #22
    //   2081: aload_1
    //   2082: iload #15
    //   2084: iload #6
    //   2086: iload #15
    //   2088: isub
    //   2089: invokespecial <init> : ([CII)V
    //   2092: aload #22
    //   2094: astore #24
    //   2096: iload #16
    //   2098: ifeq -> 2113
    //   2101: iload #6
    //   2103: istore #7
    //   2105: aload_0
    //   2106: aload #22
    //   2108: invokespecial unescape : (Ljava/lang/String;)Ljava/lang/String;
    //   2111: astore #24
    //   2113: iload_2
    //   2114: ifeq -> 2145
    //   2117: iload #6
    //   2119: istore #7
    //   2121: aload #4
    //   2123: aload #24
    //   2125: invokevirtual add : (Ljava/lang/Object;)V
    //   2128: aload #4
    //   2130: astore #22
    //   2132: iconst_0
    //   2133: istore_2
    //   2134: aload #13
    //   2136: astore #4
    //   2138: aload #22
    //   2140: astore #13
    //   2142: goto -> 2543
    //   2145: iload #6
    //   2147: istore #7
    //   2149: aload #4
    //   2151: getfield size : I
    //   2154: ifle -> 2174
    //   2157: iload #6
    //   2159: istore #7
    //   2161: aload #4
    //   2163: invokevirtual pop : ()Ljava/lang/Object;
    //   2166: checkcast java/lang/String
    //   2169: astore #5
    //   2171: goto -> 2177
    //   2174: aconst_null
    //   2175: astore #5
    //   2177: iload #18
    //   2179: ifeq -> 2519
    //   2182: iload #6
    //   2184: istore #7
    //   2186: aload #24
    //   2188: ldc_w 'true'
    //   2191: invokevirtual equals : (Ljava/lang/Object;)Z
    //   2194: ifeq -> 2223
    //   2197: iload #6
    //   2199: istore #7
    //   2201: aload_0
    //   2202: aload #5
    //   2204: iconst_1
    //   2205: invokevirtual bool : (Ljava/lang/String;Z)V
    //   2208: aload #13
    //   2210: astore #22
    //   2212: aload #4
    //   2214: astore #13
    //   2216: aload #22
    //   2218: astore #4
    //   2220: goto -> 2543
    //   2223: iload #6
    //   2225: istore #7
    //   2227: aload #24
    //   2229: ldc_w 'false'
    //   2232: invokevirtual equals : (Ljava/lang/Object;)Z
    //   2235: ifeq -> 2252
    //   2238: iload #6
    //   2240: istore #7
    //   2242: aload_0
    //   2243: aload #5
    //   2245: iconst_0
    //   2246: invokevirtual bool : (Ljava/lang/String;Z)V
    //   2249: goto -> 2208
    //   2252: iload #6
    //   2254: istore #7
    //   2256: aload #24
    //   2258: aload #13
    //   2260: invokevirtual equals : (Ljava/lang/Object;)Z
    //   2263: ifeq -> 2280
    //   2266: iload #6
    //   2268: istore #7
    //   2270: aload_0
    //   2271: aload #5
    //   2273: aconst_null
    //   2274: invokevirtual string : (Ljava/lang/String;Ljava/lang/String;)V
    //   2277: goto -> 2208
    //   2280: iconst_0
    //   2281: istore #8
    //   2283: iconst_1
    //   2284: istore #12
    //   2286: aload #13
    //   2288: astore #22
    //   2290: iload #15
    //   2292: iload #6
    //   2294: if_icmpge -> 2449
    //   2297: aload_1
    //   2298: iload #15
    //   2300: caload
    //   2301: istore #17
    //   2303: iload #8
    //   2305: istore #7
    //   2307: iload #12
    //   2309: istore #9
    //   2311: iload #17
    //   2313: bipush #43
    //   2315: if_icmpeq -> 2435
    //   2318: iload #17
    //   2320: bipush #69
    //   2322: if_icmpeq -> 2429
    //   2325: iload #17
    //   2327: bipush #101
    //   2329: if_icmpeq -> 2429
    //   2332: iload #8
    //   2334: istore #7
    //   2336: iload #12
    //   2338: istore #9
    //   2340: iload #17
    //   2342: bipush #45
    //   2344: if_icmpeq -> 2435
    //   2347: iload #17
    //   2349: bipush #46
    //   2351: if_icmpeq -> 2429
    //   2354: iload #8
    //   2356: istore #7
    //   2358: iload #12
    //   2360: istore #9
    //   2362: iload #17
    //   2364: tableswitch default -> 2420, 48 -> 2435, 49 -> 2435, 50 -> 2435, 51 -> 2435, 52 -> 2435, 53 -> 2435, 54 -> 2435, 55 -> 2435, 56 -> 2435, 57 -> 2435
    //   2420: iconst_0
    //   2421: istore #8
    //   2423: iconst_0
    //   2424: istore #12
    //   2426: goto -> 2449
    //   2429: iconst_1
    //   2430: istore #7
    //   2432: iconst_0
    //   2433: istore #9
    //   2435: iinc #15, 1
    //   2438: iload #7
    //   2440: istore #8
    //   2442: iload #9
    //   2444: istore #12
    //   2446: goto -> 2290
    //   2449: aload #4
    //   2451: astore #13
    //   2453: iload #8
    //   2455: ifeq -> 2482
    //   2458: iload #6
    //   2460: istore #7
    //   2462: aload_0
    //   2463: aload #5
    //   2465: aload #24
    //   2467: invokestatic parseDouble : (Ljava/lang/String;)D
    //   2470: aload #24
    //   2472: invokevirtual number : (Ljava/lang/String;DLjava/lang/String;)V
    //   2475: aload #22
    //   2477: astore #4
    //   2479: goto -> 2543
    //   2482: aload #22
    //   2484: astore #4
    //   2486: aload #13
    //   2488: astore #23
    //   2490: iload #12
    //   2492: ifeq -> 2527
    //   2495: iload #6
    //   2497: istore #7
    //   2499: aload_0
    //   2500: aload #5
    //   2502: aload #24
    //   2504: invokestatic parseLong : (Ljava/lang/String;)J
    //   2507: aload #24
    //   2509: invokevirtual number : (Ljava/lang/String;JLjava/lang/String;)V
    //   2512: aload #22
    //   2514: astore #4
    //   2516: goto -> 2543
    //   2519: aload #4
    //   2521: astore #23
    //   2523: aload #13
    //   2525: astore #4
    //   2527: iload #6
    //   2529: istore #7
    //   2531: aload_0
    //   2532: aload #5
    //   2534: aload #24
    //   2536: invokevirtual string : (Ljava/lang/String;Ljava/lang/String;)V
    //   2539: aload #23
    //   2541: astore #13
    //   2543: iload #6
    //   2545: istore #15
    //   2547: iconst_0
    //   2548: istore #18
    //   2550: iload #11
    //   2552: istore #12
    //   2554: iinc #10, 1
    //   2557: aload #4
    //   2559: astore #22
    //   2561: aload #13
    //   2563: astore #4
    //   2565: aload #22
    //   2567: astore #13
    //   2569: goto -> 2022
    //   2572: aconst_null
    //   2573: astore #4
    //   2575: iload #8
    //   2577: istore_2
    //   2578: goto -> 2586
    //   2581: astore #4
    //   2583: iload #7
    //   2585: istore_2
    //   2586: aload_0
    //   2587: getfield root : Lcom/badlogic/gdx/utils/JsonValue;
    //   2590: astore #13
    //   2592: aload_0
    //   2593: aconst_null
    //   2594: putfield root : Lcom/badlogic/gdx/utils/JsonValue;
    //   2597: aload_0
    //   2598: aconst_null
    //   2599: putfield current : Lcom/badlogic/gdx/utils/JsonValue;
    //   2602: aload_0
    //   2603: getfield lastChild : Lcom/badlogic/gdx/utils/Array;
    //   2606: invokevirtual clear : ()V
    //   2609: iload_2
    //   2610: iload_3
    //   2611: if_icmpge -> 2767
    //   2614: iconst_0
    //   2615: istore #12
    //   2617: iconst_1
    //   2618: istore #6
    //   2620: iload #12
    //   2622: iload_2
    //   2623: if_icmpge -> 2655
    //   2626: iload #6
    //   2628: istore #8
    //   2630: aload_1
    //   2631: iload #12
    //   2633: caload
    //   2634: bipush #10
    //   2636: if_icmpne -> 2645
    //   2639: iload #6
    //   2641: iconst_1
    //   2642: iadd
    //   2643: istore #8
    //   2645: iinc #12, 1
    //   2648: iload #8
    //   2650: istore #6
    //   2652: goto -> 2620
    //   2655: iconst_0
    //   2656: iload_2
    //   2657: bipush #32
    //   2659: isub
    //   2660: invokestatic max : (II)I
    //   2663: istore #8
    //   2665: new java/lang/StringBuilder
    //   2668: dup
    //   2669: invokespecial <init> : ()V
    //   2672: astore #13
    //   2674: aload #13
    //   2676: ldc_w 'Error parsing JSON on line '
    //   2679: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2682: pop
    //   2683: aload #13
    //   2685: iload #6
    //   2687: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   2690: pop
    //   2691: aload #13
    //   2693: ldc_w ' near: '
    //   2696: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2699: pop
    //   2700: aload #13
    //   2702: new java/lang/String
    //   2705: dup
    //   2706: aload_1
    //   2707: iload #8
    //   2709: iload_2
    //   2710: iload #8
    //   2712: isub
    //   2713: invokespecial <init> : ([CII)V
    //   2716: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2719: pop
    //   2720: aload #13
    //   2722: ldc_w '*ERROR*'
    //   2725: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2728: pop
    //   2729: aload #13
    //   2731: new java/lang/String
    //   2734: dup
    //   2735: aload_1
    //   2736: iload_2
    //   2737: bipush #64
    //   2739: iload_3
    //   2740: iload_2
    //   2741: isub
    //   2742: invokestatic min : (II)I
    //   2745: invokespecial <init> : ([CII)V
    //   2748: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2751: pop
    //   2752: new com/badlogic/gdx/utils/SerializationException
    //   2755: dup
    //   2756: aload #13
    //   2758: invokevirtual toString : ()Ljava/lang/String;
    //   2761: aload #4
    //   2763: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   2766: athrow
    //   2767: aload_0
    //   2768: getfield elements : Lcom/badlogic/gdx/utils/Array;
    //   2771: getfield size : I
    //   2774: ifeq -> 2828
    //   2777: aload_0
    //   2778: getfield elements : Lcom/badlogic/gdx/utils/Array;
    //   2781: invokevirtual peek : ()Ljava/lang/Object;
    //   2784: checkcast com/badlogic/gdx/utils/JsonValue
    //   2787: astore_1
    //   2788: aload_0
    //   2789: getfield elements : Lcom/badlogic/gdx/utils/Array;
    //   2792: invokevirtual clear : ()V
    //   2795: aload_1
    //   2796: ifnull -> 2817
    //   2799: aload_1
    //   2800: invokevirtual isObject : ()Z
    //   2803: ifeq -> 2817
    //   2806: new com/badlogic/gdx/utils/SerializationException
    //   2809: dup
    //   2810: ldc_w 'Error parsing JSON, unmatched brace.'
    //   2813: invokespecial <init> : (Ljava/lang/String;)V
    //   2816: athrow
    //   2817: new com/badlogic/gdx/utils/SerializationException
    //   2820: dup
    //   2821: ldc_w 'Error parsing JSON, unmatched bracket.'
    //   2824: invokespecial <init> : (Ljava/lang/String;)V
    //   2827: athrow
    //   2828: aload #4
    //   2830: ifnonnull -> 2836
    //   2833: aload #13
    //   2835: areturn
    //   2836: new java/lang/StringBuilder
    //   2839: dup
    //   2840: invokespecial <init> : ()V
    //   2843: astore #13
    //   2845: aload #13
    //   2847: ldc_w 'Error parsing JSON: '
    //   2850: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2853: pop
    //   2854: aload #13
    //   2856: new java/lang/String
    //   2859: dup
    //   2860: aload_1
    //   2861: invokespecial <init> : ([C)V
    //   2864: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2867: pop
    //   2868: new com/badlogic/gdx/utils/SerializationException
    //   2871: dup
    //   2872: aload #13
    //   2874: invokevirtual toString : ()Ljava/lang/String;
    //   2877: aload #4
    //   2879: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   2882: astore_1
    //   2883: goto -> 2888
    //   2886: aload_1
    //   2887: athrow
    //   2888: goto -> 2886
    //   2891: astore #22
    //   2893: aload #4
    //   2895: astore #22
    //   2897: goto -> 1850
    //   2900: astore #4
    //   2902: aload #22
    //   2904: astore #4
    //   2906: aload #13
    //   2908: astore #23
    //   2910: goto -> 2527
    // Exception table:
    //   from	to	target	type
    //   126	134	2581	java/lang/RuntimeException
    //   138	146	2581	java/lang/RuntimeException
    //   150	158	2581	java/lang/RuntimeException
    //   217	230	2581	java/lang/RuntimeException
    //   243	256	2581	java/lang/RuntimeException
    //   290	298	2581	java/lang/RuntimeException
    //   362	375	2581	java/lang/RuntimeException
    //   388	403	2581	java/lang/RuntimeException
    //   428	436	2581	java/lang/RuntimeException
    //   440	448	2581	java/lang/RuntimeException
    //   452	461	2581	java/lang/RuntimeException
    //   465	473	2581	java/lang/RuntimeException
    //   477	485	2581	java/lang/RuntimeException
    //   518	526	1888	java/lang/RuntimeException
    //   1061	1070	847	java/lang/RuntimeException
    //   1197	1201	2581	java/lang/RuntimeException
    //   1220	1228	2581	java/lang/RuntimeException
    //   1231	1241	2581	java/lang/RuntimeException
    //   1250	1256	2581	java/lang/RuntimeException
    //   1263	1271	2581	java/lang/RuntimeException
    //   1274	1283	2581	java/lang/RuntimeException
    //   1286	1298	2581	java/lang/RuntimeException
    //   1325	1329	2581	java/lang/RuntimeException
    //   1369	1377	2581	java/lang/RuntimeException
    //   1380	1390	2581	java/lang/RuntimeException
    //   1399	1405	2581	java/lang/RuntimeException
    //   1408	1416	2581	java/lang/RuntimeException
    //   1419	1428	2581	java/lang/RuntimeException
    //   1431	1443	2581	java/lang/RuntimeException
    //   1490	1507	1888	java/lang/RuntimeException
    //   1519	1527	2581	java/lang/RuntimeException
    //   1535	1542	2581	java/lang/RuntimeException
    //   1548	1555	1888	java/lang/RuntimeException
    //   1563	1573	2581	java/lang/RuntimeException
    //   1584	1594	1888	java/lang/RuntimeException
    //   1602	1609	2581	java/lang/RuntimeException
    //   1612	1622	1888	java/lang/RuntimeException
    //   1630	1637	2581	java/lang/RuntimeException
    //   1640	1649	1888	java/lang/RuntimeException
    //   1657	1664	2581	java/lang/RuntimeException
    //   1805	1818	2891	java/lang/NumberFormatException
    //   1805	1818	1871	java/lang/RuntimeException
    //   1830	1843	2891	java/lang/NumberFormatException
    //   1830	1843	1871	java/lang/RuntimeException
    //   1850	1858	1871	java/lang/RuntimeException
    //   1988	1995	2581	java/lang/RuntimeException
    //   1999	2004	2581	java/lang/RuntimeException
    //   2041	2051	2581	java/lang/RuntimeException
    //   2070	2075	2581	java/lang/RuntimeException
    //   2079	2092	2581	java/lang/RuntimeException
    //   2105	2113	2581	java/lang/RuntimeException
    //   2121	2128	2581	java/lang/RuntimeException
    //   2149	2157	2581	java/lang/RuntimeException
    //   2161	2171	2581	java/lang/RuntimeException
    //   2186	2197	2581	java/lang/RuntimeException
    //   2201	2208	2581	java/lang/RuntimeException
    //   2227	2238	2581	java/lang/RuntimeException
    //   2242	2249	2581	java/lang/RuntimeException
    //   2256	2266	2581	java/lang/RuntimeException
    //   2270	2277	2581	java/lang/RuntimeException
    //   2462	2475	2900	java/lang/NumberFormatException
    //   2462	2475	2581	java/lang/RuntimeException
    //   2499	2512	2900	java/lang/NumberFormatException
    //   2499	2512	2581	java/lang/RuntimeException
    //   2531	2539	2581	java/lang/RuntimeException }
  
  protected void pop() {
    Object object;
    this.root = (JsonValue)this.elements.pop();
    if (this.current.size > 0)
      this.lastChild.pop(); 
    if (this.elements.size > 0) {
      object = (JsonValue)this.elements.peek();
    } else {
      object = null;
    } 
    this.current = object;
  }
  
  protected void startArray(String paramString) {
    JsonValue jsonValue = new JsonValue(JsonValue.ValueType.array);
    if (this.current != null)
      addChild(paramString, jsonValue); 
    this.elements.add(jsonValue);
    this.current = jsonValue;
  }
  
  protected void startObject(String paramString) {
    JsonValue jsonValue = new JsonValue(JsonValue.ValueType.object);
    if (this.current != null)
      addChild(paramString, jsonValue); 
    this.elements.add(jsonValue);
    this.current = jsonValue;
  }
  
  protected void string(String paramString1, String paramString2) { addChild(paramString1, new JsonValue(paramString2)); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/JsonReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */