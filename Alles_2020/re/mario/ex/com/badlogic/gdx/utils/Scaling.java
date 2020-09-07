package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.Vector2;

public static enum Scaling {
  fill, fillX, fillY, fit, none, stretch, stretchX, stretchY;
  
  private static final Vector2 temp;
  
  static  {
    fill = new Scaling("fill", true);
    fillX = new Scaling("fillX", 2);
    fillY = new Scaling("fillY", 3);
    stretch = new Scaling("stretch", 4);
    stretchX = new Scaling("stretchX", 5);
    stretchY = new Scaling("stretchY", 6);
    none = new Scaling("none", 7);
    $VALUES = new Scaling[] { fit, fill, fillX, fillY, stretch, stretchX, stretchY, none };
    temp = new Vector2();
  }
  
  public Vector2 apply(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    switch (this) {
      default:
        return temp;
      case none:
        vector2 = temp;
        vector2.x = paramFloat1;
        vector2.y = paramFloat2;
      case stretchY:
        vector2 = temp;
        vector2.x = paramFloat1;
        vector2.y = paramFloat4;
      case stretchX:
        vector2 = temp;
        vector2.x = paramFloat3;
        vector2.y = paramFloat2;
      case stretch:
        vector2 = temp;
        vector2.x = paramFloat3;
        vector2.y = paramFloat4;
      case fillY:
        paramFloat3 = paramFloat4 / paramFloat2;
        vector2 = temp;
        vector2.x = paramFloat1 * paramFloat3;
        vector2.y = paramFloat2 * paramFloat3;
      case fillX:
        paramFloat3 /= paramFloat1;
        vector2 = temp;
        vector2.x = paramFloat1 * paramFloat3;
        vector2.y = paramFloat2 * paramFloat3;
      case fill:
        if (paramFloat4 / paramFloat3 < paramFloat2 / paramFloat1) {
          paramFloat3 /= paramFloat1;
        } else {
          paramFloat3 = paramFloat4 / paramFloat2;
        } 
        vector2 = temp;
        vector2.x = paramFloat1 * paramFloat3;
        vector2.y = paramFloat2 * paramFloat3;
      case fit:
        break;
    } 
    if (paramFloat4 / paramFloat3 > paramFloat2 / paramFloat1) {
      paramFloat3 /= paramFloat1;
    } else {
      paramFloat3 = paramFloat4 / paramFloat2;
    } 
    Vector2 vector2 = temp;
    vector2.x = paramFloat1 * paramFloat3;
    vector2.y = paramFloat2 * paramFloat3;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Scaling.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */