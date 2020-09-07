package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.NoSuchElementException;

public class IntSet {
  private static final int EMPTY = 0;
  
  private static final int PRIME1 = -1105259343;
  
  private static final int PRIME2 = -1262997959;
  
  private static final int PRIME3 = -825114047;
  
  int capacity;
  
  boolean hasZeroValue;
  
  private int hashShift;
  
  private IntSetIterator iterator1;
  
  private IntSetIterator iterator2;
  
  int[] keyTable;
  
  private float loadFactor;
  
  private int mask;
  
  private int pushIterations;
  
  public int size;
  
  private int stashCapacity;
  
  int stashSize;
  
  private int threshold;
  
  public IntSet() { this(51, 0.8F); }
  
  public IntSet(int paramInt) { this(paramInt, 0.8F); }
  
  public IntSet(int paramInt, float paramFloat) {
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
  
  public IntSet(IntSet paramIntSet) {
    this((int)Math.floor((paramIntSet.capacity * paramIntSet.loadFactor)), paramIntSet.loadFactor);
    this.stashSize = paramIntSet.stashSize;
    int[] arrayOfInt = paramIntSet.keyTable;
    System.arraycopy(arrayOfInt, 0, this.keyTable, 0, arrayOfInt.length);
    this.size = paramIntSet.size;
    this.hasZeroValue = paramIntSet.hasZeroValue;
  }
  
  private void addResize(int paramInt) {
    if (paramInt == 0) {
      this.hasZeroValue = true;
      return;
    } 
    int i = paramInt & this.mask;
    int[] arrayOfInt = this.keyTable;
    int j = arrayOfInt[i];
    if (j == 0) {
      arrayOfInt[i] = paramInt;
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
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramInt, i, j, k, m, n, i1);
  }
  
  private void addStash(int paramInt) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      addResize(paramInt);
      return;
    } 
    int j = this.capacity;
    this.keyTable[j + i] = paramInt;
    this.stashSize = i + 1;
    this.size++;
  }
  
  private boolean containsKeyStash(int paramInt) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfInt[k] == paramInt)
        return true; 
    } 
    return false;
  }
  
  private int hash2(int paramInt) {
    paramInt *= -1262997959;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private int hash3(int paramInt) {
    paramInt *= -825114047;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private void push(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7) {
    int[] arrayOfInt = this.keyTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = 0;
    int m = paramInt6;
    paramInt6 = paramInt4;
    int n = paramInt2;
    paramInt4 = paramInt1;
    paramInt2 = k;
    do {
      paramInt1 = MathUtils.random(2);
      if (paramInt1 != 0) {
        if (paramInt1 != 1) {
          arrayOfInt[m] = paramInt4;
          paramInt1 = paramInt7;
        } else {
          arrayOfInt[paramInt6] = paramInt4;
          paramInt1 = paramInt5;
        } 
      } else {
        arrayOfInt[n] = paramInt4;
        paramInt1 = paramInt3;
      } 
      n = paramInt1 & i;
      paramInt3 = arrayOfInt[n];
      if (paramInt3 == 0) {
        arrayOfInt[n] = paramInt1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt6 = hash2(paramInt1);
      paramInt5 = arrayOfInt[paramInt6];
      if (paramInt5 == 0) {
        arrayOfInt[paramInt6] = paramInt1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      m = hash3(paramInt1);
      paramInt7 = arrayOfInt[m];
      if (paramInt7 == 0) {
        arrayOfInt[m] = paramInt1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      k = paramInt2 + 1;
      paramInt2 = k;
      paramInt4 = paramInt1;
    } while (k != j);
    addStash(paramInt1);
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
    this.keyTable = new int[paramInt + this.stashCapacity];
    int k = this.size;
    this.size = this.hasZeroValue;
    paramInt = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        k = arrayOfInt[paramInt];
        if (k != 0)
          addResize(k); 
        paramInt++;
      }  
  }
  
  public static IntSet with(int... paramVarArgs) {
    IntSet intSet = new IntSet();
    intSet.addAll(paramVarArgs);
    return intSet;
  }
  
  public boolean add(int paramInt) {
    if (paramInt == 0) {
      if (this.hasZeroValue)
        return false; 
      this.hasZeroValue = true;
      this.size++;
      return true;
    } 
    int[] arrayOfInt = this.keyTable;
    int i = paramInt & this.mask;
    int j = arrayOfInt[i];
    if (j == paramInt)
      return false; 
    int k = hash2(paramInt);
    int m = arrayOfInt[k];
    if (m == paramInt)
      return false; 
    int n = hash3(paramInt);
    int i1 = arrayOfInt[n];
    if (i1 == paramInt)
      return false; 
    int i2 = this.capacity;
    int i3 = this.stashSize;
    for (int i4 = i2; i4 < i3 + i2; i4++) {
      if (arrayOfInt[i4] == paramInt)
        return false; 
    } 
    if (j == 0) {
      arrayOfInt[i] = paramInt;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return true;
    } 
    if (m == 0) {
      arrayOfInt[k] = paramInt;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return true;
    } 
    if (i1 == 0) {
      arrayOfInt[n] = paramInt;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return true;
    } 
    push(paramInt, i, j, k, m, n, i1);
    return true;
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
  
  public void addAll(IntSet paramIntSet) {
    ensureCapacity(paramIntSet.size);
    IntSetIterator intSetIterator = paramIntSet.iterator();
    while (intSetIterator.hasNext)
      add(intSetIterator.next()); 
  }
  
  public void addAll(int... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(int[] paramArrayOfInt, int paramInt1, int paramInt2) {
    ensureCapacity(paramInt2);
    for (int i = paramInt1; i < paramInt2 + paramInt1; i++)
      add(paramArrayOfInt[i]); 
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
  
  public boolean contains(int paramInt) {
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
  
  public boolean equals(Object paramObject) {
    if (!(paramObject instanceof IntSet))
      return false; 
    IntSet intSet = (IntSet)paramObject;
    if (intSet.size != this.size)
      return false; 
    if (intSet.hasZeroValue != this.hasZeroValue)
      return false; 
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      if (arrayOfInt[b] != 0 && !intSet.contains(arrayOfInt[b]))
        return false; 
    } 
    return true;
  }
  
  public int first() {
    boolean bool = this.hasZeroValue;
    byte b = 0;
    if (bool)
      return 0; 
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    while (b < i + j) {
      if (arrayOfInt[b] != 0)
        return arrayOfInt[b]; 
      b++;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("IntSet is empty.");
    throw illegalStateException;
  }
  
  public int hashCode() {
    int i = this.capacity;
    int j = this.stashSize;
    byte b = 0;
    int k;
    for (k = 0; b < i + j; k = m) {
      int[] arrayOfInt = this.keyTable;
      int m = k;
      if (arrayOfInt[b] != 0)
        m = k + arrayOfInt[b]; 
      b++;
    } 
    return k;
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
  
  public IntSetIterator iterator() {
    if (Collections.allocateIterators)
      return new IntSetIterator(this); 
    if (this.iterator1 == null) {
      this.iterator1 = new IntSetIterator(this);
      this.iterator2 = new IntSetIterator(this);
    } 
    if (!this.iterator1.valid) {
      this.iterator1.reset();
      IntSetIterator intSetIterator1 = this.iterator1;
      intSetIterator1.valid = true;
      this.iterator2.valid = false;
      return intSetIterator1;
    } 
    this.iterator2.reset();
    IntSetIterator intSetIterator = this.iterator2;
    intSetIterator.valid = true;
    this.iterator1.valid = false;
    return intSetIterator;
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
  
  public boolean remove(int paramInt) {
    if (paramInt == 0) {
      if (!this.hasZeroValue)
        return false; 
      this.hasZeroValue = false;
      this.size--;
      return true;
    } 
    int i = this.mask & paramInt;
    int[] arrayOfInt = this.keyTable;
    if (arrayOfInt[i] == paramInt) {
      arrayOfInt[i] = 0;
      this.size--;
      return true;
    } 
    i = hash2(paramInt);
    arrayOfInt = this.keyTable;
    if (arrayOfInt[i] == paramInt) {
      arrayOfInt[i] = 0;
      this.size--;
      return true;
    } 
    i = hash3(paramInt);
    arrayOfInt = this.keyTable;
    if (arrayOfInt[i] == paramInt) {
      arrayOfInt[i] = 0;
      this.size--;
      return true;
    } 
    return removeStash(paramInt);
  }
  
  boolean removeStash(int paramInt) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfInt[k] == paramInt) {
        removeStashIndex(k);
        this.size--;
        return true;
      } 
    } 
    return false;
  }
  
  void removeStashIndex(int paramInt) {
    this.stashSize--;
    int i = this.capacity + this.stashSize;
    if (paramInt < i) {
      int[] arrayOfInt = this.keyTable;
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
      return "[]"; 
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    int[] arrayOfInt = this.keyTable;
    int i = arrayOfInt.length;
    int j = i;
    if (this.hasZeroValue) {
      stringBuilder.append("0");
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
          i = k;
        } 
        break;
      } 
    } 
    while (true) {
      j = i - 1;
      if (i > 0) {
        i = arrayOfInt[j];
        if (i == 0) {
          i = j;
          continue;
        } 
        stringBuilder.append(", ");
        stringBuilder.append(i);
        i = j;
        continue;
      } 
      break;
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public static class IntSetIterator {
    static final int INDEX_ILLEGAL = -2;
    
    static final int INDEX_ZERO = -1;
    
    int currentIndex;
    
    public boolean hasNext;
    
    int nextIndex;
    
    final IntSet set;
    
    boolean valid = true;
    
    public IntSetIterator(IntSet param1IntSet) {
      this.set = param1IntSet;
      reset();
    }
    
    void findNextIndex() {
      this.hasNext = false;
      int[] arrayOfInt = this.set.keyTable;
      int i = this.set.capacity;
      int j = this.set.stashSize;
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
    
    public int next() {
      if (this.hasNext) {
        if (this.valid) {
          int i;
          if (this.nextIndex == -1) {
            i = 0;
          } else {
            i = this.set.keyTable[this.nextIndex];
          } 
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return i;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      if (this.currentIndex == -1 && this.set.hasZeroValue) {
        this.set.hasZeroValue = false;
      } else {
        int i = this.currentIndex;
        if (i >= 0) {
          if (i >= this.set.capacity) {
            this.set.removeStashIndex(this.currentIndex);
            this.nextIndex = this.currentIndex - 1;
            findNextIndex();
          } else {
            this.set.keyTable[this.currentIndex] = 0;
          } 
        } else {
          throw new IllegalStateException("next must be called before remove.");
        } 
      } 
      this.currentIndex = -2;
      IntSet intSet = this.set;
      intSet.size--;
    }
    
    public void reset() {
      this.currentIndex = -2;
      this.nextIndex = -1;
      if (this.set.hasZeroValue) {
        this.hasNext = true;
      } else {
        findNextIndex();
      } 
    }
    
    public IntArray toArray() {
      IntArray intArray = new IntArray(true, this.set.size);
      while (this.hasNext)
        intArray.add(next()); 
      return intArray;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/IntSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */