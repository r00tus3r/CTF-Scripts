package com.badlogic.gdx.utils;

public class PerformanceCounters {
  private static final float nano2seconds = 1.0E-9F;
  
  public final Array<PerformanceCounter> counters = new Array();
  
  private long lastTick = 0L;
  
  public PerformanceCounter add(String paramString) {
    PerformanceCounter performanceCounter = new PerformanceCounter(paramString);
    this.counters.add(performanceCounter);
    return performanceCounter;
  }
  
  public PerformanceCounter add(String paramString, int paramInt) {
    PerformanceCounter performanceCounter = new PerformanceCounter(paramString, paramInt);
    this.counters.add(performanceCounter);
    return performanceCounter;
  }
  
  public void tick() {
    long l1 = TimeUtils.nanoTime();
    long l2 = this.lastTick;
    if (l2 > 0L)
      tick((float)(l1 - l2) * 1.0E-9F); 
    this.lastTick = l1;
  }
  
  public void tick(float paramFloat) {
    for (byte b = 0; b < this.counters.size; b++)
      ((PerformanceCounter)this.counters.get(b)).tick(paramFloat); 
  }
  
  public StringBuilder toString(StringBuilder paramStringBuilder) {
    byte b = 0;
    paramStringBuilder.setLength(0);
    while (b < this.counters.size) {
      if (b)
        paramStringBuilder.append("; "); 
      ((PerformanceCounter)this.counters.get(b)).toString(paramStringBuilder);
      b++;
    } 
    return paramStringBuilder;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/PerformanceCounters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */