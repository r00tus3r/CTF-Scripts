package com.badlogic.gdx.backends.android.surfaceview;

public class FixedResolutionStrategy implements ResolutionStrategy {
  private final int height;
  
  private final int width;
  
  public FixedResolutionStrategy(int paramInt1, int paramInt2) {
    this.width = paramInt1;
    this.height = paramInt2;
  }
  
  public ResolutionStrategy.MeasuredDimension calcMeasures(int paramInt1, int paramInt2) { return new ResolutionStrategy.MeasuredDimension(this.width, this.height); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/FixedResolutionStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */