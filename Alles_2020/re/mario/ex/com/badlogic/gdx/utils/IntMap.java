package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IntMap<V> extends Object implements Iterable<IntMap.Entry<V>> {
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
  
  V[] valueTable;
  
  private Values values1;
  
  private Values values2;
  
  V zeroValue;
  
  public IntMap() { this(51, 0.8F); }
  
  public IntMap(int paramInt) { this(paramInt, 0.8F); }
  
  public IntMap(int paramInt, float paramFloat) {
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
          this.valueTable = (Object[])new Object[this.keyTable.length];
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
  
  public IntMap(IntMap<? extends V> paramIntMap) {
    this((int)Math.floor((paramIntMap.capacity * paramIntMap.loadFactor)), paramIntMap.loadFactor);
    this.stashSize = paramIntMap.stashSize;
    int[] arrayOfInt = paramIntMap.keyTable;
    System.arraycopy(arrayOfInt, 0, this.keyTable, 0, arrayOfInt.length);
    Object[] arrayOfObject = paramIntMap.valueTable;
    System.arraycopy(arrayOfObject, 0, this.valueTable, 0, arrayOfObject.length);
    this.size = paramIntMap.size;
    this.zeroValue = paramIntMap.zeroValue;
    this.hasZeroValue = paramIntMap.hasZeroValue;
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
  
  private V getStash(int paramInt, V paramV) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfInt[k] == paramInt)
        return (V)this.valueTable[k]; 
    } 
    return paramV;
  }
  
  private int hash2(int paramInt) {
    paramInt *= -1262997959;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private int hash3(int paramInt) {
    paramInt *= -825114047;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private void push(int paramInt1, V paramV, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7) {
    int[] arrayOfInt = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = 0;
    int m = paramInt2;
    V v = paramV;
    int n = paramInt1;
    paramInt2 = k;
    do {
      paramInt1 = MathUtils.random(2);
      if (paramInt1 != 0) {
        if (paramInt1 != 1) {
          paramV = (V)arrayOfObject[paramInt6];
          arrayOfInt[paramInt6] = n;
          arrayOfObject[paramInt6] = v;
          paramInt1 = paramInt7;
        } else {
          paramV = (V)arrayOfObject[paramInt4];
          arrayOfInt[paramInt4] = n;
          arrayOfObject[paramInt4] = v;
          paramInt1 = paramInt5;
        } 
      } else {
        paramV = (V)arrayOfObject[m];
        arrayOfInt[m] = n;
        arrayOfObject[m] = v;
        paramInt1 = paramInt3;
      } 
      m = paramInt1 & i;
      paramInt3 = arrayOfInt[m];
      if (paramInt3 == 0) {
        arrayOfInt[m] = paramInt1;
        arrayOfObject[m] = paramV;
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
        arrayOfObject[paramInt4] = paramV;
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
        arrayOfObject[paramInt6] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      k = paramInt2 + 1;
      paramInt2 = k;
      n = paramInt1;
      v = paramV;
    } while (k != j);
    putStash(paramInt1, paramV);
  }
  
  private void putResize(int paramInt, V paramV) {
    if (paramInt == 0) {
      this.zeroValue = paramV;
      this.hasZeroValue = true;
      return;
    } 
    int i = paramInt & this.mask;
    int[] arrayOfInt = this.keyTable;
    int j = arrayOfInt[i];
    if (j == 0) {
      arrayOfInt[i] = paramInt;
      this.valueTable[i] = paramV;
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
      this.valueTable[k] = paramV;
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
      this.valueTable[n] = paramV;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramInt, paramV, i, j, k, m, n, i1);
  }
  
  private void putStash(int paramInt, V paramV) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramInt, paramV);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramInt;
    this.valueTable[j] = paramV;
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
    Object[] arrayOfObject = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = new int[paramInt + k];
    this.valueTable = (Object[])new Object[paramInt + k];
    k = this.size;
    this.size = this.hasZeroValue;
    paramInt = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        k = arrayOfInt[paramInt];
        if (k != 0)
          putResize(k, arrayOfObject[paramInt]); 
        paramInt++;
      }  
  }
  
  public void clear() {
    if (this.size == 0)
      return; 
    int[] arrayOfInt = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        arrayOfInt[j] = 0;
        arrayOfObject[j] = null;
        i = j;
        continue;
      } 
      break;
    } 
    this.size = 0;
    this.stashSize = 0;
    this.zeroValue = null;
    this.hasZeroValue = false;
  }
  
  public void clear(int paramInt) {
    if (this.capacity <= paramInt) {
      clear();
      return;
    } 
    this.zeroValue = null;
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
  
  public boolean containsValue(Object paramObject, boolean paramBoolean) {
    int[] arrayOfInt;
    Object[] arrayOfObject = this.valueTable;
    if (paramObject == null) {
      if (this.hasZeroValue && this.zeroValue == null)
        return true; 
      arrayOfInt = this.keyTable;
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfInt[j] != 0 && arrayOfObject[j] == null)
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
    } else if (paramBoolean) {
      if (arrayOfInt == this.zeroValue)
        return true; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject[j] == arrayOfInt)
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
    } else {
      if (this.hasZeroValue && arrayOfInt.equals(this.zeroValue))
        return true; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfInt.equals(arrayOfObject[j]))
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
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
  
  public Entries<V> entries() {
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
    if (!(paramObject instanceof IntMap))
      return false; 
    paramObject = (IntMap)paramObject;
    if (paramObject.size != this.size)
      return false; 
    boolean bool1 = paramObject.hasZeroValue;
    boolean bool2 = this.hasZeroValue;
    if (bool1 != bool2)
      return false; 
    if (bool2) {
      Object object = paramObject.zeroValue;
      if (object == null) {
        if (this.zeroValue != null)
          return false; 
      } else if (!object.equals(this.zeroValue)) {
        return false;
      } 
    } 
    int[] arrayOfInt = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      int k = arrayOfInt[b];
      if (k != 0) {
        Object object = arrayOfObject[b];
        if (object == null) {
          if (paramObject.get(k, ObjectMap.dummy) != null)
            return false; 
        } else if (!object.equals(paramObject.get(k))) {
          return false;
        } 
      } 
    } 
    return true;
  }
  
  public boolean equalsIdentity(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof IntMap))
      return false; 
    IntMap intMap = (IntMap)paramObject;
    if (intMap.size != this.size)
      return false; 
    boolean bool1 = intMap.hasZeroValue;
    boolean bool2 = this.hasZeroValue;
    if (bool1 != bool2)
      return false; 
    if (bool2 && this.zeroValue != intMap.zeroValue)
      return false; 
    int[] arrayOfInt = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      int k = arrayOfInt[b];
      if (k != 0 && arrayOfObject[b] != intMap.get(k, ObjectMap.dummy))
        return false; 
    } 
    return true;
  }
  
  public int findKey(Object paramObject, boolean paramBoolean, int paramInt) {
    int[] arrayOfInt;
    Object[] arrayOfObject = this.valueTable;
    if (paramObject == null) {
      if (this.hasZeroValue && this.zeroValue == null)
        return 0; 
      arrayOfInt = this.keyTable;
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfInt[j] != 0 && arrayOfObject[j] == null)
            return arrayOfInt[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } else if (paramBoolean) {
      if (arrayOfInt == this.zeroValue)
        return 0; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject[j] == arrayOfInt)
            return this.keyTable[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } else {
      if (this.hasZeroValue && arrayOfInt.equals(this.zeroValue))
        return 0; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfInt.equals(arrayOfObject[j]))
            return this.keyTable[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } 
    return paramInt;
  }
  
  public V get(int paramInt) {
    if (paramInt == 0)
      return !this.hasZeroValue ? null : (V)this.zeroValue; 
    int i = this.mask & paramInt;
    int j = i;
    if (this.keyTable[i] != paramInt) {
      i = hash2(paramInt);
      j = i;
      if (this.keyTable[i] != paramInt) {
        i = hash3(paramInt);
        j = i;
        if (this.keyTable[i] != paramInt)
          return (V)getStash(paramInt, null); 
      } 
    } 
    return (V)this.valueTable[j];
  }
  
  public V get(int paramInt, V paramV) {
    if (paramInt == 0)
      return !this.hasZeroValue ? paramV : (V)this.zeroValue; 
    int i = this.mask & paramInt;
    int j = i;
    if (this.keyTable[i] != paramInt) {
      i = hash2(paramInt);
      j = i;
      if (this.keyTable[i] != paramInt) {
        i = hash3(paramInt);
        j = i;
        if (this.keyTable[i] != paramInt)
          return (V)getStash(paramInt, paramV); 
      } 
    } 
    return (V)this.valueTable[j];
  }
  
  public int hashCode() { // Byte code:
    //   0: aload_0
    //   1: getfield hasZeroValue : Z
    //   4: istore_1
    //   5: iconst_0
    //   6: istore_2
    //   7: iload_1
    //   8: ifeq -> 31
    //   11: aload_0
    //   12: getfield zeroValue : Ljava/lang/Object;
    //   15: astore_3
    //   16: aload_3
    //   17: ifnull -> 31
    //   20: aload_3
    //   21: invokevirtual hashCode : ()I
    //   24: iconst_0
    //   25: iadd
    //   26: istore #4
    //   28: goto -> 34
    //   31: iconst_0
    //   32: istore #4
    //   34: aload_0
    //   35: getfield keyTable : [I
    //   38: astore #5
    //   40: aload_0
    //   41: getfield valueTable : [Ljava/lang/Object;
    //   44: astore #6
    //   46: aload_0
    //   47: getfield capacity : I
    //   50: istore #7
    //   52: aload_0
    //   53: getfield stashSize : I
    //   56: istore #8
    //   58: iload #4
    //   60: istore #9
    //   62: iload_2
    //   63: iload #7
    //   65: iload #8
    //   67: iadd
    //   68: if_icmpge -> 128
    //   71: aload #5
    //   73: iload_2
    //   74: iaload
    //   75: istore #10
    //   77: iload #9
    //   79: istore #4
    //   81: iload #10
    //   83: ifeq -> 118
    //   86: iload #9
    //   88: iload #10
    //   90: bipush #31
    //   92: imul
    //   93: iadd
    //   94: istore #9
    //   96: aload #6
    //   98: iload_2
    //   99: aaload
    //   100: astore_3
    //   101: iload #9
    //   103: istore #4
    //   105: aload_3
    //   106: ifnull -> 118
    //   109: iload #9
    //   111: aload_3
    //   112: invokevirtual hashCode : ()I
    //   115: iadd
    //   116: istore #4
    //   118: iinc #2, 1
    //   121: iload #4
    //   123: istore #9
    //   125: goto -> 62
    //   128: iload #9
    //   130: ireturn }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.size == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Iterator<Entry<V>> iterator() { return entries(); }
  
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
  
  public V put(int paramInt, V paramV) {
    if (paramInt == 0) {
      Object object = this.zeroValue;
      this.zeroValue = paramV;
      if (!this.hasZeroValue) {
        this.hasZeroValue = true;
        this.size++;
      } 
      return (V)object;
    } 
    Object[] arrayOfObject = this.keyTable;
    int i = paramInt & this.mask;
    int j = arrayOfObject[i];
    if (j == paramInt) {
      Object[] arrayOfObject1 = this.valueTable;
      arrayOfObject = arrayOfObject1[i];
      arrayOfObject1[i] = paramV;
      return (V)arrayOfObject;
    } 
    int k = hash2(paramInt);
    Object object1 = arrayOfObject[k];
    if (object1 == paramInt) {
      arrayOfObject = this.valueTable;
      Object object = arrayOfObject[k];
      arrayOfObject[k] = paramV;
      return (V)object;
    } 
    int m = hash3(paramInt);
    Object object2 = arrayOfObject[m];
    if (object2 == paramInt) {
      Object[] arrayOfObject1 = this.valueTable;
      arrayOfObject = arrayOfObject1[m];
      arrayOfObject1[m] = paramV;
      return (V)arrayOfObject;
    } 
    int n = this.capacity;
    int i1 = this.stashSize;
    for (int i2 = n; i2 < i1 + n; i2++) {
      if (arrayOfObject[i2] == paramInt) {
        arrayOfObject = this.valueTable;
        Object object = arrayOfObject[i2];
        arrayOfObject[i2] = paramV;
        return (V)object;
      } 
    } 
    if (j == 0) {
      arrayOfObject[i] = paramInt;
      this.valueTable[i] = paramV;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return null;
    } 
    if (object1 == null) {
      arrayOfObject[k] = paramInt;
      this.valueTable[k] = paramV;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return null;
    } 
    if (object2 == null) {
      arrayOfObject[m] = paramInt;
      this.valueTable[m] = paramV;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return null;
    } 
    push(paramInt, paramV, i, j, k, object1, m, object2);
    return null;
  }
  
  public void putAll(IntMap<? extends V> paramIntMap) {
    for (Entry entry : paramIntMap.entries())
      put(entry.key, entry.value); 
  }
  
  public V remove(int paramInt) {
    if (paramInt == 0) {
      if (!this.hasZeroValue)
        return null; 
      Object object = this.zeroValue;
      this.zeroValue = null;
      this.hasZeroValue = false;
      this.size--;
      return (V)object;
    } 
    int i = this.mask & paramInt;
    int[] arrayOfInt = this.keyTable;
    if (arrayOfInt[i] == paramInt) {
      arrayOfInt[i] = 0;
      Object[] arrayOfObject = this.valueTable;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.size--;
      return (V)object;
    } 
    i = hash2(paramInt);
    arrayOfInt = this.keyTable;
    if (arrayOfInt[i] == paramInt) {
      arrayOfInt[i] = 0;
      Object[] arrayOfObject = this.valueTable;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.size--;
      return (V)object;
    } 
    i = hash3(paramInt);
    arrayOfInt = this.keyTable;
    if (arrayOfInt[i] == paramInt) {
      arrayOfInt[i] = 0;
      Object[] arrayOfObject = this.valueTable;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.size--;
      return (V)object;
    } 
    return (V)removeStash(paramInt);
  }
  
  V removeStash(int paramInt) {
    int[] arrayOfInt = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfInt[k] == paramInt) {
        Object object = this.valueTable[k];
        removeStashIndex(k);
        this.size--;
        return (V)object;
      } 
    } 
    return null;
  }
  
  void removeStashIndex(int paramInt) {
    this.stashSize--;
    int i = this.capacity + this.stashSize;
    if (paramInt < i) {
      int[] arrayOfInt = this.keyTable;
      arrayOfInt[paramInt] = arrayOfInt[i];
      Object[] arrayOfObject = this.valueTable;
      arrayOfObject[paramInt] = arrayOfObject[i];
      arrayOfObject[i] = null;
    } else {
      this.valueTable[paramInt] = null;
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
    Object[] arrayOfObject = this.valueTable;
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
          stringBuilder.append(arrayOfObject[k]);
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
        stringBuilder.append(arrayOfObject[k]);
        i = k;
        continue;
      } 
      break;
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public Values<V> values() {
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
  
  public static class Entries<V> extends MapIterator<V> implements Iterable<Entry<V>>, Iterator<Entry<V>> {
    private IntMap.Entry<V> entry = new IntMap.Entry();
    
    public Entries(IntMap param1IntMap) { super(param1IntMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<IntMap.Entry<V>> iterator() { return this; }
    
    public IntMap.Entry<V> next() {
      if (this.hasNext) {
        if (this.valid) {
          IntMap.Entry entry1 = this.map.keyTable;
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
  
  public static class Entry<V> extends Object {
    public int key;
    
    public V value;
    
    public String toString() {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(this.key);
      stringBuilder.append("=");
      stringBuilder.append(this.value);
      return stringBuilder.toString();
    }
  }
  
  public static class Keys extends MapIterator {
    public Keys(IntMap param1IntMap) { super(param1IntMap); }
    
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
  
  private static class MapIterator<V> extends Object {
    static final int INDEX_ILLEGAL = -2;
    
    static final int INDEX_ZERO = -1;
    
    int currentIndex;
    
    public boolean hasNext;
    
    final IntMap<V> map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(IntMap<V> param1IntMap) {
      this.map = param1IntMap;
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
        IntMap intMap1 = this.map;
        intMap1.zeroValue = null;
        intMap1.hasZeroValue = false;
      } else {
        int i = this.currentIndex;
        if (i >= 0) {
          if (i >= this.map.capacity) {
            this.map.removeStashIndex(this.currentIndex);
            this.nextIndex = this.currentIndex - 1;
            findNextIndex();
          } else {
            this.map.keyTable[this.currentIndex] = 0;
            this.map.valueTable[this.currentIndex] = null;
          } 
        } else {
          throw new IllegalStateException("next must be called before remove.");
        } 
      } 
      this.currentIndex = -2;
      IntMap intMap = this.map;
      intMap.size--;
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
  
  public static class Values<V> extends MapIterator<V> implements Iterable<V>, Iterator<V> {
    public Values(IntMap<V> param1IntMap) { super(param1IntMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<V> iterator() { return this; }
    
    public V next() {
      if (this.hasNext) {
        if (this.valid) {
          Object object;
          if (this.nextIndex == -1) {
            object = this.map.zeroValue;
          } else {
            object = this.map.valueTable[this.nextIndex];
          } 
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return (V)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() { super.remove(); }
    
    public Array<V> toArray() {
      Array array = new Array(true, this.map.size);
      while (this.hasNext)
        array.add(next()); 
      return array;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/IntMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */