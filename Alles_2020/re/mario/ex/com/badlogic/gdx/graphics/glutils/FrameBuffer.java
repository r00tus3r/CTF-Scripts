package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;

public class FrameBuffer extends GLFrameBuffer<Texture> {
  FrameBuffer() {}
  
  public FrameBuffer(Pixmap.Format paramFormat, int paramInt1, int paramInt2, boolean paramBoolean) { this(paramFormat, paramInt1, paramInt2, paramBoolean, false); }
  
  public FrameBuffer(Pixmap.Format paramFormat, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2) {
    GLFrameBuffer.FrameBufferBuilder frameBufferBuilder = new GLFrameBuffer.FrameBufferBuilder(paramInt1, paramInt2);
    frameBufferBuilder.addBasicColorTextureAttachment(paramFormat);
    if (paramBoolean1)
      frameBufferBuilder.addBasicDepthRenderBuffer(); 
    if (paramBoolean2)
      frameBufferBuilder.addBasicStencilRenderBuffer(); 
    this.bufferBuilder = frameBufferBuilder;
    build();
  }
  
  protected FrameBuffer(GLFrameBuffer.GLFrameBufferBuilder<? extends GLFrameBuffer<Texture>> paramGLFrameBufferBuilder) { super(paramGLFrameBufferBuilder); }
  
  public static void unbind() { GLFrameBuffer.unbind(); }
  
  protected void attachFrameBufferColorTexture(Texture paramTexture) { Gdx.gl20.glFramebufferTexture2D(36160, 36064, 3553, paramTexture.getTextureObjectHandle(), 0); }
  
  protected Texture createTexture(GLFrameBuffer.FrameBufferTextureAttachmentSpec paramFrameBufferTextureAttachmentSpec) {
    Texture texture = new Texture(new GLOnlyTextureData(this.bufferBuilder.width, this.bufferBuilder.height, false, paramFrameBufferTextureAttachmentSpec.internalFormat, paramFrameBufferTextureAttachmentSpec.format, paramFrameBufferTextureAttachmentSpec.type));
    texture.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
    texture.setWrap(Texture.TextureWrap.ClampToEdge, Texture.TextureWrap.ClampToEdge);
    return texture;
  }
  
  protected void disposeColorTexture(Texture paramTexture) { paramTexture.dispose(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FrameBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */