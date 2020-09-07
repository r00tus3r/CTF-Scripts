package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;

public abstract class AssetLoader<T, P extends AssetLoaderParameters<T>> extends Object {
  private FileHandleResolver resolver;
  
  public AssetLoader(FileHandleResolver paramFileHandleResolver) { this.resolver = paramFileHandleResolver; }
  
  public abstract Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, P paramP);
  
  public FileHandle resolve(String paramString) { return this.resolver.resolve(paramString); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/AssetLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */