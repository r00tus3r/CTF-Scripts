package com.brashmonkey.spriter;

import java.io.File;
import java.util.HashMap;

public abstract class Loader<R> extends Object {
  protected Data data;
  
  private boolean disposed;
  
  protected final HashMap<FileReference, R> resources;
  
  protected String root = "";
  
  public Loader(Data paramData) {
    this.data = paramData;
    this.resources = new HashMap(100);
  }
  
  protected void beginLoading() {}
  
  public void dispose() {
    this.resources.clear();
    this.data = null;
    this.root = "";
    this.disposed = true;
  }
  
  protected void finishLoading() {}
  
  public R get(FileReference paramFileReference) { return (R)this.resources.get(paramFileReference); }
  
  public boolean isDisposed() { return this.disposed; }
  
  public void load(File paramFile) { load(paramFile.getParent()); }
  
  public void load(String paramString) {
    this.root = paramString;
    beginLoading();
    for (Folder folder : this.data.folders) {
      for (File file : folder.files) {
        FileReference fileReference = new FileReference(folder.id, file.id);
        this.resources.put(fileReference, loadResource(fileReference));
      } 
    } 
    this.disposed = false;
    finishLoading();
  }
  
  protected abstract R loadResource(FileReference paramFileReference);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Loader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */