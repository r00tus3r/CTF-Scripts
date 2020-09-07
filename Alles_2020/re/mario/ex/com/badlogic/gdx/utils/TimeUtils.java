package com.badlogic.gdx.utils;

public final class TimeUtils {
  private static final long nanosPerMilli = 1000000L;
  
  public static long millis() { return System.currentTimeMillis(); }
  
  public static long millisToNanos(long paramLong) { return paramLong * 1000000L; }
  
  public static long nanoTime() { return System.nanoTime(); }
  
  public static long nanosToMillis(long paramLong) { return paramLong / 1000000L; }
  
  public static long timeSinceMillis(long paramLong) { return millis() - paramLong; }
  
  public static long timeSinceNanos(long paramLong) { return nanoTime() - paramLong; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/TimeUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */