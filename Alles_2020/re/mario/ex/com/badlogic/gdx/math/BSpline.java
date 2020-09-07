package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.Array;

public class BSpline<T extends Vector<T>> extends Object implements Path<T> {
  private static final float d6 = 0.16666667F;
  
  public boolean continuous;
  
  public T[] controlPoints;
  
  public int degree;
  
  public Array<T> knots;
  
  public int spanCount;
  
  private T tmp;
  
  private T tmp2;
  
  private T tmp3;
  
  public BSpline() {}
  
  public BSpline(T[] paramArrayOfT, int paramInt, boolean paramBoolean) { set(paramArrayOfT, paramInt, paramBoolean); }
  
  public static <T extends Vector<T>> T calculate(T paramT1, float paramFloat, T[] paramArrayOfT, int paramInt, boolean paramBoolean, T paramT2) {
    int i;
    if (paramBoolean) {
      i = paramArrayOfT.length;
    } else {
      i = paramArrayOfT.length - paramInt;
    } 
    float f = i * paramFloat;
    if (paramFloat >= 1.0F) {
      i--;
    } else {
      i = (int)f;
    } 
    return (T)calculate(paramT1, i, f - i, paramArrayOfT, paramInt, paramBoolean, paramT2);
  }
  
  public static <T extends Vector<T>> T calculate(T paramT1, int paramInt1, float paramFloat, T[] paramArrayOfT, int paramInt2, boolean paramBoolean, T paramT2) { return (paramInt2 != 3) ? paramT1 : (T)cubic(paramT1, paramInt1, paramFloat, paramArrayOfT, paramBoolean, paramT2); }
  
  public static <T extends Vector<T>> T cubic(T paramT1, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
    int i;
    if (paramBoolean) {
      i = paramArrayOfT.length;
    } else {
      i = paramArrayOfT.length - 3;
    } 
    float f = i * paramFloat;
    if (paramFloat >= 1.0F) {
      i--;
    } else {
      i = (int)f;
    } 
    return (T)cubic(paramT1, i, f - i, paramArrayOfT, paramBoolean, paramT2);
  }
  
  public static <T extends Vector<T>> T cubic(T paramT1, int paramInt, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
    int i = paramArrayOfT.length;
    float f1 = 1.0F - paramFloat;
    float f2 = paramFloat * paramFloat;
    float f3 = f2 * paramFloat;
    paramT1.set(paramArrayOfT[paramInt]).scl((f3 * 3.0F - 6.0F * f2 + 4.0F) * 0.16666667F);
    if (paramBoolean || paramInt > 0)
      paramT1.add(paramT2.set(paramArrayOfT[(i + paramInt - 1) % i]).scl(f1 * f1 * f1 * 0.16666667F)); 
    if (paramBoolean || paramInt < i - 1)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 1) % i]).scl((-3.0F * f3 + f2 * 3.0F + paramFloat * 3.0F + 1.0F) * 0.16666667F)); 
    if (paramBoolean || paramInt < i - 2)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 2) % i]).scl(f3 * 0.16666667F)); 
    return paramT1;
  }
  
  public static <T extends Vector<T>> T cubic_derivative(T paramT1, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
    int i;
    if (paramBoolean) {
      i = paramArrayOfT.length;
    } else {
      i = paramArrayOfT.length - 3;
    } 
    float f = i * paramFloat;
    if (paramFloat >= 1.0F) {
      i--;
    } else {
      i = (int)f;
    } 
    return (T)cubic(paramT1, i, f - i, paramArrayOfT, paramBoolean, paramT2);
  }
  
  public static <T extends Vector<T>> T cubic_derivative(T paramT1, int paramInt, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
    int i = paramArrayOfT.length;
    float f1 = 1.0F - paramFloat;
    float f2 = paramFloat * paramFloat;
    paramT1.set(paramArrayOfT[paramInt]).scl(1.5F * f2 - 2.0F * paramFloat);
    if (paramBoolean || paramInt > 0)
      paramT1.add(paramT2.set(paramArrayOfT[(i + paramInt - 1) % i]).scl(-0.5F * f1 * f1)); 
    if (paramBoolean || paramInt < i - 1)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 1) % i]).scl(-1.5F * f2 + paramFloat + 0.5F)); 
    if (paramBoolean || paramInt < i - 2)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 2) % i]).scl(f2 * 0.5F)); 
    return paramT1;
  }
  
  public static <T extends Vector<T>> T derivative(T paramT1, float paramFloat, T[] paramArrayOfT, int paramInt, boolean paramBoolean, T paramT2) {
    int i;
    if (paramBoolean) {
      i = paramArrayOfT.length;
    } else {
      i = paramArrayOfT.length - paramInt;
    } 
    float f = i * paramFloat;
    if (paramFloat >= 1.0F) {
      i--;
    } else {
      i = (int)f;
    } 
    return (T)derivative(paramT1, i, f - i, paramArrayOfT, paramInt, paramBoolean, paramT2);
  }
  
  public static <T extends Vector<T>> T derivative(T paramT1, int paramInt1, float paramFloat, T[] paramArrayOfT, int paramInt2, boolean paramBoolean, T paramT2) { return (paramInt2 != 3) ? paramT1 : (T)cubic_derivative(paramT1, paramInt1, paramFloat, paramArrayOfT, paramBoolean, paramT2); }
  
  public float approxLength(int paramInt) {
    float f = 0.0F;
    byte b = 0;
    while (b < paramInt) {
      this.tmp2.set(this.tmp3);
      valueAt(this.tmp3, b / (paramInt - 1.0F));
      float f1 = f;
      if (b)
        f1 = f + this.tmp2.dst(this.tmp3); 
      b++;
      f = f1;
    } 
    return f;
  }
  
  public float approximate(T paramT) { return approximate(paramT, nearest(paramT)); }
  
  public float approximate(T paramT, int paramInt) {
    int i;
    Vector vector1 = (Vector)this.knots.get(paramInt);
    Array array = this.knots;
    if (paramInt > 0) {
      i = paramInt - 1;
    } else {
      i = this.spanCount - 1;
    } 
    Vector vector3 = (Vector)array.get(i);
    Vector vector2 = (Vector)this.knots.get((paramInt + 1) % this.spanCount);
    float f1 = paramT.dst2(vector3);
    if (paramT.dst2(vector2) >= f1) {
      if (paramInt <= 0)
        paramInt = this.spanCount; 
      paramInt--;
      vector2 = vector1;
      vector1 = vector3;
    } 
    f1 = vector1.dst2(vector2);
    float f2 = paramT.dst2(vector2);
    float f3 = paramT.dst2(vector1);
    float f4 = (float)Math.sqrt(f1);
    f1 = MathUtils.clamp((f4 - (f2 + f1 - f3) / 2.0F * f4) / f4, 0.0F, 1.0F);
    return (paramInt + f1) / this.spanCount;
  }
  
  public float approximate(T paramT, int paramInt1, int paramInt2) { return approximate(paramT, nearest(paramT, paramInt1, paramInt2)); }
  
  public T derivativeAt(T paramT, float paramFloat) {
    int i = this.spanCount;
    float f = i * paramFloat;
    if (paramFloat >= 1.0F) {
      i--;
    } else {
      i = (int)f;
    } 
    return (T)derivativeAt(paramT, i, f - i);
  }
  
  public T derivativeAt(T paramT, int paramInt, float paramFloat) {
    if (!this.continuous)
      paramInt += (int)(this.degree * 0.5F); 
    return (T)derivative(paramT, paramInt, paramFloat, this.controlPoints, this.degree, this.continuous, this.tmp);
  }
  
  public float locate(T paramT) { return approximate(paramT); }
  
  public int nearest(T paramT) { return nearest(paramT, 0, this.spanCount); }
  
  public int nearest(T paramT, int paramInt1, int paramInt2) {
    while (paramInt1 < 0)
      paramInt1 += this.spanCount; 
    int i = paramInt1 % this.spanCount;
    float f = paramT.dst2((Vector)this.knots.get(i));
    int j = 1;
    while (j < paramInt2) {
      int k = (paramInt1 + j) % this.spanCount;
      float f1 = paramT.dst2((Vector)this.knots.get(k));
      float f2 = f;
      if (f1 < f) {
        i = k;
        f2 = f1;
      } 
      j++;
      f = f2;
    } 
    return i;
  }
  
  public BSpline set(T[] paramArrayOfT, int paramInt, boolean paramBoolean) {
    if (this.tmp == null)
      this.tmp = paramArrayOfT[0].cpy(); 
    if (this.tmp2 == null)
      this.tmp2 = paramArrayOfT[0].cpy(); 
    if (this.tmp3 == null)
      this.tmp3 = paramArrayOfT[0].cpy(); 
    this.controlPoints = paramArrayOfT;
    this.degree = paramInt;
    this.continuous = paramBoolean;
    if (paramBoolean) {
      i = paramArrayOfT.length;
    } else {
      i = paramArrayOfT.length - paramInt;
    } 
    this.spanCount = i;
    Array array = this.knots;
    if (array == null) {
      this.knots = new Array(this.spanCount);
    } else {
      array.clear();
      this.knots.ensureCapacity(this.spanCount);
    } 
    for (int i = 0; i < this.spanCount; i++) {
      int j;
      Array array1 = this.knots;
      Vector vector = paramArrayOfT[0].cpy();
      if (paramBoolean) {
        j = i;
      } else {
        j = (int)(i + paramInt * 0.5F);
      } 
      array1.add(calculate(vector, j, 0.0F, paramArrayOfT, paramInt, paramBoolean, this.tmp));
    } 
    return this;
  }
  
  public T valueAt(T paramT, float paramFloat) {
    int i = this.spanCount;
    float f = i * paramFloat;
    if (paramFloat >= 1.0F) {
      i--;
    } else {
      i = (int)f;
    } 
    return (T)valueAt(paramT, i, f - i);
  }
  
  public T valueAt(T paramT, int paramInt, float paramFloat) {
    if (!this.continuous)
      paramInt += (int)(this.degree * 0.5F); 
    return (T)calculate(paramT, paramInt, paramFloat, this.controlPoints, this.degree, this.continuous, this.tmp);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/BSpline.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */