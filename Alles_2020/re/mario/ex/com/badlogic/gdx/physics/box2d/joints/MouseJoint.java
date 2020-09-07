package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class MouseJoint extends Joint {
  private final Vector2 target = new Vector2();
  
  final float[] tmp = new float[2];
  
  public MouseJoint(World paramWorld, long paramLong) { super(paramWorld, paramLong); }
  
  private native float jniGetDampingRatio(long paramLong);
  
  private native float jniGetFrequency(long paramLong);
  
  private native float jniGetMaxForce(long paramLong);
  
  private native void jniGetTarget(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniSetDampingRatio(long paramLong, float paramFloat);
  
  private native void jniSetFrequency(long paramLong, float paramFloat);
  
  private native void jniSetMaxForce(long paramLong, float paramFloat);
  
  private native void jniSetTarget(long paramLong, float paramFloat1, float paramFloat2);
  
  public float getDampingRatio() { return jniGetDampingRatio(this.addr); }
  
  public float getFrequency() { return jniGetFrequency(this.addr); }
  
  public float getMaxForce() { return jniGetMaxForce(this.addr); }
  
  public Vector2 getTarget() {
    jniGetTarget(this.addr, this.tmp);
    Vector2 vector2 = this.target;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public void setDampingRatio(float paramFloat) { jniSetDampingRatio(this.addr, paramFloat); }
  
  public void setFrequency(float paramFloat) { jniSetFrequency(this.addr, paramFloat); }
  
  public void setMaxForce(float paramFloat) { jniSetMaxForce(this.addr, paramFloat); }
  
  public void setTarget(Vector2 paramVector2) { jniSetTarget(this.addr, paramVector2.x, paramVector2.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/MouseJoint.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */