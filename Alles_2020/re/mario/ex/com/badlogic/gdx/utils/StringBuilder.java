package com.badlogic.gdx.utils;

import java.io.IOException;
import java.util.Arrays;

public class StringBuilder implements Appendable, CharSequence {
  static final int INITIAL_CAPACITY = 16;
  
  private static final char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
  
  public char[] chars;
  
  public int length;
  
  public StringBuilder() { this.chars = new char[16]; }
  
  public StringBuilder(int paramInt) {
    if (paramInt >= 0) {
      this.chars = new char[paramInt];
      return;
    } 
    throw new NegativeArraySizeException();
  }
  
  public StringBuilder(StringBuilder paramStringBuilder) {
    this.length = paramStringBuilder.length;
    int i = this.length;
    this.chars = new char[i + 16];
    System.arraycopy(paramStringBuilder.chars, 0, this.chars, 0, i);
  }
  
  public StringBuilder(CharSequence paramCharSequence) { this(paramCharSequence.toString()); }
  
  public StringBuilder(String paramString) {
    this.length = paramString.length();
    int i = this.length;
    this.chars = new char[i + 16];
    paramString.getChars(0, i, this.chars, 0);
  }
  
  private void enlargeBuffer(int paramInt) {
    char[] arrayOfChar = this.chars;
    int i = (arrayOfChar.length >> 1) + arrayOfChar.length + 2;
    if (paramInt <= i)
      paramInt = i; 
    arrayOfChar = new char[paramInt];
    System.arraycopy(this.chars, 0, arrayOfChar, 0, this.length);
    this.chars = arrayOfChar;
  }
  
  private void move(int paramInt1, int paramInt2) {
    char[] arrayOfChar = this.chars;
    int i = arrayOfChar.length;
    int j = this.length;
    if (i - j >= paramInt1) {
      System.arraycopy(arrayOfChar, paramInt2, arrayOfChar, paramInt1 + paramInt2, j - paramInt2);
      return;
    } 
    i = j + paramInt1;
    int k = (arrayOfChar.length << 1) + 2;
    j = k;
    if (i > k)
      j = i; 
    arrayOfChar = new char[j];
    System.arraycopy(this.chars, 0, arrayOfChar, 0, paramInt2);
    System.arraycopy(this.chars, paramInt2, arrayOfChar, paramInt1 + paramInt2, this.length - paramInt2);
    this.chars = arrayOfChar;
  }
  
  public static int numChars(int paramInt1, int paramInt2) {
    byte b;
    if (paramInt1 < 0) {
      b = 2;
    } else {
      b = 1;
    } 
    while (true) {
      paramInt1 /= paramInt2;
      if (paramInt1 != 0) {
        b++;
        continue;
      } 
      break;
    } 
    return b;
  }
  
  public static int numChars(long paramLong, int paramInt) {
    byte b;
    if (paramLong < 0L) {
      b = 2;
    } else {
      b = 1;
    } 
    while (true) {
      paramLong /= paramInt;
      if (paramLong != 0L) {
        b++;
        continue;
      } 
      break;
    } 
    return b;
  }
  
  public StringBuilder append(char paramChar) {
    append0(paramChar);
    return this;
  }
  
  public StringBuilder append(double paramDouble) {
    append0(Double.toString(paramDouble));
    return this;
  }
  
  public StringBuilder append(float paramFloat) {
    append0(Float.toString(paramFloat));
    return this;
  }
  
  public StringBuilder append(int paramInt) { return append(paramInt, 0); }
  
  public StringBuilder append(int paramInt1, int paramInt2) { return append(paramInt1, paramInt2, '0'); }
  
  public StringBuilder append(int paramInt1, int paramInt2, char paramChar) {
    if (paramInt1 == Integer.MIN_VALUE) {
      append0("-2147483648");
      return this;
    } 
    int i = paramInt1;
    if (paramInt1 < 0) {
      append0('-');
      i = -paramInt1;
    } 
    if (paramInt2 > 1)
      for (paramInt1 = paramInt2 - numChars(i, 10); paramInt1 > 0; paramInt1--)
        append(paramChar);  
    if (i >= 10000) {
      if (i >= 1000000000)
        append0(digits[(int)(i % 10000000000L / 1000000000L)]); 
      if (i >= 100000000)
        append0(digits[i % 1000000000 / 100000000]); 
      if (i >= 10000000)
        append0(digits[i % 100000000 / 10000000]); 
      if (i >= 1000000)
        append0(digits[i % 10000000 / 1000000]); 
      if (i >= 100000)
        append0(digits[i % 1000000 / 100000]); 
      append0(digits[i % 100000 / 10000]);
    } 
    if (i >= 1000)
      append0(digits[i % 10000 / 1000]); 
    if (i >= 100)
      append0(digits[i % 1000 / 100]); 
    if (i >= 10)
      append0(digits[i % 100 / 10]); 
    append0(digits[i % 10]);
    return this;
  }
  
  public StringBuilder append(long paramLong) { return append(paramLong, 0); }
  
  public StringBuilder append(long paramLong, int paramInt) { return append(paramLong, paramInt, '0'); }
  
  public StringBuilder append(long paramLong, int paramInt, char paramChar) {
    if (paramLong == Float.MIN_VALUE) {
      append0("-9223372036854775808");
      return this;
    } 
    long l = paramLong;
    if (paramLong < 0L) {
      append0('-');
      l = -paramLong;
    } 
    if (paramInt > 1)
      for (paramInt -= numChars(l, 10); paramInt > 0; paramInt--)
        append(paramChar);  
    if (l >= 10000L) {
      if (l >= 1000000000000000000L) {
        char[] arrayOfChar = digits;
        double d = l;
        Double.isNaN(d);
        append0(arrayOfChar[(int)(d % 1.0E19D / 1.0E18D)]);
      } 
      if (l >= 100000000000000000L)
        append0(digits[(int)(l % 1000000000000000000L / 100000000000000000L)]); 
      if (l >= 10000000000000000L)
        append0(digits[(int)(l % 100000000000000000L / 10000000000000000L)]); 
      if (l >= 1000000000000000L)
        append0(digits[(int)(l % 10000000000000000L / 1000000000000000L)]); 
      if (l >= 100000000000000L)
        append0(digits[(int)(l % 1000000000000000L / 100000000000000L)]); 
      if (l >= 10000000000000L)
        append0(digits[(int)(l % 100000000000000L / 10000000000000L)]); 
      if (l >= 1000000000000L)
        append0(digits[(int)(l % 10000000000000L / 1000000000000L)]); 
      if (l >= 100000000000L)
        append0(digits[(int)(l % 1000000000000L / 100000000000L)]); 
      if (l >= 10000000000L)
        append0(digits[(int)(l % 100000000000L / 10000000000L)]); 
      if (l >= 1000000000L)
        append0(digits[(int)(l % 10000000000L / 1000000000L)]); 
      if (l >= 100000000L)
        append0(digits[(int)(l % 1000000000L / 100000000L)]); 
      if (l >= 10000000L)
        append0(digits[(int)(l % 100000000L / 10000000L)]); 
      if (l >= 1000000L)
        append0(digits[(int)(l % 10000000L / 1000000L)]); 
      if (l >= 100000L)
        append0(digits[(int)(l % 1000000L / 100000L)]); 
      append0(digits[(int)(l % 100000L / 10000L)]);
    } 
    if (l >= 1000L)
      append0(digits[(int)(l % 10000L / 1000L)]); 
    if (l >= 100L)
      append0(digits[(int)(l % 1000L / 100L)]); 
    if (l >= 10L)
      append0(digits[(int)(l % 100L / 10L)]); 
    append0(digits[(int)(l % 10L)]);
    return this;
  }
  
  public StringBuilder append(StringBuilder paramStringBuilder) {
    if (paramStringBuilder == null) {
      appendNull();
    } else {
      append0(paramStringBuilder.chars, 0, paramStringBuilder.length);
    } 
    return this;
  }
  
  public StringBuilder append(StringBuilder paramStringBuilder, int paramInt1, int paramInt2) {
    if (paramStringBuilder == null) {
      appendNull();
    } else {
      append0(paramStringBuilder.chars, paramInt1, paramInt2);
    } 
    return this;
  }
  
  public StringBuilder append(CharSequence paramCharSequence) {
    if (paramCharSequence == null) {
      appendNull();
    } else if (paramCharSequence instanceof StringBuilder) {
      paramCharSequence = (StringBuilder)paramCharSequence;
      append0(paramCharSequence.chars, 0, paramCharSequence.length);
    } else {
      append0(paramCharSequence.toString());
    } 
    return this;
  }
  
  public StringBuilder append(CharSequence paramCharSequence, int paramInt1, int paramInt2) {
    append0(paramCharSequence, paramInt1, paramInt2);
    return this;
  }
  
  public StringBuilder append(Object paramObject) {
    if (paramObject == null) {
      appendNull();
    } else {
      append0(paramObject.toString());
    } 
    return this;
  }
  
  public StringBuilder append(String paramString) {
    append0(paramString);
    return this;
  }
  
  public StringBuilder append(boolean paramBoolean) {
    String str;
    if (paramBoolean) {
      str = "true";
    } else {
      str = "false";
    } 
    append0(str);
    return this;
  }
  
  public StringBuilder append(char[] paramArrayOfChar) {
    append0(paramArrayOfChar);
    return this;
  }
  
  public StringBuilder append(char[] paramArrayOfChar, int paramInt1, int paramInt2) {
    append0(paramArrayOfChar, paramInt1, paramInt2);
    return this;
  }
  
  final void append0(char paramChar) {
    int i = this.length;
    if (i == this.chars.length)
      enlargeBuffer(i + 1); 
    char[] arrayOfChar = this.chars;
    i = this.length;
    this.length = i + 1;
    arrayOfChar[i] = (char)paramChar;
  }
  
  final void append0(CharSequence paramCharSequence, int paramInt1, int paramInt2) {
    CharSequence charSequence = paramCharSequence;
    if (paramCharSequence == null)
      charSequence = "null"; 
    if (paramInt1 >= 0 && paramInt2 >= 0 && paramInt1 <= paramInt2 && paramInt2 <= charSequence.length()) {
      append0(charSequence.subSequence(paramInt1, paramInt2).toString());
      return;
    } 
    throw new IndexOutOfBoundsException();
  }
  
  final void append0(String paramString) {
    if (paramString == null) {
      appendNull();
      return;
    } 
    int i = paramString.length();
    int j = this.length + i;
    if (j > this.chars.length)
      enlargeBuffer(j); 
    paramString.getChars(0, i, this.chars, this.length);
    this.length = j;
  }
  
  final void append0(char[] paramArrayOfChar) {
    int i = this.length + paramArrayOfChar.length;
    if (i > this.chars.length)
      enlargeBuffer(i); 
    System.arraycopy(paramArrayOfChar, 0, this.chars, this.length, paramArrayOfChar.length);
    this.length = i;
  }
  
  final void append0(char[] paramArrayOfChar, int paramInt1, int paramInt2) {
    if (paramInt1 <= paramArrayOfChar.length && paramInt1 >= 0) {
      if (paramInt2 >= 0 && paramArrayOfChar.length - paramInt1 >= paramInt2) {
        int i = this.length + paramInt2;
        if (i > this.chars.length)
          enlargeBuffer(i); 
        System.arraycopy(paramArrayOfChar, paramInt1, this.chars, this.length, paramInt2);
        this.length = i;
        return;
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("Length out of bounds: ");
      stringBuilder1.append(paramInt2);
      throw new ArrayIndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Offset out of bounds: ");
    stringBuilder.append(paramInt1);
    throw new ArrayIndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public StringBuilder appendCodePoint(int paramInt) {
    append0(Character.toChars(paramInt));
    return this;
  }
  
  public StringBuilder appendLine(String paramString) {
    append0(paramString);
    append0('\n');
    return this;
  }
  
  final void appendNull() {
    int i = this.length + 4;
    if (i > this.chars.length)
      enlargeBuffer(i); 
    char[] arrayOfChar = this.chars;
    i = this.length;
    this.length = i + 1;
    arrayOfChar[i] = (char)'n';
    i = this.length;
    this.length = i + 1;
    arrayOfChar[i] = (char)'u';
    i = this.length;
    this.length = i + 1;
    arrayOfChar[i] = (char)'l';
    i = this.length;
    this.length = i + 1;
    arrayOfChar[i] = (char)'l';
  }
  
  public int capacity() { return this.chars.length; }
  
  public char charAt(int paramInt) {
    if (paramInt >= 0 && paramInt < this.length)
      return this.chars[paramInt]; 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public void clear() { this.length = 0; }
  
  public int codePointAt(int paramInt) {
    if (paramInt >= 0) {
      int i = this.length;
      if (paramInt < i)
        return Character.codePointAt(this.chars, paramInt, i); 
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public int codePointBefore(int paramInt) {
    if (paramInt >= 1 && paramInt <= this.length)
      return Character.codePointBefore(this.chars, paramInt); 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public int codePointCount(int paramInt1, int paramInt2) {
    if (paramInt1 >= 0 && paramInt2 <= this.length && paramInt1 <= paramInt2)
      return Character.codePointCount(this.chars, paramInt1, paramInt2 - paramInt1); 
    throw new StringIndexOutOfBoundsException();
  }
  
  public boolean contains(String paramString) {
    boolean bool = false;
    if (indexOf(paramString, 0) != -1)
      bool = true; 
    return bool;
  }
  
  public boolean containsIgnoreCase(String paramString) {
    boolean bool = false;
    if (indexOfIgnoreCase(paramString, 0) != -1)
      bool = true; 
    return bool;
  }
  
  public StringBuilder delete(int paramInt1, int paramInt2) {
    delete0(paramInt1, paramInt2);
    return this;
  }
  
  final void delete0(int paramInt1, int paramInt2) {
    if (paramInt1 >= 0) {
      int i = this.length;
      int j = paramInt2;
      if (paramInt2 > i)
        j = i; 
      if (j == paramInt1)
        return; 
      if (j > paramInt1) {
        paramInt2 = this.length - j;
        if (paramInt2 >= 0) {
          char[] arrayOfChar = this.chars;
          System.arraycopy(arrayOfChar, j, arrayOfChar, paramInt1, paramInt2);
        } 
        this.length -= j - paramInt1;
        return;
      } 
    } 
    throw new StringIndexOutOfBoundsException();
  }
  
  public StringBuilder deleteCharAt(int paramInt) {
    deleteCharAt0(paramInt);
    return this;
  }
  
  final void deleteCharAt0(int paramInt) {
    if (paramInt >= 0) {
      int i = this.length;
      if (paramInt < i) {
        i = i - paramInt - 1;
        if (i > 0) {
          char[] arrayOfChar = this.chars;
          System.arraycopy(arrayOfChar, paramInt + 1, arrayOfChar, paramInt, i);
        } 
        this.length--;
        return;
      } 
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public void ensureCapacity(int paramInt) {
    char[] arrayOfChar = this.chars;
    if (paramInt > arrayOfChar.length) {
      int i = (arrayOfChar.length << 1) + 2;
      int j = paramInt;
      if (i > paramInt)
        j = i; 
      enlargeBuffer(j);
    } 
  }
  
  public boolean equals(Object paramObject) {
    if (this == paramObject)
      return true; 
    if (paramObject == null)
      return false; 
    if (getClass() != paramObject.getClass())
      return false; 
    StringBuilder stringBuilder = (StringBuilder)paramObject;
    int i = this.length;
    if (i != stringBuilder.length)
      return false; 
    char[] arrayOfChar1 = this.chars;
    char[] arrayOfChar2 = stringBuilder.chars;
    for (byte b = 0; b < i; b++) {
      if (arrayOfChar1[b] != arrayOfChar2[b])
        return false; 
    } 
    return true;
  }
  
  public boolean equalsIgnoreCase(StringBuilder paramStringBuilder) {
    if (this == paramStringBuilder)
      return true; 
    if (paramStringBuilder == null)
      return false; 
    int i = this.length;
    if (i != paramStringBuilder.length)
      return false; 
    char[] arrayOfChar2 = this.chars;
    char[] arrayOfChar1 = paramStringBuilder.chars;
    for (byte b = 0; b < i; b++) {
      char c1 = arrayOfChar2[b];
      char c2 = Character.toUpperCase(arrayOfChar1[b]);
      if (c1 != c2 && c1 != Character.toLowerCase(c2))
        return false; 
    } 
    return true;
  }
  
  public boolean equalsIgnoreCase(String paramString) {
    if (paramString == null)
      return false; 
    int i = this.length;
    if (i != paramString.length())
      return false; 
    char[] arrayOfChar = this.chars;
    for (byte b = 0; b < i; b++) {
      char c1 = arrayOfChar[b];
      char c2 = Character.toUpperCase(paramString.charAt(b));
      if (c1 != c2 && c1 != Character.toLowerCase(c2))
        return false; 
    } 
    return true;
  }
  
  public void getChars(int paramInt1, int paramInt2, char[] paramArrayOfChar, int paramInt3) {
    int i = this.length;
    if (paramInt1 <= i && paramInt2 <= i && paramInt1 <= paramInt2) {
      System.arraycopy(this.chars, paramInt1, paramArrayOfChar, paramInt3, paramInt2 - paramInt1);
      return;
    } 
    throw new StringIndexOutOfBoundsException();
  }
  
  final char[] getValue() { return this.chars; }
  
  public int hashCode() { return (this.length + 31) * 31 + Arrays.hashCode(this.chars); }
  
  public int indexOf(String paramString) { return indexOf(paramString, 0); }
  
  public int indexOf(String paramString, int paramInt) {
    int i = paramInt;
    if (paramInt < 0)
      i = 0; 
    int j = paramString.length();
    if (j == 0) {
      paramInt = this.length;
      if (i < paramInt || i == 0)
        paramInt = i; 
      return paramInt;
    } 
    int k = this.length - j;
    if (i > k)
      return -1; 
    char c = paramString.charAt(0);
    while (true) {
      if (i <= k) {
        if (this.chars[i] == c) {
          paramInt = 1;
        } else {
          continue;
        } 
      } else {
        paramInt = 0;
      } 
      if (paramInt == 0)
        return -1; 
      paramInt = i;
      byte b = 0;
      while (++b < j) {
        char[] arrayOfChar = this.chars;
        if (arrayOfChar[++paramInt] == paramString.charAt(b));
      } 
      if (b == j)
        break; 
      continue;
      i++;
    } 
    return i;
  }
  
  public int indexOfIgnoreCase(String paramString, int paramInt) {
    int i = paramInt;
    if (paramInt < 0)
      i = 0; 
    int j = paramString.length();
    if (j == 0) {
      paramInt = this.length;
      if (i < paramInt || i == 0)
        paramInt = i; 
      return paramInt;
    } 
    int k = this.length - j;
    if (i > k)
      return -1; 
    char c1 = Character.toUpperCase(paramString.charAt(0));
    char c2 = Character.toLowerCase(c1);
    while (true) {
      byte b2;
      if (i <= k) {
        paramInt = this.chars[i];
        if (paramInt == c1 || paramInt == c2) {
          paramInt = 1;
        } else {
          continue;
        } 
      } else {
        paramInt = 0;
      } 
      if (paramInt == 0)
        return -1; 
      paramInt = i;
      byte b1 = 0;
      while (true) {
        b2 = b1 + true;
        if (b2 < j) {
          char[] arrayOfChar = this.chars;
          int m = paramInt + 1;
          char c3 = arrayOfChar[m];
          char c4 = Character.toUpperCase(paramString.charAt(b2));
          b1 = b2;
          paramInt = m;
          if (c3 != c4) {
            b1 = b2;
            paramInt = m;
            if (c3 != Character.toLowerCase(c4))
              break; 
          } 
          continue;
        } 
        break;
      } 
      if (b2 == j)
        break; 
      continue;
      i++;
    } 
    return i;
  }
  
  public StringBuilder insert(int paramInt, char paramChar) {
    insert0(paramInt, paramChar);
    return this;
  }
  
  public StringBuilder insert(int paramInt, double paramDouble) {
    insert0(paramInt, Double.toString(paramDouble));
    return this;
  }
  
  public StringBuilder insert(int paramInt, float paramFloat) {
    insert0(paramInt, Float.toString(paramFloat));
    return this;
  }
  
  public StringBuilder insert(int paramInt1, int paramInt2) {
    insert0(paramInt1, Integer.toString(paramInt2));
    return this;
  }
  
  public StringBuilder insert(int paramInt, long paramLong) {
    insert0(paramInt, Long.toString(paramLong));
    return this;
  }
  
  public StringBuilder insert(int paramInt, CharSequence paramCharSequence) {
    if (paramCharSequence == null) {
      paramCharSequence = "null";
    } else {
      paramCharSequence = paramCharSequence.toString();
    } 
    insert0(paramInt, paramCharSequence);
    return this;
  }
  
  public StringBuilder insert(int paramInt1, CharSequence paramCharSequence, int paramInt2, int paramInt3) {
    insert0(paramInt1, paramCharSequence, paramInt2, paramInt3);
    return this;
  }
  
  public StringBuilder insert(int paramInt, Object paramObject) {
    if (paramObject == null) {
      paramObject = "null";
    } else {
      paramObject = paramObject.toString();
    } 
    insert0(paramInt, paramObject);
    return this;
  }
  
  public StringBuilder insert(int paramInt, String paramString) {
    insert0(paramInt, paramString);
    return this;
  }
  
  public StringBuilder insert(int paramInt, boolean paramBoolean) {
    String str;
    if (paramBoolean) {
      str = "true";
    } else {
      str = "false";
    } 
    insert0(paramInt, str);
    return this;
  }
  
  public StringBuilder insert(int paramInt, char[] paramArrayOfChar) {
    insert0(paramInt, paramArrayOfChar);
    return this;
  }
  
  public StringBuilder insert(int paramInt1, char[] paramArrayOfChar, int paramInt2, int paramInt3) {
    insert0(paramInt1, paramArrayOfChar, paramInt2, paramInt3);
    return this;
  }
  
  final void insert0(int paramInt, char paramChar) {
    if (paramInt >= 0 && paramInt <= this.length) {
      move(1, paramInt);
      this.chars[paramInt] = (char)paramChar;
      this.length++;
      return;
    } 
    throw new ArrayIndexOutOfBoundsException(paramInt);
  }
  
  final void insert0(int paramInt1, CharSequence paramCharSequence, int paramInt2, int paramInt3) {
    CharSequence charSequence = paramCharSequence;
    if (paramCharSequence == null)
      charSequence = "null"; 
    if (paramInt1 >= 0 && paramInt1 <= this.length && paramInt2 >= 0 && paramInt3 >= 0 && paramInt2 <= paramInt3 && paramInt3 <= charSequence.length()) {
      insert0(paramInt1, charSequence.subSequence(paramInt2, paramInt3).toString());
      return;
    } 
    throw new IndexOutOfBoundsException();
  }
  
  final void insert0(int paramInt, String paramString) {
    if (paramInt >= 0 && paramInt <= this.length) {
      String str = paramString;
      if (paramString == null)
        str = "null"; 
      int i = str.length();
      if (i != 0) {
        move(i, paramInt);
        str.getChars(0, i, this.chars, paramInt);
        this.length += i;
      } 
      return;
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  final void insert0(int paramInt, char[] paramArrayOfChar) {
    if (paramInt >= 0 && paramInt <= this.length) {
      if (paramArrayOfChar.length != 0) {
        move(paramArrayOfChar.length, paramInt);
        System.arraycopy(paramArrayOfChar, 0, paramArrayOfChar, paramInt, paramArrayOfChar.length);
        this.length += paramArrayOfChar.length;
      } 
      return;
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  final void insert0(int paramInt1, char[] paramArrayOfChar, int paramInt2, int paramInt3) {
    if (paramInt1 >= 0 && paramInt1 <= paramInt3) {
      if (paramInt2 >= 0 && paramInt3 >= 0 && paramInt3 <= paramArrayOfChar.length - paramInt2) {
        if (paramInt3 != 0) {
          move(paramInt3, paramInt1);
          System.arraycopy(paramArrayOfChar, paramInt2, this.chars, paramInt1, paramInt3);
          this.length += paramInt3;
        } 
        return;
      } 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("offset ");
      stringBuilder.append(paramInt2);
      stringBuilder.append(", length ");
      stringBuilder.append(paramInt3);
      stringBuilder.append(", char[].length ");
      stringBuilder.append(paramArrayOfChar.length);
      throw new StringIndexOutOfBoundsException(stringBuilder.toString());
    } 
    throw new StringIndexOutOfBoundsException(paramInt1);
  }
  
  public int lastIndexOf(String paramString) { return lastIndexOf(paramString, this.length); }
  
  public int lastIndexOf(String paramString, int paramInt) {
    int i = paramString.length();
    int j = this.length;
    if (i <= j && paramInt >= 0) {
      if (i > 0) {
        int k = paramInt;
        if (paramInt > j - i)
          k = j - i; 
        char c = paramString.charAt(0);
        for (paramInt = k;; paramInt--) {
          if (paramInt >= 0) {
            if (this.chars[paramInt] == c) {
              k = 1;
            } else {
              paramInt--;
              continue;
            } 
          } else {
            k = 0;
          } 
          if (k == 0)
            return -1; 
          k = paramInt;
          j = 0;
          while (++j < i) {
            char[] arrayOfChar = this.chars;
            if (arrayOfChar[++k] == paramString.charAt(j));
          } 
          if (j == i)
            return paramInt; 
        } 
      } 
      if (paramInt >= j)
        paramInt = j; 
      return paramInt;
    } 
    return -1;
  }
  
  public int length() { return this.length; }
  
  public int offsetByCodePoints(int paramInt1, int paramInt2) { return Character.offsetByCodePoints(this.chars, 0, this.length, paramInt1, paramInt2); }
  
  public StringBuilder replace(char paramChar, String paramString) {
    int i = paramString.length();
    for (int j = 0;; j++) {
      if (j == this.length)
        return this; 
      if (this.chars[j] == paramChar) {
        replace0(j, j + true, paramString);
        j += i;
        continue;
      } 
    } 
  }
  
  public StringBuilder replace(int paramInt1, int paramInt2, String paramString) {
    replace0(paramInt1, paramInt2, paramString);
    return this;
  }
  
  public StringBuilder replace(String paramString1, String paramString2) {
    int i = paramString1.length();
    int j = paramString2.length();
    int k;
    for (k = 0;; k += j) {
      k = indexOf(paramString1, k);
      if (k == -1)
        return this; 
      replace0(k, k + i, paramString2);
    } 
  }
  
  final void replace0(int paramInt1, int paramInt2, String paramString) {
    if (paramInt1 >= 0) {
      int i = this.length;
      int j = paramInt2;
      if (paramInt2 > i)
        j = i; 
      if (j > paramInt1) {
        paramInt2 = paramString.length();
        i = j - paramInt1 - paramInt2;
        if (i > 0) {
          char[] arrayOfChar = this.chars;
          System.arraycopy(arrayOfChar, j, arrayOfChar, paramInt1 + paramInt2, this.length - j);
        } else if (i < 0) {
          move(-i, j);
        } 
        paramString.getChars(0, paramInt2, this.chars, paramInt1);
        this.length -= i;
        return;
      } 
      if (paramInt1 == j) {
        if (paramString != null) {
          insert0(paramInt1, paramString);
          return;
        } 
        throw new NullPointerException();
      } 
    } 
    throw new StringIndexOutOfBoundsException();
  }
  
  public StringBuilder reverse() {
    reverse0();
    return this;
  }
  
  final void reverse0() {
    int i = this.length;
    if (i < 2)
      return; 
    int j = i - 1;
    char[] arrayOfChar = this.chars;
    char c1 = arrayOfChar[0];
    char c2 = arrayOfChar[j];
    int k = i / 2;
    char c = '\001';
    boolean bool = true;
    i = 0;
    while (true) {
      char c3;
      if (i < k) {
        arrayOfChar = this.chars;
        int m = i + 1;
        c3 = arrayOfChar[m];
        int n = j - 1;
        char c4 = arrayOfChar[n];
        if (c && c3 >= '?' && c3 <= '?' && c1 >= '?' && c1 <= '?') {
          c = '\001';
        } else {
          c = Character.MIN_VALUE;
        } 
        if (c && this.length < 3)
          return; 
        if (bool && c4 >= '?' && c4 <= '?' && c2 >= '?' && c2 <= '?') {
          bool = true;
        } else {
          bool = false;
        } 
        if (c == bool) {
          if (c) {
            arrayOfChar = this.chars;
            arrayOfChar[j] = (char)c3;
            arrayOfChar[n] = (char)c1;
            arrayOfChar[i] = (char)c4;
            arrayOfChar[m] = (char)c2;
            c1 = arrayOfChar[i + 2];
            c2 = arrayOfChar[j - 2];
            j--;
            i = m;
          } else {
            arrayOfChar = this.chars;
            arrayOfChar[j] = (char)c1;
            arrayOfChar[i] = (char)c2;
            c2 = c4;
            c1 = c3;
          } 
          c3 = '\001';
        } else if (c) {
          arrayOfChar = this.chars;
          arrayOfChar[j] = (char)c3;
          arrayOfChar[i] = (char)c2;
          c2 = c4;
          c3 = Character.MIN_VALUE;
        } else {
          arrayOfChar = this.chars;
          arrayOfChar[j] = (char)c1;
          arrayOfChar[i] = (char)c4;
          c1 = c3;
          c3 = '\001';
          bool = false;
          i++;
          j--;
          c = c3;
        } 
        bool = true;
      } else {
        break;
      } 
      i++;
      j--;
      c = c3;
    } 
    if ((this.length & true) == 1 && (c == '\000' || !bool)) {
      arrayOfChar = this.chars;
      if (c != '\000')
        c1 = c2; 
      arrayOfChar[j] = (char)c1;
    } 
  }
  
  public void setCharAt(int paramInt, char paramChar) {
    if (paramInt >= 0 && paramInt < this.length) {
      this.chars[paramInt] = (char)paramChar;
      return;
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public void setLength(int paramInt) {
    if (paramInt >= 0) {
      char[] arrayOfChar = this.chars;
      if (paramInt > arrayOfChar.length) {
        enlargeBuffer(paramInt);
      } else {
        int i = this.length;
        if (i < paramInt)
          Arrays.fill(arrayOfChar, i, paramInt, false); 
      } 
      this.length = paramInt;
      return;
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public CharSequence subSequence(int paramInt1, int paramInt2) { return substring(paramInt1, paramInt2); }
  
  public String substring(int paramInt) {
    if (paramInt >= 0) {
      int i = this.length;
      if (paramInt <= i)
        return (paramInt == i) ? "" : new String(this.chars, paramInt, i - paramInt); 
    } 
    throw new StringIndexOutOfBoundsException(paramInt);
  }
  
  public String substring(int paramInt1, int paramInt2) {
    if (paramInt1 >= 0 && paramInt1 <= paramInt2 && paramInt2 <= this.length)
      return (paramInt1 == paramInt2) ? "" : new String(this.chars, paramInt1, paramInt2 - paramInt1); 
    throw new StringIndexOutOfBoundsException();
  }
  
  public String toString() {
    int i = this.length;
    return (i == 0) ? "" : new String(this.chars, false, i);
  }
  
  public void trimToSize() {
    int i = this.length;
    char[] arrayOfChar = this.chars;
    if (i < arrayOfChar.length) {
      char[] arrayOfChar1 = new char[i];
      System.arraycopy(arrayOfChar, 0, arrayOfChar1, 0, i);
      this.chars = arrayOfChar1;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/StringBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */