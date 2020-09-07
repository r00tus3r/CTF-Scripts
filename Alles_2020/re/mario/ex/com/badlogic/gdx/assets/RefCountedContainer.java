package com.badlogic.gdx.assets;

public class RefCountedContainer {
  Object object;
  
  int refCount = 1;
  
  public RefCountedContainer(Object paramObject) {
    if (paramObject != null) {
      this.object = paramObject;
      return;
    } 
    throw new IllegalArgumentException("Object must not be null");
  }
  
  public void decRefCount() { this.refCount--; }
  
  public <T> T getObject(Class<T> paramClass) { return (T)this.object; }
  
  public int getRefCount() { return this.refCount; }
  
  public void incRefCount() { this.refCount++; }
  
  public void setObject(Object paramObject) { this.object = paramObject; }
  
  public void setRefCount(int paramInt) { this.refCount = paramInt; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/RefCountedContainer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */