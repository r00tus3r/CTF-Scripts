package com.brashmonkey.spriter;

public class Dimension {
  public float height;
  
  public float width;
  
  public Dimension(float paramFloat1, float paramFloat2) { set(paramFloat1, paramFloat2); }
  
  public Dimension(Dimension paramDimension) { set(paramDimension); }
  
  public void set(float paramFloat1, float paramFloat2) {
    this.width = paramFloat1;
    this.height = paramFloat2;
  }
  
  public void set(Dimension paramDimension) { set(paramDimension.width, paramDimension.height); }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.width);
    stringBuilder.append("x");
    stringBuilder.append(this.height);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Dimension.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */