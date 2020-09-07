package com.badlogic.gdx.utils;

import java.util.Comparator;

public class DelayedRemovalArray<T> extends Array<T> {
  private int clear;
  
  private int iterating;
  
  private IntArray remove = new IntArray(false);
  
  public DelayedRemovalArray() {}
  
  public DelayedRemovalArray(int paramInt) { super(paramInt); }
  
  public DelayedRemovalArray(Array paramArray) { super(paramArray); }
  
  public DelayedRemovalArray(Class paramClass) { super(paramClass); }
  
  public DelayedRemovalArray(boolean paramBoolean, int paramInt) { super(paramBoolean, paramInt); }
  
  public DelayedRemovalArray(boolean paramBoolean, int paramInt, Class paramClass) { super(paramBoolean, paramInt, paramClass); }
  
  public DelayedRemovalArray(boolean paramBoolean, T[] paramArrayOfT, int paramInt1, int paramInt2) { super(paramBoolean, paramArrayOfT, paramInt1, paramInt2); }
  
  public DelayedRemovalArray(T[] paramArrayOfT) { super(paramArrayOfT); }
  
  private void remove(int paramInt) {
    if (paramInt < this.clear)
      return; 
    byte b = 0;
    int i = this.remove.size;
    while (b < i) {
      int j = this.remove.get(b);
      if (paramInt == j)
        return; 
      if (paramInt < j) {
        this.remove.insert(b, paramInt);
        return;
      } 
      b++;
    } 
    this.remove.add(paramInt);
  }
  
  public static <T> DelayedRemovalArray<T> with(T... paramVarArgs) { return new DelayedRemovalArray(paramVarArgs); }
  
  public void begin() { this.iterating++; }
  
  public void clear() {
    if (this.iterating > 0) {
      this.clear = this.size;
      return;
    } 
    super.clear();
  }
  
  public void end() {
    int i = this.iterating;
    if (i != 0) {
      this.iterating = i - 1;
      if (this.iterating == 0) {
        i = this.clear;
        if (i > 0 && i == this.size) {
          this.remove.clear();
          clear();
        } else {
          int j = this.remove.size;
          for (i = 0; i < j; i++) {
            int k = this.remove.pop();
            if (k >= this.clear)
              removeIndex(k); 
          } 
          for (i = this.clear - 1; i >= 0; i--)
            removeIndex(i); 
        } 
        this.clear = 0;
      } 
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("begin must be called before end.");
    throw illegalStateException;
  }
  
  public void insert(int paramInt, T paramT) {
    if (this.iterating <= 0) {
      super.insert(paramInt, paramT);
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public T pop() {
    if (this.iterating <= 0)
      return (T)super.pop(); 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public T removeIndex(int paramInt) {
    if (this.iterating > 0) {
      remove(paramInt);
      return (T)get(paramInt);
    } 
    return (T)super.removeIndex(paramInt);
  }
  
  public void removeRange(int paramInt1, int paramInt2) {
    if (this.iterating > 0) {
      while (paramInt2 >= paramInt1) {
        remove(paramInt2);
        paramInt2--;
      } 
    } else {
      super.removeRange(paramInt1, paramInt2);
    } 
  }
  
  public boolean removeValue(T paramT, boolean paramBoolean) {
    if (this.iterating > 0) {
      int i = indexOf(paramT, paramBoolean);
      if (i == -1)
        return false; 
      remove(i);
      return true;
    } 
    return super.removeValue(paramT, paramBoolean);
  }
  
  public void reverse() {
    if (this.iterating <= 0) {
      super.reverse();
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public void set(int paramInt, T paramT) {
    if (this.iterating <= 0) {
      super.set(paramInt, paramT);
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public T[] setSize(int paramInt) {
    if (this.iterating <= 0)
      return (T[])super.setSize(paramInt); 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public void shuffle() {
    if (this.iterating <= 0) {
      super.shuffle();
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public void sort() {
    if (this.iterating <= 0) {
      super.sort();
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public void sort(Comparator<? super T> paramComparator) {
    if (this.iterating <= 0) {
      super.sort(paramComparator);
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public void swap(int paramInt1, int paramInt2) {
    if (this.iterating <= 0) {
      super.swap(paramInt1, paramInt2);
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
  
  public void truncate(int paramInt) {
    if (this.iterating <= 0) {
      super.truncate(paramInt);
      return;
    } 
    throw new IllegalStateException("Invalid between begin/end.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/DelayedRemovalArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */