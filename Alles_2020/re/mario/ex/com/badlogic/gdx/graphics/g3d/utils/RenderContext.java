package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;

public class RenderContext {
  private int blendDFactor;
  
  private int blendSFactor;
  
  private boolean blending;
  
  private int cullFace;
  
  private int depthFunc;
  
  private boolean depthMask;
  
  private float depthRangeFar;
  
  private float depthRangeNear;
  
  public final TextureBinder textureBinder;
  
  public RenderContext(TextureBinder paramTextureBinder) { this.textureBinder = paramTextureBinder; }
  
  public void begin() {
    Gdx.gl.glDisable(2929);
    this.depthFunc = 0;
    Gdx.gl.glDepthMask(true);
    this.depthMask = true;
    Gdx.gl.glDisable(3042);
    this.blending = false;
    Gdx.gl.glDisable(2884);
    this.blendDFactor = 0;
    this.blendSFactor = 0;
    this.cullFace = 0;
    this.textureBinder.begin();
  }
  
  public void end() {
    if (this.depthFunc != 0)
      Gdx.gl.glDisable(2929); 
    if (!this.depthMask)
      Gdx.gl.glDepthMask(true); 
    if (this.blending)
      Gdx.gl.glDisable(3042); 
    if (this.cullFace > 0)
      Gdx.gl.glDisable(2884); 
    this.textureBinder.end();
  }
  
  public void setBlending(boolean paramBoolean, int paramInt1, int paramInt2) {
    if (paramBoolean != this.blending) {
      this.blending = paramBoolean;
      if (paramBoolean) {
        Gdx.gl.glEnable(3042);
      } else {
        Gdx.gl.glDisable(3042);
      } 
    } 
    if (paramBoolean && (this.blendSFactor != paramInt1 || this.blendDFactor != paramInt2)) {
      Gdx.gl.glBlendFunc(paramInt1, paramInt2);
      this.blendSFactor = paramInt1;
      this.blendDFactor = paramInt2;
    } 
  }
  
  public void setCullFace(int paramInt) {
    if (paramInt != this.cullFace) {
      this.cullFace = paramInt;
      if (paramInt == 1028 || paramInt == 1029 || paramInt == 1032) {
        Gdx.gl.glEnable(2884);
        Gdx.gl.glCullFace(paramInt);
        return;
      } 
      Gdx.gl.glDisable(2884);
    } 
  }
  
  public void setDepthMask(boolean paramBoolean) {
    if (this.depthMask != paramBoolean) {
      GL20 gL20 = Gdx.gl;
      this.depthMask = paramBoolean;
      gL20.glDepthMask(paramBoolean);
    } 
  }
  
  public void setDepthTest(int paramInt) { setDepthTest(paramInt, 0.0F, 1.0F); }
  
  public void setDepthTest(int paramInt, float paramFloat1, float paramFloat2) {
    int i = this.depthFunc;
    boolean bool = true;
    if (i != 0) {
      i = 1;
    } else {
      i = 0;
    } 
    if (paramInt == 0)
      bool = false; 
    if (this.depthFunc != paramInt) {
      this.depthFunc = paramInt;
      if (bool) {
        Gdx.gl.glEnable(2929);
        Gdx.gl.glDepthFunc(paramInt);
      } else {
        Gdx.gl.glDisable(2929);
      } 
    } 
    if (bool) {
      if (i == 0 || this.depthFunc != paramInt) {
        GL20 gL20 = Gdx.gl;
        this.depthFunc = paramInt;
        gL20.glDepthFunc(paramInt);
      } 
      if (i == 0 || this.depthRangeNear != paramFloat1 || this.depthRangeFar != paramFloat2) {
        GL20 gL20 = Gdx.gl;
        this.depthRangeNear = paramFloat1;
        this.depthRangeFar = paramFloat2;
        gL20.glDepthRangef(paramFloat1, paramFloat2);
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/RenderContext.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */