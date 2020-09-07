package com.badlogic.gdx.backends.android.surfaceview;

public interface ResolutionStrategy {
  MeasuredDimension calcMeasures(int paramInt1, int paramInt2);
  
  public static class MeasuredDimension {
    public final int height;
    
    public final int width;
    
    public MeasuredDimension(int param1Int1, int param1Int2) {
      this.width = param1Int1;
      this.height = param1Int2;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */