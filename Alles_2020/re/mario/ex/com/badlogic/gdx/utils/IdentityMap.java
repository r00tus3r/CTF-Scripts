package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IdentityMap<K, V> extends Object implements Iterable<ObjectMap.Entry<K, V>> {
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
  
  V[] valueTable;
  
  private Values values1;
  
  private Values values2;
  
  public IdentityMap() { this(51, 0.8F); }
  
  public IdentityMap(int paramInt) { this(paramInt, 0.8F); }
  
  public IdentityMap(int paramInt, float paramFloat) {
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
  
  public IdentityMap(IdentityMap paramIdentityMap) {
    this((int)Math.floor((paramIdentityMap.capacity * paramIdentityMap.loadFactor)), paramIdentityMap.loadFactor);
    this.stashSize = paramIdentityMap.stashSize;
    Object[] arrayOfObject = paramIdentityMap.keyTable;
    System.arraycopy(arrayOfObject, 0, this.keyTable, 0, arrayOfObject.length);
    arrayOfObject = paramIdentityMap.valueTable;
    System.arraycopy(arrayOfObject, 0, this.valueTable, 0, arrayOfObject.length);
    this.size = paramIdentityMap.size;
  }
  
  private boolean containsKeyStash(K paramK) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfObject[k] == paramK)
        return true; 
    } 
    return false;
  }
  
  private V getStash(K paramK, V paramV) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfObject[k] == paramK)
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
  
  private void push(K paramK1, V paramV, int paramInt1, K paramK2, int paramInt2, K paramK3, int paramInt3, K paramK4) {
    int m;
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = paramInt1;
    K k1 = paramK2;
    paramK2 = paramK3;
    paramInt1 = 0;
    paramK3 = k1;
    k1 = (K)paramV;
    K k2 = paramK1;
    do {
      m = MathUtils.random(2);
      if (m != 0) {
        if (m != 1) {
          paramV = (V)arrayOfObject2[paramInt3];
          arrayOfObject1[paramInt3] = k2;
          arrayOfObject2[paramInt3] = k1;
          paramK1 = paramK4;
        } else {
          paramV = (V)arrayOfObject2[paramInt2];
          arrayOfObject1[paramInt2] = k2;
          arrayOfObject2[paramInt2] = k1;
          paramK1 = paramK2;
        } 
      } else {
        paramV = (V)arrayOfObject2[k];
        arrayOfObject1[k] = k2;
        arrayOfObject2[k] = k1;
        paramK1 = paramK3;
      } 
      paramInt3 = System.identityHashCode(paramK1);
      k = paramInt3 & i;
      paramK3 = (K)arrayOfObject1[k];
      if (paramK3 == null) {
        arrayOfObject1[k] = paramK1;
        arrayOfObject2[k] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt2 = hash2(paramInt3);
      paramK2 = (K)arrayOfObject1[paramInt2];
      if (paramK2 == null) {
        arrayOfObject1[paramInt2] = paramK1;
        arrayOfObject2[paramInt2] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt3 = hash3(paramInt3);
      paramK4 = (K)arrayOfObject1[paramInt3];
      if (paramK4 == null) {
        arrayOfObject1[paramInt3] = paramK1;
        arrayOfObject2[paramInt3] = paramV;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      m = paramInt1 + 1;
      k2 = paramK1;
      k1 = (K)paramV;
      paramInt1 = m;
    } while (m != j);
    putStash(paramK1, paramV);
  }
  
  private void putResize(K paramK, V paramV) {
    int i = System.identityHashCode(paramK);
    int j = i & this.mask;
    Object[] arrayOfObject1 = this.keyTable;
    Object object2 = arrayOfObject1[j];
    if (object2 == null) {
      arrayOfObject1[j] = paramK;
      this.valueTable[j] = paramV;
      j = this.size;
      this.size = j + 1;
      if (j >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int k = hash2(i);
    Object[] arrayOfObject2 = this.keyTable;
    Object object1 = arrayOfObject2[k];
    if (object1 == null) {
      arrayOfObject2[k] = paramK;
      this.valueTable[k] = paramV;
      j = this.size;
      this.size = j + 1;
      if (j >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    i = hash3(i);
    arrayOfObject2 = this.keyTable;
    Object object3 = arrayOfObject2[i];
    if (object3 == null) {
      arrayOfObject2[i] = paramK;
      this.valueTable[i] = paramV;
      j = this.size;
      this.size = j + 1;
      if (j >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramK, paramV, j, object2, k, object1, i, object3);
  }
  
  private void putStash(K paramK, V paramV) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramK, paramV);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramK;
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
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = (Object[])new Object[paramInt + k];
    this.valueTable = (Object[])new Object[paramInt + k];
    k = this.size;
    paramInt = 0;
    this.size = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        Object object = arrayOfObject1[paramInt];
        if (object != null)
          putResize(object, arrayOfObject2[paramInt]); 
        paramInt++;
      }  
  }
  
  public void clear() {
    if (this.size == 0)
      return; 
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        arrayOfObject1[j] = null;
        arrayOfObject2[j] = null;
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
    int i = System.identityHashCode(paramK);
    int j = this.mask;
    if (paramK != this.keyTable[j & i]) {
      j = hash2(i);
      if (paramK != this.keyTable[j]) {
        i = hash3(i);
        if (paramK != this.keyTable[i])
          return containsKeyStash(paramK); 
      } 
    } 
    return true;
  }
  
  public boolean containsValue(Object paramObject, boolean paramBoolean) {
    Object[] arrayOfObject1;
    Object[] arrayOfObject2 = this.valueTable;
    if (paramObject == null) {
      arrayOfObject1 = this.keyTable;
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject1[j] != null && arrayOfObject2[j] == null)
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
    } else if (paramBoolean) {
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject2[j] == arrayOfObject1)
            return true; 
          i = j;
          continue;
        } 
        break;
      } 
    } else {
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject1.equals(arrayOfObject2[j]))
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
  
  public Entries<K, V> entries() {
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
    if (!(paramObject instanceof IdentityMap))
      return false; 
    IdentityMap identityMap = (IdentityMap)paramObject;
    if (identityMap.size != this.size)
      return false; 
    Object[] arrayOfObject2 = this.keyTable;
    Object[] arrayOfObject1 = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      Object object = arrayOfObject2[b];
      if (object != null) {
        Object object1 = arrayOfObject1[b];
        if (object1 == null) {
          if (identityMap.get(object, ObjectMap.dummy) != null)
            return false; 
        } else if (!object1.equals(identityMap.get(object))) {
          return false;
        } 
      } 
    } 
    return true;
  }
  
  public boolean equalsIdentity(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof IdentityMap))
      return false; 
    IdentityMap identityMap = (IdentityMap)paramObject;
    if (identityMap.size != this.size)
      return false; 
    Object[] arrayOfObject2 = this.keyTable;
    Object[] arrayOfObject1 = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      Object object = arrayOfObject2[b];
      if (object != null && arrayOfObject1[b] != identityMap.get(object, ObjectMap.dummy))
        return false; 
    } 
    return true;
  }
  
  public K findKey(Object paramObject, boolean paramBoolean) {
    Object[] arrayOfObject1;
    Object[] arrayOfObject2 = this.valueTable;
    if (paramObject == null) {
      arrayOfObject1 = this.keyTable;
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject1[j] != null && arrayOfObject2[j] == null)
            return (K)arrayOfObject1[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } else if (paramBoolean) {
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject2[j] == arrayOfObject1)
            return (K)this.keyTable[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } else {
      int i = this.capacity + this.stashSize;
      while (true) {
        int j = i - 1;
        if (i > 0) {
          if (arrayOfObject1.equals(arrayOfObject2[j]))
            return (K)this.keyTable[j]; 
          i = j;
          continue;
        } 
        break;
      } 
    } 
    return null;
  }
  
  public V get(K paramK) {
    int i = System.identityHashCode(paramK);
    int j = this.mask & i;
    int k = j;
    if (paramK != this.keyTable[j]) {
      j = hash2(i);
      k = j;
      if (paramK != this.keyTable[j]) {
        j = hash3(i);
        k = j;
        if (paramK != this.keyTable[j])
          return (V)getStash(paramK, null); 
      } 
    } 
    return (V)this.valueTable[k];
  }
  
  public V get(K paramK, V paramV) {
    int i = System.identityHashCode(paramK);
    int j = this.mask & i;
    int k = j;
    if (paramK != this.keyTable[j]) {
      j = hash2(i);
      k = j;
      if (paramK != this.keyTable[j]) {
        j = hash3(i);
        k = j;
        if (paramK != this.keyTable[j])
          return (V)getStash(paramK, paramV); 
      } 
    } 
    return (V)this.valueTable[k];
  }
  
  public int hashCode() {
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    byte b = 0;
    int k;
    for (k = 0; b < i + j; k = m) {
      Object object = arrayOfObject1[b];
      int m = k;
      if (object != null) {
        k += object.hashCode() * 31;
        object = arrayOfObject2[b];
        m = k;
        if (object != null)
          m = k + object.hashCode(); 
      } 
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
  
  public Iterator<ObjectMap.Entry<K, V>> iterator() { return entries(); }
  
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
  
  public V put(K paramK, V paramV) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 363
    //   4: aload_0
    //   5: getfield keyTable : [Ljava/lang/Object;
    //   8: astore_3
    //   9: aload_1
    //   10: invokestatic identityHashCode : (Ljava/lang/Object;)I
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
    //   30: aload #6
    //   32: aload_1
    //   33: if_acmpne -> 53
    //   36: aload_0
    //   37: getfield valueTable : [Ljava/lang/Object;
    //   40: astore_3
    //   41: aload_3
    //   42: iload #5
    //   44: aaload
    //   45: astore_1
    //   46: aload_3
    //   47: iload #5
    //   49: aload_2
    //   50: aastore
    //   51: aload_1
    //   52: areturn
    //   53: aload_0
    //   54: iload #4
    //   56: invokespecial hash2 : (I)I
    //   59: istore #7
    //   61: aload_3
    //   62: iload #7
    //   64: aaload
    //   65: astore #8
    //   67: aload #8
    //   69: aload_1
    //   70: if_acmpne -> 90
    //   73: aload_0
    //   74: getfield valueTable : [Ljava/lang/Object;
    //   77: astore_1
    //   78: aload_1
    //   79: iload #7
    //   81: aaload
    //   82: astore_3
    //   83: aload_1
    //   84: iload #7
    //   86: aload_2
    //   87: aastore
    //   88: aload_3
    //   89: areturn
    //   90: aload_0
    //   91: iload #4
    //   93: invokespecial hash3 : (I)I
    //   96: istore #9
    //   98: aload_3
    //   99: iload #9
    //   101: aaload
    //   102: astore #10
    //   104: aload #10
    //   106: aload_1
    //   107: if_acmpne -> 127
    //   110: aload_0
    //   111: getfield valueTable : [Ljava/lang/Object;
    //   114: astore_3
    //   115: aload_3
    //   116: iload #9
    //   118: aaload
    //   119: astore_1
    //   120: aload_3
    //   121: iload #9
    //   123: aload_2
    //   124: aastore
    //   125: aload_1
    //   126: areturn
    //   127: aload_0
    //   128: getfield capacity : I
    //   131: istore #11
    //   133: aload_0
    //   134: getfield stashSize : I
    //   137: istore #12
    //   139: iload #11
    //   141: istore #4
    //   143: iload #4
    //   145: iload #12
    //   147: iload #11
    //   149: iadd
    //   150: if_icmpge -> 184
    //   153: aload_3
    //   154: iload #4
    //   156: aaload
    //   157: aload_1
    //   158: if_acmpne -> 178
    //   161: aload_0
    //   162: getfield valueTable : [Ljava/lang/Object;
    //   165: astore_3
    //   166: aload_3
    //   167: iload #4
    //   169: aaload
    //   170: astore_1
    //   171: aload_3
    //   172: iload #4
    //   174: aload_2
    //   175: aastore
    //   176: aload_1
    //   177: areturn
    //   178: iinc #4, 1
    //   181: goto -> 143
    //   184: aload #6
    //   186: ifnonnull -> 237
    //   189: aload_3
    //   190: iload #5
    //   192: aload_1
    //   193: aastore
    //   194: aload_0
    //   195: getfield valueTable : [Ljava/lang/Object;
    //   198: iload #5
    //   200: aload_2
    //   201: aastore
    //   202: aload_0
    //   203: getfield size : I
    //   206: istore #4
    //   208: aload_0
    //   209: iload #4
    //   211: iconst_1
    //   212: iadd
    //   213: putfield size : I
    //   216: iload #4
    //   218: aload_0
    //   219: getfield threshold : I
    //   222: if_icmplt -> 235
    //   225: aload_0
    //   226: aload_0
    //   227: getfield capacity : I
    //   230: iconst_1
    //   231: ishl
    //   232: invokespecial resize : (I)V
    //   235: aconst_null
    //   236: areturn
    //   237: aload #8
    //   239: ifnonnull -> 290
    //   242: aload_3
    //   243: iload #7
    //   245: aload_1
    //   246: aastore
    //   247: aload_0
    //   248: getfield valueTable : [Ljava/lang/Object;
    //   251: iload #7
    //   253: aload_2
    //   254: aastore
    //   255: aload_0
    //   256: getfield size : I
    //   259: istore #4
    //   261: aload_0
    //   262: iload #4
    //   264: iconst_1
    //   265: iadd
    //   266: putfield size : I
    //   269: iload #4
    //   271: aload_0
    //   272: getfield threshold : I
    //   275: if_icmplt -> 288
    //   278: aload_0
    //   279: aload_0
    //   280: getfield capacity : I
    //   283: iconst_1
    //   284: ishl
    //   285: invokespecial resize : (I)V
    //   288: aconst_null
    //   289: areturn
    //   290: aload #10
    //   292: ifnonnull -> 343
    //   295: aload_3
    //   296: iload #9
    //   298: aload_1
    //   299: aastore
    //   300: aload_0
    //   301: getfield valueTable : [Ljava/lang/Object;
    //   304: iload #9
    //   306: aload_2
    //   307: aastore
    //   308: aload_0
    //   309: getfield size : I
    //   312: istore #4
    //   314: aload_0
    //   315: iload #4
    //   317: iconst_1
    //   318: iadd
    //   319: putfield size : I
    //   322: iload #4
    //   324: aload_0
    //   325: getfield threshold : I
    //   328: if_icmplt -> 341
    //   331: aload_0
    //   332: aload_0
    //   333: getfield capacity : I
    //   336: iconst_1
    //   337: ishl
    //   338: invokespecial resize : (I)V
    //   341: aconst_null
    //   342: areturn
    //   343: aload_0
    //   344: aload_1
    //   345: aload_2
    //   346: iload #5
    //   348: aload #6
    //   350: iload #7
    //   352: aload #8
    //   354: iload #9
    //   356: aload #10
    //   358: invokespecial push : (Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    //   361: aconst_null
    //   362: areturn
    //   363: new java/lang/IllegalArgumentException
    //   366: dup
    //   367: ldc_w 'key cannot be null.'
    //   370: invokespecial <init> : (Ljava/lang/String;)V
    //   373: astore_1
    //   374: goto -> 379
    //   377: aload_1
    //   378: athrow
    //   379: goto -> 377 }
  
  public V remove(K paramK) {
    int i = System.identityHashCode(paramK);
    int j = this.mask & i;
    Object[] arrayOfObject = this.keyTable;
    if (arrayOfObject[j] == paramK) {
      arrayOfObject[j] = null;
      paramK = (K)this.valueTable;
      K k = paramK[j];
      paramK[j] = null;
      this.size--;
      return (V)k;
    } 
    j = hash2(i);
    arrayOfObject = this.keyTable;
    if (arrayOfObject[j] == paramK) {
      arrayOfObject[j] = null;
      paramK = (K)this.valueTable;
      K k = paramK[j];
      paramK[j] = null;
      this.size--;
      return (V)k;
    } 
    i = hash3(i);
    arrayOfObject = this.keyTable;
    if (arrayOfObject[i] == paramK) {
      arrayOfObject[i] = null;
      paramK = (K)this.valueTable;
      K k = paramK[i];
      paramK[i] = null;
      this.size--;
      return (V)k;
    } 
    return (V)removeStash(paramK);
  }
  
  V removeStash(K paramK) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (arrayOfObject[k] == paramK) {
        paramK = (K)this.valueTable[k];
        removeStashIndex(k);
        this.size--;
        return (V)paramK;
      } 
    } 
    return null;
  }
  
  void removeStashIndex(int paramInt) {
    this.stashSize--;
    int i = this.capacity + this.stashSize;
    if (paramInt < i) {
      Object[] arrayOfObject = this.keyTable;
      arrayOfObject[paramInt] = arrayOfObject[i];
      arrayOfObject = this.valueTable;
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
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int i = arrayOfObject1.length;
    while (true) {
      int k = i - 1;
      j = k;
      if (i > 0) {
        Object object = arrayOfObject1[k];
        if (object == null) {
          i = k;
          continue;
        } 
        stringBuilder.append(object);
        stringBuilder.append('=');
        stringBuilder.append(arrayOfObject2[k]);
        j = k;
      } 
      break;
    } 
    while (true) {
      int k = j - 1;
      if (j > 0) {
        Object object = arrayOfObject1[k];
        if (object != null) {
          stringBuilder.append(", ");
          stringBuilder.append(object);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfObject2[k]);
        } 
        j = k;
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
  
  public static class Entries<K, V> extends MapIterator<K, V, ObjectMap.Entry<K, V>> {
    private ObjectMap.Entry<K, V> entry = new ObjectMap.Entry();
    
    public Entries(IdentityMap<K, V> param1IdentityMap) { super(param1IdentityMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<ObjectMap.Entry<K, V>> iterator() { return this; }
    
    public ObjectMap.Entry<K, V> next() {
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
  }
  
  public static class Keys<K> extends MapIterator<K, Object, K> {
    public Keys(IdentityMap<K, ?> param1IdentityMap) { super(param1IdentityMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<K> iterator() { return this; }
    
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
    
    public Array<K> toArray() {
      Array array = new Array(true, this.map.size);
      while (this.hasNext)
        array.add(next()); 
      return array;
    }
  }
  
  private static abstract class MapIterator<K, V, I> extends Object implements Iterable<I>, Iterator<I> {
    int currentIndex;
    
    public boolean hasNext;
    
    final IdentityMap<K, V> map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(IdentityMap<K, V> param1IdentityMap) {
      this.map = param1IdentityMap;
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
          this.map.valueTable[this.currentIndex] = null;
        } 
        this.currentIndex = -1;
        IdentityMap identityMap = this.map;
        identityMap.size--;
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
  
  public static class Values<V> extends MapIterator<Object, V, V> {
    public Values(IdentityMap<?, V> param1IdentityMap) { super(param1IdentityMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<V> iterator() { return this; }
    
    public V next() {
      if (this.hasNext) {
        if (this.valid) {
          Object object = this.map.valueTable[this.nextIndex];
          this.currentIndex = this.nextIndex;
          findNextIndex();
          return (V)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public Array<V> toArray() {
      Array array = new Array(true, this.map.size);
      while (this.hasNext)
        array.add(next()); 
      return array;
    }
    
    public void toArray(Array<V> param1Array) {
      while (this.hasNext)
        param1Array.add(next()); 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/IdentityMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */