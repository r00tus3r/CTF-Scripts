package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class Transform {
  public static final int COS = 2;
  
  public static final int POS_X = 0;
  
  public static final int POS_Y = 1;
  
  public static final int SIN = 3;
  
  private Vector2 orientation = new Vector2();
  
  private Vector2 position = new Vector2();
  
  public float[] vals = new float[4];
  
  public Transform() {}
  
  public Transform(Vector2 paramVector2, float paramFloat) {
    setPosition(paramVector2);
    setRotation(paramFloat);
  }
  
  public Transform(Vector2 paramVector21, Vector2 paramVector22) {
    setPosition(paramVector21);
    setOrientation(paramVector22);
  }
  
  public Vector2 getOrientation() {
    Vector2 vector2 = this.orientation;
    float[] arrayOfFloat = this.vals;
    return vector2.set(arrayOfFloat[2], arrayOfFloat[3]);
  }
  
  public Vector2 getPosition() {
    Vector2 vector2 = this.position;
    float[] arrayOfFloat = this.vals;
    return vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
  }
  
  public float getRotation() {
    float[] arrayOfFloat = this.vals;
    return (float)Math.atan2(arrayOfFloat[3], arrayOfFloat[2]);
  }
  
  public Vector2 mul(Vector2 paramVector2) {
    float[] arrayOfFloat = this.vals;
    float f1 = arrayOfFloat[0];
    float f2 = arrayOfFloat[2];
    float f3 = paramVector2.x;
    float f4 = -this.vals[3];
    float f5 = paramVector2.y;
    arrayOfFloat = this.vals;
    float f6 = arrayOfFloat[1];
    float f7 = arrayOfFloat[3];
    float f8 = paramVector2.x;
    float f9 = this.vals[2];
    float f10 = paramVector2.y;
    paramVector2.x = f1 + f2 * f3 + f4 * f5;
    paramVector2.y = f6 + f7 * f8 + f9 * f10;
    return paramVector2;
  }
  
  public void setOrientation(Vector2 paramVector2) {
    this.vals[2] = paramVector2.x;
    this.vals[3] = paramVector2.y;
  }
  
  public void setPosition(Vector2 paramVector2) {
    this.vals[0] = paramVector2.x;
    this.vals[1] = paramVector2.y;
  }
  
  public void setRotation(float paramFloat) {
    double d = paramFloat;
    float f = (float)Math.cos(d);
    paramFloat = (float)Math.sin(d);
    float[] arrayOfFloat = this.vals;
    arrayOfFloat[2] = f;
    arrayOfFloat[3] = paramFloat;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Transform.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */