package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectMap<K, V> extends Object implements Iterable<ObjectMap.Entry<K, V>> {
  private static final int PRIME1 = -1105259343;
  
  private static final int PRIME2 = -1262997959;
  
  private static final int PRIME3 = -825114047;
  
  static final Object dummy = new Object();
  
  int capacity;
  
  Entries entries1;
  
  Entries entries2;
  
  private int hashShift;
  
  K[] keyTable;
  
  Keys keys1;
  
  Keys keys2;
  
  private float loadFactor;
  
  private int mask;
  
  private int pushIterations;
  
  public int size;
  
  private int stashCapacity;
  
  int stashSize;
  
  private int threshold;
  
  V[] valueTable;
  
  Values values1;
  
  Values values2;
  
  public ObjectMap() { this(51, 0.8F); }
  
  public ObjectMap(int paramInt) { this(paramInt, 0.8F); }
  
  public ObjectMap(int paramInt, float paramFloat) {
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
  
  public ObjectMap(ObjectMap<? extends K, ? extends V> paramObjectMap) {
    this((int)Math.floor((paramObjectMap.capacity * paramObjectMap.loadFactor)), paramObjectMap.loadFactor);
    this.stashSize = paramObjectMap.stashSize;
    Object[] arrayOfObject = paramObjectMap.keyTable;
    System.arraycopy(arrayOfObject, 0, this.keyTable, 0, arrayOfObject.length);
    arrayOfObject = paramObjectMap.valueTable;
    System.arraycopy(arrayOfObject, 0, this.valueTable, 0, arrayOfObject.length);
    this.size = paramObjectMap.size;
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
  
  private V getStash(K paramK, V paramV) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramK.equals(arrayOfObject[k]))
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
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = paramInt1;
    paramInt1 = 0;
    int m = paramInt2;
    paramInt2 = k;
    V v = paramV;
    K k1 = paramK1;
    do {
      k = MathUtils.random(2);
      if (k != 0) {
        if (k != 1) {
          paramV = (V)arrayOfObject2[paramInt3];
          arrayOfObject1[paramInt3] = k1;
          arrayOfObject2[paramInt3] = v;
          paramK1 = paramK4;
        } else {
          paramV = (V)arrayOfObject2[m];
          arrayOfObject1[m] = k1;
          arrayOfObject2[m] = v;
          paramK1 = paramK3;
        } 
      } else {
        paramV = (V)arrayOfObject2[paramInt2];
        arrayOfObject1[paramInt2] = k1;
        arrayOfObject2[paramInt2] = v;
        paramK1 = paramK2;
      } 
      paramInt3 = paramK1.hashCode();
      paramInt2 = paramInt3 & i;
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
      m = hash2(paramInt3);
      paramK3 = (K)arrayOfObject1[m];
      if (paramK3 == null) {
        arrayOfObject1[m] = paramK1;
        arrayOfObject2[m] = paramV;
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
      k = paramInt1 + 1;
      k1 = paramK1;
      v = paramV;
      paramInt1 = k;
    } while (k != j);
    putStash(paramK1, paramV);
  }
  
  private void putResize(K paramK, V paramV) {
    int i = paramK.hashCode();
    int j = i & this.mask;
    Object[] arrayOfObject1 = this.keyTable;
    Object object2 = arrayOfObject1[j];
    if (object2 == null) {
      arrayOfObject1[j] = paramK;
      this.valueTable[j] = paramV;
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
      this.valueTable[k] = paramV;
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
      this.valueTable[i] = paramV;
      k = this.size;
      this.size = k + 1;
      if (k >= this.threshold)
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
  
  private String toString(String paramString, boolean paramBoolean) {
    int j;
    if (this.size == 0) {
      if (paramBoolean) {
        paramString = "{}";
      } else {
        paramString = "";
      } 
      return paramString;
    } 
    StringBuilder stringBuilder = new StringBuilder(32);
    if (paramBoolean)
      stringBuilder.append('{'); 
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
      i = j - 1;
      if (j > 0) {
        Object object = arrayOfObject1[i];
        if (object != null) {
          stringBuilder.append(paramString);
          stringBuilder.append(object);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfObject2[i]);
        } 
        j = i;
        continue;
      } 
      break;
    } 
    if (paramBoolean)
      stringBuilder.append('}'); 
    return stringBuilder.toString();
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
    if (!(paramObject instanceof ObjectMap))
      return false; 
    ObjectMap objectMap = (ObjectMap)paramObject;
    if (objectMap.size != this.size)
      return false; 
    Object[] arrayOfObject1 = this.keyTable;
    Object[] arrayOfObject2 = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      Object object = arrayOfObject1[b];
      if (object != null) {
        Object object1 = arrayOfObject2[b];
        if (object1 == null) {
          if (objectMap.get(object, dummy) != null)
            return false; 
        } else if (!object1.equals(objectMap.get(object))) {
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
      if (object != null && arrayOfObject1[b] != identityMap.get(object, dummy))
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
          return (V)getStash(paramK, null); 
      } 
    } 
    return (V)this.valueTable[k];
  }
  
  public V get(K paramK, V paramV) {
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
  
  public Entries<K, V> iterator() { return entries(); }
  
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
    //   1: ifnull -> 375
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
    //   36: ifeq -> 56
    //   39: aload_0
    //   40: getfield valueTable : [Ljava/lang/Object;
    //   43: astore_3
    //   44: aload_3
    //   45: iload #5
    //   47: aaload
    //   48: astore_1
    //   49: aload_3
    //   50: iload #5
    //   52: aload_2
    //   53: aastore
    //   54: aload_1
    //   55: areturn
    //   56: aload_0
    //   57: iload #4
    //   59: invokespecial hash2 : (I)I
    //   62: istore #7
    //   64: aload_3
    //   65: iload #7
    //   67: aaload
    //   68: astore #8
    //   70: aload_1
    //   71: aload #8
    //   73: invokevirtual equals : (Ljava/lang/Object;)Z
    //   76: ifeq -> 96
    //   79: aload_0
    //   80: getfield valueTable : [Ljava/lang/Object;
    //   83: astore_3
    //   84: aload_3
    //   85: iload #7
    //   87: aaload
    //   88: astore_1
    //   89: aload_3
    //   90: iload #7
    //   92: aload_2
    //   93: aastore
    //   94: aload_1
    //   95: areturn
    //   96: aload_0
    //   97: iload #4
    //   99: invokespecial hash3 : (I)I
    //   102: istore #9
    //   104: aload_3
    //   105: iload #9
    //   107: aaload
    //   108: astore #10
    //   110: aload_1
    //   111: aload #10
    //   113: invokevirtual equals : (Ljava/lang/Object;)Z
    //   116: ifeq -> 136
    //   119: aload_0
    //   120: getfield valueTable : [Ljava/lang/Object;
    //   123: astore_1
    //   124: aload_1
    //   125: iload #9
    //   127: aaload
    //   128: astore_3
    //   129: aload_1
    //   130: iload #9
    //   132: aload_2
    //   133: aastore
    //   134: aload_3
    //   135: areturn
    //   136: aload_0
    //   137: getfield capacity : I
    //   140: istore #11
    //   142: aload_0
    //   143: getfield stashSize : I
    //   146: istore #12
    //   148: iload #11
    //   150: istore #4
    //   152: iload #4
    //   154: iload #12
    //   156: iload #11
    //   158: iadd
    //   159: if_icmpge -> 196
    //   162: aload_1
    //   163: aload_3
    //   164: iload #4
    //   166: aaload
    //   167: invokevirtual equals : (Ljava/lang/Object;)Z
    //   170: ifeq -> 190
    //   173: aload_0
    //   174: getfield valueTable : [Ljava/lang/Object;
    //   177: astore_3
    //   178: aload_3
    //   179: iload #4
    //   181: aaload
    //   182: astore_1
    //   183: aload_3
    //   184: iload #4
    //   186: aload_2
    //   187: aastore
    //   188: aload_1
    //   189: areturn
    //   190: iinc #4, 1
    //   193: goto -> 152
    //   196: aload #6
    //   198: ifnonnull -> 249
    //   201: aload_3
    //   202: iload #5
    //   204: aload_1
    //   205: aastore
    //   206: aload_0
    //   207: getfield valueTable : [Ljava/lang/Object;
    //   210: iload #5
    //   212: aload_2
    //   213: aastore
    //   214: aload_0
    //   215: getfield size : I
    //   218: istore #4
    //   220: aload_0
    //   221: iload #4
    //   223: iconst_1
    //   224: iadd
    //   225: putfield size : I
    //   228: iload #4
    //   230: aload_0
    //   231: getfield threshold : I
    //   234: if_icmplt -> 247
    //   237: aload_0
    //   238: aload_0
    //   239: getfield capacity : I
    //   242: iconst_1
    //   243: ishl
    //   244: invokespecial resize : (I)V
    //   247: aconst_null
    //   248: areturn
    //   249: aload #8
    //   251: ifnonnull -> 302
    //   254: aload_3
    //   255: iload #7
    //   257: aload_1
    //   258: aastore
    //   259: aload_0
    //   260: getfield valueTable : [Ljava/lang/Object;
    //   263: iload #7
    //   265: aload_2
    //   266: aastore
    //   267: aload_0
    //   268: getfield size : I
    //   271: istore #4
    //   273: aload_0
    //   274: iload #4
    //   276: iconst_1
    //   277: iadd
    //   278: putfield size : I
    //   281: iload #4
    //   283: aload_0
    //   284: getfield threshold : I
    //   287: if_icmplt -> 300
    //   290: aload_0
    //   291: aload_0
    //   292: getfield capacity : I
    //   295: iconst_1
    //   296: ishl
    //   297: invokespecial resize : (I)V
    //   300: aconst_null
    //   301: areturn
    //   302: aload #10
    //   304: ifnonnull -> 355
    //   307: aload_3
    //   308: iload #9
    //   310: aload_1
    //   311: aastore
    //   312: aload_0
    //   313: getfield valueTable : [Ljava/lang/Object;
    //   316: iload #9
    //   318: aload_2
    //   319: aastore
    //   320: aload_0
    //   321: getfield size : I
    //   324: istore #4
    //   326: aload_0
    //   327: iload #4
    //   329: iconst_1
    //   330: iadd
    //   331: putfield size : I
    //   334: iload #4
    //   336: aload_0
    //   337: getfield threshold : I
    //   340: if_icmplt -> 353
    //   343: aload_0
    //   344: aload_0
    //   345: getfield capacity : I
    //   348: iconst_1
    //   349: ishl
    //   350: invokespecial resize : (I)V
    //   353: aconst_null
    //   354: areturn
    //   355: aload_0
    //   356: aload_1
    //   357: aload_2
    //   358: iload #5
    //   360: aload #6
    //   362: iload #7
    //   364: aload #8
    //   366: iload #9
    //   368: aload #10
    //   370: invokespecial push : (Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    //   373: aconst_null
    //   374: areturn
    //   375: new java/lang/IllegalArgumentException
    //   378: dup
    //   379: ldc_w 'key cannot be null.'
    //   382: invokespecial <init> : (Ljava/lang/String;)V
    //   385: astore_1
    //   386: goto -> 391
    //   389: aload_1
    //   390: athrow
    //   391: goto -> 389 }
  
  public void putAll(ObjectMap<? extends K, ? extends V> paramObjectMap) {
    ensureCapacity(paramObjectMap.size);
    Entries entries = paramObjectMap.iterator();
    while (entries.hasNext()) {
      Entry entry = (Entry)entries.next();
      put(entry.key, entry.value);
    } 
  }
  
  public V remove(K paramK) {
    int i = paramK.hashCode();
    int j = this.mask & i;
    if (paramK.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      paramK = (K)this.valueTable;
      K k = paramK[j];
      paramK[j] = null;
      this.size--;
      return (V)k;
    } 
    j = hash2(i);
    if (paramK.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      paramK = (K)this.valueTable;
      K k = paramK[j];
      paramK[j] = null;
      this.size--;
      return (V)k;
    } 
    i = hash3(i);
    if (paramK.equals(this.keyTable[i])) {
      this.keyTable[i] = null;
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
      if (paramK.equals(arrayOfObject[k])) {
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
      Object[] arrayOfObject1 = this.keyTable;
      arrayOfObject1[paramInt] = arrayOfObject1[i];
      Object[] arrayOfObject2 = this.valueTable;
      arrayOfObject2[paramInt] = arrayOfObject2[i];
      arrayOfObject1[i] = null;
      arrayOfObject2[i] = null;
    } else {
      this.keyTable[paramInt] = null;
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
  
  public String toString() { return toString(", ", true); }
  
  public String toString(String paramString) { return toString(paramString, false); }
  
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
  
  public static class Entries<K, V> extends MapIterator<K, V, Entry<K, V>> {
    ObjectMap.Entry<K, V> entry = new ObjectMap.Entry();
    
    public Entries(ObjectMap<K, V> param1ObjectMap) { super(param1ObjectMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Entries<K, V> iterator() { return this; }
    
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
  
  public static class Entry<K, V> extends Object {
    public K key;
    
    public V value;
    
    public String toString() {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(this.key);
      stringBuilder.append("=");
      stringBuilder.append(this.value);
      return stringBuilder.toString();
    }
  }
  
  public static class Keys<K> extends MapIterator<K, Object, K> {
    public Keys(ObjectMap<K, ?> param1ObjectMap) { super(param1ObjectMap); }
    
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
    
    public Array<K> toArray() { return toArray(new Array(true, this.map.size)); }
    
    public Array<K> toArray(Array<K> param1Array) {
      while (this.hasNext)
        param1Array.add(next()); 
      return param1Array;
    }
  }
  
  private static abstract class MapIterator<K, V, I> extends Object implements Iterable<I>, Iterator<I> {
    int currentIndex;
    
    public boolean hasNext;
    
    final ObjectMap<K, V> map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(ObjectMap<K, V> param1ObjectMap) {
      this.map = param1ObjectMap;
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
        ObjectMap objectMap = this.map;
        objectMap.size--;
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
    public Values(ObjectMap<?, V> param1ObjectMap) { super(param1ObjectMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Values<V> iterator() { return this; }
    
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
    
    public Array<V> toArray() { return toArray(new Array(true, this.map.size)); }
    
    public Array<V> toArray(Array<V> param1Array) {
      while (this.hasNext)
        param1Array.add(next()); 
      return param1Array;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ObjectMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */