package com.badlogic.gdx.utils.compression.lz;

import java.io.InputStream;

public class InWindow {
  public int _blockSize;
  
  public byte[] _bufferBase;
  
  public int _bufferOffset;
  
  int _keepSizeAfter;
  
  int _keepSizeBefore;
  
  int _pointerToLastSafePosition;
  
  public int _pos;
  
  int _posLimit;
  
  InputStream _stream;
  
  boolean _streamEndWasReached;
  
  public int _streamPos;
  
  public void Create(int paramInt1, int paramInt2, int paramInt3) {
    this._keepSizeBefore = paramInt1;
    this._keepSizeAfter = paramInt2;
    paramInt1 = paramInt1 + paramInt2 + paramInt3;
    if (this._bufferBase == null || this._blockSize != paramInt1) {
      Free();
      this._blockSize = paramInt1;
      this._bufferBase = new byte[this._blockSize];
    } 
    this._pointerToLastSafePosition = this._blockSize - paramInt2;
  }
  
  void Free() { this._bufferBase = null; }
  
  public byte GetIndexByte(int paramInt) { return this._bufferBase[this._bufferOffset + this._pos + paramInt]; }
  
  public int GetMatchLen(int paramInt1, int paramInt2, int paramInt3) {
    int i = paramInt3;
    if (this._streamEndWasReached) {
      int m = this._pos;
      int n = this._streamPos;
      i = paramInt3;
      if (m + paramInt1 + paramInt3 > n)
        i = n - m + paramInt1; 
    } 
    int k = this._bufferOffset;
    int j = this._pos;
    paramInt3 = 0;
    while (paramInt3 < i) {
      byte[] arrayOfByte = this._bufferBase;
      int m = k + j + paramInt1 + paramInt3;
      if (arrayOfByte[m] == arrayOfByte[m - paramInt2 + 1])
        paramInt3++; 
    } 
    return paramInt3;
  }
  
  public int GetNumAvailableBytes() { return this._streamPos - this._pos; }
  
  public void Init() {
    this._bufferOffset = 0;
    this._pos = 0;
    this._streamPos = 0;
    this._streamEndWasReached = false;
    ReadBlock();
  }
  
  public void MoveBlock() {
    int i = this._bufferOffset + this._pos - this._keepSizeBefore;
    int j = i;
    if (i > 0)
      j = i - 1; 
    int k = this._bufferOffset;
    int m = this._streamPos;
    for (i = 0; i < k + m - j; i++) {
      byte[] arrayOfByte = this._bufferBase;
      arrayOfByte[i] = (byte)arrayOfByte[j + i];
    } 
    this._bufferOffset -= j;
  }
  
  public void MovePos() {
    int i = ++this._pos;
    if (i > this._posLimit) {
      if (this._bufferOffset + i > this._pointerToLastSafePosition)
        MoveBlock(); 
      ReadBlock();
    } 
  }
  
  public void ReadBlock() {
    if (this._streamEndWasReached)
      return; 
    while (true) {
      int i = this._bufferOffset;
      int j = this._blockSize;
      int k = this._streamPos;
      j = 0 - i + j - k;
      if (j == 0)
        return; 
      i = this._stream.read(this._bufferBase, i + k, j);
      if (i == -1) {
        this._posLimit = this._streamPos;
        i = this._bufferOffset;
        k = this._posLimit;
        j = this._pointerToLastSafePosition;
        if (k + i > j)
          this._posLimit = j - i; 
        this._streamEndWasReached = true;
        return;
      } 
      this._streamPos += i;
      i = this._streamPos;
      j = this._pos;
      k = this._keepSizeAfter;
      if (i >= j + k)
        this._posLimit = i - k; 
    } 
  }
  
  public void ReduceOffsets(int paramInt) {
    this._bufferOffset += paramInt;
    this._posLimit -= paramInt;
    this._pos -= paramInt;
    this._streamPos -= paramInt;
  }
  
  public void ReleaseStream() { this._stream = null; }
  
  public void SetStream(InputStream paramInputStream) { this._stream = paramInputStream; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/lz/InWindow.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */