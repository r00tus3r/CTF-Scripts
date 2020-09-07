package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.utils.Scaling;

public class StretchViewport extends ScalingViewport {
  public StretchViewport(float paramFloat1, float paramFloat2) { super(Scaling.stretch, paramFloat1, paramFloat2); }
  
  public StretchViewport(float paramFloat1, float paramFloat2, Camera paramCamera) { super(Scaling.stretch, paramFloat1, paramFloat2, paramCamera); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/viewport/StretchViewport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */