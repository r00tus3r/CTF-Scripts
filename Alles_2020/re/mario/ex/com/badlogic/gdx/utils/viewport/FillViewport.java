package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.utils.Scaling;

public class FillViewport extends ScalingViewport {
  public FillViewport(float paramFloat1, float paramFloat2) { super(Scaling.fill, paramFloat1, paramFloat2); }
  
  public FillViewport(float paramFloat1, float paramFloat2, Camera paramCamera) { super(Scaling.fill, paramFloat1, paramFloat2, paramCamera); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/viewport/FillViewport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */