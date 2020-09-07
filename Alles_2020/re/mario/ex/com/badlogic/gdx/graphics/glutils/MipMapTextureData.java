package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class MipMapTextureData implements TextureData {
  TextureData[] mips;
  
  public MipMapTextureData(TextureData... paramVarArgs) {
    this.mips = new TextureData[paramVarArgs.length];
    System.arraycopy(paramVarArgs, 0, this.mips, 0, paramVarArgs.length);
  }
  
  public void consumeCustomData(int paramInt) {
    byte b = 0;
    while (true) {
      TextureData[] arrayOfTextureData = this.mips;
      if (b < arrayOfTextureData.length) {
        GLTexture.uploadImageData(paramInt, arrayOfTextureData[b], b);
        b++;
        continue;
      } 
      break;
    } 
  }
  
  public Pixmap consumePixmap() { throw new GdxRuntimeException("It's compressed, use the compressed method"); }
  
  public boolean disposePixmap() { return false; }
  
  public Pixmap.Format getFormat() { return this.mips[0].getFormat(); }
  
  public int getHeight() { return this.mips[0].getHeight(); }
  
  public TextureData.TextureDataType getType() { return TextureData.TextureDataType.Custom; }
  
  public int getWidth() { return this.mips[0].getWidth(); }
  
  public boolean isManaged() { return true; }
  
  public boolean isPrepared() { return true; }
  
  public void prepare() {}
  
  public boolean useMipMaps() { return false; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/MipMapTextureData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */