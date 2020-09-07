package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class PixmapTextureData implements TextureData {
  final boolean disposePixmap;
  
  final Pixmap.Format format;
  
  final boolean managed;
  
  final Pixmap pixmap;
  
  final boolean useMipMaps;
  
  public PixmapTextureData(Pixmap paramPixmap, Pixmap.Format paramFormat, boolean paramBoolean1, boolean paramBoolean2) { this(paramPixmap, paramFormat, paramBoolean1, paramBoolean2, false); }
  
  public PixmapTextureData(Pixmap paramPixmap, Pixmap.Format paramFormat, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {
    this.pixmap = paramPixmap;
    Pixmap.Format format1 = paramFormat;
    if (paramFormat == null)
      format1 = paramPixmap.getFormat(); 
    this.format = format1;
    this.useMipMaps = paramBoolean1;
    this.disposePixmap = paramBoolean2;
    this.managed = paramBoolean3;
  }
  
  public void consumeCustomData(int paramInt) { throw new GdxRuntimeException("This TextureData implementation does not upload data itself"); }
  
  public Pixmap consumePixmap() { return this.pixmap; }
  
  public boolean disposePixmap() { return this.disposePixmap; }
  
  public Pixmap.Format getFormat() { return this.format; }
  
  public int getHeight() { return this.pixmap.getHeight(); }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Pixmap; }
  
  public int getWidth() { return this.pixmap.getWidth(); }
  
  public boolean isManaged() { return this.managed; }
  
  public boolean isPrepared() { return true; }
  
  public void prepare() { throw new GdxRuntimeException("prepare() must not be called on a PixmapTextureData instance as it is already prepared."); }
  
  public boolean useMipMaps() { return this.useMipMaps; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/PixmapTextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */