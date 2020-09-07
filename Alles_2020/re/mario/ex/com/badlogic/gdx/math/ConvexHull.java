package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.ShortArray;

public class ConvexHull {
  private final FloatArray hull = new FloatArray();
  
  private final IntArray indices = new IntArray();
  
  private final ShortArray originalIndices = new ShortArray(false, false);
  
  private final IntArray quicksortStack = new IntArray();
  
  private float[] sortedPoints;
  
  private float ccw(float paramFloat1, float paramFloat2) {
    FloatArray floatArray = this.hull;
    int i = floatArray.size;
    float f1 = floatArray.get(i - 4);
    float f2 = floatArray.get(i - 3);
    return (floatArray.get(i - 2) - f1) * (paramFloat2 - f2) - (floatArray.peek() - f2) * (paramFloat1 - f1);
  }
  
  private int quicksortPartition(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    float f1 = paramArrayOfFloat[paramInt1];
    int i = paramInt1 + 1;
    float f2 = paramArrayOfFloat[i];
    int j = paramInt1;
    int k = paramInt2;
    label25: while (j < k) {
      int m;
      paramInt2 = j;
      while (true) {
        m = k;
        if (paramInt2 < k) {
          m = k;
          if (paramArrayOfFloat[paramInt2] <= f1) {
            paramInt2 += 2;
            continue;
          } 
        } 
        break;
      } 
      while (true) {
        if (paramArrayOfFloat[m] > f1 || (paramArrayOfFloat[m] == f1 && paramArrayOfFloat[m + 1] < f2)) {
          m -= 2;
          continue;
        } 
        k = m;
        j = paramInt2;
        if (paramInt2 < m) {
          float f = paramArrayOfFloat[paramInt2];
          paramArrayOfFloat[paramInt2] = paramArrayOfFloat[m];
          paramArrayOfFloat[m] = f;
          k = paramInt2 + 1;
          f = paramArrayOfFloat[k];
          j = m + 1;
          paramArrayOfFloat[k] = paramArrayOfFloat[j];
          paramArrayOfFloat[j] = f;
          k = m;
          j = paramInt2;
          continue label25;
        } 
        continue label25;
      } 
    } 
    paramArrayOfFloat[paramInt1] = paramArrayOfFloat[k];
    paramArrayOfFloat[k] = f1;
    paramInt1 = k + 1;
    paramArrayOfFloat[i] = paramArrayOfFloat[paramInt1];
    paramArrayOfFloat[paramInt1] = f2;
    return k;
  }
  
  private int quicksortPartitionWithIndices(float[] paramArrayOfFloat, int paramInt1, int paramInt2, boolean paramBoolean, short[] paramArrayOfShort) {
    float f1 = paramArrayOfFloat[paramInt1];
    int i = paramInt1 + 1;
    float f2 = paramArrayOfFloat[i];
    int j = paramInt1;
    label35: while (j < paramInt2) {
      int m;
      for (m = j; m < paramInt2 && paramArrayOfFloat[m] <= f1; m += 2);
      j = paramInt2;
      if (paramBoolean) {
        while (true) {
          if (paramArrayOfFloat[paramInt2] <= f1) {
            int n = paramInt2;
            if (paramArrayOfFloat[paramInt2] == f1) {
              n = paramInt2;
              if (paramArrayOfFloat[paramInt2 + 1] < f2)
                continue; 
            } 
            break;
          } 
          continue;
          paramInt2 -= 2;
        } 
        continue;
      } 
      while (true) {
        if (paramArrayOfFloat[j] <= f1) {
          int n = j;
          if (paramArrayOfFloat[j] == f1) {
            n = j;
            if (paramArrayOfFloat[j + 1] > f2)
              continue; 
          } 
          paramInt2 = n;
          j = m;
          if (m < n) {
            float f = paramArrayOfFloat[m];
            paramArrayOfFloat[m] = paramArrayOfFloat[n];
            paramArrayOfFloat[n] = f;
            j = m + 1;
            f = paramArrayOfFloat[j];
            paramInt2 = n + 1;
            paramArrayOfFloat[j] = paramArrayOfFloat[paramInt2];
            paramArrayOfFloat[paramInt2] = f;
            j = m / 2;
            paramInt2 = paramArrayOfShort[j];
            int i1 = n / 2;
            paramArrayOfShort[j] = (short)paramArrayOfShort[i1];
            paramArrayOfShort[i1] = (short)paramInt2;
            paramInt2 = n;
            j = m;
            continue label35;
          } 
          continue label35;
        } 
        continue;
        j -= 2;
      } 
    } 
    paramArrayOfFloat[paramInt1] = paramArrayOfFloat[paramInt2];
    paramArrayOfFloat[paramInt2] = f1;
    int k = paramInt2 + 1;
    paramArrayOfFloat[i] = paramArrayOfFloat[k];
    paramArrayOfFloat[k] = f2;
    paramInt1 /= 2;
    j = paramArrayOfShort[paramInt1];
    k = paramInt2 / 2;
    paramArrayOfShort[paramInt1] = (short)paramArrayOfShort[k];
    paramArrayOfShort[k] = (short)j;
    return paramInt2;
  }
  
  private void sort(float[] paramArrayOfFloat, int paramInt) {
    IntArray intArray = this.quicksortStack;
    intArray.add(0);
    intArray.add(paramInt - 1 - 1);
    while (intArray.size > 0) {
      int i = intArray.pop();
      int j = intArray.pop();
      if (i <= j)
        continue; 
      paramInt = quicksortPartition(paramArrayOfFloat, j, i);
      int k = paramInt - j;
      int m = i - paramInt;
      if (k > m) {
        intArray.add(j);
        intArray.add(paramInt - 2);
      } 
      intArray.add(paramInt + 2);
      intArray.add(i);
      if (m >= k) {
        intArray.add(j);
        intArray.add(paramInt - 2);
      } 
    } 
  }
  
  private void sortWithIndices(float[] paramArrayOfFloat, int paramInt, boolean paramBoolean) {
    int i = paramInt / 2;
    this.originalIndices.clear();
    this.originalIndices.ensureCapacity(i);
    short[] arrayOfShort = this.originalIndices.items;
    int j;
    for (j = 0; j < i; j = (short)(j + true))
      arrayOfShort[j] = (short)j; 
    IntArray intArray = this.quicksortStack;
    intArray.add(0);
    intArray.add(paramInt - 1 - 1);
    while (intArray.size > 0) {
      paramInt = intArray.pop();
      int k = intArray.pop();
      if (paramInt <= k)
        continue; 
      int m = quicksortPartitionWithIndices(paramArrayOfFloat, k, paramInt, paramBoolean, arrayOfShort);
      i = m - k;
      j = paramInt - m;
      if (i > j) {
        intArray.add(k);
        intArray.add(m - 2);
      } 
      intArray.add(m + 2);
      intArray.add(paramInt);
      if (j >= i) {
        intArray.add(k);
        intArray.add(m - 2);
      } 
    } 
  }
  
  public IntArray computeIndices(FloatArray paramFloatArray, boolean paramBoolean1, boolean paramBoolean2) { return computeIndices(paramFloatArray.items, 0, paramFloatArray.size, paramBoolean1, paramBoolean2); }
  
  public IntArray computeIndices(float[] paramArrayOfFloat, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2) {
    if (paramInt2 <= 32767) {
      int i = paramInt1 + paramInt2;
      int j = 0;
      float[] arrayOfFloat = paramArrayOfFloat;
      int k = paramInt1;
      if (!paramBoolean1) {
        arrayOfFloat = this.sortedPoints;
        if (arrayOfFloat == null || arrayOfFloat.length < paramInt2)
          this.sortedPoints = new float[paramInt2]; 
        System.arraycopy(paramArrayOfFloat, paramInt1, this.sortedPoints, 0, paramInt2);
        arrayOfFloat = this.sortedPoints;
        sortWithIndices(arrayOfFloat, paramInt2, paramBoolean2);
        k = 0;
      } 
      IntArray intArray = this.indices;
      intArray.clear();
      FloatArray floatArray = this.hull;
      floatArray.clear();
      paramInt1 = k / 2;
      paramInt2 = k;
      while (paramInt2 < i) {
        float f1 = arrayOfFloat[paramInt2];
        float f2 = arrayOfFloat[paramInt2 + 1];
        while (floatArray.size >= 4 && ccw(f1, f2) <= 0.0F) {
          floatArray.size -= 2;
          intArray.size--;
        } 
        floatArray.add(f1);
        floatArray.add(f2);
        intArray.add(paramInt1);
        paramInt2 += 2;
        paramInt1++;
      } 
      paramInt2 = i - 4;
      paramInt1 = paramInt2 / 2;
      i = floatArray.size;
      while (paramInt2 >= k) {
        float f1 = arrayOfFloat[paramInt2];
        float f2 = arrayOfFloat[paramInt2 + 1];
        while (floatArray.size >= i + 2 && ccw(f1, f2) <= 0.0F) {
          floatArray.size -= 2;
          intArray.size--;
        } 
        floatArray.add(f1);
        floatArray.add(f2);
        intArray.add(paramInt1);
        paramInt2 -= 2;
        paramInt1--;
      } 
      if (!paramBoolean1) {
        short[] arrayOfShort = this.originalIndices.items;
        int[] arrayOfInt = intArray.items;
        paramInt2 = intArray.size;
        for (paramInt1 = j; paramInt1 < paramInt2; paramInt1++)
          arrayOfInt[paramInt1] = arrayOfShort[arrayOfInt[paramInt1]]; 
      } 
      return intArray;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("count must be <= 32767");
    throw illegalArgumentException;
  }
  
  public IntArray computeIndices(float[] paramArrayOfFloat, boolean paramBoolean1, boolean paramBoolean2) { return computeIndices(paramArrayOfFloat, 0, paramArrayOfFloat.length, paramBoolean1, paramBoolean2); }
  
  public FloatArray computePolygon(FloatArray paramFloatArray, boolean paramBoolean) { return computePolygon(paramFloatArray.items, 0, paramFloatArray.size, paramBoolean); }
  
  public FloatArray computePolygon(float[] paramArrayOfFloat, int paramInt1, int paramInt2, boolean paramBoolean) {
    int i = paramInt1 + paramInt2;
    float[] arrayOfFloat = paramArrayOfFloat;
    int j = paramInt1;
    if (!paramBoolean) {
      arrayOfFloat = this.sortedPoints;
      if (arrayOfFloat == null || arrayOfFloat.length < paramInt2)
        this.sortedPoints = new float[paramInt2]; 
      System.arraycopy(paramArrayOfFloat, paramInt1, this.sortedPoints, 0, paramInt2);
      arrayOfFloat = this.sortedPoints;
      sort(arrayOfFloat, paramInt2);
      j = 0;
    } 
    FloatArray floatArray = this.hull;
    floatArray.clear();
    for (paramInt1 = j; paramInt1 < i; paramInt1 += 2) {
      float f1 = arrayOfFloat[paramInt1];
      float f2 = arrayOfFloat[paramInt1 + 1];
      while (floatArray.size >= 4 && ccw(f1, f2) <= 0.0F)
        floatArray.size -= 2; 
      floatArray.add(f1);
      floatArray.add(f2);
    } 
    paramInt1 = i - 4;
    paramInt2 = floatArray.size;
    while (paramInt1 >= j) {
      float f1 = arrayOfFloat[paramInt1];
      float f2 = arrayOfFloat[paramInt1 + 1];
      while (floatArray.size >= paramInt2 + 2 && ccw(f1, f2) <= 0.0F)
        floatArray.size -= 2; 
      floatArray.add(f1);
      floatArray.add(f2);
      paramInt1 -= 2;
    } 
    return floatArray;
  }
  
  public FloatArray computePolygon(float[] paramArrayOfFloat, boolean paramBoolean) { return computePolygon(paramArrayOfFloat, 0, paramArrayOfFloat.length, paramBoolean); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/ConvexHull.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */