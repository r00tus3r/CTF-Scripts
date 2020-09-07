package com.badlogic.gdx.math;

import java.util.Random;

public class RandomXS128 extends Random {
  private static final double NORM_DOUBLE = 1.1102230246251565E-16D;
  
  private static final double NORM_FLOAT = 5.9604644775390625E-8D;
  
  private long seed0;
  
  private long seed1;
  
  public RandomXS128() { setSeed((new Random()).nextLong()); }
  
  public RandomXS128(long paramLong) { setSeed(paramLong); }
  
  public RandomXS128(long paramLong1, long paramLong2) { setState(paramLong1, paramLong2); }
  
  private static final long murmurHash3(long paramLong) {
    paramLong = (paramLong ^ paramLong >>> 33) * -49064778989728563L;
    paramLong = (paramLong ^ paramLong >>> 33) * -4265267296055464877L;
    return paramLong ^ paramLong >>> 33;
  }
  
  public long getState(int paramInt) {
    long l;
    if (paramInt == 0) {
      l = this.seed0;
    } else {
      l = this.seed1;
    } 
    return l;
  }
  
  protected final int next(int paramInt) { return (int)(nextLong() & (1L << paramInt) - 1L); }
  
  public boolean nextBoolean() {
    boolean bool;
    if ((nextLong() & 0x1L) != 0L) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void nextBytes(byte[] paramArrayOfByte) {
    int i = paramArrayOfByte.length;
    label15: while (i != 0) {
      if (i < 8) {
        j = i;
      } else {
        j = 8;
      } 
      long l = nextLong();
      byte b = j;
      int j = i;
      while (true) {
        i = j;
        if (b != 0) {
          paramArrayOfByte[--j] = (byte)(byte)(int)l;
          l >>= 8;
          b--;
          continue;
        } 
        continue label15;
      } 
    } 
  }
  
  public double nextDouble() {
    double d = (nextLong() >>> 11);
    Double.isNaN(d);
    return d * 1.1102230246251565E-16D;
  }
  
  public float nextFloat() {
    double d = (nextLong() >>> 40);
    Double.isNaN(d);
    return (float)(d * 5.9604644775390625E-8D);
  }
  
  public int nextInt() { return (int)nextLong(); }
  
  public int nextInt(int paramInt) { return (int)nextLong(paramInt); }
  
  public long nextLong() {
    long l1 = this.seed0;
    long l2 = this.seed1;
    this.seed0 = l2;
    l1 ^= l1 << 23;
    l1 = l1 >>> 17 ^ l1 ^ l2 ^ l2 >>> 26;
    this.seed1 = l1;
    return l1 + l2;
  }
  
  public long nextLong(long paramLong) {
    if (paramLong > 0L) {
      long l2;
      long l1;
      do {
        l1 = nextLong() >>> true;
        l2 = l1 % paramLong;
      } while (l1 - l2 + paramLong - 1L < 0L);
      return l2;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("n must be positive");
    throw illegalArgumentException;
  }
  
  public void setSeed(long paramLong) {
    long l = paramLong;
    if (paramLong == 0L)
      l = Float.MIN_VALUE; 
    paramLong = murmurHash3(l);
    setState(paramLong, murmurHash3(paramLong));
  }
  
  public void setState(long paramLong1, long paramLong2) {
    this.seed0 = paramLong1;
    this.seed1 = paramLong2;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/RandomXS128.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */