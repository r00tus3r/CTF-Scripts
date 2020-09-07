package com.badlogic.gdx.math;

public interface Vector<T extends Vector<T>> {
  T add(T paramT);
  
  T clamp(float paramFloat1, float paramFloat2);
  
  T cpy();
  
  float dot(T paramT);
  
  float dst(T paramT);
  
  float dst2(T paramT);
  
  boolean epsilonEquals(T paramT, float paramFloat);
  
  boolean hasOppositeDirection(T paramT);
  
  boolean hasSameDirection(T paramT);
  
  T interpolate(T paramT, float paramFloat, Interpolation paramInterpolation);
  
  boolean isCollinear(T paramT);
  
  boolean isCollinear(T paramT, float paramFloat);
  
  boolean isCollinearOpposite(T paramT);
  
  boolean isCollinearOpposite(T paramT, float paramFloat);
  
  boolean isOnLine(T paramT);
  
  boolean isOnLine(T paramT, float paramFloat);
  
  boolean isPerpendicular(T paramT);
  
  boolean isPerpendicular(T paramT, float paramFloat);
  
  boolean isUnit();
  
  boolean isUnit(float paramFloat);
  
  boolean isZero();
  
  boolean isZero(float paramFloat);
  
  float len();
  
  float len2();
  
  T lerp(T paramT, float paramFloat);
  
  T limit(float paramFloat);
  
  T limit2(float paramFloat);
  
  T mulAdd(T paramT, float paramFloat);
  
  T mulAdd(T paramT1, T paramT2);
  
  T nor();
  
  T scl(float paramFloat);
  
  T scl(T paramT);
  
  T set(T paramT);
  
  T setLength(float paramFloat);
  
  T setLength2(float paramFloat);
  
  T setToRandomDirection();
  
  T setZero();
  
  T sub(T paramT);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Vector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */