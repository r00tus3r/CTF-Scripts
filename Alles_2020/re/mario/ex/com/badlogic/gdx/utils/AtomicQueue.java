package com.badlogic.gdx.utils;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReferenceArray;

public class AtomicQueue<T> extends Object {
  private final AtomicReferenceArray<T> queue;
  
  private final AtomicInteger readIndex = new AtomicInteger();
  
  private final AtomicInteger writeIndex = new AtomicInteger();
  
  public AtomicQueue(int paramInt) { this.queue = new AtomicReferenceArray(paramInt); }
  
  private int next(int paramInt) { return (paramInt + 1) % this.queue.length(); }
  
  public T poll() {
    int i = this.readIndex.get();
    if (i == this.writeIndex.get())
      return null; 
    Object object = this.queue.get(i);
    this.readIndex.set(next(i));
    return (T)object;
  }
  
  public boolean put(T paramT) {
    int i = this.writeIndex.get();
    int j = this.readIndex.get();
    int k = next(i);
    if (k == j)
      return false; 
    this.queue.set(i, paramT);
    this.writeIndex.set(k);
    return true;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/AtomicQueue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */