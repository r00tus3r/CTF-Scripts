package com.brashmonkey.spriter;

public class Box {
  public final Point[] points = new Point[4];
  
  private Rectangle rect;
  
  public Box() {
    for (byte b = 0; b < 4; b++)
      this.points[b] = new Point(0.0F, 0.0F); 
    this.rect = new Rectangle(0.0F, 0.0F, 0.0F, 0.0F);
  }
  
  public void calcFor(Timeline.Key.Bone paramBone, Entity.ObjectInfo paramObjectInfo) {
    byte b2;
    float f1 = paramObjectInfo.size.width * paramBone.scale.x;
    float f2 = paramObjectInfo.size.height * paramBone.scale.y;
    float f3 = paramBone.pivot.x * f1;
    float f4 = paramBone.pivot.y * f2;
    Point[] arrayOfPoint = this.points;
    boolean bool = false;
    Point point = arrayOfPoint[0];
    float f5 = -f3;
    float f6 = -f4;
    point.set(f5, f6);
    point = this.points[1];
    f1 -= f3;
    point.set(f1, f6);
    point = this.points[2];
    f4 = f2 - f4;
    point.set(f5, f4);
    this.points[3].set(f1, f4);
    byte b1 = 0;
    while (true) {
      b2 = bool;
      if (b1 < 4) {
        this.points[b1].rotate(paramBone.angle);
        b1++;
        continue;
      } 
      break;
    } 
    while (b2 < 4) {
      this.points[b2].translate(paramBone.position);
      b2++;
    } 
  }
  
  public boolean collides(Timeline.Key.Bone paramBone, Entity.ObjectInfo paramObjectInfo, float paramFloat1, float paramFloat2) {
    boolean bool;
    float f1 = paramObjectInfo.size.width * paramBone.scale.x;
    float f2 = paramObjectInfo.size.height * paramBone.scale.y;
    float f3 = paramBone.pivot.x * f1;
    float f4 = paramBone.pivot.y * f2;
    Point point = new Point(paramFloat1 - paramBone.position.x, paramFloat2 - paramBone.position.y);
    point.rotate(-paramBone.angle);
    if (point.x >= -f3 && point.x <= f1 - f3 && point.y >= -f4 && point.y <= f2 - f4) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Rectangle getBoundingRect() {
    this.rect.set((this.points[0]).x, (this.points[0]).y, (this.points[0]).x, (this.points[0]).y);
    this.rect.left = Math.min(Math.min(Math.min(Math.min((this.points[0]).x, (this.points[1]).x), (this.points[2]).x), (this.points[3]).x), this.rect.left);
    this.rect.right = Math.max(Math.max(Math.max(Math.max((this.points[0]).x, (this.points[1]).x), (this.points[2]).x), (this.points[3]).x), this.rect.right);
    this.rect.top = Math.max(Math.max(Math.max(Math.max((this.points[0]).y, (this.points[1]).y), (this.points[2]).y), (this.points[3]).y), this.rect.top);
    this.rect.bottom = Math.min(Math.min(Math.min(Math.min((this.points[0]).y, (this.points[1]).y), (this.points[2]).y), (this.points[3]).y), this.rect.bottom);
    return this.rect;
  }
  
  public boolean isInside(Rectangle paramRectangle) {
    Point[] arrayOfPoint = this.points;
    int i = arrayOfPoint.length;
    byte b = 0;
    boolean bool = false;
    while (b < i) {
      bool |= paramRectangle.isInside(arrayOfPoint[b]);
      b++;
    } 
    return bool;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Box.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */