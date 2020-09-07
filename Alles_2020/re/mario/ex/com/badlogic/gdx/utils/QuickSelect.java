package com.badlogic.gdx.utils;

import java.util.Comparator;

public class QuickSelect<T> extends Object {
  private T[] array;
  
  private Comparator<? super T> comp;
  
  private int medianOfThreePivot(int paramInt1, int paramInt2) {
    Object[] arrayOfObject = this.array;
    Object object2 = arrayOfObject[paramInt1];
    int i = (paramInt1 + paramInt2) / 2;
    Object object3 = arrayOfObject[i];
    Object object1 = arrayOfObject[paramInt2];
    return (this.comp.compare(object2, object3) > 0) ? ((this.comp.compare(object3, object1) > 0) ? i : ((this.comp.compare(object2, object1) > 0) ? paramInt2 : paramInt1)) : ((this.comp.compare(object2, object1) > 0) ? paramInt1 : ((this.comp.compare(object3, object1) > 0) ? paramInt2 : i));
  }
  
  private int partition(int paramInt1, int paramInt2, int paramInt3) {
    Object object = this.array[paramInt3];
    swap(paramInt2, paramInt3);
    int i;
    for (i = paramInt1; paramInt1 < paramInt2; i = paramInt3) {
      paramInt3 = i;
      if (this.comp.compare(this.array[paramInt1], object) < 0) {
        swap(i, paramInt1);
        paramInt3 = i + 1;
      } 
      paramInt1++;
    } 
    swap(paramInt2, i);
    return i;
  }
  
  private int recursiveSelect(int paramInt1, int paramInt2, int paramInt3) {
    if (paramInt1 == paramInt2)
      return paramInt1; 
    int i = partition(paramInt1, paramInt2, medianOfThreePivot(paramInt1, paramInt2));
    int j = i - paramInt1 + 1;
    if (j == paramInt3) {
      paramInt1 = i;
    } else if (paramInt3 < j) {
      paramInt1 = recursiveSelect(paramInt1, i - 1, paramInt3);
    } else {
      paramInt1 = recursiveSelect(i + 1, paramInt2, paramInt3 - j);
    } 
    return paramInt1;
  }
  
  private void swap(int paramInt1, int paramInt2) {
    Object[] arrayOfObject = this.array;
    Object object = arrayOfObject[paramInt1];
    arrayOfObject[paramInt1] = arrayOfObject[paramInt2];
    arrayOfObject[paramInt2] = object;
  }
  
  public int select(T[] paramArrayOfT, Comparator<T> paramComparator, int paramInt1, int paramInt2) {
    this.array = paramArrayOfT;
    this.comp = paramComparator;
    return recursiveSelect(0, paramInt2 - 1, paramInt1);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/QuickSelect.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */