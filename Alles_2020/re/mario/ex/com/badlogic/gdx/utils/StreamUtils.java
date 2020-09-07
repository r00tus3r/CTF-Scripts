package com.badlogic.gdx.utils;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.nio.ByteBuffer;

public final class StreamUtils {
  public static final int DEFAULT_BUFFER_SIZE = 4096;
  
  public static final byte[] EMPTY_BYTES = new byte[0];
  
  public static void closeQuietly(Closeable paramCloseable) {
    if (paramCloseable != null)
      try {
        paramCloseable.close();
      } catch (Throwable paramCloseable) {} 
  }
  
  public static int copyStream(InputStream paramInputStream, ByteBuffer paramByteBuffer, byte[] paramArrayOfByte) throws IOException {
    int i = paramByteBuffer.position();
    int j = 0;
    while (true) {
      int k = paramInputStream.read(paramArrayOfByte);
      if (k != -1) {
        BufferUtils.copy(paramArrayOfByte, 0, paramByteBuffer, k);
        j += k;
        paramByteBuffer.position(i + j);
        continue;
      } 
      break;
    } 
    paramByteBuffer.position(i);
    return j;
  }
  
  public static void copyStream(InputStream paramInputStream, OutputStream paramOutputStream) throws IOException { copyStream(paramInputStream, paramOutputStream, new byte[4096]); }
  
  public static void copyStream(InputStream paramInputStream, OutputStream paramOutputStream, int paramInt) throws IOException { copyStream(paramInputStream, paramOutputStream, new byte[paramInt]); }
  
  public static void copyStream(InputStream paramInputStream, OutputStream paramOutputStream, byte[] paramArrayOfByte) throws IOException {
    while (true) {
      int i = paramInputStream.read(paramArrayOfByte);
      if (i != -1) {
        paramOutputStream.write(paramArrayOfByte, 0, i);
        continue;
      } 
      break;
    } 
  }
  
  public static void copyStream(InputStream paramInputStream, ByteBuffer paramByteBuffer) throws IOException { copyStream(paramInputStream, paramByteBuffer, new byte[4096]); }
  
  public static void copyStream(InputStream paramInputStream, ByteBuffer paramByteBuffer, int paramInt) throws IOException { copyStream(paramInputStream, paramByteBuffer, new byte[paramInt]); }
  
  public static byte[] copyStreamToByteArray(InputStream paramInputStream) throws IOException { return copyStreamToByteArray(paramInputStream, paramInputStream.available()); }
  
  public static byte[] copyStreamToByteArray(InputStream paramInputStream, int paramInt) throws IOException {
    OptimizedByteArrayOutputStream optimizedByteArrayOutputStream = new OptimizedByteArrayOutputStream(Math.max(0, paramInt));
    copyStream(paramInputStream, optimizedByteArrayOutputStream);
    return optimizedByteArrayOutputStream.toByteArray();
  }
  
  public static String copyStreamToString(InputStream paramInputStream) throws IOException { return copyStreamToString(paramInputStream, paramInputStream.available(), null); }
  
  public static String copyStreamToString(InputStream paramInputStream, int paramInt) throws IOException { return copyStreamToString(paramInputStream, paramInt, null); }
  
  public static String copyStreamToString(InputStream paramInputStream, int paramInt, String paramString) throws IOException {
    InputStreamReader inputStreamReader;
    if (paramString == null) {
      inputStreamReader = new InputStreamReader(paramInputStream);
    } else {
      inputStreamReader = new InputStreamReader(inputStreamReader, paramString);
    } 
    StringWriter stringWriter = new StringWriter(Math.max(0, paramInt));
    char[] arrayOfChar = new char[4096];
    while (true) {
      paramInt = inputStreamReader.read(arrayOfChar);
      if (paramInt != -1) {
        stringWriter.write(arrayOfChar, 0, paramInt);
        continue;
      } 
      break;
    } 
    return stringWriter.toString();
  }
  
  public static class OptimizedByteArrayOutputStream extends ByteArrayOutputStream {
    public OptimizedByteArrayOutputStream(int param1Int) { super(param1Int); }
    
    public byte[] getBuffer() { return this.buf; }
    
    public byte[] toByteArray() { // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield count : I
      //   6: aload_0
      //   7: getfield buf : [B
      //   10: arraylength
      //   11: if_icmpne -> 23
      //   14: aload_0
      //   15: getfield buf : [B
      //   18: astore_1
      //   19: aload_0
      //   20: monitorexit
      //   21: aload_1
      //   22: areturn
      //   23: aload_0
      //   24: invokespecial toByteArray : ()[B
      //   27: astore_1
      //   28: aload_0
      //   29: monitorexit
      //   30: aload_1
      //   31: areturn
      //   32: astore_1
      //   33: aload_0
      //   34: monitorexit
      //   35: aload_1
      //   36: athrow
      // Exception table:
      //   from	to	target	type
      //   2	19	32	finally
      //   23	28	32	finally }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/StreamUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */