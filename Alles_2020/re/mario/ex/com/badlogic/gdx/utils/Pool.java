package com.badlogic.gdx.utils;

public abstract class Pool<T> extends Object {
  private final Array<T> freeObjects;
  
  public final int max;
  
  public int peak;
  
  public Pool() { this(16, 2147483647); }
  
  public Pool(int paramInt) { this(paramInt, 2147483647); }
  
  public Pool(int paramInt1, int paramInt2) {
    this.freeObjects = new Array(false, paramInt1);
    this.max = paramInt2;
  }
  
  public void clear() { this.freeObjects.clear(); }
  
  public void free(T paramT) {
    if (paramT != null) {
      if (this.freeObjects.size < this.max) {
        this.freeObjects.add(paramT);
        this.peak = Math.max(this.peak, this.freeObjects.size);
      } 
      reset(paramT);
      return;
    } 
    throw new IllegalArgumentException("object cannot be null.");
  }
  
  public void freeAll(Array<T> paramArray) {
    if (paramArray != null) {
      Array array = this.freeObjects;
      int i = this.max;
      for (byte b = 0; b < paramArray.size; b++) {
        Object object = paramArray.get(b);
        if (object != null) {
          if (array.size < i)
            array.add(object); 
          reset(object);
        } 
      } 
      this.peak = Math.max(this.peak, array.size);
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("objects cannot be null.");
    throw illegalArgumentException;
  }
  
  public int getFree() { return this.freeObjects.size; }
  
  protected abstract T newObject();
  
  public T obtain() {
    Object object;
    if (this.freeObjects.size == 0) {
      object = newObject();
    } else {
      object = this.freeObjects.pop();
    } 
    return (T)object;
  }
  
  protected void reset(T paramT) {
    if (paramT instanceof Poolable)
      ((Poolable)paramT).reset(); 
  }
  
  public static interface Poolable {
    void reset();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Pool.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */