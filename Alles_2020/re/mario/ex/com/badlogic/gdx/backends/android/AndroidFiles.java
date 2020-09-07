package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.app.Fragment;
import android.content.res.AssetManager;
import android.os.Environment;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.IOException;

public class AndroidFiles implements Files {
  protected final AssetManager assets;
  
  private ZipResourceFile expansionFile;
  
  protected final String localpath;
  
  protected final String sdcard;
  
  public AndroidFiles(AssetManager paramAssetManager) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(Environment.getExternalStorageDirectory().getAbsolutePath());
    stringBuilder.append("/");
    this.sdcard = stringBuilder.toString();
    this.expansionFile = null;
    this.assets = paramAssetManager;
    this.localpath = this.sdcard;
  }
  
  public AndroidFiles(AssetManager paramAssetManager, String paramString) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(Environment.getExternalStorageDirectory().getAbsolutePath());
    stringBuilder.append("/");
    this.sdcard = stringBuilder.toString();
    this.expansionFile = null;
    this.assets = paramAssetManager;
    if (!paramString.endsWith("/")) {
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append(paramString);
      stringBuilder1.append("/");
      paramString = stringBuilder1.toString();
    } 
    this.localpath = paramString;
  }
  
  private FileHandle getZipFileHandleIfExists(FileHandle paramFileHandle, String paramString) {
    try {
      this.assets.open(paramString).close();
      return paramFileHandle;
    } catch (Exception exception) {
      AndroidZipFileHandle androidZipFileHandle = new AndroidZipFileHandle(paramString);
      return !androidZipFileHandle.isDirectory() ? androidZipFileHandle : (androidZipFileHandle.exists() ? androidZipFileHandle : paramFileHandle);
    } 
  }
  
  public FileHandle absolute(String paramString) { return new AndroidFileHandle(null, paramString, Files.FileType.Absolute); }
  
  public FileHandle classpath(String paramString) { return new AndroidFileHandle(null, paramString, Files.FileType.Classpath); }
  
  public FileHandle external(String paramString) { return new AndroidFileHandle(null, paramString, Files.FileType.External); }
  
  public ZipResourceFile getExpansionFile() { return this.expansionFile; }
  
  public String getExternalStoragePath() { return this.sdcard; }
  
  public FileHandle getFileHandle(String paramString, Files.FileType paramFileType) {
    AssetManager assetManager;
    if (paramFileType == Files.FileType.Internal) {
      assetManager = this.assets;
    } else {
      assetManager = null;
    } 
    AndroidFileHandle androidFileHandle = new AndroidFileHandle(assetManager, paramString, paramFileType);
    FileHandle fileHandle = androidFileHandle;
    if (this.expansionFile != null) {
      fileHandle = androidFileHandle;
      if (paramFileType == Files.FileType.Internal)
        fileHandle = getZipFileHandleIfExists(androidFileHandle, paramString); 
    } 
    return fileHandle;
  }
  
  public String getLocalStoragePath() { return this.localpath; }
  
  public FileHandle internal(String paramString) {
    AndroidFileHandle androidFileHandle = new AndroidFileHandle(this.assets, paramString, Files.FileType.Internal);
    FileHandle fileHandle = androidFileHandle;
    if (this.expansionFile != null)
      fileHandle = getZipFileHandleIfExists(androidFileHandle, paramString); 
    return fileHandle;
  }
  
  public boolean isExternalStorageAvailable() { return Environment.getExternalStorageState().equals("mounted"); }
  
  public boolean isLocalStorageAvailable() { return true; }
  
  public FileHandle local(String paramString) { return new AndroidFileHandle(null, paramString, Files.FileType.Local); }
  
  public boolean setAPKExpansion(int paramInt1, int paramInt2) {
    try {
      boolean bool;
      GdxRuntimeException gdxRuntimeException;
      if (Gdx.app instanceof Activity) {
        gdxRuntimeException = ((Activity)Gdx.app).getBaseContext();
      } else if (Gdx.app instanceof Fragment) {
        gdxRuntimeException = ((Fragment)Gdx.app).getActivity().getBaseContext();
      } else {
        gdxRuntimeException = new GdxRuntimeException();
        this("APK expansion not supported for application type");
        throw gdxRuntimeException;
      } 
      this.expansionFile = APKExpansionSupport.getAPKExpansionZipFile(gdxRuntimeException, paramInt1, paramInt2);
      if (this.expansionFile != null) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    } catch (IOException iOException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("APK expansion main version ");
      stringBuilder.append(paramInt1);
      stringBuilder.append(" or patch version ");
      stringBuilder.append(paramInt2);
      stringBuilder.append(" couldn't be opened!");
      throw new GdxRuntimeException(stringBuilder.toString());
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidFiles.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */