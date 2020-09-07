package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.NinePatch;

public class NinePatchDrawable extends BaseDrawable implements TransformDrawable {
  private NinePatch patch;
  
  public NinePatchDrawable() {}
  
  public NinePatchDrawable(NinePatch paramNinePatch) { setPatch(paramNinePatch); }
  
  public NinePatchDrawable(NinePatchDrawable paramNinePatchDrawable) {
    super(paramNinePatchDrawable);
    this.patch = paramNinePatchDrawable.patch;
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.patch.draw(paramBatch, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { this.patch.draw(paramBatch, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9); }
  
  public NinePatch getPatch() { return this.patch; }
  
  public void setPatch(NinePatch paramNinePatch) {
    this.patch = paramNinePatch;
    setMinWidth(paramNinePatch.getTotalWidth());
    setMinHeight(paramNinePatch.getTotalHeight());
    setTopHeight(paramNinePatch.getPadTop());
    setRightWidth(paramNinePatch.getPadRight());
    setBottomHeight(paramNinePatch.getPadBottom());
    setLeftWidth(paramNinePatch.getPadLeft());
  }
  
  public NinePatchDrawable tint(Color paramColor) {
    NinePatchDrawable ninePatchDrawable = new NinePatchDrawable(this);
    ninePatchDrawable.patch = new NinePatch(ninePatchDrawable.getPatch(), paramColor);
    return ninePatchDrawable;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */