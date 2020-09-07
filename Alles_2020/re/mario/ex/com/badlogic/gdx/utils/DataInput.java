package com.badlogic.gdx.utils;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

public class DataInput extends DataInputStream {
  private char[] chars = new char[32];
  
  public DataInput(InputStream paramInputStream) { super(paramInputStream); }
  
  private void readUtf8_slow(int paramInt1, int paramInt2, int paramInt3) throws IOException {
    char[] arrayOfChar = this.chars;
    while (true) {
      switch (paramInt3 >> 4) {
        case 14:
          arrayOfChar[paramInt2] = (char)(char)((paramInt3 & 0xF) << 12 | (read() & 0x3F) << 6 | read() & 0x3F);
          break;
        case 12:
        case 13:
          arrayOfChar[paramInt2] = (char)(char)((paramInt3 & 0x1F) << 6 | read() & 0x3F);
          break;
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
          arrayOfChar[paramInt2] = (char)(char)paramInt3;
          break;
      } 
      if (++paramInt2 >= paramInt1)
        return; 
      paramInt3 = read() & 0xFF;
    } 
  }
  
  public int readInt(boolean paramBoolean) throws IOException {
    int i = read();
    int j = i & 0x7F;
    int k = j;
    if ((i & 0x80) != 0) {
      i = read();
      j |= (i & 0x7F) << 7;
      k = j;
      if ((i & 0x80) != 0) {
        i = read();
        j |= (i & 0x7F) << 14;
        k = j;
        if ((i & 0x80) != 0) {
          i = read();
          j |= (i & 0x7F) << 21;
          k = j;
          if ((i & 0x80) != 0)
            k = j | (read() & 0x7F) << 28; 
        } 
      } 
    } 
    if (!paramBoolean)
      k = k >>> 1 ^ -(k & true); 
    return k;
  }
  
  public String readString() throws IOException {
    int i = readInt(true);
    if (i != 0) {
      if (i != 1) {
        int j = i - 1;
        if (this.chars.length < j)
          this.chars = new char[j]; 
        char[] arrayOfChar = this.chars;
        byte b = 0;
        i = 0;
        while (b < j) {
          i = read();
          if (i > 127)
            break; 
          arrayOfChar[b] = (char)(char)i;
          b++;
        } 
        if (b < j)
          readUtf8_slow(j, b, i); 
        return new String(arrayOfChar, false, j);
      } 
      return "";
    } 
    return null;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/DataInput.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */