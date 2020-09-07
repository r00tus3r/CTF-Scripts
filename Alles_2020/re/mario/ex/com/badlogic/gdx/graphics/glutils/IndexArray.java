package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.utils.BufferUtils;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;

public class IndexArray implements IndexData {
  final ShortBuffer buffer;
  
  final ByteBuffer byteBuffer;
  
  private final boolean empty;
  
  public IndexArray(int paramInt) {
    if (paramInt == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    this.empty = bool;
    if (this.empty)
      paramInt = 1; 
    this.byteBuffer = BufferUtils.newUnsafeByteBuffer(paramInt * 2);
    this.buffer = this.byteBuffer.asShortBuffer();
    this.buffer.flip();
    this.byteBuffer.flip();
  }
  
  public void bind() {}
  
  public void dispose() { BufferUtils.disposeUnsafeByteBuffer(this.byteBuffer); }
  
  public ShortBuffer getBuffer() { return this.buffer; }
  
  public int getNumIndices() {
    int i;
    if (this.empty) {
      i = 0;
    } else {
      i = this.buffer.limit();
    } 
    return i;
  }
  
  public int getNumMaxIndices() {
    int i;
    if (this.empty) {
      i = 0;
    } else {
      i = this.buffer.capacity();
    } 
    return i;
  }
  
  public void invalidate() {}
  
  public void setIndices(ShortBuffer paramShortBuffer) {
    int i = paramShortBuffer.position();
    this.buffer.clear();
    this.buffer.limit(paramShortBuffer.remaining());
    this.buffer.put(paramShortBuffer);
    this.buffer.flip();
    paramShortBuffer.position(i);
    this.byteBuffer.position(0);
    this.byteBuffer.limit(this.buffer.limit() << 1);
  }
  
  public void setIndices(short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    this.buffer.clear();
    this.buffer.put(paramArrayOfShort, paramInt1, paramInt2);
    this.buffer.flip();
    this.byteBuffer.position(0);
    this.byteBuffer.limit(paramInt2 << 1);
  }
  
  public void unbind() {}
  
  public void updateIndices(int paramInt1, short[] paramArrayOfShort, int paramInt2, int paramInt3) {
    int i = this.byteBuffer.position();
    this.byteBuffer.position(paramInt1 * 2);
    BufferUtils.copy(paramArrayOfShort, paramInt2, this.byteBuffer, paramInt3);
    this.byteBuffer.position(i);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/IndexArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */