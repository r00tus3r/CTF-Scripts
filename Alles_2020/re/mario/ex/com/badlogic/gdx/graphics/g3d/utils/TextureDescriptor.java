package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Texture;

public class TextureDescriptor<T extends GLTexture> extends Object implements Comparable<TextureDescriptor<T>> {
  public Texture.TextureFilter magFilter;
  
  public Texture.TextureFilter minFilter;
  
  public T texture = null;
  
  public Texture.TextureWrap uWrap;
  
  public Texture.TextureWrap vWrap;
  
  public TextureDescriptor() {}
  
  public TextureDescriptor(T paramT) { this(paramT, null, null, null, null); }
  
  public TextureDescriptor(T paramT, Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, Texture.TextureWrap paramTextureWrap1, Texture.TextureWrap paramTextureWrap2) { set(paramT, paramTextureFilter1, paramTextureFilter2, paramTextureWrap1, paramTextureWrap2); }
  
  public int compareTo(TextureDescriptor<T> paramTextureDescriptor) {
    int i1;
    int n;
    Texture.TextureWrap textureWrap1;
    int i = 0;
    int j = 0;
    int k = 0;
    int m = 0;
    if (paramTextureDescriptor == this)
      return 0; 
    GLTexture gLTexture = this.texture;
    if (gLTexture == null) {
      n = 0;
    } else {
      n = gLTexture.glTarget;
    } 
    gLTexture = paramTextureDescriptor.texture;
    if (gLTexture == null) {
      i1 = 0;
    } else {
      i1 = gLTexture.glTarget;
    } 
    if (n != i1)
      return n - i1; 
    gLTexture = this.texture;
    if (gLTexture == null) {
      n = 0;
    } else {
      n = gLTexture.getTextureObjectHandle();
    } 
    gLTexture = paramTextureDescriptor.texture;
    if (gLTexture == null) {
      i1 = 0;
    } else {
      i1 = gLTexture.getTextureObjectHandle();
    } 
    if (n != i1)
      return n - i1; 
    Texture.TextureFilter textureFilter = this.minFilter;
    if (textureFilter != paramTextureDescriptor.minFilter) {
      if (textureFilter == null) {
        n = 0;
      } else {
        n = textureFilter.getGLEnum();
      } 
      textureWrap1 = paramTextureDescriptor.minFilter;
      if (textureWrap1 == null) {
        i1 = m;
      } else {
        i1 = textureWrap1.getGLEnum();
      } 
      return n - i1;
    } 
    textureFilter = this.magFilter;
    if (textureFilter != textureWrap1.magFilter) {
      if (textureFilter == null) {
        n = 0;
      } else {
        n = textureFilter.getGLEnum();
      } 
      textureWrap1 = textureWrap1.magFilter;
      if (textureWrap1 == null) {
        i1 = i;
      } else {
        i1 = textureWrap1.getGLEnum();
      } 
      return n - i1;
    } 
    Texture.TextureWrap textureWrap2 = this.uWrap;
    if (textureWrap2 != textureWrap1.uWrap) {
      if (textureWrap2 == null) {
        n = 0;
      } else {
        n = textureWrap2.getGLEnum();
      } 
      textureWrap1 = textureWrap1.uWrap;
      if (textureWrap1 == null) {
        i1 = j;
      } else {
        i1 = textureWrap1.getGLEnum();
      } 
      return n - i1;
    } 
    textureWrap2 = this.vWrap;
    if (textureWrap2 != textureWrap1.vWrap) {
      if (textureWrap2 == null) {
        n = 0;
      } else {
        n = textureWrap2.getGLEnum();
      } 
      textureWrap1 = textureWrap1.vWrap;
      if (textureWrap1 == null) {
        i1 = k;
      } else {
        i1 = textureWrap1.getGLEnum();
      } 
      return n - i1;
    } 
    return 0;
  }
  
  public boolean equals(Object paramObject) {
    byte b = 0;
    if (paramObject == null)
      return false; 
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof TextureDescriptor))
      return false; 
    paramObject = (TextureDescriptor)paramObject;
    int i = b;
    if (paramObject.texture == this.texture) {
      i = b;
      if (paramObject.minFilter == this.minFilter) {
        i = b;
        if (paramObject.magFilter == this.magFilter) {
          i = b;
          if (paramObject.uWrap == this.uWrap) {
            i = b;
            if (paramObject.vWrap == this.vWrap)
              i = 1; 
          } 
        } 
      } 
    } 
    return i;
  }
  
  public int hashCode() {
    int j;
    GLTexture gLTexture = this.texture;
    int i = 0;
    if (gLTexture == null) {
      j = 0;
    } else {
      j = gLTexture.glTarget;
    } 
    long l1 = j;
    gLTexture = this.texture;
    if (gLTexture == null) {
      j = 0;
    } else {
      j = gLTexture.getTextureObjectHandle();
    } 
    long l2 = j;
    Texture.TextureFilter textureFilter = this.minFilter;
    if (textureFilter == null) {
      j = 0;
    } else {
      j = textureFilter.getGLEnum();
    } 
    long l3 = j;
    textureFilter = this.magFilter;
    if (textureFilter == null) {
      j = 0;
    } else {
      j = textureFilter.getGLEnum();
    } 
    long l4 = j;
    Texture.TextureWrap textureWrap = this.uWrap;
    if (textureWrap == null) {
      j = 0;
    } else {
      j = textureWrap.getGLEnum();
    } 
    long l5 = j;
    textureWrap = this.vWrap;
    if (textureWrap == null) {
      j = i;
    } else {
      j = textureWrap.getGLEnum();
    } 
    l2 = ((((l1 * 811L + l2) * 811L + l3) * 811L + l4) * 811L + l5) * 811L + j;
    return (int)(l2 >> 32 ^ l2);
  }
  
  public void set(T paramT, Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2, Texture.TextureWrap paramTextureWrap1, Texture.TextureWrap paramTextureWrap2) {
    this.texture = paramT;
    this.minFilter = paramTextureFilter1;
    this.magFilter = paramTextureFilter2;
    this.uWrap = paramTextureWrap1;
    this.vWrap = paramTextureWrap2;
  }
  
  public <V extends T> void set(TextureDescriptor<V> paramTextureDescriptor) {
    this.texture = paramTextureDescriptor.texture;
    this.minFilter = paramTextureDescriptor.minFilter;
    this.magFilter = paramTextureDescriptor.magFilter;
    this.uWrap = paramTextureDescriptor.uWrap;
    this.vWrap = paramTextureDescriptor.vWrap;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/TextureDescriptor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */