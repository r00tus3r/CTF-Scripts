package com.badlogic.gdx.utils.compression.rangecoder;

import java.io.IOException;
import java.io.OutputStream;

public class Encoder {
  private static int[] ProbPrices = new int[512];
  
  static final int kBitModelTotal = 2048;
  
  static final int kNumBitModelTotalBits = 11;
  
  public static final int kNumBitPriceShiftBits = 6;
  
  static final int kNumMoveBits = 5;
  
  static final int kNumMoveReducingBits = 2;
  
  static final int kTopMask = -16777216;
  
  long Low;
  
  int Range;
  
  OutputStream Stream;
  
  int _cache;
  
  int _cacheSize;
  
  long _position;
  
  static  {
    for (byte b = 8; b >= 0; b--) {
      byte b1 = 9 - b;
      byte b2 = b1 - 1;
      byte b3 = 1 << b2;
      b1 = 1 << b1;
      while (b3 < b1) {
        ProbPrices[b3] = (b << 6) + (b1 - b3 << 6 >>> b2);
        b3++;
      } 
    } 
  }
  
  public static int GetPrice(int paramInt1, int paramInt2) { return ProbPrices[((paramInt1 - paramInt2 ^ -paramInt2) & 0x7FF) >>> 2]; }
  
  public static int GetPrice0(int paramInt) { return ProbPrices[paramInt >>> 2]; }
  
  public static int GetPrice1(int paramInt) { return ProbPrices[2048 - paramInt >>> 2]; }
  
  public static void InitBitModels(short[] paramArrayOfShort) {
    for (byte b = 0; b < paramArrayOfShort.length; b++)
      paramArrayOfShort[b] = (short)1024; 
  }
  
  public void Encode(short[] paramArrayOfShort, int paramInt1, int paramInt2) throws IOException {
    short s = paramArrayOfShort[paramInt1];
    int i = this.Range;
    int j = (i >>> 11) * s;
    if (paramInt2 == 0) {
      this.Range = j;
      paramArrayOfShort[paramInt1] = (short)(short)(s + (2048 - s >>> 5));
    } else {
      this.Low += (j & 0xFFFFFFFFL);
      this.Range = i - j;
      paramArrayOfShort[paramInt1] = (short)(short)(s - (s >>> 5));
    } 
    paramInt1 = this.Range;
    if ((0xFF000000 & paramInt1) == 0) {
      this.Range = paramInt1 << 8;
      ShiftLow();
    } 
  }
  
  public void EncodeDirectBits(int paramInt1, int paramInt2) throws IOException {
    while (--paramInt2 >= 0) {
      this.Range >>>= 1;
      if ((paramInt1 >>> paramInt2 & true) == 1)
        this.Low += this.Range; 
      int i = this.Range;
      if ((0xFF000000 & i) == 0) {
        this.Range = i << 8;
        ShiftLow();
      } 
      paramInt2--;
    } 
  }
  
  public void FlushData() {
    for (byte b = 0; b < 5; b++)
      ShiftLow(); 
  }
  
  public void FlushStream() { this.Stream.flush(); }
  
  public long GetProcessedSizeAdd() { return this._cacheSize + this._position + 4L; }
  
  public void Init() {
    this._position = 0L;
    this.Low = 0L;
    this.Range = -1;
    this._cacheSize = 1;
    this._cache = 0;
  }
  
  public void ReleaseStream() { this.Stream = null; }
  
  public void SetStream(OutputStream paramOutputStream) { this.Stream = paramOutputStream; }
  
  public void ShiftLow() {
    long l = this.Low;
    int i = (int)(l >>> 32);
    if (i != 0 || l < 4278190080L) {
      int k;
      this._position += this._cacheSize;
      int j = this._cache;
      do {
        this.Stream.write(j + i);
        j = 255;
        k = this._cacheSize - 1;
        this._cacheSize = k;
      } while (k != 0);
      this._cache = (int)this.Low >>> 24;
    } 
    this._cacheSize++;
    this.Low = (this.Low & 0xFFFFFFL) << 8;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/rangecoder/Encoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */