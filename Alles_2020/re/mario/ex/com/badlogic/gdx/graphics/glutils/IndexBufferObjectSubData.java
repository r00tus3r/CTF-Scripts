package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;

public class IndexBufferObjectSubData implements IndexData {
  final ShortBuffer buffer;
  
  int bufferHandle;
  
  final ByteBuffer byteBuffer;
  
  boolean isBound = false;
  
  final boolean isDirect;
  
  boolean isDirty = true;
  
  final int usage;
  
  public IndexBufferObjectSubData(int paramInt) {
    this.byteBuffer = BufferUtils.newByteBuffer(paramInt * 2);
    this.isDirect = true;
    this.usage = 35044;
    this.buffer = this.byteBuffer.asShortBuffer();
    this.buffer.flip();
    this.byteBuffer.flip();
    this.bufferHandle = createBufferObject();
  }
  
  public IndexBufferObjectSubData(boolean paramBoolean, int paramInt) {
    this.byteBuffer = BufferUtils.newByteBuffer(paramInt * 2);
    this.isDirect = true;
    if (paramBoolean) {
      paramInt = 35044;
    } else {
      paramInt = 35048;
    } 
    this.usage = paramInt;
    this.buffer = this.byteBuffer.asShortBuffer();
    this.buffer.flip();
    this.byteBuffer.flip();
    this.bufferHandle = createBufferObject();
  }
  
  private int createBufferObject() {
    int i = Gdx.gl20.glGenBuffer();
    Gdx.gl20.glBindBuffer(34963, i);
    Gdx.gl20.glBufferData(34963, this.byteBuffer.capacity(), null, this.usage);
    Gdx.gl20.glBindBuffer(34963, 0);
    return i;
  }
  
  public void bind() {
    if (this.bufferHandle != 0) {
      Gdx.gl20.glBindBuffer(34963, this.bufferHandle);
      if (this.isDirty) {
        this.byteBuffer.limit(this.buffer.limit() * 2);
        Gdx.gl20.glBufferSubData(34963, 0, this.byteBuffer.limit(), this.byteBuffer);
        this.isDirty = false;
      } 
      this.isBound = true;
      return;
    } 
    throw new GdxRuntimeException("IndexBufferObject cannot be used after it has been disposed.");
  }
  
  public void dispose() {
    GL20 gL20 = Gdx.gl20;
    gL20.glBindBuffer(34963, 0);
    gL20.glDeleteBuffer(this.bufferHandle);
    this.bufferHandle = 0;
  }
  
  public ShortBuffer getBuffer() {
    this.isDirty = true;
    return this.buffer;
  }
  
  public int getNumIndices() { return this.buffer.limit(); }
  
  public int getNumMaxIndices() { return this.buffer.capacity(); }
  
  public void invalidate() {
    this.bufferHandle = createBufferObject();
    this.isDirty = true;
  }
  
  public void setIndices(ShortBuffer paramShortBuffer) {
    int i = paramShortBuffer.position();
    this.isDirty = true;
    this.buffer.clear();
    this.buffer.put(paramShortBuffer);
    this.buffer.flip();
    paramShortBuffer.position(i);
    this.byteBuffer.position(0);
    this.byteBuffer.limit(this.buffer.limit() << 1);
    if (this.isBound) {
      Gdx.gl20.glBufferSubData(34963, 0, this.byteBuffer.limit(), this.byteBuffer);
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
      Gdx.gl20.glBufferSubData(34963, 0, this.byteBuffer.limit(), this.byteBuffer);
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
      Gdx.gl20.glBufferSubData(34963, 0, this.byteBuffer.limit(), this.byteBuffer);
      this.isDirty = false;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */