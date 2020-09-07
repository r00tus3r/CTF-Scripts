package com.badlogic.gdx.backends.android;

import android.content.res.AssetFileDescriptor;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;

public class AndroidZipFileHandle extends AndroidFileHandle {
  private ZipResourceFile expansionFile;
  
  private long fdLength;
  
  private boolean hasAssetFd;
  
  private String path;
  
  public AndroidZipFileHandle(File paramFile, Files.FileType paramFileType) {
    super(null, paramFile, paramFileType);
    initialize();
  }
  
  public AndroidZipFileHandle(String paramString) {
    super(null, paramString, Files.FileType.Internal);
    initialize();
  }
  
  private String getPath() { return this.path; }
  
  private void initialize() {
    this.path = this.file.getPath().replace('\\', '/');
    this.expansionFile = ((AndroidFiles)Gdx.files).getExpansionFile();
    assetFileDescriptor = this.expansionFile.getAssetFileDescriptor(getPath());
    if (assetFileDescriptor != null) {
      this.hasAssetFd = true;
      this.fdLength = assetFileDescriptor.getLength();
      try {
        assetFileDescriptor.close();
      } catch (IOException assetFileDescriptor) {}
    } else {
      this.hasAssetFd = false;
    } 
    if (isDirectory()) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(this.path);
      stringBuilder.append("/");
      this.path = stringBuilder.toString();
    } 
  }
  
  public FileHandle child(String paramString) { return (this.file.getPath().length() == 0) ? new AndroidZipFileHandle(new File(paramString), this.type) : new AndroidZipFileHandle(new File(this.file, paramString), this.type); }
  
  public boolean exists() { return (this.hasAssetFd || this.expansionFile.getEntriesAt(getPath()).length != 0); }
  
  public AssetFileDescriptor getAssetFileDescriptor() throws IOException { return this.expansionFile.getAssetFileDescriptor(getPath()); }
  
  public boolean isDirectory() { return this.hasAssetFd ^ true; }
  
  public long length() {
    long l;
    if (this.hasAssetFd) {
      l = this.fdLength;
    } else {
      l = 0L;
    } 
    return l;
  }
  
  public FileHandle[] list() {
    ZipResourceFile.ZipEntryRO[] arrayOfZipEntryRO = this.expansionFile.getEntriesAt(getPath());
    FileHandle[] arrayOfFileHandle = new FileHandle[arrayOfZipEntryRO.length - 1];
    int i = arrayOfZipEntryRO.length;
    byte b1 = 0;
    byte b2 = 0;
    while (b1 < i) {
      if ((arrayOfZipEntryRO[b1]).mFileName.length() != getPath().length()) {
        arrayOfFileHandle[b2] = new AndroidZipFileHandle((arrayOfZipEntryRO[b1]).mFileName);
        b2++;
      } 
      b1++;
    } 
    return arrayOfFileHandle;
  }
  
  public FileHandle[] list(FileFilter paramFileFilter) {
    FileHandle[] arrayOfFileHandle1;
    ZipResourceFile.ZipEntryRO[] arrayOfZipEntryRO = this.expansionFile.getEntriesAt(getPath());
    FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfZipEntryRO.length - 1];
    int i = arrayOfZipEntryRO.length;
    byte b1 = 0;
    byte b2 = 0;
    while (b1 < i) {
      if ((arrayOfZipEntryRO[b1]).mFileName.length() != getPath().length()) {
        AndroidZipFileHandle androidZipFileHandle = new AndroidZipFileHandle((arrayOfZipEntryRO[b1]).mFileName);
        if (paramFileFilter.accept(androidZipFileHandle.file())) {
          arrayOfFileHandle2[b2] = androidZipFileHandle;
          b2++;
        } 
      } 
      b1++;
    } 
    if (b2 < arrayOfFileHandle2.length) {
      arrayOfFileHandle1 = new FileHandle[b2];
      System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
    } else {
      arrayOfFileHandle1 = arrayOfFileHandle2;
    } 
    return arrayOfFileHandle1;
  }
  
  public FileHandle[] list(FilenameFilter paramFilenameFilter) {
    FileHandle[] arrayOfFileHandle1;
    ZipResourceFile.ZipEntryRO[] arrayOfZipEntryRO = this.expansionFile.getEntriesAt(getPath());
    FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfZipEntryRO.length - 1];
    int i = arrayOfZipEntryRO.length;
    byte b1 = 0;
    byte b2 = 0;
    while (b1 < i) {
      if ((arrayOfZipEntryRO[b1]).mFileName.length() != getPath().length()) {
        String str = (arrayOfZipEntryRO[b1]).mFileName;
        if (paramFilenameFilter.accept(this.file, str)) {
          arrayOfFileHandle2[b2] = new AndroidZipFileHandle(str);
          b2++;
        } 
      } 
      b1++;
    } 
    if (b2 < arrayOfFileHandle2.length) {
      arrayOfFileHandle1 = new FileHandle[b2];
      System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
    } else {
      arrayOfFileHandle1 = arrayOfFileHandle2;
    } 
    return arrayOfFileHandle1;
  }
  
  public FileHandle[] list(String paramString) {
    FileHandle[] arrayOfFileHandle1;
    ZipResourceFile.ZipEntryRO[] arrayOfZipEntryRO = this.expansionFile.getEntriesAt(getPath());
    FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfZipEntryRO.length - 1];
    int i = arrayOfZipEntryRO.length;
    byte b1 = 0;
    byte b2 = 0;
    while (b1 < i) {
      if ((arrayOfZipEntryRO[b1]).mFileName.length() != getPath().length()) {
        String str = (arrayOfZipEntryRO[b1]).mFileName;
        if (str.endsWith(paramString)) {
          arrayOfFileHandle2[b2] = new AndroidZipFileHandle(str);
          b2++;
        } 
      } 
      b1++;
    } 
    if (b2 < arrayOfFileHandle2.length) {
      arrayOfFileHandle1 = new FileHandle[b2];
      System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
    } else {
      arrayOfFileHandle1 = arrayOfFileHandle2;
    } 
    return arrayOfFileHandle1;
  }
  
  public FileHandle parent() {
    File file1 = this.file.getParentFile();
    File file2 = file1;
    if (file1 == null)
      file2 = new File(""); 
    return new AndroidZipFileHandle(file2.getPath());
  }
  
  public InputStream read() {
    try {
      return this.expansionFile.getInputStream(getPath());
    } catch (IOException iOException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(this.file);
      stringBuilder.append(" (ZipResourceFile)");
      throw new GdxRuntimeException(stringBuilder.toString(), iOException);
    } 
  }
  
  public FileHandle sibling(String paramString) {
    if (this.file.getPath().length() != 0)
      return Gdx.files.getFileHandle((new File(this.file.getParent(), paramString)).getPath(), this.type); 
    throw new GdxRuntimeException("Cannot get the sibling of the root.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidZipFileHandle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */