package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureArrayData;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FileTextureArrayData implements TextureArrayData {
  private int depth;
  
  private Pixmap.Format format;
  
  private boolean prepared;
  
  private TextureData[] textureDatas;
  
  boolean useMipMaps;
  
  public FileTextureArrayData(Pixmap.Format paramFormat, boolean paramBoolean, FileHandle[] paramArrayOfFileHandle) {
    this.format = paramFormat;
    this.useMipMaps = paramBoolean;
    this.depth = paramArrayOfFileHandle.length;
    this.textureDatas = new TextureData[paramArrayOfFileHandle.length];
    for (byte b = 0; b < paramArrayOfFileHandle.length; b++)
      this.textureDatas[b] = TextureData.Factory.loadFromFile(paramArrayOfFileHandle[b], paramFormat, paramBoolean); 
  }
  
  public void consumeTextureArrayData() {
    byte b = 0;
    while (true) {
      TextureData[] arrayOfTextureData = this.textureDatas;
      if (b < arrayOfTextureData.length) {
        if (arrayOfTextureData[b].getType() == TextureData.TextureDataType.Custom) {
          this.textureDatas[b].consumeCustomData(35866);
        } else {
          Pixmap pixmap1;
          TextureData textureData = this.textureDatas[b];
          Pixmap pixmap2 = textureData.consumePixmap();
          boolean bool = textureData.disposePixmap();
          if (textureData.getFormat() != pixmap2.getFormat()) {
            pixmap1 = new Pixmap(pixmap2.getWidth(), pixmap2.getHeight(), textureData.getFormat());
            pixmap1.setBlending(Pixmap.Blending.None);
            pixmap1.drawPixmap(pixmap2, 0, 0, 0, 0, pixmap2.getWidth(), pixmap2.getHeight());
            if (textureData.disposePixmap())
              pixmap2.dispose(); 
            bool = true;
          } else {
            pixmap1 = pixmap2;
          } 
          Gdx.gl30.glTexSubImage3D(35866, 0, 0, 0, b, pixmap1.getWidth(), pixmap1.getHeight(), 1, pixmap1.getGLInternalFormat(), pixmap1.getGLType(), pixmap1.getPixels());
          if (bool)
            pixmap1.dispose(); 
        } 
        b++;
        continue;
      } 
      break;
    } 
  }
  
  public int getDepth() { return this.depth; }
  
  public int getGLType() { return Pixmap.Format.toGlType(this.format); }
  
  public int getHeight() { return this.textureDatas[0].getHeight(); }
  
  public int getInternalFormat() { return Pixmap.Format.toGlFormat(this.format); }
  
  public int getWidth() { return this.textureDatas[0].getWidth(); }
  
  public boolean isManaged() {
    TextureData[] arrayOfTextureData = this.textureDatas;
    int i = arrayOfTextureData.length;
    for (byte b = 0; b < i; b++) {
      if (!arrayOfTextureData[b].isManaged())
        return false; 
    } 
    return true;
  }
  
  public boolean isPrepared() { return this.prepared; }
  
  public void prepare() {
    TextureData[] arrayOfTextureData = this.textureDatas;
    int i = arrayOfTextureData.length;
    byte b = 0;
    int j = -1;
    int k = -1;
    while (b < i) {
      TextureData textureData = arrayOfTextureData[b];
      textureData.prepare();
      if (j == -1) {
        j = textureData.getWidth();
        k = textureData.getHeight();
      } else if (j != textureData.getWidth() || k != textureData.getHeight()) {
        throw new GdxRuntimeException("Error whilst preparing TextureArray: TextureArray Textures must have equal dimensions.");
      } 
      b++;
    } 
    this.prepared = true;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FileTextureArrayData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */