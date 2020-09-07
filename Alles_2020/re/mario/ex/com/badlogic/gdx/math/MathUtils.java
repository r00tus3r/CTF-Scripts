package com.badlogic.gdx.math;

import java.util.Random;

public final class MathUtils {
  private static final double BIG_ENOUGH_CEIL = 16384.999999999996D;
  
  private static final double BIG_ENOUGH_FLOOR = 16384.0D;
  
  private static final int BIG_ENOUGH_INT = 16384;
  
  private static final double BIG_ENOUGH_ROUND = 16384.5D;
  
  private static final double CEIL = 0.9999999D;
  
  public static final float E = 2.7182817F;
  
  public static final float FLOAT_ROUNDING_ERROR = 1.0E-6F;
  
  public static final float PI = 3.1415927F;
  
  public static final float PI2 = 6.2831855F;
  
  private static final int SIN_BITS = 14;
  
  private static final int SIN_COUNT = 16384;
  
  private static final int SIN_MASK = 16383;
  
  private static final float degFull = 360.0F;
  
  public static final float degRad = 0.017453292F;
  
  private static final float degToIndex = 45.511112F;
  
  public static final float degreesToRadians = 0.017453292F;
  
  public static final float nanoToSec = 1.0E-9F;
  
  public static final float radDeg = 57.295776F;
  
  private static final float radFull = 6.2831855F;
  
  private static final float radToIndex = 2607.5945F;
  
  public static final float radiansToDegrees = 57.295776F;
  
  public static Random random = new RandomXS128();
  
  public static float atan2(float paramFloat1, float paramFloat2) {
    if (paramFloat2 == 0.0F)
      return (paramFloat1 > 0.0F) ? 1.5707964F : ((paramFloat1 == 0.0F) ? 0.0F : -1.5707964F); 
    float f1 = paramFloat1 / paramFloat2;
    float f2 = Math.abs(f1);
    float f3 = 3.1415927F;
    if (f2 < 1.0F) {
      f1 /= (0.28F * f1 * f1 + 1.0F);
      f2 = f1;
      if (paramFloat2 < 0.0F) {
        paramFloat2 = f3;
        if (paramFloat1 < 0.0F)
          paramFloat2 = -3.1415927F; 
        f2 = f1 + paramFloat2;
      } 
      return f2;
    } 
    f2 = 1.5707964F - f1 / (f1 * f1 + 0.28F);
    paramFloat2 = f2;
    if (paramFloat1 < 0.0F)
      paramFloat2 = f2 - 3.1415927F; 
    return paramFloat2;
  }
  
  public static int ceil(float paramFloat) {
    double d = paramFloat;
    Double.isNaN(d);
    return 16384 - (int)(16384.0D - d);
  }
  
  public static int ceilPositive(float paramFloat) {
    double d = paramFloat;
    Double.isNaN(d);
    return (int)(d + 0.9999999D);
  }
  
  public static double clamp(double paramDouble1, double paramDouble2, double paramDouble3) { return (paramDouble1 < paramDouble2) ? paramDouble2 : ((paramDouble1 > paramDouble3) ? paramDouble3 : paramDouble1); }
  
  public static float clamp(float paramFloat1, float paramFloat2, float paramFloat3) { return (paramFloat1 < paramFloat2) ? paramFloat2 : ((paramFloat1 > paramFloat3) ? paramFloat3 : paramFloat1); }
  
  public static int clamp(int paramInt1, int paramInt2, int paramInt3) { return (paramInt1 < paramInt2) ? paramInt2 : ((paramInt1 > paramInt3) ? paramInt3 : paramInt1); }
  
  public static long clamp(long paramLong1, long paramLong2, long paramLong3) { return (paramLong1 < paramLong2) ? paramLong2 : ((paramLong1 > paramLong3) ? paramLong3 : paramLong1); }
  
  public static short clamp(short paramShort1, short paramShort2, short paramShort3) { return (paramShort1 < paramShort2) ? paramShort2 : ((paramShort1 > paramShort3) ? paramShort3 : paramShort1); }
  
  public static float cos(float paramFloat) { return Sin.table[(int)((paramFloat + 1.5707964F) * 2607.5945F) & 0x3FFF]; }
  
  public static float cosDeg(float paramFloat) { return Sin.table[(int)((paramFloat + 90.0F) * 45.511112F) & 0x3FFF]; }
  
  public static int floor(float paramFloat) {
    double d = paramFloat;
    Double.isNaN(d);
    return (int)(d + 16384.0D) - 16384;
  }
  
  public static int floorPositive(float paramFloat) { return (int)paramFloat; }
  
  public static boolean isEqual(float paramFloat1, float paramFloat2) {
    boolean bool;
    if (Math.abs(paramFloat1 - paramFloat2) <= 1.0E-6F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean isEqual(float paramFloat1, float paramFloat2, float paramFloat3) {
    boolean bool;
    if (Math.abs(paramFloat1 - paramFloat2) <= paramFloat3) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean isPowerOfTwo(int paramInt) {
    boolean bool;
    if (paramInt != 0 && (paramInt & paramInt - 1) == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean isZero(float paramFloat) {
    boolean bool;
    if (Math.abs(paramFloat) <= 1.0E-6F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean isZero(float paramFloat1, float paramFloat2) {
    boolean bool;
    if (Math.abs(paramFloat1) <= paramFloat2) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static float lerp(float paramFloat1, float paramFloat2, float paramFloat3) { return paramFloat1 + (paramFloat2 - paramFloat1) * paramFloat3; }
  
  public static float lerpAngle(float paramFloat1, float paramFloat2, float paramFloat3) { return (paramFloat1 + ((paramFloat2 - paramFloat1 + 6.2831855F + 3.1415927F) % 6.2831855F - 3.1415927F) * paramFloat3 + 6.2831855F) % 6.2831855F; }
  
  public static float lerpAngleDeg(float paramFloat1, float paramFloat2, float paramFloat3) { return (paramFloat1 + ((paramFloat2 - paramFloat1 + 360.0F + 180.0F) % 360.0F - 180.0F) * paramFloat3 + 360.0F) % 360.0F; }
  
  public static float log(float paramFloat1, float paramFloat2) { return (float)(Math.log(paramFloat2) / Math.log(paramFloat1)); }
  
  public static float log2(float paramFloat) { return log(2.0F, paramFloat); }
  
  public static float map(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { return paramFloat3 + (paramFloat5 - paramFloat1) * (paramFloat4 - paramFloat3) / (paramFloat2 - paramFloat1); }
  
  public static int nextPowerOfTwo(int paramInt) {
    if (paramInt == 0)
      return 1; 
    paramInt = --paramInt | paramInt >> 1;
    paramInt |= paramInt >> 2;
    paramInt |= paramInt >> 4;
    paramInt |= paramInt >> 8;
    return (paramInt | paramInt >> 16) + 1;
  }
  
  public static float norm(float paramFloat1, float paramFloat2, float paramFloat3) { return (paramFloat3 - paramFloat1) / (paramFloat2 - paramFloat1); }
  
  public static float random() { return random.nextFloat(); }
  
  public static float random(float paramFloat) { return random.nextFloat() * paramFloat; }
  
  public static float random(float paramFloat1, float paramFloat2) { return paramFloat1 + random.nextFloat() * (paramFloat2 - paramFloat1); }
  
  public static int random(int paramInt) { return random.nextInt(paramInt + 1); }
  
  public static int random(int paramInt1, int paramInt2) { return paramInt1 + random.nextInt(paramInt2 - paramInt1 + 1); }
  
  public static long random(long paramLong) {
    double d1 = random.nextDouble();
    double d2 = paramLong;
    Double.isNaN(d2);
    return (long)(d1 * d2);
  }
  
  public static long random(long paramLong1, long paramLong2) {
    double d1 = random.nextDouble();
    double d2 = (paramLong2 - paramLong1);
    Double.isNaN(d2);
    return paramLong1 + (long)(d1 * d2);
  }
  
  public static boolean randomBoolean() { return random.nextBoolean(); }
  
  public static boolean randomBoolean(float paramFloat) {
    boolean bool;
    if (random() < paramFloat) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static int randomSign() { return random.nextInt() >> 31 | true; }
  
  public static float randomTriangular() { return random.nextFloat() - random.nextFloat(); }
  
  public static float randomTriangular(float paramFloat) { return (random.nextFloat() - random.nextFloat()) * paramFloat; }
  
  public static float randomTriangular(float paramFloat1, float paramFloat2) { return randomTriangular(paramFloat1, paramFloat2, (paramFloat1 + paramFloat2) * 0.5F); }
  
  public static float randomTriangular(float paramFloat1, float paramFloat2, float paramFloat3) {
    float f1 = random.nextFloat();
    float f2 = paramFloat2 - paramFloat1;
    float f3 = paramFloat3 - paramFloat1;
    return (f1 <= f3 / f2) ? (paramFloat1 + (float)Math.sqrt((f1 * f2 * f3))) : (paramFloat2 - (float)Math.sqrt(((1.0F - f1) * f2 * (paramFloat2 - paramFloat3))));
  }
  
  public static int round(float paramFloat) {
    double d = paramFloat;
    Double.isNaN(d);
    return (int)(d + 16384.5D) - 16384;
  }
  
  public static int roundPositive(float paramFloat) { return (int)(paramFloat + 0.5F); }
  
  public static float sin(float paramFloat) { return Sin.table[(int)(paramFloat * 2607.5945F) & 0x3FFF]; }
  
  public static float sinDeg(float paramFloat) { return Sin.table[(int)(paramFloat * 45.511112F) & 0x3FFF]; }
  
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/MathUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */