package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class LongMap<V> extends Object implements Iterable<LongMap.Entry<V>> {
  private static final int EMPTY = 0;
  
  private static final int PRIME1 = -1105259343;
  
  private static final int PRIME2 = -1262997959;
  
  private static final int PRIME3 = -825114047;
  
  int capacity;
  
  private Entries entries1;
  
  private Entries entries2;
  
  boolean hasZeroValue;
  
  private int hashShift;
  
  long[] keyTable;
  
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
  
  public LongMap() { this(51, 0.8F); }
  
  public LongMap(int paramInt) { this(paramInt, 0.8F); }
  
  public LongMap(int paramInt, float paramFloat) {
    if (paramInt >= 0) {
      paramInt = MathUtils.nextPowerOfTwo((int)Math.ceil((paramInt / paramFloat)));
      if (paramInt <= 1073741824) {
        this.capacity = paramInt;
        if (paramFloat > 0.0F) {
          this.loadFactor = paramFloat;
          paramInt = this.capacity;
          this.threshold = (int)(paramInt * paramFloat);
          this.mask = paramInt - 1;
          this.hashShift = 63 - Long.numberOfTrailingZeros(paramInt);
          this.stashCapacity = Math.max(3, (int)Math.ceil(Math.log(this.capacity)) * 2);
          this.pushIterations = Math.max(Math.min(this.capacity, 8), (int)Math.sqrt(this.capacity) / 8);
          this.keyTable = new long[this.capacity + this.stashCapacity];
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
  
  public LongMap(LongMap<? extends V> paramLongMap) {
    this((int)Math.floor((paramLongMap.capacity * paramLongMap.loadFactor)), paramLongMap.loadFactor);
    this.stashSize = paramLongMap.stashSize;
    long[] arrayOfLong = paramLongMap.keyTable;
    System.arraycopy(arrayOfLong, 0, this.keyTable, 0, arrayOfLong.length);
    Object[] arrayOfObject = paramLongMap.valueTable;
    System.arraycopy(arrayOfObject, 0, this.valueTable, 0, arrayOfObject.length);
    this.size = paramLongMap.size;
    this.zeroValue = paramLongMap.zeroValue;
    this.hasZeroValue = paramLongMap.hasZeroValue;
  }
  
  private boolean containsKeyStash(long paramLong) {
    long[] arrayOfLong = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfLong[k] == paramLong)
        return true; 
    } 
    return false;
  }
  
  private V getStash(long paramLong, V paramV) {
    long[] arrayOfLong = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfLong[k] == paramLong)
        return (V)this.valueTable[k]; 
    } 
    return paramV;
  }
  
  private int hash2(long paramLong) {
    paramLong *= -1262997959L;
    return (int)((paramLong ^ paramLong >>> this.hashShift) & this.mask);
  }
  
  private int hash3(long paramLong) {
    paramLong *= -825114047L;
    return (int)((paramLong ^ paramLong >>> this.hashShift) & this.mask);
  }
  
  private void push(long paramLong1, V paramV, int paramInt1, long paramLong2, int paramInt2, long paramLong3, int paramInt3, long paramLong4) {
    long[] arrayOfLong = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    long l1 = paramLong1;
    int k = paramInt1;
    long l2 = paramLong2;
    paramLong1 = paramLong3;
    int m = paramInt3;
    paramLong2 = paramLong4;
    paramInt1 = 0;
    paramInt3 = paramInt2;
    paramInt2 = k;
    paramLong3 = l2;
    k = m;
    while (true) {
      m = MathUtils.random(2);
      if (m != 0) {
        if (m != 1) {
          Object object = arrayOfObject[k];
          arrayOfLong[k] = l1;
          arrayOfObject[k] = paramV;
          paramLong1 = paramLong2;
          paramV = (V)object;
        } else {
          Object object = arrayOfObject[paramInt3];
          arrayOfLong[paramInt3] = l1;
          arrayOfObject[paramInt3] = paramV;
          paramV = (V)object;
        } 
      } else {
        Object object = arrayOfObject[paramInt2];
        arrayOfLong[paramInt2] = l1;
        arrayOfObject[paramInt2] = paramV;
        paramV = (V)object;
        paramLong1 = paramLong3;
      } 
      paramInt2 = (int)(i & paramLong1);
      paramLong3 = arrayOfLong[paramInt2];
      if (paramLong3 == 0L) {
        arrayOfLong[paramInt2] = paramLong1;
        arrayOfObject[paramInt2] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt3 = hash2(paramLong1);
      paramLong4 = arrayOfLong[paramInt3];
      if (paramLong4 == 0L) {
        arrayOfLong[paramInt3] = paramLong1;
        arrayOfObject[paramInt3] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      k = hash3(paramLong1);
      paramLong2 = arrayOfLong[k];
      if (paramLong2 == 0L) {
        arrayOfLong[k] = paramLong1;
        arrayOfObject[k] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      if (++paramInt1 == j) {
        putStash(paramLong1, paramV);
        return;
      } 
      l1 = paramLong1;
      paramLong1 = paramLong4;
    } 
  }
  
  private void putResize(long paramLong, V paramV) {
    if (paramLong == 0L) {
      this.zeroValue = paramV;
      this.hasZeroValue = true;
      return;
    } 
    int i = (int)(paramLong & this.mask);
    long[] arrayOfLong = this.keyTable;
    long l1 = arrayOfLong[i];
    if (l1 == 0L) {
      arrayOfLong[i] = paramLong;
      this.valueTable[i] = paramV;
      int m = this.size;
      this.size = m + 1;
      if (m >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int k = hash2(paramLong);
    arrayOfLong = this.keyTable;
    long l2 = arrayOfLong[k];
    if (l2 == 0L) {
      arrayOfLong[k] = paramLong;
      this.valueTable[k] = paramV;
      int m = this.size;
      this.size = m + 1;
      if (m >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int j = hash3(paramLong);
    arrayOfLong = this.keyTable;
    long l3 = arrayOfLong[j];
    if (l3 == 0L) {
      arrayOfLong[j] = paramLong;
      this.valueTable[j] = paramV;
      j = this.size;
      this.size = j + 1;
      if (j >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramLong, paramV, i, l1, k, l2, j, l3);
  }
  
  private void putStash(long paramLong, V paramV) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramLong, paramV);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramLong;
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
    this.hashShift = 63 - Long.numberOfTrailingZeros(paramInt);
    double d = paramInt;
    this.stashCapacity = Math.max(3, (int)Math.ceil(Math.log(d)) * 2);
    this.pushIterations = Math.max(Math.min(paramInt, 8), (int)Math.sqrt(d) / 8);
    long[] arrayOfLong = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = new long[paramInt + k];
    this.valueTable = (Object[])new Object[paramInt + k];
    k = this.size;
    this.size = this.hasZeroValue;
    paramInt = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        long l = arrayOfLong[paramInt];
        if (l != 0L)
          putResize(l, arrayOfObject[paramInt]); 
        paramInt++;
      }  
  }
  
  public void clear() {
    if (this.size == 0)
      return; 
    long[] arrayOfLong = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        arrayOfLong[j] = 0L;
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
  
  public boolean containsKey(long paramLong) {
    if (paramLong == 0L)
      return this.hasZeroValue; 
    int i = (int)(this.mask & paramLong);
    if (this.keyTable[i] != paramLong) {
      i = hash2(paramLong);
      if (this.keyTable[i] != paramLong) {
        i = hash3(paramLong);
        if (this.keyTable[i] != paramLong)
          return containsKeyStash(paramLong); 
      } 
    } 
    return true;
  }
  
  public boolean containsValue(Object paramObject, boolean paramBoolean) {
    long[] arrayOfLong;
    Object[] arrayOfObject = this.valueTable;
    if (paramObject == null) {
      if (this.hasZeroValue && this.zeroValue == null)
        return true; 
      arrayOfLong = this.keyTable;
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfLong[j] != 0L && arrayOfObject[j] == null)
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
    } else if (paramBoolean) {
      if (arrayOfLong == this.zeroValue)
        return true; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject[j] == arrayOfLong)
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
    } else {
      if (this.hasZeroValue && arrayOfLong.equals(this.zeroValue))
        return true; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfLong.equals(arrayOfObject[j]))
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
    if (!(paramObject instanceof LongMap))
      return false; 
    paramObject = (LongMap)paramObject;
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
    long[] arrayOfLong = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      long l = arrayOfLong[b];
      if (l != 0L) {
        Object object = arrayOfObject[b];
        if (object == null) {
          if (paramObject.get(l, ObjectMap.dummy) != null)
            return false; 
        } else if (!object.equals(paramObject.get(l))) {
          return false;
        } 
      } 
    } 
    return true;
  }
  
  public boolean equalsIdentity(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof LongMap))
      return false; 
    LongMap longMap = (LongMap)paramObject;
    if (longMap.size != this.size)
      return false; 
    boolean bool1 = longMap.hasZeroValue;
    boolean bool2 = this.hasZeroValue;
    if (bool1 != bool2)
      return false; 
    if (bool2 && this.zeroValue != longMap.zeroValue)
      return false; 
    long[] arrayOfLong = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      long l = arrayOfLong[b];
      if (l != 0L && arrayOfObject[b] != longMap.get(l, ObjectMap.dummy))
        return false; 
    } 
    return true;
  }
  
  public long findKey(Object paramObject, boolean paramBoolean, long paramLong) {
    long[] arrayOfLong;
    Object[] arrayOfObject = this.valueTable;
    if (paramObject == null) {
      if (this.hasZeroValue && this.zeroValue == null)
        return 0L; 
      arrayOfLong = this.keyTable;
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfLong[j] != 0L && arrayOfObject[j] == null)
            return arrayOfLong[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } else if (paramBoolean) {
      if (arrayOfLong == this.zeroValue)
        return 0L; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject[j] == arrayOfLong)
            return this.keyTable[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } else {
      if (this.hasZeroValue && arrayOfLong.equals(this.zeroValue))
        return 0L; 
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfLong.equals(arrayOfObject[j]))
            return this.keyTable[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } 
    return paramLong;
  }
  
  public V get(long paramLong) {
    if (paramLong == 0L)
      return !this.hasZeroValue ? null : (V)this.zeroValue; 
    int i = (int)(this.mask & paramLong);
    int j = i;
    if (this.keyTable[i] != paramLong) {
      i = hash2(paramLong);
      j = i;
      if (this.keyTable[i] != paramLong) {
        i = hash3(paramLong);
        j = i;
        if (this.keyTable[i] != paramLong)
          return (V)getStash(paramLong, null); 
      } 
    } 
    return (V)this.valueTable[j];
  }
  
  public V get(long paramLong, V paramV) {
    if (paramLong == 0L)
      return !this.hasZeroValue ? paramV : (V)this.zeroValue; 
    int i = (int)(this.mask & paramLong);
    int j = i;
    if (this.keyTable[i] != paramLong) {
      i = hash2(paramLong);
      j = i;
      if (this.keyTable[i] != paramLong) {
        i = hash3(paramLong);
        j = i;
        if (this.keyTable[i] != paramLong)
          return (V)getStash(paramLong, paramV); 
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
    //   35: getfield keyTable : [J
    //   38: astore #5
    //   40: aload_0
    //   41: getfield valueTable : [Ljava/lang/Object;
    //   44: astore_3
    //   45: aload_0
    //   46: getfield capacity : I
    //   49: istore #6
    //   51: aload_0
    //   52: getfield stashSize : I
    //   55: istore #7
    //   57: iload #4
    //   59: istore #8
    //   61: iload_2
    //   62: iload #6
    //   64: iload #7
    //   66: iadd
    //   67: if_icmpge -> 138
    //   70: aload #5
    //   72: iload_2
    //   73: laload
    //   74: lstore #9
    //   76: iload #8
    //   78: istore #4
    //   80: lload #9
    //   82: lconst_0
    //   83: lcmp
    //   84: ifeq -> 128
    //   87: iload #8
    //   89: lload #9
    //   91: lload #9
    //   93: bipush #32
    //   95: lushr
    //   96: lxor
    //   97: l2i
    //   98: bipush #31
    //   100: imul
    //   101: iadd
    //   102: istore #8
    //   104: aload_3
    //   105: iload_2
    //   106: aaload
    //   107: astore #11
    //   109: iload #8
    //   111: istore #4
    //   113: aload #11
    //   115: ifnull -> 128
    //   118: iload #8
    //   120: aload #11
    //   122: invokevirtual hashCode : ()I
    //   125: iadd
    //   126: istore #4
    //   128: iinc #2, 1
    //   131: iload #4
    //   133: istore #8
    //   135: goto -> 61
    //   138: iload #8
    //   140: ireturn }
  
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
  
  public V put(long paramLong, V paramV) {
    if (paramLong == 0L) {
      Object object = this.zeroValue;
      this.zeroValue = paramV;
      if (!this.hasZeroValue) {
        this.hasZeroValue = true;
        this.size++;
      } 
      return (V)object;
    } 
    Object object1 = this.keyTable;
    int i = (int)(paramLong & this.mask);
    long l = object1[i];
    if (l == paramLong) {
      object1 = this.valueTable;
      Object object = object1[i];
      object1[i] = paramV;
      return (V)object;
    } 
    int j = hash2(paramLong);
    Object object2 = object1[j];
    if (object2 == paramLong) {
      object1 = this.valueTable;
      Object object = object1[j];
      object1[j] = paramV;
      return (V)object;
    } 
    int k = hash3(paramLong);
    Object object3 = object1[k];
    if (object3 == paramLong) {
      object1 = this.valueTable;
      Object object = object1[k];
      object1[k] = paramV;
      return (V)object;
    } 
    int m = this.capacity;
    int n = this.stashSize;
    int i1;
    for (i1 = m; i1 < n + m; i1++) {
      if (object1[i1] == paramLong) {
        Object[] arrayOfObject = this.valueTable;
        object1 = arrayOfObject[i1];
        arrayOfObject[i1] = paramV;
        return (V)object1;
      } 
    } 
    if (l == 0L) {
      object1[i] = paramLong;
      this.valueTable[i] = paramV;
      i1 = this.size;
      this.size = i1 + 1;
      if (i1 >= this.threshold)
        resize(this.capacity << 1); 
      return null;
    } 
    if (object2 == 0L) {
      object1[j] = paramLong;
      this.valueTable[j] = paramV;
      i1 = this.size;
      this.size = i1 + 1;
      if (i1 >= this.threshold)
        resize(this.capacity << 1); 
      return null;
    } 
    if (object3 == 0L) {
      object1[k] = paramLong;
      this.valueTable[k] = paramV;
      i1 = this.size;
      this.size = i1 + 1;
      if (i1 >= this.threshold)
        resize(this.capacity << 1); 
      return null;
    } 
    push(paramLong, paramV, i, l, j, object2, k, object3);
    return null;
  }
  
  public void putAll(LongMap<? extends V> paramLongMap) {
    for (Entry entry : paramLongMap.entries())
      put(entry.key, entry.value); 
  }
  
  public V remove(long paramLong) {
    if (paramLong == 0L) {
      if (!this.hasZeroValue)
        return null; 
      Object object = this.zeroValue;
      this.zeroValue = null;
      this.hasZeroValue = false;
      this.size--;
      return (V)object;
    } 
    int i = (int)(this.mask & paramLong);
    long[] arrayOfLong = this.keyTable;
    if (arrayOfLong[i] == paramLong) {
      arrayOfLong[i] = 0L;
      Object[] arrayOfObject = this.valueTable;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.size--;
      return (V)object;
    } 
    i = hash2(paramLong);
    arrayOfLong = this.keyTable;
    if (arrayOfLong[i] == paramLong) {
      arrayOfLong[i] = 0L;
      Object[] arrayOfObject = this.valueTable;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.size--;
      return (V)object;
    } 
    i = hash3(paramLong);
    arrayOfLong = this.keyTable;
    if (arrayOfLong[i] == paramLong) {
      arrayOfLong[i] = 0L;
      Object[] arrayOfObject = this.valueTable;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.size--;
      return (V)object;
    } 
    return (V)removeStash(paramLong);
  }
  
  V removeStash(long paramLong) {
    long[] arrayOfLong = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfLong[k] == paramLong) {
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
      long[] arrayOfLong = this.keyTable;
      arrayOfLong[paramInt] = arrayOfLong[i];
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
    int j;
    if (this.size == 0)
      return "[]"; 
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    long[] arrayOfLong = this.keyTable;
    Object[] arrayOfObject = this.valueTable;
    int i = arrayOfLong.length;
    while (true) {
      int k = i - 1;
      j = k;
      if (i > 0) {
        long l = arrayOfLong[k];
        if (l == 0L) {
          i = k;
          continue;
        } 
        stringBuilder.append(l);
        stringBuilder.append('=');
        stringBuilder.append(arrayOfObject[k]);
        j = k;
      } 
      break;
    } 
    while (true) {
      i = j - 1;
      if (j > 0) {
        long l = arrayOfLong[i];
        if (l != 0L) {
          stringBuilder.append(", ");
          stringBuilder.append(l);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfObject[i]);
        } 
        j = i;
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
    private LongMap.Entry<V> entry = new LongMap.Entry();
    
    public Entries(LongMap param1LongMap) { super(param1LongMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<LongMap.Entry<V>> iterator() { return this; }
    
    public LongMap.Entry<V> next() {
      if (this.hasNext) {
        if (this.valid) {
          LongMap.Entry entry1 = this.map.keyTable;
          if (this.nextIndex == -1) {
            entry1 = this.entry;
            entry1.key = 0L;
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
    public long key;
    
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
    public Keys(LongMap param1LongMap) { super(param1LongMap); }
    
    public long next() {
      if (this.hasNext) {
        if (this.valid) {
          long l;
          if (this.nextIndex == -1) {
            l = 0L;
          } else {
            l = this.map.keyTable[this.nextIndex];
          } 
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return l;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public LongArray toArray() {
      LongArray longArray = new LongArray(true, this.map.size);
      while (this.hasNext)
        longArray.add(next()); 
      return longArray;
    }
  }
  
  private static class MapIterator<V> extends Object {
    static final int INDEX_ILLEGAL = -2;
    
    static final int INDEX_ZERO = -1;
    
    int currentIndex;
    
    public boolean hasNext;
    
    final LongMap<V> map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(LongMap<V> param1LongMap) {
      this.map = param1LongMap;
      reset();
    }
    
    void findNextIndex() {
      this.hasNext = false;
      long[] arrayOfLong = this.map.keyTable;
      int i = this.map.capacity;
      int j = this.map.stashSize;
      while (true) {
        int k = this.nextIndex + 1;
        this.nextIndex = k;
        if (k < i + j) {
          if (arrayOfLong[this.nextIndex] != 0L) {
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
        LongMap longMap1 = this.map;
        longMap1.zeroValue = null;
        longMap1.hasZeroValue = false;
      } else {
        int i = this.currentIndex;
        if (i >= 0) {
          if (i >= this.map.capacity) {
            this.map.removeStashIndex(this.currentIndex);
            this.nextIndex = this.currentIndex - 1;
            findNextIndex();
          } else {
            this.map.keyTable[this.currentIndex] = 0L;
            this.map.valueTable[this.currentIndex] = null;
          } 
        } else {
          throw new IllegalStateException("next must be called before remove.");
        } 
      } 
      this.currentIndex = -2;
      LongMap longMap = this.map;
      longMap.size--;
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
    public Values(LongMap<V> param1LongMap) { super(param1LongMap); }
    
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/LongMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */