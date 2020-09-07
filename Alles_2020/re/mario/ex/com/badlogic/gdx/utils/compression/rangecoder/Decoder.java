package com.badlogic.gdx.utils.compression.rangecoder;

import java.io.IOException;
import java.io.InputStream;

public class Decoder {
  static final int kBitModelTotal = 2048;
  
  static final int kNumBitModelTotalBits = 11;
  
  static final int kNumMoveBits = 5;
  
  static final int kTopMask = -16777216;
  
  int Code;
  
  int Range;
  
  InputStream Stream;
  
  public static void InitBitModels(short[] paramArrayOfShort) {
    for (byte b = 0; b < paramArrayOfShort.length; b++)
      paramArrayOfShort[b] = (short)1024; 
  }
  
  public int DecodeBit(short[] paramArrayOfShort, int paramInt) throws IOException {
    short s = paramArrayOfShort[paramInt];
    int i = this.Range;
    int j = (i >>> 11) * s;
    int k = this.Code;
    if ((k ^ 0x80000000) < (0x80000000 ^ j)) {
      this.Range = j;
      paramArrayOfShort[paramInt] = (short)(short)(s + (2048 - s >>> 5));
      if ((this.Range & 0xFF000000) == 0) {
        this.Code = k << 8 | this.Stream.read();
        this.Range <<= 8;
      } 
      return 0;
    } 
    this.Range = i - j;
    this.Code = k - j;
    paramArrayOfShort[paramInt] = (short)(short)(s - (s >>> 5));
    if ((this.Range & 0xFF000000) == 0) {
      this.Code = this.Code << 8 | this.Stream.read();
      this.Range <<= 8;
    } 
    return 1;
  }
  
  public final int DecodeDirectBits(int paramInt) throws IOException {
    int i = 0;
    while (paramInt != 0) {
      this.Range >>>= 1;
      int j = this.Code;
      int k = this.Range;
      int m = j - k >>> 31;
      this.Code = j - (m - 1 & k);
      i = i << true | 1 - m;
      if ((0xFF000000 & k) == 0) {
        this.Code = this.Code << 8 | this.Stream.read();
        this.Range <<= 8;
      } 
      paramInt--;
    } 
    return i;
  }
  
  public final void Init() {
    byte b = 0;
    this.Code = 0;
    this.Range = -1;
    while (b < 5) {
      this.Code = this.Code << 8 | this.Stream.read();
      b++;
    } 
  }
  
  public final void ReleaseStream() { this.Stream = null; }
  
  public final void SetStream(InputStream paramInputStream) { this.Stream = paramInputStream; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/rangecoder/Decoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */