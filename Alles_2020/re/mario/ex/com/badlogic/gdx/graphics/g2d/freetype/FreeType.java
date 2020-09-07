package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.LongMap;
import com.badlogic.gdx.utils.SharedLibraryLoader;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.util.Iterator;

public class FreeType {
  public static int FT_ENCODING_ADOBE_CUSTOM = 0;
  
  public static int FT_ENCODING_ADOBE_EXPERT = 0;
  
  public static int FT_ENCODING_ADOBE_LATIN_1 = 0;
  
  public static int FT_ENCODING_ADOBE_STANDARD = 0;
  
  public static int FT_ENCODING_APPLE_ROMAN = 0;
  
  public static int FT_ENCODING_BIG5 = 0;
  
  public static int FT_ENCODING_GB2312 = 0;
  
  public static int FT_ENCODING_JOHAB = 0;
  
  public static int FT_ENCODING_MS_SYMBOL = encode('s', 'y', 'm', 'b');
  
  public static int FT_ENCODING_NONE = 0;
  
  public static int FT_ENCODING_OLD_LATIN_2 = 0;
  
  public static int FT_ENCODING_SJIS = 0;
  
  public static int FT_ENCODING_UNICODE = encode('u', 'n', 'i', 'c');
  
  public static int FT_ENCODING_WANSUNG = 0;
  
  public static int FT_FACE_FLAG_CID_KEYED = 0;
  
  public static int FT_FACE_FLAG_EXTERNAL_STREAM = 0;
  
  public static int FT_FACE_FLAG_FAST_GLYPHS = 0;
  
  public static int FT_FACE_FLAG_FIXED_SIZES = 0;
  
  public static int FT_FACE_FLAG_FIXED_WIDTH = 0;
  
  public static int FT_FACE_FLAG_GLYPH_NAMES = 0;
  
  public static int FT_FACE_FLAG_HINTER = 0;
  
  public static int FT_FACE_FLAG_HORIZONTAL = 0;
  
  public static int FT_FACE_FLAG_KERNING = 0;
  
  public static int FT_FACE_FLAG_MULTIPLE_MASTERS = 0;
  
  public static int FT_FACE_FLAG_SCALABLE = 0;
  
  public static int FT_FACE_FLAG_SFNT = 0;
  
  public static int FT_FACE_FLAG_TRICKY = 0;
  
  public static int FT_FACE_FLAG_VERTICAL = 0;
  
  public static int FT_KERNING_DEFAULT = 0;
  
  public static int FT_KERNING_UNFITTED = 0;
  
  public static int FT_KERNING_UNSCALED = 0;
  
  public static int FT_LOAD_CROP_BITMAP = 0;
  
  public static int FT_LOAD_DEFAULT = 0;
  
  public static int FT_LOAD_FORCE_AUTOHINT = 0;
  
  public static int FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 0;
  
  public static int FT_LOAD_IGNORE_TRANSFORM = 0;
  
  public static int FT_LOAD_LINEAR_DESIGN = 0;
  
  public static int FT_LOAD_MONOCHROME = 0;
  
  public static int FT_LOAD_NO_AUTOHINT = 0;
  
  public static int FT_LOAD_NO_BITMAP = 0;
  
  public static int FT_LOAD_NO_HINTING = 0;
  
  public static int FT_LOAD_NO_RECURSE = 0;
  
  public static int FT_LOAD_NO_SCALE = 0;
  
  public static int FT_LOAD_PEDANTIC = 0;
  
  public static int FT_LOAD_RENDER = 0;
  
  public static int FT_LOAD_VERTICAL_LAYOUT = 0;
  
  public static int FT_PIXEL_MODE_GRAY = 2;
  
  public static int FT_PIXEL_MODE_GRAY2 = 3;
  
  public static int FT_PIXEL_MODE_GRAY4 = 4;
  
  public static int FT_PIXEL_MODE_LCD = 5;
  
  public static int FT_PIXEL_MODE_LCD_V = 6;
  
  public static int FT_PIXEL_MODE_MONO = 1;
  
  public static int FT_PIXEL_MODE_NONE;
  
  public static int FT_RENDER_MODE_LCD;
  
  public static int FT_RENDER_MODE_LCD_V;
  
  public static int FT_RENDER_MODE_LIGHT;
  
  public static int FT_RENDER_MODE_MAX;
  
  public static int FT_RENDER_MODE_MONO;
  
  public static int FT_RENDER_MODE_NORMAL;
  
  public static int FT_STROKER_LINECAP_BUTT;
  
  public static int FT_STROKER_LINECAP_ROUND;
  
  public static int FT_STROKER_LINECAP_SQUARE;
  
  public static int FT_STROKER_LINEJOIN_BEVEL;
  
  public static int FT_STROKER_LINEJOIN_MITER;
  
  public static int FT_STROKER_LINEJOIN_MITER_FIXED;
  
  public static int FT_STROKER_LINEJOIN_MITER_VARIABLE;
  
  public static int FT_STROKER_LINEJOIN_ROUND;
  
  public static int FT_STYLE_FLAG_BOLD;
  
  public static int FT_STYLE_FLAG_ITALIC;
  
  static  {
    FT_ENCODING_SJIS = encode('s', 'j', 'i', 's');
    FT_ENCODING_GB2312 = encode('g', 'b', ' ', ' ');
    FT_ENCODING_BIG5 = encode('b', 'i', 'g', '5');
    FT_ENCODING_WANSUNG = encode('w', 'a', 'n', 's');
    FT_ENCODING_JOHAB = encode('j', 'o', 'h', 'a');
    FT_ENCODING_ADOBE_STANDARD = encode('A', 'D', 'O', 'B');
    FT_ENCODING_ADOBE_EXPERT = encode('A', 'D', 'B', 'E');
    FT_ENCODING_ADOBE_CUSTOM = encode('A', 'D', 'B', 'C');
    FT_ENCODING_ADOBE_LATIN_1 = encode('l', 'a', 't', '1');
    FT_ENCODING_OLD_LATIN_2 = encode('l', 'a', 't', '2');
    FT_ENCODING_APPLE_ROMAN = encode('a', 'r', 'm', 'n');
    FT_FACE_FLAG_SCALABLE = 1;
    FT_FACE_FLAG_FIXED_SIZES = 2;
    FT_FACE_FLAG_FIXED_WIDTH = 4;
    FT_FACE_FLAG_SFNT = 8;
    FT_FACE_FLAG_HORIZONTAL = 16;
    FT_FACE_FLAG_VERTICAL = 32;
    FT_FACE_FLAG_KERNING = 64;
    FT_FACE_FLAG_FAST_GLYPHS = 128;
    FT_FACE_FLAG_MULTIPLE_MASTERS = 256;
    FT_FACE_FLAG_GLYPH_NAMES = 512;
    FT_FACE_FLAG_EXTERNAL_STREAM = 1024;
    FT_FACE_FLAG_HINTER = 2048;
    FT_FACE_FLAG_CID_KEYED = 4096;
    FT_FACE_FLAG_TRICKY = 8192;
    FT_STYLE_FLAG_ITALIC = 1;
    FT_STYLE_FLAG_BOLD = 2;
    FT_LOAD_DEFAULT = 0;
    FT_LOAD_NO_SCALE = 1;
    FT_LOAD_NO_HINTING = 2;
    FT_LOAD_RENDER = 4;
    FT_LOAD_NO_BITMAP = 8;
    FT_LOAD_VERTICAL_LAYOUT = 16;
    FT_LOAD_FORCE_AUTOHINT = 32;
    FT_LOAD_CROP_BITMAP = 64;
    FT_LOAD_PEDANTIC = 128;
    FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 512;
    FT_LOAD_NO_RECURSE = 1024;
    FT_LOAD_IGNORE_TRANSFORM = 2048;
    FT_LOAD_MONOCHROME = 4096;
    FT_LOAD_LINEAR_DESIGN = 8192;
    FT_LOAD_NO_AUTOHINT = 32768;
    FT_RENDER_MODE_NORMAL = 0;
    FT_RENDER_MODE_LIGHT = 1;
    FT_RENDER_MODE_MONO = 2;
    FT_RENDER_MODE_LCD = 3;
    FT_RENDER_MODE_LCD_V = 4;
    FT_RENDER_MODE_MAX = 5;
    FT_KERNING_DEFAULT = 0;
    FT_KERNING_UNFITTED = 1;
    FT_KERNING_UNSCALED = 2;
    FT_STROKER_LINECAP_BUTT = 0;
    FT_STROKER_LINECAP_ROUND = 1;
    FT_STROKER_LINECAP_SQUARE = 2;
    FT_STROKER_LINEJOIN_ROUND = 0;
    FT_STROKER_LINEJOIN_BEVEL = 1;
    FT_STROKER_LINEJOIN_MITER_VARIABLE = 2;
    FT_STROKER_LINEJOIN_MITER = FT_STROKER_LINEJOIN_MITER_VARIABLE;
    FT_STROKER_LINEJOIN_MITER_FIXED = 3;
  }
  
  private static int encode(char paramChar1, char paramChar2, char paramChar3, char paramChar4) { return paramChar1 << '\030' | paramChar2 << '\020' | paramChar3 << '\b' | paramChar4; }
  
  public static Library initFreeType() {
    (new SharedLibraryLoader()).load("gdx-freetype");
    long l = initFreeTypeJni();
    if (l != 0L)
      return new Library(l); 
    throw new GdxRuntimeException("Couldn't initialize FreeType library");
  }
  
  private static native long initFreeTypeJni();
  
  public static int toInt(int paramInt) {
    if (paramInt < 0) {
      paramInt -= 32;
      return paramInt >> 6;
    } 
    paramInt += 32;
    return paramInt >> 6;
  }
  
  public static class Bitmap extends Pointer {
    Bitmap(long param1Long) { super(param1Long); }
    
    private static native ByteBuffer getBuffer(long param1Long);
    
    private static native int getNumGray(long param1Long);
    
    private static native int getPitch(long param1Long);
    
    private static native int getPixelMode(long param1Long);
    
    private static native int getRows(long param1Long);
    
    private static native int getWidth(long param1Long);
    
    public ByteBuffer getBuffer() { return (getRows() == 0) ? BufferUtils.newByteBuffer(1) : getBuffer(this.address); }
    
    public int getNumGray() { return getNumGray(this.address); }
    
    public int getPitch() { return getPitch(this.address); }
    
    public int getPixelMode() { return getPixelMode(this.address); }
    
    public Pixmap getPixmap(Pixmap.Format param1Format) { return getPixmap(param1Format, Color.WHITE); }
    
    public Pixmap getPixmap(Pixmap.Format param1Format, Color param1Color) {
      Pixmap pixmap2;
      Pixmap pixmap1;
      int i = getWidth();
      ByteBuffer byteBuffer = getBuffer();
      if (param1Color == Color.WHITE) {
        pixmap2 = new Pixmap(i, getRows(), Pixmap.Format.Alpha);
        BufferUtils.copy(byteBuffer, pixmap2.getPixels(), pixmap2.getPixels().capacity());
      } else {
        Pixmap pixmap = new Pixmap(i, getRows(), Pixmap.Format.RGBA8888);
        int j = getPitch();
        int k = Color.rgba8888(pixmap2);
        IntBuffer intBuffer = pixmap.getPixels().asIntBuffer();
        int m = 0;
        while (true) {
          pixmap2 = pixmap;
          if (m < getRows()) {
            for (int n = 0; n < i; n++)
              intBuffer.put(m * i + n, (int)(((k & 0xFF) * (byteBuffer.get(m * j + n) & 0xFF)) / 255.0F) | k & 0xFFFFFF00); 
            m++;
            continue;
          } 
          break;
        } 
      } 
      if (param1Format != pixmap2.getFormat()) {
        Pixmap.Blending blending = (pixmap1 = new Pixmap(pixmap2.getWidth(), pixmap2.getHeight(), param1Format)).getBlending();
        Pixmap.setBlending(Pixmap.Blending.None);
        pixmap1.drawPixmap(pixmap2, 0, 0);
        Pixmap.setBlending(blending);
        pixmap2.dispose();
      } else {
        pixmap1 = pixmap2;
      } 
      return pixmap1;
    }
    
    public int getRows() { return getRows(this.address); }
    
    public int getWidth() { return getWidth(this.address); }
  }
  
  public static class Face extends Pointer implements Disposable {
    FreeType.Library library;
    
    public Face(long param1Long, FreeType.Library param1Library) {
      super(param1Long);
      this.library = param1Library;
    }
    
    private static native void doneFace(long param1Long);
    
    private static native int getAscender(long param1Long);
    
    private static native int getCharIndex(long param1Long, int param1Int);
    
    private static native int getDescender(long param1Long);
    
    private static native int getFaceFlags(long param1Long);
    
    private static native long getGlyph(long param1Long);
    
    private static native int getHeight(long param1Long);
    
    private static native int getKerning(long param1Long, int param1Int1, int param1Int2, int param1Int3);
    
    private static native int getMaxAdvanceHeight(long param1Long);
    
    private static native int getMaxAdvanceWidth(long param1Long);
    
    private static native int getNumGlyphs(long param1Long);
    
    private static native long getSize(long param1Long);
    
    private static native int getStyleFlags(long param1Long);
    
    private static native int getUnderlinePosition(long param1Long);
    
    private static native int getUnderlineThickness(long param1Long);
    
    private static native boolean hasKerning(long param1Long);
    
    private static native boolean loadChar(long param1Long, int param1Int1, int param1Int2);
    
    private static native boolean loadGlyph(long param1Long, int param1Int1, int param1Int2);
    
    private static native boolean selectSize(long param1Long, int param1Int);
    
    private static native boolean setCharSize(long param1Long, int param1Int1, int param1Int2, int param1Int3, int param1Int4);
    
    private static native boolean setPixelSizes(long param1Long, int param1Int1, int param1Int2);
    
    public void dispose() {
      doneFace(this.address);
      ByteBuffer byteBuffer = (ByteBuffer)this.library.fontData.get(this.address);
      if (byteBuffer != null) {
        this.library.fontData.remove(this.address);
        BufferUtils.disposeUnsafeByteBuffer(byteBuffer);
      } 
    }
    
    public int getAscender() { return getAscender(this.address); }
    
    public int getCharIndex(int param1Int) { return getCharIndex(this.address, param1Int); }
    
    public int getDescender() { return getDescender(this.address); }
    
    public int getFaceFlags() { return getFaceFlags(this.address); }
    
    public FreeType.GlyphSlot getGlyph() { return new FreeType.GlyphSlot(getGlyph(this.address)); }
    
    public int getHeight() { return getHeight(this.address); }
    
    public int getKerning(int param1Int1, int param1Int2, int param1Int3) { return getKerning(this.address, param1Int1, param1Int2, param1Int3); }
    
    public int getMaxAdvanceHeight() { return getMaxAdvanceHeight(this.address); }
    
    public int getMaxAdvanceWidth() { return getMaxAdvanceWidth(this.address); }
    
    public int getNumGlyphs() { return getNumGlyphs(this.address); }
    
    public FreeType.Size getSize() { return new FreeType.Size(getSize(this.address)); }
    
    public int getStyleFlags() { return getStyleFlags(this.address); }
    
    public int getUnderlinePosition() { return getUnderlinePosition(this.address); }
    
    public int getUnderlineThickness() { return getUnderlineThickness(this.address); }
    
    public boolean hasKerning() { return hasKerning(this.address); }
    
    public boolean loadChar(int param1Int1, int param1Int2) { return loadChar(this.address, param1Int1, param1Int2); }
    
    public boolean loadGlyph(int param1Int1, int param1Int2) { return loadGlyph(this.address, param1Int1, param1Int2); }
    
    public boolean selectSize(int param1Int) { return selectSize(this.address, param1Int); }
    
    public boolean setCharSize(int param1Int1, int param1Int2, int param1Int3, int param1Int4) { return setCharSize(this.address, param1Int1, param1Int2, param1Int3, param1Int4); }
    
    public boolean setPixelSizes(int param1Int1, int param1Int2) { return setPixelSizes(this.address, param1Int1, param1Int2); }
  }
  
  public static class Glyph extends Pointer implements Disposable {
    private boolean rendered;
    
    Glyph(long param1Long) { super(param1Long); }
    
    private static native void done(long param1Long);
    
    private static native long getBitmap(long param1Long);
    
    private static native int getLeft(long param1Long);
    
    private static native int getTop(long param1Long);
    
    private static native long strokeBorder(long param1Long1, long param1Long2, boolean param1Boolean);
    
    private static native long toBitmap(long param1Long, int param1Int);
    
    public void dispose() { done(this.address); }
    
    public FreeType.Bitmap getBitmap() {
      if (this.rendered)
        return new FreeType.Bitmap(getBitmap(this.address)); 
      throw new GdxRuntimeException("Glyph is not yet rendered");
    }
    
    public int getLeft() {
      if (this.rendered)
        return getLeft(this.address); 
      throw new GdxRuntimeException("Glyph is not yet rendered");
    }
    
    public int getTop() {
      if (this.rendered)
        return getTop(this.address); 
      throw new GdxRuntimeException("Glyph is not yet rendered");
    }
    
    public void strokeBorder(FreeType.Stroker param1Stroker, boolean param1Boolean) { this.address = strokeBorder(this.address, param1Stroker.address, param1Boolean); }
    
    public void toBitmap(int param1Int) {
      long l = toBitmap(this.address, param1Int);
      if (l != 0L) {
        this.address = l;
        this.rendered = true;
        return;
      } 
      throw new GdxRuntimeException("Couldn't render glyph");
    }
  }
  
  public static class GlyphMetrics extends Pointer {
    GlyphMetrics(long param1Long) { super(param1Long); }
    
    private static native int getHeight(long param1Long);
    
    private static native int getHoriAdvance(long param1Long);
    
    private static native int getHoriBearingX(long param1Long);
    
    private static native int getHoriBearingY(long param1Long);
    
    private static native int getVertAdvance(long param1Long);
    
    private static native int getVertBearingX(long param1Long);
    
    private static native int getVertBearingY(long param1Long);
    
    private static native int getWidth(long param1Long);
    
    public int getHeight() { return getHeight(this.address); }
    
    public int getHoriAdvance() { return getHoriAdvance(this.address); }
    
    public int getHoriBearingX() { return getHoriBearingX(this.address); }
    
    public int getHoriBearingY() { return getHoriBearingY(this.address); }
    
    public int getVertAdvance() { return getVertAdvance(this.address); }
    
    public int getVertBearingX() { return getVertBearingX(this.address); }
    
    public int getVertBearingY() { return getVertBearingY(this.address); }
    
    public int getWidth() { return getWidth(this.address); }
  }
  
  public static class GlyphSlot extends Pointer {
    GlyphSlot(long param1Long) { super(param1Long); }
    
    private static native int getAdvanceX(long param1Long);
    
    private static native int getAdvanceY(long param1Long);
    
    private static native long getBitmap(long param1Long);
    
    private static native int getBitmapLeft(long param1Long);
    
    private static native int getBitmapTop(long param1Long);
    
    private static native int getFormat(long param1Long);
    
    private static native long getGlyph(long param1Long);
    
    private static native int getLinearHoriAdvance(long param1Long);
    
    private static native int getLinearVertAdvance(long param1Long);
    
    private static native long getMetrics(long param1Long);
    
    private static native boolean renderGlyph(long param1Long, int param1Int);
    
    public int getAdvanceX() { return getAdvanceX(this.address); }
    
    public int getAdvanceY() { return getAdvanceY(this.address); }
    
    public FreeType.Bitmap getBitmap() { return new FreeType.Bitmap(getBitmap(this.address)); }
    
    public int getBitmapLeft() { return getBitmapLeft(this.address); }
    
    public int getBitmapTop() { return getBitmapTop(this.address); }
    
    public int getFormat() { return getFormat(this.address); }
    
    public FreeType.Glyph getGlyph() {
      long l = getGlyph(this.address);
      if (l != 0L)
        return new FreeType.Glyph(l); 
      throw new GdxRuntimeException("Couldn't get glyph");
    }
    
    public int getLinearHoriAdvance() { return getLinearHoriAdvance(this.address); }
    
    public int getLinearVertAdvance() { return getLinearVertAdvance(this.address); }
    
    public FreeType.GlyphMetrics getMetrics() { return new FreeType.GlyphMetrics(getMetrics(this.address)); }
    
    public boolean renderGlyph(int param1Int) { return renderGlyph(this.address, param1Int); }
  }
  
  public static class Library extends Pointer implements Disposable {
    LongMap<ByteBuffer> fontData = new LongMap();
    
    Library(long param1Long) { super(param1Long); }
    
    private static native void doneFreeType(long param1Long);
    
    private static native long newMemoryFace(long param1Long, ByteBuffer param1ByteBuffer, int param1Int1, int param1Int2);
    
    private static native long strokerNew(long param1Long);
    
    public FreeType.Stroker createStroker() {
      long l = strokerNew(this.address);
      if (l != 0L)
        return new FreeType.Stroker(l); 
      throw new GdxRuntimeException("Couldn't create FreeType stroker");
    }
    
    public void dispose() {
      doneFreeType(this.address);
      Iterator iterator = this.fontData.values().iterator();
      while (iterator.hasNext())
        BufferUtils.disposeUnsafeByteBuffer((ByteBuffer)iterator.next()); 
    }
    
    public FreeType.Face newFace(FileHandle param1FileHandle, int param1Int) {
      byte[] arrayOfByte = param1FileHandle.readBytes();
      return newMemoryFace(arrayOfByte, arrayOfByte.length, param1Int);
    }
    
    public FreeType.Face newMemoryFace(ByteBuffer param1ByteBuffer, int param1Int) {
      long l = newMemoryFace(this.address, param1ByteBuffer, param1ByteBuffer.remaining(), param1Int);
      if (l != 0L) {
        this.fontData.put(l, param1ByteBuffer);
        return new FreeType.Face(l, this);
      } 
      BufferUtils.disposeUnsafeByteBuffer(param1ByteBuffer);
      throw new GdxRuntimeException("Couldn't load font");
    }
    
    public FreeType.Face newMemoryFace(byte[] param1ArrayOfByte, int param1Int1, int param1Int2) {
      ByteBuffer byteBuffer = BufferUtils.newUnsafeByteBuffer(param1ArrayOfByte.length);
      BufferUtils.copy(param1ArrayOfByte, 0, byteBuffer, param1ArrayOfByte.length);
      return newMemoryFace(byteBuffer, param1Int2);
    }
  }
  
  private static class Pointer {
    long address;
    
    Pointer(long param1Long) { this.address = param1Long; }
  }
  
  public static class Size extends Pointer {
    Size(long param1Long) { super(param1Long); }
    
    private static native long getMetrics(long param1Long);
    
    public FreeType.SizeMetrics getMetrics() { return new FreeType.SizeMetrics(getMetrics(this.address)); }
  }
  
  public static class SizeMetrics extends Pointer {
    SizeMetrics(long param1Long) { super(param1Long); }
    
    private static native int getAscender(long param1Long);
    
    private static native int getDescender(long param1Long);
    
    private static native int getHeight(long param1Long);
    
    private static native int getMaxAdvance(long param1Long);
    
    private static native int getXppem(long param1Long);
    
    private static native int getXscale(long param1Long);
    
    private static native int getYppem(long param1Long);
    
    private static native int getYscale(long param1Long);
    
    public int getAscender() { return getAscender(this.address); }
    
    public int getDescender() { return getDescender(this.address); }
    
    public int getHeight() { return getHeight(this.address); }
    
    public int getMaxAdvance() { return getMaxAdvance(this.address); }
    
    public int getXScale() { return getXscale(this.address); }
    
    public int getXppem() { return getXppem(this.address); }
    
    public int getYppem() { return getYppem(this.address); }
    
    public int getYscale() { return getYscale(this.address); }
  }
  
  public static class Stroker extends Pointer implements Disposable {
    Stroker(long param1Long) { super(param1Long); }
    
    private static native void done(long param1Long);
    
    private static native void set(long param1Long, int param1Int1, int param1Int2, int param1Int3, int param1Int4);
    
    public void dispose() { done(this.address); }
    
    public void set(int param1Int1, int param1Int2, int param1Int3, int param1Int4) { set(this.address, param1Int1, param1Int2, param1Int3, param1Int4); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/freetype/FreeType.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */