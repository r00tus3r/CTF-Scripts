package com.badlogic.gdx.assets.loaders.resolvers;

import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;

public class PrefixFileHandleResolver implements FileHandleResolver {
  private FileHandleResolver baseResolver;
  
  private String prefix;
  
  public PrefixFileHandleResolver(FileHandleResolver paramFileHandleResolver, String paramString) {
    this.baseResolver = paramFileHandleResolver;
    this.prefix = paramString;
  }
  
  public FileHandleResolver getBaseResolver() { return this.baseResolver; }
  
  public String getPrefix() { return this.prefix; }
  
  public FileHandle resolve(String paramString) {
    FileHandleResolver fileHandleResolver = this.baseResolver;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.prefix);
    stringBuilder.append(paramString);
    return fileHandleResolver.resolve(stringBuilder.toString());
  }
  
  public void setBaseResolver(FileHandleResolver paramFileHandleResolver) { this.baseResolver = paramFileHandleResolver; }
  
  public void setPrefix(String paramString) { this.prefix = paramString; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/resolvers/PrefixFileHandleResolver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */