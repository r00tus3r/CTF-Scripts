package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;

public class BooleanArray {
  public boolean[] items;
  
  public boolean ordered;
  
  public int size;
  
  public BooleanArray() { this(true, 16); }
  
  public BooleanArray(int paramInt) { this(true, paramInt); }
  
  public BooleanArray(BooleanArray paramBooleanArray) {
    this.ordered = paramBooleanArray.ordered;
    this.size = paramBooleanArray.size;
    int i = this.size;
    this.items = new boolean[i];
    System.arraycopy(paramBooleanArray.items, 0, this.items, 0, i);
  }
  
  public BooleanArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new boolean[paramInt];
  }
  
  public BooleanArray(boolean paramBoolean, boolean[] paramArrayOfBoolean, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfBoolean, paramInt1, this.items, 0, paramInt2);
  }
  
  public BooleanArray(boolean[] paramArrayOfBoolean) { this(true, paramArrayOfBoolean, 0, paramArrayOfBoolean.length); }
  
  public static BooleanArray with(boolean... paramVarArgs) { return new BooleanArray(paramVarArgs); }
  
  public void add(boolean paramBoolean) {
    boolean[] arrayOfBoolean1 = this.items;
    int i = this.size;
    boolean[] arrayOfBoolean2 = arrayOfBoolean1;
    if (i == arrayOfBoolean1.length)
      arrayOfBoolean2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfBoolean2[i] = paramBoolean;
  }
  
  public void add(boolean paramBoolean1, boolean paramBoolean2) {
    boolean[] arrayOfBoolean1 = this.items;
    int i = this.size;
    boolean[] arrayOfBoolean2 = arrayOfBoolean1;
    if (i + 1 >= arrayOfBoolean1.length)
      arrayOfBoolean2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfBoolean2[i] = paramBoolean1;
    arrayOfBoolean2[i + 1] = paramBoolean2;
    this.size = i + 2;
  }
  
  public void add(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {
    boolean[] arrayOfBoolean1 = this.items;
    int i = this.size;
    boolean[] arrayOfBoolean2 = arrayOfBoolean1;
    if (i + 2 >= arrayOfBoolean1.length)
      arrayOfBoolean2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfBoolean2[i] = paramBoolean1;
    arrayOfBoolean2[i + 1] = paramBoolean2;
    arrayOfBoolean2[i + 2] = paramBoolean3;
    this.size = i + 3;
  }
  
  public void add(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4) {
    boolean[] arrayOfBoolean1 = this.items;
    int i = this.size;
    boolean[] arrayOfBoolean2 = arrayOfBoolean1;
    if (i + 3 >= arrayOfBoolean1.length)
      arrayOfBoolean2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfBoolean2[i] = paramBoolean1;
    arrayOfBoolean2[i + 1] = paramBoolean2;
    arrayOfBoolean2[i + 2] = paramBoolean3;
    arrayOfBoolean2[i + 3] = paramBoolean4;
    this.size = i + 4;
  }
  
  public void addAll(BooleanArray paramBooleanArray) { addAll(paramBooleanArray.items, 0, paramBooleanArray.size); }
  
  public void addAll(BooleanArray paramBooleanArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramBooleanArray.size) {
      addAll(paramBooleanArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramBooleanArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(boolean... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(boolean[] paramArrayOfBoolean, int paramInt1, int paramInt2) {
    boolean[] arrayOfBoolean1 = this.items;
    int i = this.size + paramInt2;
    boolean[] arrayOfBoolean2 = arrayOfBoolean1;
    if (i > arrayOfBoolean1.length)
      arrayOfBoolean2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfBoolean, paramInt1, arrayOfBoolean2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean[] ensureCapacity(int paramInt) {
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
    if (!(paramObject instanceof BooleanArray))
      return false; 
    BooleanArray booleanArray = (BooleanArray)paramObject;
    if (!booleanArray.ordered)
      return false; 
    int i = this.size;
    if (i != booleanArray.size)
      return false; 
    boolean[] arrayOfBoolean1 = this.items;
    boolean[] arrayOfBoolean2 = booleanArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfBoolean1[b] != arrayOfBoolean2[b])
        return false; 
    } 
    return true;
  }
  
  public boolean first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public boolean get(int paramInt) {
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
    boolean[] arrayOfBoolean = this.items;
    byte b = 0;
    int i = this.size;
    char c = '\001';
    while (b < i) {
      char c1;
      if (arrayOfBoolean[b]) {
        c1 = 'ӏ';
      } else {
        c1 = 'ӕ';
      } 
      c = c * 31 + c1;
      b++;
    } 
    return c;
  }
  
  public void insert(int paramInt, boolean paramBoolean) {
    int i = this.size;
    if (paramInt <= i) {
      boolean[] arrayOfBoolean1 = this.items;
      boolean[] arrayOfBoolean2 = arrayOfBoolean1;
      if (i == arrayOfBoolean1.length)
        arrayOfBoolean2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfBoolean2, paramInt, arrayOfBoolean2, paramInt + 1, this.size - paramInt);
      } else {
        arrayOfBoolean2[this.size] = arrayOfBoolean2[paramInt];
      } 
      this.size++;
      arrayOfBoolean2[paramInt] = paramBoolean;
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
  
  public boolean notEmpty() {
    boolean bool;
    if (this.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean peek() { return this.items[this.size - 1]; }
  
  public boolean pop() {
    boolean[] arrayOfBoolean = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfBoolean[i];
  }
  
  public boolean random() {
    int i = this.size;
    return (i == 0) ? false : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(BooleanArray paramBooleanArray) {
    int i = this.size;
    boolean[] arrayOfBoolean = this.items;
    int j = paramBooleanArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int m;
      boolean bool1 = paramBooleanArray.get(b);
      byte b1 = 0;
      while (true) {
        m = k;
        if (b1 < k) {
          if (bool1 == arrayOfBoolean[b1]) {
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
  
  public boolean removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      boolean[] arrayOfBoolean = this.items;
      boolean bool = arrayOfBoolean[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfBoolean, paramInt + 1, arrayOfBoolean, paramInt, this.size - paramInt);
      } else {
        arrayOfBoolean[paramInt] = arrayOfBoolean[this.size];
      } 
      return bool;
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
          boolean[] arrayOfBoolean = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfBoolean, paramInt2, arrayOfBoolean, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          boolean[] arrayOfBoolean = this.items;
          System.arraycopy(arrayOfBoolean, paramInt2, arrayOfBoolean, paramInt1, i - paramInt2);
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
  
  protected boolean[] resize(int paramInt) {
    boolean[] arrayOfBoolean = new boolean[paramInt];
    System.arraycopy(this.items, 0, arrayOfBoolean, 0, Math.min(this.size, arrayOfBoolean.length));
    this.items = arrayOfBoolean;
    return arrayOfBoolean;
  }
  
  public void reverse() {
    boolean[] arrayOfBoolean = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      boolean bool = arrayOfBoolean[k];
      arrayOfBoolean[k] = arrayOfBoolean[m];
      arrayOfBoolean[m] = bool;
    } 
  }
  
  public void set(int paramInt, boolean paramBoolean) {
    if (paramInt < this.size) {
      this.items[paramInt] = paramBoolean;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public boolean[] setSize(int paramInt) {
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
  
  public boolean[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    boolean[] arrayOfBoolean = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      boolean bool = arrayOfBoolean[i];
      arrayOfBoolean[i] = arrayOfBoolean[j];
      arrayOfBoolean[j] = bool;
    } 
  }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        boolean[] arrayOfBoolean = this.items;
        boolean bool = arrayOfBoolean[paramInt1];
        arrayOfBoolean[paramInt1] = arrayOfBoolean[paramInt2];
        arrayOfBoolean[paramInt2] = bool;
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
  
  public boolean[] toArray() {
    int i = this.size;
    boolean[] arrayOfBoolean = new boolean[i];
    System.arraycopy(this.items, 0, arrayOfBoolean, 0, i);
    return arrayOfBoolean;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    boolean[] arrayOfBoolean = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfBoolean[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfBoolean[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    boolean[] arrayOfBoolean = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfBoolean[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfBoolean[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/BooleanArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */