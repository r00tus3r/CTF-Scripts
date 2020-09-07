package com.badlogic.gdx.utils;

import java.util.Comparator;

public class SnapshotArray<T> extends Array<T> {
  private T[] recycled;
  
  private T[] snapshot;
  
  private int snapshots;
  
  public SnapshotArray() {}
  
  public SnapshotArray(int paramInt) { super(paramInt); }
  
  public SnapshotArray(Array paramArray) { super(paramArray); }
  
  public SnapshotArray(Class paramClass) { super(paramClass); }
  
  public SnapshotArray(boolean paramBoolean, int paramInt) { super(paramBoolean, paramInt); }
  
  public SnapshotArray(boolean paramBoolean, int paramInt, Class paramClass) { super(paramBoolean, paramInt, paramClass); }
  
  public SnapshotArray(boolean paramBoolean, T[] paramArrayOfT, int paramInt1, int paramInt2) { super(paramBoolean, paramArrayOfT, paramInt1, paramInt2); }
  
  public SnapshotArray(T[] paramArrayOfT) { super(paramArrayOfT); }
  
  private void modified() {
    Object[] arrayOfObject = this.snapshot;
    if (arrayOfObject != null && arrayOfObject == this.items) {
      arrayOfObject = this.recycled;
      if (arrayOfObject != null && arrayOfObject.length >= this.size) {
        System.arraycopy(this.items, 0, this.recycled, 0, this.size);
        this.items = this.recycled;
        this.recycled = null;
      } else {
        resize(this.items.length);
      } 
    } 
  }
  
  public static <T> SnapshotArray<T> with(T... paramVarArgs) { return new SnapshotArray(paramVarArgs); }
  
  public T[] begin() {
    modified();
    this.snapshot = this.items;
    this.snapshots++;
    return (T[])this.items;
  }
  
  public void clear() {
    modified();
    super.clear();
  }
  
  public void end() {
    int i = this.snapshots;
    byte b = 0;
    this.snapshots = Math.max(0, i - 1);
    Object[] arrayOfObject = this.snapshot;
    if (arrayOfObject == null)
      return; 
    if (arrayOfObject != this.items && this.snapshots == 0) {
      this.recycled = this.snapshot;
      i = this.recycled.length;
      while (b < i) {
        this.recycled[b] = null;
        b++;
      } 
    } 
    this.snapshot = null;
  }
  
  public void insert(int paramInt, T paramT) {
    modified();
    super.insert(paramInt, paramT);
  }
  
  public T pop() {
    modified();
    return (T)super.pop();
  }
  
  public boolean removeAll(Array<? extends T> paramArray, boolean paramBoolean) {
    modified();
    return super.removeAll(paramArray, paramBoolean);
  }
  
  public T removeIndex(int paramInt) {
    modified();
    return (T)super.removeIndex(paramInt);
  }
  
  public void removeRange(int paramInt1, int paramInt2) {
    modified();
    super.removeRange(paramInt1, paramInt2);
  }
  
  public boolean removeValue(T paramT, boolean paramBoolean) {
    modified();
    return super.removeValue(paramT, paramBoolean);
  }
  
  public void reverse() {
    modified();
    super.reverse();
  }
  
  public void set(int paramInt, T paramT) {
    modified();
    super.set(paramInt, paramT);
  }
  
  public T[] setSize(int paramInt) {
    modified();
    return (T[])super.setSize(paramInt);
  }
  
  public void shuffle() {
    modified();
    super.shuffle();
  }
  
  public void sort() {
    modified();
    super.sort();
  }
  
  public void sort(Comparator<? super T> paramComparator) {
    modified();
    super.sort(paramComparator);
  }
  
  public void swap(int paramInt1, int paramInt2) {
    modified();
    super.swap(paramInt1, paramInt2);
  }
  
  public void truncate(int paramInt) {
    modified();
    super.truncate(paramInt);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/SnapshotArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */