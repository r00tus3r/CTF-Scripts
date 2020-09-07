package com.brashmonkey.spriter;

public class FileReference {
  public int file;
  
  public int folder;
  
  public FileReference(int paramInt1, int paramInt2) { set(paramInt1, paramInt2); }
  
  public boolean equals(Object paramObject) {
    boolean bool = paramObject instanceof FileReference;
    byte b = 0;
    int i = b;
    if (bool) {
      int j = this.file;
      paramObject = (FileReference)paramObject;
      i = b;
      if (j == paramObject.file) {
        i = b;
        if (this.folder == paramObject.folder)
          i = 1; 
      } 
    } 
    return i;
  }
  
  public boolean hasFile() {
    boolean bool;
    if (this.file != -1) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasFolder() {
    boolean bool;
    if (this.folder != -1) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int hashCode() { return this.folder * 10000 + this.file; }
  
  public void set(int paramInt1, int paramInt2) {
    this.folder = paramInt1;
    this.file = paramInt2;
  }
  
  public void set(FileReference paramFileReference) { set(paramFileReference.folder, paramFileReference.file); }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[folder: ");
    stringBuilder.append(this.folder);
    stringBuilder.append(", file: ");
    stringBuilder.append(this.file);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/FileReference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */