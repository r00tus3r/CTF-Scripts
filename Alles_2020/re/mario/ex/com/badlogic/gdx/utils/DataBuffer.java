package com.badlogic.gdx.utils;

public class DataBuffer extends DataOutput {
  private final StreamUtils.OptimizedByteArrayOutputStream outStream = (StreamUtils.OptimizedByteArrayOutputStream)this.out;
  
  public DataBuffer() { this(32); }
  
  public DataBuffer(int paramInt) { super(new StreamUtils.OptimizedByteArrayOutputStream(paramInt)); }
  
  public byte[] getBuffer() { return this.outStream.getBuffer(); }
  
  public byte[] toArray() { return this.outStream.toByteArray(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/DataBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */