package com.badlogic.gdx.utils;

import java.util.Comparator;

public class Sort {
  private static Sort instance;
  
  private ComparableTimSort comparableTimSort;
  
  private TimSort timSort;
  
  public static Sort instance() {
    if (instance == null)
      instance = new Sort(); 
    return instance;
  }
  
  public <T extends Comparable> void sort(Array<T> paramArray) {
    if (this.comparableTimSort == null)
      this.comparableTimSort = new ComparableTimSort(); 
    this.comparableTimSort.doSort((Object[])paramArray.items, 0, paramArray.size);
  }
  
  public <T> void sort(Array<T> paramArray, Comparator<? super T> paramComparator) {
    if (this.timSort == null)
      this.timSort = new TimSort(); 
    this.timSort.doSort((Object[])paramArray.items, paramComparator, 0, paramArray.size);
  }
  
  public void sort(Object[] paramArrayOfObject) {
    if (this.comparableTimSort == null)
      this.comparableTimSort = new ComparableTimSort(); 
    this.comparableTimSort.doSort(paramArrayOfObject, 0, paramArrayOfObject.length);
  }
  
  public void sort(Object[] paramArrayOfObject, int paramInt1, int paramInt2) {
    if (this.comparableTimSort == null)
      this.comparableTimSort = new ComparableTimSort(); 
    this.comparableTimSort.doSort(paramArrayOfObject, paramInt1, paramInt2);
  }
  
  public <T> void sort(T[] paramArrayOfT, Comparator<? super T> paramComparator) {
    if (this.timSort == null)
      this.timSort = new TimSort(); 
    this.timSort.doSort(paramArrayOfT, paramComparator, 0, paramArrayOfT.length);
  }
  
  public <T> void sort(T[] paramArrayOfT, Comparator<? super T> paramComparator, int paramInt1, int paramInt2) {
    if (this.timSort == null)
      this.timSort = new TimSort(); 
    this.timSort.doSort(paramArrayOfT, paramComparator, paramInt1, paramInt2);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Sort.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */