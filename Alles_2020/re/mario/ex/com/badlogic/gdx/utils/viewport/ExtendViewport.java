package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Scaling;

public class ExtendViewport extends Viewport {
  private float maxWorldHeight;
  
  private float maxWorldWidth;
  
  private float minWorldHeight;
  
  private float minWorldWidth;
  
  public ExtendViewport(float paramFloat1, float paramFloat2) { this(paramFloat1, paramFloat2, 0.0F, 0.0F, new OrthographicCamera()); }
  
  public ExtendViewport(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, new OrthographicCamera()); }
  
  public ExtendViewport(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, Camera paramCamera) {
    this.minWorldWidth = paramFloat1;
    this.minWorldHeight = paramFloat2;
    this.maxWorldWidth = paramFloat3;
    this.maxWorldHeight = paramFloat4;
    setCamera(paramCamera);
  }
  
  public ExtendViewport(float paramFloat1, float paramFloat2, Camera paramCamera) { this(paramFloat1, paramFloat2, 0.0F, 0.0F, paramCamera); }
  
  public float getMaxWorldHeight() { return this.maxWorldHeight; }
  
  public float getMaxWorldWidth() { return this.maxWorldWidth; }
  
  public float getMinWorldHeight() { return this.minWorldHeight; }
  
  public float getMinWorldWidth() { return this.minWorldWidth; }
  
  public void setMaxWorldHeight(float paramFloat) { this.maxWorldHeight = paramFloat; }
  
  public void setMaxWorldWidth(float paramFloat) { this.maxWorldWidth = paramFloat; }
  
  public void setMinWorldHeight(float paramFloat) { this.minWorldHeight = paramFloat; }
  
  public void setMinWorldWidth(float paramFloat) { this.minWorldWidth = paramFloat; }
  
  public void update(int paramInt1, int paramInt2, boolean paramBoolean) {
    int m;
    int k;
    float f4;
    float f3;
    float f1 = this.minWorldWidth;
    float f2 = this.minWorldHeight;
    Vector2 vector2 = Scaling.fit.apply(f1, f2, paramInt1, paramInt2);
    int i = Math.round(vector2.x);
    int j = Math.round(vector2.y);
    if (i < paramInt1) {
      f3 = j;
      float f5 = f3 / f2;
      f3 = f2 / f3;
      f4 = (paramInt1 - i) * f3;
      float f6 = this.maxWorldWidth;
      f3 = f4;
      if (f6 > 0.0F)
        f3 = Math.min(f4, f6 - this.minWorldWidth); 
      f4 = f1 + f3;
      k = i + Math.round(f3 * f5);
      f3 = f2;
      m = j;
    } else {
      f4 = f1;
      f3 = f2;
      m = j;
      k = i;
      if (j < paramInt2) {
        f3 = i;
        float f5 = f3 / f1;
        f3 = f1 / f3;
        f4 = (paramInt2 - j) * f3;
        float f6 = this.maxWorldHeight;
        f3 = f4;
        if (f6 > 0.0F)
          f3 = Math.min(f4, f6 - this.minWorldHeight); 
        f4 = f2 + f3;
        m = j + Math.round(f3 * f5);
        k = i;
        f3 = f4;
        f4 = f1;
      } 
    } 
    setWorldSize(f4, f3);
    setScreenBounds((paramInt1 - k) / 2, (paramInt2 - m) / 2, k, m);
    apply(paramBoolean);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/viewport/ExtendViewport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */