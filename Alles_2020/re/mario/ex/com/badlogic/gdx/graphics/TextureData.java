package com.badlogic.gdx.graphics;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.glutils.ETC1TextureData;
import com.badlogic.gdx.graphics.glutils.FileTextureData;
import com.badlogic.gdx.graphics.glutils.KTXTextureData;

public interface TextureData {
  void consumeCustomData(int paramInt);
  
  Pixmap consumePixmap();
  
  boolean disposePixmap();
  
  Pixmap.Format getFormat();
  
  int getHeight();
  
  TextureDataType getType();
  
  int getWidth();
  
  boolean isManaged();
  
  boolean isPrepared();
  
  void prepare();
  
  boolean useMipMaps();
  
  public static class Factory {
    public static TextureData loadFromFile(FileHandle param1FileHandle, Pixmap.Format param1Format, boolean param1Boolean) { return (param1FileHandle == null) ? null : (param1FileHandle.name().endsWith(".cim") ? new FileTextureData(param1FileHandle, PixmapIO.readCIM(param1FileHandle), param1Format, param1Boolean) : (param1FileHandle.name().endsWith(".etc1") ? new ETC1TextureData(param1FileHandle, param1Boolean) : ((param1FileHandle.name().endsWith(".ktx") || param1FileHandle.name().endsWith(".zktx")) ? new KTXTextureData(param1FileHandle, param1Boolean) : new FileTextureData(param1FileHandle, new Pixmap(param1FileHandle), param1Format, param1Boolean)))); }
    
    public static TextureData loadFromFile(FileHandle param1FileHandle, boolean param1Boolean) { return loadFromFile(param1FileHandle, null, param1Boolean); }
  }
  
  public enum TextureDataType {
    Custom, Pixmap;
    
    static  {
      Custom = new TextureDataType("Custom", true);
      $VALUES = new TextureDataType[] { Pixmap, Custom };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/TextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */