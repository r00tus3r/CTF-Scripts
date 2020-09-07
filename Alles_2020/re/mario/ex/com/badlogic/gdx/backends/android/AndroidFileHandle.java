package com.badlogic.gdx.backends.android;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class AndroidFileHandle extends FileHandle {
  private final AssetManager assets;
  
  AndroidFileHandle(AssetManager paramAssetManager, File paramFile, Files.FileType paramFileType) {
    super(paramFile, paramFileType);
    this.assets = paramAssetManager;
  }
  
  AndroidFileHandle(AssetManager paramAssetManager, String paramString, Files.FileType paramFileType) {
    super(paramString.replace('\\', '/'), paramFileType);
    this.assets = paramAssetManager;
  }
  
  public FileHandle child(String paramString) {
    paramString = paramString.replace('\\', '/');
    return (this.file.getPath().length() == 0) ? new AndroidFileHandle(this.assets, new File(paramString), this.type) : new AndroidFileHandle(this.assets, new File(this.file, paramString), this.type);
  }
  
  public boolean exists() {
    if (this.type == Files.FileType.Internal) {
      str = this.file.getPath();
      boolean bool = true;
      try {
        this.assets.open(str).close();
        return true;
      } catch (Exception exception) {
        try {
          int i = this.assets.list(str).length;
          if (i <= 0)
            bool = false; 
          return bool;
        } catch (Exception str) {
          return false;
        } 
      } 
    } 
    return super.exists();
  }
  
  public File file() { return (this.type == Files.FileType.Local) ? new File(Gdx.files.getLocalStoragePath(), this.file.getPath()) : super.file(); }
  
  public AssetFileDescriptor getAssetFileDescriptor() throws IOException {
    AssetManager assetManager = this.assets;
    if (assetManager != null) {
      AssetFileDescriptor assetFileDescriptor = assetManager.openFd(path());
    } else {
      assetManager = null;
    } 
    return assetManager;
  }
  
  public boolean isDirectory() {
    if (this.type == Files.FileType.Internal) {
      boolean bool = false;
      try {
        int i = this.assets.list(this.file.getPath()).length;
        if (i > 0)
          bool = true; 
      } catch (IOException iOException) {}
      return bool;
    } 
    return super.isDirectory();
  }
  
  public long lastModified() { return super.lastModified(); }
  
  public long length() {
    if (this.type == Files.FileType.Internal) {
      null = null;
      assetFileDescriptor = null;
      try {
        assetFileDescriptor1 = this.assets.openFd(this.file.getPath());
        assetFileDescriptor = assetFileDescriptor1;
        null = assetFileDescriptor1;
        return assetFileDescriptor1.getLength();
      } catch (IOException assetFileDescriptor) {
      
      } finally {
        if (assetFileDescriptor != null)
          try {
            assetFileDescriptor.close();
          } catch (IOException assetFileDescriptor) {} 
      } 
    } 
    return super.length();
  }
  
  public FileHandle[] list() {
    if (this.type == Files.FileType.Internal)
      try {
        String[] arrayOfString = this.assets.list(this.file.getPath());
        FileHandle[] arrayOfFileHandle = new FileHandle[arrayOfString.length];
        byte b = 0;
        int i = arrayOfFileHandle.length;
        while (b < i) {
          AssetManager assetManager = this.assets;
          File file = new File();
          this(this.file, arrayOfString[b]);
          arrayOfFileHandle[b] = new AndroidFileHandle(assetManager, file, this.type);
          b++;
        } 
        return arrayOfFileHandle;
      } catch (Exception exception) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Error listing children: ");
        stringBuilder.append(this.file);
        stringBuilder.append(" (");
        stringBuilder.append(this.type);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString(), exception);
      }  
    return super.list();
  }
  
  public FileHandle[] list(FileFilter paramFileFilter) {
    StringBuilder stringBuilder;
    if (this.type == Files.FileType.Internal)
      try {
        String[] arrayOfString = this.assets.list(this.file.getPath());
        FileHandle[] arrayOfFileHandle = new FileHandle[arrayOfString.length];
        int i = arrayOfFileHandle.length;
        byte b1 = 0;
        byte b2 = 0;
        while (b1 < i) {
          String str = arrayOfString[b1];
          AndroidFileHandle androidFileHandle = new AndroidFileHandle();
          AssetManager assetManager = this.assets;
          File file = new File();
          this(this.file, str);
          this(assetManager, file, this.type);
          if (paramFileFilter.accept(androidFileHandle.file())) {
            arrayOfFileHandle[b2] = androidFileHandle;
            b2++;
          } 
          b1++;
        } 
        if (b2 < arrayOfString.length) {
          stringBuilder = new FileHandle[b2];
          System.arraycopy(arrayOfFileHandle, 0, stringBuilder, 0, b2);
        } else {
          stringBuilder = arrayOfFileHandle;
        } 
        return stringBuilder;
      } catch (Exception exception) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("Error listing children: ");
        stringBuilder.append(this.file);
        stringBuilder.append(" (");
        stringBuilder.append(this.type);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString(), exception);
      }  
    return super.list(stringBuilder);
  }
  
  public FileHandle[] list(FilenameFilter paramFilenameFilter) {
    if (this.type == Files.FileType.Internal)
      try {
        FileHandle[] arrayOfFileHandle1;
        String[] arrayOfString = this.assets.list(this.file.getPath());
        FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfString.length];
        int i = arrayOfFileHandle2.length;
        byte b1 = 0;
        byte b2 = 0;
        while (b1 < i) {
          String str = arrayOfString[b1];
          if (paramFilenameFilter.accept(this.file, str)) {
            AssetManager assetManager = this.assets;
            File file = new File();
            this(this.file, str);
            arrayOfFileHandle2[b2] = new AndroidFileHandle(assetManager, file, this.type);
            b2++;
          } 
          b1++;
        } 
        if (b2 < arrayOfString.length) {
          arrayOfFileHandle1 = new FileHandle[b2];
          System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
        } else {
          arrayOfFileHandle1 = arrayOfFileHandle2;
        } 
        return arrayOfFileHandle1;
      } catch (Exception paramFilenameFilter) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Error listing children: ");
        stringBuilder.append(this.file);
        stringBuilder.append(" (");
        stringBuilder.append(this.type);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString(), paramFilenameFilter);
      }  
    return super.list(paramFilenameFilter);
  }
  
  public FileHandle[] list(String paramString) {
    if (this.type == Files.FileType.Internal)
      try {
        FileHandle[] arrayOfFileHandle1;
        String[] arrayOfString = this.assets.list(this.file.getPath());
        FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfString.length];
        int i = arrayOfFileHandle2.length;
        byte b1 = 0;
        byte b2 = 0;
        while (b1 < i) {
          String str = arrayOfString[b1];
          if (str.endsWith(paramString)) {
            AssetManager assetManager = this.assets;
            File file = new File();
            this(this.file, str);
            arrayOfFileHandle2[b2] = new AndroidFileHandle(assetManager, file, this.type);
            b2++;
          } 
          b1++;
        } 
        if (b2 < arrayOfString.length) {
          arrayOfFileHandle1 = new FileHandle[b2];
          System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
        } else {
          arrayOfFileHandle1 = arrayOfFileHandle2;
        } 
        return arrayOfFileHandle1;
      } catch (Exception paramString) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Error listing children: ");
        stringBuilder.append(this.file);
        stringBuilder.append(" (");
        stringBuilder.append(this.type);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString(), paramString);
      }  
    return super.list(paramString);
  }
  
  public ByteBuffer map(FileChannel.MapMode paramMapMode) {
    if (this.type == Files.FileType.Internal) {
      FileChannel.MapMode mapMode1 = null;
      GdxRuntimeException gdxRuntimeException = null;
      fileInputStream = gdxRuntimeException;
      try {
        AssetFileDescriptor assetFileDescriptor = getAssetFileDescriptor();
        fileInputStream = gdxRuntimeException;
        long l1 = assetFileDescriptor.getStartOffset();
        fileInputStream = gdxRuntimeException;
        long l2 = assetFileDescriptor.getDeclaredLength();
        fileInputStream = gdxRuntimeException;
        exception = new FileInputStream();
        fileInputStream = gdxRuntimeException;
        this(assetFileDescriptor.getFileDescriptor());
        try {
          mappedByteBuffer = exception.getChannel().map(paramMapMode, l1, l2);
          mappedByteBuffer.order(ByteOrder.nativeOrder());
          return mappedByteBuffer;
        } catch (Exception fileInputStream) {
          FileInputStream fileInputStream1 = exception;
        } finally {
          paramMapMode = null;
        } 
      } catch (Exception exception) {
        paramMapMode = mapMode1;
      } finally {}
      FileChannel.MapMode mapMode2 = paramMapMode;
      gdxRuntimeException = new GdxRuntimeException();
      mapMode2 = paramMapMode;
      StringBuilder stringBuilder = new StringBuilder();
      mapMode2 = paramMapMode;
      this();
      mapMode2 = paramMapMode;
      stringBuilder.append("Error memory mapping file: ");
      mapMode2 = paramMapMode;
      stringBuilder.append(this);
      mapMode2 = paramMapMode;
      stringBuilder.append(" (");
      mapMode2 = paramMapMode;
      stringBuilder.append(this.type);
      mapMode2 = paramMapMode;
      stringBuilder.append(")");
      mapMode2 = paramMapMode;
      this(stringBuilder.toString(), exception);
      mapMode2 = paramMapMode;
      throw gdxRuntimeException;
    } 
    return super.map(paramMapMode);
  }
  
  public FileHandle parent() {
    File file1 = this.file.getParentFile();
    File file2 = file1;
    if (file1 == null)
      if (this.type == Files.FileType.Absolute) {
        file2 = new File("/");
      } else {
        file2 = new File("");
      }  
    return new AndroidFileHandle(this.assets, file2, this.type);
  }
  
  public InputStream read() {
    if (this.type == Files.FileType.Internal)
      try {
        return this.assets.open(this.file.getPath());
      } catch (IOException iOException) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Error reading file: ");
        stringBuilder.append(this.file);
        stringBuilder.append(" (");
        stringBuilder.append(this.type);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString(), iOException);
      }  
    return super.read();
  }
  
  public FileHandle sibling(String paramString) {
    paramString = paramString.replace('\\', '/');
    if (this.file.getPath().length() != 0)
      return Gdx.files.getFileHandle((new File(this.file.getParent(), paramString)).getPath(), this.type); 
    throw new GdxRuntimeException("Cannot get the sibling of the root.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidFileHandle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */