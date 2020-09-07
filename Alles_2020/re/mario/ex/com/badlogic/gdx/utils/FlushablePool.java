package com.badlogic.gdx.utils;

public abstract class FlushablePool<T> extends Pool<T> {
  protected Array<T> obtained = new Array();
  
  public FlushablePool() {}
  
  public FlushablePool(int paramInt) { super(paramInt); }
  
  public FlushablePool(int paramInt1, int paramInt2) { super(paramInt1, paramInt2); }
  
  public void flush() {
    super.freeAll(this.obtained);
    this.obtained.clear();
  }
  
  public void free(T paramT) {
    this.obtained.removeValue(paramT, true);
    super.free(paramT);
  }
  
  public void freeAll(Array<T> paramArray) {
    this.obtained.removeAll(paramArray, true);
    super.freeAll(paramArray);
  }
  
  public T obtain() {
    Object object = super.obtain();
    this.obtained.add(object);
    return (T)object;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/FlushablePool.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */