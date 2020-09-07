package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IntIntMap extends Object implements Iterable<IntIntMap.Entry> {
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
  
  int[] valueTable;
  
  private Values values1;
  
  private Values values2;
  
  int zeroValue;
  
  public IntIntMap() { this(51, 0.8F); }
  
  public IntIntMap(int paramInt) { this(paramInt, 0.8F); }
  
  public IntIntMap(int paramInt, float paramFloat) {
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
          this.valueTable = new int[this.keyTable.length];
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
  
  public IntIntMap(IntIntMap paramIntIntMap) {
    this((int)Math.floor((paramIntIntMap.capacity * paramIntIntMap.loadFactor)), paramIntIntMap.loadFactor);
    this.stashSize = paramIntIntMap.stashSize;
    int[] arrayOfInt = paramIntIntMap.keyTable;
    System.arraycopy(arrayOfInt, 0, this.keyTable, 0, arrayOfInt.length);
    arrayOfInt = paramIntIntMap.valueTable;
    System.arraycopy(arrayOfInt, 0, this.valueTable, 0, arrayOfInt.length);
    this.size = paramIntIntMap.size;
    this.zeroValue = paramIntIntMap.zeroValue;
    this.hasZeroValue = paramIntIntMap.hasZeroValue;
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
  
  private int getAndIncrementStash(int paramInt1, int paramInt2, int paramInt3) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt1 == arrayOfInt[k]) {
        arrayOfInt = this.valueTable;
        paramInt1 = arrayOfInt[k];
        arrayOfInt[k] = paramInt3 + paramInt1;
        return paramInt1;
      } 
    } 
    put(paramInt1, paramInt3 + paramInt2);
    return paramInt2;
  }
  
  private int getStash(int paramInt1, int paramInt2) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt1 == arrayOfInt[k])
        return this.valueTable[k]; 
    } 
    return paramInt2;
  }
  
  private int hash2(int paramInt) {
    paramInt *= -1262997959;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private int hash3(int paramInt) {
    paramInt *= -825114047;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private void push(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) {
    int[] arrayOfInt1 = this.keyTable;
    int[] arrayOfInt2 = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = 0;
    int m = paramInt7;
    int n = paramInt5;
    int i1 = paramInt3;
    paramInt5 = paramInt2;
    paramInt7 = paramInt1;
    paramInt3 = k;
    do {
      paramInt1 = MathUtils.random(2);
      if (paramInt1 != 0) {
        if (paramInt1 != 1) {
          paramInt2 = arrayOfInt2[m];
          arrayOfInt1[m] = paramInt7;
          arrayOfInt2[m] = paramInt5;
          paramInt1 = paramInt8;
        } else {
          paramInt2 = arrayOfInt2[n];
          arrayOfInt1[n] = paramInt7;
          arrayOfInt2[n] = paramInt5;
          paramInt1 = paramInt6;
        } 
      } else {
        paramInt2 = arrayOfInt2[i1];
        arrayOfInt1[i1] = paramInt7;
        arrayOfInt2[i1] = paramInt5;
        paramInt1 = paramInt4;
      } 
      i1 = paramInt1 & i;
      paramInt4 = arrayOfInt1[i1];
      if (paramInt4 == 0) {
        arrayOfInt1[i1] = paramInt1;
        arrayOfInt2[i1] = paramInt2;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      n = hash2(paramInt1);
      paramInt6 = arrayOfInt1[n];
      if (paramInt6 == 0) {
        arrayOfInt1[n] = paramInt1;
        arrayOfInt2[n] = paramInt2;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      m = hash3(paramInt1);
      paramInt8 = arrayOfInt1[m];
      if (paramInt8 == 0) {
        arrayOfInt1[m] = paramInt1;
        arrayOfInt2[m] = paramInt2;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      k = paramInt3 + 1;
      paramInt3 = k;
      paramInt7 = paramInt1;
      paramInt5 = paramInt2;
    } while (k != j);
    putStash(paramInt1, paramInt2);
  }
  
  private void putResize(int paramInt1, int paramInt2) {
    if (paramInt1 == 0) {
      this.zeroValue = paramInt2;
      this.hasZeroValue = true;
      return;
    } 
    int i = paramInt1 & this.mask;
    int[] arrayOfInt = this.keyTable;
    int j = arrayOfInt[i];
    if (j == 0) {
      arrayOfInt[i] = paramInt1;
      this.valueTable[i] = paramInt2;
      paramInt1 = this.size;
      this.size = paramInt1 + 1;
      if (paramInt1 >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int k = hash2(paramInt1);
    arrayOfInt = this.keyTable;
    int m = arrayOfInt[k];
    if (m == 0) {
      arrayOfInt[k] = paramInt1;
      this.valueTable[k] = paramInt2;
      paramInt1 = this.size;
      this.size = paramInt1 + 1;
      if (paramInt1 >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int n = hash3(paramInt1);
    arrayOfInt = this.keyTable;
    int i1 = arrayOfInt[n];
    if (i1 == 0) {
      arrayOfInt[n] = paramInt1;
      this.valueTable[n] = paramInt2;
      paramInt1 = this.size;
      this.size = paramInt1 + 1;
      if (paramInt1 >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramInt1, paramInt2, i, j, k, m, n, i1);
  }
  
  private void putStash(int paramInt1, int paramInt2) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramInt1, paramInt2);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramInt1;
    this.valueTable[j] = paramInt2;
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
    int[] arrayOfInt1 = this.keyTable;
    int[] arrayOfInt2 = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = new int[paramInt + k];
    this.valueTable = new int[paramInt + k];
    k = this.size;
    this.size = this.hasZeroValue;
    paramInt = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        k = arrayOfInt1[paramInt];
        if (k != 0)
          putResize(k, arrayOfInt2[paramInt]); 
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
    this.size = 0;
    this.stashSize = 0;
    this.hasZeroValue = false;
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
  
  public boolean containsValue(int paramInt) {
    if (this.hasZeroValue && this.zeroValue == paramInt)
      return true; 
    int[] arrayOfInt1 = this.keyTable;
    int[] arrayOfInt2 = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfInt1[j] != 0 && arrayOfInt2[j] == paramInt)
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
    if (!(paramObject instanceof IntIntMap))
      return false; 
    IntIntMap intIntMap = (IntIntMap)paramObject;
    if (intIntMap.size != this.size)
      return false; 
    boolean bool1 = intIntMap.hasZeroValue;
    boolean bool2 = this.hasZeroValue;
    if (bool1 != bool2)
      return false; 
    if (bool2 && intIntMap.zeroValue != this.zeroValue)
      return false; 
    int[] arrayOfInt2 = this.keyTable;
    int[] arrayOfInt1 = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      int k = arrayOfInt2[b];
      if (k != 0) {
        int m = intIntMap.get(k, 0);
        if (m == 0 && !intIntMap.containsKey(k))
          return false; 
        if (m != arrayOfInt1[b])
          return false; 
      } 
    } 
    return true;
  }
  
  public int findKey(int paramInt1, int paramInt2) {
    if (this.hasZeroValue && this.zeroValue == paramInt1)
      return 0; 
    int[] arrayOfInt1 = this.keyTable;
    int[] arrayOfInt2 = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfInt1[j] != 0 && arrayOfInt2[j] == paramInt1)
          return arrayOfInt1[j]; 
        i = j;
        continue;
      } 
      break;
    } 
    return paramInt2;
  }
  
  public int get(int paramInt1, int paramInt2) {
    if (paramInt1 == 0)
      return !this.hasZeroValue ? paramInt2 : this.zeroValue; 
    int i = this.mask & paramInt1;
    int j = i;
    if (this.keyTable[i] != paramInt1) {
      i = hash2(paramInt1);
      j = i;
      if (this.keyTable[i] != paramInt1) {
        i = hash3(paramInt1);
        j = i;
        if (this.keyTable[i] != paramInt1)
          return getStash(paramInt1, paramInt2); 
      } 
    } 
    return this.valueTable[j];
  }
  
  public int getAndIncrement(int paramInt1, int paramInt2, int paramInt3) {
    if (paramInt1 == 0) {
      if (this.hasZeroValue) {
        paramInt1 = this.zeroValue;
        this.zeroValue = paramInt3 + paramInt1;
        return paramInt1;
      } 
      this.hasZeroValue = true;
      this.zeroValue = paramInt3 + paramInt2;
      this.size++;
      return paramInt2;
    } 
    int i = this.mask & paramInt1;
    int j = i;
    if (paramInt1 != this.keyTable[i]) {
      i = hash2(paramInt1);
      j = i;
      if (paramInt1 != this.keyTable[i]) {
        i = hash3(paramInt1);
        j = i;
        if (paramInt1 != this.keyTable[i])
          return getAndIncrementStash(paramInt1, paramInt2, paramInt3); 
      } 
    } 
    int[] arrayOfInt = this.valueTable;
    paramInt1 = arrayOfInt[j];
    arrayOfInt[j] = paramInt3 + paramInt1;
    return paramInt1;
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
    int[] arrayOfInt1 = this.keyTable;
    int[] arrayOfInt2 = this.valueTable;
    int j = this.capacity;
    int k = this.stashSize;
    int m;
    for (m = i; b < j + k; m = i) {
      int n = arrayOfInt1[b];
      i = m;
      if (n != 0)
        i = m + n * 31 + arrayOfInt2[b]; 
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
  
  public void put(int paramInt1, int paramInt2) {
    if (paramInt1 == 0) {
      this.zeroValue = paramInt2;
      if (!this.hasZeroValue) {
        this.hasZeroValue = true;
        this.size++;
      } 
      return;
    } 
    int[] arrayOfInt = this.keyTable;
    int i = paramInt1 & this.mask;
    int j = arrayOfInt[i];
    if (paramInt1 == j) {
      this.valueTable[i] = paramInt2;
      return;
    } 
    int k = hash2(paramInt1);
    int m = arrayOfInt[k];
    if (paramInt1 == m) {
      this.valueTable[k] = paramInt2;
      return;
    } 
    int n = hash3(paramInt1);
    int i1 = arrayOfInt[n];
    if (paramInt1 == i1) {
      this.valueTable[n] = paramInt2;
      return;
    } 
    int i2 = this.capacity;
    int i3 = this.stashSize;
    for (int i4 = i2; i4 < i3 + i2; i4++) {
      if (paramInt1 == arrayOfInt[i4]) {
        this.valueTable[i4] = paramInt2;
        return;
      } 
    } 
    if (j == 0) {
      arrayOfInt[i] = paramInt1;
      this.valueTable[i] = paramInt2;
      paramInt1 = this.size;
      this.size = paramInt1 + 1;
      if (paramInt1 >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    if (m == 0) {
      arrayOfInt[k] = paramInt1;
      this.valueTable[k] = paramInt2;
      paramInt1 = this.size;
      this.size = paramInt1 + 1;
      if (paramInt1 >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    if (i1 == 0) {
      arrayOfInt[n] = paramInt1;
      this.valueTable[n] = paramInt2;
      paramInt1 = this.size;
      this.size = paramInt1 + 1;
      if (paramInt1 >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramInt1, paramInt2, i, j, k, m, n, i1);
  }
  
  public void putAll(IntIntMap paramIntIntMap) {
    for (Entry entry : paramIntIntMap.entries())
      put(entry.key, entry.value); 
  }
  
  public int remove(int paramInt1, int paramInt2) {
    if (paramInt1 == 0) {
      if (!this.hasZeroValue)
        return paramInt2; 
      this.hasZeroValue = false;
      this.size--;
      return this.zeroValue;
    } 
    int i = this.mask & paramInt1;
    int[] arrayOfInt = this.keyTable;
    if (paramInt1 == arrayOfInt[i]) {
      arrayOfInt[i] = 0;
      paramInt1 = this.valueTable[i];
      this.size--;
      return paramInt1;
    } 
    i = hash2(paramInt1);
    arrayOfInt = this.keyTable;
    if (paramInt1 == arrayOfInt[i]) {
      arrayOfInt[i] = 0;
      paramInt1 = this.valueTable[i];
      this.size--;
      return paramInt1;
    } 
    i = hash3(paramInt1);
    arrayOfInt = this.keyTable;
    if (paramInt1 == arrayOfInt[i]) {
      arrayOfInt[i] = 0;
      paramInt1 = this.valueTable[i];
      this.size--;
      return paramInt1;
    } 
    return removeStash(paramInt1, paramInt2);
  }
  
  int removeStash(int paramInt1, int paramInt2) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramInt1 == arrayOfInt[k]) {
        paramInt1 = this.valueTable[k];
        removeStashIndex(k);
        this.size--;
        return paramInt1;
      } 
    } 
    return paramInt2;
  }
  
  void removeStashIndex(int paramInt) {
    this.stashSize--;
    int i = this.capacity + this.stashSize;
    if (paramInt < i) {
      int[] arrayOfInt = this.keyTable;
      arrayOfInt[paramInt] = arrayOfInt[i];
      arrayOfInt = this.valueTable;
      arrayOfInt[paramInt] = arrayOfInt[i];
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
    int[] arrayOfInt1 = this.keyTable;
    int[] arrayOfInt2 = this.valueTable;
    int i = arrayOfInt1.length;
    int j = i;
    if (this.hasZeroValue) {
      stringBuilder.append("0=");
      stringBuilder.append(this.zeroValue);
    } else {
      while (true) {
        int k = j - 1;
        i = k;
        if (j > 0) {
          i = arrayOfInt1[k];
          if (i == 0) {
            j = k;
            continue;
          } 
          stringBuilder.append(i);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfInt2[k]);
          i = k;
        } 
        break;
      } 
    } 
    while (true) {
      j = i - 1;
      if (i > 0) {
        i = arrayOfInt1[j];
        if (i == 0) {
          i = j;
          continue;
        } 
        stringBuilder.append(", ");
        stringBuilder.append(i);
        stringBuilder.append('=');
        stringBuilder.append(arrayOfInt2[j]);
        i = j;
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
    private IntIntMap.Entry entry = new IntIntMap.Entry();
    
    public Entries(IntIntMap param1IntIntMap) { super(param1IntIntMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<IntIntMap.Entry> iterator() { return this; }
    
    public IntIntMap.Entry next() {
      if (this.hasNext) {
        if (this.valid) {
          IntIntMap.Entry entry1 = this.map.keyTable;
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
    
    public int value;
    
    public String toString() {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(this.key);
      stringBuilder.append("=");
      stringBuilder.append(this.value);
      return stringBuilder.toString();
    }
  }
  
  public static class Keys extends MapIterator {
    public Keys(IntIntMap param1IntIntMap) { super(param1IntIntMap); }
    
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
    
    final IntIntMap map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(IntIntMap param1IntIntMap) {
      this.map = param1IntIntMap;
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
      IntIntMap intIntMap = this.map;
      intIntMap.size--;
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
    public Values(IntIntMap param1IntIntMap) { super(param1IntIntMap); }
    
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
            i = this.map.zeroValue;
          } else {
            i = this.map.valueTable[this.nextIndex];
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
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/IntIntMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */