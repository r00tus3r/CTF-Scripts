package com.badlogic.gdx;

import com.badlogic.gdx.files.FileHandle;

public interface Files {
  FileHandle absolute(String paramString);
  
  FileHandle classpath(String paramString);
  
  FileHandle external(String paramString);
  
  String getExternalStoragePath();
  
  FileHandle getFileHandle(String paramString, FileType paramFileType);
  
  String getLocalStoragePath();
  
  FileHandle internal(String paramString);
  
  boolean isExternalStorageAvailable();
  
  boolean isLocalStorageAvailable();
  
  FileHandle local(String paramString);
  
  public enum FileType {
    Absolute, Classpath, External, Internal, Local;
    
    static  {
      External = new FileType("External", 2);
      Absolute = new FileType("Absolute", 3);
      Local = new FileType("Local", 4);
      $VALUES = new FileType[] { Classpath, Internal, External, Absolute, Local };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Files.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */