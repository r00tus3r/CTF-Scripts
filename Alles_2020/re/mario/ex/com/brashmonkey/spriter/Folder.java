package com.brashmonkey.spriter;

public class Folder {
  private int filePointer = 0;
  
  final File[] files;
  
  public final int id;
  
  public final String name;
  
  Folder(int paramInt1, String paramString, int paramInt2) {
    this.id = paramInt1;
    this.name = paramString;
    this.files = new File[paramInt2];
  }
  
  void addFile(File paramFile) {
    File[] arrayOfFile = this.files;
    int i = this.filePointer;
    this.filePointer = i + 1;
    arrayOfFile[i] = paramFile;
  }
  
  public File getFile(int paramInt) { return this.files[paramInt]; }
  
  public File getFile(String paramString) {
    int i = getFileIndex(paramString);
    return (i >= 0) ? getFile(i) : null;
  }
  
  int getFileIndex(String paramString) {
    for (File file : this.files) {
      if (file.name.equals(paramString))
        return file.id; 
    } 
    return -1;
  }
  
  public String toString() {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(getClass().getSimpleName());
    stringBuilder1.append("|[id: ");
    stringBuilder1.append(this.id);
    stringBuilder1.append(", name: ");
    stringBuilder1.append(this.name);
    String str = stringBuilder1.toString();
    for (File file : this.files) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append("\n");
      stringBuilder.append(file);
      str = stringBuilder.toString();
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str);
    stringBuilder2.append("]");
    return stringBuilder2.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Folder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */