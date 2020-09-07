package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Texture;

public class FloatFrameBuffer extends FrameBuffer {
  FloatFrameBuffer() {}
  
  public FloatFrameBuffer(int paramInt1, int paramInt2, boolean paramBoolean) {
    GLFrameBuffer.FloatFrameBufferBuilder floatFrameBufferBuilder = new GLFrameBuffer.FloatFrameBufferBuilder(paramInt1, paramInt2);
    floatFrameBufferBuilder.addFloatAttachment(34836, 6408, 5126, false);
    if (paramBoolean)
      floatFrameBufferBuilder.addBasicDepthRenderBuffer(); 
    this.bufferBuilder = floatFrameBufferBuilder;
    build();
  }
  
  protected FloatFrameBuffer(GLFrameBuffer.GLFrameBufferBuilder<? extends GLFrameBuffer<Texture>> paramGLFrameBufferBuilder) { super(paramGLFrameBufferBuilder); }
  
  protected Texture createTexture(GLFrameBuffer.FrameBufferTextureAttachmentSpec paramFrameBufferTextureAttachmentSpec) {
    Texture texture = new Texture(new FloatTextureData(this.bufferBuilder.width, this.bufferBuilder.height, paramFrameBufferTextureAttachmentSpec.internalFormat, paramFrameBufferTextureAttachmentSpec.format, paramFrameBufferTextureAttachmentSpec.type, paramFrameBufferTextureAttachmentSpec.isGpuOnly));
    if (Gdx.app.getType() == Application.ApplicationType.Desktop || Gdx.app.getType() == Application.ApplicationType.Applet) {
      texture.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
      texture.setWrap(Texture.TextureWrap.ClampToEdge, Texture.TextureWrap.ClampToEdge);
      return texture;
    } 
    texture.setFilter(Texture.TextureFilter.Nearest, Texture.TextureFilter.Nearest);
    texture.setWrap(Texture.TextureWrap.ClampToEdge, Texture.TextureWrap.ClampToEdge);
    return texture;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/FloatFrameBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */