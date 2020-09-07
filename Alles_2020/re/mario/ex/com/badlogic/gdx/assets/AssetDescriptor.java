package com.badlogic.gdx.assets;

import com.badlogic.gdx.files.FileHandle;

public class AssetDescriptor<T> extends Object {
  public FileHandle file;
  
  public final String fileName;
  
  public final AssetLoaderParameters params;
  
  public final Class<T> type;
  
  public AssetDescriptor(FileHandle paramFileHandle, Class<T> paramClass) { this(paramFileHandle, paramClass, null); }
  
  public AssetDescriptor(FileHandle paramFileHandle, Class<T> paramClass, AssetLoaderParameters<T> paramAssetLoaderParameters) {
    this.fileName = paramFileHandle.path().replaceAll("\\\\", "/");
    this.file = paramFileHandle;
    this.type = paramClass;
    this.params = paramAssetLoaderParameters;
  }
  
  public AssetDescriptor(String paramString, Class<T> paramClass) { this(paramString, paramClass, null); }
  
  public AssetDescriptor(String paramString, Class<T> paramClass, AssetLoaderParameters<T> paramAssetLoaderParameters) {
    this.fileName = paramString.replaceAll("\\\\", "/");
    this.type = paramClass;
    this.params = paramAssetLoaderParameters;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.fileName);
    stringBuilder.append(", ");
    stringBuilder.append(this.type.getName());
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/AssetDescriptor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */