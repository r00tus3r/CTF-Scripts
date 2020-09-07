package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.CubemapData;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FacedCubemapData implements CubemapData {
  protected final TextureData[] data = new TextureData[6];
  
  public FacedCubemapData() { this(textureData, textureData, textureData, textureData, textureData, textureData); }
  
  public FacedCubemapData(int paramInt1, int paramInt2, int paramInt3, Pixmap.Format paramFormat) { this(new PixmapTextureData(new Pixmap(paramInt3, paramInt2, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt3, paramInt2, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt3, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt3, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt2, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt2, paramFormat), null, false, true)); }
  
  public FacedCubemapData(FileHandle paramFileHandle1, FileHandle paramFileHandle2, FileHandle paramFileHandle3, FileHandle paramFileHandle4, FileHandle paramFileHandle5, FileHandle paramFileHandle6) { this(TextureData.Factory.loadFromFile(paramFileHandle1, false), TextureData.Factory.loadFromFile(paramFileHandle2, false), TextureData.Factory.loadFromFile(paramFileHandle3, false), TextureData.Factory.loadFromFile(paramFileHandle4, false), TextureData.Factory.loadFromFile(paramFileHandle5, false), TextureData.Factory.loadFromFile(paramFileHandle6, false)); }
  
  public FacedCubemapData(FileHandle paramFileHandle1, FileHandle paramFileHandle2, FileHandle paramFileHandle3, FileHandle paramFileHandle4, FileHandle paramFileHandle5, FileHandle paramFileHandle6, boolean paramBoolean) { this(TextureData.Factory.loadFromFile(paramFileHandle1, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle2, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle3, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle4, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle5, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle6, paramBoolean)); }
  
  public FacedCubemapData(Pixmap paramPixmap1, Pixmap paramPixmap2, Pixmap paramPixmap3, Pixmap paramPixmap4, Pixmap paramPixmap5, Pixmap paramPixmap6) { this(paramPixmap1, paramPixmap2, paramPixmap3, paramPixmap4, paramPixmap5, paramPixmap6, false); }
  
  public FacedCubemapData(Pixmap paramPixmap1, Pixmap paramPixmap2, Pixmap paramPixmap3, Pixmap paramPixmap4, Pixmap paramPixmap5, Pixmap paramPixmap6, boolean paramBoolean) { this(pixmapTextureData1, pixmapTextureData2, pixmapTextureData3, pixmapTextureData4, pixmapTextureData5, pixmapTextureData6); }
  
  public FacedCubemapData(TextureData paramTextureData1, TextureData paramTextureData2, TextureData paramTextureData3, TextureData paramTextureData4, TextureData paramTextureData5, TextureData paramTextureData6) {
    TextureData[] arrayOfTextureData = this.data;
    arrayOfTextureData[0] = paramTextureData1;
    arrayOfTextureData[1] = paramTextureData2;
    arrayOfTextureData[2] = paramTextureData3;
    arrayOfTextureData[3] = paramTextureData4;
    arrayOfTextureData[4] = paramTextureData5;
    arrayOfTextureData[5] = paramTextureData6;
  }
  
  public void consumeCubemapData() {
    byte b = 0;
    while (true) {
      TextureData[] arrayOfTextureData = this.data;
      if (b < arrayOfTextureData.length) {
        if (arrayOfTextureData[b].getType() == TextureData.TextureDataType.Custom) {
          this.data[b].consumeCustomData('蔕' + b);
        } else {
          Pixmap pixmap2 = this.data[b].consumePixmap();
          boolean bool = this.data[b].disposePixmap();
          Pixmap pixmap1 = pixmap2;
          if (this.data[b].getFormat() != pixmap2.getFormat()) {
            pixmap1 = new Pixmap(pixmap2.getWidth(), pixmap2.getHeight(), this.data[b].getFormat());
            pixmap1.setBlending(Pixmap.Blending.None);
            pixmap1.drawPixmap(pixmap2, 0, 0, 0, 0, pixmap2.getWidth(), pixmap2.getHeight());
            if (this.data[b].disposePixmap())
              pixmap2.dispose(); 
            bool = true;
          } 
          Gdx.gl.glPixelStorei(3317, 1);
          Gdx.gl.glTexImage2D(b + '蔕', 0, pixmap1.getGLInternalFormat(), pixmap1.getWidth(), pixmap1.getHeight(), 0, pixmap1.getGLFormat(), pixmap1.getGLType(), pixmap1.getPixels());
          if (bool)
            pixmap1.dispose(); 
        } 
        b++;
        continue;
      } 
      break;
    } 
  }
  
  public int getHeight() { // Byte code:
    //   0: aload_0
    //   1: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   4: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   7: getfield index : I
    //   10: aaload
    //   11: ifnull -> 38
    //   14: aload_0
    //   15: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   18: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   21: getfield index : I
    //   24: aaload
    //   25: invokeinterface getHeight : ()I
    //   30: istore_1
    //   31: iload_1
    //   32: ifle -> 38
    //   35: goto -> 40
    //   38: iconst_0
    //   39: istore_1
    //   40: iload_1
    //   41: istore_2
    //   42: aload_0
    //   43: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   46: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   49: getfield index : I
    //   52: aaload
    //   53: ifnull -> 82
    //   56: aload_0
    //   57: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   60: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   63: getfield index : I
    //   66: aaload
    //   67: invokeinterface getHeight : ()I
    //   72: istore_3
    //   73: iload_1
    //   74: istore_2
    //   75: iload_3
    //   76: iload_1
    //   77: if_icmple -> 82
    //   80: iload_3
    //   81: istore_2
    //   82: iload_2
    //   83: istore_1
    //   84: aload_0
    //   85: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   88: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveX : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   91: getfield index : I
    //   94: aaload
    //   95: ifnull -> 124
    //   98: aload_0
    //   99: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   102: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveX : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   105: getfield index : I
    //   108: aaload
    //   109: invokeinterface getHeight : ()I
    //   114: istore_3
    //   115: iload_2
    //   116: istore_1
    //   117: iload_3
    //   118: iload_2
    //   119: if_icmple -> 124
    //   122: iload_3
    //   123: istore_1
    //   124: iload_1
    //   125: istore_2
    //   126: aload_0
    //   127: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   130: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeX : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   133: getfield index : I
    //   136: aaload
    //   137: ifnull -> 166
    //   140: aload_0
    //   141: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   144: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeX : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   147: getfield index : I
    //   150: aaload
    //   151: invokeinterface getHeight : ()I
    //   156: istore_3
    //   157: iload_1
    //   158: istore_2
    //   159: iload_3
    //   160: iload_1
    //   161: if_icmple -> 166
    //   164: iload_3
    //   165: istore_2
    //   166: iload_2
    //   167: ireturn }
  
  public TextureData getTextureData(Cubemap.CubemapSide paramCubemapSide) { return this.data[paramCubemapSide.index]; }
  
  public int getWidth() { // Byte code:
    //   0: aload_0
    //   1: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   4: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   7: getfield index : I
    //   10: aaload
    //   11: ifnull -> 38
    //   14: aload_0
    //   15: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   18: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   21: getfield index : I
    //   24: aaload
    //   25: invokeinterface getWidth : ()I
    //   30: istore_1
    //   31: iload_1
    //   32: ifle -> 38
    //   35: goto -> 40
    //   38: iconst_0
    //   39: istore_1
    //   40: iload_1
    //   41: istore_2
    //   42: aload_0
    //   43: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   46: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   49: getfield index : I
    //   52: aaload
    //   53: ifnull -> 82
    //   56: aload_0
    //   57: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   60: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeZ : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   63: getfield index : I
    //   66: aaload
    //   67: invokeinterface getWidth : ()I
    //   72: istore_3
    //   73: iload_1
    //   74: istore_2
    //   75: iload_3
    //   76: iload_1
    //   77: if_icmple -> 82
    //   80: iload_3
    //   81: istore_2
    //   82: iload_2
    //   83: istore_1
    //   84: aload_0
    //   85: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   88: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveY : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   91: getfield index : I
    //   94: aaload
    //   95: ifnull -> 124
    //   98: aload_0
    //   99: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   102: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.PositiveY : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   105: getfield index : I
    //   108: aaload
    //   109: invokeinterface getWidth : ()I
    //   114: istore_3
    //   115: iload_2
    //   116: istore_1
    //   117: iload_3
    //   118: iload_2
    //   119: if_icmple -> 124
    //   122: iload_3
    //   123: istore_1
    //   124: iload_1
    //   125: istore_2
    //   126: aload_0
    //   127: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   130: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeY : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   133: getfield index : I
    //   136: aaload
    //   137: ifnull -> 166
    //   140: aload_0
    //   141: getfield data : [Lcom/badlogic/gdx/graphics/TextureData;
    //   144: getstatic com/badlogic/gdx/graphics/Cubemap$CubemapSide.NegativeY : Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    //   147: getfield index : I
    //   150: aaload
    //   151: invokeinterface getWidth : ()I
    //   156: istore_3
    //   157: iload_1
    //   158: istore_2
    //   159: iload_3
    //   160: iload_1
    //   161: if_icmple -> 166
    //   164: iload_3
    //   165: istore_2
    //   166: iload_2
    //   167: ireturn }
  
  public boolean isComplete() {
    byte b = 0;
    while (true) {
      TextureData[] arrayOfTextureData = this.data;
      if (b < arrayOfTextureData.length) {
        if (arrayOfTextureData[b] == null)
          return false; 
        b++;
        continue;
      } 
      break;
    } 
    return true;
  }
  
  public boolean isManaged() {
    TextureData[] arrayOfTextureData = this.data;
    int i = arrayOfTextureData.length;
    for (byte b = 0; b < i; b++) {
      if (!arrayOfTextureData[b].isManaged())
        return false; 
    } 
    return true;
  }
  
  public boolean isPrepared() { return false; }
  
  public void load(Cubemap.CubemapSide paramCubemapSide, FileHandle paramFileHandle) { this.data[paramCubemapSide.index] = TextureData.Factory.loadFromFile(paramFileHandle, false); }
  
  public void load(Cubemap.CubemapSide paramCubemapSide, Pixmap paramPixmap) {
    PixmapTextureData pixmapTextureData;
    TextureData[] arrayOfTextureData = this.data;
    int i = paramCubemapSide.index;
    paramCubemapSide = null;
    if (paramPixmap != null)
      pixmapTextureData = new PixmapTextureData(paramPixmap, null, false, false); 
    arrayOfTextureData[i] = pixmapTextureData;
  }
  
  public void prepare() {
    if (isComplete()) {
      byte b = 0;
      while (true) {
        TextureData[] arrayOfTextureData = this.data;
        if (b < arrayOfTextureData.length) {
          if (!arrayOfTextureData[b].isPrepared())
            this.data[b].prepare(); 
          b++;
          continue;
        } 
        break;
      } 
      return;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("You need to complete your cubemap data before using it");
    throw gdxRuntimeException;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FacedCubemapData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */