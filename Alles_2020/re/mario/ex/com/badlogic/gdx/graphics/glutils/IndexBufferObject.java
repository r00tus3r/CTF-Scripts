package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;

public class IndexBufferObject implements IndexData {
  final ShortBuffer buffer;
  
  int bufferHandle;
  
  final ByteBuffer byteBuffer;
  
  private final boolean empty;
  
  boolean isBound;
  
  final boolean isDirect;
  
  boolean isDirty = true;
  
  final boolean ownsBuffer;
  
  final int usage;
  
  public IndexBufferObject(int paramInt) { this(true, paramInt); }
  
  public IndexBufferObject(boolean paramBoolean, int paramInt) {
    boolean bool = false;
    this.isBound = false;
    if (paramInt == 0)
      bool = true; 
    this.empty = bool;
    if (this.empty)
      paramInt = 1; 
    this.byteBuffer = BufferUtils.newUnsafeByteBuffer(paramInt * 2);
    this.isDirect = true;
    this.buffer = this.byteBuffer.asShortBuffer();
    this.ownsBuffer = true;
    this.buffer.flip();
    this.byteBuffer.flip();
    this.bufferHandle = Gdx.gl20.glGenBuffer();
    if (paramBoolean) {
      paramInt = 35044;
    } else {
      paramInt = 35048;
    } 
    this.usage = paramInt;
  }
  
  public IndexBufferObject(boolean paramBoolean, ByteBuffer paramByteBuffer) {
    this.isBound = false;
    if (paramByteBuffer.limit() == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    this.empty = bool;
    this.byteBuffer = paramByteBuffer;
    this.isDirect = true;
    this.buffer = this.byteBuffer.asShortBuffer();
    this.ownsBuffer = false;
    this.bufferHandle = Gdx.gl20.glGenBuffer();
    if (paramBoolean) {
      c = '裤';
    } else {
      c = '裨';
    } 
    this.usage = c;
  }
  
  public void bind() {
    if (this.bufferHandle != 0) {
      Gdx.gl20.glBindBuffer(34963, this.bufferHandle);
      if (this.isDirty) {
        this.byteBuffer.limit(this.buffer.limit() * 2);
        Gdx.gl20.glBufferData(34963, this.byteBuffer.limit(), this.byteBuffer, this.usage);
        this.isDirty = false;
      } 
      this.isBound = true;
      return;
    } 
    throw new GdxRuntimeException("No buffer allocated!");
  }
  
  public void dispose() {
    Gdx.gl20.glBindBuffer(34963, 0);
    Gdx.gl20.glDeleteBuffer(this.bufferHandle);
    this.bufferHandle = 0;
    if (this.ownsBuffer)
      BufferUtils.disposeUnsafeByteBuffer(this.byteBuffer); 
  }
  
  public ShortBuffer getBuffer() {
    this.isDirty = true;
    return this.buffer;
  }
  
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
  
  public void invalidate() {
    this.bufferHandle = Gdx.gl20.glGenBuffer();
    this.isDirty = true;
  }
  
  public void setIndices(ShortBuffer paramShortBuffer) {
    this.isDirty = true;
    int i = paramShortBuffer.position();
    this.buffer.clear();
    this.buffer.put(paramShortBuffer);
    this.buffer.flip();
    paramShortBuffer.position(i);
    this.byteBuffer.position(0);
    this.byteBuffer.limit(this.buffer.limit() << 1);
    if (this.isBound) {
      Gdx.gl20.glBufferData(34963, this.byteBuffer.limit(), this.byteBuffer, this.usage);
      this.isDirty = false;
    } 
  }
  
  public void setIndices(short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    this.isDirty = true;
    this.buffer.clear();
    this.buffer.put(paramArrayOfShort, paramInt1, paramInt2);
    this.buffer.flip();
    this.byteBuffer.position(0);
    this.byteBuffer.limit(paramInt2 << 1);
    if (this.isBound) {
      Gdx.gl20.glBufferData(34963, this.byteBuffer.limit(), this.byteBuffer, this.usage);
      this.isDirty = false;
    } 
  }
  
  public void unbind() {
    Gdx.gl20.glBindBuffer(34963, 0);
    this.isBound = false;
  }
  
  public void updateIndices(int paramInt1, short[] paramArrayOfShort, int paramInt2, int paramInt3) {
    this.isDirty = true;
    int i = this.byteBuffer.position();
    this.byteBuffer.position(paramInt1 * 2);
    BufferUtils.copy(paramArrayOfShort, paramInt2, this.byteBuffer, paramInt3);
    this.byteBuffer.position(i);
    this.buffer.position(0);
    if (this.isBound) {
      Gdx.gl20.glBufferData(34963, this.byteBuffer.limit(), this.byteBuffer, this.usage);
      this.isDirty = false;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/IndexBufferObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */