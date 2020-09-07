package com.badlogic.gdx.utils;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class OrderedMap<K, V> extends ObjectMap<K, V> {
  final Array<K> keys = new Array();
  
  public OrderedMap() {}
  
  public OrderedMap(int paramInt) { super(paramInt); }
  
  public OrderedMap(int paramInt, float paramFloat) { super(paramInt, paramFloat); }
  
  public OrderedMap(OrderedMap<? extends K, ? extends V> paramOrderedMap) { super(paramOrderedMap); }
  
  public void clear() {
    this.keys.clear();
    super.clear();
  }
  
  public void clear(int paramInt) {
    this.keys.clear();
    super.clear(paramInt);
  }
  
  public ObjectMap.Entries<K, V> entries() {
    if (Collections.allocateIterators)
      return new ObjectMap.Entries(this); 
    if (this.entries1 == null) {
      this.entries1 = new OrderedMapEntries(this);
      this.entries2 = new OrderedMapEntries(this);
    } 
    if (!this.entries1.valid) {
      this.entries1.reset();
      this.entries1.valid = true;
      this.entries2.valid = false;
      return this.entries1;
    } 
    this.entries2.reset();
    this.entries2.valid = true;
    this.entries1.valid = false;
    return this.entries2;
  }
  
  public ObjectMap.Entries<K, V> iterator() { return entries(); }
  
  public ObjectMap.Keys<K> keys() {
    if (Collections.allocateIterators)
      return new ObjectMap.Keys(this); 
    if (this.keys1 == null) {
      this.keys1 = new OrderedMapKeys(this);
      this.keys2 = new OrderedMapKeys(this);
    } 
    if (!this.keys1.valid) {
      this.keys1.reset();
      this.keys1.valid = true;
      this.keys2.valid = false;
      return this.keys1;
    } 
    this.keys2.reset();
    this.keys2.valid = true;
    this.keys1.valid = false;
    return this.keys2;
  }
  
  public Array<K> orderedKeys() { return this.keys; }
  
  public V put(K paramK, V paramV) {
    if (!containsKey(paramK))
      this.keys.add(paramK); 
    return (V)super.put(paramK, paramV);
  }
  
  public V remove(K paramK) {
    this.keys.removeValue(paramK, false);
    return (V)super.remove(paramK);
  }
  
  public V removeIndex(int paramInt) { return (V)super.remove(this.keys.removeIndex(paramInt)); }
  
  public String toString() {
    if (this.size == 0)
      return "{}"; 
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('{');
    Array array = this.keys;
    byte b = 0;
    int i = array.size;
    while (b < i) {
      Object object = array.get(b);
      if (b > 0)
        stringBuilder.append(", "); 
      stringBuilder.append(object);
      stringBuilder.append('=');
      stringBuilder.append(get(object));
      b++;
    } 
    stringBuilder.append('}');
    return stringBuilder.toString();
  }
  
  public ObjectMap.Values<V> values() {
    if (Collections.allocateIterators)
      return new ObjectMap.Values(this); 
    if (this.values1 == null) {
      this.values1 = new OrderedMapValues(this);
      this.values2 = new OrderedMapValues(this);
    } 
    if (!this.values1.valid) {
      this.values1.reset();
      this.values1.valid = true;
      this.values2.valid = false;
      return this.values1;
    } 
    this.values2.reset();
    this.values2.valid = true;
    this.values1.valid = false;
    return this.values2;
  }
  
  public static class OrderedMapEntries<K, V> extends ObjectMap.Entries<K, V> {
    private Array<K> keys;
    
    public OrderedMapEntries(OrderedMap<K, V> param1OrderedMap) {
      super(param1OrderedMap);
      this.keys = param1OrderedMap.keys;
    }
    
    public ObjectMap.Entry next() {
      if (this.hasNext) {
        if (this.valid) {
          this.entry.key = this.keys.get(this.nextIndex);
          this.entry.value = this.map.get(this.entry.key);
          int i = this.nextIndex;
          boolean bool = true;
          this.nextIndex = i + 1;
          if (this.nextIndex >= this.map.size)
            bool = false; 
          this.hasNext = bool;
          return this.entry;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      if (this.currentIndex >= 0) {
        this.map.remove(this.entry.key);
        this.nextIndex--;
        return;
      } 
      throw new IllegalStateException("next must be called before remove.");
    }
    
    public void reset() {
      boolean bool = false;
      this.nextIndex = 0;
      if (this.map.size > 0)
        bool = true; 
      this.hasNext = bool;
    }
  }
  
  public static class OrderedMapKeys<K> extends ObjectMap.Keys<K> {
    private Array<K> keys;
    
    public OrderedMapKeys(OrderedMap<K, ?> param1OrderedMap) {
      super(param1OrderedMap);
      this.keys = param1OrderedMap.keys;
    }
    
    public K next() {
      if (this.hasNext) {
        if (this.valid) {
          Object object = this.keys.get(this.nextIndex);
          this.currentIndex = this.nextIndex;
          int i = this.nextIndex;
          boolean bool = true;
          this.nextIndex = i + 1;
          if (this.nextIndex >= this.map.size)
            bool = false; 
          this.hasNext = bool;
          return (K)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      if (this.currentIndex >= 0) {
        ((OrderedMap)this.map).removeIndex(this.nextIndex - 1);
        this.nextIndex = this.currentIndex;
        this.currentIndex = -1;
        return;
      } 
      throw new IllegalStateException("next must be called before remove.");
    }
    
    public void reset() {
      boolean bool = false;
      this.nextIndex = 0;
      if (this.map.size > 0)
        bool = true; 
      this.hasNext = bool;
    }
  }
  
  public static class OrderedMapValues<V> extends ObjectMap.Values<V> {
    private Array keys;
    
    public OrderedMapValues(OrderedMap<?, V> param1OrderedMap) {
      super(param1OrderedMap);
      this.keys = param1OrderedMap.keys;
    }
    
    public V next() {
      if (this.hasNext) {
        if (this.valid) {
          Object object = this.map.get(this.keys.get(this.nextIndex));
          this.currentIndex = this.nextIndex;
          int i = this.nextIndex;
          boolean bool = true;
          this.nextIndex = i + 1;
          if (this.nextIndex >= this.map.size)
            bool = false; 
          this.hasNext = bool;
          return (V)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      if (this.currentIndex >= 0) {
        ((OrderedMap)this.map).removeIndex(this.currentIndex);
        this.nextIndex = this.currentIndex;
        this.currentIndex = -1;
        return;
      } 
      throw new IllegalStateException("next must be called before remove.");
    }
    
    public void reset() {
      boolean bool = false;
      this.nextIndex = 0;
      if (this.map.size > 0)
        bool = true; 
      this.hasNext = bool;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/OrderedMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */