package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ETC1TextureData implements TextureData {
  ETC1.ETC1Data data;
  
  FileHandle file;
  
  int height = 0;
  
  boolean isPrepared = false;
  
  boolean useMipMaps;
  
  int width = 0;
  
  public ETC1TextureData(FileHandle paramFileHandle) { this(paramFileHandle, false); }
  
  public ETC1TextureData(FileHandle paramFileHandle, boolean paramBoolean) {
    this.file = paramFileHandle;
    this.useMipMaps = paramBoolean;
  }
  
  public ETC1TextureData(ETC1.ETC1Data paramETC1Data, boolean paramBoolean) {
    this.data = paramETC1Data;
    this.useMipMaps = paramBoolean;
  }
  
  public void consumeCustomData(int paramInt) {
    if (this.isPrepared) {
      if (!Gdx.graphics.supportsExtension("GL_OES_compressed_ETC1_RGB8_texture")) {
        Pixmap pixmap = ETC1.decodeImage(this.data, Pixmap.Format.RGB565);
        Gdx.gl.glTexImage2D(paramInt, 0, pixmap.getGLInternalFormat(), pixmap.getWidth(), pixmap.getHeight(), 0, pixmap.getGLFormat(), pixmap.getGLType(), pixmap.getPixels());
        if (this.useMipMaps)
          MipMapGenerator.generateMipMap(paramInt, pixmap, pixmap.getWidth(), pixmap.getHeight()); 
        pixmap.dispose();
        this.useMipMaps = false;
      } else {
        Gdx.gl.glCompressedTexImage2D(paramInt, 0, ETC1.ETC1_RGB8_OES, this.width, this.height, 0, this.data.compressedData.capacity() - this.data.dataOffset, this.data.compressedData);
        if (useMipMaps())
          Gdx.gl20.glGenerateMipmap(3553); 
      } 
      this.data.dispose();
      this.data = null;
      this.isPrepared = false;
      return;
    } 
    throw new GdxRuntimeException("Call prepare() before calling consumeCompressedData()");
  }
  
  public Pixmap consumePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public boolean disposePixmap() { throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap"); }
  
  public Pixmap.Format getFormat() { return Pixmap.Format.RGB565; }
  
  public int getHeight() { return this.height; }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Custom; }
  
  public int getWidth() { return this.width; }
  
  public boolean isManaged() { return true; }
  
  public boolean isPrepared() { return this.isPrepared; }
  
  public void prepare() {
    if (!this.isPrepared) {
      if (this.file != null || this.data != null) {
        FileHandle fileHandle = this.file;
        if (fileHandle != null)
          this.data = new ETC1.ETC1Data(fileHandle); 
        this.width = this.data.width;
        this.height = this.data.height;
        this.isPrepared = true;
        return;
      } 
      throw new GdxRuntimeException("Can only load once from ETC1Data");
    } 
    throw new GdxRuntimeException("Already prepared");
  }
  
  public boolean useMipMaps() { return this.useMipMaps; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/ETC1TextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */