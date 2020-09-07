package com.badlogic.gdx.math;

public interface Path<T> {
  float approxLength(int paramInt);
  
  float approximate(T paramT);
  
  T derivativeAt(T paramT, float paramFloat);
  
  float locate(T paramT);
  
  T valueAt(T paramT, float paramFloat);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Path.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */