package com.badlogic.gdx.utils;

import java.io.DataInput;
import java.io.DataInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public class LittleEndianInputStream extends FilterInputStream implements DataInput {
  private DataInputStream din;
  
  public LittleEndianInputStream(InputStream paramInputStream) {
    super(paramInputStream);
    this.din = new DataInputStream(paramInputStream);
  }
  
  public boolean readBoolean() throws IOException { return this.din.readBoolean(); }
  
  public byte readByte() throws IOException { return this.din.readByte(); }
  
  public char readChar() throws IOException { return this.din.readChar(); }
  
  public double readDouble() throws IOException { return Double.longBitsToDouble(readLong()); }
  
  public float readFloat() throws IOException { return Float.intBitsToFloat(readInt()); }
  
  public void readFully(byte[] paramArrayOfByte) throws IOException { this.din.readFully(paramArrayOfByte); }
  
  public void readFully(byte[] paramArrayOfByte, int paramInt1, int paramInt2) throws IOException { this.din.readFully(paramArrayOfByte, paramInt1, paramInt2); }
  
  public int readInt() throws IOException {
    int[] arrayOfInt = new int[4];
    int i;
    for (i = 3; i >= 0; i--)
      arrayOfInt[i] = this.din.read(); 
    int j = arrayOfInt[0];
    int k = arrayOfInt[1];
    i = arrayOfInt[2];
    return arrayOfInt[3] & 0xFF | (j & 0xFF) << 24 | (k & 0xFF) << 16 | (i & 0xFF) << 8;
  }
  
  public final String readLine() throws IOException { return this.din.readLine(); }
  
  public long readLong() throws IOException {
    int[] arrayOfInt = new int[8];
    for (byte b = 7; b >= 0; b--)
      arrayOfInt[b] = this.din.read(); 
    long l1 = (arrayOfInt[0] & 0xFF);
    long l2 = (arrayOfInt[1] & 0xFF);
    long l3 = (arrayOfInt[2] & 0xFF);
    long l4 = (arrayOfInt[3] & 0xFF);
    long l5 = (arrayOfInt[4] & 0xFF);
    long l6 = (arrayOfInt[5] & 0xFF);
    long l7 = (arrayOfInt[6] & 0xFF);
    return (arrayOfInt[7] & 0xFF) | l1 << 56 | l2 << 48 | l3 << 40 | l4 << 32 | l5 << 24 | l6 << 16 | l7 << 8;
  }
  
  public short readShort() throws IOException { return (short)(this.din.read() & 0xFF | this.din.read() << 8); }
  
  public String readUTF() throws IOException { return this.din.readUTF(); }
  
  public int readUnsignedByte() throws IOException { return this.din.readUnsignedByte(); }
  
  public int readUnsignedShort() throws IOException { return this.din.read() & 0xFF | (this.din.read() & 0xFF) << 8; }
  
  public int skipBytes(int paramInt) throws IOException { return this.din.skipBytes(paramInt); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/LittleEndianInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */