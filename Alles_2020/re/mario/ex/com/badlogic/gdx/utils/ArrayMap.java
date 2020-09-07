package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ArrayMap<K, V> extends Object implements Iterable<ObjectMap.Entry<K, V>> {
  private Entries entries1;
  
  private Entries entries2;
  
  public K[] keys;
  
  private Keys keys1;
  
  private Keys keys2;
  
  public boolean ordered;
  
  public int size;
  
  public V[] values;
  
  private Values values1;
  
  private Values values2;
  
  public ArrayMap() { this(true, 16); }
  
  public ArrayMap(int paramInt) { this(true, paramInt); }
  
  public ArrayMap(ArrayMap paramArrayMap) {
    this(paramArrayMap.ordered, paramArrayMap.size, paramArrayMap.keys.getClass().getComponentType(), paramArrayMap.values.getClass().getComponentType());
    this.size = paramArrayMap.size;
    System.arraycopy(paramArrayMap.keys, 0, this.keys, 0, this.size);
    System.arraycopy(paramArrayMap.values, 0, this.values, 0, this.size);
  }
  
  public ArrayMap(Class paramClass1, Class paramClass2) { this(false, 16, paramClass1, paramClass2); }
  
  public ArrayMap(boolean paramBoolean, int paramInt) {
    this.ordered = paramBoolean;
    this.keys = (Object[])new Object[paramInt];
    this.values = (Object[])new Object[paramInt];
  }
  
  public ArrayMap(boolean paramBoolean, int paramInt, Class paramClass1, Class paramClass2) {
    this.ordered = paramBoolean;
    this.keys = (Object[])ArrayReflection.newInstance(paramClass1, paramInt);
    this.values = (Object[])ArrayReflection.newInstance(paramClass2, paramInt);
  }
  
  public void clear() {
    Object[] arrayOfObject1 = this.keys;
    Object[] arrayOfObject2 = this.values;
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      arrayOfObject1[b] = null;
      arrayOfObject2[b] = null;
    } 
    this.size = 0;
  }
  
  public void clear(int paramInt) {
    if (this.keys.length <= paramInt) {
      clear();
      return;
    } 
    this.size = 0;
    resize(paramInt);
  }
  
  public boolean containsKey(K paramK) {
    Object[] arrayOfObject = this.keys;
    int i = this.size - 1;
    int j = i;
    if (paramK == null) {
      while (i >= 0) {
        if (arrayOfObject[i] == paramK)
          return true; 
        i--;
      } 
    } else {
      while (j >= 0) {
        if (paramK.equals(arrayOfObject[j]))
          return true; 
        j--;
      } 
    } 
    return false;
  }
  
  public boolean containsValue(V paramV, boolean paramBoolean) {
    Object[] arrayOfObject = this.values;
    int i = this.size - 1;
    int j = i;
    if (!paramBoolean) {
      j = i;
      if (paramV == null) {
        j = i;
      } else {
        while (j >= 0) {
          if (paramV.equals(arrayOfObject[j]))
            return true; 
          j--;
        } 
        return false;
      } 
    } 
    while (j >= 0) {
      if (arrayOfObject[j] == paramV)
        return true; 
      j--;
    } 
    return false;
  }
  
  public void ensureCapacity(int paramInt) {
    if (paramInt >= 0) {
      paramInt = this.size + paramInt;
      if (paramInt >= this.keys.length)
        resize(Math.max(8, paramInt)); 
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
      Entries entries3 = this.entries1;
      entries3.index = 0;
      entries3.valid = true;
      this.entries2.valid = false;
      return entries3;
    } 
    Entries entries = this.entries2;
    entries.index = 0;
    entries.valid = true;
    this.entries1.valid = false;
    return entries;
  }
  
  public boolean equals(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof ArrayMap))
      return false; 
    paramObject = (ArrayMap)paramObject;
    int i = paramObject.size;
    int j = this.size;
    if (i != j)
      return false; 
    Object[] arrayOfObject1 = this.keys;
    Object[] arrayOfObject2 = this.values;
    for (i = 0; i < j; i++) {
      Object object1 = arrayOfObject1[i];
      Object object2 = arrayOfObject2[i];
      if (object2 == null) {
        if (paramObject.get(object1, ObjectMap.dummy) != null)
          return false; 
      } else if (!object2.equals(paramObject.get(object1))) {
        return false;
      } 
    } 
    return true;
  }
  
  public boolean equalsIdentity(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof ArrayMap))
      return false; 
    ArrayMap arrayMap = (ArrayMap)paramObject;
    int i = arrayMap.size;
    int j = this.size;
    if (i != j)
      return false; 
    Object[] arrayOfObject2 = this.keys;
    Object[] arrayOfObject1 = this.values;
    for (i = 0; i < j; i++) {
      if (arrayOfObject1[i] != arrayMap.get(arrayOfObject2[i], ObjectMap.dummy))
        return false; 
    } 
    return true;
  }
  
  public K firstKey() {
    if (this.size != 0)
      return (K)this.keys[0]; 
    throw new IllegalStateException("Map is empty.");
  }
  
  public V firstValue() {
    if (this.size != 0)
      return (V)this.values[0]; 
    throw new IllegalStateException("Map is empty.");
  }
  
  public V get(K paramK) { return (V)get(paramK, null); }
  
  public V get(K paramK, V paramV) {
    Object[] arrayOfObject = this.keys;
    int i = this.size - 1;
    int j = i;
    if (paramK == null) {
      while (i >= 0) {
        if (arrayOfObject[i] == paramK)
          return (V)this.values[i]; 
        i--;
      } 
    } else {
      while (j >= 0) {
        if (paramK.equals(arrayOfObject[j]))
          return (V)this.values[j]; 
        j--;
      } 
    } 
    return paramV;
  }
  
  public K getKey(V paramV, boolean paramBoolean) {
    Object[] arrayOfObject = this.values;
    int i = this.size - 1;
    int j = i;
    if (!paramBoolean) {
      j = i;
      if (paramV == null) {
        j = i;
      } else {
        while (j >= 0) {
          if (paramV.equals(arrayOfObject[j]))
            return (K)this.keys[j]; 
          j--;
        } 
        return null;
      } 
    } 
    while (j >= 0) {
      if (arrayOfObject[j] == paramV)
        return (K)this.keys[j]; 
      j--;
    } 
    return null;
  }
  
  public K getKeyAt(int paramInt) {
    if (paramInt < this.size)
      return (K)this.keys[paramInt]; 
    throw new IndexOutOfBoundsException(String.valueOf(paramInt));
  }
  
  public V getValueAt(int paramInt) {
    if (paramInt < this.size)
      return (V)this.values[paramInt]; 
    throw new IndexOutOfBoundsException(String.valueOf(paramInt));
  }
  
  public int hashCode() {
    Object[] arrayOfObject1 = this.keys;
    Object[] arrayOfObject2 = this.values;
    int i = this.size;
    byte b = 0;
    int j = 0;
    while (b < i) {
      Object object1 = arrayOfObject1[b];
      Object object2 = arrayOfObject2[b];
      int k = j;
      if (object1 != null)
        k = j + object1.hashCode() * 31; 
      j = k;
      if (object2 != null)
        j = k + object2.hashCode(); 
      b++;
    } 
    return j;
  }
  
  public int indexOfKey(K paramK) {
    Object[] arrayOfObject = this.keys;
    int i = 0;
    int j = 0;
    if (paramK == null) {
      i = this.size;
      while (j < i) {
        if (arrayOfObject[j] == paramK)
          return j; 
        j++;
      } 
    } else {
      int k = this.size;
      for (j = i; j < k; j++) {
        if (paramK.equals(arrayOfObject[j]))
          return j; 
      } 
    } 
    return -1;
  }
  
  public int indexOfValue(V paramV, boolean paramBoolean) {
    Object[] arrayOfObject = this.values;
    int i = 0;
    byte b = 0;
    if (paramBoolean || paramV == null) {
      int j = this.size;
      for (b = i; b < j; b++) {
        if (arrayOfObject[b] == paramV)
          return b; 
      } 
      return -1;
    } 
    i = this.size;
    while (b < i) {
      if (paramV.equals(arrayOfObject[b]))
        return b; 
      b++;
    } 
    return -1;
  }
  
  public void insert(int paramInt, K paramK, V paramV) {
    int i = this.size;
    if (paramInt <= i) {
      if (i == this.keys.length)
        resize(Math.max(8, (int)(i * 1.75F))); 
      if (this.ordered) {
        Object[] arrayOfObject = this.keys;
        i = paramInt + 1;
        System.arraycopy(arrayOfObject, paramInt, arrayOfObject, i, this.size - paramInt);
        arrayOfObject = this.values;
        System.arraycopy(arrayOfObject, paramInt, arrayOfObject, i, this.size - paramInt);
      } else {
        Object[] arrayOfObject = this.keys;
        i = this.size;
        arrayOfObject[i] = arrayOfObject[paramInt];
        arrayOfObject = this.values;
        arrayOfObject[i] = arrayOfObject[paramInt];
      } 
      this.size++;
      this.keys[paramInt] = paramK;
      this.values[paramInt] = paramV;
      return;
    } 
    throw new IndexOutOfBoundsException(String.valueOf(paramInt));
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
      Keys keys4 = this.keys1;
      keys4.index = 0;
      keys4.valid = true;
      this.keys2.valid = false;
      return keys4;
    } 
    Keys keys3 = this.keys2;
    keys3.index = 0;
    keys3.valid = true;
    this.keys1.valid = false;
    return keys3;
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
  
  public K peekKey() { return (K)this.keys[this.size - 1]; }
  
  public V peekValue() { return (V)this.values[this.size - 1]; }
  
  public int put(K paramK, V paramV) {
    int i = indexOfKey(paramK);
    int j = i;
    if (i == -1) {
      j = this.size;
      if (j == this.keys.length)
        resize(Math.max(8, (int)(j * 1.75F))); 
      j = this.size;
      this.size = j + 1;
    } 
    this.keys[j] = paramK;
    this.values[j] = paramV;
    return j;
  }
  
  public int put(K paramK, V paramV, int paramInt) {
    int i = indexOfKey(paramK);
    if (i != -1) {
      removeIndex(i);
    } else {
      i = this.size;
      if (i == this.keys.length)
        resize(Math.max(8, (int)(i * 1.75F))); 
    } 
    Object[] arrayOfObject = this.keys;
    i = paramInt + 1;
    System.arraycopy(arrayOfObject, paramInt, arrayOfObject, i, this.size - paramInt);
    arrayOfObject = this.values;
    System.arraycopy(arrayOfObject, paramInt, arrayOfObject, i, this.size - paramInt);
    this.keys[paramInt] = paramK;
    this.values[paramInt] = paramV;
    this.size++;
    return paramInt;
  }
  
  public void putAll(ArrayMap<? extends K, ? extends V> paramArrayMap) { putAll(paramArrayMap, 0, paramArrayMap.size); }
  
  public void putAll(ArrayMap<? extends K, ? extends V> paramArrayMap, int paramInt1, int paramInt2) {
    if (paramInt1 + paramInt2 <= paramArrayMap.size) {
      int i = this.size + paramInt2 - paramInt1;
      if (i >= this.keys.length)
        resize(Math.max(8, (int)(i * 1.75F))); 
      System.arraycopy(paramArrayMap.keys, paramInt1, this.keys, this.size, paramInt2);
      System.arraycopy(paramArrayMap.values, paramInt1, this.values, this.size, paramInt2);
      this.size += paramInt2;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("offset + length must be <= size: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(" + ");
    stringBuilder.append(paramInt2);
    stringBuilder.append(" <= ");
    stringBuilder.append(paramArrayMap.size);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void removeIndex(int paramInt) {
    int i = this.size;
    if (paramInt < i) {
      Object[] arrayOfObject = this.keys;
      this.size = i - 1;
      if (this.ordered) {
        i = paramInt + 1;
        System.arraycopy(arrayOfObject, i, arrayOfObject, paramInt, this.size - paramInt);
        Object[] arrayOfObject1 = this.values;
        System.arraycopy(arrayOfObject1, i, arrayOfObject1, paramInt, this.size - paramInt);
      } else {
        i = this.size;
        arrayOfObject[paramInt] = arrayOfObject[i];
        Object[] arrayOfObject1 = this.values;
        arrayOfObject1[paramInt] = arrayOfObject1[i];
      } 
      paramInt = this.size;
      arrayOfObject[paramInt] = null;
      this.values[paramInt] = null;
      return;
    } 
    throw new IndexOutOfBoundsException(String.valueOf(paramInt));
  }
  
  public V removeKey(K paramK) {
    Object[] arrayOfObject = this.keys;
    int i = 0;
    int j = 0;
    if (paramK == null) {
      i = this.size;
      while (j < i) {
        if (arrayOfObject[j] == paramK) {
          paramK = (K)this.values[j];
          removeIndex(j);
          return (V)paramK;
        } 
        j++;
      } 
    } else {
      int k = this.size;
      for (j = i; j < k; j++) {
        if (paramK.equals(arrayOfObject[j])) {
          paramK = (K)this.values[j];
          removeIndex(j);
          return (V)paramK;
        } 
      } 
    } 
    return null;
  }
  
  public boolean removeValue(V paramV, boolean paramBoolean) {
    Object[] arrayOfObject = this.values;
    if (paramBoolean || paramV == null) {
      int j = this.size;
      for (byte b1 = 0; b1 < j; b1++) {
        if (arrayOfObject[b1] == paramV) {
          removeIndex(b1);
          return true;
        } 
      } 
      return false;
    } 
    int i = this.size;
    for (byte b = 0; b < i; b++) {
      if (paramV.equals(arrayOfObject[b])) {
        removeIndex(b);
        return true;
      } 
    } 
    return false;
  }
  
  protected void resize(int paramInt) {
    Object[] arrayOfObject = (Object[])ArrayReflection.newInstance(this.keys.getClass().getComponentType(), paramInt);
    System.arraycopy(this.keys, 0, arrayOfObject, 0, Math.min(this.size, arrayOfObject.length));
    this.keys = arrayOfObject;
    arrayOfObject = (Object[])ArrayReflection.newInstance(this.values.getClass().getComponentType(), paramInt);
    System.arraycopy(this.values, 0, arrayOfObject, 0, Math.min(this.size, arrayOfObject.length));
    this.values = arrayOfObject;
  }
  
  public void reverse() {
    int i = this.size;
    int j = i / 2;
    for (int k = 0; k < j; k++) {
      int m = i - 1 - k;
      Object[] arrayOfObject1 = this.keys;
      Object object2 = arrayOfObject1[k];
      arrayOfObject1[k] = arrayOfObject1[m];
      arrayOfObject1[m] = object2;
      Object[] arrayOfObject2 = this.values;
      Object object1 = arrayOfObject2[k];
      arrayOfObject2[k] = arrayOfObject2[m];
      arrayOfObject2[m] = object1;
    } 
  }
  
  public void setKey(int paramInt, K paramK) {
    if (paramInt < this.size) {
      this.keys[paramInt] = paramK;
      return;
    } 
    throw new IndexOutOfBoundsException(String.valueOf(paramInt));
  }
  
  public void setValue(int paramInt, V paramV) {
    if (paramInt < this.size) {
      this.values[paramInt] = paramV;
      return;
    } 
    throw new IndexOutOfBoundsException(String.valueOf(paramInt));
  }
  
  public void shrink() {
    int i = this.keys.length;
    int j = this.size;
    if (i == j)
      return; 
    resize(j);
  }
  
  public void shuffle() {
    for (int i = this.size - 1; i >= 0; i--) {
      int j = MathUtils.random(i);
      Object[] arrayOfObject1 = this.keys;
      Object object2 = arrayOfObject1[i];
      arrayOfObject1[i] = arrayOfObject1[j];
      arrayOfObject1[j] = object2;
      Object[] arrayOfObject2 = this.values;
      Object object1 = arrayOfObject2[i];
      arrayOfObject2[i] = arrayOfObject2[j];
      arrayOfObject2[j] = object1;
    } 
  }
  
  public String toString() {
    if (this.size == 0)
      return "{}"; 
    Object[] arrayOfObject1 = this.keys;
    Object[] arrayOfObject2 = this.values;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('{');
    stringBuilder.append(arrayOfObject1[0]);
    stringBuilder.append('=');
    stringBuilder.append(arrayOfObject2[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfObject1[b]);
      stringBuilder.append('=');
      stringBuilder.append(arrayOfObject2[b]);
    } 
    stringBuilder.append('}');
    return stringBuilder.toString();
  }
  
  public void truncate(int paramInt) {
    if (this.size <= paramInt)
      return; 
    for (int i = paramInt; i < this.size; i++) {
      this.keys[i] = null;
      this.values[i] = null;
    } 
    this.size = paramInt;
  }
  
  public Values<V> values() {
    if (Collections.allocateIterators)
      return new Values(this); 
    if (this.values1 == null) {
      this.values1 = new Values(this);
      this.values2 = new Values(this);
    } 
    if (!this.values1.valid) {
      Values values4 = this.values1;
      values4.index = 0;
      values4.valid = true;
      this.values2.valid = false;
      return values4;
    } 
    Values values3 = this.values2;
    values3.index = 0;
    values3.valid = true;
    this.values1.valid = false;
    return values3;
  }
  
  public static class Entries<K, V> extends Object implements Iterable<ObjectMap.Entry<K, V>>, Iterator<ObjectMap.Entry<K, V>> {
    ObjectMap.Entry<K, V> entry = new ObjectMap.Entry();
    
    int index;
    
    private final ArrayMap<K, V> map;
    
    boolean valid = true;
    
    public Entries(ArrayMap<K, V> param1ArrayMap) { this.map = param1ArrayMap; }
    
    public boolean hasNext() {
      if (this.valid) {
        boolean bool;
        if (this.index < this.map.size) {
          bool = true;
        } else {
          bool = false;
        } 
        return bool;
      } 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<ObjectMap.Entry<K, V>> iterator() { return this; }
    
    public ObjectMap.Entry<K, V> next() {
      if (this.index < this.map.size) {
        if (this.valid) {
          this.entry.key = this.map.keys[this.index];
          ObjectMap.Entry entry1 = this.entry;
          Object[] arrayOfObject = this.map.values;
          int i = this.index;
          this.index = i + 1;
          entry1.value = arrayOfObject[i];
          return this.entry;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException(String.valueOf(this.index));
    }
    
    public void remove() {
      this.index--;
      this.map.removeIndex(this.index);
    }
    
    public void reset() { this.index = 0; }
  }
  
  public static class Keys<K> extends Object implements Iterable<K>, Iterator<K> {
    int index;
    
    private final ArrayMap<K, Object> map;
    
    boolean valid = true;
    
    public Keys(ArrayMap<K, Object> param1ArrayMap) { this.map = param1ArrayMap; }
    
    public boolean hasNext() {
      if (this.valid) {
        boolean bool;
        if (this.index < this.map.size) {
          bool = true;
        } else {
          bool = false;
        } 
        return bool;
      } 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<K> iterator() { return this; }
    
    public K next() {
      if (this.index < this.map.size) {
        if (this.valid) {
          Object[] arrayOfObject = this.map.keys;
          int i = this.index;
          this.index = i + 1;
          return (K)arrayOfObject[i];
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException(String.valueOf(this.index));
    }
    
    public void remove() {
      this.index--;
      this.map.removeIndex(this.index);
    }
    
    public void reset() { this.index = 0; }
    
    public Array<K> toArray() { return new Array(true, this.map.keys, this.index, this.map.size - this.index); }
    
    public Array<K> toArray(Array param1Array) {
      param1Array.addAll(this.map.keys, this.index, this.map.size - this.index);
      return param1Array;
    }
  }
  
  public static class Values<V> extends Object implements Iterable<V>, Iterator<V> {
    int index;
    
    private final ArrayMap<Object, V> map;
    
    boolean valid = true;
    
    public Values(ArrayMap<Object, V> param1ArrayMap) { this.map = param1ArrayMap; }
    
    public boolean hasNext() {
      if (this.valid) {
        boolean bool;
        if (this.index < this.map.size) {
          bool = true;
        } else {
          bool = false;
        } 
        return bool;
      } 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<V> iterator() { return this; }
    
    public V next() {
      if (this.index < this.map.size) {
        if (this.valid) {
          Object[] arrayOfObject = this.map.values;
          int i = this.index;
          this.index = i + 1;
          return (V)arrayOfObject[i];
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException(String.valueOf(this.index));
    }
    
    public void remove() {
      this.index--;
      this.map.removeIndex(this.index);
    }
    
    public void reset() { this.index = 0; }
    
    public Array<V> toArray() { return new Array(true, this.map.values, this.index, this.map.size - this.index); }
    
    public Array<V> toArray(Array param1Array) {
      param1Array.addAll(this.map.values, this.index, this.map.size - this.index);
      return param1Array;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ArrayMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */