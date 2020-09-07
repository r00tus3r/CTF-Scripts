package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class CharArray {
  public char[] items;
  
  public boolean ordered;
  
  public int size;
  
  public CharArray() { this(true, 16); }
  
  public CharArray(int paramInt) { this(true, paramInt); }
  
  public CharArray(CharArray paramCharArray) {
    this.ordered = paramCharArray.ordered;
    this.size = paramCharArray.size;
    int i = this.size;
    this.items = new char[i];
    System.arraycopy(paramCharArray.items, 0, this.items, 0, i);
  }
  
  public CharArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new char[paramInt];
  }
  
  public CharArray(boolean paramBoolean, char[] paramArrayOfChar, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfChar, paramInt1, this.items, 0, paramInt2);
  }
  
  public CharArray(char[] paramArrayOfChar) { this(true, paramArrayOfChar, 0, paramArrayOfChar.length); }
  
  public static CharArray with(char... paramVarArgs) { return new CharArray(paramVarArgs); }
  
  public void add(char paramChar) {
    char[] arrayOfChar1 = this.items;
    int i = this.size;
    char[] arrayOfChar2 = arrayOfChar1;
    if (i == arrayOfChar1.length)
      arrayOfChar2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfChar2[i] = (char)paramChar;
  }
  
  public void add(char paramChar1, char paramChar2) {
    char[] arrayOfChar1 = this.items;
    int i = this.size;
    char[] arrayOfChar2 = arrayOfChar1;
    if (i + 1 >= arrayOfChar1.length)
      arrayOfChar2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfChar2[i] = (char)paramChar1;
    arrayOfChar2[i + 1] = (char)paramChar2;
    this.size = i + 2;
  }
  
  public void add(char paramChar1, char paramChar2, char paramChar3) {
    char[] arrayOfChar1 = this.items;
    int i = this.size;
    char[] arrayOfChar2 = arrayOfChar1;
    if (i + 2 >= arrayOfChar1.length)
      arrayOfChar2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfChar2[i] = (char)paramChar1;
    arrayOfChar2[i + 1] = (char)paramChar2;
    arrayOfChar2[i + 2] = (char)paramChar3;
    this.size = i + 3;
  }
  
  public void add(char paramChar1, char paramChar2, char paramChar3, char paramChar4) {
    char[] arrayOfChar1 = this.items;
    int i = this.size;
    char[] arrayOfChar2 = arrayOfChar1;
    if (i + 3 >= arrayOfChar1.length)
      arrayOfChar2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfChar2[i] = (char)paramChar1;
    arrayOfChar2[i + 1] = (char)paramChar2;
    arrayOfChar2[i + 2] = (char)paramChar3;
    arrayOfChar2[i + 3] = (char)paramChar4;
    this.size = i + 4;
  }
  
  public void addAll(CharArray paramCharArray) { addAll(paramCharArray.items, 0, paramCharArray.size); }
  
  public void addAll(CharArray paramCharArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramCharArray.size) {
      addAll(paramCharArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramCharArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(char... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(char[] paramArrayOfChar, int paramInt1, int paramInt2) {
    char[] arrayOfChar1 = this.items;
    int i = this.size + paramInt2;
    char[] arrayOfChar2 = arrayOfChar1;
    if (i > arrayOfChar1.length)
      arrayOfChar2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfChar, paramInt1, arrayOfChar2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean contains(char paramChar) {
    int i = this.size - 1;
    char[] arrayOfChar = this.items;
    while (i >= 0) {
      if (arrayOfChar[i] == paramChar)
        return true; 
      i--;
    } 
    return false;
  }
  
  public char[] ensureCapacity(int paramInt) {
    if (paramInt >= 0) {
      paramInt = this.size + paramInt;
      if (paramInt > this.items.length)
        resize(Math.max(8, paramInt)); 
      return this.items;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("additionalCapacity must be >= 0: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public boolean equals(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!this.ordered)
      return false; 
    if (!(paramObject instanceof CharArray))
      return false; 
    CharArray charArray = (CharArray)paramObject;
    if (!charArray.ordered)
      return false; 
    int i = this.size;
    if (i != charArray.size)
      return false; 
    char[] arrayOfChar1 = this.items;
    char[] arrayOfChar2 = charArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfChar1[b] != arrayOfChar2[b])
        return false; 
    } 
    return true;
  }
  
  public char first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public char get(int paramInt) {
    if (paramInt < this.size)
      return this.items[paramInt]; 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int hashCode() {
    if (!this.ordered)
      return super.hashCode(); 
    char[] arrayOfChar = this.items;
    byte b = 0;
    int i = this.size;
    char c = '\001';
    while (b < i) {
      c = c * 31 + arrayOfChar[b];
      b++;
    } 
    return c;
  }
  
  public void incr(int paramInt, char paramChar) {
    if (paramInt < this.size) {
      char[] arrayOfChar = this.items;
      arrayOfChar[paramInt] = (char)(char)(arrayOfChar[paramInt] + paramChar);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int indexOf(char paramChar) {
    char[] arrayOfChar = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfChar[b] == paramChar)
        return b; 
    } 
    return -1;
  }
  
  public void insert(int paramInt, char paramChar) {
    int i = this.size;
    if (paramInt <= i) {
      char[] arrayOfChar1 = this.items;
      char[] arrayOfChar2 = arrayOfChar1;
      if (i == arrayOfChar1.length)
        arrayOfChar2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfChar2, paramInt, arrayOfChar2, paramInt + 1, this.size - paramInt);
      } else {
        arrayOfChar2[this.size] = (char)arrayOfChar2[paramInt];
      } 
      this.size++;
      arrayOfChar2[paramInt] = (char)paramChar;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be > size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" > ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.size == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int lastIndexOf(char paramChar) {
    char[] arrayOfChar = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      if (arrayOfChar[i] == paramChar)
        return i; 
    } 
    return -1;
  }
  
  public void mul(int paramInt, char paramChar) {
    if (paramInt < this.size) {
      char[] arrayOfChar = this.items;
      arrayOfChar[paramInt] = (char)(char)(arrayOfChar[paramInt] * paramChar);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public boolean notEmpty() {
    boolean bool;
    if (this.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public char peek() { return this.items[this.size - 1]; }
  
  public char pop() {
    char[] arrayOfChar = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfChar[i];
  }
  
  public char random() {
    int i = this.size;
    return (i == 0) ? Character.MIN_VALUE : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(CharArray paramCharArray) {
    int i = this.size;
    char[] arrayOfChar = this.items;
    int j = paramCharArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int m;
      char c = paramCharArray.get(b);
      byte b1 = 0;
      while (true) {
        m = k;
        if (b1 < k) {
          if (c == arrayOfChar[b1]) {
            removeIndex(b1);
            m = k - 1;
            break;
          } 
          b1++;
          continue;
        } 
        break;
      } 
      b++;
      k = m;
    } 
    if (k != i)
      bool = true; 
    return bool;
  }
  
  public char removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      char[] arrayOfChar = this.items;
      char c = arrayOfChar[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfChar, paramInt + 1, arrayOfChar, paramInt, this.size - paramInt);
      } else {
        arrayOfChar[paramInt] = (char)arrayOfChar[this.size];
      } 
      return c;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public void removeRange(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt2 < i) {
      if (paramInt1 <= paramInt2) {
        int j = paramInt2 - paramInt1 + 1;
        int k = i - j;
        if (this.ordered) {
          char[] arrayOfChar = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfChar, paramInt2, arrayOfChar, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          char[] arrayOfChar = this.items;
          System.arraycopy(arrayOfChar, paramInt2, arrayOfChar, paramInt1, i - paramInt2);
        } 
        this.size = k;
        return;
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("start can't be > end: ");
      stringBuilder1.append(paramInt1);
      stringBuilder1.append(" > ");
      stringBuilder1.append(paramInt2);
      throw new IndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("end can't be >= size: ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public boolean removeValue(char paramChar) {
    char[] arrayOfChar = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfChar[b] == paramChar) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected char[] resize(int paramInt) {
    char[] arrayOfChar = new char[paramInt];
    System.arraycopy(this.items, 0, arrayOfChar, 0, Math.min(this.size, arrayOfChar.length));
    this.items = arrayOfChar;
    return arrayOfChar;
  }
  
  public void reverse() {
    char[] arrayOfChar = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      char c = arrayOfChar[k];
      arrayOfChar[k] = (char)arrayOfChar[m];
      arrayOfChar[m] = (char)c;
    } 
  }
  
  public void set(int paramInt, char paramChar) {
    if (paramInt < this.size) {
      this.items[paramInt] = (char)paramChar;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public char[] setSize(int paramInt) {
    if (paramInt >= 0) {
      if (paramInt > this.items.length)
        resize(Math.max(8, paramInt)); 
      this.size = paramInt;
      return this.items;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("newSize must be >= 0: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public char[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    char[] arrayOfChar = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      char c = arrayOfChar[i];
      arrayOfChar[i] = (char)arrayOfChar[j];
      arrayOfChar[j] = (char)c;
    } 
  }
  
  public void sort() { Arrays.sort(this.items, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        char[] arrayOfChar = this.items;
        i = arrayOfChar[paramInt1];
        arrayOfChar[paramInt1] = (char)arrayOfChar[paramInt2];
        arrayOfChar[paramInt2] = (char)i;
        return;
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("second can't be >= size: ");
      stringBuilder1.append(paramInt2);
      stringBuilder1.append(" >= ");
      stringBuilder1.append(this.size);
      throw new IndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("first can't be >= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public char[] toArray() {
    int i = this.size;
    char[] arrayOfChar = new char[i];
    System.arraycopy(this.items, 0, arrayOfChar, 0, i);
    return arrayOfChar;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    char[] arrayOfChar = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfChar[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfChar[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    char[] arrayOfChar = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfChar[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfChar[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/CharArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */