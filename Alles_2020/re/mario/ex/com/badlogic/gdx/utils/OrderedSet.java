package com.badlogic.gdx.utils;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class OrderedSet<T> extends ObjectSet<T> {
  final Array<T> items = new Array();
  
  OrderedSetIterator iterator1;
  
  OrderedSetIterator iterator2;
  
  public OrderedSet() {}
  
  public OrderedSet(int paramInt) { super(paramInt); }
  
  public OrderedSet(int paramInt, float paramFloat) { super(paramInt, paramFloat); }
  
  public OrderedSet(OrderedSet<? extends T> paramOrderedSet) {
    super(paramOrderedSet);
    this.items.addAll(paramOrderedSet.items);
  }
  
  public boolean add(T paramT) {
    if (!super.add(paramT))
      return false; 
    this.items.add(paramT);
    return true;
  }
  
  public boolean add(T paramT, int paramInt) {
    if (!super.add(paramT)) {
      this.items.removeValue(paramT, true);
      this.items.insert(paramInt, paramT);
      return false;
    } 
    this.items.insert(paramInt, paramT);
    return true;
  }
  
  public void clear() {
    this.items.clear();
    super.clear();
  }
  
  public void clear(int paramInt) {
    this.items.clear();
    super.clear(paramInt);
  }
  
  public OrderedSetIterator<T> iterator() {
    if (Collections.allocateIterators)
      return new OrderedSetIterator(this); 
    if (this.iterator1 == null) {
      this.iterator1 = new OrderedSetIterator(this);
      this.iterator2 = new OrderedSetIterator(this);
    } 
    if (!this.iterator1.valid) {
      this.iterator1.reset();
      OrderedSetIterator orderedSetIterator1 = this.iterator1;
      orderedSetIterator1.valid = true;
      this.iterator2.valid = false;
      return orderedSetIterator1;
    } 
    this.iterator2.reset();
    OrderedSetIterator orderedSetIterator = this.iterator2;
    orderedSetIterator.valid = true;
    this.iterator1.valid = false;
    return orderedSetIterator;
  }
  
  public Array<T> orderedItems() { return this.items; }
  
  public boolean remove(T paramT) {
    if (!super.remove(paramT))
      return false; 
    this.items.removeValue(paramT, false);
    return true;
  }
  
  public T removeIndex(int paramInt) {
    Object object = this.items.removeIndex(paramInt);
    super.remove(object);
    return (T)object;
  }
  
  public String toString() {
    if (this.size == 0)
      return "{}"; 
    Object[] arrayOfObject = this.items.items;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('{');
    stringBuilder.append(arrayOfObject[0]);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append(arrayOfObject[b]);
    } 
    stringBuilder.append('}');
    return stringBuilder.toString();
  }
  
  public String toString(String paramString) { return this.items.toString(paramString); }
  
  public static class OrderedSetIterator<T> extends ObjectSet.ObjectSetIterator<T> {
    private Array<T> items;
    
    public OrderedSetIterator(OrderedSet<T> param1OrderedSet) {
      super(param1OrderedSet);
      this.items = param1OrderedSet.items;
    }
    
    public T next() {
      if (this.hasNext) {
        if (this.valid) {
          Object object = this.items.get(this.nextIndex);
          int i = this.nextIndex;
          boolean bool = true;
          this.nextIndex = i + 1;
          if (this.nextIndex >= this.set.size)
            bool = false; 
          this.hasNext = bool;
          return (T)object;
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      if (this.nextIndex >= 0) {
        this.nextIndex--;
        ((OrderedSet)this.set).removeIndex(this.nextIndex);
        return;
      } 
      throw new IllegalStateException("next must be called before remove.");
    }
    
    public void reset() {
      boolean bool = false;
      this.nextIndex = 0;
      if (this.set.size > 0)
        bool = true; 
      this.hasNext = bool;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/OrderedSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */