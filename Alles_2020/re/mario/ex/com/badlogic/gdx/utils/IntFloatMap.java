package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IntFloatMap extends Object implements Iterable<IntFloatMap.Entry> {
  private static final int EMPTY = 0;
  
  private static final int PRIME1 = -1105259343;
  
  private static final int PRIME2 = -1262997959;
  
  private static final int PRIME3 = -825114047;
  
  int capacity;
  
  private Entries entries1;
  
  private Entries entries2;
  
  boolean hasZeroValue;
  
  private int hashShift;
  
  int[] keyTable;
  
  private Keys keys1;
  
  private Keys keys2;
  
  private float loadFactor;
  
  private int mask;
  
  private int pushIterations;
  
  public int size;
  
  private int stashCapacity;
  
  int stashSize;
  
  private int threshold;
  
  float[] valueTable;
  
  private Values values1;
  
  private Values values2;
  
  float zeroValue;
  
  public IntFloatMap() { this(51, 0.8F); }
  
  public IntFloatMap(int paramInt) { this(paramInt, 0.8F); }
  
  public IntFloatMap(int paramInt, float paramFloat) {
    if (paramInt >= 0) {
      paramInt = MathUtils.nextPowerOfTwo((int)Math.ceil((paramInt / paramFloat)));
      if (paramInt <= 1073741824) {
        this.capacity = paramInt;
        if (paramFloat > 0.0F) {
          this.loadFactor = paramFloat;
          paramInt = this.capacity;
          this.threshold = (int)(paramInt * paramFloat);
          this.mask = paramInt - 1;
          this.hashShift = 31 - Integer.numberOfTrailingZeros(paramInt);
          this.stashCapacity = Math.max(3, (int)Math.ceil(Math.log(this.capacity)) * 2);
          this.pushIterations = Math.max(Math.min(this.capacity, 8), (int)Math.sqrt(this.capacity) / 8);
          this.keyTable = new int[this.capacity + this.stashCapacity];
          this.valueTable = new float[this.keyTable.length];
          return;
        } 
        java.lang.StringBuilder stringBuilder2 = new java.lang.StringBuilder();
        stringBuilder2.append("loadFactor must be > 0: ");
        stringBuilder2.append(paramFloat);
        throw new IllegalArgumentException(stringBuilder2.toString());
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("initialCapacity is too large: ");
      stringBuilder1.append(paramInt);
      throw new IllegalArgumentException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("initialCapacity must be >= 0: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public IntFloatMap(IntFloatMap paramIntFloatMap) {
    this((int)Math.floor((paramIntFloatMap.capacity * paramIntFloatMap.loadFactor)), paramIntFloatMap.loadFactor);
    this.stashSize = paramIntFloatMap.stashSize;
    int[] arrayOfInt = paramIntFloatMap.keyTable;
    System.arraycopy(arrayOfInt, 0, this.keyTable, 0, arrayOfInt.length);
    float[] arrayOfFloat = paramIntFloatMap.valueTable;
    System.arraycopy(arrayOfFloat, 0, this.valueTable, 0, arrayOfFloat.length);
    this.size = paramIntFloatMap.size;
    this.zeroValue = paramIntFloatMap.zeroValue;
    this.hasZeroValue = paramIntFloatMap.hasZeroValue;
  }
  
  private boolean containsKeyStash(int paramInt) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt == arrayOfInt[k])
        return true; 
    } 
    return false;
  }
  
  private float getAndIncrementStash(int paramInt, float paramFloat1, float paramFloat2) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt == arrayOfInt[k]) {
        float[] arrayOfFloat = this.valueTable;
        paramFloat1 = arrayOfFloat[k];
        arrayOfFloat[k] = paramFloat2 + paramFloat1;
        return paramFloat1;
      } 
    } 
    put(paramInt, paramFloat2 + paramFloat1);
    return paramFloat1;
  }
  
  private float getStash(int paramInt, float paramFloat) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt == arrayOfInt[k])
        return this.valueTable[k]; 
    } 
    return paramFloat;
  }
  
  private int hash2(int paramInt) {
    paramInt *= -1262997959;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private int hash3(int paramInt) {
    paramInt *= -825114047;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private void push(int paramInt1, float paramFloat, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7) {
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = 0;
    int m = paramInt2;
    float f = paramFloat;
    int n = paramInt1;
    paramInt2 = k;
    do {
      paramInt1 = MathUtils.random(2);
      if (paramInt1 != 0) {
        if (paramInt1 != 1) {
          paramFloat = arrayOfFloat[paramInt6];
          arrayOfInt[paramInt6] = n;
          arrayOfFloat[paramInt6] = f;
          paramInt1 = paramInt7;
        } else {
          paramFloat = arrayOfFloat[paramInt4];
          arrayOfInt[paramInt4] = n;
          arrayOfFloat[paramInt4] = f;
          paramInt1 = paramInt5;
        } 
      } else {
        paramFloat = arrayOfFloat[m];
        arrayOfInt[m] = n;
        arrayOfFloat[m] = f;
        paramInt1 = paramInt3;
      } 
      m = paramInt1 & i;
      paramInt3 = arrayOfInt[m];
      if (paramInt3 == 0) {
        arrayOfInt[m] = paramInt1;
        arrayOfFloat[m] = paramFloat;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt4 = hash2(paramInt1);
      paramInt5 = arrayOfInt[paramInt4];
      if (paramInt5 == 0) {
        arrayOfInt[paramInt4] = paramInt1;
        arrayOfFloat[paramInt4] = paramFloat;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt6 = hash3(paramInt1);
      paramInt7 = arrayOfInt[paramInt6];
      if (paramInt7 == 0) {
        arrayOfInt[paramInt6] = paramInt1;
        arrayOfFloat[paramInt6] = paramFloat;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      k = paramInt2 + 1;
      paramInt2 = k;
      n = paramInt1;
      f = paramFloat;
    } while (k != j);
    putStash(paramInt1, paramFloat);
  }
  
  private void putResize(int paramInt, float paramFloat) {
    if (paramInt == 0) {
      this.zeroValue = paramFloat;
      this.hasZeroValue = true;
      return;
    } 
    int i = paramInt & this.mask;
    int[] arrayOfInt = this.keyTable;
    int j = arrayOfInt[i];
    if (j == 0) {
      arrayOfInt[i] = paramInt;
      this.valueTable[i] = paramFloat;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int k = hash2(paramInt);
    arrayOfInt = this.keyTable;
    int m = arrayOfInt[k];
    if (m == 0) {
      arrayOfInt[k] = paramInt;
      this.valueTable[k] = paramFloat;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int n = hash3(paramInt);
    arrayOfInt = this.keyTable;
    int i1 = arrayOfInt[n];
    if (i1 == 0) {
      arrayOfInt[n] = paramInt;
      this.valueTable[n] = paramFloat;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramInt, paramFloat, i, j, k, m, n, i1);
  }
  
  private void putStash(int paramInt, float paramFloat) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramInt, paramFloat);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramInt;
    this.valueTable[j] = paramFloat;
    this.stashSize = i + 1;
    this.size++;
  }
  
  private void resize(int paramInt) {
    int i = this.capacity;
    int j = this.stashSize;
    this.capacity = paramInt;
    this.threshold = (int)(paramInt * this.loadFactor);
    this.mask = paramInt - 1;
    this.hashShift = 31 - Integer.numberOfTrailingZeros(paramInt);
    double d = paramInt;
    this.stashCapacity = Math.max(3, (int)Math.ceil(Math.log(d)) * 2);
    this.pushIterations = Math.max(Math.min(paramInt, 8), (int)Math.sqrt(d) / 8);
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = new int[paramInt + k];
    this.valueTable = new float[paramInt + k];
    k = this.size;
    this.size = this.hasZeroValue;
    paramInt = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        k = arrayOfInt[paramInt];
        if (k != 0)
          putResize(k, arrayOfFloat[paramInt]); 
        paramInt++;
      }  
  }
  
  public void clear() {
    if (this.size == 0)
      return; 
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        arrayOfInt[j] = 0;
        i = j;
        continue;
      } 
      break;
    } 
    this.hasZeroValue = false;
    this.size = 0;
    this.stashSize = 0;
  }
  
  public void clear(int paramInt) {
    if (this.capacity <= paramInt) {
      clear();
      return;
    } 
    this.hasZeroValue = false;
    this.size = 0;
    resize(paramInt);
  }
  
  public boolean containsKey(int paramInt) {
    if (paramInt == 0)
      return this.hasZeroValue; 
    int i = this.mask;
    if (this.keyTable[i & paramInt] != paramInt) {
      i = hash2(paramInt);
      if (this.keyTable[i] != paramInt) {
        i = hash3(paramInt);
        if (this.keyTable[i] != paramInt)
          return containsKeyStash(paramInt); 
      } 
    } 
    return true;
  }
  
  public boolean containsValue(float paramFloat) {
    if (this.hasZeroValue && this.zeroValue == paramFloat)
      return true; 
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfInt[j] != 0 && arrayOfFloat[j] == paramFloat)
          return true; 
        i = j;
        continue;
      } 
      break;
    } 
    return false;
  }
  
  public boolean containsValue(float paramFloat1, float paramFloat2) {
    if (this.hasZeroValue && Math.abs(this.zeroValue - paramFloat1) <= paramFloat2)
      return true; 
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (Math.abs(arrayOfFloat[j] - paramFloat1) <= paramFloat2)
          return true; 
        i = j;
        continue;
      } 
      break;
    } 
    return false;
  }
  
  public void ensureCapacity(int paramInt) {
    if (paramInt >= 0) {
      paramInt = this.size + paramInt;
      if (paramInt >= this.threshold)
        resize(MathUtils.nextPowerOfTwo((int)Math.ceil((paramInt / this.loadFactor)))); 
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("additionalCapacity must be >= 0: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Entries entries() {
    if (Collections.allocateIterators)
      return new Entries(this); 
    if (this.entries1 == null) {
      this.entries1 = new Entries(this);
      this.entries2 = new Entries(this);
    } 
    if (!this.entries1.valid) {
      this.entries1.reset();
      Entries entries3 = this.entries1;
      entries3.valid = true;
      this.entries2.valid = false;
      return entries3;
    } 
    this.entries2.reset();
    Entries entries = this.entries2;
    entries.valid = true;
    this.entries1.valid = false;
    return entries;
  }
  
  public boolean equals(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof IntFloatMap))
      return false; 
    IntFloatMap intFloatMap = (IntFloatMap)paramObject;
    if (intFloatMap.size != this.size)
      return false; 
    boolean bool1 = intFloatMap.hasZeroValue;
    boolean bool2 = this.hasZeroValue;
    if (bool1 != bool2)
      return false; 
    if (bool2 && intFloatMap.zeroValue != this.zeroValue)
      return false; 
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      int k = arrayOfInt[b];
      if (k != 0) {
        float f = intFloatMap.get(k, 0.0F);
        if (f == 0.0F && !intFloatMap.containsKey(k))
          return false; 
        if (f != arrayOfFloat[b])
          return false; 
      } 
    } 
    return true;
  }
  
  public int findKey(float paramFloat, int paramInt) {
    if (this.hasZeroValue && this.zeroValue == paramFloat)
      return 0; 
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfInt[j] != 0 && arrayOfFloat[j] == paramFloat)
          return arrayOfInt[j]; 
        i = j;
        continue;
      } 
      break;
    } 
    return paramInt;
  }
  
  public float get(int paramInt, float paramFloat) {
    if (paramInt == 0)
      return !this.hasZeroValue ? paramFloat : this.zeroValue; 
    int i = this.mask & paramInt;
    int j = i;
    if (this.keyTable[i] != paramInt) {
      i = hash2(paramInt);
      j = i;
      if (this.keyTable[i] != paramInt) {
        i = hash3(paramInt);
        j = i;
        if (this.keyTable[i] != paramInt)
          return getStash(paramInt, paramFloat); 
      } 
    } 
    return this.valueTable[j];
  }
  
  public float getAndIncrement(int paramInt, float paramFloat1, float paramFloat2) {
    if (paramInt == 0) {
      if (this.hasZeroValue) {
        paramFloat1 = this.zeroValue;
        this.zeroValue = paramFloat2 + paramFloat1;
        return paramFloat1;
      } 
      this.hasZeroValue = true;
      this.zeroValue = paramFloat2 + paramFloat1;
      this.size++;
      return paramFloat1;
    } 
    int i = this.mask & paramInt;
    int j = i;
    if (paramInt != this.keyTable[i]) {
      i = hash2(paramInt);
      j = i;
      if (paramInt != this.keyTable[i]) {
        i = hash3(paramInt);
        j = i;
        if (paramInt != this.keyTable[i])
          return getAndIncrementStash(paramInt, paramFloat1, paramFloat2); 
      } 
    } 
    float[] arrayOfFloat = this.valueTable;
    paramFloat1 = arrayOfFloat[j];
    arrayOfFloat[j] = paramFloat2 + paramFloat1;
    return paramFloat1;
  }
  
  public int hashCode() {
    int i;
    boolean bool = this.hasZeroValue;
    byte b = 0;
    if (bool) {
      i = Float.floatToIntBits(this.zeroValue) + 0;
    } else {
      i = 0;
    } 
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int j = this.capacity;
    int k = this.stashSize;
    int m;
    for (m = i; b < j + k; m = i) {
      int n = arrayOfInt[b];
      i = m;
      if (n != 0)
        i = m + n * 31 + Float.floatToIntBits(arrayOfFloat[b]); 
      b++;
    } 
    return m;
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
  
  public Iterator<Entry> iterator() { return entries(); }
  
  public Keys keys() {
    if (Collections.allocateIterators)
      return new Keys(this); 
    if (this.keys1 == null) {
      this.keys1 = new Keys(this);
      this.keys2 = new Keys(this);
    } 
    if (!this.keys1.valid) {
      this.keys1.reset();
      Keys keys3 = this.keys1;
      keys3.valid = true;
      this.keys2.valid = false;
      return keys3;
    } 
    this.keys2.reset();
    Keys keys = this.keys2;
    keys.valid = true;
    this.keys1.valid = false;
    return keys;
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
  
  public void put(int paramInt, float paramFloat) {
    if (paramInt == 0) {
      this.zeroValue = paramFloat;
      if (!this.hasZeroValue) {
        this.hasZeroValue = true;
        this.size++;
      } 
      return;
    } 
    int[] arrayOfInt = this.keyTable;
    int i = paramInt & this.mask;
    int j = arrayOfInt[i];
    if (paramInt == j) {
      this.valueTable[i] = paramFloat;
      return;
    } 
    int k = hash2(paramInt);
    int m = arrayOfInt[k];
    if (paramInt == m) {
      this.valueTable[k] = paramFloat;
      return;
    } 
    int n = hash3(paramInt);
    int i1 = arrayOfInt[n];
    if (paramInt == i1) {
      this.valueTable[n] = paramFloat;
      return;
    } 
    int i2 = this.capacity;
    int i3 = this.stashSize;
    for (int i4 = i2; i4 < i3 + i2; i4++) {
      if (paramInt == arrayOfInt[i4]) {
        this.valueTable[i4] = paramFloat;
        return;
      } 
    } 
    if (j == 0) {
      arrayOfInt[i] = paramInt;
      this.valueTable[i] = paramFloat;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    if (m == 0) {
      arrayOfInt[k] = paramInt;
      this.valueTable[k] = paramFloat;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    if (i1 == 0) {
      arrayOfInt[n] = paramInt;
      this.valueTable[n] = paramFloat;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramInt, paramFloat, i, j, k, m, n, i1);
  }
  
  public void putAll(IntFloatMap paramIntFloatMap) {
    for (Entry entry : paramIntFloatMap.entries())
      put(entry.key, entry.value); 
  }
  
  public float remove(int paramInt, float paramFloat) {
    if (paramInt == 0) {
      if (!this.hasZeroValue)
        return paramFloat; 
      this.hasZeroValue = false;
      this.size--;
      return this.zeroValue;
    } 
    int i = this.mask & paramInt;
    int[] arrayOfInt = this.keyTable;
    if (paramInt == arrayOfInt[i]) {
      arrayOfInt[i] = 0;
      paramFloat = this.valueTable[i];
      this.size--;
      return paramFloat;
    } 
    i = hash2(paramInt);
    arrayOfInt = this.keyTable;
    if (paramInt == arrayOfInt[i]) {
      arrayOfInt[i] = 0;
      paramFloat = this.valueTable[i];
      this.size--;
      return paramFloat;
    } 
    i = hash3(paramInt);
    arrayOfInt = this.keyTable;
    if (paramInt == arrayOfInt[i]) {
      arrayOfInt[i] = 0;
      paramFloat = this.valueTable[i];
      this.size--;
      return paramFloat;
    } 
    return removeStash(paramInt, paramFloat);
  }
  
  float removeStash(int paramInt, float paramFloat) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt == arrayOfInt[k]) {
        paramFloat = this.valueTable[k];
        removeStashIndex(k);
        this.size--;
        return paramFloat;
      } 
    } 
    return paramFloat;
  }
  
  void removeStashIndex(int paramInt) {
    this.stashSize--;
    int i = this.capacity + this.stashSize;
    if (paramInt < i) {
      int[] arrayOfInt = this.keyTable;
      arrayOfInt[paramInt] = arrayOfInt[i];
      float[] arrayOfFloat = this.valueTable;
      arrayOfFloat[paramInt] = arrayOfFloat[i];
    } 
  }
  
  public void shrink(int paramInt) {
    if (paramInt >= 0) {
      int i = this.size;
      int j = paramInt;
      if (i > paramInt)
        j = i; 
      if (this.capacity <= j)
        return; 
      resize(MathUtils.nextPowerOfTwo(j));
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("maximumCapacity must be >= 0: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public String toString() {
    if (this.size == 0)
      return "{}"; 
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('{');
    int[] arrayOfInt = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = arrayOfInt.length;
    int j = i;
    if (this.hasZeroValue) {
      stringBuilder.append("0=");
      stringBuilder.append(this.zeroValue);
    } else {
      while (true) {
        int k = j - 1;
        i = k;
        if (j > 0) {
          i = arrayOfInt[k];
          if (i == 0) {
            j = k;
            continue;
          } 
          stringBuilder.append(i);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfFloat[k]);
          i = k;
        } 
        break;
      } 
    } 
    while (true) {
      int k = i - 1;
      if (i > 0) {
        i = arrayOfInt[k];
        if (i == 0) {
          i = k;
          continue;
        } 
        stringBuilder.append(", ");
        stringBuilder.append(i);
        stringBuilder.append('=');
        stringBuilder.append(arrayOfFloat[k]);
        i = k;
        continue;
      } 
      break;
    } 
    stringBuilder.append('}');
    return stringBuilder.toString();
  }
  
  public Values values() {
    if (Collections.allocateIterators)
      return new Values(this); 
    if (this.values1 == null) {
      this.values1 = new Values(this);
      this.values2 = new Values(this);
    } 
    if (!this.values1.valid) {
      this.values1.reset();
      Values values3 = this.values1;
      values3.valid = true;
      this.values2.valid = false;
      return values3;
    } 
    this.values2.reset();
    Values values = this.values2;
    values.valid = true;
    this.values1.valid = false;
    return values;
  }
  
  public static class Entries extends MapIterator implements Iterable<Entry>, Iterator<Entry> {
    private IntFloatMap.Entry entry = new IntFloatMap.Entry();
    
    public Entries(IntFloatMap param1IntFloatMap) { super(param1IntFloatMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<IntFloatMap.Entry> iterator() { return this; }
    
    public IntFloatMap.Entry next() {
      if (this.hasNext) {
        if (this.valid) {
          IntFloatMap.Entry entry1 = this.map.keyTable;
          if (this.nextIndex == -1) {
            entry1 = this.entry;
            entry1.key = 0;
            entry1.value = this.map.zeroValue;
          } else {
            this.entry.key = entry1[this.nextIndex];
            this.entry.value = this.map.valueTable[this.nextIndex];
          } 
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return this.entry;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() { super.remove(); }
  }
  
  public static class Entry {
    public int key;
    
    public float value;
    
    public String toString() {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(this.key);
      stringBuilder.append("=");
      stringBuilder.append(this.value);
      return stringBuilder.toString();
    }
  }
  
  public static class Keys extends MapIterator {
    public Keys(IntFloatMap param1IntFloatMap) { super(param1IntFloatMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public int next() {
      if (this.hasNext) {
        if (this.valid) {
          int i;
          if (this.nextIndex == -1) {
            i = 0;
          } else {
            i = this.map.keyTable[this.nextIndex];
          } 
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return i;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public IntArray toArray() {
      IntArray intArray = new IntArray(true, this.map.size);
      while (this.hasNext)
        intArray.add(next()); 
      return intArray;
    }
  }
  
  private static class MapIterator {
    static final int INDEX_ILLEGAL = -2;
    
    static final int INDEX_ZERO = -1;
    
    int currentIndex;
    
    public boolean hasNext;
    
    final IntFloatMap map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(IntFloatMap param1IntFloatMap) {
      this.map = param1IntFloatMap;
      reset();
    }
    
    void findNextIndex() {
      this.hasNext = false;
      int[] arrayOfInt = this.map.keyTable;
      int i = this.map.capacity;
      int j = this.map.stashSize;
      while (true) {
        int k = this.nextIndex + 1;
        this.nextIndex = k;
        if (k < i + j) {
          if (arrayOfInt[this.nextIndex] != 0) {
            this.hasNext = true;
            break;
          } 
          continue;
        } 
        break;
      } 
    }
    
    public void remove() {
      if (this.currentIndex == -1 && this.map.hasZeroValue) {
        this.map.hasZeroValue = false;
      } else {
        int i = this.currentIndex;
        if (i >= 0) {
          if (i >= this.map.capacity) {
            this.map.removeStashIndex(this.currentIndex);
            this.nextIndex = this.currentIndex - 1;
            findNextIndex();
          } else {
            this.map.keyTable[this.currentIndex] = 0;
          } 
        } else {
          throw new IllegalStateException("next must be called before remove.");
        } 
      } 
      this.currentIndex = -2;
      IntFloatMap intFloatMap = this.map;
      intFloatMap.size--;
    }
    
    public void reset() {
      this.currentIndex = -2;
      this.nextIndex = -1;
      if (this.map.hasZeroValue) {
        this.hasNext = true;
      } else {
        findNextIndex();
      } 
    }
  }
  
  public static class Values extends MapIterator {
    public Values(IntFloatMap param1IntFloatMap) { super(param1IntFloatMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public float next() {
      if (this.hasNext) {
        if (this.valid) {
          float f;
          if (this.nextIndex == -1) {
            f = this.map.zeroValue;
          } else {
            f = this.map.valueTable[this.nextIndex];
          } 
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return f;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public FloatArray toArray() {
      FloatArray floatArray = new FloatArray(true, this.map.size);
      while (this.hasNext)
        floatArray.add(next()); 
      return floatArray;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/IntFloatMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */