package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class LongArray {
  public long[] items;
  
  public boolean ordered;
  
  public int size;
  
  public LongArray() { this(true, 16); }
  
  public LongArray(int paramInt) { this(true, paramInt); }
  
  public LongArray(LongArray paramLongArray) {
    this.ordered = paramLongArray.ordered;
    this.size = paramLongArray.size;
    int i = this.size;
    this.items = new long[i];
    System.arraycopy(paramLongArray.items, 0, this.items, 0, i);
  }
  
  public LongArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new long[paramInt];
  }
  
  public LongArray(boolean paramBoolean, long[] paramArrayOfLong, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfLong, paramInt1, this.items, 0, paramInt2);
  }
  
  public LongArray(long[] paramArrayOfLong) { this(true, paramArrayOfLong, 0, paramArrayOfLong.length); }
  
  public static LongArray with(long... paramVarArgs) { return new LongArray(paramVarArgs); }
  
  public void add(long paramLong) {
    long[] arrayOfLong1 = this.items;
    int i = this.size;
    long[] arrayOfLong2 = arrayOfLong1;
    if (i == arrayOfLong1.length)
      arrayOfLong2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfLong2[i] = paramLong;
  }
  
  public void add(long paramLong1, long paramLong2) {
    long[] arrayOfLong1 = this.items;
    int i = this.size;
    long[] arrayOfLong2 = arrayOfLong1;
    if (i + 1 >= arrayOfLong1.length)
      arrayOfLong2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfLong2[i] = paramLong1;
    arrayOfLong2[i + 1] = paramLong2;
    this.size = i + 2;
  }
  
  public void add(long paramLong1, long paramLong2, long paramLong3) {
    long[] arrayOfLong1 = this.items;
    int i = this.size;
    long[] arrayOfLong2 = arrayOfLong1;
    if (i + 2 >= arrayOfLong1.length)
      arrayOfLong2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfLong2[i] = paramLong1;
    arrayOfLong2[i + 1] = paramLong2;
    arrayOfLong2[i + 2] = paramLong3;
    this.size = i + 3;
  }
  
  public void add(long paramLong1, long paramLong2, long paramLong3, long paramLong4) {
    long[] arrayOfLong1 = this.items;
    int i = this.size;
    long[] arrayOfLong2 = arrayOfLong1;
    if (i + 3 >= arrayOfLong1.length)
      arrayOfLong2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfLong2[i] = paramLong1;
    arrayOfLong2[i + 1] = paramLong2;
    arrayOfLong2[i + 2] = paramLong3;
    arrayOfLong2[i + 3] = paramLong4;
    this.size = i + 4;
  }
  
  public void addAll(LongArray paramLongArray) { addAll(paramLongArray.items, 0, paramLongArray.size); }
  
  public void addAll(LongArray paramLongArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramLongArray.size) {
      addAll(paramLongArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramLongArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(long... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(long[] paramArrayOfLong, int paramInt1, int paramInt2) {
    long[] arrayOfLong1 = this.items;
    int i = this.size + paramInt2;
    long[] arrayOfLong2 = arrayOfLong1;
    if (i > arrayOfLong1.length)
      arrayOfLong2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfLong, paramInt1, arrayOfLong2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean contains(long paramLong) {
    int i = this.size - 1;
    long[] arrayOfLong = this.items;
    while (i >= 0) {
      if (arrayOfLong[i] == paramLong)
        return true; 
      i--;
    } 
    return false;
  }
  
  public long[] ensureCapacity(int paramInt) {
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
    if (!(paramObject instanceof LongArray))
      return false; 
    LongArray longArray = (LongArray)paramObject;
    if (!longArray.ordered)
      return false; 
    int i = this.size;
    if (i != longArray.size)
      return false; 
    long[] arrayOfLong1 = this.items;
    long[] arrayOfLong2 = longArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfLong1[b] != arrayOfLong2[b])
        return false; 
    } 
    return true;
  }
  
  public long first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public long get(int paramInt) {
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
    long[] arrayOfLong = this.items;
    byte b = 0;
    int i = this.size;
    int j = 1;
    while (b < i) {
      j = j * 31 + (int)(arrayOfLong[b] ^ arrayOfLong[b] >>> 32);
      b++;
    } 
    return j;
  }
  
  public void incr(int paramInt, long paramLong) {
    if (paramInt < this.size) {
      long[] arrayOfLong = this.items;
      arrayOfLong[paramInt] = arrayOfLong[paramInt] + paramLong;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int indexOf(long paramLong) {
    long[] arrayOfLong = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfLong[b] == paramLong)
        return b; 
    } 
    return -1;
  }
  
  public void insert(int paramInt, long paramLong) {
    int i = this.size;
    if (paramInt <= i) {
      long[] arrayOfLong1 = this.items;
      long[] arrayOfLong2 = arrayOfLong1;
      if (i == arrayOfLong1.length)
        arrayOfLong2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfLong2, paramInt, arrayOfLong2, paramInt + 1, this.size - paramInt);
      } else {
        arrayOfLong2[this.size] = arrayOfLong2[paramInt];
      } 
      this.size++;
      arrayOfLong2[paramInt] = paramLong;
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
    long[] arrayOfLong = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      if (arrayOfLong[i] == paramChar)
        return i; 
    } 
    return -1;
  }
  
  public void mul(int paramInt, long paramLong) {
    if (paramInt < this.size) {
      long[] arrayOfLong = this.items;
      arrayOfLong[paramInt] = arrayOfLong[paramInt] * paramLong;
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
  
  public long peek() { return this.items[this.size - 1]; }
  
  public long pop() {
    long[] arrayOfLong = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfLong[i];
  }
  
  public long random() {
    int i = this.size;
    return (i == 0) ? 0L : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(LongArray paramLongArray) {
    int i = this.size;
    long[] arrayOfLong = this.items;
    int j = paramLongArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int m;
      long l = paramLongArray.get(b);
      byte b1 = 0;
      while (true) {
        m = k;
        if (b1 < k) {
          if (l == arrayOfLong[b1]) {
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
  
  public long removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      long[] arrayOfLong = this.items;
      long l = arrayOfLong[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfLong, paramInt + 1, arrayOfLong, paramInt, this.size - paramInt);
      } else {
        arrayOfLong[paramInt] = arrayOfLong[this.size];
      } 
      return l;
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
          long[] arrayOfLong = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfLong, paramInt2, arrayOfLong, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          long[] arrayOfLong = this.items;
          System.arraycopy(arrayOfLong, paramInt2, arrayOfLong, paramInt1, i - paramInt2);
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
  
  public boolean removeValue(long paramLong) {
    long[] arrayOfLong = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfLong[b] == paramLong) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected long[] resize(int paramInt) {
    long[] arrayOfLong = new long[paramInt];
    System.arraycopy(this.items, 0, arrayOfLong, 0, Math.min(this.size, arrayOfLong.length));
    this.items = arrayOfLong;
    return arrayOfLong;
  }
  
  public void reverse() {
    long[] arrayOfLong = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      long l = arrayOfLong[k];
      arrayOfLong[k] = arrayOfLong[m];
      arrayOfLong[m] = l;
    } 
  }
  
  public void set(int paramInt, long paramLong) {
    if (paramInt < this.size) {
      this.items[paramInt] = paramLong;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public long[] setSize(int paramInt) {
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
  
  public long[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    long[] arrayOfLong = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      long l = arrayOfLong[i];
      arrayOfLong[i] = arrayOfLong[j];
      arrayOfLong[j] = l;
    } 
  }
  
  public void sort() { Arrays.sort(this.items, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        long[] arrayOfLong = this.items;
        long l = arrayOfLong[paramInt1];
        arrayOfLong[paramInt1] = arrayOfLong[paramInt2];
        arrayOfLong[paramInt2] = l;
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
  
  public long[] toArray() {
    int i = this.size;
    long[] arrayOfLong = new long[i];
    System.arraycopy(this.items, 0, arrayOfLong, 0, i);
    return arrayOfLong;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    long[] arrayOfLong = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfLong[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfLong[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    long[] arrayOfLong = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfLong[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfLong[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/LongArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */