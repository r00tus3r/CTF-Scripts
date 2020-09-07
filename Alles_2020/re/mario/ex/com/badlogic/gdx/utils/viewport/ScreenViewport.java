package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.OrthographicCamera;

public class ScreenViewport extends Viewport {
  private float unitsPerPixel = 1.0F;
  
  public ScreenViewport() { this(new OrthographicCamera()); }
  
  public ScreenViewport(Camera paramCamera) { setCamera(paramCamera); }
  
  public float getUnitsPerPixel() { return this.unitsPerPixel; }
  
  public void setUnitsPerPixel(float paramFloat) { this.unitsPerPixel = paramFloat; }
  
  public void update(int paramInt1, int paramInt2, boolean paramBoolean) {
    setScreenBounds(0, 0, paramInt1, paramInt2);
    float f1 = paramInt1;
    float f2 = this.unitsPerPixel;
    setWorldSize(f1 * f2, paramInt2 * f2);
    apply(paramBoolean);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/viewport/ScreenViewport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */