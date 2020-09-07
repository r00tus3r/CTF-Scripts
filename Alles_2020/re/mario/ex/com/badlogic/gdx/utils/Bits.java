package com.badlogic.gdx.utils;

public class Bits {
  long[] bits = { 0L };
  
  public Bits() {}
  
  public Bits(int paramInt) { checkCapacity(paramInt >>> 6); }
  
  private void checkCapacity(int paramInt) {
    long[] arrayOfLong = this.bits;
    if (paramInt >= arrayOfLong.length) {
      long[] arrayOfLong1 = new long[paramInt + 1];
      System.arraycopy(arrayOfLong, 0, arrayOfLong1, 0, arrayOfLong.length);
      this.bits = arrayOfLong1;
    } 
  }
  
  public void and(Bits paramBits) {
    int i = Math.min(this.bits.length, paramBits.bits.length);
    int j;
    for (j = 0; i > j; j++) {
      long[] arrayOfLong1 = this.bits;
      arrayOfLong1[j] = arrayOfLong1[j] & paramBits.bits[j];
    } 
    long[] arrayOfLong = this.bits;
    if (arrayOfLong.length > i) {
      int k = arrayOfLong.length;
      for (j = i; k > j; j++)
        this.bits[j] = 0L; 
    } 
  }
  
  public void andNot(Bits paramBits) {
    int i = this.bits.length;
    int j = paramBits.bits.length;
    for (byte b = 0; b < i && b < j; b++) {
      long[] arrayOfLong = this.bits;
      arrayOfLong[b] = arrayOfLong[b] & (paramBits.bits[b] ^ 0xFFFFFFFFFFFFFFFFL);
    } 
  }
  
  public void clear() {
    long[] arrayOfLong = this.bits;
    int i = arrayOfLong.length;
    for (byte b = 0; b < i; b++)
      arrayOfLong[b] = 0L; 
  }
  
  public void clear(int paramInt) {
    int i = paramInt >>> 6;
    long[] arrayOfLong = this.bits;
    if (i >= arrayOfLong.length)
      return; 
    arrayOfLong[i] = arrayOfLong[i] & (1L << (paramInt & 0x3F) ^ 0xFFFFFFFFFFFFFFFFL);
  }
  
  public boolean containsAll(Bits paramBits) {
    long[] arrayOfLong2 = this.bits;
    long[] arrayOfLong1 = paramBits.bits;
    int i = arrayOfLong1.length;
    int j = arrayOfLong2.length;
    int k;
    for (k = j; k < i; k++) {
      if (arrayOfLong1[k] != 0L)
        return false; 
    } 
    for (k = Math.min(j, i) - 1; k >= 0; k--) {
      if ((arrayOfLong2[k] & arrayOfLong1[k]) != arrayOfLong1[k])
        return false; 
    } 
    return true;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = true;
    if (this == paramObject)
      return true; 
    if (paramObject == null)
      return false; 
    if (getClass() != paramObject.getClass())
      return false; 
    paramObject = (Bits)paramObject;
    long[] arrayOfLong = paramObject.bits;
    int i = Math.min(this.bits.length, arrayOfLong.length);
    for (byte b = 0; i > b; b++) {
      if (this.bits[b] != arrayOfLong[b])
        return false; 
    } 
    if (this.bits.length == arrayOfLong.length)
      return true; 
    if (length() != paramObject.length())
      bool = false; 
    return bool;
  }
  
  public void flip(int paramInt) {
    int i = paramInt >>> 6;
    checkCapacity(i);
    long[] arrayOfLong = this.bits;
    arrayOfLong[i] = arrayOfLong[i] ^ 1L << (paramInt & 0x3F);
  }
  
  public boolean get(int paramInt) {
    int i = paramInt >>> 6;
    long[] arrayOfLong = this.bits;
    int j = arrayOfLong.length;
    boolean bool = false;
    if (i >= j)
      return false; 
    if ((arrayOfLong[i] & 1L << (paramInt & 0x3F)) != 0L)
      bool = true; 
    return bool;
  }
  
  public boolean getAndClear(int paramInt) {
    int i = paramInt >>> 6;
    long[] arrayOfLong = this.bits;
    int j = arrayOfLong.length;
    boolean bool = false;
    if (i >= j)
      return false; 
    long l = arrayOfLong[i];
    arrayOfLong[i] = arrayOfLong[i] & (1L << (paramInt & 0x3F) ^ 0xFFFFFFFFFFFFFFFFL);
    if (arrayOfLong[i] != l)
      bool = true; 
    return bool;
  }
  
  public boolean getAndSet(int paramInt) {
    boolean bool;
    int i = paramInt >>> 6;
    checkCapacity(i);
    long[] arrayOfLong = this.bits;
    long l = arrayOfLong[i];
    arrayOfLong[i] = arrayOfLong[i] | 1L << (paramInt & 0x3F);
    if (arrayOfLong[i] == l) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int hashCode() {
    int i = length();
    byte b = 0;
    int j = 0;
    while (i >>> 6 >= b) {
      long[] arrayOfLong = this.bits;
      j = j * 127 + (int)(arrayOfLong[b] ^ arrayOfLong[b] >>> 32);
      b++;
    } 
    return j;
  }
  
  public boolean intersects(Bits paramBits) {
    long[] arrayOfLong2 = this.bits;
    long[] arrayOfLong1 = paramBits.bits;
    for (int i = Math.min(arrayOfLong2.length, arrayOfLong1.length) - 1; i >= 0; i--) {
      if ((arrayOfLong2[i] & arrayOfLong1[i]) != 0L)
        return true; 
    } 
    return false;
  }
  
  public boolean isEmpty() {
    long[] arrayOfLong = this.bits;
    int i = arrayOfLong.length;
    for (byte b = 0; b < i; b++) {
      if (arrayOfLong[b] != 0L)
        return false; 
    } 
    return true;
  }
  
  public int length() {
    long[] arrayOfLong = this.bits;
    for (int i = arrayOfLong.length - 1; i >= 0; i--) {
      long l = arrayOfLong[i];
      if (l != 0L)
        for (int j = 63; j >= 0; j--) {
          if ((1L << (j & 0x3F) & l) != 0L)
            return (i << 6) + j + 1; 
        }  
    } 
    return 0;
  }
  
  public int nextClearBit(int paramInt) {
    int k;
    long[] arrayOfLong = this.bits;
    int i = paramInt >>> 6;
    int j = arrayOfLong.length;
    if (i >= j) {
      paramInt = arrayOfLong.length;
      return paramInt << 6;
    } 
    long l = arrayOfLong[i];
    paramInt &= 0x3F;
    while (true) {
      k = i;
      if (paramInt < 64) {
        if ((1L << (paramInt & 0x3F) & l) != 0L) {
          paramInt++;
          continue;
        } 
        return (i << 6) + paramInt;
      } 
      break;
    } 
    label28: while (true) {
      i = k + 1;
      if (i < j) {
        if (i == 0)
          return i << 6; 
        l = arrayOfLong[i];
        paramInt = 0;
        while (true) {
          k = i;
          if (paramInt < 64) {
            if ((1L << (paramInt & 0x3F) & l) != 0L) {
              paramInt++;
              continue;
            } 
            return (i << 6) + paramInt;
          } 
          continue label28;
        } 
      } 
      break;
    } 
    paramInt = arrayOfLong.length;
    return paramInt << 6;
  }
  
  public int nextSetBit(int paramInt) {
    long[] arrayOfLong = this.bits;
    int i = paramInt >>> 6;
    int j = arrayOfLong.length;
    if (i >= j)
      return -1; 
    long l = arrayOfLong[i];
    int k = i;
    if (l != 0L) {
      paramInt &= 0x3F;
      while (true) {
        k = i;
        if (paramInt < 64) {
          if ((1L << (paramInt & 0x3F) & l) == 0L) {
            paramInt++;
            continue;
          } 
          return (i << 6) + paramInt;
        } 
        break;
      } 
    } 
    label30: while (true) {
      i = k + 1;
      if (i < j) {
        k = i;
        if (i != 0) {
          l = arrayOfLong[i];
          k = i;
          if (l != 0L) {
            paramInt = 0;
            while (true) {
              k = i;
              if (paramInt < 64) {
                if ((1L << (paramInt & 0x3F) & l) == 0L) {
                  paramInt++;
                  continue;
                } 
                return (i << 6) + paramInt;
              } 
              continue label30;
            } 
          } 
        } 
        continue;
      } 
      break;
    } 
    return -1;
  }
  
  public boolean notEmpty() { return isEmpty() ^ true; }
  
  public int numBits() { return this.bits.length << 6; }
  
  public void or(Bits paramBits) {
    int i = Math.min(this.bits.length, paramBits.bits.length);
    int j;
    for (j = 0; i > j; j++) {
      long[] arrayOfLong1 = this.bits;
      arrayOfLong1[j] = arrayOfLong1[j] | paramBits.bits[j];
    } 
    long[] arrayOfLong = paramBits.bits;
    if (i < arrayOfLong.length) {
      checkCapacity(arrayOfLong.length);
      int k = paramBits.bits.length;
      for (j = i; k > j; j++)
        this.bits[j] = paramBits.bits[j]; 
    } 
  }
  
  public void set(int paramInt) {
    int i = paramInt >>> 6;
    checkCapacity(i);
    long[] arrayOfLong = this.bits;
    arrayOfLong[i] = arrayOfLong[i] | 1L << (paramInt & 0x3F);
  }
  
  public void xor(Bits paramBits) {
    int i = Math.min(this.bits.length, paramBits.bits.length);
    int j;
    for (j = 0; i > j; j++) {
      long[] arrayOfLong1 = this.bits;
      arrayOfLong1[j] = arrayOfLong1[j] ^ paramBits.bits[j];
    } 
    long[] arrayOfLong = paramBits.bits;
    if (i < arrayOfLong.length) {
      checkCapacity(arrayOfLong.length);
      int k = paramBits.bits.length;
      for (j = i; k > j; j++)
        this.bits[j] = paramBits.bits[j]; 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Bits.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */