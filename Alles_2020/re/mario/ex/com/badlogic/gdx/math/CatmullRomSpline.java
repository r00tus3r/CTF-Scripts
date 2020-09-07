package com.badlogic.gdx.math;

public class CatmullRomSpline<T extends Vector<T>> extends Object implements Path<T> {
  public boolean continuous;
  
  public T[] controlPoints;
  
  public int spanCount;
  
  private T tmp;
  
  private T tmp2;
  
  private T tmp3;
  
  public CatmullRomSpline() {}
  
  public CatmullRomSpline(T[] paramArrayOfT, boolean paramBoolean) { set(paramArrayOfT, paramBoolean); }
  
  public static <T extends Vector<T>> T calculate(T paramT1, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
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
    return (T)calculate(paramT1, i, f - i, paramArrayOfT, paramBoolean, paramT2);
  }
  
  public static <T extends Vector<T>> T calculate(T paramT1, int paramInt, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
    int i = paramArrayOfT.length;
    float f1 = paramFloat * paramFloat;
    float f2 = f1 * paramFloat;
    paramT1.set(paramArrayOfT[paramInt]).scl(1.5F * f2 - 2.5F * f1 + 1.0F);
    if (paramBoolean || paramInt > 0)
      paramT1.add(paramT2.set(paramArrayOfT[(i + paramInt - 1) % i]).scl(-0.5F * f2 + f1 - paramFloat * 0.5F)); 
    if (paramBoolean || paramInt < i - 1)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 1) % i]).scl(-1.5F * f2 + 2.0F * f1 + paramFloat * 0.5F)); 
    if (paramBoolean || paramInt < i - 2)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 2) % i]).scl(f2 * 0.5F - f1 * 0.5F)); 
    return paramT1;
  }
  
  public static <T extends Vector<T>> T derivative(T paramT1, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
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
    return (T)derivative(paramT1, i, f - i, paramArrayOfT, paramBoolean, paramT2);
  }
  
  public static <T extends Vector<T>> T derivative(T paramT1, int paramInt, float paramFloat, T[] paramArrayOfT, boolean paramBoolean, T paramT2) {
    int i = paramArrayOfT.length;
    float f1 = paramFloat * paramFloat;
    Vector vector = paramT1.set(paramArrayOfT[paramInt]);
    float f2 = -paramFloat;
    float f3 = 4.5F * f1;
    vector.scl(5.0F * f2 + f3);
    if (paramBoolean || paramInt > 0)
      paramT1.add(paramT2.set(paramArrayOfT[(i + paramInt - 1) % i]).scl(2.0F * paramFloat - 0.5F - f1 * 1.5F)); 
    if (paramBoolean || paramInt < i - 1)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 1) % i]).scl(paramFloat * 4.0F + 0.5F - f3)); 
    if (paramBoolean || paramInt < i - 2)
      paramT1.add(paramT2.set(paramArrayOfT[(paramInt + 2) % i]).scl(f2 + f1 * 1.5F)); 
    return paramT1;
  }
  
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
    Vector[] arrayOfVector = this.controlPoints;
    Vector vector2 = arrayOfVector[paramInt];
    if (paramInt > 0) {
      i = paramInt - 1;
    } else {
      i = this.spanCount - 1;
    } 
    Vector vector3 = arrayOfVector[i];
    Vector vector1 = this.controlPoints[(paramInt + 1) % this.spanCount];
    float f1 = paramT.dst2(vector3);
    if (paramT.dst2(vector1) >= f1) {
      if (paramInt <= 0)
        paramInt = this.spanCount; 
      paramInt--;
      vector1 = vector2;
      vector2 = vector3;
    } 
    float f2 = vector2.dst2(vector1);
    f1 = paramT.dst2(vector1);
    float f3 = paramT.dst2(vector2);
    float f4 = (float)Math.sqrt(f2);
    f1 = MathUtils.clamp((f4 - (f1 + f2 - f3) / 2.0F * f4) / f4, 0.0F, 1.0F);
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
      paramInt++; 
    return (T)derivative(paramT, paramInt, paramFloat, this.controlPoints, this.continuous, this.tmp);
  }
  
  public float locate(T paramT) { return approximate(paramT); }
  
  public int nearest(T paramT) { return nearest(paramT, 0, this.spanCount); }
  
  public int nearest(T paramT, int paramInt1, int paramInt2) {
    while (paramInt1 < 0)
      paramInt1 += this.spanCount; 
    int i = paramInt1 % this.spanCount;
    float f = paramT.dst2(this.controlPoints[i]);
    int j = 1;
    while (j < paramInt2) {
      int k = (paramInt1 + j) % this.spanCount;
      float f1 = paramT.dst2(this.controlPoints[k]);
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
  
  public CatmullRomSpline set(T[] paramArrayOfT, boolean paramBoolean) {
    int i;
    if (this.tmp == null)
      this.tmp = paramArrayOfT[0].cpy(); 
    if (this.tmp2 == null)
      this.tmp2 = paramArrayOfT[0].cpy(); 
    if (this.tmp3 == null)
      this.tmp3 = paramArrayOfT[0].cpy(); 
    this.controlPoints = paramArrayOfT;
    this.continuous = paramBoolean;
    if (paramBoolean) {
      i = paramArrayOfT.length;
    } else {
      i = paramArrayOfT.length - 3;
    } 
    this.spanCount = i;
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
      paramInt++; 
    return (T)calculate(paramT, paramInt, paramFloat, this.controlPoints, this.continuous, this.tmp);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/CatmullRomSpline.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */