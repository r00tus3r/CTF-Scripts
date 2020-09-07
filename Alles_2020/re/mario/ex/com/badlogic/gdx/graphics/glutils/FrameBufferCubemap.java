package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FrameBufferCubemap extends GLFrameBuffer<Cubemap> {
  private static final Cubemap.CubemapSide[] cubemapSides = Cubemap.CubemapSide.values();
  
  private int currentSide;
  
  FrameBufferCubemap() {}
  
  public FrameBufferCubemap(Pixmap.Format paramFormat, int paramInt1, int paramInt2, boolean paramBoolean) { this(paramFormat, paramInt1, paramInt2, paramBoolean, false); }
  
  public FrameBufferCubemap(Pixmap.Format paramFormat, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2) {
    GLFrameBuffer.FrameBufferCubemapBuilder frameBufferCubemapBuilder = new GLFrameBuffer.FrameBufferCubemapBuilder(paramInt1, paramInt2);
    frameBufferCubemapBuilder.addBasicColorTextureAttachment(paramFormat);
    if (paramBoolean1)
      frameBufferCubemapBuilder.addBasicDepthRenderBuffer(); 
    if (paramBoolean2)
      frameBufferCubemapBuilder.addBasicStencilRenderBuffer(); 
    this.bufferBuilder = frameBufferCubemapBuilder;
    build();
  }
  
  protected FrameBufferCubemap(GLFrameBuffer.GLFrameBufferBuilder<? extends GLFrameBuffer<Cubemap>> paramGLFrameBufferBuilder) { super(paramGLFrameBufferBuilder); }
  
  protected void attachFrameBufferColorTexture(Cubemap paramCubemap) {
    GL20 gL20 = Gdx.gl20;
    int i = paramCubemap.getTextureObjectHandle();
    Cubemap.CubemapSide[] arrayOfCubemapSide = Cubemap.CubemapSide.values();
    int j = arrayOfCubemapSide.length;
    for (byte b = 0; b < j; b++)
      gL20.glFramebufferTexture2D(36160, 36064, (arrayOfCubemapSide[b]).glEnum, i, 0); 
  }
  
  public void bind() {
    this.currentSide = -1;
    super.bind();
  }
  
  protected void bindSide(Cubemap.CubemapSide paramCubemapSide) { Gdx.gl20.glFramebufferTexture2D(36160, 36064, paramCubemapSide.glEnum, ((Cubemap)getColorBufferTexture()).getTextureObjectHandle(), 0); }
  
  protected Cubemap createTexture(GLFrameBuffer.FrameBufferTextureAttachmentSpec paramFrameBufferTextureAttachmentSpec) {
    GLOnlyTextureData gLOnlyTextureData = new GLOnlyTextureData(this.bufferBuilder.width, this.bufferBuilder.height, false, paramFrameBufferTextureAttachmentSpec.internalFormat, paramFrameBufferTextureAttachmentSpec.format, paramFrameBufferTextureAttachmentSpec.type);
    Cubemap cubemap = new Cubemap(gLOnlyTextureData, gLOnlyTextureData, gLOnlyTextureData, gLOnlyTextureData, gLOnlyTextureData, gLOnlyTextureData);
    cubemap.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
    cubemap.setWrap(Texture.TextureWrap.ClampToEdge, Texture.TextureWrap.ClampToEdge);
    return cubemap;
  }
  
  protected void disposeColorTexture(Cubemap paramCubemap) { paramCubemap.dispose(); }
  
  public Cubemap.CubemapSide getSide() {
    Cubemap.CubemapSide cubemapSide;
    int i = this.currentSide;
    if (i < 0) {
      cubemapSide = null;
    } else {
      cubemapSide = cubemapSides[i];
    } 
    return cubemapSide;
  }
  
  public boolean nextSide() {
    int i = this.currentSide;
    if (i <= 5) {
      if (i == 5)
        return false; 
      this.currentSide = i + 1;
      bindSide(getSide());
      return true;
    } 
    throw new GdxRuntimeException("No remaining sides.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FrameBufferCubemap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */