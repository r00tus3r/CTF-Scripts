package com.badlogic.gdx.graphics;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.ByteArray;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;

public class PixmapIO {
  public static Pixmap readCIM(FileHandle paramFileHandle) { return CIM.read(paramFileHandle); }
  
  public static void writeCIM(FileHandle paramFileHandle, Pixmap paramPixmap) { CIM.write(paramFileHandle, paramPixmap); }
  
  public static void writePNG(FileHandle paramFileHandle, Pixmap paramPixmap) { writePNG(paramFileHandle, paramPixmap, -1, false); }
  
  public static void writePNG(FileHandle paramFileHandle, Pixmap paramPixmap, int paramInt, boolean paramBoolean) {
    try {
      pNG = new PNG();
      this((int)((paramPixmap.getWidth() * paramPixmap.getHeight()) * 1.5F));
      try {
        pNG.setFlipY(paramBoolean);
        pNG.setCompression(paramInt);
        pNG.write(paramFileHandle, paramPixmap);
        return;
      } finally {
        pNG.dispose();
      } 
    } catch (IOException paramPixmap) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error writing PNG: ");
      stringBuilder.append(paramFileHandle);
      throw new GdxRuntimeException(stringBuilder.toString(), paramPixmap);
    } 
  }
  
  private static class CIM {
    private static final int BUFFER_SIZE = 32000;
    
    private static final byte[] readBuffer;
    
    private static final byte[] writeBuffer = new byte[32000];
    
    static  {
      readBuffer = new byte[32000];
    }
    
    public static Pixmap read(FileHandle param1FileHandle) { // Byte code:
      //   0: new java/io/DataInputStream
      //   3: astore_1
      //   4: new java/util/zip/InflaterInputStream
      //   7: astore_2
      //   8: new java/io/BufferedInputStream
      //   11: astore_3
      //   12: aload_3
      //   13: aload_0
      //   14: invokevirtual read : ()Ljava/io/InputStream;
      //   17: invokespecial <init> : (Ljava/io/InputStream;)V
      //   20: aload_2
      //   21: aload_3
      //   22: invokespecial <init> : (Ljava/io/InputStream;)V
      //   25: aload_1
      //   26: aload_2
      //   27: invokespecial <init> : (Ljava/io/InputStream;)V
      //   30: aload_1
      //   31: astore_2
      //   32: aload_1
      //   33: invokevirtual readInt : ()I
      //   36: istore #4
      //   38: aload_1
      //   39: astore_2
      //   40: aload_1
      //   41: invokevirtual readInt : ()I
      //   44: istore #5
      //   46: aload_1
      //   47: astore_2
      //   48: aload_1
      //   49: invokevirtual readInt : ()I
      //   52: invokestatic fromGdx2DPixmapFormat : (I)Lcom/badlogic/gdx/graphics/Pixmap$Format;
      //   55: astore_3
      //   56: aload_1
      //   57: astore_2
      //   58: new com/badlogic/gdx/graphics/Pixmap
      //   61: astore #6
      //   63: aload_1
      //   64: astore_2
      //   65: aload #6
      //   67: iload #4
      //   69: iload #5
      //   71: aload_3
      //   72: invokespecial <init> : (IILcom/badlogic/gdx/graphics/Pixmap$Format;)V
      //   75: aload_1
      //   76: astore_2
      //   77: aload #6
      //   79: invokevirtual getPixels : ()Ljava/nio/ByteBuffer;
      //   82: astore #7
      //   84: aload_1
      //   85: astore_2
      //   86: aload #7
      //   88: iconst_0
      //   89: invokevirtual position : (I)Ljava/nio/Buffer;
      //   92: pop
      //   93: aload_1
      //   94: astore_2
      //   95: aload #7
      //   97: aload #7
      //   99: invokevirtual capacity : ()I
      //   102: invokevirtual limit : (I)Ljava/nio/Buffer;
      //   105: pop
      //   106: aload_1
      //   107: astore_2
      //   108: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.readBuffer : [B
      //   111: astore_3
      //   112: aload_1
      //   113: astore_2
      //   114: aload_3
      //   115: monitorenter
      //   116: aload_1
      //   117: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.readBuffer : [B
      //   120: invokevirtual read : ([B)I
      //   123: istore #4
      //   125: iload #4
      //   127: ifle -> 145
      //   130: aload #7
      //   132: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.readBuffer : [B
      //   135: iconst_0
      //   136: iload #4
      //   138: invokevirtual put : ([BII)Ljava/nio/ByteBuffer;
      //   141: pop
      //   142: goto -> 116
      //   145: aload_3
      //   146: monitorexit
      //   147: aload_1
      //   148: astore_2
      //   149: aload #7
      //   151: iconst_0
      //   152: invokevirtual position : (I)Ljava/nio/Buffer;
      //   155: pop
      //   156: aload_1
      //   157: astore_2
      //   158: aload #7
      //   160: aload #7
      //   162: invokevirtual capacity : ()I
      //   165: invokevirtual limit : (I)Ljava/nio/Buffer;
      //   168: pop
      //   169: aload_1
      //   170: invokestatic closeQuietly : (Ljava/io/Closeable;)V
      //   173: aload #6
      //   175: areturn
      //   176: astore #6
      //   178: aload_3
      //   179: monitorexit
      //   180: aload_1
      //   181: astore_2
      //   182: aload #6
      //   184: athrow
      //   185: astore_3
      //   186: goto -> 198
      //   189: astore_0
      //   190: aconst_null
      //   191: astore_2
      //   192: goto -> 267
      //   195: astore_3
      //   196: aconst_null
      //   197: astore_1
      //   198: aload_1
      //   199: astore_2
      //   200: new com/badlogic/gdx/utils/GdxRuntimeException
      //   203: astore #6
      //   205: aload_1
      //   206: astore_2
      //   207: new java/lang/StringBuilder
      //   210: astore #7
      //   212: aload_1
      //   213: astore_2
      //   214: aload #7
      //   216: invokespecial <init> : ()V
      //   219: aload_1
      //   220: astore_2
      //   221: aload #7
      //   223: ldc 'Couldn't read Pixmap from file ''
      //   225: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   228: pop
      //   229: aload_1
      //   230: astore_2
      //   231: aload #7
      //   233: aload_0
      //   234: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   237: pop
      //   238: aload_1
      //   239: astore_2
      //   240: aload #7
      //   242: ldc '''
      //   244: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   247: pop
      //   248: aload_1
      //   249: astore_2
      //   250: aload #6
      //   252: aload #7
      //   254: invokevirtual toString : ()Ljava/lang/String;
      //   257: aload_3
      //   258: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
      //   261: aload_1
      //   262: astore_2
      //   263: aload #6
      //   265: athrow
      //   266: astore_0
      //   267: aload_2
      //   268: invokestatic closeQuietly : (Ljava/io/Closeable;)V
      //   271: goto -> 276
      //   274: aload_0
      //   275: athrow
      //   276: goto -> 274
      // Exception table:
      //   from	to	target	type
      //   0	30	195	java/lang/Exception
      //   0	30	189	finally
      //   32	38	185	java/lang/Exception
      //   32	38	266	finally
      //   40	46	185	java/lang/Exception
      //   40	46	266	finally
      //   48	56	185	java/lang/Exception
      //   48	56	266	finally
      //   58	63	185	java/lang/Exception
      //   58	63	266	finally
      //   65	75	185	java/lang/Exception
      //   65	75	266	finally
      //   77	84	185	java/lang/Exception
      //   77	84	266	finally
      //   86	93	185	java/lang/Exception
      //   86	93	266	finally
      //   95	106	185	java/lang/Exception
      //   95	106	266	finally
      //   108	112	185	java/lang/Exception
      //   108	112	266	finally
      //   114	116	185	java/lang/Exception
      //   114	116	266	finally
      //   116	125	176	finally
      //   130	142	176	finally
      //   145	147	176	finally
      //   149	156	185	java/lang/Exception
      //   149	156	266	finally
      //   158	169	185	java/lang/Exception
      //   158	169	266	finally
      //   178	180	176	finally
      //   182	185	185	java/lang/Exception
      //   182	185	266	finally
      //   200	205	266	finally
      //   207	212	266	finally
      //   214	219	266	finally
      //   221	229	266	finally
      //   231	238	266	finally
      //   240	248	266	finally
      //   250	261	266	finally
      //   263	266	266	finally }
    
    public static void write(FileHandle param1FileHandle, Pixmap param1Pixmap) { // Byte code:
      //   0: aconst_null
      //   1: astore_2
      //   2: aconst_null
      //   3: astore_3
      //   4: aload_3
      //   5: astore #4
      //   7: new java/util/zip/DeflaterOutputStream
      //   10: astore #5
      //   12: aload_3
      //   13: astore #4
      //   15: aload #5
      //   17: aload_0
      //   18: iconst_0
      //   19: invokevirtual write : (Z)Ljava/io/OutputStream;
      //   22: invokespecial <init> : (Ljava/io/OutputStream;)V
      //   25: aload_3
      //   26: astore #4
      //   28: new java/io/DataOutputStream
      //   31: astore #6
      //   33: aload_3
      //   34: astore #4
      //   36: aload #6
      //   38: aload #5
      //   40: invokespecial <init> : (Ljava/io/OutputStream;)V
      //   43: aload #6
      //   45: aload_1
      //   46: invokevirtual getWidth : ()I
      //   49: invokevirtual writeInt : (I)V
      //   52: aload #6
      //   54: aload_1
      //   55: invokevirtual getHeight : ()I
      //   58: invokevirtual writeInt : (I)V
      //   61: aload #6
      //   63: aload_1
      //   64: invokevirtual getFormat : ()Lcom/badlogic/gdx/graphics/Pixmap$Format;
      //   67: invokestatic toGdx2DPixmapFormat : (Lcom/badlogic/gdx/graphics/Pixmap$Format;)I
      //   70: invokevirtual writeInt : (I)V
      //   73: aload_1
      //   74: invokevirtual getPixels : ()Ljava/nio/ByteBuffer;
      //   77: astore #4
      //   79: aload #4
      //   81: iconst_0
      //   82: invokevirtual position : (I)Ljava/nio/Buffer;
      //   85: pop
      //   86: aload #4
      //   88: aload #4
      //   90: invokevirtual capacity : ()I
      //   93: invokevirtual limit : (I)Ljava/nio/Buffer;
      //   96: pop
      //   97: aload #4
      //   99: invokevirtual capacity : ()I
      //   102: sipush #32000
      //   105: irem
      //   106: istore #7
      //   108: aload #4
      //   110: invokevirtual capacity : ()I
      //   113: sipush #32000
      //   116: idiv
      //   117: istore #8
      //   119: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.writeBuffer : [B
      //   122: astore_1
      //   123: aload_1
      //   124: monitorenter
      //   125: iconst_0
      //   126: istore #9
      //   128: iload #9
      //   130: iload #8
      //   132: if_icmpge -> 158
      //   135: aload #4
      //   137: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.writeBuffer : [B
      //   140: invokevirtual get : ([B)Ljava/nio/ByteBuffer;
      //   143: pop
      //   144: aload #6
      //   146: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.writeBuffer : [B
      //   149: invokevirtual write : ([B)V
      //   152: iinc #9, 1
      //   155: goto -> 128
      //   158: aload #4
      //   160: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.writeBuffer : [B
      //   163: iconst_0
      //   164: iload #7
      //   166: invokevirtual get : ([BII)Ljava/nio/ByteBuffer;
      //   169: pop
      //   170: aload #6
      //   172: getstatic com/badlogic/gdx/graphics/PixmapIO$CIM.writeBuffer : [B
      //   175: iconst_0
      //   176: iload #7
      //   178: invokevirtual write : ([BII)V
      //   181: aload_1
      //   182: monitorexit
      //   183: aload #4
      //   185: iconst_0
      //   186: invokevirtual position : (I)Ljava/nio/Buffer;
      //   189: pop
      //   190: aload #4
      //   192: aload #4
      //   194: invokevirtual capacity : ()I
      //   197: invokevirtual limit : (I)Ljava/nio/Buffer;
      //   200: pop
      //   201: aload #6
      //   203: invokestatic closeQuietly : (Ljava/io/Closeable;)V
      //   206: return
      //   207: astore #4
      //   209: aload_1
      //   210: monitorexit
      //   211: aload #4
      //   213: athrow
      //   214: astore_0
      //   215: goto -> 310
      //   218: astore #4
      //   220: aload #6
      //   222: astore_1
      //   223: aload #4
      //   225: astore #6
      //   227: goto -> 242
      //   230: astore_0
      //   231: aload #4
      //   233: astore #6
      //   235: goto -> 310
      //   238: astore #6
      //   240: aload_2
      //   241: astore_1
      //   242: aload_1
      //   243: astore #4
      //   245: new com/badlogic/gdx/utils/GdxRuntimeException
      //   248: astore_2
      //   249: aload_1
      //   250: astore #4
      //   252: new java/lang/StringBuilder
      //   255: astore_3
      //   256: aload_1
      //   257: astore #4
      //   259: aload_3
      //   260: invokespecial <init> : ()V
      //   263: aload_1
      //   264: astore #4
      //   266: aload_3
      //   267: ldc 'Couldn't write Pixmap to file ''
      //   269: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   272: pop
      //   273: aload_1
      //   274: astore #4
      //   276: aload_3
      //   277: aload_0
      //   278: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   281: pop
      //   282: aload_1
      //   283: astore #4
      //   285: aload_3
      //   286: ldc '''
      //   288: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   291: pop
      //   292: aload_1
      //   293: astore #4
      //   295: aload_2
      //   296: aload_3
      //   297: invokevirtual toString : ()Ljava/lang/String;
      //   300: aload #6
      //   302: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
      //   305: aload_1
      //   306: astore #4
      //   308: aload_2
      //   309: athrow
      //   310: aload #6
      //   312: invokestatic closeQuietly : (Ljava/io/Closeable;)V
      //   315: goto -> 320
      //   318: aload_0
      //   319: athrow
      //   320: goto -> 318
      // Exception table:
      //   from	to	target	type
      //   7	12	238	java/lang/Exception
      //   7	12	230	finally
      //   15	25	238	java/lang/Exception
      //   15	25	230	finally
      //   28	33	238	java/lang/Exception
      //   28	33	230	finally
      //   36	43	238	java/lang/Exception
      //   36	43	230	finally
      //   43	125	218	java/lang/Exception
      //   43	125	214	finally
      //   135	152	207	finally
      //   158	183	207	finally
      //   183	201	218	java/lang/Exception
      //   183	201	214	finally
      //   209	211	207	finally
      //   211	214	218	java/lang/Exception
      //   211	214	214	finally
      //   245	249	230	finally
      //   252	256	230	finally
      //   259	263	230	finally
      //   266	273	230	finally
      //   276	282	230	finally
      //   285	292	230	finally
      //   295	305	230	finally
      //   308	310	230	finally }
  }
  
  public static class PNG implements Disposable {
    private static final byte COLOR_ARGB = 6;
    
    private static final byte COMPRESSION_DEFLATE = 0;
    
    private static final byte FILTER_NONE = 0;
    
    private static final int IDAT = 1229209940;
    
    private static final int IEND = 1229278788;
    
    private static final int IHDR = 1229472850;
    
    private static final byte INTERLACE_NONE = 0;
    
    private static final byte PAETH = 4;
    
    private static final byte[] SIGNATURE = { -119, 80, 78, 71, 13, 10, 26, 10 };
    
    private final ChunkBuffer buffer;
    
    private ByteArray curLineBytes;
    
    private final Deflater deflater;
    
    private boolean flipY = true;
    
    private int lastLineLen;
    
    private ByteArray lineOutBytes;
    
    private ByteArray prevLineBytes;
    
    public PNG() { this(16384); }
    
    public PNG(int param1Int) {
      this.buffer = new ChunkBuffer(param1Int);
      this.deflater = new Deflater();
    }
    
    public void dispose() { this.deflater.end(); }
    
    public void setCompression(int param1Int) { this.deflater.setLevel(param1Int); }
    
    public void setFlipY(boolean param1Boolean) { this.flipY = param1Boolean; }
    
    public void write(FileHandle param1FileHandle, Pixmap param1Pixmap) {
      outputStream = param1FileHandle.write(false);
      try {
        write(outputStream, param1Pixmap);
        return;
      } finally {
        StreamUtils.closeQuietly(outputStream);
      } 
    }
    
    public void write(OutputStream param1OutputStream, Pixmap param1Pixmap) throws IOException {
      byte b;
      byte[] arrayOfByte3;
      byte[] arrayOfByte2;
      DeflaterOutputStream deflaterOutputStream = new DeflaterOutputStream(this.buffer, this.deflater);
      DataOutputStream dataOutputStream = new DataOutputStream(param1OutputStream);
      dataOutputStream.write(SIGNATURE);
      this.buffer.writeInt(1229472850);
      this.buffer.writeInt(param1Pixmap.getWidth());
      this.buffer.writeInt(param1Pixmap.getHeight());
      this.buffer.writeByte(8);
      this.buffer.writeByte(6);
      this.buffer.writeByte(0);
      this.buffer.writeByte(0);
      this.buffer.writeByte(0);
      this.buffer.endChunk(dataOutputStream);
      this.buffer.writeInt(1229209940);
      this.deflater.reset();
      int i = param1Pixmap.getWidth() * 4;
      byte[] arrayOfByte1 = this.lineOutBytes;
      if (arrayOfByte1 == null) {
        arrayOfByte1 = new ByteArray(i);
        this.lineOutBytes = arrayOfByte1;
        arrayOfByte2 = arrayOfByte1.items;
        arrayOfByte1 = new ByteArray(i);
        this.curLineBytes = arrayOfByte1;
        arrayOfByte1 = arrayOfByte1.items;
        ByteArray byteArray = new ByteArray(i);
        this.prevLineBytes = byteArray;
        arrayOfByte3 = byteArray.items;
      } else {
        byte[] arrayOfByte4 = arrayOfByte1.ensureCapacity(i);
        byte[] arrayOfByte5 = this.curLineBytes.ensureCapacity(i);
        byte[] arrayOfByte6 = this.prevLineBytes.ensureCapacity(i);
        int n = this.lastLineLen;
        b = 0;
        while (true) {
          arrayOfByte2 = arrayOfByte4;
          arrayOfByte1 = arrayOfByte5;
          arrayOfByte3 = arrayOfByte6;
          if (b < n) {
            arrayOfByte6[b] = (byte)0;
            b++;
            continue;
          } 
          break;
        } 
      } 
      this.lastLineLen = i;
      ByteBuffer byteBuffer = param1Pixmap.getPixels();
      int k = byteBuffer.position();
      if (param1Pixmap.getFormat() == Pixmap.Format.RGBA8888) {
        b = 1;
      } else {
        b = 0;
      } 
      int m = param1Pixmap.getHeight();
      int j = 0;
      while (true) {
        byte[] arrayOfByte = arrayOfByte3;
        if (j < m) {
          if (this.flipY) {
            n = m - j - 1;
          } else {
            n = j;
          } 
          if (b) {
            byteBuffer.position(n * i);
            byteBuffer.get(arrayOfByte1, 0, i);
          } else {
            byte b1 = 0;
            byte b2 = 0;
            byte b3 = b;
            while (true) {
              b = b3;
              if (b1 < param1Pixmap.getWidth()) {
                int i2 = param1Pixmap.getPixel(b1, n);
                b = b2 + true;
                arrayOfByte1[b2] = (byte)(byte)(i2 >> 24 & 0xFF);
                b2 = b + 1;
                arrayOfByte1[b] = (byte)(byte)(i2 >> 16 & 0xFF);
                b = b2 + 1;
                arrayOfByte1[b2] = (byte)(byte)(i2 >> 8 & 0xFF);
                arrayOfByte1[b] = (byte)(byte)(i2 & 0xFF);
                b1++;
                b2 = b + 1;
                continue;
              } 
              break;
            } 
          } 
          arrayOfByte2[0] = (byte)(byte)(arrayOfByte1[0] - arrayOfByte[0]);
          arrayOfByte2[1] = (byte)(byte)(arrayOfByte1[1] - arrayOfByte[1]);
          arrayOfByte2[2] = (byte)(byte)(arrayOfByte1[2] - arrayOfByte[2]);
          arrayOfByte2[3] = (byte)(byte)(arrayOfByte1[3] - arrayOfByte[3]);
          int i1 = 4;
          int n = m;
          for (m = i1; m < i; m++) {
            i1 = m - 4;
            byte b5 = arrayOfByte1[i1] & 0xFF;
            byte b4 = arrayOfByte[m] & 0xFF;
            byte b6 = arrayOfByte[i1] & 0xFF;
            byte b7 = b5 + b4 - b6;
            byte b1 = b7 - b5;
            byte b3 = b1;
            if (b1 < 0)
              b3 = -b1; 
            byte b2 = b7 - b4;
            b1 = b2;
            if (b2 < 0)
              b1 = -b2; 
            b7 -= b6;
            b2 = b7;
            if (b7 < 0)
              b2 = -b7; 
            if (b3 <= b1 && b3 <= b2) {
              b3 = b5;
            } else if (b1 <= b2) {
              b3 = b4;
            } else {
              b3 = b6;
            } 
            arrayOfByte2[m] = (byte)(byte)(arrayOfByte1[m] - b3);
          } 
          deflaterOutputStream.write(4);
          deflaterOutputStream.write(arrayOfByte2, 0, i);
          j++;
          arrayOfByte3 = arrayOfByte1;
          arrayOfByte1 = arrayOfByte;
          m = n;
          continue;
        } 
        break;
      } 
      byteBuffer.position(k);
      deflaterOutputStream.finish();
      this.buffer.endChunk(dataOutputStream);
      this.buffer.writeInt(1229278788);
      this.buffer.endChunk(dataOutputStream);
      param1OutputStream.flush();
    }
    
    static class ChunkBuffer extends DataOutputStream {
      final ByteArrayOutputStream buffer;
      
      final CRC32 crc;
      
      ChunkBuffer(int param2Int) { this(new ByteArrayOutputStream(param2Int), new CRC32()); }
      
      private ChunkBuffer(ByteArrayOutputStream param2ByteArrayOutputStream, CRC32 param2CRC32) {
        super(new CheckedOutputStream(param2ByteArrayOutputStream, param2CRC32));
        this.buffer = param2ByteArrayOutputStream;
        this.crc = param2CRC32;
      }
      
      public void endChunk(DataOutputStream param2DataOutputStream) throws IOException {
        flush();
        param2DataOutputStream.writeInt(this.buffer.size() - 4);
        this.buffer.writeTo(param2DataOutputStream);
        param2DataOutputStream.writeInt((int)this.crc.getValue());
        this.buffer.reset();
        this.crc.reset();
      }
    }
  }
  
  static class ChunkBuffer extends DataOutputStream {
    final ByteArrayOutputStream buffer;
    
    final CRC32 crc;
    
    ChunkBuffer(int param1Int) { this(new ByteArrayOutputStream(param1Int), new CRC32()); }
    
    private ChunkBuffer(ByteArrayOutputStream param1ByteArrayOutputStream, CRC32 param1CRC32) {
      super(new CheckedOutputStream(param1ByteArrayOutputStream, param1CRC32));
      this.buffer = param1ByteArrayOutputStream;
      this.crc = param1CRC32;
    }
    
    public void endChunk(DataOutputStream param1DataOutputStream) throws IOException {
      flush();
      param1DataOutputStream.writeInt(this.buffer.size() - 4);
      this.buffer.writeTo(param1DataOutputStream);
      param1DataOutputStream.writeInt((int)this.crc.getValue());
      this.buffer.reset();
      this.crc.reset();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/PixmapIO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */