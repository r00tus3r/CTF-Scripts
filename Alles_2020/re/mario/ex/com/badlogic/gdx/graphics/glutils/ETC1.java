package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.nio.ByteBuffer;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class ETC1 {
  public static int ETC1_RGB8_OES = 36196;
  
  public static int PKM_HEADER_SIZE = 16;
  
  static  {
  
  }
  
  public static Pixmap decodeImage(ETC1Data paramETC1Data, Pixmap.Format paramFormat) {
    byte b;
    int j;
    int i;
    if (paramETC1Data.hasPKMHeader()) {
      i = getWidthPKM(paramETC1Data.compressedData, 0);
      j = getHeightPKM(paramETC1Data.compressedData, 0);
      b = 16;
    } else {
      i = paramETC1Data.width;
      j = paramETC1Data.height;
      b = 0;
    } 
    int k = getPixelSize(paramFormat);
    Pixmap pixmap = new Pixmap(i, j, paramFormat);
    decodeImage(paramETC1Data.compressedData, b, pixmap.getPixels(), 0, i, j, k);
    return pixmap;
  }
  
  private static native void decodeImage(ByteBuffer paramByteBuffer1, int paramInt1, ByteBuffer paramByteBuffer2, int paramInt2, int paramInt3, int paramInt4, int paramInt5);
  
  public static ETC1Data encodeImage(Pixmap paramPixmap) {
    int i = getPixelSize(paramPixmap.getFormat());
    ByteBuffer byteBuffer = encodeImage(paramPixmap.getPixels(), 0, paramPixmap.getWidth(), paramPixmap.getHeight(), i);
    BufferUtils.newUnsafeByteBuffer(byteBuffer);
    return new ETC1Data(paramPixmap.getWidth(), paramPixmap.getHeight(), byteBuffer, false);
  }
  
  private static native ByteBuffer encodeImage(ByteBuffer paramByteBuffer, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  public static ETC1Data encodeImagePKM(Pixmap paramPixmap) {
    int i = getPixelSize(paramPixmap.getFormat());
    ByteBuffer byteBuffer = encodeImagePKM(paramPixmap.getPixels(), 0, paramPixmap.getWidth(), paramPixmap.getHeight(), i);
    BufferUtils.newUnsafeByteBuffer(byteBuffer);
    return new ETC1Data(paramPixmap.getWidth(), paramPixmap.getHeight(), byteBuffer, 16);
  }
  
  private static native ByteBuffer encodeImagePKM(ByteBuffer paramByteBuffer, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  public static native void formatHeader(ByteBuffer paramByteBuffer, int paramInt1, int paramInt2, int paramInt3);
  
  public static native int getCompressedDataSize(int paramInt1, int paramInt2);
  
  static native int getHeightPKM(ByteBuffer paramByteBuffer, int paramInt);
  
  private static int getPixelSize(Pixmap.Format paramFormat) {
    if (paramFormat == Pixmap.Format.RGB565)
      return 2; 
    if (paramFormat == Pixmap.Format.RGB888)
      return 3; 
    throw new GdxRuntimeException("Can only handle RGB565 or RGB888 images");
  }
  
  static native int getWidthPKM(ByteBuffer paramByteBuffer, int paramInt);
  
  static native boolean isValidPKM(ByteBuffer paramByteBuffer, int paramInt);
  
  public static final class ETC1Data implements Disposable {
    public final ByteBuffer compressedData;
    
    public final int dataOffset;
    
    public final int height;
    
    public final int width;
    
    public ETC1Data(int param1Int1, int param1Int2, ByteBuffer param1ByteBuffer, int param1Int3) {
      this.width = param1Int1;
      this.height = param1Int2;
      this.compressedData = param1ByteBuffer;
      this.dataOffset = param1Int3;
      checkNPOT();
    }
    
    public ETC1Data(FileHandle param1FileHandle) {
      byte[] arrayOfByte = new byte[10240];
      GdxRuntimeException gdxRuntimeException = null;
      throwable = null;
      DataInputStream dataInputStream1 = throwable;
      try {
        dataInputStream2 = new DataInputStream();
        dataInputStream1 = throwable;
        BufferedInputStream bufferedInputStream = new BufferedInputStream();
        dataInputStream1 = throwable;
        GZIPInputStream gZIPInputStream = new GZIPInputStream();
        dataInputStream1 = throwable;
        this(param1FileHandle.read());
        dataInputStream1 = throwable;
        this(gZIPInputStream);
        dataInputStream1 = throwable;
        this(bufferedInputStream);
        try {
          this.compressedData = BufferUtils.newUnsafeByteBuffer(dataInputStream2.readInt());
          while (true) {
            int i = dataInputStream2.read(arrayOfByte);
            if (i != -1) {
              this.compressedData.put(arrayOfByte, 0, i);
              continue;
            } 
            break;
          } 
          this.compressedData.position(0);
          this.compressedData.limit(this.compressedData.capacity());
          StreamUtils.closeQuietly(dataInputStream2);
          this.width = ETC1.getWidthPKM(this.compressedData, 0);
          this.height = ETC1.getHeightPKM(this.compressedData, 0);
          this.dataOffset = ETC1.PKM_HEADER_SIZE;
          this.compressedData.position(this.dataOffset);
          return;
        } catch (Exception throwable) {
        
        } finally {
          param1FileHandle = null;
        } 
      } catch (Exception throwable) {
        dataInputStream2 = gdxRuntimeException;
      } finally {}
      dataInputStream1 = dataInputStream2;
      gdxRuntimeException = new GdxRuntimeException();
      dataInputStream1 = dataInputStream2;
      StringBuilder stringBuilder = new StringBuilder();
      dataInputStream1 = dataInputStream2;
      this();
      dataInputStream1 = dataInputStream2;
      stringBuilder.append("Couldn't load pkm file '");
      dataInputStream1 = dataInputStream2;
      stringBuilder.append(param1FileHandle);
      dataInputStream1 = dataInputStream2;
      stringBuilder.append("'");
      dataInputStream1 = dataInputStream2;
      this(stringBuilder.toString(), throwable);
      dataInputStream1 = dataInputStream2;
      throw gdxRuntimeException;
    }
    
    private void checkNPOT() {
      if (!MathUtils.isPowerOfTwo(this.width) || !MathUtils.isPowerOfTwo(this.height))
        System.out.println("ETC1Data warning: non-power-of-two ETC1 textures may crash the driver of PowerVR GPUs"); 
    }
    
    public void dispose() { BufferUtils.disposeUnsafeByteBuffer(this.compressedData); }
    
    public boolean hasPKMHeader() {
      boolean bool;
      if (this.dataOffset == 16) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public String toString() {
      if (hasPKMHeader()) {
        String str;
        StringBuilder stringBuilder1 = new StringBuilder();
        if (ETC1.isValidPKM(this.compressedData, 0)) {
          str = "valid";
        } else {
          str = "invalid";
        } 
        stringBuilder1.append(str);
        stringBuilder1.append(" pkm [");
        stringBuilder1.append(ETC1.getWidthPKM(this.compressedData, 0));
        stringBuilder1.append("x");
        stringBuilder1.append(ETC1.getHeightPKM(this.compressedData, 0));
        stringBuilder1.append("], compressed: ");
        stringBuilder1.append(this.compressedData.capacity() - ETC1.PKM_HEADER_SIZE);
        return stringBuilder1.toString();
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("raw [");
      stringBuilder.append(this.width);
      stringBuilder.append("x");
      stringBuilder.append(this.height);
      stringBuilder.append("], compressed: ");
      stringBuilder.append(this.compressedData.capacity() - ETC1.PKM_HEADER_SIZE);
      return stringBuilder.toString();
    }
    
    public void write(FileHandle param1FileHandle) {
      ByteBuffer byteBuffer3;
      byte[] arrayOfByte = new byte[10240];
      this.compressedData.position(0);
      ByteBuffer byteBuffer1 = this.compressedData;
      byteBuffer1.limit(byteBuffer1.capacity());
      GdxRuntimeException gdxRuntimeException = null;
      byteBuffer2 = null;
      byteBuffer1 = byteBuffer2;
      try {
        byteBuffer3 = new DataOutputStream();
        byteBuffer1 = byteBuffer2;
        GZIPOutputStream gZIPOutputStream = new GZIPOutputStream();
        byteBuffer1 = byteBuffer2;
        this(param1FileHandle.write(false));
        byteBuffer1 = byteBuffer2;
        this(gZIPOutputStream);
        try {
          byteBuffer3.writeInt(this.compressedData.capacity());
          int i;
          for (i = 0; i != this.compressedData.capacity(); i += j) {
            int j = Math.min(this.compressedData.remaining(), arrayOfByte.length);
            this.compressedData.get(arrayOfByte, 0, j);
            byteBuffer3.write(arrayOfByte, 0, j);
          } 
          StreamUtils.closeQuietly(byteBuffer3);
          this.compressedData.position(this.dataOffset);
          byteBuffer = this.compressedData;
          return;
        } catch (Exception byteBuffer2) {
        
        } finally {
          DataOutputStream dataOutputStream;
          param1FileHandle = null;
        } 
      } catch (Exception byteBuffer2) {
        byteBuffer3 = gdxRuntimeException;
      } finally {}
      byteBuffer1 = byteBuffer3;
      gdxRuntimeException = new GdxRuntimeException();
      byteBuffer1 = byteBuffer3;
      StringBuilder stringBuilder = new StringBuilder();
      byteBuffer1 = byteBuffer3;
      this();
      byteBuffer1 = byteBuffer3;
      stringBuilder.append("Couldn't write PKM file to '");
      byteBuffer1 = byteBuffer3;
      stringBuilder.append(param1FileHandle);
      byteBuffer1 = byteBuffer3;
      stringBuilder.append("'");
      byteBuffer1 = byteBuffer3;
      this(stringBuilder.toString(), byteBuffer2);
      byteBuffer1 = byteBuffer3;
      throw gdxRuntimeException;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/ETC1.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */