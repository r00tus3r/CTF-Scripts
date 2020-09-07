package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class IntArray {
  public int[] items;
  
  public boolean ordered;
  
  public int size;
  
  public IntArray() { this(true, 16); }
  
  public IntArray(int paramInt) { this(true, paramInt); }
  
  public IntArray(IntArray paramIntArray) {
    this.ordered = paramIntArray.ordered;
    this.size = paramIntArray.size;
    int i = this.size;
    this.items = new int[i];
    System.arraycopy(paramIntArray.items, 0, this.items, 0, i);
  }
  
  public IntArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new int[paramInt];
  }
  
  public IntArray(boolean paramBoolean, int[] paramArrayOfInt, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfInt, paramInt1, this.items, 0, paramInt2);
  }
  
  public IntArray(int[] paramArrayOfInt) { this(true, paramArrayOfInt, 0, paramArrayOfInt.length); }
  
  public static IntArray with(int... paramVarArgs) { return new IntArray(paramVarArgs); }
  
  public void add(int paramInt) {
    int[] arrayOfInt1 = this.items;
    int i = this.size;
    int[] arrayOfInt2 = arrayOfInt1;
    if (i == arrayOfInt1.length)
      arrayOfInt2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfInt2[i] = paramInt;
  }
  
  public void add(int paramInt1, int paramInt2) {
    int[] arrayOfInt1 = this.items;
    int i = this.size;
    int[] arrayOfInt2 = arrayOfInt1;
    if (i + 1 >= arrayOfInt1.length)
      arrayOfInt2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfInt2[i] = paramInt1;
    arrayOfInt2[i + 1] = paramInt2;
    this.size = i + 2;
  }
  
  public void add(int paramInt1, int paramInt2, int paramInt3) {
    int[] arrayOfInt1 = this.items;
    int i = this.size;
    int[] arrayOfInt2 = arrayOfInt1;
    if (i + 2 >= arrayOfInt1.length)
      arrayOfInt2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfInt2[i] = paramInt1;
    arrayOfInt2[i + 1] = paramInt2;
    arrayOfInt2[i + 2] = paramInt3;
    this.size = i + 3;
  }
  
  public void add(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    int[] arrayOfInt1 = this.items;
    int i = this.size;
    int[] arrayOfInt2 = arrayOfInt1;
    if (i + 3 >= arrayOfInt1.length)
      arrayOfInt2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfInt2[i] = paramInt1;
    arrayOfInt2[i + 1] = paramInt2;
    arrayOfInt2[i + 2] = paramInt3;
    arrayOfInt2[i + 3] = paramInt4;
    this.size = i + 4;
  }
  
  public void addAll(IntArray paramIntArray) { addAll(paramIntArray.items, 0, paramIntArray.size); }
  
  public void addAll(IntArray paramIntArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramIntArray.size) {
      addAll(paramIntArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramIntArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(int... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(int[] paramArrayOfInt, int paramInt1, int paramInt2) {
    int[] arrayOfInt1 = this.items;
    int i = this.size + paramInt2;
    int[] arrayOfInt2 = arrayOfInt1;
    if (i > arrayOfInt1.length)
      arrayOfInt2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfInt, paramInt1, arrayOfInt2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean contains(int paramInt) {
    int i = this.size - 1;
    int[] arrayOfInt = this.items;
    while (i >= 0) {
      if (arrayOfInt[i] == paramInt)
        return true; 
      i--;
    } 
    return false;
  }
  
  public int[] ensureCapacity(int paramInt) {
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
    if (!(paramObject instanceof IntArray))
      return false; 
    IntArray intArray = (IntArray)paramObject;
    if (!intArray.ordered)
      return false; 
    int i = this.size;
    if (i != intArray.size)
      return false; 
    int[] arrayOfInt1 = this.items;
    int[] arrayOfInt2 = intArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfInt1[b] != arrayOfInt2[b])
        return false; 
    } 
    return true;
  }
  
  public int first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public int get(int paramInt) {
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
    int[] arrayOfInt = this.items;
    byte b = 0;
    int i = this.size;
    int j = 1;
    while (b < i) {
      j = j * 31 + arrayOfInt[b];
      b++;
    } 
    return j;
  }
  
  public void incr(int paramInt1, int paramInt2) {
    if (paramInt1 < this.size) {
      int[] arrayOfInt = this.items;
      arrayOfInt[paramInt1] = arrayOfInt[paramInt1] + paramInt2;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int indexOf(int paramInt) {
    int[] arrayOfInt = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfInt[b] == paramInt)
        return b; 
    } 
    return -1;
  }
  
  public void insert(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 <= i) {
      int[] arrayOfInt1 = this.items;
      int[] arrayOfInt2 = arrayOfInt1;
      if (i == arrayOfInt1.length)
        arrayOfInt2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfInt2, paramInt1, arrayOfInt2, paramInt1 + 1, this.size - paramInt1);
      } else {
        arrayOfInt2[this.size] = arrayOfInt2[paramInt1];
      } 
      this.size++;
      arrayOfInt2[paramInt1] = paramInt2;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be > size: ");
    stringBuilder.append(paramInt1);
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
  
  public int lastIndexOf(int paramInt) {
    int[] arrayOfInt = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      if (arrayOfInt[i] == paramInt)
        return i; 
    } 
    return -1;
  }
  
  public void mul(int paramInt1, int paramInt2) {
    if (paramInt1 < this.size) {
      int[] arrayOfInt = this.items;
      arrayOfInt[paramInt1] = arrayOfInt[paramInt1] * paramInt2;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt1);
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
  
  public int peek() { return this.items[this.size - 1]; }
  
  public int pop() {
    int[] arrayOfInt = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfInt[i];
  }
  
  public int random() {
    int i = this.size;
    return (i == 0) ? 0 : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(IntArray paramIntArray) {
    int i = this.size;
    int[] arrayOfInt = this.items;
    int j = paramIntArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int n;
      int m = paramIntArray.get(b);
      byte b1 = 0;
      while (true) {
        n = k;
        if (b1 < k) {
          if (m == arrayOfInt[b1]) {
            removeIndex(b1);
            n = k - 1;
            break;
          } 
          b1++;
          continue;
        } 
        break;
      } 
      b++;
      k = n;
    } 
    if (k != i)
      bool = true; 
    return bool;
  }
  
  public int removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      int[] arrayOfInt = this.items;
      int j = arrayOfInt[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfInt, paramInt + 1, arrayOfInt, paramInt, this.size - paramInt);
      } else {
        arrayOfInt[paramInt] = arrayOfInt[this.size];
      } 
      return j;
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
          int[] arrayOfInt = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfInt, paramInt2, arrayOfInt, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          int[] arrayOfInt = this.items;
          System.arraycopy(arrayOfInt, paramInt2, arrayOfInt, paramInt1, i - paramInt2);
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
  
  public boolean removeValue(int paramInt) {
    int[] arrayOfInt = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfInt[b] == paramInt) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected int[] resize(int paramInt) {
    int[] arrayOfInt = new int[paramInt];
    System.arraycopy(this.items, 0, arrayOfInt, 0, Math.min(this.size, arrayOfInt.length));
    this.items = arrayOfInt;
    return arrayOfInt;
  }
  
  public void reverse() {
    int[] arrayOfInt = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      int n = arrayOfInt[k];
      arrayOfInt[k] = arrayOfInt[m];
      arrayOfInt[m] = n;
    } 
  }
  
  public void set(int paramInt1, int paramInt2) {
    if (paramInt1 < this.size) {
      this.items[paramInt1] = paramInt2;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int[] setSize(int paramInt) {
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
  
  public int[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    int[] arrayOfInt = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      int k = arrayOfInt[i];
      arrayOfInt[i] = arrayOfInt[j];
      arrayOfInt[j] = k;
    } 
  }
  
  public void sort() { Arrays.sort(this.items, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        int[] arrayOfInt = this.items;
        i = arrayOfInt[paramInt1];
        arrayOfInt[paramInt1] = arrayOfInt[paramInt2];
        arrayOfInt[paramInt2] = i;
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
  
  public int[] toArray() {
    int i = this.size;
    int[] arrayOfInt = new int[i];
    System.arraycopy(this.items, 0, arrayOfInt, 0, i);
    return arrayOfInt;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    int[] arrayOfInt = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfInt[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfInt[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    int[] arrayOfInt = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfInt[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfInt[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/IntArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */