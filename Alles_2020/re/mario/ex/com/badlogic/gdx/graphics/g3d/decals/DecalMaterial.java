package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.TextureRegion;

public class DecalMaterial {
  public static final int NO_BLEND = -1;
  
  protected int dstBlendFactor;
  
  protected int srcBlendFactor;
  
  protected TextureRegion textureRegion;
  
  public boolean equals(Object paramObject) {
    byte b = 0;
    if (paramObject == null)
      return false; 
    paramObject = (DecalMaterial)paramObject;
    int i = b;
    if (this.dstBlendFactor == paramObject.dstBlendFactor) {
      i = b;
      if (this.srcBlendFactor == paramObject.srcBlendFactor) {
        i = b;
        if (this.textureRegion.getTexture() == paramObject.textureRegion.getTexture())
          i = 1; 
      } 
    } 
    return i;
  }
  
  public int getDstBlendFactor() { return this.dstBlendFactor; }
  
  public int getSrcBlendFactor() { return this.srcBlendFactor; }
  
  public int hashCode() {
    boolean bool;
    if (this.textureRegion.getTexture() != null) {
      bool = this.textureRegion.getTexture().hashCode();
    } else {
      bool = false;
    } 
    return (bool * 31 + this.srcBlendFactor) * 31 + this.dstBlendFactor;
  }
  
  public boolean isOpaque() {
    boolean bool;
    if (this.srcBlendFactor == -1) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void set() {
    this.textureRegion.getTexture().bind(0);
    if (!isOpaque())
      Gdx.gl.glBlendFunc(this.srcBlendFactor, this.dstBlendFactor); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/decals/DecalMaterial.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */