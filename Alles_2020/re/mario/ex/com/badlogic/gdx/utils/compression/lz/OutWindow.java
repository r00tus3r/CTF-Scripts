package com.badlogic.gdx.utils.compression.lz;

import java.io.IOException;
import java.io.OutputStream;

public class OutWindow {
  byte[] _buffer;
  
  int _pos;
  
  OutputStream _stream;
  
  int _streamPos;
  
  int _windowSize = 0;
  
  public void CopyBlock(int paramInt1, int paramInt2) throws IOException {
    int i = this._pos - paramInt1 - 1;
    paramInt1 = i;
    int j = paramInt2;
    if (i < 0) {
      paramInt1 = i + this._windowSize;
      j = paramInt2;
    } 
    while (j != 0) {
      paramInt2 = paramInt1;
      if (paramInt1 >= this._windowSize)
        paramInt2 = 0; 
      byte[] arrayOfByte = this._buffer;
      paramInt1 = this._pos;
      this._pos = paramInt1 + 1;
      arrayOfByte[paramInt1] = (byte)arrayOfByte[paramInt2];
      if (this._pos >= this._windowSize)
        Flush(); 
      j--;
      paramInt1 = paramInt2 + 1;
    } 
  }
  
  public void Create(int paramInt) {
    if (this._buffer == null || this._windowSize != paramInt)
      this._buffer = new byte[paramInt]; 
    this._windowSize = paramInt;
    this._pos = 0;
    this._streamPos = 0;
  }
  
  public void Flush() {
    int i = this._pos;
    int j = this._streamPos;
    i -= j;
    if (i == 0)
      return; 
    this._stream.write(this._buffer, j, i);
    if (this._pos >= this._windowSize)
      this._pos = 0; 
    this._streamPos = this._pos;
  }
  
  public byte GetByte(int paramInt) {
    int i = this._pos - paramInt - 1;
    paramInt = i;
    if (i < 0)
      paramInt = i + this._windowSize; 
    return this._buffer[paramInt];
  }
  
  public void Init(boolean paramBoolean) {
    if (!paramBoolean) {
      this._streamPos = 0;
      this._pos = 0;
    } 
  }
  
  public void PutByte(byte paramByte) throws IOException {
    byte[] arrayOfByte = this._buffer;
    int i = this._pos;
    this._pos = i + 1;
    arrayOfByte[i] = (byte)paramByte;
    if (this._pos >= this._windowSize)
      Flush(); 
  }
  
  public void ReleaseStream() {
    Flush();
    this._stream = null;
  }
  
  public void SetStream(OutputStream paramOutputStream) throws IOException {
    ReleaseStream();
    this._stream = paramOutputStream;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/lz/OutWindow.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */