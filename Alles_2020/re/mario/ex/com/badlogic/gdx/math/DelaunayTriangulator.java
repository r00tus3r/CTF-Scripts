package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.BooleanArray;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.ShortArray;

public class DelaunayTriangulator {
  private static final int COMPLETE = 1;
  
  private static final float EPSILON = 1.0E-6F;
  
  private static final int INCOMPLETE = 2;
  
  private static final int INSIDE = 0;
  
  private final Vector2 centroid = new Vector2();
  
  private final BooleanArray complete = new BooleanArray(false, 16);
  
  private final IntArray edges = new IntArray();
  
  private final ShortArray originalIndices = new ShortArray(false, false);
  
  private final IntArray quicksortStack = new IntArray();
  
  private float[] sortedPoints;
  
  private final float[] superTriangle = new float[6];
  
  private final ShortArray triangles = new ShortArray(false, 16);
  
  private int circumCircle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) {
    float f1 = Math.abs(paramFloat4 - paramFloat6);
    float f2 = Math.abs(paramFloat6 - paramFloat8);
    byte b1 = 2;
    if (f1 < 1.0E-6F) {
      if (f2 < 1.0E-6F)
        return 2; 
      paramFloat4 = -(paramFloat7 - paramFloat5) / (paramFloat8 - paramFloat6);
      paramFloat7 = (paramFloat7 + paramFloat5) / 2.0F;
      paramFloat8 = (paramFloat8 + paramFloat6) / 2.0F;
      paramFloat3 = (paramFloat3 + paramFloat5) / 2.0F;
      paramFloat4 = paramFloat4 * (paramFloat3 - paramFloat7) + paramFloat8;
    } else {
      f1 = -(paramFloat5 - paramFloat3) / (paramFloat6 - paramFloat4);
      float f = (paramFloat3 + paramFloat5) / 2.0F;
      paramFloat4 = (paramFloat4 + paramFloat6) / 2.0F;
      if (f2 < 1.0E-6F) {
        paramFloat3 = (paramFloat7 + paramFloat5) / 2.0F;
      } else {
        paramFloat3 = -(paramFloat7 - paramFloat5) / (paramFloat8 - paramFloat6);
        paramFloat3 = (f1 * f - (paramFloat7 + paramFloat5) / 2.0F * paramFloat3 + (paramFloat8 + paramFloat6) / 2.0F - paramFloat4) / (f1 - paramFloat3);
      } 
      paramFloat4 += f1 * (paramFloat3 - f);
    } 
    paramFloat5 -= paramFloat3;
    paramFloat6 -= paramFloat4;
    paramFloat5 = paramFloat5 * paramFloat5 + paramFloat6 * paramFloat6;
    paramFloat6 = paramFloat1 - paramFloat3;
    paramFloat6 *= paramFloat6;
    paramFloat2 -= paramFloat4;
    if (paramFloat2 * paramFloat2 + paramFloat6 - paramFloat5 <= 1.0E-6F)
      return 0; 
    byte b2 = b1;
    if (paramFloat1 > paramFloat3) {
      b2 = b1;
      if (paramFloat6 > paramFloat5)
        b2 = 1; 
    } 
    return b2;
  }
  
  private int quicksortPartition(float[] paramArrayOfFloat, int paramInt1, int paramInt2, short[] paramArrayOfShort) {
    float f = paramArrayOfFloat[paramInt1];
    int i = paramInt1 + 2;
    while (i < paramInt2) {
      int n;
      int m = i;
      while (true) {
        n = paramInt2;
        if (m < paramInt2) {
          n = paramInt2;
          if (paramArrayOfFloat[m] <= f) {
            m += 2;
            continue;
          } 
        } 
        break;
      } 
      while (paramArrayOfFloat[n] > f)
        n -= 2; 
      i = m;
      paramInt2 = n;
      if (m < n) {
        float f1 = paramArrayOfFloat[m];
        paramArrayOfFloat[m] = paramArrayOfFloat[n];
        paramArrayOfFloat[n] = f1;
        paramInt2 = m + 1;
        f1 = paramArrayOfFloat[paramInt2];
        i = n + 1;
        paramArrayOfFloat[paramInt2] = paramArrayOfFloat[i];
        paramArrayOfFloat[i] = f1;
        i = m / 2;
        paramInt2 = paramArrayOfShort[i];
        int i1 = n / 2;
        paramArrayOfShort[i] = (short)paramArrayOfShort[i1];
        paramArrayOfShort[i1] = (short)paramInt2;
        i = m;
        paramInt2 = n;
      } 
    } 
    paramArrayOfFloat[paramInt1] = paramArrayOfFloat[paramInt2];
    paramArrayOfFloat[paramInt2] = f;
    int j = paramInt1 + 1;
    f = paramArrayOfFloat[j];
    int k = paramInt2 + 1;
    paramArrayOfFloat[j] = paramArrayOfFloat[k];
    paramArrayOfFloat[k] = f;
    j = paramInt1 / 2;
    k = paramArrayOfShort[j];
    paramInt1 = paramInt2 / 2;
    paramArrayOfShort[j] = (short)paramArrayOfShort[paramInt1];
    paramArrayOfShort[paramInt1] = (short)k;
    return paramInt2;
  }
  
  private void sort(float[] paramArrayOfFloat, int paramInt) {
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
      j = quicksortPartition(paramArrayOfFloat, k, paramInt, arrayOfShort);
      i = j - k;
      int m = paramInt - j;
      if (i > m) {
        intArray.add(k);
        intArray.add(j - 2);
      } 
      intArray.add(j + 2);
      intArray.add(paramInt);
      if (m >= i) {
        intArray.add(k);
        intArray.add(j - 2);
      } 
    } 
  }
  
  public ShortArray computeTriangles(FloatArray paramFloatArray, boolean paramBoolean) { return computeTriangles(paramFloatArray.items, 0, paramFloatArray.size, paramBoolean); }
  
  public ShortArray computeTriangles(float[] paramArrayOfFloat, int paramInt1, int paramInt2, boolean paramBoolean) {
    if (paramInt2 <= 32767) {
      float[] arrayOfFloat1;
      ShortArray shortArray = this.triangles;
      shortArray.clear();
      if (paramInt2 < 6)
        return shortArray; 
      shortArray.ensureCapacity(paramInt2);
      if (!paramBoolean) {
        arrayOfFloat1 = this.sortedPoints;
        if (arrayOfFloat1 == null || arrayOfFloat1.length < paramInt2)
          this.sortedPoints = new float[paramInt2]; 
        System.arraycopy(paramArrayOfFloat, paramInt1, this.sortedPoints, 0, paramInt2);
        arrayOfFloat1 = this.sortedPoints;
        sort(arrayOfFloat1, paramInt2);
        paramInt1 = 0;
      } else {
        arrayOfFloat1 = paramArrayOfFloat;
      } 
      int i = paramInt1 + paramInt2;
      float f1 = arrayOfFloat1[0];
      float f2 = arrayOfFloat1[1];
      int j = paramInt1 + 2;
      float f3 = f2;
      float f4 = f1;
      while (j < i) {
        float f7 = arrayOfFloat1[j];
        float f8 = f4;
        if (f7 < f4)
          f8 = f7; 
        f4 = f1;
        if (f7 > f1)
          f4 = f7; 
        f1 = arrayOfFloat1[++j];
        f7 = f3;
        if (f1 < f3)
          f7 = f1; 
        f3 = f2;
        if (f1 > f2)
          f3 = f1; 
        j++;
        f1 = f4;
        f4 = f8;
        f2 = f3;
        f3 = f7;
      } 
      float f5 = f1 - f4;
      float f6 = f2 - f3;
      if (f5 > f6)
        f6 = f5; 
      f6 *= 20.0F;
      f1 = (f1 + f4) / 2.0F;
      f3 = (f2 + f3) / 2.0F;
      float[] arrayOfFloat2 = this.superTriangle;
      arrayOfFloat2[0] = f1 - f6;
      f2 = f3 - f6;
      arrayOfFloat2[1] = f2;
      arrayOfFloat2[2] = f1;
      arrayOfFloat2[3] = f3 + f6;
      arrayOfFloat2[4] = f1 + f6;
      arrayOfFloat2[5] = f2;
      IntArray intArray = this.edges;
      intArray.ensureCapacity(paramInt2 / 2);
      BooleanArray booleanArray = this.complete;
      booleanArray.clear();
      booleanArray.ensureCapacity(paramInt2);
      shortArray.add(i);
      shortArray.add(i + 2);
      shortArray.add(i + 4);
      booleanArray.add(false);
      j = paramInt1;
      paramInt2 = i;
      while (j < paramInt2) {
        float f7 = arrayOfFloat1[j];
        float f8 = arrayOfFloat1[j + 1];
        short[] arrayOfShort1 = shortArray.items;
        boolean[] arrayOfBoolean = booleanArray.items;
        for (i = shortArray.size - 1; i >= 0; i -= 3) {
          int n = i / 3;
          if (!arrayOfBoolean[n]) {
            int i1 = i - 2;
            short s1 = arrayOfShort1[i1];
            short s2 = arrayOfShort1[i - 1];
            short s3 = arrayOfShort1[i];
            if (s1 >= paramInt2) {
              short s = s1 - paramInt2;
              f2 = arrayOfFloat2[s];
              f3 = arrayOfFloat2[s + 1];
            } else {
              f2 = arrayOfFloat1[s1];
              f3 = arrayOfFloat1[s1 + 1];
            } 
            if (s2 >= paramInt2) {
              short s = s2 - paramInt2;
              f1 = arrayOfFloat2[s];
              f4 = arrayOfFloat2[s + 1];
            } else {
              f1 = arrayOfFloat1[s2];
              f4 = arrayOfFloat1[s2 + 1];
            } 
            if (s3 >= paramInt2) {
              short s = s3 - paramInt2;
              f6 = arrayOfFloat2[s];
              f5 = arrayOfFloat2[s + 1];
            } else {
              f6 = arrayOfFloat1[s3];
              f5 = arrayOfFloat1[s3 + 1];
            } 
            IntArray intArray1 = intArray;
            int i2 = circumCircle(f7, f8, f2, f3, f1, f4, f6, f5);
            if (i2 != 0) {
              if (i2 == 1)
                arrayOfBoolean[n] = true; 
            } else {
              intArray1.add(s1, s2, s2, s3);
              intArray1.add(s3, s1);
              shortArray.removeRange(i1, i);
              booleanArray.removeIndex(n);
            } 
          } 
        } 
        int[] arrayOfInt = intArray.items;
        int m = intArray.size;
        for (i = 0; i < m; i += 2) {
          int n = arrayOfInt[i];
          if (n != -1) {
            int i3 = i + 1;
            int i2 = arrayOfInt[i3];
            int i1 = i + 2;
            byte b;
            for (b = 0; i1 < m; b = b1) {
              byte b1 = b;
              if (n == arrayOfInt[i1 + 1]) {
                b1 = b;
                if (i2 == arrayOfInt[i1]) {
                  arrayOfInt[i1] = -1;
                  b1 = 1;
                } 
              } 
              i1 += 2;
            } 
            if (b == 0) {
              shortArray.add(n);
              shortArray.add(arrayOfInt[i3]);
              shortArray.add(j);
              booleanArray.add(false);
            } 
          } 
        } 
        intArray.clear();
        j += 2;
      } 
      int k = 0;
      i = 0;
      short[] arrayOfShort = shortArray.items;
      for (j = shortArray.size - 1; j >= 0; j -= 3) {
        if (arrayOfShort[j] >= paramInt2 || arrayOfShort[j - 1] >= paramInt2 || arrayOfShort[j - 2] >= paramInt2) {
          shortArray.removeIndex(j);
          shortArray.removeIndex(j - 1);
          shortArray.removeIndex(j - 2);
        } 
      } 
      if (!paramBoolean) {
        short[] arrayOfShort1 = this.originalIndices.items;
        j = shortArray.size;
        for (paramInt2 = 0; paramInt2 < j; paramInt2++)
          arrayOfShort[paramInt2] = (short)(short)(arrayOfShort1[arrayOfShort[paramInt2] / 2] * 2); 
      } 
      if (paramInt1 == 0) {
        paramInt2 = shortArray.size;
        for (paramInt1 = i; paramInt1 < paramInt2; paramInt1++)
          arrayOfShort[paramInt1] = (short)(short)(arrayOfShort[paramInt1] / 2); 
      } else {
        j = shortArray.size;
        for (paramInt2 = k; paramInt2 < j; paramInt2++)
          arrayOfShort[paramInt2] = (short)(short)((arrayOfShort[paramInt2] - paramInt1) / 2); 
      } 
      return shortArray;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("count must be <= 32767");
    throw illegalArgumentException;
  }
  
  public ShortArray computeTriangles(float[] paramArrayOfFloat, boolean paramBoolean) { return computeTriangles(paramArrayOfFloat, 0, paramArrayOfFloat.length, paramBoolean); }
  
  public void trim(ShortArray paramShortArray, float[] paramArrayOfFloat1, float[] paramArrayOfFloat2, int paramInt1, int paramInt2) {
    short[] arrayOfShort = paramShortArray.items;
    for (int i = paramShortArray.size - 1; i >= 0; i -= 3) {
      int j = i - 2;
      short s1 = arrayOfShort[j] * 2;
      int k = i - 1;
      short s2 = arrayOfShort[k] * 2;
      short s3 = arrayOfShort[i] * 2;
      GeometryUtils.triangleCentroid(paramArrayOfFloat1[s1], paramArrayOfFloat1[s1 + 1], paramArrayOfFloat1[s2], paramArrayOfFloat1[s2 + 1], paramArrayOfFloat1[s3], paramArrayOfFloat1[s3 + 1], this.centroid);
      if (!Intersector.isPointInPolygon(paramArrayOfFloat2, paramInt1, paramInt2, this.centroid.x, this.centroid.y)) {
        paramShortArray.removeIndex(i);
        paramShortArray.removeIndex(k);
        paramShortArray.removeIndex(j);
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/DelaunayTriangulator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */