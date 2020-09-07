package com.badlogic.gdx.utils;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class DataOutput extends DataOutputStream {
  public DataOutput(OutputStream paramOutputStream) { super(paramOutputStream); }
  
  private void writeString_slow(String paramString, int paramInt1, int paramInt2) throws IOException {
    while (paramInt2 < paramInt1) {
      char c = paramString.charAt(paramInt2);
      if (c <= '') {
        write((byte)c);
      } else if (c > '߿') {
        write((byte)(c >> '\f' & 0xF | 0xE0));
        write((byte)(c >> '\006' & 0x3F | 0x80));
        write((byte)(c & 0x3F | 0x80));
      } else {
        write((byte)(c >> '\006' & 0x1F | 0xC0));
        write((byte)(c & 0x3F | 0x80));
      } 
      paramInt2++;
    } 
  }
  
  public int writeInt(int paramInt, boolean paramBoolean) throws IOException {
    int i = paramInt;
    if (!paramBoolean)
      i = paramInt >> 31 ^ paramInt << 1; 
    int j = i >>> 7;
    if (j == 0) {
      write((byte)i);
      return 1;
    } 
    write((byte)(i & 0x7F | 0x80));
    paramInt = i >>> 14;
    if (paramInt == 0) {
      write((byte)j);
      return 2;
    } 
    write((byte)(j | 0x80));
    j = i >>> 21;
    if (j == 0) {
      write((byte)paramInt);
      return 3;
    } 
    write((byte)(paramInt | 0x80));
    paramInt = i >>> 28;
    if (paramInt == 0) {
      write((byte)j);
      return 4;
    } 
    write((byte)(j | 0x80));
    write((byte)paramInt);
    return 5;
  }
  
  public void writeString(String paramString) throws IOException {
    byte b = 0;
    if (paramString == null) {
      write(0);
      return;
    } 
    int i = paramString.length();
    if (i == 0) {
      writeByte(1);
      return;
    } 
    writeInt(i + 1, true);
    while (b < i) {
      char c = paramString.charAt(b);
      if (c > '')
        break; 
      write((byte)c);
      b++;
    } 
    if (b < i)
      writeString_slow(paramString, i, b); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/DataOutput.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */