package com.badlogic.gdx.assets.loaders.resolvers;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;

public class ResolutionFileResolver implements FileHandleResolver {
  protected final FileHandleResolver baseResolver;
  
  protected final Resolution[] descriptors;
  
  public ResolutionFileResolver(FileHandleResolver paramFileHandleResolver, Resolution... paramVarArgs) {
    if (paramVarArgs.length != 0) {
      this.baseResolver = paramFileHandleResolver;
      this.descriptors = paramVarArgs;
      return;
    } 
    throw new IllegalArgumentException("At least one Resolution needs to be supplied.");
  }
  
  public static Resolution choose(Resolution... paramVarArgs) {
    Resolution resolution2;
    int i = Gdx.graphics.getWidth();
    int j = Gdx.graphics.getHeight();
    int k = 0;
    int m = 0;
    Resolution resolution1 = paramVarArgs[0];
    if (i < j) {
      k = paramVarArgs.length;
      while (true) {
        resolution2 = resolution1;
        if (m < k) {
          Resolution resolution = paramVarArgs[m];
          resolution2 = resolution1;
          if (i >= resolution.portraitWidth) {
            resolution2 = resolution1;
            if (resolution.portraitWidth >= resolution1.portraitWidth) {
              resolution2 = resolution1;
              if (j >= resolution.portraitHeight) {
                resolution2 = resolution1;
                if (resolution.portraitHeight >= resolution1.portraitHeight)
                  resolution2 = paramVarArgs[m]; 
              } 
            } 
          } 
          m++;
          resolution1 = resolution2;
          continue;
        } 
        break;
      } 
    } else {
      int n = paramVarArgs.length;
      m = k;
      while (true) {
        resolution2 = resolution1;
        if (m < n) {
          Resolution resolution = paramVarArgs[m];
          resolution2 = resolution1;
          if (i >= resolution.portraitHeight) {
            resolution2 = resolution1;
            if (resolution.portraitHeight >= resolution1.portraitHeight) {
              resolution2 = resolution1;
              if (j >= resolution.portraitWidth) {
                resolution2 = resolution1;
                if (resolution.portraitWidth >= resolution1.portraitWidth)
                  resolution2 = paramVarArgs[m]; 
              } 
            } 
          } 
          m++;
          resolution1 = resolution2;
          continue;
        } 
        break;
      } 
    } 
    return resolution2;
  }
  
  public FileHandle resolve(String paramString) {
    Resolution resolution = choose(this.descriptors);
    FileHandle fileHandle2 = new FileHandle(paramString);
    fileHandle2 = this.baseResolver.resolve(resolve(fileHandle2, resolution.folder));
    FileHandle fileHandle1 = fileHandle2;
    if (!fileHandle2.exists())
      fileHandle1 = this.baseResolver.resolve(paramString); 
    return fileHandle1;
  }
  
  protected String resolve(FileHandle paramFileHandle, String paramString) {
    FileHandle fileHandle = paramFileHandle.parent();
    String str1 = "";
    String str2 = str1;
    if (fileHandle != null) {
      str2 = str1;
      if (!fileHandle.name().equals("")) {
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append(fileHandle);
        stringBuilder1.append("/");
        str2 = stringBuilder1.toString();
      } 
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(str2);
    stringBuilder.append(paramString);
    stringBuilder.append("/");
    stringBuilder.append(paramFileHandle.name());
    return stringBuilder.toString();
  }
  
  public static class Resolution {
    public final String folder;
    
    public final int portraitHeight;
    
    public final int portraitWidth;
    
    public Resolution(int param1Int1, int param1Int2, String param1String) {
      this.portraitWidth = param1Int1;
      this.portraitHeight = param1Int2;
      this.folder = param1String;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/resolvers/ResolutionFileResolver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */