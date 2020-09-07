package com.badlogic.gdx.backends.android.surfaceview;

import android.view.View;

public class RatioResolutionStrategy implements ResolutionStrategy {
  private final float ratio;
  
  public RatioResolutionStrategy(float paramFloat) { this.ratio = paramFloat; }
  
  public RatioResolutionStrategy(float paramFloat1, float paramFloat2) { this.ratio = paramFloat1 / paramFloat2; }
  
  public ResolutionStrategy.MeasuredDimension calcMeasures(int paramInt1, int paramInt2) {
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    float f1 = this.ratio;
    float f2 = paramInt1;
    float f3 = paramInt2;
    if (f2 / f3 < f1) {
      paramInt2 = Math.round(f2 / f1);
    } else {
      paramInt1 = Math.round(f3 * f1);
    } 
    return new ResolutionStrategy.MeasuredDimension(paramInt1, paramInt2);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/RatioResolutionStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */