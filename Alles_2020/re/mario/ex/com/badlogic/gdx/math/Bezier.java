package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class Bezier<T extends Vector<T>> extends Object implements Path<T> {
  public Array<T> points = new Array();
  
  private T tmp;
  
  private T tmp2;
  
  private T tmp3;
  
  public Bezier() {}
  
  public Bezier(Array<T> paramArray, int paramInt1, int paramInt2) { set(paramArray, paramInt1, paramInt2); }
  
  public Bezier(T... paramVarArgs) { set(paramVarArgs); }
  
  public Bezier(T[] paramArrayOfT, int paramInt1, int paramInt2) { set(paramArrayOfT, paramInt1, paramInt2); }
  
  public static <T extends Vector<T>> T cubic(T paramT1, float paramFloat, T paramT2, T paramT3, T paramT4, T paramT5, T paramT6) {
    float f1 = 1.0F - paramFloat;
    float f2 = f1 * f1;
    float f3 = paramFloat * paramFloat;
    return (T)paramT1.set(paramT2).scl(f2 * f1).add(paramT6.set(paramT3).scl(f2 * 3.0F * paramFloat)).add(paramT6.set(paramT4).scl(f1 * 3.0F * f3)).add(paramT6.set(paramT5).scl(f3 * paramFloat));
  }
  
  public static <T extends Vector<T>> T cubic_derivative(T paramT1, float paramFloat, T paramT2, T paramT3, T paramT4, T paramT5, T paramT6) {
    float f = 1.0F - paramFloat;
    return (T)paramT1.set(paramT3).sub(paramT2).scl(f * f * 3.0F).add(paramT6.set(paramT4).sub(paramT3).scl(f * paramFloat * 6.0F)).add(paramT6.set(paramT5).sub(paramT4).scl(paramFloat * paramFloat * 3.0F));
  }
  
  public static <T extends Vector<T>> T linear(T paramT1, float paramFloat, T paramT2, T paramT3, T paramT4) { return (T)paramT1.set(paramT2).scl(1.0F - paramFloat).add(paramT4.set(paramT3).scl(paramFloat)); }
  
  public static <T extends Vector<T>> T linear_derivative(T paramT1, float paramFloat, T paramT2, T paramT3, T paramT4) { return (T)paramT1.set(paramT3).sub(paramT2); }
  
  public static <T extends Vector<T>> T quadratic(T paramT1, float paramFloat, T paramT2, T paramT3, T paramT4, T paramT5) {
    float f = 1.0F - paramFloat;
    return (T)paramT1.set(paramT2).scl(f * f).add(paramT5.set(paramT3).scl(f * 2.0F * paramFloat)).add(paramT5.set(paramT4).scl(paramFloat * paramFloat));
  }
  
  public static <T extends Vector<T>> T quadratic_derivative(T paramT1, float paramFloat, T paramT2, T paramT3, T paramT4, T paramT5) { return (T)paramT1.set(paramT3).sub(paramT2).scl(2.0F).scl(1.0F - paramFloat).add(paramT5.set(paramT4).sub(paramT3).scl(paramFloat).scl(2.0F)); }
  
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
  
  public float approximate(T paramT) {
    Vector vector1 = (Vector)this.points.get(0);
    Array array = this.points;
    Vector vector2 = (Vector)array.get(array.size - 1);
    float f1 = vector1.dst2(vector2);
    float f2 = paramT.dst2(vector2);
    float f3 = paramT.dst2(vector1);
    float f4 = (float)Math.sqrt(f1);
    return MathUtils.clamp((f4 - (f2 + f1 - f3) / 2.0F * f4) / f4, 0.0F, 1.0F);
  }
  
  public T derivativeAt(T paramT, float paramFloat) {
    int i = this.points.size;
    if (i == 2) {
      linear_derivative(paramT, paramFloat, (Vector)this.points.get(0), (Vector)this.points.get(1), this.tmp);
    } else if (i == 3) {
      quadratic_derivative(paramT, paramFloat, (Vector)this.points.get(0), (Vector)this.points.get(1), (Vector)this.points.get(2), this.tmp);
    } else if (i == 4) {
      cubic_derivative(paramT, paramFloat, (Vector)this.points.get(0), (Vector)this.points.get(1), (Vector)this.points.get(2), (Vector)this.points.get(3), this.tmp);
    } 
    return paramT;
  }
  
  public float locate(T paramT) { return approximate(paramT); }
  
  public Bezier set(Array<T> paramArray, int paramInt1, int paramInt2) {
    if (paramInt2 >= 2 && paramInt2 <= 4) {
      if (this.tmp == null)
        this.tmp = ((Vector)paramArray.get(0)).cpy(); 
      if (this.tmp2 == null)
        this.tmp2 = ((Vector)paramArray.get(0)).cpy(); 
      if (this.tmp3 == null)
        this.tmp3 = ((Vector)paramArray.get(0)).cpy(); 
      this.points.clear();
      this.points.addAll(paramArray, paramInt1, paramInt2);
      return this;
    } 
    throw new GdxRuntimeException("Only first, second and third degree Bezier curves are supported.");
  }
  
  public Bezier set(T... paramVarArgs) { return set(paramVarArgs, 0, paramVarArgs.length); }
  
  public Bezier set(T[] paramArrayOfT, int paramInt1, int paramInt2) {
    if (paramInt2 >= 2 && paramInt2 <= 4) {
      if (this.tmp == null)
        this.tmp = paramArrayOfT[0].cpy(); 
      if (this.tmp2 == null)
        this.tmp2 = paramArrayOfT[0].cpy(); 
      if (this.tmp3 == null)
        this.tmp3 = paramArrayOfT[0].cpy(); 
      this.points.clear();
      this.points.addAll(paramArrayOfT, paramInt1, paramInt2);
      return this;
    } 
    throw new GdxRuntimeException("Only first, second and third degree Bezier curves are supported.");
  }
  
  public T valueAt(T paramT, float paramFloat) {
    int i = this.points.size;
    if (i == 2) {
      linear(paramT, paramFloat, (Vector)this.points.get(0), (Vector)this.points.get(1), this.tmp);
    } else if (i == 3) {
      quadratic(paramT, paramFloat, (Vector)this.points.get(0), (Vector)this.points.get(1), (Vector)this.points.get(2), this.tmp);
    } else if (i == 4) {
      cubic(paramT, paramFloat, (Vector)this.points.get(0), (Vector)this.points.get(1), (Vector)this.points.get(2), (Vector)this.points.get(3), this.tmp);
    } 
    return paramT;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Bezier.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */