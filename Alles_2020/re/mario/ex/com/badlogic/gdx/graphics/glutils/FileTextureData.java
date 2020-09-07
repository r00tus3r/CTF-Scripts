package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.PixmapIO;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FileTextureData implements TextureData {
  final FileHandle file;
  
  Pixmap.Format format;
  
  int height = 0;
  
  boolean isPrepared = false;
  
  Pixmap pixmap;
  
  boolean useMipMaps;
  
  int width = 0;
  
  public FileTextureData(FileHandle paramFileHandle, Pixmap paramPixmap, Pixmap.Format paramFormat, boolean paramBoolean) {
    this.file = paramFileHandle;
    this.pixmap = paramPixmap;
    this.format = paramFormat;
    this.useMipMaps = paramBoolean;
    Pixmap pixmap1 = this.pixmap;
    if (pixmap1 != null) {
      this.width = pixmap1.getWidth();
      this.height = this.pixmap.getHeight();
      if (paramFormat == null)
        this.format = this.pixmap.getFormat(); 
    } 
  }
  
  public void consumeCustomData(int paramInt) { throw new GdxRuntimeException("This TextureData implementation does not upload data itself"); }
  
  public Pixmap consumePixmap() {
    if (this.isPrepared) {
      this.isPrepared = false;
      Pixmap pixmap1 = this.pixmap;
      this.pixmap = null;
      return pixmap1;
    } 
    throw new GdxRuntimeException("Call prepare() before calling getPixmap()");
  }
  
  public boolean disposePixmap() { return true; }
  
  public FileHandle getFileHandle() { return this.file; }
  
  public Pixmap.Format getFormat() { return this.format; }
  
  public int getHeight() { return this.height; }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Pixmap; }
  
  public int getWidth() { return this.width; }
  
  public boolean isManaged() { return true; }
  
  public boolean isPrepared() { return this.isPrepared; }
  
  public void prepare() {
    if (!this.isPrepared) {
      if (this.pixmap == null) {
        if (this.file.extension().equals("cim")) {
          this.pixmap = PixmapIO.readCIM(this.file);
        } else {
          this.pixmap = new Pixmap(this.file);
        } 
        this.width = this.pixmap.getWidth();
        this.height = this.pixmap.getHeight();
        if (this.format == null)
          this.format = this.pixmap.getFormat(); 
      } 
      this.isPrepared = true;
      return;
    } 
    throw new GdxRuntimeException("Already prepared");
  }
  
  public String toString() { return this.file.toString(); }
  
  public boolean useMipMaps() { return this.useMipMaps; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FileTextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */