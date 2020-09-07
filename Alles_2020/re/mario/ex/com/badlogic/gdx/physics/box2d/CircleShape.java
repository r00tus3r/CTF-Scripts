package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class CircleShape extends Shape {
  private final Vector2 position = new Vector2();
  
  private final float[] tmp = new float[2];
  
  public CircleShape() {}
  
  protected CircleShape(long paramLong) {}
  
  private native void jniGetPosition(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniSetPosition(long paramLong, float paramFloat1, float paramFloat2);
  
  private native long newCircleShape();
  
  public Vector2 getPosition() {
    jniGetPosition(this.addr, this.tmp);
    Vector2 vector2 = this.position;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Shape.Type getType() { return Shape.Type.Circle; }
  
  public void setPosition(Vector2 paramVector2) { jniSetPosition(this.addr, paramVector2.x, paramVector2.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/CircleShape.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */