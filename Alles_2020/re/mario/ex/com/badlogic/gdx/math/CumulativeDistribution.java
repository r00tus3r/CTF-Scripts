package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.Array;

public class CumulativeDistribution<T> extends Object {
  private Array<CumulativeValue> values = new Array(false, 10, CumulativeValue.class);
  
  public void add(T paramT) { this.values.add(new CumulativeValue(paramT, 0.0F, 0.0F)); }
  
  public void add(T paramT, float paramFloat) { this.values.add(new CumulativeValue(paramT, 0.0F, paramFloat)); }
  
  public void clear() { this.values.clear(); }
  
  public void generate() {
    float f = 0.0F;
    for (byte b = 0; b < this.values.size; b++) {
      f += ((CumulativeValue[])this.values.items[b]).interval;
      ((CumulativeValue[])this.values.items[b]).frequency = f;
    } 
  }
  
  public void generateNormalized() {
    float f3;
    byte b2;
    boolean bool = false;
    float f1 = 0.0F;
    byte b1 = 0;
    float f2 = 0.0F;
    while (true) {
      b2 = bool;
      f3 = f1;
      if (b1 < this.values.size) {
        f2 += ((CumulativeValue[])this.values.items[b1]).interval;
        b1++;
        continue;
      } 
      break;
    } 
    while (b2 < this.values.size) {
      f3 += ((CumulativeValue[])this.values.items[b2]).interval / f2;
      ((CumulativeValue[])this.values.items[b2]).frequency = f3;
      b2++;
    } 
  }
  
  public void generateUniform() {
    float f = 1.0F / this.values.size;
    byte b = 0;
    while (b < this.values.size) {
      ((CumulativeValue[])this.values.items[b]).interval = f;
      CumulativeValue cumulativeValue = (CumulativeValue[])this.values.items[b];
      cumulativeValue.frequency = ++b * f;
    } 
  }
  
  public float getInterval(int paramInt) { return ((CumulativeValue[])this.values.items[paramInt]).interval; }
  
  public T getValue(int paramInt) { return (T)((CumulativeValue[])this.values.items[paramInt]).value; }
  
  public void setInterval(int paramInt, float paramFloat) { ((CumulativeValue[])this.values.items[paramInt]).interval = paramFloat; }
  
  public void setInterval(T paramT, float paramFloat) {
    for (CumulativeValue cumulativeValue : this.values) {
      if (cumulativeValue.value == paramT) {
        cumulativeValue.interval = paramFloat;
        break;
      } 
    } 
  }
  
  public int size() { return this.values.size; }
  
  public T value() { return (T)value(MathUtils.random()); }
  
  public T value(float paramFloat) {
    int i = this.values.size - 1;
    int j = 0;
    while (j <= i) {
      int k = (i - j) / 2 + j;
      CumulativeValue cumulativeValue = (CumulativeValue[])this.values.items[k];
      if (paramFloat < cumulativeValue.frequency) {
        i = k - 1;
        continue;
      } 
      if (paramFloat > cumulativeValue.frequency)
        j = k + 1; 
    } 
    return (T)((CumulativeValue[])this.values.items[j]).value;
  }
  
  public class CumulativeValue {
    public float frequency;
    
    public float interval;
    
    public T value;
    
    public CumulativeValue(T param1T, float param1Float1, float param1Float2) {
      this.value = param1T;
      this.frequency = param1Float1;
      this.interval = param1Float2;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/CumulativeDistribution.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */