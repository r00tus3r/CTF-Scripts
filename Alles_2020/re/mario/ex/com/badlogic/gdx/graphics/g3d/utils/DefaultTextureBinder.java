package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.IntBuffer;

public final class DefaultTextureBinder implements TextureBinder {
  public static final int MAX_GLES_UNITS = 32;
  
  public static final int ROUNDROBIN = 0;
  
  public static final int WEIGHTED = 1;
  
  private int bindCount = 0;
  
  private final int count;
  
  private int currentTexture = 0;
  
  private final int method;
  
  private final int offset;
  
  private int reuseCount = 0;
  
  private final int reuseWeight;
  
  private boolean reused;
  
  private final TextureDescriptor tempDesc = new TextureDescriptor();
  
  private final GLTexture[] textures;
  
  private final int[] weights;
  
  public DefaultTextureBinder(int paramInt) { this(paramInt, 0); }
  
  public DefaultTextureBinder(int paramInt1, int paramInt2) { this(paramInt1, paramInt2, -1); }
  
  public DefaultTextureBinder(int paramInt1, int paramInt2, int paramInt3) { this(paramInt1, paramInt2, paramInt3, 10); }
  
  public DefaultTextureBinder(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    int i = Math.min(getMaxTextureUnits(), 32);
    int j = paramInt3;
    if (paramInt3 < 0)
      j = i - paramInt2; 
    if (paramInt2 >= 0 && j >= 0 && paramInt2 + j <= i && paramInt4 >= 1) {
      Object object;
      this.method = paramInt1;
      this.offset = paramInt2;
      this.count = j;
      this.textures = new GLTexture[j];
      this.reuseWeight = paramInt4;
      if (paramInt1 == 1) {
        object = new int[j];
      } else {
        object = null;
      } 
      this.weights = object;
      return;
    } 
    throw new GdxRuntimeException("Illegal arguments");
  }
  
  private final int bindTexture(TextureDescriptor paramTextureDescriptor, boolean paramBoolean) {
    int j;
    GLTexture gLTexture = paramTextureDescriptor.texture;
    this.reused = false;
    int i = this.method;
    if (i != 0) {
      if (i != 1)
        return -1; 
      j = this.offset;
      i = bindTextureWeighted(gLTexture);
    } else {
      j = this.offset;
      i = bindTextureRoundRobin(gLTexture);
    } 
    i = j + i;
    if (this.reused) {
      this.reuseCount++;
      if (paramBoolean) {
        gLTexture.bind(i);
      } else {
        Gdx.gl.glActiveTexture(33984 + i);
      } 
    } else {
      this.bindCount++;
    } 
    gLTexture.unsafeSetWrap(paramTextureDescriptor.uWrap, paramTextureDescriptor.vWrap);
    gLTexture.unsafeSetFilter(paramTextureDescriptor.minFilter, paramTextureDescriptor.magFilter);
    return i;
  }
  
  private final int bindTextureRoundRobin(GLTexture paramGLTexture) {
    int j;
    int i = 0;
    while (true) {
      j = this.count;
      if (i < j) {
        j = (this.currentTexture + i) % j;
        if (this.textures[j] == paramGLTexture) {
          this.reused = true;
          return j;
        } 
        i++;
        continue;
      } 
      break;
    } 
    this.currentTexture = (this.currentTexture + 1) % j;
    GLTexture[] arrayOfGLTexture = this.textures;
    i = this.currentTexture;
    arrayOfGLTexture[i] = paramGLTexture;
    paramGLTexture.bind(this.offset + i);
    return this.currentTexture;
  }
  
  private final int bindTextureWeighted(GLTexture paramGLTexture) { // Byte code:
    //   0: aload_0
    //   1: getfield weights : [I
    //   4: astore_2
    //   5: iconst_0
    //   6: istore_3
    //   7: aload_2
    //   8: iconst_0
    //   9: iaload
    //   10: istore #4
    //   12: iconst_m1
    //   13: istore #5
    //   15: iconst_0
    //   16: istore #6
    //   18: iload_3
    //   19: aload_0
    //   20: getfield count : I
    //   23: if_icmpge -> 129
    //   26: aload_0
    //   27: getfield textures : [Lcom/badlogic/gdx/graphics/GLTexture;
    //   30: iload_3
    //   31: aaload
    //   32: aload_1
    //   33: if_acmpne -> 62
    //   36: aload_0
    //   37: getfield weights : [I
    //   40: astore_2
    //   41: aload_2
    //   42: iload_3
    //   43: aload_2
    //   44: iload_3
    //   45: iaload
    //   46: aload_0
    //   47: getfield reuseWeight : I
    //   50: iadd
    //   51: iastore
    //   52: iload_3
    //   53: istore #7
    //   55: iload #4
    //   57: istore #8
    //   59: goto -> 115
    //   62: aload_0
    //   63: getfield weights : [I
    //   66: astore_2
    //   67: aload_2
    //   68: iload_3
    //   69: iaload
    //   70: iflt -> 100
    //   73: aload_2
    //   74: iload_3
    //   75: iaload
    //   76: iconst_1
    //   77: isub
    //   78: istore #9
    //   80: aload_2
    //   81: iload_3
    //   82: iload #9
    //   84: iastore
    //   85: iload #5
    //   87: istore #7
    //   89: iload #4
    //   91: istore #8
    //   93: iload #9
    //   95: iload #4
    //   97: if_icmpge -> 115
    //   100: aload_0
    //   101: getfield weights : [I
    //   104: iload_3
    //   105: iaload
    //   106: istore #8
    //   108: iload_3
    //   109: istore #6
    //   111: iload #5
    //   113: istore #7
    //   115: iinc #3, 1
    //   118: iload #7
    //   120: istore #5
    //   122: iload #8
    //   124: istore #4
    //   126: goto -> 18
    //   129: iload #5
    //   131: ifge -> 169
    //   134: aload_0
    //   135: getfield textures : [Lcom/badlogic/gdx/graphics/GLTexture;
    //   138: iload #6
    //   140: aload_1
    //   141: aastore
    //   142: aload_0
    //   143: getfield weights : [I
    //   146: iload #6
    //   148: bipush #100
    //   150: iastore
    //   151: aload_1
    //   152: aload_0
    //   153: getfield offset : I
    //   156: iload #6
    //   158: iadd
    //   159: invokevirtual bind : (I)V
    //   162: iload #6
    //   164: istore #5
    //   166: goto -> 174
    //   169: aload_0
    //   170: iconst_1
    //   171: putfield reused : Z
    //   174: iload #5
    //   176: ireturn }
  
  private static int getMaxTextureUnits() {
    IntBuffer intBuffer = BufferUtils.newIntBuffer(16);
    Gdx.gl.glGetIntegerv(34930, intBuffer);
    return intBuffer.get(0);
  }
  
  public void begin() {
    for (byte b = 0; b < this.count; b++) {
      this.textures[b] = null;
      int[] arrayOfInt = this.weights;
      if (arrayOfInt != null)
        arrayOfInt[b] = 0; 
    } 
  }
  
  public final int bind(GLTexture paramGLTexture) {
    this.tempDesc.set(paramGLTexture, null, null, null, null);
    return bindTexture(this.tempDesc, false);
  }
  
  public final int bind(TextureDescriptor paramTextureDescriptor) { return bindTexture(paramTextureDescriptor, false); }
  
  public void end() { Gdx.gl.glActiveTexture(33984); }
  
  public final int getBindCount() { return this.bindCount; }
  
  public final int getReuseCount() { return this.reuseCount; }
  
  public final void resetCounts() {
    this.reuseCount = 0;
    this.bindCount = 0;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/DefaultTextureBinder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */