package com.badlogic.gdx.utils;

public class Base64Coder {
  public static final CharMap regularMap = new CharMap(43, 47);
  
  private static final String systemLineSeparator = "\n";
  
  public static final CharMap urlsafeMap = new CharMap(45, 95);
  
  public static byte[] decode(String paramString) { return decode(paramString.toCharArray()); }
  
  public static byte[] decode(String paramString, CharMap paramCharMap) { return decode(paramString.toCharArray(), paramCharMap); }
  
  public static byte[] decode(char[] paramArrayOfChar) { return decode(paramArrayOfChar, 0, paramArrayOfChar.length, regularMap.decodingMap); }
  
  public static byte[] decode(char[] paramArrayOfChar, int paramInt1, int paramInt2, CharMap paramCharMap) { return decode(paramArrayOfChar, paramInt1, paramInt2, paramCharMap.decodingMap); }
  
  public static byte[] decode(char[] paramArrayOfChar, int paramInt1, int paramInt2, byte[] paramArrayOfByte) {
    if (paramInt2 % 4 == 0) {
      while (paramInt2 > 0 && paramArrayOfChar[paramInt1 + paramInt2 - 1] == '=')
        paramInt2--; 
      int i = paramInt2 * 3 / 4;
      byte[] arrayOfByte = new byte[i];
      int j = paramInt2 + paramInt1;
      int k = 0;
      while (paramInt1 < j) {
        byte b;
        paramInt2 = paramInt1 + 1;
        char c1 = paramArrayOfChar[paramInt1];
        paramInt1 = paramInt2 + 1;
        char c2 = paramArrayOfChar[paramInt2];
        int m = 65;
        if (paramInt1 < j) {
          paramInt2 = paramInt1 + 1;
          b = paramArrayOfChar[paramInt1];
        } else {
          paramInt2 = paramInt1;
          b = 65;
        } 
        paramInt1 = paramInt2;
        if (paramInt2 < j) {
          m = paramArrayOfChar[paramInt2];
          paramInt1 = paramInt2 + 1;
        } 
        if (c1 <= '' && c2 <= '' && b <= Byte.MAX_VALUE && m <= 127) {
          byte b1 = paramArrayOfByte[c1];
          byte b2 = paramArrayOfByte[c2];
          b = paramArrayOfByte[b];
          m = paramArrayOfByte[m];
          if (b1 >= 0 && b2 >= 0 && b >= 0 && m >= 0) {
            paramInt2 = k + true;
            arrayOfByte[k] = (byte)(byte)(b1 << 2 | b2 >>> 4);
            if (paramInt2 < i) {
              k = paramInt2 + 1;
              arrayOfByte[paramInt2] = (byte)(byte)((b2 & 0xF) << 4 | b >>> 2);
              paramInt2 = k;
            } 
            if (paramInt2 < i) {
              k = paramInt2 + 1;
              arrayOfByte[paramInt2] = (byte)(byte)((b & 0x3) << 6 | m);
              paramInt2 = k;
            } 
            k = paramInt2;
            continue;
          } 
          throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
        } 
        throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
      } 
      return arrayOfByte;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("Length of Base64 encoded input string is not a multiple of 4.");
    throw illegalArgumentException;
  }
  
  public static byte[] decode(char[] paramArrayOfChar, CharMap paramCharMap) { return decode(paramArrayOfChar, 0, paramArrayOfChar.length, paramCharMap); }
  
  public static byte[] decode(char[] paramArrayOfChar, byte[] paramArrayOfByte) { return decode(paramArrayOfChar, 0, paramArrayOfChar.length, paramArrayOfByte); }
  
  public static byte[] decodeLines(String paramString) { return decodeLines(paramString, regularMap.decodingMap); }
  
  public static byte[] decodeLines(String paramString, CharMap paramCharMap) { return decodeLines(paramString, paramCharMap.decodingMap); }
  
  public static byte[] decodeLines(String paramString, byte[] paramArrayOfByte) {
    char[] arrayOfChar = new char[paramString.length()];
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b1 < paramString.length(); b2 = b) {
      char c = paramString.charAt(b1);
      byte b = b2;
      if (c != ' ') {
        b = b2;
        if (c != '\r') {
          b = b2;
          if (c != '\n') {
            b = b2;
            if (c != '\t') {
              arrayOfChar[b2] = (char)c;
              b = b2 + 1;
            } 
          } 
        } 
      } 
      b1++;
    } 
    return decode(arrayOfChar, 0, b2, paramArrayOfByte);
  }
  
  public static String decodeString(String paramString) { return decodeString(paramString, false); }
  
  public static String decodeString(String paramString, boolean paramBoolean) {
    CharMap charMap;
    char[] arrayOfChar = paramString.toCharArray();
    if (paramBoolean) {
      charMap = urlsafeMap;
    } else {
      charMap = regularMap;
    } 
    return new String(decode(arrayOfChar, charMap.decodingMap));
  }
  
  public static char[] encode(byte[] paramArrayOfByte) { return encode(paramArrayOfByte, regularMap.encodingMap); }
  
  public static char[] encode(byte[] paramArrayOfByte, int paramInt) { return encode(paramArrayOfByte, 0, paramInt, regularMap.encodingMap); }
  
  public static char[] encode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, CharMap paramCharMap) { return encode(paramArrayOfByte, paramInt1, paramInt2, paramCharMap.encodingMap); }
  
  public static char[] encode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, char[] paramArrayOfChar) {
    int i = (paramInt2 * 4 + 2) / 3;
    char[] arrayOfChar = new char[(paramInt2 + 2) / 3 * 4];
    int j = paramInt2 + paramInt1;
    for (paramInt2 = 0; paramInt1 < j; paramInt2 = k + 1) {
      boolean bool;
      int k = paramInt1 + 1;
      byte b = paramArrayOfByte[paramInt1] & 0xFF;
      if (k < j) {
        paramInt1 = k + 1;
        k = paramArrayOfByte[k] & 0xFF;
      } else {
        paramInt1 = k;
        k = 0;
      } 
      if (paramInt1 < j) {
        int i1 = paramInt1 + 1;
        bool = paramArrayOfByte[paramInt1] & 0xFF;
        paramInt1 = i1;
      } else {
        bool = false;
      } 
      int m = paramInt2 + 1;
      arrayOfChar[paramInt2] = (char)paramArrayOfChar[b >>> 2];
      int n = m + 1;
      arrayOfChar[m] = (char)paramArrayOfChar[(b & 0x3) << 4 | k >>> 4];
      m = 61;
      if (n < i) {
        paramInt2 = paramArrayOfChar[(k & 0xF) << 2 | bool >>> 6];
      } else {
        paramInt2 = 61;
      } 
      arrayOfChar[n] = (char)paramInt2;
      k = n + 1;
      paramInt2 = m;
      if (k < i)
        paramInt2 = paramArrayOfChar[bool & 0x3F]; 
      arrayOfChar[k] = (char)paramInt2;
    } 
    return arrayOfChar;
  }
  
  public static char[] encode(byte[] paramArrayOfByte, CharMap paramCharMap) { return encode(paramArrayOfByte, 0, paramArrayOfByte.length, paramCharMap); }
  
  public static char[] encode(byte[] paramArrayOfByte, char[] paramArrayOfChar) { return encode(paramArrayOfByte, 0, paramArrayOfByte.length, paramArrayOfChar); }
  
  public static String encodeLines(byte[] paramArrayOfByte) { return encodeLines(paramArrayOfByte, 0, paramArrayOfByte.length, 76, "\n", regularMap.encodingMap); }
  
  public static String encodeLines(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, String paramString, CharMap paramCharMap) { return encodeLines(paramArrayOfByte, paramInt1, paramInt2, paramInt3, paramString, paramCharMap.encodingMap); }
  
  public static String encodeLines(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, String paramString, char[] paramArrayOfChar) {
    int i = paramInt3 * 3 / 4;
    if (i > 0) {
      paramInt3 = (paramInt2 + i - 1) / i;
      StringBuilder stringBuilder = new StringBuilder((paramInt2 + 2) / 3 * 4 + paramInt3 * paramString.length());
      for (paramInt3 = 0; paramInt3 < paramInt2; paramInt3 += j) {
        int j = Math.min(paramInt2 - paramInt3, i);
        stringBuilder.append(encode(paramArrayOfByte, paramInt1 + paramInt3, j, paramArrayOfChar));
        stringBuilder.append(paramString);
      } 
      return stringBuilder.toString();
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException();
    throw illegalArgumentException;
  }
  
  public static String encodeString(String paramString) { return encodeString(paramString, false); }
  
  public static String encodeString(String paramString, boolean paramBoolean) {
    CharMap charMap;
    byte[] arrayOfByte = paramString.getBytes();
    if (paramBoolean) {
      charMap = urlsafeMap;
    } else {
      charMap = regularMap;
    } 
    return new String(encode(arrayOfByte, charMap.encodingMap));
  }
  
  public static class CharMap {
    protected final byte[] decodingMap = new byte[128];
    
    protected final char[] encodingMap = new char[64];
    
    public CharMap(char param1Char1, char param1Char2) {
      char c = Character.MIN_VALUE;
      char c1 = 'A';
      byte b;
      for (b = 0; c1 <= 'Z'; b++) {
        this.encodingMap[b] = (char)c1;
        c1 = (char)(c1 + 1);
      } 
      c1 = 'a';
      while (c1 <= 'z') {
        this.encodingMap[b] = (char)c1;
        c1 = (char)(c1 + '\001');
        b++;
      } 
      c1 = '0';
      while (c1 <= '9') {
        this.encodingMap[b] = (char)c1;
        c1 = (char)(c1 + '\001');
        b++;
      } 
      char[] arrayOfChar = this.encodingMap;
      arrayOfChar[b] = (char)param1Char1;
      arrayOfChar[b + 1] = (char)param1Char2;
      param1Char1 = Character.MIN_VALUE;
      while (true) {
        byte[] arrayOfByte = this.decodingMap;
        param1Char2 = c;
        if (param1Char1 < arrayOfByte.length) {
          arrayOfByte[param1Char1] = (byte)-1;
          param1Char1++;
          continue;
        } 
        break;
      } 
      while (param1Char2 < '@') {
        this.decodingMap[this.encodingMap[param1Char2]] = (byte)(byte)param1Char2;
        param1Char2++;
      } 
    }
    
    public byte[] getDecodingMap() { return this.decodingMap; }
    
    public char[] getEncodingMap() { return this.encodingMap; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Base64Coder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */