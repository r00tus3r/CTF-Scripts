package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class ShortArray {
  public short[] items;
  
  public boolean ordered;
  
  public int size;
  
  public ShortArray() { this(true, 16); }
  
  public ShortArray(int paramInt) { this(true, paramInt); }
  
  public ShortArray(ShortArray paramShortArray) {
    this.ordered = paramShortArray.ordered;
    this.size = paramShortArray.size;
    int i = this.size;
    this.items = new short[i];
    System.arraycopy(paramShortArray.items, 0, this.items, 0, i);
  }
  
  public ShortArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new short[paramInt];
  }
  
  public ShortArray(boolean paramBoolean, short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfShort, paramInt1, this.items, 0, paramInt2);
  }
  
  public ShortArray(short[] paramArrayOfShort) { this(true, paramArrayOfShort, 0, paramArrayOfShort.length); }
  
  public static ShortArray with(short... paramVarArgs) { return new ShortArray(paramVarArgs); }
  
  public void add(int paramInt) {
    short[] arrayOfShort1 = this.items;
    int i = this.size;
    short[] arrayOfShort2 = arrayOfShort1;
    if (i == arrayOfShort1.length)
      arrayOfShort2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfShort2[i] = (short)(short)paramInt;
  }
  
  public void add(short paramShort) {
    short[] arrayOfShort1 = this.items;
    int i = this.size;
    short[] arrayOfShort2 = arrayOfShort1;
    if (i == arrayOfShort1.length)
      arrayOfShort2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfShort2[i] = (short)paramShort;
  }
  
  public void add(short paramShort1, short paramShort2) {
    short[] arrayOfShort1 = this.items;
    int i = this.size;
    short[] arrayOfShort2 = arrayOfShort1;
    if (i + 1 >= arrayOfShort1.length)
      arrayOfShort2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfShort2[i] = (short)paramShort1;
    arrayOfShort2[i + 1] = (short)paramShort2;
    this.size = i + 2;
  }
  
  public void add(short paramShort1, short paramShort2, short paramShort3) {
    short[] arrayOfShort1 = this.items;
    int i = this.size;
    short[] arrayOfShort2 = arrayOfShort1;
    if (i + 2 >= arrayOfShort1.length)
      arrayOfShort2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfShort2[i] = (short)paramShort1;
    arrayOfShort2[i + 1] = (short)paramShort2;
    arrayOfShort2[i + 2] = (short)paramShort3;
    this.size = i + 3;
  }
  
  public void add(short paramShort1, short paramShort2, short paramShort3, short paramShort4) {
    short[] arrayOfShort1 = this.items;
    int i = this.size;
    short[] arrayOfShort2 = arrayOfShort1;
    if (i + 3 >= arrayOfShort1.length)
      arrayOfShort2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfShort2[i] = (short)paramShort1;
    arrayOfShort2[i + 1] = (short)paramShort2;
    arrayOfShort2[i + 2] = (short)paramShort3;
    arrayOfShort2[i + 3] = (short)paramShort4;
    this.size = i + 4;
  }
  
  public void addAll(ShortArray paramShortArray) { addAll(paramShortArray.items, 0, paramShortArray.size); }
  
  public void addAll(ShortArray paramShortArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramShortArray.size) {
      addAll(paramShortArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramShortArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(short... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    short[] arrayOfShort1 = this.items;
    int i = this.size + paramInt2;
    short[] arrayOfShort2 = arrayOfShort1;
    if (i > arrayOfShort1.length)
      arrayOfShort2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfShort, paramInt1, arrayOfShort2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean contains(short paramShort) {
    int i = this.size - 1;
    short[] arrayOfShort = this.items;
    while (i >= 0) {
      if (arrayOfShort[i] == paramShort)
        return true; 
      i--;
    } 
    return false;
  }
  
  public short[] ensureCapacity(int paramInt) {
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
    if (!(paramObject instanceof ShortArray))
      return false; 
    ShortArray shortArray = (ShortArray)paramObject;
    if (!shortArray.ordered)
      return false; 
    int i = this.size;
    if (i != shortArray.size)
      return false; 
    short[] arrayOfShort1 = this.items;
    short[] arrayOfShort2 = shortArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfShort1[b] != arrayOfShort2[b])
        return false; 
    } 
    return true;
  }
  
  public short first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public short get(int paramInt) {
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
    short[] arrayOfShort = this.items;
    byte b = 0;
    int i = this.size;
    short s = 1;
    while (b < i) {
      s = s * 31 + arrayOfShort[b];
      b++;
    } 
    return s;
  }
  
  public void incr(int paramInt, short paramShort) {
    if (paramInt < this.size) {
      short[] arrayOfShort = this.items;
      arrayOfShort[paramInt] = (short)(short)(arrayOfShort[paramInt] + paramShort);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int indexOf(short paramShort) {
    short[] arrayOfShort = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfShort[b] == paramShort)
        return b; 
    } 
    return -1;
  }
  
  public void insert(int paramInt, short paramShort) {
    int i = this.size;
    if (paramInt <= i) {
      short[] arrayOfShort1 = this.items;
      short[] arrayOfShort2 = arrayOfShort1;
      if (i == arrayOfShort1.length)
        arrayOfShort2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfShort2, paramInt, arrayOfShort2, paramInt + 1, this.size - paramInt);
      } else {
        arrayOfShort2[this.size] = (short)arrayOfShort2[paramInt];
      } 
      this.size++;
      arrayOfShort2[paramInt] = (short)paramShort;
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
    short[] arrayOfShort = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      if (arrayOfShort[i] == paramChar)
        return i; 
    } 
    return -1;
  }
  
  public void mul(int paramInt, short paramShort) {
    if (paramInt < this.size) {
      short[] arrayOfShort = this.items;
      arrayOfShort[paramInt] = (short)(short)(arrayOfShort[paramInt] * paramShort);
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
  
  public short peek() { return this.items[this.size - 1]; }
  
  public short pop() {
    short[] arrayOfShort = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfShort[i];
  }
  
  public short random() {
    int i = this.size;
    return (i == 0) ? 0 : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(ShortArray paramShortArray) {
    int i = this.size;
    short[] arrayOfShort = this.items;
    int j = paramShortArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int m;
      short s = paramShortArray.get(b);
      byte b1 = 0;
      while (true) {
        m = k;
        if (b1 < k) {
          if (s == arrayOfShort[b1]) {
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
  
  public short removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      short[] arrayOfShort = this.items;
      short s = arrayOfShort[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfShort, paramInt + 1, arrayOfShort, paramInt, this.size - paramInt);
      } else {
        arrayOfShort[paramInt] = (short)arrayOfShort[this.size];
      } 
      return s;
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
          short[] arrayOfShort = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfShort, paramInt2, arrayOfShort, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          short[] arrayOfShort = this.items;
          System.arraycopy(arrayOfShort, paramInt2, arrayOfShort, paramInt1, i - paramInt2);
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
  
  public boolean removeValue(short paramShort) {
    short[] arrayOfShort = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfShort[b] == paramShort) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected short[] resize(int paramInt) {
    short[] arrayOfShort = new short[paramInt];
    System.arraycopy(this.items, 0, arrayOfShort, 0, Math.min(this.size, arrayOfShort.length));
    this.items = arrayOfShort;
    return arrayOfShort;
  }
  
  public void reverse() {
    short[] arrayOfShort = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      short s = arrayOfShort[k];
      arrayOfShort[k] = (short)arrayOfShort[m];
      arrayOfShort[m] = (short)s;
    } 
  }
  
  public void set(int paramInt, short paramShort) {
    if (paramInt < this.size) {
      this.items[paramInt] = (short)paramShort;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public short[] setSize(int paramInt) {
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
  
  public short[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    short[] arrayOfShort = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      short s = arrayOfShort[i];
      arrayOfShort[i] = (short)arrayOfShort[j];
      arrayOfShort[j] = (short)s;
    } 
  }
  
  public void sort() { Arrays.sort(this.items, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        short[] arrayOfShort = this.items;
        i = arrayOfShort[paramInt1];
        arrayOfShort[paramInt1] = (short)arrayOfShort[paramInt2];
        arrayOfShort[paramInt2] = (short)i;
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
  
  public short[] toArray() {
    int i = this.size;
    short[] arrayOfShort = new short[i];
    System.arraycopy(this.items, 0, arrayOfShort, 0, i);
    return arrayOfShort;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    short[] arrayOfShort = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfShort[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfShort[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    short[] arrayOfShort = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfShort[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfShort[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ShortArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */