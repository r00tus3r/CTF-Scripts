package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class FloatArray {
  public float[] items;
  
  public boolean ordered;
  
  public int size;
  
  public FloatArray() { this(true, 16); }
  
  public FloatArray(int paramInt) { this(true, paramInt); }
  
  public FloatArray(FloatArray paramFloatArray) {
    this.ordered = paramFloatArray.ordered;
    this.size = paramFloatArray.size;
    int i = this.size;
    this.items = new float[i];
    System.arraycopy(paramFloatArray.items, 0, this.items, 0, i);
  }
  
  public FloatArray(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = new float[paramInt];
  }
  
  public FloatArray(boolean paramBoolean, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2);
    this.size = paramInt2;
    System.arraycopy(paramArrayOfFloat, paramInt1, this.items, 0, paramInt2);
  }
  
  public FloatArray(float[] paramArrayOfFloat) { this(true, paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public static FloatArray with(float... paramVarArgs) { return new FloatArray(paramVarArgs); }
  
  public void add(float paramFloat) {
    float[] arrayOfFloat1 = this.items;
    int i = this.size;
    float[] arrayOfFloat2 = arrayOfFloat1;
    if (i == arrayOfFloat1.length)
      arrayOfFloat2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfFloat2[i] = paramFloat;
  }
  
  public void add(float paramFloat1, float paramFloat2) {
    float[] arrayOfFloat1 = this.items;
    int i = this.size;
    float[] arrayOfFloat2 = arrayOfFloat1;
    if (i + 1 >= arrayOfFloat1.length)
      arrayOfFloat2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfFloat2[i] = paramFloat1;
    arrayOfFloat2[i + 1] = paramFloat2;
    this.size = i + 2;
  }
  
  public void add(float paramFloat1, float paramFloat2, float paramFloat3) {
    float[] arrayOfFloat1 = this.items;
    int i = this.size;
    float[] arrayOfFloat2 = arrayOfFloat1;
    if (i + 2 >= arrayOfFloat1.length)
      arrayOfFloat2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfFloat2[i] = paramFloat1;
    arrayOfFloat2[i + 1] = paramFloat2;
    arrayOfFloat2[i + 2] = paramFloat3;
    this.size = i + 3;
  }
  
  public void add(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    float[] arrayOfFloat1 = this.items;
    int i = this.size;
    float[] arrayOfFloat2 = arrayOfFloat1;
    if (i + 3 >= arrayOfFloat1.length)
      arrayOfFloat2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfFloat2[i] = paramFloat1;
    arrayOfFloat2[i + 1] = paramFloat2;
    arrayOfFloat2[i + 2] = paramFloat3;
    arrayOfFloat2[i + 3] = paramFloat4;
    this.size = i + 4;
  }
  
  public void addAll(FloatArray paramFloatArray) { addAll(paramFloatArray.items, 0, paramFloatArray.size); }
  
  public void addAll(FloatArray paramFloatArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramFloatArray.size) {
      addAll(paramFloatArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramFloatArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(float... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    float[] arrayOfFloat1 = this.items;
    int i = this.size + paramInt2;
    float[] arrayOfFloat2 = arrayOfFloat1;
    if (i > arrayOfFloat1.length)
      arrayOfFloat2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfFloat, paramInt1, arrayOfFloat2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() { this.size = 0; }
  
  public boolean contains(float paramFloat) {
    int i = this.size - 1;
    float[] arrayOfFloat = this.items;
    while (i >= 0) {
      if (arrayOfFloat[i] == paramFloat)
        return true; 
      i--;
    } 
    return false;
  }
  
  public float[] ensureCapacity(int paramInt) {
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
    if (!(paramObject instanceof FloatArray))
      return false; 
    FloatArray floatArray = (FloatArray)paramObject;
    if (!floatArray.ordered)
      return false; 
    int i = this.size;
    if (i != floatArray.size)
      return false; 
    float[] arrayOfFloat1 = this.items;
    float[] arrayOfFloat2 = floatArray.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfFloat1[b] != arrayOfFloat2[b])
        return false; 
    } 
    return true;
  }
  
  public boolean equals(Object paramObject, float paramFloat) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof FloatArray))
      return false; 
    FloatArray floatArray = (FloatArray)paramObject;
    int i = this.size;
    if (i != floatArray.size)
      return false; 
    if (!this.ordered)
      return false; 
    if (!floatArray.ordered)
      return false; 
    float[] arrayOfFloat1 = this.items;
    float[] arrayOfFloat2 = floatArray.items;
    for (byte b = 0; b < i; b++) {
      if (Math.abs(arrayOfFloat1[b] - arrayOfFloat2[b]) > paramFloat)
        return false; 
    } 
    return true;
  }
  
  public float first() {
    if (this.size != 0)
      return this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public float get(int paramInt) {
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
    float[] arrayOfFloat = this.items;
    byte b = 0;
    int i = this.size;
    int j = 1;
    while (b < i) {
      j = j * 31 + Float.floatToIntBits(arrayOfFloat[b]);
      b++;
    } 
    return j;
  }
  
  public void incr(int paramInt, float paramFloat) {
    if (paramInt < this.size) {
      float[] arrayOfFloat = this.items;
      arrayOfFloat[paramInt] = arrayOfFloat[paramInt] + paramFloat;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int indexOf(float paramFloat) {
    float[] arrayOfFloat = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfFloat[b] == paramFloat)
        return b; 
    } 
    return -1;
  }
  
  public void insert(int paramInt, float paramFloat) {
    int i = this.size;
    if (paramInt <= i) {
      float[] arrayOfFloat1 = this.items;
      float[] arrayOfFloat2 = arrayOfFloat1;
      if (i == arrayOfFloat1.length)
        arrayOfFloat2 = resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        System.arraycopy(arrayOfFloat2, paramInt, arrayOfFloat2, paramInt + 1, this.size - paramInt);
      } else {
        arrayOfFloat2[this.size] = arrayOfFloat2[paramInt];
      } 
      this.size++;
      arrayOfFloat2[paramInt] = paramFloat;
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
    float[] arrayOfFloat = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      if (arrayOfFloat[i] == paramChar)
        return i; 
    } 
    return -1;
  }
  
  public void mul(int paramInt, float paramFloat) {
    if (paramInt < this.size) {
      float[] arrayOfFloat = this.items;
      arrayOfFloat[paramInt] = arrayOfFloat[paramInt] * paramFloat;
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
  
  public float peek() { return this.items[this.size - 1]; }
  
  public float pop() {
    float[] arrayOfFloat = this.items;
    int i = this.size - 1;
    this.size = i;
    return arrayOfFloat[i];
  }
  
  public float random() {
    int i = this.size;
    return (i == 0) ? 0.0F : this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(FloatArray paramFloatArray) {
    int i = this.size;
    float[] arrayOfFloat = this.items;
    int j = paramFloatArray.size;
    boolean bool = false;
    int k = i;
    byte b = 0;
    while (b < j) {
      int m;
      float f = paramFloatArray.get(b);
      byte b1 = 0;
      while (true) {
        m = k;
        if (b1 < k) {
          if (f == arrayOfFloat[b1]) {
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
  
  public float removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      float[] arrayOfFloat = this.items;
      float f = arrayOfFloat[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfFloat, paramInt + 1, arrayOfFloat, paramInt, this.size - paramInt);
      } else {
        arrayOfFloat[paramInt] = arrayOfFloat[this.size];
      } 
      return f;
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
          float[] arrayOfFloat = this.items;
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfFloat, paramInt2, arrayOfFloat, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          float[] arrayOfFloat = this.items;
          System.arraycopy(arrayOfFloat, paramInt2, arrayOfFloat, paramInt1, i - paramInt2);
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
  
  public boolean removeValue(float paramFloat) {
    float[] arrayOfFloat = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (arrayOfFloat[b] == paramFloat) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected float[] resize(int paramInt) {
    float[] arrayOfFloat = new float[paramInt];
    System.arraycopy(this.items, 0, arrayOfFloat, 0, Math.min(this.size, arrayOfFloat.length));
    this.items = arrayOfFloat;
    return arrayOfFloat;
  }
  
  public void reverse() {
    float[] arrayOfFloat = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      float f = arrayOfFloat[k];
      arrayOfFloat[k] = arrayOfFloat[m];
      arrayOfFloat[m] = f;
    } 
  }
  
  public void set(int paramInt, float paramFloat) {
    if (paramInt < this.size) {
      this.items[paramInt] = paramFloat;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public float[] setSize(int paramInt) {
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
  
  public float[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return this.items;
  }
  
  public void shuffle() {
    float[] arrayOfFloat = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      float f = arrayOfFloat[i];
      arrayOfFloat[i] = arrayOfFloat[j];
      arrayOfFloat[j] = f;
    } 
  }
  
  public void sort() { Arrays.sort(this.items, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        float[] arrayOfFloat = this.items;
        float f = arrayOfFloat[paramInt1];
        arrayOfFloat[paramInt1] = arrayOfFloat[paramInt2];
        arrayOfFloat[paramInt2] = f;
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
  
  public float[] toArray() {
    int i = this.size;
    float[] arrayOfFloat = new float[i];
    System.arraycopy(this.items, 0, arrayOfFloat, 0, i);
    return arrayOfFloat;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    float[] arrayOfFloat = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfFloat[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfFloat[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    float[] arrayOfFloat = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfFloat[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfFloat[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size > paramInt)
      this.size = paramInt; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/FloatArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */