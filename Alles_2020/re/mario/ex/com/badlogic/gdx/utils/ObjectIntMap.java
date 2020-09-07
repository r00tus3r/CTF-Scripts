package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectIntMap<K> extends Object implements Iterable<ObjectIntMap.Entry<K>> {
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
  
  int[] valueTable;
  
  private Values values1;
  
  private Values values2;
  
  public ObjectIntMap() { this(51, 0.8F); }
  
  public ObjectIntMap(int paramInt) { this(paramInt, 0.8F); }
  
  public ObjectIntMap(int paramInt, float paramFloat) {
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
  
  public ObjectIntMap(ObjectIntMap<? extends K> paramObjectIntMap) {
    this((int)Math.floor((paramObjectIntMap.capacity * paramObjectIntMap.loadFactor)), paramObjectIntMap.loadFactor);
    this.stashSize = paramObjectIntMap.stashSize;
    Object[] arrayOfObject = paramObjectIntMap.keyTable;
    System.arraycopy(arrayOfObject, 0, this.keyTable, 0, arrayOfObject.length);
    int[] arrayOfInt = paramObjectIntMap.valueTable;
    System.arraycopy(arrayOfInt, 0, this.valueTable, 0, arrayOfInt.length);
    this.size = paramObjectIntMap.size;
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
  
  private int getAndIncrementStash(K paramK, int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: getfield keyTable : [Ljava/lang/Object;
    //   4: astore #4
    //   6: aload_0
    //   7: getfield capacity : I
    //   10: istore #5
    //   12: aload_0
    //   13: getfield stashSize : I
    //   16: istore #6
    //   18: iload #5
    //   20: istore #7
    //   22: iload #7
    //   24: iload #6
    //   26: iload #5
    //   28: iadd
    //   29: if_icmpge -> 69
    //   32: aload_1
    //   33: aload #4
    //   35: iload #7
    //   37: aaload
    //   38: invokevirtual equals : (Ljava/lang/Object;)Z
    //   41: ifeq -> 63
    //   44: aload_0
    //   45: getfield valueTable : [I
    //   48: astore_1
    //   49: aload_1
    //   50: iload #7
    //   52: iaload
    //   53: istore_2
    //   54: aload_1
    //   55: iload #7
    //   57: iload_3
    //   58: iload_2
    //   59: iadd
    //   60: iastore
    //   61: iload_2
    //   62: ireturn
    //   63: iinc #7, 1
    //   66: goto -> 22
    //   69: aload_0
    //   70: aload_1
    //   71: iload_3
    //   72: iload_2
    //   73: iadd
    //   74: invokevirtual put : (Ljava/lang/Object;I)V
    //   77: iload_2
    //   78: ireturn }
  
  private int getStash(K paramK, int paramInt) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramK.equals(arrayOfObject[k]))
        return this.valueTable[k]; 
    } 
    return paramInt;
  }
  
  private int hash2(int paramInt) {
    paramInt *= -1262997959;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private int hash3(int paramInt) {
    paramInt *= -825114047;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private void push(K paramK1, int paramInt1, int paramInt2, K paramK2, int paramInt3, K paramK3, int paramInt4, K paramK4) {
    int n;
    Object[] arrayOfObject = this.keyTable;
    int[] arrayOfInt = this.valueTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = paramInt2;
    int m = paramInt4;
    paramInt2 = 0;
    paramInt4 = paramInt3;
    paramInt3 = paramInt1;
    K k1 = paramK1;
    do {
      paramInt1 = MathUtils.random(2);
      if (paramInt1 != 0) {
        if (paramInt1 != 1) {
          paramInt1 = arrayOfInt[m];
          arrayOfObject[m] = k1;
          arrayOfInt[m] = paramInt3;
          paramK1 = paramK4;
        } else {
          paramInt1 = arrayOfInt[paramInt4];
          arrayOfObject[paramInt4] = k1;
          arrayOfInt[paramInt4] = paramInt3;
          paramK1 = paramK3;
        } 
      } else {
        paramInt1 = arrayOfInt[k];
        arrayOfObject[k] = k1;
        arrayOfInt[k] = paramInt3;
        paramK1 = paramK2;
      } 
      paramInt3 = paramK1.hashCode();
      k = paramInt3 & i;
      paramK2 = (K)arrayOfObject[k];
      if (paramK2 == null) {
        arrayOfObject[k] = paramK1;
        arrayOfInt[k] = paramInt1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt4 = hash2(paramInt3);
      paramK3 = (K)arrayOfObject[paramInt4];
      if (paramK3 == null) {
        arrayOfObject[paramInt4] = paramK1;
        arrayOfInt[paramInt4] = paramInt1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      m = hash3(paramInt3);
      paramK4 = (K)arrayOfObject[m];
      if (paramK4 == null) {
        arrayOfObject[m] = paramK1;
        arrayOfInt[m] = paramInt1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      n = paramInt2 + 1;
      k1 = paramK1;
      paramInt3 = paramInt1;
      paramInt2 = n;
    } while (n != j);
    putStash(paramK1, paramInt1);
  }
  
  private void putResize(K paramK, int paramInt) {
    int i = paramK.hashCode();
    int j = i & this.mask;
    Object[] arrayOfObject1 = this.keyTable;
    Object object2 = arrayOfObject1[j];
    if (object2 == null) {
      arrayOfObject1[j] = paramK;
      this.valueTable[j] = paramInt;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    int k = hash2(i);
    Object[] arrayOfObject2 = this.keyTable;
    Object object1 = arrayOfObject2[k];
    if (object1 == null) {
      arrayOfObject2[k] = paramK;
      this.valueTable[k] = paramInt;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    i = hash3(i);
    arrayOfObject2 = this.keyTable;
    Object object3 = arrayOfObject2[i];
    if (object3 == null) {
      arrayOfObject2[i] = paramK;
      this.valueTable[i] = paramInt;
      paramInt = this.size;
      this.size = paramInt + 1;
      if (paramInt >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramK, paramInt, j, object2, k, object1, i, object3);
  }
  
  private void putStash(K paramK, int paramInt) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      putResize(paramK, paramInt);
      return;
    } 
    int j = this.capacity + i;
    this.keyTable[j] = paramK;
    this.valueTable[j] = paramInt;
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
    int[] arrayOfInt = this.valueTable;
    int k = this.stashCapacity;
    this.keyTable = (Object[])new Object[paramInt + k];
    this.valueTable = new int[paramInt + k];
    k = this.size;
    paramInt = 0;
    this.size = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        Object object = arrayOfObject[paramInt];
        if (object != null)
          putResize(object, arrayOfInt[paramInt]); 
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
  
  public boolean containsValue(int paramInt) {
    Object[] arrayOfObject = this.keyTable;
    int[] arrayOfInt = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfObject[j] != null && arrayOfInt[j] == paramInt)
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
    if (!(paramObject instanceof ObjectIntMap))
      return false; 
    ObjectIntMap objectIntMap = (ObjectIntMap)paramObject;
    if (objectIntMap.size != this.size)
      return false; 
    Object[] arrayOfObject = this.keyTable;
    int[] arrayOfInt = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      Object object = arrayOfObject[b];
      if (object != null) {
        int k = objectIntMap.get(object, 0);
        if (k == 0 && !objectIntMap.containsKey(object))
          return false; 
        if (k != arrayOfInt[b])
          return false; 
      } 
    } 
    return true;
  }
  
  public K findKey(int paramInt) {
    Object[] arrayOfObject = this.keyTable;
    int[] arrayOfInt = this.valueTable;
    int i = this.capacity + this.stashSize;
    while (true) {
      int j = i - 1;
      if (i > 0) {
        if (arrayOfObject[j] != null && arrayOfInt[j] == paramInt)
          return (K)arrayOfObject[j]; 
        i = j;
        continue;
      } 
      break;
    } 
    return null;
  }
  
  public int get(K paramK, int paramInt) {
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
          return getStash(paramK, paramInt); 
      } 
    } 
    return this.valueTable[k];
  }
  
  public int getAndIncrement(K paramK, int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_1
    //   1: invokevirtual hashCode : ()I
    //   4: istore #4
    //   6: aload_0
    //   7: getfield mask : I
    //   10: iload #4
    //   12: iand
    //   13: istore #5
    //   15: iload #5
    //   17: istore #6
    //   19: aload_1
    //   20: aload_0
    //   21: getfield keyTable : [Ljava/lang/Object;
    //   24: iload #5
    //   26: aaload
    //   27: invokevirtual equals : (Ljava/lang/Object;)Z
    //   30: ifne -> 93
    //   33: aload_0
    //   34: iload #4
    //   36: invokespecial hash2 : (I)I
    //   39: istore #5
    //   41: iload #5
    //   43: istore #6
    //   45: aload_1
    //   46: aload_0
    //   47: getfield keyTable : [Ljava/lang/Object;
    //   50: iload #5
    //   52: aaload
    //   53: invokevirtual equals : (Ljava/lang/Object;)Z
    //   56: ifne -> 93
    //   59: aload_0
    //   60: iload #4
    //   62: invokespecial hash3 : (I)I
    //   65: istore #5
    //   67: iload #5
    //   69: istore #6
    //   71: aload_1
    //   72: aload_0
    //   73: getfield keyTable : [Ljava/lang/Object;
    //   76: iload #5
    //   78: aaload
    //   79: invokevirtual equals : (Ljava/lang/Object;)Z
    //   82: ifne -> 93
    //   85: aload_0
    //   86: aload_1
    //   87: iload_2
    //   88: iload_3
    //   89: invokespecial getAndIncrementStash : (Ljava/lang/Object;II)I
    //   92: ireturn
    //   93: aload_0
    //   94: getfield valueTable : [I
    //   97: astore_1
    //   98: aload_1
    //   99: iload #6
    //   101: iaload
    //   102: istore_2
    //   103: aload_1
    //   104: iload #6
    //   106: iload_3
    //   107: iload_2
    //   108: iadd
    //   109: iastore
    //   110: iload_2
    //   111: ireturn }
  
  public int hashCode() {
    Object[] arrayOfObject = this.keyTable;
    int[] arrayOfInt = this.valueTable;
    int i = this.capacity;
    int j = this.stashSize;
    byte b = 0;
    int k;
    for (k = 0; b < i + j; k = m) {
      Object object = arrayOfObject[b];
      int m = k;
      if (object != null)
        m = k + object.hashCode() * 31 + arrayOfInt[b]; 
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
  
  public void put(K paramK, int paramInt) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 330
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
    //   40: getfield valueTable : [I
    //   43: iload #5
    //   45: iload_2
    //   46: iastore
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
    //   72: getfield valueTable : [I
    //   75: iload #7
    //   77: iload_2
    //   78: iastore
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
    //   104: getfield valueTable : [I
    //   107: iload #9
    //   109: iload_2
    //   110: iastore
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
    //   150: getfield valueTable : [I
    //   153: iload #4
    //   155: iload_2
    //   156: iastore
    //   157: return
    //   158: iinc #4, 1
    //   161: goto -> 128
    //   164: aload #6
    //   166: ifnonnull -> 213
    //   169: aload_3
    //   170: iload #5
    //   172: aload_1
    //   173: aastore
    //   174: aload_0
    //   175: getfield valueTable : [I
    //   178: iload #5
    //   180: iload_2
    //   181: iastore
    //   182: aload_0
    //   183: getfield size : I
    //   186: istore_2
    //   187: aload_0
    //   188: iload_2
    //   189: iconst_1
    //   190: iadd
    //   191: putfield size : I
    //   194: iload_2
    //   195: aload_0
    //   196: getfield threshold : I
    //   199: if_icmplt -> 212
    //   202: aload_0
    //   203: aload_0
    //   204: getfield capacity : I
    //   207: iconst_1
    //   208: ishl
    //   209: invokespecial resize : (I)V
    //   212: return
    //   213: aload #8
    //   215: ifnonnull -> 262
    //   218: aload_3
    //   219: iload #7
    //   221: aload_1
    //   222: aastore
    //   223: aload_0
    //   224: getfield valueTable : [I
    //   227: iload #7
    //   229: iload_2
    //   230: iastore
    //   231: aload_0
    //   232: getfield size : I
    //   235: istore_2
    //   236: aload_0
    //   237: iload_2
    //   238: iconst_1
    //   239: iadd
    //   240: putfield size : I
    //   243: iload_2
    //   244: aload_0
    //   245: getfield threshold : I
    //   248: if_icmplt -> 261
    //   251: aload_0
    //   252: aload_0
    //   253: getfield capacity : I
    //   256: iconst_1
    //   257: ishl
    //   258: invokespecial resize : (I)V
    //   261: return
    //   262: aload #10
    //   264: ifnonnull -> 311
    //   267: aload_3
    //   268: iload #9
    //   270: aload_1
    //   271: aastore
    //   272: aload_0
    //   273: getfield valueTable : [I
    //   276: iload #9
    //   278: iload_2
    //   279: iastore
    //   280: aload_0
    //   281: getfield size : I
    //   284: istore_2
    //   285: aload_0
    //   286: iload_2
    //   287: iconst_1
    //   288: iadd
    //   289: putfield size : I
    //   292: iload_2
    //   293: aload_0
    //   294: getfield threshold : I
    //   297: if_icmplt -> 310
    //   300: aload_0
    //   301: aload_0
    //   302: getfield capacity : I
    //   305: iconst_1
    //   306: ishl
    //   307: invokespecial resize : (I)V
    //   310: return
    //   311: aload_0
    //   312: aload_1
    //   313: iload_2
    //   314: iload #5
    //   316: aload #6
    //   318: iload #7
    //   320: aload #8
    //   322: iload #9
    //   324: aload #10
    //   326: invokespecial push : (Ljava/lang/Object;IILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    //   329: return
    //   330: new java/lang/IllegalArgumentException
    //   333: dup
    //   334: ldc_w 'key cannot be null.'
    //   337: invokespecial <init> : (Ljava/lang/String;)V
    //   340: astore_1
    //   341: goto -> 346
    //   344: aload_1
    //   345: athrow
    //   346: goto -> 344 }
  
  public void putAll(ObjectIntMap<? extends K> paramObjectIntMap) {
    Entries entries = paramObjectIntMap.entries().iterator();
    while (entries.hasNext()) {
      Entry entry = (Entry)entries.next();
      put(entry.key, entry.value);
    } 
  }
  
  public int remove(K paramK, int paramInt) {
    int i = paramK.hashCode();
    int j = this.mask & i;
    if (paramK.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      paramInt = this.valueTable[j];
      this.size--;
      return paramInt;
    } 
    j = hash2(i);
    if (paramK.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      paramInt = this.valueTable[j];
      this.size--;
      return paramInt;
    } 
    i = hash3(i);
    if (paramK.equals(this.keyTable[i])) {
      this.keyTable[i] = null;
      paramInt = this.valueTable[i];
      this.size--;
      return paramInt;
    } 
    return removeStash(paramK, paramInt);
  }
  
  int removeStash(K paramK, int paramInt) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramK.equals(arrayOfObject[k])) {
        paramInt = this.valueTable[k];
        removeStashIndex(k);
        this.size--;
        return paramInt;
      } 
    } 
    return paramInt;
  }
  
  void removeStashIndex(int paramInt) {
    this.stashSize--;
    int i = this.capacity + this.stashSize;
    if (paramInt < i) {
      Object[] arrayOfObject = this.keyTable;
      arrayOfObject[paramInt] = arrayOfObject[i];
      int[] arrayOfInt = this.valueTable;
      arrayOfInt[paramInt] = arrayOfInt[i];
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
    int[] arrayOfInt = this.valueTable;
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
        stringBuilder.append(arrayOfInt[k]);
        j = k;
      } 
      break;
    } 
    while (true) {
      int k = j - 1;
      if (j > 0) {
        Object object = arrayOfObject[k];
        if (object != null) {
          stringBuilder.append(", ");
          stringBuilder.append(object);
          stringBuilder.append('=');
          stringBuilder.append(arrayOfInt[k]);
        } 
        j = k;
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
    private ObjectIntMap.Entry<K> entry = new ObjectIntMap.Entry();
    
    public Entries(ObjectIntMap<K> param1ObjectIntMap) { super(param1ObjectIntMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Entries<K> iterator() { return this; }
    
    public ObjectIntMap.Entry<K> next() {
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
    
    public int value;
    
    public String toString() {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(this.key);
      stringBuilder.append("=");
      stringBuilder.append(this.value);
      return stringBuilder.toString();
    }
  }
  
  public static class Keys<K> extends MapIterator<K> implements Iterable<K>, Iterator<K> {
    public Keys(ObjectIntMap<K> param1ObjectIntMap) { super(param1ObjectIntMap); }
    
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
    
    final ObjectIntMap<K> map;
    
    int nextIndex;
    
    boolean valid = true;
    
    public MapIterator(ObjectIntMap<K> param1ObjectIntMap) {
      this.map = param1ObjectIntMap;
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
        ObjectIntMap objectIntMap = this.map;
        objectIntMap.size--;
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
    public Values(ObjectIntMap<?> param1ObjectIntMap) { super(param1ObjectIntMap); }
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public int next() {
      if (this.hasNext) {
        if (this.valid) {
          int i = this.map.valueTable[this.nextIndex];
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ObjectIntMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */