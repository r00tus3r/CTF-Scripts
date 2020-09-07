package com.brashmonkey.spriter;

public class Rectangle {
  public float bottom;
  
  public float left;
  
  public float right;
  
  public final Dimension size;
  
  public float top;
  
  public Rectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.size = new Dimension(0.0F, 0.0F);
    calculateSize();
  }
  
  public Rectangle(Rectangle paramRectangle) { this(paramRectangle.left, paramRectangle.top, paramRectangle.right, paramRectangle.bottom); }
  
  public static boolean areIntersecting(Rectangle paramRectangle1, Rectangle paramRectangle2) { return (paramRectangle1.isInside(paramRectangle2.left, paramRectangle2.top) || paramRectangle1.isInside(paramRectangle2.right, paramRectangle2.top) || paramRectangle1.isInside(paramRectangle2.left, paramRectangle2.bottom) || paramRectangle1.isInside(paramRectangle2.right, paramRectangle2.bottom)); }
  
  public static void setBiggerRectangle(Rectangle paramRectangle1, Rectangle paramRectangle2, Rectangle paramRectangle3) {
    paramRectangle3.left = Math.min(paramRectangle1.left, paramRectangle2.left);
    paramRectangle3.bottom = Math.min(paramRectangle1.bottom, paramRectangle2.bottom);
    paramRectangle3.right = Math.max(paramRectangle1.right, paramRectangle2.right);
    paramRectangle3.top = Math.max(paramRectangle1.top, paramRectangle2.top);
  }
  
  public void calculateSize() { this.size.set(this.right - this.left, this.top - this.bottom); }
  
  public boolean isInside(float paramFloat1, float paramFloat2) {
    boolean bool;
    if (paramFloat1 >= this.left && paramFloat1 <= this.right && paramFloat2 <= this.top && paramFloat2 >= this.bottom) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isInside(Point paramPoint) { return isInside(paramPoint.x, paramPoint.y); }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.left = paramFloat1;
    this.top = paramFloat2;
    this.right = paramFloat3;
    this.bottom = paramFloat4;
  }
  
  public void set(Rectangle paramRectangle) {
    if (paramRectangle == null)
      return; 
    this.bottom = paramRectangle.bottom;
    this.left = paramRectangle.left;
    this.right = paramRectangle.right;
    this.top = paramRectangle.top;
    calculateSize();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Rectangle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */