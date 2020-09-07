package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import java.io.InputStream;

public interface BaseJsonReader {
  JsonValue parse(FileHandle paramFileHandle);
  
  JsonValue parse(InputStream paramInputStream);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/BaseJsonReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */