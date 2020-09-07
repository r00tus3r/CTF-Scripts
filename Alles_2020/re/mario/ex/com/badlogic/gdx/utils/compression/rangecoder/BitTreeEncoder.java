package com.badlogic.gdx.utils.compression.rangecoder;

import java.io.IOException;

public class BitTreeEncoder {
  short[] Models;
  
  int NumBitLevels;
  
  public BitTreeEncoder(int paramInt) {
    this.NumBitLevels = paramInt;
    this.Models = new short[1 << paramInt];
  }
  
  public static void ReverseEncode(short[] paramArrayOfShort, int paramInt1, Encoder paramEncoder, int paramInt2, int paramInt3) throws IOException {
    byte b = 0;
    int i = 1;
    while (b < paramInt2) {
      int j = paramInt3 & true;
      paramEncoder.Encode(paramArrayOfShort, paramInt1 + i, j);
      i = i << 1 | j;
      paramInt3 >>= 1;
      b++;
    } 
  }
  
  public static int ReverseGetPrice(short[] paramArrayOfShort, int paramInt1, int paramInt2, int paramInt3) {
    int i = 0;
    int j = 1;
    int k = paramInt3;
    paramInt3 = j;
    while (paramInt2 != 0) {
      j = k & true;
      k >>>= 1;
      i += Encoder.GetPrice(paramArrayOfShort[paramInt1 + paramInt3], j);
      paramInt3 = paramInt3 << 1 | j;
      paramInt2--;
    } 
    return i;
  }
  
  public void Encode(Encoder paramEncoder, int paramInt) throws IOException {
    int i = this.NumBitLevels;
    int j;
    for (j = 1; i != 0; j = j << 1 | k) {
      int k = paramInt >>> --i & true;
      paramEncoder.Encode(this.Models, j, k);
    } 
  }
  
  public int GetPrice(int paramInt) {
    int i = this.NumBitLevels;
    int j = 0;
    int k;
    for (k = 1; i != 0; k = (k << true) + m) {
      int m = paramInt >>> --i & true;
      j += Encoder.GetPrice(this.Models[k], m);
    } 
    return j;
  }
  
  public void Init() { Decoder.InitBitModels(this.Models); }
  
  public void ReverseEncode(Encoder paramEncoder, int paramInt) throws IOException {
    byte b = 0;
    int i = 1;
    while (b < this.NumBitLevels) {
      int j = paramInt & true;
      paramEncoder.Encode(this.Models, i, j);
      i = i << 1 | j;
      paramInt >>= 1;
      b++;
    } 
  }
  
  public int ReverseGetPrice(int paramInt) {
    int i = this.NumBitLevels;
    int j = 0;
    int k = 1;
    int m = paramInt;
    paramInt = k;
    while (i != 0) {
      k = m & true;
      m >>>= 1;
      j += Encoder.GetPrice(this.Models[paramInt], k);
      paramInt = paramInt << 1 | k;
      i--;
    } 
    return j;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */