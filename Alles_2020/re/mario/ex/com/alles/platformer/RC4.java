package com.alles.platformer;

public class RC4 {
  private final byte[] S = new byte[256];
  
  private final byte[] T = new byte[256];
  
  private final int keylen;
  
  public RC4(byte[] paramArrayOfByte) {
    if (paramArrayOfByte.length >= 1 && paramArrayOfByte.length <= 256) {
      this.keylen = paramArrayOfByte.length;
      int i = 0;
      int j;
      for (j = 0; j < 256; j++) {
        this.S[j] = (byte)(byte)j;
        this.T[j] = (byte)paramArrayOfByte[j % this.keylen];
      } 
      byte b = 0;
      for (j = i; j < 256; j++) {
        paramArrayOfByte = this.S;
        b = b + paramArrayOfByte[j] + this.T[j] & 0xFF;
        i = paramArrayOfByte[b];
        paramArrayOfByte[b] = (byte)paramArrayOfByte[j];
        paramArrayOfByte[j] = (byte)i;
      } 
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("key must be between 1 and 256 bytes");
    throw illegalArgumentException;
  }
  
  public byte[] decrypt(byte[] paramArrayOfByte) { return encrypt(paramArrayOfByte); }
  
  public byte[] encrypt(byte[] paramArrayOfByte) {
    byte[] arrayOfByte = new byte[paramArrayOfByte.length];
    byte b = 0;
    char c = Character.MIN_VALUE;
    byte b1 = 0;
    while (b < paramArrayOfByte.length) {
      c = c + true & 0xFF;
      byte[] arrayOfByte1 = this.S;
      b1 = b1 + arrayOfByte1[c] & 0xFF;
      byte b2 = arrayOfByte1[b1];
      arrayOfByte1[b1] = (byte)arrayOfByte1[c];
      arrayOfByte1[c] = (byte)b2;
      arrayOfByte[b] = (byte)(byte)(arrayOfByte1[arrayOfByte1[c] + arrayOfByte1[b1] & 0xFF] ^ paramArrayOfByte[b]);
      b++;
    } 
    return arrayOfByte;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/alles/platformer/RC4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */