package com.badlogic.gdx.math;

public class FloatCounter {
  public float average;
  
  public int count;
  
  public float latest;
  
  public float max;
  
  public final WindowedMean mean;
  
  public float min;
  
  public float total;
  
  public float value;
  
  public FloatCounter(int paramInt) {
    if (paramInt > 1) {
      object = new WindowedMean(paramInt);
    } else {
      object = null;
    } 
    this.mean = object;
    reset();
  }
  
  public void put(float paramFloat) {
    this.latest = paramFloat;
    this.total += paramFloat;
    this.count++;
    this.average = this.total / this.count;
    WindowedMean windowedMean = this.mean;
    if (windowedMean != null) {
      windowedMean.addValue(paramFloat);
      this.value = this.mean.getMean();
    } else {
      this.value = this.latest;
    } 
    windowedMean = this.mean;
    if (windowedMean == null || windowedMean.hasEnoughData()) {
      paramFloat = this.value;
      if (paramFloat < this.min)
        this.min = paramFloat; 
      paramFloat = this.value;
      if (paramFloat > this.max)
        this.max = paramFloat; 
    } 
  }
  
  public void reset() {
    this.count = 0;
    this.total = 0.0F;
    this.min = Float.MAX_VALUE;
    this.max = -3.4028235E38F;
    this.average = 0.0F;
    this.latest = 0.0F;
    this.value = 0.0F;
    WindowedMean windowedMean = this.mean;
    if (windowedMean != null)
      windowedMean.clear(); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/FloatCounter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */