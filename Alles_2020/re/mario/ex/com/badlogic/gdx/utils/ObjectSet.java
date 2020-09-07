package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectSet<T> extends Object implements Iterable<T> {
  private static final int PRIME1 = -1105259343;
  
  private static final int PRIME2 = -1262997959;
  
  private static final int PRIME3 = -825114047;
  
  int capacity;
  
  private int hashShift;
  
  private ObjectSetIterator iterator1;
  
  private ObjectSetIterator iterator2;
  
  T[] keyTable;
  
  private float loadFactor;
  
  private int mask;
  
  private int pushIterations;
  
  public int size;
  
  private int stashCapacity;
  
  int stashSize;
  
  private int threshold;
  
  public ObjectSet() { this(51, 0.8F); }
  
  public ObjectSet(int paramInt) { this(paramInt, 0.8F); }
  
  public ObjectSet(int paramInt, float paramFloat) {
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
  
  public ObjectSet(ObjectSet<? extends T> paramObjectSet) {
    this((int)Math.floor((paramObjectSet.capacity * paramObjectSet.loadFactor)), paramObjectSet.loadFactor);
    this.stashSize = paramObjectSet.stashSize;
    Object[] arrayOfObject = paramObjectSet.keyTable;
    System.arraycopy(arrayOfObject, 0, this.keyTable, 0, arrayOfObject.length);
    this.size = paramObjectSet.size;
  }
  
  private void addResize(T paramT) {
    int i = paramT.hashCode();
    int j = i & this.mask;
    Object[] arrayOfObject1 = this.keyTable;
    Object object2 = arrayOfObject1[j];
    if (object2 == null) {
      arrayOfObject1[j] = paramT;
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
      arrayOfObject2[k] = paramT;
      k = this.size;
      this.size = k + 1;
      if (k >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    i = hash3(i);
    arrayOfObject2 = this.keyTable;
    Object object3 = arrayOfObject2[i];
    if (object3 == null) {
      arrayOfObject2[i] = paramT;
      k = this.size;
      this.size = k + 1;
      if (k >= this.threshold)
        resize(this.capacity << 1); 
      return;
    } 
    push(paramT, j, object2, k, object1, i, object3);
  }
  
  private void addStash(T paramT) {
    int i = this.stashSize;
    if (i == this.stashCapacity) {
      resize(this.capacity << 1);
      addResize(paramT);
      return;
    } 
    int j = this.capacity;
    this.keyTable[j + i] = paramT;
    this.stashSize = i + 1;
    this.size++;
  }
  
  private T getKeyStash(T paramT) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramT.equals(arrayOfObject[k]))
        return (T)arrayOfObject[k]; 
    } 
    return null;
  }
  
  private int hash2(int paramInt) {
    paramInt *= -1262997959;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private int hash3(int paramInt) {
    paramInt *= -825114047;
    return (paramInt ^ paramInt >>> this.hashShift) & this.mask;
  }
  
  private void push(T paramT1, int paramInt1, T paramT2, int paramInt2, T paramT3, int paramInt3, T paramT4) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.mask;
    int j = this.pushIterations;
    int k = 0;
    int m = paramInt3;
    int n = paramInt2;
    paramInt3 = paramInt1;
    paramInt1 = k;
    while (true) {
      paramInt2 = MathUtils.random(2);
      if (paramInt2 != 0) {
        if (paramInt2 != 1) {
          arrayOfObject[m] = paramT1;
          paramT1 = paramT4;
        } else {
          arrayOfObject[n] = paramT1;
          paramT1 = paramT3;
        } 
      } else {
        arrayOfObject[paramInt3] = paramT1;
        paramT1 = paramT2;
      } 
      paramInt2 = paramT1.hashCode();
      paramInt3 = paramInt2 & i;
      paramT2 = (T)arrayOfObject[paramInt3];
      if (paramT2 == null) {
        arrayOfObject[paramInt3] = paramT1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      n = hash2(paramInt2);
      paramT3 = (T)arrayOfObject[n];
      if (paramT3 == null) {
        arrayOfObject[n] = paramT1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      paramInt2 = hash3(paramInt2);
      paramT4 = (T)arrayOfObject[paramInt2];
      if (paramT4 == null) {
        arrayOfObject[paramInt2] = paramT1;
        paramInt1 = this.size;
        this.size = paramInt1 + 1;
        if (paramInt1 >= this.threshold)
          resize(this.capacity << 1); 
        return;
      } 
      if (++paramInt1 == j) {
        addStash(paramT1);
        return;
      } 
      m = paramInt2;
    } 
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
    this.keyTable = (Object[])new Object[paramInt + this.stashCapacity];
    int k = this.size;
    paramInt = 0;
    this.size = 0;
    this.stashSize = 0;
    if (k > 0)
      while (paramInt < i + j) {
        Object object = arrayOfObject[paramInt];
        if (object != null)
          addResize(object); 
        paramInt++;
      }  
  }
  
  public static <T> ObjectSet<T> with(T... paramVarArgs) {
    ObjectSet objectSet = new ObjectSet();
    objectSet.addAll(paramVarArgs);
    return objectSet;
  }
  
  public boolean add(T paramT) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 274
    //   4: aload_0
    //   5: getfield keyTable : [Ljava/lang/Object;
    //   8: astore_2
    //   9: aload_1
    //   10: invokevirtual hashCode : ()I
    //   13: istore_3
    //   14: iload_3
    //   15: aload_0
    //   16: getfield mask : I
    //   19: iand
    //   20: istore #4
    //   22: aload_2
    //   23: iload #4
    //   25: aaload
    //   26: astore #5
    //   28: aload_1
    //   29: aload #5
    //   31: invokevirtual equals : (Ljava/lang/Object;)Z
    //   34: ifeq -> 39
    //   37: iconst_0
    //   38: ireturn
    //   39: aload_0
    //   40: iload_3
    //   41: invokespecial hash2 : (I)I
    //   44: istore #6
    //   46: aload_2
    //   47: iload #6
    //   49: aaload
    //   50: astore #7
    //   52: aload_1
    //   53: aload #7
    //   55: invokevirtual equals : (Ljava/lang/Object;)Z
    //   58: ifeq -> 63
    //   61: iconst_0
    //   62: ireturn
    //   63: aload_0
    //   64: iload_3
    //   65: invokespecial hash3 : (I)I
    //   68: istore #8
    //   70: aload_2
    //   71: iload #8
    //   73: aaload
    //   74: astore #9
    //   76: aload_1
    //   77: aload #9
    //   79: invokevirtual equals : (Ljava/lang/Object;)Z
    //   82: ifeq -> 87
    //   85: iconst_0
    //   86: ireturn
    //   87: aload_0
    //   88: getfield capacity : I
    //   91: istore #10
    //   93: aload_0
    //   94: getfield stashSize : I
    //   97: istore #11
    //   99: iload #10
    //   101: istore_3
    //   102: iload_3
    //   103: iload #11
    //   105: iload #10
    //   107: iadd
    //   108: if_icmpge -> 129
    //   111: aload_1
    //   112: aload_2
    //   113: iload_3
    //   114: aaload
    //   115: invokevirtual equals : (Ljava/lang/Object;)Z
    //   118: ifeq -> 123
    //   121: iconst_0
    //   122: ireturn
    //   123: iinc #3, 1
    //   126: goto -> 102
    //   129: aload #5
    //   131: ifnonnull -> 171
    //   134: aload_2
    //   135: iload #4
    //   137: aload_1
    //   138: aastore
    //   139: aload_0
    //   140: getfield size : I
    //   143: istore_3
    //   144: aload_0
    //   145: iload_3
    //   146: iconst_1
    //   147: iadd
    //   148: putfield size : I
    //   151: iload_3
    //   152: aload_0
    //   153: getfield threshold : I
    //   156: if_icmplt -> 169
    //   159: aload_0
    //   160: aload_0
    //   161: getfield capacity : I
    //   164: iconst_1
    //   165: ishl
    //   166: invokespecial resize : (I)V
    //   169: iconst_1
    //   170: ireturn
    //   171: aload #7
    //   173: ifnonnull -> 213
    //   176: aload_2
    //   177: iload #6
    //   179: aload_1
    //   180: aastore
    //   181: aload_0
    //   182: getfield size : I
    //   185: istore_3
    //   186: aload_0
    //   187: iload_3
    //   188: iconst_1
    //   189: iadd
    //   190: putfield size : I
    //   193: iload_3
    //   194: aload_0
    //   195: getfield threshold : I
    //   198: if_icmplt -> 211
    //   201: aload_0
    //   202: aload_0
    //   203: getfield capacity : I
    //   206: iconst_1
    //   207: ishl
    //   208: invokespecial resize : (I)V
    //   211: iconst_1
    //   212: ireturn
    //   213: aload #9
    //   215: ifnonnull -> 255
    //   218: aload_2
    //   219: iload #8
    //   221: aload_1
    //   222: aastore
    //   223: aload_0
    //   224: getfield size : I
    //   227: istore_3
    //   228: aload_0
    //   229: iload_3
    //   230: iconst_1
    //   231: iadd
    //   232: putfield size : I
    //   235: iload_3
    //   236: aload_0
    //   237: getfield threshold : I
    //   240: if_icmplt -> 253
    //   243: aload_0
    //   244: aload_0
    //   245: getfield capacity : I
    //   248: iconst_1
    //   249: ishl
    //   250: invokespecial resize : (I)V
    //   253: iconst_1
    //   254: ireturn
    //   255: aload_0
    //   256: aload_1
    //   257: iload #4
    //   259: aload #5
    //   261: iload #6
    //   263: aload #7
    //   265: iload #8
    //   267: aload #9
    //   269: invokespecial push : (Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    //   272: iconst_1
    //   273: ireturn
    //   274: new java/lang/IllegalArgumentException
    //   277: dup
    //   278: ldc 'key cannot be null.'
    //   280: invokespecial <init> : (Ljava/lang/String;)V
    //   283: astore_1
    //   284: goto -> 289
    //   287: aload_1
    //   288: athrow
    //   289: goto -> 287 }
  
  public void addAll(Array<? extends T> paramArray) { addAll(paramArray.items, 0, paramArray.size); }
  
  public void addAll(Array<? extends T> paramArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramArray.size) {
      addAll((Object[])paramArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(ObjectSet<T> paramObjectSet) {
    ensureCapacity(paramObjectSet.size);
    ObjectSetIterator objectSetIterator = paramObjectSet.iterator();
    while (objectSetIterator.hasNext())
      add(objectSetIterator.next()); 
  }
  
  public void addAll(T... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(T[] paramArrayOfT, int paramInt1, int paramInt2) {
    ensureCapacity(paramInt2);
    for (int i = paramInt1; i < paramInt2 + paramInt1; i++)
      add(paramArrayOfT[i]); 
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
  
  public boolean contains(T paramT) {
    int i = paramT.hashCode();
    int j = this.mask;
    boolean bool = paramT.equals(this.keyTable[j & i]);
    byte b = 1;
    int k = b;
    if (!bool) {
      j = hash2(i);
      k = b;
      if (!paramT.equals(this.keyTable[j])) {
        i = hash3(i);
        k = b;
        if (!paramT.equals(this.keyTable[i]))
          if (getKeyStash(paramT) != null) {
            k = b;
          } else {
            k = 0;
          }  
      } 
    } 
    return k;
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
    if (!(paramObject instanceof ObjectSet))
      return false; 
    paramObject = (ObjectSet)paramObject;
    if (paramObject.size != this.size)
      return false; 
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      if (arrayOfObject[b] != null && !paramObject.contains(arrayOfObject[b]))
        return false; 
    } 
    return true;
  }
  
  public T first() {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (byte b = 0; b < i + j; b++) {
      if (arrayOfObject[b] != null)
        return (T)arrayOfObject[b]; 
    } 
    IllegalStateException illegalStateException = new IllegalStateException("ObjectSet is empty.");
    throw illegalStateException;
  }
  
  public T get(T paramT) {
    int i = paramT.hashCode();
    int j = this.mask;
    Object object1 = this.keyTable[j & i];
    Object object2 = object1;
    if (!paramT.equals(object1)) {
      j = hash2(i);
      object1 = this.keyTable[j];
      object2 = object1;
      if (!paramT.equals(object1)) {
        i = hash3(i);
        object1 = this.keyTable[i];
        object2 = object1;
        if (!paramT.equals(object1))
          return (T)getKeyStash(paramT); 
      } 
    } 
    return (T)object2;
  }
  
  public int hashCode() {
    int i = this.capacity;
    int j = this.stashSize;
    byte b = 0;
    int k;
    for (k = 0; b < i + j; k = m) {
      Object[] arrayOfObject = this.keyTable;
      int m = k;
      if (arrayOfObject[b] != null)
        m = k + arrayOfObject[b].hashCode(); 
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
  
  public ObjectSetIterator<T> iterator() {
    if (Collections.allocateIterators)
      return new ObjectSetIterator(this); 
    if (this.iterator1 == null) {
      this.iterator1 = new ObjectSetIterator(this);
      this.iterator2 = new ObjectSetIterator(this);
    } 
    if (!this.iterator1.valid) {
      this.iterator1.reset();
      ObjectSetIterator objectSetIterator1 = this.iterator1;
      objectSetIterator1.valid = true;
      this.iterator2.valid = false;
      return objectSetIterator1;
    } 
    this.iterator2.reset();
    ObjectSetIterator objectSetIterator = this.iterator2;
    objectSetIterator.valid = true;
    this.iterator1.valid = false;
    return objectSetIterator;
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
  
  public boolean remove(T paramT) {
    int i = paramT.hashCode();
    int j = this.mask & i;
    if (paramT.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      this.size--;
      return true;
    } 
    j = hash2(i);
    if (paramT.equals(this.keyTable[j])) {
      this.keyTable[j] = null;
      this.size--;
      return true;
    } 
    i = hash3(i);
    if (paramT.equals(this.keyTable[i])) {
      this.keyTable[i] = null;
      this.size--;
      return true;
    } 
    return removeStash(paramT);
  }
  
  boolean removeStash(T paramT) {
    Object[] arrayOfObject = this.keyTable;
    int i = this.capacity;
    int j = this.stashSize;
    for (int k = i; k < j + i; k++) {
      if (paramT.equals(arrayOfObject[k])) {
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
      Object[] arrayOfObject = this.keyTable;
      arrayOfObject[paramInt] = arrayOfObject[i];
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
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append('{');
    stringBuilder.append(toString(", "));
    stringBuilder.append('}');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    int j;
    if (this.size == 0)
      return ""; 
    StringBuilder stringBuilder = new StringBuilder(32);
    Object[] arrayOfObject = this.keyTable;
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
        j = k;
      } 
      break;
    } 
    while (true) {
      i = j - 1;
      if (j > 0) {
        Object object = arrayOfObject[i];
        if (object != null) {
          stringBuilder.append(paramString);
          stringBuilder.append(object);
        } 
        j = i;
        continue;
      } 
      break;
    } 
    return stringBuilder.toString();
  }
  
  public static class ObjectSetIterator<K> extends Object implements Iterable<K>, Iterator<K> {
    int currentIndex;
    
    public boolean hasNext;
    
    int nextIndex;
    
    final ObjectSet<K> set;
    
    boolean valid = true;
    
    public ObjectSetIterator(ObjectSet<K> param1ObjectSet) {
      this.set = param1ObjectSet;
      reset();
    }
    
    private void findNextIndex() {
      this.hasNext = false;
      Object[] arrayOfObject = this.set.keyTable;
      int i = this.set.capacity;
      int j = this.set.stashSize;
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
    
    public boolean hasNext() {
      if (this.valid)
        return this.hasNext; 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public ObjectSetIterator<K> iterator() { return this; }
    
    public K next() {
      if (this.hasNext) {
        if (this.valid) {
          Object[] arrayOfObject = this.set.keyTable;
          int i = this.nextIndex;
          Object object = arrayOfObject[i];
          this.currentIndex = i;
          findNextIndex();
          return (K)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      int i = this.currentIndex;
      if (i >= 0) {
        if (i >= this.set.capacity) {
          this.set.removeStashIndex(this.currentIndex);
          this.nextIndex = this.currentIndex - 1;
          findNextIndex();
        } else {
          this.set.keyTable[this.currentIndex] = null;
        } 
        this.currentIndex = -1;
        ObjectSet objectSet = this.set;
        objectSet.size--;
        return;
      } 
      throw new IllegalStateException("next must be called before remove.");
    }
    
    public void reset() {
      this.currentIndex = -1;
      this.nextIndex = -1;
      findNextIndex();
    }
    
    public Array<K> toArray() { return toArray(new Array(true, this.set.size)); }
    
    public Array<K> toArray(Array<K> param1Array) {
      while (this.hasNext)
        param1Array.add(next()); 
      return param1Array;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ObjectSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */