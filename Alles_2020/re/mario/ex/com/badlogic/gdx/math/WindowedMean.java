package com.badlogic.gdx.math;

public final class WindowedMean {
  int added_values = 0;
  
  boolean dirty = true;
  
  int last_value;
  
  float mean = 0.0F;
  
  float[] values;
  
  public WindowedMean(int paramInt) { this.values = new float[paramInt]; }
  
  public void addValue(float paramFloat) {
    int i = this.added_values;
    if (i < this.values.length)
      this.added_values = i + 1; 
    float[] arrayOfFloat = this.values;
    i = this.last_value;
    this.last_value = i + 1;
    arrayOfFloat[i] = paramFloat;
    if (this.last_value > arrayOfFloat.length - 1)
      this.last_value = 0; 
    this.dirty = true;
  }
  
  public void clear() {
    byte b = 0;
    this.added_values = 0;
    this.last_value = 0;
    while (true) {
      float[] arrayOfFloat = this.values;
      if (b < arrayOfFloat.length) {
        arrayOfFloat[b] = 0.0F;
        b++;
        continue;
      } 
      break;
    } 
    this.dirty = true;
  }
  
  public float getHighest() {
    float f = 1.17549435E-38F;
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.values;
      if (b < arrayOfFloat.length) {
        f = Math.max(f, arrayOfFloat[b]);
        b++;
        continue;
      } 
      break;
    } 
    return f;
  }
  
  public float getLatest() {
    float[] arrayOfFloat = this.values;
    int i = this.last_value;
    int j = i;
    if (i - 1 == -1)
      j = arrayOfFloat.length; 
    return arrayOfFloat[j - 1];
  }
  
  public float getLowest() {
    float f = Float.MAX_VALUE;
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.values;
      if (b < arrayOfFloat.length) {
        f = Math.min(f, arrayOfFloat[b]);
        b++;
        continue;
      } 
      break;
    } 
    return f;
  }
  
  public float getMean() {
    if (hasEnoughData()) {
      if (this.dirty) {
        float[] arrayOfFloat;
        byte b = 0;
        float f = 0.0F;
        while (true) {
          arrayOfFloat = this.values;
          if (b < arrayOfFloat.length) {
            f += arrayOfFloat[b];
            b++;
            continue;
          } 
          break;
        } 
        this.mean = f / arrayOfFloat.length;
        this.dirty = false;
      } 
      return this.mean;
    } 
    return 0.0F;
  }
  
  public float getOldest() {
    float f;
    int i = this.added_values;
    float[] arrayOfFloat = this.values;
    if (i < arrayOfFloat.length) {
      f = arrayOfFloat[0];
    } else {
      f = arrayOfFloat[this.last_value];
    } 
    return f;
  }
  
  public int getValueCount() { return this.added_values; }
  
  public int getWindowSize() { return this.values.length; }
  
  public float[] getWindowValues() {
    float[] arrayOfFloat = new float[this.added_values];
    boolean bool = hasEnoughData();
    int i = 0;
    if (bool) {
      while (i < arrayOfFloat.length) {
        float[] arrayOfFloat1 = this.values;
        arrayOfFloat[i] = arrayOfFloat1[(this.last_value + i) % arrayOfFloat1.length];
        i++;
      } 
    } else {
      System.arraycopy(this.values, 0, arrayOfFloat, 0, this.added_values);
    } 
    return arrayOfFloat;
  }
  
  public boolean hasEnoughData() {
    boolean bool;
    if (this.added_values >= this.values.length) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public float standardDeviation() {
    float[] arrayOfFloat;
    boolean bool = hasEnoughData();
    float f1 = 0.0F;
    if (!bool)
      return 0.0F; 
    float f2 = getMean();
    byte b = 0;
    while (true) {
      arrayOfFloat = this.values;
      if (b < arrayOfFloat.length) {
        f1 += (arrayOfFloat[b] - f2) * (arrayOfFloat[b] - f2);
        b++;
        continue;
      } 
      break;
    } 
    return (float)Math.sqrt((f1 / arrayOfFloat.length));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/WindowedMean.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */