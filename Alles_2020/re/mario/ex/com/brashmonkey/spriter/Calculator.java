package com.brashmonkey.spriter;

public class Calculator {
  public static final float PI = 3.1415927F;
  
  private static final int SIN_BITS = 14;
  
  private static final int SIN_COUNT = 16384;
  
  private static final int SIN_MASK = 16383;
  
  private static final float degFull = 360.0F;
  
  public static final float degRad = 0.017453292F;
  
  private static final float degToIndex = 45.511112F;
  
  public static final float degreesToRadians = 0.017453292F;
  
  public static final float radDeg = 57.295776F;
  
  private static final float radFull = 6.2831855F;
  
  private static final float radToIndex = 2607.5945F;
  
  public static final float radiansToDegrees = 57.295776F;
  
  public static float acos(float paramFloat) { return (float)Math.acos(paramFloat); }
  
  public static float angleBetween(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return (float)Math.toDegrees(Math.atan2((paramFloat4 - paramFloat2), (paramFloat3 - paramFloat1))); }
  
  public static float angleDifference(float paramFloat1, float paramFloat2) { return ((paramFloat1 - paramFloat2) % 360.0F + 540.0F) % 360.0F - 180.0F; }
  
  public static final float cos(float paramFloat) { return Sin.table[(int)((paramFloat + 1.5707964F) * 2607.5945F) & 0x3FFF]; }
  
  public static final float cosDeg(float paramFloat) { return Sin.table[(int)((paramFloat + 90.0F) * 45.511112F) & 0x3FFF]; }
  
  public static float cubed(float paramFloat) { return paramFloat * paramFloat * paramFloat; }
  
  public static float cubicRoot(float paramFloat) { return (float)Math.pow(paramFloat, 0.3333333432674408D); }
  
  public static float distanceBetween(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    paramFloat1 = paramFloat3 - paramFloat1;
    paramFloat2 = paramFloat4 - paramFloat2;
    return sqrt(paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2);
  }
  
  public static final float sin(float paramFloat) { return Sin.table[(int)(paramFloat * 2607.5945F) & 0x3FFF]; }
  
  public static final float sinDeg(float paramFloat) { return Sin.table[(int)(paramFloat * 45.511112F) & 0x3FFF]; }
  
  public static Float solveCubic(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat1 == 0.0F)
      return solveQuadratic(paramFloat2, paramFloat3, paramFloat4); 
    if (paramFloat4 == 0.0F)
      return Float.valueOf(0.0F); 
    float f = paramFloat2 / paramFloat1;
    paramFloat2 = paramFloat3 / paramFloat1;
    paramFloat3 = paramFloat4 / paramFloat1;
    paramFloat4 = squared(f);
    paramFloat1 = (paramFloat2 * 3.0F - paramFloat4) / 9.0F;
    paramFloat2 = (paramFloat3 * -27.0F + (paramFloat2 * 9.0F - paramFloat4 * 2.0F) * f) / 54.0F;
    paramFloat4 = cubed(paramFloat1) + squared(paramFloat2);
    paramFloat3 = f / 3.0F;
    if (paramFloat4 > 0.0F) {
      paramFloat1 = sqrt(paramFloat4) + paramFloat2;
      if (paramFloat1 < 0.0F) {
        paramFloat1 = -cubicRoot(-paramFloat1);
      } else {
        paramFloat1 = cubicRoot(paramFloat1);
      } 
      paramFloat2 -= sqrt(paramFloat4);
      if (paramFloat2 < 0.0F) {
        paramFloat2 = -cubicRoot(-paramFloat2);
      } else {
        paramFloat2 = cubicRoot(paramFloat2);
      } 
      paramFloat1 = -paramFloat3 + paramFloat1 + paramFloat2;
      if (paramFloat1 >= 0.0F && paramFloat1 <= 1.0F)
        return Float.valueOf(paramFloat1); 
    } else if (paramFloat4 == 0.0F) {
      if (paramFloat2 < 0.0F) {
        paramFloat1 = -cubicRoot(-paramFloat2);
      } else {
        paramFloat1 = cubicRoot(paramFloat2);
      } 
      paramFloat2 = -paramFloat3 + 2.0F * paramFloat1;
      if (paramFloat2 >= 0.0F && paramFloat2 <= 1.0F)
        return Float.valueOf(paramFloat2); 
      paramFloat1 = -(paramFloat1 + paramFloat3);
      if (paramFloat1 >= 0.0F && paramFloat1 <= 1.0F)
        return Float.valueOf(paramFloat1); 
    } else {
      paramFloat4 = -paramFloat1;
      paramFloat1 = acos(paramFloat2 / sqrt(paramFloat4 * paramFloat4 * paramFloat4));
      paramFloat2 = sqrt(paramFloat4) * 2.0F;
      paramFloat3 = -paramFloat3;
      paramFloat4 = cos(paramFloat1 / 3.0F) * paramFloat2 + paramFloat3;
      if (paramFloat4 >= 0.0F && paramFloat4 <= 1.0F)
        return Float.valueOf(paramFloat4); 
      paramFloat4 = cos((6.2831855F + paramFloat1) / 3.0F) * paramFloat2 + paramFloat3;
      if (paramFloat4 >= 0.0F && paramFloat4 <= 1.0F)
        return Float.valueOf(paramFloat4); 
      paramFloat1 = paramFloat3 + paramFloat2 * cos((paramFloat1 + 12.566371F) / 3.0F);
      if (paramFloat1 >= 0.0F && paramFloat1 <= 1.0F)
        return Float.valueOf(paramFloat1); 
    } 
    return null;
  }
  
  public static Float solveQuadratic(float paramFloat1, float paramFloat2, float paramFloat3) {
    float f1 = squared(paramFloat2);
    float f2 = 2.0F * paramFloat1;
    paramFloat2 = -paramFloat2;
    paramFloat1 = f1 - paramFloat1 * 4.0F * paramFloat3;
    paramFloat3 = (sqrt(paramFloat1) + paramFloat2) / f2;
    if (paramFloat3 >= 0.0F && paramFloat3 <= 1.0F)
      return Float.valueOf(paramFloat3); 
    paramFloat1 = (paramFloat2 - sqrt(paramFloat1)) / f2;
    return (paramFloat1 >= 0.0F && paramFloat1 <= 1.0F) ? Float.valueOf(paramFloat1) : null;
  }
  
  public static float sqrt(float paramFloat) { return (float)Math.sqrt(paramFloat); }
  
  public static float squared(float paramFloat) { return paramFloat * paramFloat; }
  
  private static class Sin {
    static final float[] table;
    
    static  {
      boolean bool2;
      table = new float[16384];
      boolean bool1 = false;
      byte b = 0;
      while (true) {
        bool2 = bool1;
        if (b < '䀀') {
          table[b] = (float)Math.sin(((b + 0.5F) / 16384.0F * 6.2831855F));
          b++;
          continue;
        } 
        break;
      } 
      while (bool2 < 'Ũ') {
        float[] arrayOfFloat = table;
        float f = bool2;
        arrayOfFloat[(int)(45.511112F * f) & 0x3FFF] = (float)Math.sin((f * 0.017453292F));
        bool2 += true;
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Calculator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */