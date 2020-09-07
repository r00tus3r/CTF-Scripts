package com.badlogic.gdx.graphics;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.Gdx2DPixmap;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.IOException;
import java.nio.ByteBuffer;

public class Pixmap implements Disposable {
  private Blending blending = Blending.SourceOver;
  
  int color = 0;
  
  private boolean disposed;
  
  private Filter filter = Filter.BiLinear;
  
  final Gdx2DPixmap pixmap;
  
  public Pixmap(int paramInt1, int paramInt2, Format paramFormat) {
    this.pixmap = new Gdx2DPixmap(paramInt1, paramInt2, Format.toGdx2DPixmapFormat(paramFormat));
    setColor(0.0F, 0.0F, 0.0F, 0.0F);
    fill();
  }
  
  public Pixmap(FileHandle paramFileHandle) {
    try {
      byte[] arrayOfByte = paramFileHandle.readBytes();
      Gdx2DPixmap gdx2DPixmap = new Gdx2DPixmap();
      this(arrayOfByte, 0, arrayOfByte.length, 0);
      this.pixmap = gdx2DPixmap;
      return;
    } catch (Exception exception) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Couldn't load file: ");
      stringBuilder.append(paramFileHandle);
      throw new GdxRuntimeException(stringBuilder.toString(), exception);
    } 
  }
  
  public Pixmap(Gdx2DPixmap paramGdx2DPixmap) { this.pixmap = paramGdx2DPixmap; }
  
  public Pixmap(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
    try {
      Gdx2DPixmap gdx2DPixmap = new Gdx2DPixmap();
      this(paramArrayOfByte, paramInt1, paramInt2, 0);
      this.pixmap = gdx2DPixmap;
      return;
    } catch (IOException paramArrayOfByte) {
      throw new GdxRuntimeException("Couldn't load pixmap from image data", paramArrayOfByte);
    } 
  }
  
  public void dispose() {
    if (!this.disposed) {
      this.pixmap.dispose();
      this.disposed = true;
      return;
    } 
    throw new GdxRuntimeException("Pixmap already disposed!");
  }
  
  public void drawCircle(int paramInt1, int paramInt2, int paramInt3) { this.pixmap.drawCircle(paramInt1, paramInt2, paramInt3, this.color); }
  
  public void drawLine(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { this.pixmap.drawLine(paramInt1, paramInt2, paramInt3, paramInt4, this.color); }
  
  public void drawPixel(int paramInt1, int paramInt2) { this.pixmap.setPixel(paramInt1, paramInt2, this.color); }
  
  public void drawPixel(int paramInt1, int paramInt2, int paramInt3) { this.pixmap.setPixel(paramInt1, paramInt2, paramInt3); }
  
  public void drawPixmap(Pixmap paramPixmap, int paramInt1, int paramInt2) { drawPixmap(paramPixmap, paramInt1, paramInt2, 0, 0, paramPixmap.getWidth(), paramPixmap.getHeight()); }
  
  public void drawPixmap(Pixmap paramPixmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) { this.pixmap.drawPixmap(paramPixmap.pixmap, paramInt3, paramInt4, paramInt1, paramInt2, paramInt5, paramInt6); }
  
  public void drawPixmap(Pixmap paramPixmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) { this.pixmap.drawPixmap(paramPixmap.pixmap, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8); }
  
  public void drawRectangle(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { this.pixmap.drawRect(paramInt1, paramInt2, paramInt3, paramInt4, this.color); }
  
  public void fill() { this.pixmap.clear(this.color); }
  
  public void fillCircle(int paramInt1, int paramInt2, int paramInt3) { this.pixmap.fillCircle(paramInt1, paramInt2, paramInt3, this.color); }
  
  public void fillRectangle(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { this.pixmap.fillRect(paramInt1, paramInt2, paramInt3, paramInt4, this.color); }
  
  public void fillTriangle(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) { this.pixmap.fillTriangle(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, this.color); }
  
  public Blending getBlending() { return this.blending; }
  
  public Filter getFilter() { return this.filter; }
  
  public Format getFormat() { return Format.fromGdx2DPixmapFormat(this.pixmap.getFormat()); }
  
  public int getGLFormat() { return this.pixmap.getGLFormat(); }
  
  public int getGLInternalFormat() { return this.pixmap.getGLInternalFormat(); }
  
  public int getGLType() { return this.pixmap.getGLType(); }
  
  public int getHeight() { return this.pixmap.getHeight(); }
  
  public int getPixel(int paramInt1, int paramInt2) { return this.pixmap.getPixel(paramInt1, paramInt2); }
  
  public ByteBuffer getPixels() {
    if (!this.disposed)
      return this.pixmap.getPixels(); 
    throw new GdxRuntimeException("Pixmap already disposed");
  }
  
  public int getWidth() { return this.pixmap.getWidth(); }
  
  public boolean isDisposed() { return this.disposed; }
  
  public void setBlending(Blending paramBlending) {
    byte b;
    this.blending = paramBlending;
    Gdx2DPixmap gdx2DPixmap = this.pixmap;
    if (paramBlending == Blending.None) {
      b = 0;
    } else {
      b = 1;
    } 
    gdx2DPixmap.setBlend(b);
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.color = Color.rgba8888(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setColor(int paramInt) { this.color = paramInt; }
  
  public void setColor(Color paramColor) { this.color = Color.rgba8888(paramColor.r, paramColor.g, paramColor.b, paramColor.a); }
  
  public void setFilter(Filter paramFilter) {
    byte b;
    this.filter = paramFilter;
    Gdx2DPixmap gdx2DPixmap = this.pixmap;
    if (paramFilter == Filter.NearestNeighbour) {
      b = 0;
    } else {
      b = 1;
    } 
    gdx2DPixmap.setScale(b);
  }
  
  public enum Blending {
    None, SourceOver;
    
    static  {
      $VALUES = new Blending[] { None, SourceOver };
    }
  }
  
  public enum Filter {
    NearestNeighbour, BiLinear;
    
    static  {
      BiLinear = new Filter("BiLinear", true);
      $VALUES = new Filter[] { NearestNeighbour, BiLinear };
    }
  }
  
  public enum Format {
    Alpha, Intensity, LuminanceAlpha, RGB565, RGB888, RGBA4444, RGBA8888;
    
    static  {
      RGB888 = new Format("RGB888", 5);
      RGBA8888 = new Format("RGBA8888", 6);
      $VALUES = new Format[] { Alpha, Intensity, LuminanceAlpha, RGB565, RGBA4444, RGB888, RGBA8888 };
    }
    
    public static Format fromGdx2DPixmapFormat(int param1Int) {
      if (param1Int == 1)
        return Alpha; 
      if (param1Int == 2)
        return LuminanceAlpha; 
      if (param1Int == 5)
        return RGB565; 
      if (param1Int == 6)
        return RGBA4444; 
      if (param1Int == 3)
        return RGB888; 
      if (param1Int == 4)
        return RGBA8888; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Unknown Gdx2DPixmap Format: ");
      stringBuilder.append(param1Int);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public static int toGdx2DPixmapFormat(Format param1Format) {
      if (param1Format == Alpha)
        return 1; 
      if (param1Format == Intensity)
        return 1; 
      if (param1Format == LuminanceAlpha)
        return 2; 
      if (param1Format == RGB565)
        return 5; 
      if (param1Format == RGBA4444)
        return 6; 
      if (param1Format == RGB888)
        return 3; 
      if (param1Format == RGBA8888)
        return 4; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Unknown Format: ");
      stringBuilder.append(param1Format);
      throw new GdxRuntimeException(stringBuilder.toString());
    }
    
    public static int toGlFormat(Format param1Format) { return Gdx2DPixmap.toGlFormat(toGdx2DPixmapFormat(param1Format)); }
    
    public static int toGlType(Format param1Format) { return Gdx2DPixmap.toGlType(toGdx2DPixmapFormat(param1Format)); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Pixmap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */