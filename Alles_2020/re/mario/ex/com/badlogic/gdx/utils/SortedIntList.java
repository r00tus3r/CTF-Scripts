package com.badlogic.gdx.utils;

import java.util.Iterator;

public class SortedIntList<E> extends Object implements Iterable<SortedIntList.Node<E>> {
  Node<E> first;
  
  private Iterator iterator;
  
  private NodePool<E> nodePool = new NodePool();
  
  int size = 0;
  
  public void clear() {
    while (true) {
      Node node = this.first;
      if (node != null) {
        this.nodePool.free(node);
        this.first = this.first.n;
        continue;
      } 
      break;
    } 
    this.size = 0;
  }
  
  public E get(int paramInt) {
    null = this.first;
    if (null != null) {
      while (null.n != null && null.index < paramInt)
        null = null.n; 
      if (null.index == paramInt)
        return (E)null.value; 
    } 
    return null;
  }
  
  public E insert(int paramInt, E paramE) {
    Node node = this.first;
    if (node != null) {
      while (node.n != null && node.n.index <= paramInt)
        node = node.n; 
      if (paramInt > node.index) {
        node.n = this.nodePool.obtain(node, node.n, paramE, paramInt);
        if (node.n.n != null)
          node.n.n.p = node.n; 
        this.size++;
      } else if (paramInt < node.index) {
        paramE = (E)this.nodePool.obtain(null, this.first, paramE, paramInt);
        this.first.p = paramE;
        this.first = paramE;
        this.size++;
      } else {
        node.value = paramE;
      } 
    } else {
      this.first = this.nodePool.obtain(null, null, paramE, paramInt);
      this.size++;
    } 
    return null;
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
  
  public Iterator<Node<E>> iterator() {
    if (this.iterator == null)
      this.iterator = new Iterator(); 
    return this.iterator.reset();
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
  
  public int size() { return this.size; }
  
  class Iterator extends Object implements Iterator<Node<E>> {
    private SortedIntList.Node<E> position;
    
    private SortedIntList.Node<E> previousPosition;
    
    public boolean hasNext() {
      boolean bool;
      if (this.position != null) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public SortedIntList.Node<E> next() {
      SortedIntList.Node node = this.position;
      this.previousPosition = node;
      this.position = node.n;
      return this.previousPosition;
    }
    
    public void remove() {
      SortedIntList.Node node = this.previousPosition;
      if (node != null) {
        if (node == SortedIntList.this.first) {
          SortedIntList.this.first = this.position;
        } else {
          node = this.previousPosition.p;
          SortedIntList.Node node1 = this.position;
          node.n = node1;
          if (node1 != null)
            node1.p = this.previousPosition.p; 
        } 
        SortedIntList sortedIntList = SortedIntList.this;
        sortedIntList.size--;
      } 
    }
    
    public Iterator reset() {
      this.position = SortedIntList.this.first;
      this.previousPosition = null;
      return this;
    }
  }
  
  public static class Node<E> extends Object {
    public int index;
    
    protected Node<E> n;
    
    protected Node<E> p;
    
    public E value;
  }
  
  static class NodePool<E> extends Pool<Node<E>> {
    protected SortedIntList.Node<E> newObject() { return new SortedIntList.Node(); }
    
    public SortedIntList.Node<E> obtain(SortedIntList.Node<E> param1Node1, SortedIntList.Node<E> param1Node2, E param1E, int param1Int) {
      SortedIntList.Node node = (SortedIntList.Node)obtain();
      node.p = param1Node1;
      node.n = param1Node2;
      node.value = param1E;
      node.index = param1Int;
      return node;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/SortedIntList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */