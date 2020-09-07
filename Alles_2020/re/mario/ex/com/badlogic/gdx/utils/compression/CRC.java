package com.badlogic.gdx.utils.compression;

public class CRC {
  public static int[] Table = new int[256];
  
  int _value = -1;
  
  static  {
    for (byte b = 0; b < 'Ā'; b++) {
      int i = b;
      for (byte b1 = 0; b1 < 8; b1++) {
        if (i & true) {
          i = i >>> true ^ 0xEDB88320;
        } else {
          i >>>= 1;
        } 
      } 
      Table[b] = i;
    } 
  }
  
  public int GetDigest() { return this._value ^ 0xFFFFFFFF; }
  
  public void Init() { this._value = -1; }
  
  public void Update(byte[] paramArrayOfByte) {
    int i = paramArrayOfByte.length;
    for (byte b = 0; b < i; b++) {
      int[] arrayOfInt = Table;
      int j = this._value;
      this._value = arrayOfInt[(paramArrayOfByte[b] ^ j) & 0xFF] ^ j >>> 8;
    } 
  }
  
  public void Update(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
    for (int i = 0; i < paramInt2; i++) {
      int[] arrayOfInt = Table;
      int j = this._value;
      this._value = arrayOfInt[(paramArrayOfByte[paramInt1 + i] ^ j) & 0xFF] ^ j >>> 8;
    } 
  }
  
  public void UpdateByte(int paramInt) {
    int[] arrayOfInt = Table;
    int i = this._value;
    this._value = arrayOfInt[(paramInt ^ i) & 0xFF] ^ i >>> 8;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/CRC.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */