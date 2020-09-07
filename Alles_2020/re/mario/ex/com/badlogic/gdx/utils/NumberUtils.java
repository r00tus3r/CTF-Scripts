package com.badlogic.gdx.utils;

public final class NumberUtils {
  public static long doubleToLongBits(double paramDouble) { return Double.doubleToLongBits(paramDouble); }
  
  public static int floatToIntBits(float paramFloat) { return Float.floatToIntBits(paramFloat); }
  
  public static int floatToIntColor(float paramFloat) {
    int i = Float.floatToRawIntBits(paramFloat);
    return i | (int)((i >>> 24) * 1.003937F) << 24;
  }
  
  public static int floatToRawIntBits(float paramFloat) { return Float.floatToRawIntBits(paramFloat); }
  
  public static float intBitsToFloat(int paramInt) { return Float.intBitsToFloat(paramInt); }
  
  public static float intToFloatColor(int paramInt) { return Float.intBitsToFloat(paramInt & 0xFEFFFFFF); }
  
  public static double longBitsToDouble(long paramLong) { return Double.longBitsToDouble(paramLong); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/NumberUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */