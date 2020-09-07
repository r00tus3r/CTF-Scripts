package com.badlogic.gdx.utils;

import java.util.Iterator;

public interface Predicate<T> {
  boolean evaluate(T paramT);
  
  public static class PredicateIterable<T> extends Object implements Iterable<T> {
    public Iterable<T> iterable;
    
    public Predicate.PredicateIterator<T> iterator = null;
    
    public Predicate<T> predicate;
    
    public PredicateIterable(Iterable<T> param1Iterable, Predicate<T> param1Predicate) { set(param1Iterable, param1Predicate); }
    
    public Iterator<T> iterator() {
      if (Collections.allocateIterators)
        return new Predicate.PredicateIterator(this.iterable.iterator(), this.predicate); 
      Predicate.PredicateIterator predicateIterator = this.iterator;
      if (predicateIterator == null) {
        this.iterator = new Predicate.PredicateIterator(this.iterable.iterator(), this.predicate);
      } else {
        predicateIterator.set(this.iterable.iterator(), this.predicate);
      } 
      return this.iterator;
    }
    
    public void set(Iterable<T> param1Iterable, Predicate<T> param1Predicate) {
      this.iterable = param1Iterable;
      this.predicate = param1Predicate;
    }
  }
  
  public static class PredicateIterator<T> extends Object implements Iterator<T> {
    public boolean end = false;
    
    public Iterator<T> iterator;
    
    public T next = null;
    
    public boolean peeked = false;
    
    public Predicate<T> predicate;
    
    public PredicateIterator(Iterable<T> param1Iterable, Predicate<T> param1Predicate) { this(param1Iterable.iterator(), param1Predicate); }
    
    public PredicateIterator(Iterator<T> param1Iterator, Predicate<T> param1Predicate) { set(param1Iterator, param1Predicate); }
    
    public boolean hasNext() {
      if (this.end)
        return false; 
      if (this.next != null)
        return true; 
      this.peeked = true;
      while (this.iterator.hasNext()) {
        Object object = this.iterator.next();
        if (this.predicate.evaluate(object)) {
          this.next = object;
          return true;
        } 
      } 
      this.end = true;
      return false;
    }
    
    public T next() {
      if (this.next == null && !hasNext())
        return null; 
      Object object = this.next;
      this.next = null;
      this.peeked = false;
      return (T)object;
    }
    
    public void remove() {
      if (!this.peeked) {
        this.iterator.remove();
        return;
      } 
      throw new GdxRuntimeException("Cannot remove between a call to hasNext() and next().");
    }
    
    public void set(Iterable<T> param1Iterable, Predicate<T> param1Predicate) { set(param1Iterable.iterator(), param1Predicate); }
    
    public void set(Iterator<T> param1Iterator, Predicate<T> param1Predicate) {
      this.iterator = param1Iterator;
      this.predicate = param1Predicate;
      this.peeked = false;
      this.end = false;
      this.next = null;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Predicate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */