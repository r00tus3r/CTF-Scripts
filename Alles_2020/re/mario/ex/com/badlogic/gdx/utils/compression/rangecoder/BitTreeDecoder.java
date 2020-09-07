package com.badlogic.gdx.utils.compression.rangecoder;

import java.io.IOException;

public class BitTreeDecoder {
  short[] Models;
  
  int NumBitLevels;
  
  public BitTreeDecoder(int paramInt) {
    this.NumBitLevels = paramInt;
    this.Models = new short[1 << paramInt];
  }
  
  public static int ReverseDecode(short[] paramArrayOfShort, int paramInt1, Decoder paramDecoder, int paramInt2) throws IOException {
    int i = 0;
    int j = 0;
    int k = 1;
    while (i < paramInt2) {
      int m = paramDecoder.DecodeBit(paramArrayOfShort, paramInt1 + k);
      k = (k << 1) + m;
      j |= m << i;
      i++;
    } 
    return j;
  }
  
  public int Decode(Decoder paramDecoder) throws IOException {
    int i = this.NumBitLevels;
    int j = 1;
    while (i != 0) {
      j = paramDecoder.DecodeBit(this.Models, j) + (j << 1);
      i--;
    } 
    return j - (1 << this.NumBitLevels);
  }
  
  public void Init() { Decoder.InitBitModels(this.Models); }
  
  public int ReverseDecode(Decoder paramDecoder) throws IOException {
    int i = 0;
    int j = 0;
    int k = 1;
    while (i < this.NumBitLevels) {
      int m = paramDecoder.DecodeBit(this.Models, k);
      k = (k << 1) + m;
      j |= m << i;
      i++;
    } 
    return j;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */