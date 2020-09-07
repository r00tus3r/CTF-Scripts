package com.brashmonkey.spriter;

public class Interpolator {
  public static float bezier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { return bezier0(paramFloat1) * paramFloat2 + bezier1(paramFloat1) * paramFloat3 + bezier2(paramFloat1) * paramFloat4 + bezier3(paramFloat1) * paramFloat5; }
  
  private static float bezier0(float paramFloat) {
    float f = paramFloat * paramFloat;
    return -f * paramFloat + f * 3.0F - paramFloat * 3.0F + 1.0F;
  }
  
  private static float bezier1(float paramFloat) {
    float f = paramFloat * paramFloat;
    paramFloat *= 3.0F;
    return paramFloat * f - f * 6.0F + paramFloat;
  }
  
  private static float bezier2(float paramFloat) {
    float f = paramFloat * paramFloat;
    return -3.0F * f * paramFloat + f * 3.0F;
  }
  
  private static float bezier3(float paramFloat) { return paramFloat * paramFloat * paramFloat; }
  
  public static float cubic(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { return linear(quadratic(paramFloat1, paramFloat2, paramFloat3, paramFloat5), quadratic(paramFloat2, paramFloat3, paramFloat4, paramFloat5), paramFloat5); }
  
  public static float cubicAngle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { return linearAngle(quadraticAngle(paramFloat1, paramFloat2, paramFloat3, paramFloat5), quadraticAngle(paramFloat2, paramFloat3, paramFloat4, paramFloat5), paramFloat5); }
  
  public static float linear(float paramFloat1, float paramFloat2, float paramFloat3) { return paramFloat1 + (paramFloat2 - paramFloat1) * paramFloat3; }
  
  public static float linearAngle(float paramFloat1, float paramFloat2, float paramFloat3) { return paramFloat1 + Calculator.angleDifference(paramFloat2, paramFloat1) * paramFloat3; }
  
  public static float quadratic(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return linear(linear(paramFloat1, paramFloat2, paramFloat4), linear(paramFloat2, paramFloat3, paramFloat4), paramFloat4); }
  
  public static float quadraticAngle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return linearAngle(linearAngle(paramFloat1, paramFloat2, paramFloat4), linearAngle(paramFloat2, paramFloat3, paramFloat4), paramFloat4); }
  
  public static float quartic(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return linear(cubic(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat6), cubic(paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6), paramFloat6); }
  
  public static float quarticAngle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return linearAngle(cubicAngle(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat6), cubicAngle(paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6), paramFloat6); }
  
  public static float quintic(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { return linear(quartic(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat7), quartic(paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7), paramFloat7); }
  
  public static float quinticAngle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { return linearAngle(quarticAngle(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat7), quarticAngle(paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7), paramFloat7); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Interpolator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */