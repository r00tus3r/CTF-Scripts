package com.badlogic.gdx.backends.android.surfaceview;

import android.view.View;

public class FillResolutionStrategy implements ResolutionStrategy {
  public ResolutionStrategy.MeasuredDimension calcMeasures(int paramInt1, int paramInt2) { return new ResolutionStrategy.MeasuredDimension(View.MeasureSpec.getSize(paramInt1), View.MeasureSpec.getSize(paramInt2)); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/FillResolutionStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */