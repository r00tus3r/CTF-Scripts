package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

public class Gdx2DPixmap implements Disposable {
  public static final int GDX2D_BLEND_NONE = 0;
  
  public static final int GDX2D_BLEND_SRC_OVER = 1;
  
  public static final int GDX2D_FORMAT_ALPHA = 1;
  
  public static final int GDX2D_FORMAT_LUMINANCE_ALPHA = 2;
  
  public static final int GDX2D_FORMAT_RGB565 = 5;
  
  public static final int GDX2D_FORMAT_RGB888 = 3;
  
  public static final int GDX2D_FORMAT_RGBA4444 = 6;
  
  public static final int GDX2D_FORMAT_RGBA8888 = 4;
  
  public static final int GDX2D_SCALE_LINEAR = 1;
  
  public static final int GDX2D_SCALE_NEAREST = 0;
  
  long basePtr;
  
  int format;
  
  int height;
  
  long[] nativeData = new long[4];
  
  ByteBuffer pixelPtr;
  
  int width;
  
  public Gdx2DPixmap(int paramInt1, int paramInt2, int paramInt3) throws GdxRuntimeException {
    this.pixelPtr = newPixmap(this.nativeData, paramInt1, paramInt2, paramInt3);
    if (this.pixelPtr != null) {
      long[] arrayOfLong = this.nativeData;
      this.basePtr = arrayOfLong[0];
      this.width = (int)arrayOfLong[1];
      this.height = (int)arrayOfLong[2];
      this.format = (int)arrayOfLong[3];
      return;
    } 
    throw new GdxRuntimeException("Error loading pixmap.");
  }
  
  public Gdx2DPixmap(InputStream paramInputStream, int paramInt) throws IOException {
    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream('Ѐ');
    byte[] arrayOfByte2 = new byte[1024];
    while (true) {
      int i = paramInputStream.read(arrayOfByte2);
      if (i != -1) {
        byteArrayOutputStream.write(arrayOfByte2, 0, i);
        continue;
      } 
      break;
    } 
    byte[] arrayOfByte1 = byteArrayOutputStream.toByteArray();
    this.pixelPtr = load(this.nativeData, arrayOfByte1, 0, arrayOfByte1.length);
    if (this.pixelPtr != null) {
      long[] arrayOfLong = this.nativeData;
      this.basePtr = arrayOfLong[0];
      this.width = (int)arrayOfLong[1];
      this.height = (int)arrayOfLong[2];
      this.format = (int)arrayOfLong[3];
      if (paramInt != 0 && paramInt != this.format)
        convert(paramInt); 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Error loading pixmap: ");
    stringBuilder.append(getFailureReason());
    IOException iOException = new IOException(stringBuilder.toString());
    throw iOException;
  }
  
  public Gdx2DPixmap(ByteBuffer paramByteBuffer, long[] paramArrayOfLong) {
    this.pixelPtr = paramByteBuffer;
    this.basePtr = paramArrayOfLong[0];
    this.width = (int)paramArrayOfLong[1];
    this.height = (int)paramArrayOfLong[2];
    this.format = (int)paramArrayOfLong[3];
  }
  
  public Gdx2DPixmap(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3) throws IOException {
    this.pixelPtr = load(this.nativeData, paramArrayOfByte, paramInt1, paramInt2);
    if (this.pixelPtr != null) {
      long[] arrayOfLong = this.nativeData;
      this.basePtr = arrayOfLong[0];
      this.width = (int)arrayOfLong[1];
      this.height = (int)arrayOfLong[2];
      this.format = (int)arrayOfLong[3];
      if (paramInt3 != 0 && paramInt3 != this.format)
        convert(paramInt3); 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Error loading pixmap: ");
    stringBuilder.append(getFailureReason());
    throw new IOException(stringBuilder.toString());
  }
  
  private static native void clear(long paramLong, int paramInt);
  
  private void convert(int paramInt) {
    Gdx2DPixmap gdx2DPixmap = new Gdx2DPixmap(this.width, this.height, paramInt);
    gdx2DPixmap.setBlend(0);
    gdx2DPixmap.drawPixmap(this, 0, 0, 0, 0, this.width, this.height);
    dispose();
    this.basePtr = gdx2DPixmap.basePtr;
    this.format = gdx2DPixmap.format;
    this.height = gdx2DPixmap.height;
    this.nativeData = gdx2DPixmap.nativeData;
    this.pixelPtr = gdx2DPixmap.pixelPtr;
    this.width = gdx2DPixmap.width;
  }
  
  private static native void drawCircle(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  private static native void drawLine(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5);
  
  private static native void drawPixmap(long paramLong1, long paramLong2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8);
  
  private static native void drawRect(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5);
  
  private static native void fillCircle(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  private static native void fillRect(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5);
  
  private static native void fillTriangle(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7);
  
  private static native void free(long paramLong);
  
  public static native String getFailureReason();
  
  private static native int getPixel(long paramLong, int paramInt1, int paramInt2);
  
  private static native ByteBuffer load(long[] paramArrayOfLong, byte[] paramArrayOfByte, int paramInt1, int paramInt2);
  
  public static Gdx2DPixmap newPixmap(int paramInt1, int paramInt2, int paramInt3) {
    try {
      return new Gdx2DPixmap(paramInt1, paramInt2, paramInt3);
    } catch (IllegalArgumentException illegalArgumentException) {
      return null;
    } 
  }
  
  public static Gdx2DPixmap newPixmap(InputStream paramInputStream, int paramInt) {
    try {
      return new Gdx2DPixmap(paramInputStream, paramInt);
    } catch (IOException paramInputStream) {
      return null;
    } 
  }
  
  private static native ByteBuffer newPixmap(long[] paramArrayOfLong, int paramInt1, int paramInt2, int paramInt3);
  
  private static native void setBlend(long paramLong, int paramInt);
  
  private static native void setPixel(long paramLong, int paramInt1, int paramInt2, int paramInt3);
  
  private static native void setScale(long paramLong, int paramInt);
  
  public static int toGlFormat(int paramInt) {
    StringBuilder stringBuilder;
    switch (paramInt) {
      default:
        stringBuilder = new StringBuilder();
        stringBuilder.append("unknown format: ");
        stringBuilder.append(paramInt);
        throw new GdxRuntimeException(stringBuilder.toString());
      case 4:
      case 6:
        return 6408;
      case 3:
      case 5:
        return 6407;
      case 2:
        return 6410;
      case 1:
        break;
    } 
    return 6406;
  }
  
  public static int toGlType(int paramInt) {
    StringBuilder stringBuilder;
    switch (paramInt) {
      default:
        stringBuilder = new StringBuilder();
        stringBuilder.append("unknown format: ");
        stringBuilder.append(paramInt);
        throw new GdxRuntimeException(stringBuilder.toString());
      case 6:
        return 32819;
      case 5:
        return 33635;
      case 1:
      case 2:
      case 3:
      case 4:
        break;
    } 
    return 5121;
  }
  
  public void clear(int paramInt) { clear(this.basePtr, paramInt); }
  
  public void dispose() { free(this.basePtr); }
  
  public void drawCircle(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { drawCircle(this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void drawLine(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { drawLine(this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void drawPixmap(Gdx2DPixmap paramGdx2DPixmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) { drawPixmap(paramGdx2DPixmap.basePtr, this.basePtr, paramInt1, paramInt2, paramInt5, paramInt6, paramInt3, paramInt4, paramInt5, paramInt6); }
  
  public void drawPixmap(Gdx2DPixmap paramGdx2DPixmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) { drawPixmap(paramGdx2DPixmap.basePtr, this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8); }
  
  public void drawRect(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { drawRect(this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void fillCircle(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { fillCircle(this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void fillRect(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { fillRect(this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void fillTriangle(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7) { fillTriangle(this.basePtr, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7); }
  
  public int getFormat() { return this.format; }
  
  public String getFormatString() {
    switch (this.format) {
      default:
        return "unknown";
      case 6:
        return "rgba4444";
      case 5:
        return "rgb565";
      case 4:
        return "rgba8888";
      case 3:
        return "rgb888";
      case 2:
        return "luminance alpha";
      case 1:
        break;
    } 
    return "alpha";
  }
  
  public int getGLFormat() { return getGLInternalFormat(); }
  
  public int getGLInternalFormat() { return toGlFormat(this.format); }
  
  public int getGLType() { return toGlType(this.format); }
  
  public int getHeight() { return this.height; }
  
  public int getPixel(int paramInt1, int paramInt2) { return getPixel(this.basePtr, paramInt1, paramInt2); }
  
  public ByteBuffer getPixels() { return this.pixelPtr; }
  
  public int getWidth() { return this.width; }
  
  public void setBlend(int paramInt) { setBlend(this.basePtr, paramInt); }
  
  public void setPixel(int paramInt1, int paramInt2, int paramInt3) throws GdxRuntimeException { setPixel(this.basePtr, paramInt1, paramInt2, paramInt3); }
  
  public void setScale(int paramInt) { setScale(this.basePtr, paramInt); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/Gdx2DPixmap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */