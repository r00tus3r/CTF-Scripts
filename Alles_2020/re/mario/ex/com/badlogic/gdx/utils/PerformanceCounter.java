package com.badlogic.gdx.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.FloatCounter;

public class PerformanceCounter {
  private static final float nano2seconds = 1.0E-9F;
  
  public float current = 0.0F;
  
  private long lastTick = 0L;
  
  public final FloatCounter load;
  
  public final String name;
  
  private long startTime = 0L;
  
  public final FloatCounter time;
  
  public boolean valid = false;
  
  public PerformanceCounter(String paramString) { this(paramString, 5); }
  
  public PerformanceCounter(String paramString, int paramInt) {
    this.name = paramString;
    this.time = new FloatCounter(paramInt);
    this.load = new FloatCounter(true);
  }
  
  public void reset() {
    this.time.reset();
    this.load.reset();
    this.startTime = 0L;
    this.lastTick = 0L;
    this.current = 0.0F;
    this.valid = false;
  }
  
  public void start() {
    this.startTime = TimeUtils.nanoTime();
    this.valid = false;
  }
  
  public void stop() {
    if (this.startTime > 0L) {
      this.current += (float)(TimeUtils.nanoTime() - this.startTime) * 1.0E-9F;
      this.startTime = 0L;
      this.valid = true;
    } 
  }
  
  public void tick() {
    long l1 = TimeUtils.nanoTime();
    long l2 = this.lastTick;
    if (l2 > 0L)
      tick((float)(l1 - l2) * 1.0E-9F); 
    this.lastTick = l1;
  }
  
  public void tick(float paramFloat) {
    float f;
    if (!this.valid) {
      Gdx.app.error("PerformanceCounter", "Invalid data, check if you called PerformanceCounter#stop()");
      return;
    } 
    this.time.put(this.current);
    if (paramFloat == 0.0F) {
      f = 0.0F;
    } else {
      f = this.current / paramFloat;
    } 
    FloatCounter floatCounter = this.load;
    if (paramFloat <= 1.0F)
      f = f * paramFloat + (1.0F - paramFloat) * floatCounter.latest; 
    floatCounter.put(f);
    this.current = 0.0F;
    this.valid = false;
  }
  
  public StringBuilder toString(StringBuilder paramStringBuilder) {
    paramStringBuilder.append(this.name).append(": [time: ").append(this.time.value).append(", load: ").append(this.load.value).append("]");
    return paramStringBuilder;
  }
  
  public String toString() { return toString(new StringBuilder()).toString(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/PerformanceCounter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */