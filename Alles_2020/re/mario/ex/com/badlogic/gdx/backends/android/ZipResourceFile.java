package com.badlogic.gdx.backends.android;

import android.content.res.AssetFileDescriptor;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.EOFException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Collection;
import java.util.HashMap;
import java.util.Vector;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class ZipResourceFile {
  static final boolean LOGV = false;
  
  static final String LOG_TAG = "zipro";
  
  static final int kCDECRC = 16;
  
  static final int kCDECommentLen = 32;
  
  static final int kCDECompLen = 20;
  
  static final int kCDEExtraLen = 30;
  
  static final int kCDELen = 46;
  
  static final int kCDELocalOffset = 42;
  
  static final int kCDEMethod = 10;
  
  static final int kCDEModWhen = 12;
  
  static final int kCDENameLen = 28;
  
  static final int kCDESignature = 33639248;
  
  static final int kCDEUncompLen = 24;
  
  static final int kCompressDeflated = 8;
  
  static final int kCompressStored = 0;
  
  static final int kEOCDFileOffset = 16;
  
  static final int kEOCDLen = 22;
  
  static final int kEOCDNumEntries = 8;
  
  static final int kEOCDSignature = 101010256;
  
  static final int kEOCDSize = 12;
  
  static final int kLFHExtraLen = 28;
  
  static final int kLFHLen = 30;
  
  static final int kLFHNameLen = 26;
  
  static final int kLFHSignature = 67324752;
  
  static final int kMaxCommentLen = 65535;
  
  static final int kMaxEOCDSearch = 65557;
  
  static final int kZipEntryAdj = 10000;
  
  private HashMap<String, ZipEntryRO> mHashMap = new HashMap();
  
  ByteBuffer mLEByteBuffer = ByteBuffer.allocate(4);
  
  public HashMap<File, ZipFile> mZipFiles = new HashMap();
  
  public ZipResourceFile(String paramString) throws IOException { addPatchFile(paramString); }
  
  private static int read4LE(RandomAccessFile paramRandomAccessFile) throws EOFException, IOException { return swapEndian(paramRandomAccessFile.readInt()); }
  
  private static int swapEndian(int paramInt) { return ((paramInt & 0xFF) << 24) + ((0xFF00 & paramInt) << 8) + ((0xFF0000 & paramInt) >>> 8) + (paramInt >>> 24 & 0xFF); }
  
  private static int swapEndian(short paramShort) { return (paramShort & 0xFF00) >>> 8 | (paramShort & 0xFF) << 8; }
  
  void addPatchFile(String paramString) throws IOException {
    String str = paramString;
    File file = new File(str);
    RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
    long l = randomAccessFile.length();
    if (l >= 22L) {
      long l1 = 65557L;
      if (65557L > l)
        l1 = l; 
      randomAccessFile.seek(0L);
      int i = read4LE(randomAccessFile);
      if (i != 101010256) {
        if (i == 67324752) {
          randomAccessFile.seek(l - l1);
          ByteBuffer byteBuffer = ByteBuffer.allocate((int)l1);
          byte[] arrayOfByte = byteBuffer.array();
          randomAccessFile.readFully(arrayOfByte);
          byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
          for (i = arrayOfByte.length - 22; i >= 0 && (arrayOfByte[i] != 80 || byteBuffer.getInt(i) != 101010256); i--);
          if (i < 0) {
            StringBuilder stringBuilder1 = new StringBuilder();
            stringBuilder1.append("Zip: EOCD not found, ");
            stringBuilder1.append(str);
            stringBuilder1.append(" is not zip");
            Log.d("zipro", stringBuilder1.toString());
          } 
          short s = byteBuffer.getShort(i + 8);
          l1 = byteBuffer.getInt(i + 12) & 0xFFFFFFFFL;
          long l2 = byteBuffer.getInt(i + 16) & 0xFFFFFFFFL;
          if (l2 + l1 <= l) {
            if (s != 0) {
              MappedByteBuffer mappedByteBuffer = randomAccessFile.getChannel().map(FileChannel.MapMode.READ_ONLY, l2, l1);
              mappedByteBuffer.order(ByteOrder.LITTLE_ENDIAN);
              byte[] arrayOfByte1 = new byte[65535];
              ByteBuffer byteBuffer1 = ByteBuffer.allocate(30);
              byteBuffer1.order(ByteOrder.LITTLE_ENDIAN);
              byte b = 0;
              i = 0;
              while (b < s) {
                if (mappedByteBuffer.getInt(i) == 33639248) {
                  short s1 = mappedByteBuffer.getShort(i + 28) & 0xFFFF;
                  short s2 = mappedByteBuffer.getShort(i + 30);
                  short s3 = mappedByteBuffer.getShort(i + 32);
                  mappedByteBuffer.position(i + 46);
                  mappedByteBuffer.get(arrayOfByte1, 0, s1);
                  mappedByteBuffer.position(0);
                  String str1 = new String(arrayOfByte1, false, s1);
                  ZipEntryRO zipEntryRO = new ZipEntryRO(paramString, file, str1);
                  zipEntryRO.mMethod = mappedByteBuffer.getShort(i + 10) & 0xFFFF;
                  zipEntryRO.mWhenModified = mappedByteBuffer.getInt(i + 12) & 0xFFFFFFFFL;
                  zipEntryRO.mCRC32 = mappedByteBuffer.getLong(i + 16) & 0xFFFFFFFFL;
                  zipEntryRO.mCompressedLength = mappedByteBuffer.getLong(i + 20) & 0xFFFFFFFFL;
                  zipEntryRO.mUncompressedLength = mappedByteBuffer.getLong(i + 24) & 0xFFFFFFFFL;
                  zipEntryRO.mLocalHdrOffset = mappedByteBuffer.getInt(i + 42) & 0xFFFFFFFFL;
                  byteBuffer1.clear();
                  zipEntryRO.setOffsetFromFile(randomAccessFile, byteBuffer1);
                  this.mHashMap.put(str1, zipEntryRO);
                  i += s1 + 46 + (s2 & 0xFFFF) + (s3 & 0xFFFF);
                  b++;
                  continue;
                } 
                StringBuilder stringBuilder1 = new StringBuilder();
                stringBuilder1.append("Missed a central dir sig (at ");
                stringBuilder1.append(i);
                stringBuilder1.append(")");
                Log.w("zipro", stringBuilder1.toString());
                throw new IOException();
              } 
              return;
            } 
            Log.w("zipro", "empty archive?");
            throw new IOException();
          } 
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("bad offsets (dir ");
          stringBuilder.append(l2);
          stringBuilder.append(", size ");
          stringBuilder.append(l1);
          stringBuilder.append(", eocd ");
          stringBuilder.append(i);
          stringBuilder.append(")");
          Log.w("zipro", stringBuilder.toString());
          throw new IOException();
        } 
        Log.v("zipro", "Not a Zip archive");
        throw new IOException();
      } 
      Log.i("zipro", "Found Zip archive, but it looks empty");
      throw new IOException();
    } 
    randomAccessFile.close();
    IOException iOException = new IOException();
    throw iOException;
  }
  
  public ZipEntryRO[] getAllEntries() {
    Collection collection = this.mHashMap.values();
    return (ZipEntryRO[])collection.toArray(new ZipEntryRO[collection.size()]);
  }
  
  public AssetFileDescriptor getAssetFileDescriptor(String paramString) {
    ZipEntryRO zipEntryRO = (ZipEntryRO)this.mHashMap.get(paramString);
    return (zipEntryRO != null) ? zipEntryRO.getAssetFileDescriptor() : null;
  }
  
  ZipEntryRO[] getEntriesAt(String paramString) {
    Vector vector = new Vector();
    Collection collection = this.mHashMap.values();
    String str = paramString;
    if (paramString == null)
      str = ""; 
    int i = str.length();
    for (ZipEntryRO zipEntryRO : collection) {
      if (zipEntryRO.mFileName.startsWith(str) && -1 == zipEntryRO.mFileName.indexOf('/', i))
        vector.add(zipEntryRO); 
    } 
    return (ZipEntryRO[])vector.toArray(new ZipEntryRO[vector.size()]);
  }
  
  public InputStream getInputStream(String paramString) throws IOException {
    ZipEntryRO zipEntryRO = (ZipEntryRO)this.mHashMap.get(paramString);
    if (zipEntryRO != null) {
      if (zipEntryRO.isUncompressed())
        return zipEntryRO.getAssetFileDescriptor().createInputStream(); 
      ZipFile zipFile1 = (ZipFile)this.mZipFiles.get(zipEntryRO.getZipFile());
      ZipFile zipFile2 = zipFile1;
      if (zipFile1 == null) {
        zipFile2 = new ZipFile(zipEntryRO.getZipFile(), true);
        this.mZipFiles.put(zipEntryRO.getZipFile(), zipFile2);
      } 
      ZipEntry zipEntry = zipFile2.getEntry(paramString);
      if (zipEntry != null)
        return zipFile2.getInputStream(zipEntry); 
    } 
    return null;
  }
  
  public static final class ZipEntryRO {
    public long mCRC32;
    
    public long mCompressedLength;
    
    public final File mFile;
    
    public final String mFileName;
    
    public long mLocalHdrOffset;
    
    public int mMethod;
    
    public long mOffset = -1L;
    
    public long mUncompressedLength;
    
    public long mWhenModified;
    
    public final String mZipFileName;
    
    public ZipEntryRO(String param1String1, File param1File, String param1String2) {
      this.mFileName = param1String2;
      this.mZipFileName = param1String1;
      this.mFile = param1File;
    }
    
    public AssetFileDescriptor getAssetFileDescriptor() {
      if (this.mMethod == 0)
        try {
          return new AssetFileDescriptor(ParcelFileDescriptor.open(this.mFile, 268435456), getOffset(), this.mUncompressedLength);
        } catch (FileNotFoundException fileNotFoundException) {
          fileNotFoundException.printStackTrace();
        }  
      return null;
    }
    
    public long getOffset() { return this.mOffset; }
    
    public File getZipFile() { return this.mFile; }
    
    public String getZipFileName() { return this.mZipFileName; }
    
    public boolean isUncompressed() {
      boolean bool;
      if (this.mMethod == 0) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public void setOffsetFromFile(RandomAccessFile param1RandomAccessFile, ByteBuffer param1ByteBuffer) throws IOException {
      long l = this.mLocalHdrOffset;
      try {
        param1RandomAccessFile.seek(l);
        param1RandomAccessFile.readFully(param1ByteBuffer.array());
        if (param1ByteBuffer.getInt(0) == 67324752) {
          short s1 = param1ByteBuffer.getShort(26);
          short s2 = param1ByteBuffer.getShort(28);
          this.mOffset = l + 30L + (s1 & 0xFFFF) + (s2 & 0xFFFF);
        } else {
          Log.w("zipro", "didn't find signature at start of lfh");
          IOException iOException = new IOException();
          this();
          throw iOException;
        } 
      } catch (FileNotFoundException param1RandomAccessFile) {
        param1RandomAccessFile.printStackTrace();
      } catch (IOException param1RandomAccessFile) {
        param1RandomAccessFile.printStackTrace();
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/ZipResourceFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */