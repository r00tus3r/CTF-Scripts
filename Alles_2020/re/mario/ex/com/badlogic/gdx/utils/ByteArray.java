package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class ByteArray {
  public byte[] items;
  
  public boolean ordered;
  
  public int size;
  
  public ByteArray() { this(true, 16); }
  
  public ByteArray(int paramInt) { this(true, paramInt); }
  
  public ByteArray(ByteArray paramByteArray) {
    this.ordered = paramByteArray.ordered;
    this.size = paramByteArray.size;
    int i = this.size;
    this.items = new byte[i];
    System.arraycopy(paramByteArray.items, 0, this.items, 0, i);
  }
  
  public ByteArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new byte[paramInt];
  }
  
  public ByteArray(boolean paramBoolean, byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfByte, paramInt1, this.items, 0, paramInt2);
  }
  
  public ByteArray(byte[] paramArrayOfByte) { this(true, paramArrayOfByte, 0, paramArrayOfByte.length); }
  
  public static ByteArray with(byte... paramVarArgs) { return new ByteArray(paramVarArgs); }
  
  public void add(byte paramByte) {
    byte[] arrayOfByte1 = this.items;
    int i = this.size;
    byte[] arrayOfByte2 = arrayOfByte1;
    if (i == arrayOfByte1.length)
      arrayOfByte2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfByte2[i] = (byte)paramByte;
  }
  
  public void add(byte paramByte1, byte paramByte2) {
    byte[] arrayOfByte1 = this.items;
    int i = this.size;
    byte[] arrayOfByte2 = arrayOfByte1;
    if (i + 1 >= arrayOfByte1.length)
      arrayOfByte2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfByte2[i] = (byte)paramByte1;
    arrayOfByte2[i + 1] = (byte)paramByte2;
    this.size = i + 2;
  }
  
  public void add(byte paramByte1, byte paramByte2, byte paramByte3) {
    byte[] arrayOfByte1 = this.items;
    int i = this.size;
    byte[] arrayOfByte2 = arrayOfByte1;
    if (i + 2 >= arrayOfByte1.length)
      arrayOfByte2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfByte2[i] = (byte)paramByte1;
    arrayOfByte2[i + 1] = (byte)paramByte2;
    arrayOfByte2[i + 2] = (byte)paramByte3;
    this.size = i + 3;
  }
  
  public void add(byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4) {
    byte[] arrayOfByte1 = this.items;
    int i = this.size;
    byte[] arrayOfByte2 = arrayOfByte1;
    if (i + 3 >= arrayOfByte1.length)
      arrayOfByte2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfByte2[i] = (byte)paramByte1;
    arrayOfByte2[i + 1] = (byte)paramByte2;
    arrayOfByte2[i + 2] = (byte)paramByte3;
    arrayOfByte2[i + 3] = (byte)paramByte4;
    this.size = i + 4;
  }
  
  public void addAll(ByteArray paramByteArray) { addAll(paramByteArray.items, 0, paramByteArray.size); }
  
  public void addAll(ByteArray paramByteArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramByteArray.size) {
      addAll(paramByteArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramByteArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(byte... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
    byte[] arrayOfByte1 = this.items;
    int i = this.size + paramInt2;
    byte[] arrayOfByte2 = arrayOfByte1;
    if (i > arrayOfByte1.length)
      arrayOfByte2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfByte, paramInt1, arrayOfByte2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean contains(byte paramByte) {
    int i = this.size - 1;
    byte[] arrayOfByte = this.items;
    while (i >= 0) {
      if (arrayOfByte[i] == paramByte)
        return true; 
      i--;
    } 
    return false;
  }
  
  public byte[] ensureCapacity(int paramInt) {
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
    if (!(paramObject instanceof ByteArray))
      return false; 
    ByteArray byteArray = (ByteArray)paramObject;
    if (!byteArray.ordered)
      return false; 
    int i = this.size;
    if (i != byteArray.size)
      return false; 
    byte[] arrayOfByte1 = this.items;
    byte[] arrayOfByte2 = byteArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfByte1[b] != arrayOfByte2[b])
        return false; 
    } 
    return true;
  }
  
  public byte first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public byte get(int paramInt) {
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
    byte[] arrayOfByte = this.items;
    byte b = 0;
    int i = this.size;
    byte b1 = 1;
    while (b < i) {
      b1 = b1 * 31 + arrayOfByte[b];
      b++;
    } 
    return b1;
  }
  
  public void incr(int paramInt, byte paramByte) {
    if (paramInt < this.size) {
      byte[] arrayOfByte = this.items;
      arrayOfByte[paramInt] = (byte)(byte)(arrayOfByte[paramInt] + paramByte);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int indexOf(byte paramByte) {
    byte[] arrayOfByte = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfByte[b] == paramByte)
        return b; 
    } 
    return -1;
  }
  
  public void insert(int paramInt, byte paramByte) {
    int i = this.size;
    if (paramInt <= i) {
      byte[] arrayOfByte1 = this.items;
      byte[] arrayOfByte2 = arrayOfByte1;
      if (i == arrayOfByte1.length)
        arrayOfByte2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfByte2, paramInt, arrayOfByte2, paramInt + 1, this.size - paramInt);
      } else {
        arrayOfByte2[this.size] = (byte)arrayOfByte2[paramInt];
      } 
      this.size++;
      arrayOfByte2[paramInt] = (byte)paramByte;
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
  
  public int lastIndexOf(byte paramByte) {
    byte[] arrayOfByte = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      if (arrayOfByte[i] == paramByte)
        return i; 
    } 
    return -1;
  }
  
  public void mul(int paramInt, byte paramByte) {
    if (paramInt < this.size) {
      byte[] arrayOfByte = this.items;
      arrayOfByte[paramInt] = (byte)(byte)(arrayOfByte[paramInt] * paramByte);
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
  
  public byte peek() { return this.items[this.size - 1]; }
  
  public byte pop() {
    byte[] arrayOfByte = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfByte[i];
  }
  
  public byte random() {
    int i = this.size;
    return (i == 0) ? 0 : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(ByteArray paramByteArray) {
    int i = this.size;
    byte[] arrayOfByte = this.items;
    int j = paramByteArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int m;
      byte b1 = paramByteArray.get(b);
      byte b2 = 0;
      while (true) {
        m = k;
        if (b2 < k) {
          if (b1 == arrayOfByte[b2]) {
            removeIndex(b2);
            m = k - 1;
            break;
          } 
          b2++;
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
  
  public int removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      byte[] arrayOfByte = this.items;
      byte b = arrayOfByte[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfByte, paramInt + 1, arrayOfByte, paramInt, this.size - paramInt);
      } else {
        arrayOfByte[paramInt] = (byte)arrayOfByte[this.size];
      } 
      return b;
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
          byte[] arrayOfByte = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfByte, paramInt2, arrayOfByte, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          byte[] arrayOfByte = this.items;
          System.arraycopy(arrayOfByte, paramInt2, arrayOfByte, paramInt1, i - paramInt2);
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
  
  public boolean removeValue(byte paramByte) {
    byte[] arrayOfByte = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfByte[b] == paramByte) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected byte[] resize(int paramInt) {
    byte[] arrayOfByte = new byte[paramInt];
    System.arraycopy(this.items, 0, arrayOfByte, 0, Math.min(this.size, arrayOfByte.length));
    this.items = arrayOfByte;
    return arrayOfByte;
  }
  
  public void reverse() {
    byte[] arrayOfByte = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      byte b = arrayOfByte[k];
      arrayOfByte[k] = (byte)arrayOfByte[m];
      arrayOfByte[m] = (byte)b;
    } 
  }
  
  public void set(int paramInt, byte paramByte) {
    if (paramInt < this.size) {
      this.items[paramInt] = (byte)paramByte;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public byte[] setSize(int paramInt) {
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
  
  public byte[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    byte[] arrayOfByte = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      byte b = arrayOfByte[i];
      arrayOfByte[i] = (byte)arrayOfByte[j];
      arrayOfByte[j] = (byte)b;
    } 
  }
  
  public void sort() { Arrays.sort(this.items, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        byte[] arrayOfByte = this.items;
        i = arrayOfByte[paramInt1];
        arrayOfByte[paramInt1] = (byte)arrayOfByte[paramInt2];
        arrayOfByte[paramInt2] = (byte)i;
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
  
  public byte[] toArray() {
    int i = this.size;
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(this.items, 0, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    byte[] arrayOfByte = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfByte[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfByte[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    byte[] arrayOfByte = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfByte[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfByte[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ByteArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */