package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectFloatMap<K> extends Object implements Iterable<ObjectFloatMap.Entry<K>> {
  private static final int PRIME1 = -1105259343;
  
  private static final int PRIME2 = -1262997959;
  
  private static final int PRIME3 = -825114047;
  
  int capacity;
  
  private Entries entries1;
  
  private Entries entries2;
  
  private int hashShift;
  
  K[] keyTable;
  
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
  
  public ObjectFloatMap() { this(51, 0.8F); }
  
  public ObjectFloatMap(int paramInt) { this(paramInt, 0.8F); }
  
  public ObjectFloatMap(int paramInt, float paramFloat) {
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
          this.keyTable = (Object[])new Object[this.capacity + this.stashCapacity];
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
  
  public ObjectFloatMap(ObjectFloatMap<? extends K> paramObjectFloatMap) {
    this((int)Math.floor((paramObjectFloatMap.capacity * paramObjectFloatMap.loadFactor)), paramObjectFloatMap.loadFactor);
    this.stashSize = paramObjectFloatMap.stashSize;
    Object[] arrayOfObject = paramObjectFloatMap.keyTable;
    System.arraycopy(arrayOfObject, 0, this.keyTable, 0, arrayOfObject.length);
    float[] arrayOfFloat = paramObjectFloatMap.valueTable;
    System.arraycopy(arrayOfFloat, 0, this.valueTable, 0, arrayOfFloat.length);
    this.size = paramObjectFloatMap.size;
  }
  
  private boolean containsKeyStash(K paramK) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramK.equals(arrayOfObject[k]))
        return true; 
    } 
    return false;
  }
  
  private float getAndIncrementStash(K paramK, float paramFloat1, float paramFloat2) {
    K k;
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int m = i; m < j + i; m++) {
      if (paramK.equals(arrayOfObject[m])) {
        paramK = (K)this.valueTable;
        k = paramK[m];
        paramK[m] = paramFloat2 + k;
        return k;
      } 
    } 
    put(paramK, paramFloat2 + k);
    return k;
  }
  
  private float getStash(K paramK, float paramFloat) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramK.equals(arrayOfObject[k]))
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
  
  private void push(K paramK1, float paramFloat, int paramInt1, K paramK2, int paramInt2, K paramK3, int paramInt3, K paramK4) {
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = paramInt1;
    int m = paramInt2;
    paramInt2 = paramInt3;
    paramInt1 = 0;
    paramInt3 = m;
    float f = paramFloat;
    K k1 = paramK1;
    do {
      m = MathUtils.random(2);
      if (m != 0) {
        if (m != 1) {
          paramFloat = arrayOfFloat[paramInt2];
          arrayOfObject[paramInt2] = k1;
          arrayOfFloat[paramInt2] = f;
          paramK1 = paramK4;
        } else {
          paramFloat = arrayOfFloat[paramInt3];
          arrayOfObject[paramInt3] = k1;
          arrayOfFloat[paramInt3] = f;
          paramK1 = paramK3;
        } 
      } else {
        paramFloat = arrayOfFloat[k];
        arrayOfObject[k] = k1;
        arrayOfFloat[k] = f;
        paramK1 = paramK2;
      } 
      paramInt2 = paramK1.hashCode();
      k = paramInt2 & i;
      paramK2 = (K)arrayOfObject[k];
      if (paramK2 == null) {
        arrayOfObject[k] = paramK1;
        arrayOfFloat[k] = paramFloat;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt3 = hash2(paramInt2);
      paramK3 = (K)arrayOfObject[paramInt3];
      if (paramK3 == null) {
        arrayOfObject[paramInt3] = paramK1;
        arrayOfFloat[paramInt3] = paramFloat;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt2 = hash3(paramInt2);
      paramK4 = (K)arrayOfObject[paramInt2];
      if (paramK4 == null) {
        arrayOfObject[paramInt2] = paramK1;
        arrayOfFloat[paramInt2] = paramFloat;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      m = paramInt1 + 1;
      k1 = paramK1;
      f = paramFloat;
      paramInt1 = m;
    } while (m != j);
    putStash(paramK1, paramFloat);
  }
  
  private void putResize(K paramK, float paramFloat) {
    int i = paramK.hashCode();
    int j = i & this.mask;
    Object[] arrayOfObject1 = this.keyTable;
    Object object2 = arrayOfObject1[j];
    if (object2 == null) {
      arrayOfObject1[j] = paramK;
      this.valueTable[j] = paramFloat;
      int m = this.size;
      this.size = m + 1;
      if (m >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int k = hash2(i);
    Object[] arrayOfObject2 = this.keyTable;
    Object object1 = arrayOfObject2[k];
    if (object1 == null) {
      arrayOfObject2[k] = paramK;
      this.valueTable[k] = paramFloat;
      k = this.size;
      this.size = k + 1;
      if (k >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    i = hash3(i);
    Object[] arrayOfObject3 = this.keyTable;
    Object object3 = arrayOfObject3[i];
    if (object3 == null) {
      arrayOfObject3[i] = paramK;
      this.valueTable[i] = paramFloat;
      k = this.size;
      this.size = k + 1;
      if (k >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramK, paramFloat, j, object2, k, object1, i, object3);
  }
  
  private void putStash(K paramK, float paramFloat) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramK, paramFloat);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramK;
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
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = (Object[])new Object[paramInt + k];
    this.valueTable = new float[paramInt + k];
    k = this.size;
    paramInt = 0;
    this.size = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        Object object = arrayOfObject[paramInt];
        if (object != null)
          putResize(object, arrayOfFloat[paramInt]); 
        paramInt++;
      }  
  }
  
  public void clear() {
    if (this.size == 0)
      return; 
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        arrayOfObject[j] = null;
        i = j;
        continue;
      } 
      break;
    } 
    this.size = 0;
    this.stashSize = 0;
  }
  
  public void clear(int paramInt) {
    if (this.capacity <= paramInt) {
      clear();
      return;
    } 
    this.size = 0;
    resize(paramInt);
  }
  
  public boolean containsKey(K paramK) {
    int i = paramK.hashCode();
    int j = this.mask;
    if (!paramK.equals(this.keyTable[j & i])) {
      j = hash2(i);
      if (!paramK.equals(this.keyTable[j])) {
        i = hash3(i);
        if (!paramK.equals(this.keyTable[i]))
          return containsKeyStash(paramK); 
      } 
    } 
    return true;
  }
  
  public boolean containsValue(float paramFloat) {
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfObject[j] != null && arrayOfFloat[j] == paramFloat)
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
  
  public Entries<K> entries() {
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
    if (!(paramObject instanceof ObjectFloatMap))
      return false; 
    paramObject = (ObjectFloatMap)paramObject;
    if (paramObject.size != this.size)
      return false; 
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      Object object = arrayOfObject[b];
      if (object != null) {
        float f = paramObject.get(object, 0.0F);
        if (f == 0.0F && !paramObject.containsKey(object))
          return false; 
        if (f != arrayOfFloat[b])
          return false; 
      } 
    } 
    return true;
  }
  
  public K findKey(float paramFloat) {
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfObject[j] != null && arrayOfFloat[j] == paramFloat)
          return (K)arrayOfObject[j]; 
        i = j;
        continue;
      } 
      break;
    } 
    return null;
  }
  
  public float get(K paramK, float paramFloat) {
    int i = paramK.hashCode();
    int j = this.mask & i;
    int k = j;
    if (!paramK.equals(this.keyTable[j])) {
      j = hash2(i);
      k = j;
      if (!paramK.equals(this.keyTable[j])) {
        j = hash3(i);
        k = j;
        if (!paramK.equals(this.keyTable[j]))
          return getStash(paramK, paramFloat); 
      } 
    } 
    return this.valueTable[k];
  }
  
  public float getAndIncrement(K paramK, float paramFloat1, float paramFloat2) {
    int i = paramK.hashCode();
    int j = this.mask & i;
    int m = j;
    if (!paramK.equals(this.keyTable[j])) {
      j = hash2(i);
      m = j;
      if (!paramK.equals(this.keyTable[j])) {
        j = hash3(i);
        m = j;
        if (!paramK.equals(this.keyTable[j]))
          return getAndIncrementStash(paramK, paramFloat1, paramFloat2); 
      } 
    } 
    paramK = (K)this.valueTable;
    K k = paramK[m];
    paramK[m] = paramFloat2 + k;
    return k;
  }
  
  public int hashCode() {
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    byte b = 0;
    int k;
    for (k = 0; b < i + j; k = m) {
      Object object = arrayOfObject[b];
      int m = k;
      if (object != null)
        m = k + object.hashCode() * 31 + Float.floatToIntBits(arrayOfFloat[b]); 
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
  
  public Entries<K> iterator() { return entries(); }
  
  public Keys<K> keys() {
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
  
  public void put(K paramK, float paramFloat) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 339
    //   4: aload_0
    //   5: getfield keyTable : [Ljava/lang/Object;
    //   8: astore_3
    //   9: aload_1
    //   10: invokevirtual hashCode : ()I
    //   13: istore #4
    //   15: iload #4
    //   17: aload_0
    //   18: getfield mask : I
    //   21: iand
    //   22: istore #5
    //   24: aload_3
    //   25: iload #5
    //   27: aaload
    //   28: astore #6
    //   30: aload_1
    //   31: aload #6
    //   33: invokevirtual equals : (Ljava/lang/Object;)Z
    //   36: ifeq -> 48
    //   39: aload_0
    //   40: getfield valueTable : [F
    //   43: iload #5
    //   45: fload_2
    //   46: fastore
    //   47: return
    //   48: aload_0
    //   49: iload #4
    //   51: invokespecial hash2 : (I)I
    //   54: istore #7
    //   56: aload_3
    //   57: iload #7
    //   59: aaload
    //   60: astore #8
    //   62: aload_1
    //   63: aload #8
    //   65: invokevirtual equals : (Ljava/lang/Object;)Z
    //   68: ifeq -> 80
    //   71: aload_0
    //   72: getfield valueTable : [F
    //   75: iload #7
    //   77: fload_2
    //   78: fastore
    //   79: return
    //   80: aload_0
    //   81: iload #4
    //   83: invokespecial hash3 : (I)I
    //   86: istore #9
    //   88: aload_3
    //   89: iload #9
    //   91: aaload
    //   92: astore #10
    //   94: aload_1
    //   95: aload #10
    //   97: invokevirtual equals : (Ljava/lang/Object;)Z
    //   100: ifeq -> 112
    //   103: aload_0
    //   104: getfield valueTable : [F
    //   107: iload #9
    //   109: fload_2
    //   110: fastore
    //   111: return
    //   112: aload_0
    //   113: getfield capacity : I
    //   116: istore #11
    //   118: aload_0
    //   119: getfield stashSize : I
    //   122: istore #12
    //   124: iload #11
    //   126: istore #4
    //   128: iload #4
    //   130: iload #12
    //   132: iload #11
    //   134: iadd
    //   135: if_icmpge -> 164
    //   138: aload_1
    //   139: aload_3
    //   140: iload #4
    //   142: aaload
    //   143: invokevirtual equals : (Ljava/lang/Object;)Z
    //   146: ifeq -> 158
    //   149: aload_0
    //   150: getfield valueTable : [F
    //   153: iload #4
    //   155: fload_2
    //   156: fastore
    //   157: return
    //   158: iinc #4, 1
    //   161: goto -> 128
    //   164: aload #6
    //   166: ifnonnull -> 216
    //   169: aload_3
    //   170: iload #5
    //   172: aload_1
    //   173: aastore
    //   174: aload_0
    //   175: getfield valueTable : [F
    //   178: iload #5
    //   180: fload_2
    //   181: fastore
    //   182: aload_0
    //   183: getfield size : I
    //   186: istore #4
    //   188: aload_0
    //   189: iload #4
    //   191: iconst_1
    //   192: iadd
    //   193: putfield size : I
    //   196: iload #4
    //   198: aload_0
    //   199: getfield threshold : I
    //   202: if_icmplt -> 215
    //   205: aload_0
    //   206: aload_0
    //   207: getfield capacity : I
    //   210: iconst_1
    //   211: ishl
    //   212: invokespecial resize : (I)V
    //   215: return
    //   216: aload #8
    //   218: ifnonnull -> 268
    //   221: aload_3
    //   222: iload #7
    //   224: aload_1
    //   225: aastore
    //   226: aload_0
    //   227: getfield valueTable : [F
    //   230: iload #7
    //   232: fload_2
    //   233: fastore
    //   234: aload_0
    //   235: getfield size : I
    //   238: istore #4
    //   240: aload_0
    //   241: iload #4
    //   243: iconst_1
    //   244: iadd
    //   245: putfield size : I
    //   248: iload #4
    //   250: aload_0
    //   251: getfield threshold : I
    //   254: if_icmplt -> 267
    //   257: aload_0
    //   258: aload_0
    //   259: getfield capacity : I
    //   262: iconst_1
    //   263: ishl
    //   264: invokespecial resize : (I)V
    //   267: return
    //   268: aload #10
    //   270: ifnonnull -> 320
    //   273: aload_3
    //   274: iload #9
    //   276: aload_1
    //   277: aastore
    //   278: aload_0
    //   279: getfield valueTable : [F
    //   282: iload #9
    //   284: fload_2
    //   285: fastore
    //   286: aload_0
    //   287: getfield size : I
    //   290: istore #4
    //   292: aload_0
    //   293: iload #4
    //   295: iconst_1
    //   296: iadd
    //   297: putfield size : I
    //   300: iload #4
    //   302: aload_0
    //   303: getfield threshold : I
    //   306: if_icmplt -> 319
    //   309: aload_0
    //   310: aload_0
    //   311: getfield capacity : I
    //   314: iconst_1
    //   315: ishl
    //   316: invokespecial resize : (I)V
    //   319: return
    //   320: aload_0
    //   321: aload_1
    //   322: fload_2
    //   323: iload #5
    //   325: aload #6
    //   327: iload #7
    //   329: aload #8
    //   331: iload #9
    //   333: aload #10
    //   335: invokespecial push : (Ljava/lang/Object;FILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    //   338: return
    //   339: new java/lang/IllegalArgumentException
    //   342: dup
    //   343: ldc_w 'key cannot be null.'
    //   346: invokespecial <init> : (Ljava/lang/String;)V
    //   349: astore_1
    //   350: goto -> 355
    //   353: aload_1
    //   354: athrow
    //   355: goto -> 353 }
  
  public void putAll(ObjectFloatMap<? extends K> paramObjectFloatMap) {
    Entries entries = paramObjectFloatMap.entries().iterator();
    while (entries.hasNext()) {
      Entry entry = (Entry)entries.next();
      put(entry.key, entry.value);
    } 
  }
  
  public float remove(K paramK, float paramFloat) {
    int i = paramK.hashCode();
    int j = this.mask & i;
    if (paramK.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      paramFloat = this.valueTable[j];
      this.size--;
      return paramFloat;
    } 
    j = hash2(i);
    if (paramK.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      paramFloat = this.valueTable[j];
      this.size--;
      return paramFloat;
    } 
    i = hash3(i);
    if (paramK.equals(this.keyTable[i])) {
      this.keyTable[i] = null;
      paramFloat = this.valueTable[i];
      this.size--;
      return paramFloat;
    } 
    return removeStash(paramK, paramFloat);
  }
  
  float removeStash(K paramK, float paramFloat) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramK.equals(arrayOfObject[k])) {
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
      Object[] arrayOfObject = this.keyTable;
      arrayOfObject[paramInt] = arrayOfObject[i];
      float[] arrayOfFloat = this.valueTable;
      arrayOfFloat[paramInt] = arrayOfFloat[i];
      arrayOfObject[i] = null;
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
      return "{}"; 
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('{');
    Object[] arrayOfObject = this.keyTable;
    float[] arrayOfFloat = this.valueTable;
    int i = arrayOfObject.length;
    while (true) {
      int k = i - 1;
      j = k;
      if (i > 0) {
        Object object = arrayOfObject[k];
        if (object == null) {
          i = k;
          continue;
        } 
        stringBuilder.append(object);
        stringBuilder.append('=');
        stringBuilder.append(arrayOfFloat[k]);
        j = k;
      } 
      break;
    } 
    while (true) {
      i = j - 1;
      if (j > 0) {
        Object object = arrayOfObject[i];
        if (object != null) {
          stringBuilder.append(", ");
          stringBuilder.append(object);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfFloat[i]);
        } 
        j = i;
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
  
  public static class Entries<K> extends MapIterator<K> implements Iterable<Entry<K>>, Iterator<Entry<K>> {
    private ObjectFloatMap.Entry<K> entry = new ObjectFloatMap.Entry();
    
    public Entries(ObjectFloatMap<K> param1ObjectFloatMap) { super(param1ObjectFloatMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Entries<K> iterator() { return this; }
    
    public ObjectFloatMap.Entry<K> next() {
      if (this.hasNext) {
        if (this.valid) {
          Object[] arrayOfObject = this.map.keyTable;
          this.entry.key = arrayOfObject[this.nextIndex];
          this.entry.value = this.map.valueTable[this.nextIndex];
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
  
  public static class Entry<K> extends Object {
    public K key;
    
    public float value;
    
    public String toString() {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(this.key);
      stringBuilder.append("=");
      stringBuilder.append(this.value);
      return stringBuilder.toString();
    }
  }
  
  public static class Keys<K> extends MapIterator<K> implements Iterable<K>, Iterator<K> {
    public Keys(ObjectFloatMap<K> param1ObjectFloatMap) { super(param1ObjectFloatMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Keys<K> iterator() { return this; }
    
    public K next() {
      if (this.hasNext) {
        if (this.valid) {
          Object object = this.map.keyTable[this.nextIndex];
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return (K)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() { super.remove(); }
    
    public Array<K> toArray() {
      Array array = new Array(true, this.map.size);
      while (this.hasNext)
        array.add(next()); 
      return array;
    }
    
    public Array<K> toArray(Array<K> param1Array) {
      while (this.hasNext)
        param1Array.add(next()); 
      return param1Array;
    }
  }
  
  private static class MapIterator<K> extends Object {
    int currentIndex;
    
    public boolean hasNext;
    
    final ObjectFloatMap<K> map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(ObjectFloatMap<K> param1ObjectFloatMap) {
      this.map = param1ObjectFloatMap;
      reset();
    }
    
    void findNextIndex() {
      this.hasNext = false;
      Object[] arrayOfObject = this.map.keyTable;
      int i = this.map.capacity;
      int j = this.map.stashSize;
      while (true) {
        int k = this.nextIndex + 1;
        this.nextIndex = k;
        if (k < i + j) {
          if (arrayOfObject[this.nextIndex] != null) {
            this.hasNext = true;
            break;
          } 
          continue;
        } 
        break;
      } 
    }
    
    public void remove() {
      int i = this.currentIndex;
      if (i >= 0) {
        if (i >= this.map.capacity) {
          this.map.removeStashIndex(this.currentIndex);
          this.nextIndex = this.currentIndex - 1;
          findNextIndex();
        } else {
          this.map.keyTable[this.currentIndex] = null;
        } 
        this.currentIndex = -1;
        ObjectFloatMap objectFloatMap = this.map;
        objectFloatMap.size--;
        return;
      } 
      throw new IllegalStateException("next must be called before remove.");
    }
    
    public void reset() {
      this.currentIndex = -1;
      this.nextIndex = -1;
      findNextIndex();
    }
  }
  
  public static class Values extends MapIterator<Object> {
    public Values(ObjectFloatMap<?> param1ObjectFloatMap) { super(param1ObjectFloatMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public float next() {
      if (this.hasNext) {
        if (this.valid) {
          float f = this.map.valueTable[this.nextIndex];
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ObjectFloatMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */