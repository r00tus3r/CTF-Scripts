package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Array<T> extends Object implements Iterable<T> {
  public T[] items;
  
  private ArrayIterable iterable;
  
  public boolean ordered;
  
  private Predicate.PredicateIterable<T> predicateIterable;
  
  public int size;
  
  public Array() { this(true, 16); }
  
  public Array(int paramInt) { this(true, paramInt); }
  
  public Array(Array<? extends T> paramArray) {
    this(paramArray.ordered, paramArray.size, paramArray.items.getClass().getComponentType());
    this.size = paramArray.size;
    System.arraycopy(paramArray.items, 0, this.items, 0, this.size);
  }
  
  public Array(Class paramClass) { this(true, 16, paramClass); }
  
  public Array(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.items = (Object[])new Object[paramInt];
  }
  
  public Array(boolean paramBoolean, int paramInt, Class paramClass) {
    this.ordered = paramBoolean;
    this.items = (Object[])ArrayReflection.newInstance(paramClass, paramInt);
  }
  
  public Array(boolean paramBoolean, T[] paramArrayOfT, int paramInt1, int paramInt2) {
    this(paramBoolean, paramInt2, paramArrayOfT.getClass().getComponentType());
    this.size = paramInt2;
    System.arraycopy(paramArrayOfT, paramInt1, this.items, 0, this.size);
  }
  
  public Array(T[] paramArrayOfT) { this(true, paramArrayOfT, 0, paramArrayOfT.length); }
  
  public static <T> Array<T> of(Class<T> paramClass) { return new Array(paramClass); }
  
  public static <T> Array<T> of(boolean paramBoolean, int paramInt, Class<T> paramClass) { return new Array(paramBoolean, paramInt, paramClass); }
  
  public static <T> Array<T> with(T... paramVarArgs) { return new Array(paramVarArgs); }
  
  public void add(T paramT) {
    Object[] arrayOfObject1 = this.items;
    int i = this.size;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (i == arrayOfObject1.length)
      arrayOfObject2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    this.size = i + 1;
    arrayOfObject2[i] = paramT;
  }
  
  public void add(T paramT1, T paramT2) {
    Object[] arrayOfObject1 = this.items;
    int i = this.size;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (i + 1 >= arrayOfObject1.length)
      arrayOfObject2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfObject2[i] = paramT1;
    arrayOfObject2[i + 1] = paramT2;
    this.size = i + 2;
  }
  
  public void add(T paramT1, T paramT2, T paramT3) {
    Object[] arrayOfObject1 = this.items;
    int i = this.size;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (i + 2 >= arrayOfObject1.length)
      arrayOfObject2 = resize(Math.max(8, (int)(i * 1.75F))); 
    i = this.size;
    arrayOfObject2[i] = paramT1;
    arrayOfObject2[i + 1] = paramT2;
    arrayOfObject2[i + 2] = paramT3;
    this.size = i + 3;
  }
  
  public void add(T paramT1, T paramT2, T paramT3, T paramT4) {
    Object[] arrayOfObject1 = this.items;
    int i = this.size;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (i + 3 >= arrayOfObject1.length)
      arrayOfObject2 = resize(Math.max(8, (int)(i * 1.8F))); 
    i = this.size;
    arrayOfObject2[i] = paramT1;
    arrayOfObject2[i + 1] = paramT2;
    arrayOfObject2[i + 2] = paramT3;
    arrayOfObject2[i + 3] = paramT4;
    this.size = i + 4;
  }
  
  public void addAll(Array<? extends T> paramArray) { addAll(paramArray.items, 0, paramArray.size); }
  
  public void addAll(Array<? extends T> paramArray, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramArray.size) {
      addAll((Object[])paramArray.items, paramInt1, paramInt2);
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("start + count must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramArray.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void addAll(T... paramVarArgs) { addAll(paramVarArgs, 0, paramVarArgs.length); }
  
  public void addAll(T[] paramArrayOfT, int paramInt1, int paramInt2) {
    Object[] arrayOfObject1 = this.items;
    int i = this.size + paramInt2;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (i > arrayOfObject1.length)
      arrayOfObject2 = resize(Math.max(8, (int)(i * 1.75F))); 
    System.arraycopy(paramArrayOfT, paramInt1, arrayOfObject2, this.size, paramInt2);
    this.size += paramInt2;
  }
  
  public void clear() {
    Object[] arrayOfObject = this.items;
    int i = this.size;
    for (byte b = 0; b < i; b++)
      arrayOfObject[b] = null; 
    this.size = 0;
  }
  
  public boolean contains(T paramT, boolean paramBoolean) {
    Object[] arrayOfObject = this.items;
    int i = this.size - 1;
    int j = i;
    if (!paramBoolean) {
      j = i;
      if (paramT == null) {
        j = i;
      } else {
        while (j >= 0) {
          if (paramT.equals(arrayOfObject[j]))
            return true; 
          j--;
        } 
        return false;
      } 
    } 
    while (j >= 0) {
      if (arrayOfObject[j] == paramT)
        return true; 
      j--;
    } 
    return false;
  }
  
  public boolean containsAll(Array<? extends T> paramArray, boolean paramBoolean) {
    Object[] arrayOfObject = paramArray.items;
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      if (!contains(arrayOfObject[b], paramBoolean))
        return false; 
    } 
    return true;
  }
  
  public boolean containsAny(Array<? extends T> paramArray, boolean paramBoolean) {
    Object[] arrayOfObject = paramArray.items;
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      if (contains(arrayOfObject[b], paramBoolean))
        return true; 
    } 
    return false;
  }
  
  public T[] ensureCapacity(int paramInt) {
    if (paramInt >= 0) {
      paramInt = this.size + paramInt;
      if (paramInt > this.items.length)
        resize(Math.max(8, paramInt)); 
      return (T[])this.items;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("additionalCapacity must be >= 0: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public boolean equals(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!this.ordered)
      return false; 
    if (!(paramObject instanceof Array))
      return false; 
    Array array = (Array)paramObject;
    if (!array.ordered)
      return false; 
    int i = this.size;
    if (i != array.size)
      return false; 
    Object[] arrayOfObject1 = this.items;
    Object[] arrayOfObject2 = array.items;
    byte b = 0;
    while (b < i) {
      Object object2 = arrayOfObject1[b];
      Object object1 = arrayOfObject2[b];
      if ((object2 == null) ? (object1 == null) : object2.equals(object1)) {
        b++;
        continue;
      } 
      return false;
    } 
    return true;
  }
  
  public boolean equalsIdentity(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!this.ordered)
      return false; 
    if (!(paramObject instanceof Array))
      return false; 
    Array array = (Array)paramObject;
    if (!array.ordered)
      return false; 
    int i = this.size;
    if (i != array.size)
      return false; 
    Object[] arrayOfObject1 = this.items;
    Object[] arrayOfObject2 = array.items;
    for (byte b = 0; b < i; b++) {
      if (arrayOfObject1[b] != arrayOfObject2[b])
        return false; 
    } 
    return true;
  }
  
  public T first() {
    if (this.size != 0)
      return (T)this.items[0]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public T get(int paramInt) {
    if (paramInt < this.size)
      return (T)this.items[paramInt]; 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int hashCode() {
    if (!this.ordered)
      return super.hashCode(); 
    Object[] arrayOfObject = this.items;
    byte b = 0;
    int i = this.size;
    int j = 1;
    while (b < i) {
      int k = j * 31;
      Object object = arrayOfObject[b];
      j = k;
      if (object != null)
        j = k + object.hashCode(); 
      b++;
    } 
    return j;
  }
  
  public int indexOf(T paramT, boolean paramBoolean) {
    Object[] arrayOfObject = this.items;
    int i = 0;
    byte b = 0;
    if (paramBoolean || paramT == null) {
      int j = this.size;
      for (b = i; b < j; b++) {
        if (arrayOfObject[b] == paramT)
          return b; 
      } 
      return -1;
    } 
    i = this.size;
    while (b < i) {
      if (paramT.equals(arrayOfObject[b]))
        return b; 
      b++;
    } 
    return -1;
  }
  
  public void insert(int paramInt, T paramT) { // Byte code:
    //   0: aload_0
    //   1: getfield size : I
    //   4: istore_3
    //   5: iload_1
    //   6: iload_3
    //   7: if_icmpgt -> 98
    //   10: aload_0
    //   11: getfield items : [Ljava/lang/Object;
    //   14: astore #4
    //   16: aload #4
    //   18: astore #5
    //   20: iload_3
    //   21: aload #4
    //   23: arraylength
    //   24: if_icmpne -> 44
    //   27: aload_0
    //   28: bipush #8
    //   30: iload_3
    //   31: i2f
    //   32: ldc 1.75
    //   34: fmul
    //   35: f2i
    //   36: invokestatic max : (II)I
    //   39: invokevirtual resize : (I)[Ljava/lang/Object;
    //   42: astore #5
    //   44: aload_0
    //   45: getfield ordered : Z
    //   48: ifeq -> 71
    //   51: aload #5
    //   53: iload_1
    //   54: aload #5
    //   56: iload_1
    //   57: iconst_1
    //   58: iadd
    //   59: aload_0
    //   60: getfield size : I
    //   63: iload_1
    //   64: isub
    //   65: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   68: goto -> 82
    //   71: aload #5
    //   73: aload_0
    //   74: getfield size : I
    //   77: aload #5
    //   79: iload_1
    //   80: aaload
    //   81: aastore
    //   82: aload_0
    //   83: aload_0
    //   84: getfield size : I
    //   87: iconst_1
    //   88: iadd
    //   89: putfield size : I
    //   92: aload #5
    //   94: iload_1
    //   95: aload_2
    //   96: aastore
    //   97: return
    //   98: new java/lang/StringBuilder
    //   101: dup
    //   102: invokespecial <init> : ()V
    //   105: astore_2
    //   106: aload_2
    //   107: ldc 'index can't be > size: '
    //   109: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   112: pop
    //   113: aload_2
    //   114: iload_1
    //   115: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   118: pop
    //   119: aload_2
    //   120: ldc ' > '
    //   122: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: pop
    //   126: aload_2
    //   127: aload_0
    //   128: getfield size : I
    //   131: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   134: pop
    //   135: new java/lang/IndexOutOfBoundsException
    //   138: dup
    //   139: aload_2
    //   140: invokevirtual toString : ()Ljava/lang/String;
    //   143: invokespecial <init> : (Ljava/lang/String;)V
    //   146: athrow }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.size == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Iterator<T> iterator() {
    if (Collections.allocateIterators)
      return new ArrayIterator(this, true); 
    if (this.iterable == null)
      this.iterable = new ArrayIterable(this); 
    return this.iterable.iterator();
  }
  
  public int lastIndexOf(T paramT, boolean paramBoolean) {
    Object[] arrayOfObject = this.items;
    if (paramBoolean || paramT == null) {
      for (int j = this.size - 1; j >= 0; j--) {
        if (arrayOfObject[j] == paramT)
          return j; 
      } 
      return -1;
    } 
    for (int i = this.size - 1; i >= 0; i--) {
      if (paramT.equals(arrayOfObject[i]))
        return i; 
    } 
    return -1;
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
  
  public T peek() {
    int i = this.size;
    if (i != 0)
      return (T)this.items[i - 1]; 
    throw new IllegalStateException("Array is empty.");
  }
  
  public T pop() {
    int i = this.size;
    if (i != 0) {
      this.size = i - 1;
      Object[] arrayOfObject = this.items;
      i = this.size;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      return (T)object;
    } 
    throw new IllegalStateException("Array is empty.");
  }
  
  public T random() {
    int i = this.size;
    return (i == 0) ? null : (T)this.items[MathUtils.random(0, i - 1)];
  }
  
  public boolean removeAll(Array<? extends T> paramArray, boolean paramBoolean) {
    int j;
    int i = this.size;
    Object[] arrayOfObject = this.items;
    boolean bool = false;
    if (paramBoolean) {
      int k = paramArray.size;
      int m = i;
      byte b = 0;
      while (true) {
        j = m;
        if (b < k) {
          Object object = paramArray.get(b);
          byte b1 = 0;
          while (true) {
            j = m;
            if (b1 < m) {
              if (object == arrayOfObject[b1]) {
                removeIndex(b1);
                j = m - 1;
                break;
              } 
              b1++;
              continue;
            } 
            break;
          } 
          b++;
          m = j;
          continue;
        } 
        break;
      } 
    } else {
      int k = paramArray.size;
      int m = i;
      byte b = 0;
      while (true) {
        j = m;
        if (b < k) {
          Object object = paramArray.get(b);
          byte b1 = 0;
          while (true) {
            j = m;
            if (b1 < m) {
              if (object.equals(arrayOfObject[b1])) {
                removeIndex(b1);
                j = m - 1;
                break;
              } 
              b1++;
              continue;
            } 
            break;
          } 
          b++;
          m = j;
          continue;
        } 
        break;
      } 
    } 
    paramBoolean = bool;
    if (j != i)
      paramBoolean = true; 
    return paramBoolean;
  }
  
  public T removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      Object[] arrayOfObject = this.items;
      Object object = arrayOfObject[paramInt];
      this.size = i - 1;
      if (this.ordered) {
        System.arraycopy(arrayOfObject, paramInt + 1, arrayOfObject, paramInt, this.size - paramInt);
      } else {
        arrayOfObject[paramInt] = arrayOfObject[this.size];
      } 
      arrayOfObject[this.size] = null;
      return (T)object;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be >= size: ");
    stringBuilder.append(paramInt);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public void removeRange(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt2 < i) {
      if (paramInt1 <= paramInt2) {
        Object[] arrayOfObject = this.items;
        int j = paramInt2 - paramInt1 + 1;
        int k = i - j;
        if (this.ordered) {
          paramInt2 = j + paramInt1;
          System.arraycopy(arrayOfObject, paramInt2, arrayOfObject, paramInt1, i - paramInt2);
        } else {
          paramInt2 = Math.max(k, paramInt2 + 1);
          System.arraycopy(arrayOfObject, paramInt2, arrayOfObject, paramInt1, i - paramInt2);
        } 
        for (paramInt1 = k; paramInt1 < i; paramInt1++)
          arrayOfObject[paramInt1] = null; 
        this.size = k;
        return;
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("start can't be > end: ");
      stringBuilder1.append(paramInt1);
      stringBuilder1.append(" > ");
      stringBuilder1.append(paramInt2);
      throw new IndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("end can't be >= size: ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    IndexOutOfBoundsException indexOutOfBoundsException = new IndexOutOfBoundsException(stringBuilder.toString());
    throw indexOutOfBoundsException;
  }
  
  public boolean removeValue(T paramT, boolean paramBoolean) {
    Object[] arrayOfObject = this.items;
    if (paramBoolean || paramT == null) {
      int j = this.size;
      for (byte b1 = 0; b1 < j; b1++) {
        if (arrayOfObject[b1] == paramT) {
          removeIndex(b1);
          return true;
        } 
      } 
      return false;
    } 
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (paramT.equals(arrayOfObject[b])) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected T[] resize(int paramInt) {
    Object[] arrayOfObject1 = this.items;
    Object[] arrayOfObject2 = (Object[])ArrayReflection.newInstance(arrayOfObject1.getClass().getComponentType(), paramInt);
    System.arraycopy(arrayOfObject1, 0, arrayOfObject2, 0, Math.min(this.size, arrayOfObject2.length));
    this.items = arrayOfObject2;
    return (T[])arrayOfObject2;
  }
  
  public void reverse() {
    Object[] arrayOfObject = this.items;
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      Object object = arrayOfObject[k];
      arrayOfObject[k] = arrayOfObject[m];
      arrayOfObject[m] = object;
    } 
  }
  
  public Iterable<T> select(Predicate<T> paramPredicate) {
    if (Collections.allocateIterators)
      new Predicate.PredicateIterable(this, paramPredicate); 
    Predicate.PredicateIterable predicateIterable1 = this.predicateIterable;
    if (predicateIterable1 == null) {
      this.predicateIterable = new Predicate.PredicateIterable(this, paramPredicate);
    } else {
      predicateIterable1.set(this, paramPredicate);
    } 
    return this.predicateIterable;
  }
  
  public T selectRanked(Comparator<T> paramComparator, int paramInt) {
    if (paramInt >= 1)
      return (T)Select.instance().select(this.items, paramComparator, paramInt, this.size); 
    throw new GdxRuntimeException("nth_lowest must be greater than 0, 1 = first, 2 = second...");
  }
  
  public int selectRankedIndex(Comparator<T> paramComparator, int paramInt) {
    if (paramInt >= 1)
      return Select.instance().selectIndex(this.items, paramComparator, paramInt, this.size); 
    throw new GdxRuntimeException("nth_lowest must be greater than 0, 1 = first, 2 = second...");
  }
  
  public void set(int paramInt, T paramT) { // Byte code:
    //   0: iload_1
    //   1: aload_0
    //   2: getfield size : I
    //   5: if_icmpge -> 16
    //   8: aload_0
    //   9: getfield items : [Ljava/lang/Object;
    //   12: iload_1
    //   13: aload_2
    //   14: aastore
    //   15: return
    //   16: new java/lang/StringBuilder
    //   19: dup
    //   20: invokespecial <init> : ()V
    //   23: astore_2
    //   24: aload_2
    //   25: ldc 'index can't be >= size: '
    //   27: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: pop
    //   31: aload_2
    //   32: iload_1
    //   33: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   36: pop
    //   37: aload_2
    //   38: ldc ' >= '
    //   40: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: pop
    //   44: aload_2
    //   45: aload_0
    //   46: getfield size : I
    //   49: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   52: pop
    //   53: new java/lang/IndexOutOfBoundsException
    //   56: dup
    //   57: aload_2
    //   58: invokevirtual toString : ()Ljava/lang/String;
    //   61: invokespecial <init> : (Ljava/lang/String;)V
    //   64: athrow }
  
  public T[] setSize(int paramInt) {
    truncate(paramInt);
    if (paramInt > this.items.length)
      resize(Math.max(8, paramInt)); 
    this.size = paramInt;
    return (T[])this.items;
  }
  
  public T[] shrink() {
    int i = this.items.length;
    int j = this.size;
    if (i != j)
      resize(j); 
    return (T[])this.items;
  }
  
  public void shuffle() {
    Object[] arrayOfObject = this.items;
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      Object object = arrayOfObject[i];
      arrayOfObject[i] = arrayOfObject[j];
      arrayOfObject[j] = object;
    } 
  }
  
  public void sort() { Sort.instance().sort(this.items, 0, this.size); }
  
  public void sort(Comparator<? super T> paramComparator) { Sort.instance().sort(this.items, paramComparator, 0, this.size); }
  
  public void swap(int paramInt1, int paramInt2) {
    int i = this.size;
    if (paramInt1 < i) {
      if (paramInt2 < i) {
        Object[] arrayOfObject = this.items;
        Object object = arrayOfObject[paramInt1];
        arrayOfObject[paramInt1] = arrayOfObject[paramInt2];
        arrayOfObject[paramInt2] = object;
        return;
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("second can't be >= size: ");
      stringBuilder1.append(paramInt2);
      stringBuilder1.append(" >= ");
      stringBuilder1.append(this.size);
      throw new IndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("first can't be >= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" >= ");
    stringBuilder.append(this.size);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public T[] toArray() { return (T[])(Object[])toArray(this.items.getClass().getComponentType()); }
  
  public <V> V[] toArray(Class<V> paramClass) {
    Object[] arrayOfObject = (Object[])ArrayReflection.newInstance(paramClass, this.size);
    System.arraycopy(this.items, 0, arrayOfObject, 0, this.size);
    return (V[])arrayOfObject;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    Object[] arrayOfObject = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfObject[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfObject[b]);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) {
    if (this.size == 0)
      return ""; 
    Object[] arrayOfObject = this.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append(arrayOfObject[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(paramString);
      stringBuilder.append(arrayOfObject[b]);
    } 
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (paramInt >= 0) {
      if (this.size <= paramInt)
        return; 
      for (int i = paramInt; i < this.size; i++)
        this.items[i] = null; 
      this.size = paramInt;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("newSize must be >= 0: ");
    stringBuilder.append(paramInt);
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException(stringBuilder.toString());
    throw illegalArgumentException;
  }
  
  public static class ArrayIterable<T> extends Object implements Iterable<T> {
    private final boolean allowRemove;
    
    private final Array<T> array;
    
    private Array.ArrayIterator iterator1;
    
    private Array.ArrayIterator iterator2;
    
    public ArrayIterable(Array<T> param1Array) { this(param1Array, true); }
    
    public ArrayIterable(Array<T> param1Array, boolean param1Boolean) {
      this.array = param1Array;
      this.allowRemove = param1Boolean;
    }
    
    public Iterator<T> iterator() {
      if (Collections.allocateIterators)
        return new Array.ArrayIterator(this.array, this.allowRemove); 
      if (this.iterator1 == null) {
        this.iterator1 = new Array.ArrayIterator(this.array, this.allowRemove);
        this.iterator2 = new Array.ArrayIterator(this.array, this.allowRemove);
      } 
      if (!this.iterator1.valid) {
        Array.ArrayIterator arrayIterator1 = this.iterator1;
        arrayIterator1.index = 0;
        arrayIterator1.valid = true;
        this.iterator2.valid = false;
        return arrayIterator1;
      } 
      Array.ArrayIterator arrayIterator = this.iterator2;
      arrayIterator.index = 0;
      arrayIterator.valid = true;
      this.iterator1.valid = false;
      return arrayIterator;
    }
  }
  
  public static class ArrayIterator<T> extends Object implements Iterator<T>, Iterable<T> {
    private final boolean allowRemove;
    
    private final Array<T> array;
    
    int index;
    
    boolean valid = true;
    
    public ArrayIterator(Array<T> param1Array) { this(param1Array, true); }
    
    public ArrayIterator(Array<T> param1Array, boolean param1Boolean) {
      this.array = param1Array;
      this.allowRemove = param1Boolean;
    }
    
    public boolean hasNext() {
      if (this.valid) {
        boolean bool;
        if (this.index < this.array.size) {
          bool = true;
        } else {
          bool = false;
        } 
        return bool;
      } 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<T> iterator() { return this; }
    
    public T next() {
      if (this.index < this.array.size) {
        if (this.valid) {
          Object[] arrayOfObject = this.array.items;
          int i = this.index;
          this.index = i + 1;
          return (T)arrayOfObject[i];
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException(String.valueOf(this.index));
    }
    
    public void remove() {
      if (this.allowRemove) {
        this.index--;
        this.array.removeIndex(this.index);
        return;
      } 
      throw new GdxRuntimeException("Remove not allowed.");
    }
    
    public void reset() { this.index = 0; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Array.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */