package com.brashmonkey.spriter;

public class Point {
  public float x;
  
  public float y;
  
  public Point() { this(0.0F, 0.0F); }
  
  public Point(float paramFloat1, float paramFloat2) { set(paramFloat1, paramFloat2); }
  
  public Point(Point paramPoint) { this(paramPoint.x, paramPoint.y); }
  
  public Point copy() { return new Point(this.x, this.y); }
  
  public Point rotate(float paramFloat) {
    if (this.x != 0.0F || this.y != 0.0F) {
      float f1 = Calculator.cosDeg(paramFloat);
      paramFloat = Calculator.sinDeg(paramFloat);
      float f2 = this.x;
      float f3 = this.y;
      this.x = f2 * f1 - f3 * paramFloat;
      this.y = f2 * paramFloat + f3 * f1;
    } 
    return this;
  }
  
  public Point scale(float paramFloat1, float paramFloat2) { return set(this.x * paramFloat1, this.y * paramFloat2); }
  
  public Point scale(Point paramPoint) { return scale(paramPoint.x, paramPoint.y); }
  
  public Point set(float paramFloat1, float paramFloat2) {
    this.x = paramFloat1;
    this.y = paramFloat2;
    return this;
  }
  
  public Point set(Point paramPoint) { return set(paramPoint.x, paramPoint.y); }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    stringBuilder.append(this.x);
    stringBuilder.append(",");
    stringBuilder.append(this.y);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
  
  public Point translate(float paramFloat1, float paramFloat2) { return set(this.x + paramFloat1, this.y + paramFloat2); }
  
  public Point translate(Point paramPoint) { return translate(paramPoint.x, paramPoint.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Point.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */