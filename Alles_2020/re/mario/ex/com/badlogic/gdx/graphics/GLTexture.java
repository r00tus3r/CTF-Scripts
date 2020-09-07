package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.MipMapGenerator;
import com.badlogic.gdx.utils.Disposable;

public abstract class GLTexture implements Disposable {
  protected int glHandle;
  
  public final int glTarget;
  
  protected Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
  
  protected Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
  
  protected Texture.TextureWrap uWrap = Texture.TextureWrap.ClampToEdge;
  
  protected Texture.TextureWrap vWrap = Texture.TextureWrap.ClampToEdge;
  
  public GLTexture(int paramInt) { this(paramInt, Gdx.gl.glGenTexture()); }
  
  public GLTexture(int paramInt1, int paramInt2) {
    this.glTarget = paramInt1;
    this.glHandle = paramInt2;
  }
  
  protected static void uploadImageData(int paramInt, TextureData paramTextureData) { uploadImageData(paramInt, paramTextureData, 0); }
  
  public static void uploadImageData(int paramInt1, TextureData paramTextureData, int paramInt2) {
    if (paramTextureData == null)
      return; 
    if (!paramTextureData.isPrepared())
      paramTextureData.prepare(); 
    if (paramTextureData.getType() == TextureData.TextureDataType.Custom) {
      paramTextureData.consumeCustomData(paramInt1);
      return;
    } 
    Pixmap pixmap1 = paramTextureData.consumePixmap();
    boolean bool = paramTextureData.disposePixmap();
    Pixmap pixmap2 = pixmap1;
    if (paramTextureData.getFormat() != pixmap1.getFormat()) {
      pixmap2 = new Pixmap(pixmap1.getWidth(), pixmap1.getHeight(), paramTextureData.getFormat());
      pixmap2.setBlending(Pixmap.Blending.None);
      pixmap2.drawPixmap(pixmap1, 0, 0, 0, 0, pixmap1.getWidth(), pixmap1.getHeight());
      if (paramTextureData.disposePixmap())
        pixmap1.dispose(); 
      bool = true;
    } 
    Gdx.gl.glPixelStorei(3317, 1);
    if (paramTextureData.useMipMaps()) {
      MipMapGenerator.generateMipMap(paramInt1, pixmap2, pixmap2.getWidth(), pixmap2.getHeight());
    } else {
      Gdx.gl.glTexImage2D(paramInt1, paramInt2, pixmap2.getGLInternalFormat(), pixmap2.getWidth(), pixmap2.getHeight(), 0, pixmap2.getGLFormat(), pixmap2.getGLType(), pixmap2.getPixels());
    } 
    if (bool)
      pixmap2.dispose(); 
  }
  
  public void bind() { Gdx.gl.glBindTexture(this.glTarget, this.glHandle); }
  
  public void bind(int paramInt) {
    Gdx.gl.glActiveTexture(paramInt + 33984);
    Gdx.gl.glBindTexture(this.glTarget, this.glHandle);
  }
  
  protected void delete() {
    if (this.glHandle != 0) {
      Gdx.gl.glDeleteTexture(this.glHandle);
      this.glHandle = 0;
    } 
  }
  
  public void dispose() { delete(); }
  
  public abstract int getDepth();
  
  public abstract int getHeight();
  
  public Texture.TextureFilter getMagFilter() { return this.magFilter; }
  
  public Texture.TextureFilter getMinFilter() { return this.minFilter; }
  
  public int getTextureObjectHandle() { return this.glHandle; }
  
  public Texture.TextureWrap getUWrap() { return this.uWrap; }
  
  public Texture.TextureWrap getVWrap() { return this.vWrap; }
  
  public abstract int getWidth();
  
  public abstract boolean isManaged();
  
  protected abstract void reload();
  
  public void setFilter(Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2) {
    this.minFilter = paramTextureFilter1;
    this.magFilter = paramTextureFilter2;
    bind();
    Gdx.gl.glTexParameteri(this.glTarget, 10241, paramTextureFilter1.getGLEnum());
    Gdx.gl.glTexParameteri(this.glTarget, 10240, paramTextureFilter2.getGLEnum());
  }
  
  public void setWrap(Texture.TextureWrap paramTextureWrap1, Texture.TextureWrap paramTextureWrap2) {
    this.uWrap = paramTextureWrap1;
    this.vWrap = paramTextureWrap2;
    bind();
    Gdx.gl.glTexParameteri(this.glTarget, 10242, paramTextureWrap1.getGLEnum());
    Gdx.gl.glTexParameteri(this.glTarget, 10243, paramTextureWrap2.getGLEnum());
  }
  
  public void unsafeSetFilter(Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2) { unsafeSetFilter(paramTextureFilter1, paramTextureFilter2, false); }
  
  public void unsafeSetFilter(Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, boolean paramBoolean) {
    if (paramTextureFilter1 != null && (paramBoolean || this.minFilter != paramTextureFilter1)) {
      Gdx.gl.glTexParameteri(this.glTarget, 10241, paramTextureFilter1.getGLEnum());
      this.minFilter = paramTextureFilter1;
    } 
    if (paramTextureFilter2 != null && (paramBoolean || this.magFilter != paramTextureFilter2)) {
      Gdx.gl.glTexParameteri(this.glTarget, 10240, paramTextureFilter2.getGLEnum());
      this.magFilter = paramTextureFilter2;
    } 
  }
  
  public void unsafeSetWrap(Texture.TextureWrap paramTextureWrap1, Texture.TextureWrap paramTextureWrap2) { unsafeSetWrap(paramTextureWrap1, paramTextureWrap2, false); }
  
  public void unsafeSetWrap(Texture.TextureWrap paramTextureWrap1, Texture.TextureWrap paramTextureWrap2, boolean paramBoolean) {
    if (paramTextureWrap1 != null && (paramBoolean || this.uWrap != paramTextureWrap1)) {
      Gdx.gl.glTexParameteri(this.glTarget, 10242, paramTextureWrap1.getGLEnum());
      this.uWrap = paramTextureWrap1;
    } 
    if (paramTextureWrap2 != null && (paramBoolean || this.vWrap != paramTextureWrap2)) {
      Gdx.gl.glTexParameteri(this.glTarget, 10243, paramTextureWrap2.getGLEnum());
      this.vWrap = paramTextureWrap2;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/GLTexture.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */