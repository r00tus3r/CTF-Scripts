package com.badlogic.gdx.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.MathUtils;
import java.nio.ByteBuffer;

public final class ScreenUtils {
  public static byte[] getFrameBufferPixels(int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean) {
    Gdx.gl.glPixelStorei(3333, 1);
    int i = paramInt3 * paramInt4 * 4;
    ByteBuffer byteBuffer = BufferUtils.newByteBuffer(i);
    Gdx.gl.glReadPixels(paramInt1, paramInt2, paramInt3, paramInt4, 6408, 5121, byteBuffer);
    byte[] arrayOfByte = new byte[i];
    if (paramBoolean) {
      paramInt2 = paramInt3 * 4;
      for (paramInt1 = 0; paramInt1 < paramInt4; paramInt1++) {
        byteBuffer.position((paramInt4 - paramInt1 - 1) * paramInt2);
        byteBuffer.get(arrayOfByte, paramInt1 * paramInt2, paramInt2);
      } 
    } else {
      byteBuffer.clear();
      byteBuffer.get(arrayOfByte);
    } 
    return arrayOfByte;
  }
  
  public static byte[] getFrameBufferPixels(boolean paramBoolean) { return getFrameBufferPixels(0, 0, Gdx.graphics.getBackBufferWidth(), Gdx.graphics.getBackBufferHeight(), paramBoolean); }
  
  public static Pixmap getFrameBufferPixmap(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    Gdx.gl.glPixelStorei(3333, 1);
    Pixmap pixmap = new Pixmap(paramInt3, paramInt4, Pixmap.Format.RGBA8888);
    ByteBuffer byteBuffer = pixmap.getPixels();
    Gdx.gl.glReadPixels(paramInt1, paramInt2, paramInt3, paramInt4, 6408, 5121, byteBuffer);
    return pixmap;
  }
  
  public static TextureRegion getFrameBufferTexture() { return getFrameBufferTexture(0, 0, Gdx.graphics.getBackBufferWidth(), Gdx.graphics.getBackBufferHeight()); }
  
  public static TextureRegion getFrameBufferTexture(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    int i = MathUtils.nextPowerOfTwo(paramInt3);
    int j = MathUtils.nextPowerOfTwo(paramInt4);
    Pixmap pixmap1 = getFrameBufferPixmap(paramInt1, paramInt2, paramInt3, paramInt4);
    Pixmap pixmap2 = new Pixmap(i, j, Pixmap.Format.RGBA8888);
    pixmap2.setBlending(Pixmap.Blending.None);
    pixmap2.drawPixmap(pixmap1, 0, 0);
    TextureRegion textureRegion = new TextureRegion(new Texture(pixmap2), false, paramInt4, paramInt3, -paramInt4);
    pixmap2.dispose();
    pixmap1.dispose();
    return textureRegion;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ScreenUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */