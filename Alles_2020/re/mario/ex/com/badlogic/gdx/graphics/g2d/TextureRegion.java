package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Texture;

public class TextureRegion {
  int regionHeight;
  
  int regionWidth;
  
  Texture texture;
  
  float u;
  
  float u2;
  
  float v;
  
  float v2;
  
  public TextureRegion() {}
  
  public TextureRegion(Texture paramTexture) {
    if (paramTexture != null) {
      this.texture = paramTexture;
      setRegion(0, 0, paramTexture.getWidth(), paramTexture.getHeight());
      return;
    } 
    throw new IllegalArgumentException("texture cannot be null.");
  }
  
  public TextureRegion(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.texture = paramTexture;
    setRegion(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public TextureRegion(Texture paramTexture, int paramInt1, int paramInt2) {
    this.texture = paramTexture;
    setRegion(0, 0, paramInt1, paramInt2);
  }
  
  public TextureRegion(Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.texture = paramTexture;
    setRegion(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public TextureRegion(TextureRegion paramTextureRegion) { setRegion(paramTextureRegion); }
  
  public TextureRegion(TextureRegion paramTextureRegion, int paramInt1, int paramInt2, int paramInt3, int paramInt4) { setRegion(paramTextureRegion, paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public static TextureRegion[][] split(Texture paramTexture, int paramInt1, int paramInt2) { return (new TextureRegion(paramTexture)).split(paramInt1, paramInt2); }
  
  public void flip(boolean paramBoolean1, boolean paramBoolean2) {
    if (paramBoolean1) {
      float f = this.u;
      this.u = this.u2;
      this.u2 = f;
    } 
    if (paramBoolean2) {
      float f = this.v;
      this.v = this.v2;
      this.v2 = f;
    } 
  }
  
  public int getRegionHeight() { return this.regionHeight; }
  
  public int getRegionWidth() { return this.regionWidth; }
  
  public int getRegionX() { return Math.round(this.u * this.texture.getWidth()); }
  
  public int getRegionY() { return Math.round(this.v * this.texture.getHeight()); }
  
  public Texture getTexture() { return this.texture; }
  
  public float getU() { return this.u; }
  
  public float getU2() { return this.u2; }
  
  public float getV() { return this.v; }
  
  public float getV2() { return this.v2; }
  
  public boolean isFlipX() {
    boolean bool;
    if (this.u > this.u2) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isFlipY() {
    boolean bool;
    if (this.v > this.v2) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void scroll(float paramFloat1, float paramFloat2) {
    if (paramFloat1 != 0.0F) {
      float f1 = this.u2;
      float f2 = this.u;
      float f3 = this.texture.getWidth();
      this.u = (this.u + paramFloat1) % 1.0F;
      this.u2 = this.u + (f1 - f2) * f3 / this.texture.getWidth();
    } 
    if (paramFloat2 != 0.0F) {
      float f1 = this.v2;
      paramFloat1 = this.v;
      float f2 = this.texture.getHeight();
      this.v = (this.v + paramFloat2) % 1.0F;
      this.v2 = this.v + (f1 - paramFloat1) * f2 / this.texture.getHeight();
    } 
  }
  
  public void setRegion(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    int i = this.texture.getWidth();
    int j = this.texture.getHeight();
    float f1 = Math.abs(paramFloat3 - paramFloat1);
    float f2 = i;
    this.regionWidth = Math.round(f1 * f2);
    f1 = Math.abs(paramFloat4 - paramFloat2);
    float f3 = j;
    this.regionHeight = Math.round(f1 * f3);
    float f4 = paramFloat1;
    float f5 = paramFloat2;
    float f6 = paramFloat3;
    f1 = paramFloat4;
    if (this.regionWidth == 1) {
      f4 = paramFloat1;
      f5 = paramFloat2;
      f6 = paramFloat3;
      f1 = paramFloat4;
      if (this.regionHeight == 1) {
        f1 = 0.25F / f2;
        f4 = paramFloat1 + f1;
        f6 = paramFloat3 - f1;
        paramFloat1 = 0.25F / f3;
        f5 = paramFloat2 + paramFloat1;
        f1 = paramFloat4 - paramFloat1;
      } 
    } 
    this.u = f4;
    this.v = f5;
    this.u2 = f6;
    this.v2 = f1;
  }
  
  public void setRegion(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    float f1 = 1.0F / this.texture.getWidth();
    float f2 = 1.0F / this.texture.getHeight();
    setRegion(paramInt1 * f1, paramInt2 * f2, (paramInt1 + paramInt3) * f1, (paramInt2 + paramInt4) * f2);
    this.regionWidth = Math.abs(paramInt3);
    this.regionHeight = Math.abs(paramInt4);
  }
  
  public void setRegion(Texture paramTexture) {
    this.texture = paramTexture;
    setRegion(0, 0, paramTexture.getWidth(), paramTexture.getHeight());
  }
  
  public void setRegion(TextureRegion paramTextureRegion) {
    this.texture = paramTextureRegion.texture;
    setRegion(paramTextureRegion.u, paramTextureRegion.v, paramTextureRegion.u2, paramTextureRegion.v2);
  }
  
  public void setRegion(TextureRegion paramTextureRegion, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.texture = paramTextureRegion.texture;
    setRegion(paramTextureRegion.getRegionX() + paramInt1, paramTextureRegion.getRegionY() + paramInt2, paramInt3, paramInt4);
  }
  
  public void setRegionHeight(int paramInt) {
    if (isFlipY()) {
      setV(this.v2 + paramInt / this.texture.getHeight());
    } else {
      setV2(this.v + paramInt / this.texture.getHeight());
    } 
  }
  
  public void setRegionWidth(int paramInt) {
    if (isFlipX()) {
      setU(this.u2 + paramInt / this.texture.getWidth());
    } else {
      setU2(this.u + paramInt / this.texture.getWidth());
    } 
  }
  
  public void setRegionX(int paramInt) { setU(paramInt / this.texture.getWidth()); }
  
  public void setRegionY(int paramInt) { setV(paramInt / this.texture.getHeight()); }
  
  public void setTexture(Texture paramTexture) { this.texture = paramTexture; }
  
  public void setU(float paramFloat) {
    this.u = paramFloat;
    this.regionWidth = Math.round(Math.abs(this.u2 - paramFloat) * this.texture.getWidth());
  }
  
  public void setU2(float paramFloat) {
    this.u2 = paramFloat;
    this.regionWidth = Math.round(Math.abs(paramFloat - this.u) * this.texture.getWidth());
  }
  
  public void setV(float paramFloat) {
    this.v = paramFloat;
    this.regionHeight = Math.round(Math.abs(this.v2 - paramFloat) * this.texture.getHeight());
  }
  
  public void setV2(float paramFloat) {
    this.v2 = paramFloat;
    this.regionHeight = Math.round(Math.abs(paramFloat - this.v) * this.texture.getHeight());
  }
  
  public TextureRegion[][] split(int paramInt1, int paramInt2) {
    int i = getRegionX();
    int j = getRegionY();
    int k = this.regionWidth;
    int m = this.regionHeight / paramInt2;
    int n = k / paramInt1;
    TextureRegion[][] arrayOfTextureRegion = new TextureRegion[m][n];
    k = 0;
    while (k < m) {
      int i1 = i;
      byte b = 0;
      while (b < n) {
        arrayOfTextureRegion[k][b] = new TextureRegion(this.texture, i1, j, paramInt1, paramInt2);
        b++;
        i1 += paramInt1;
      } 
      k++;
      j += paramInt2;
    } 
    return arrayOfTextureRegion;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/TextureRegion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */