package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class DistanceJoint extends Joint {
  private final Vector2 localAnchorA = new Vector2();
  
  private final Vector2 localAnchorB = new Vector2();
  
  private final float[] tmp = new float[2];
  
  public DistanceJoint(World paramWorld, long paramLong) { super(paramWorld, paramLong); }
  
  private native float jniGetDampingRatio(long paramLong);
  
  private native float jniGetFrequency(long paramLong);
  
  private native float jniGetLength(long paramLong);
  
  private native void jniGetLocalAnchorA(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLocalAnchorB(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniSetDampingRatio(long paramLong, float paramFloat);
  
  private native void jniSetFrequency(long paramLong, float paramFloat);
  
  private native void jniSetLength(long paramLong, float paramFloat);
  
  public float getDampingRatio() { return jniGetDampingRatio(this.addr); }
  
  public float getFrequency() { return jniGetFrequency(this.addr); }
  
  public float getLength() { return jniGetLength(this.addr); }
  
  public Vector2 getLocalAnchorA() {
    jniGetLocalAnchorA(this.addr, this.tmp);
    Vector2 vector2 = this.localAnchorA;
    float[] arrayOfFloat = this.tmp;
    vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
    return this.localAnchorA;
  }
  
  public Vector2 getLocalAnchorB() {
    jniGetLocalAnchorB(this.addr, this.tmp);
    Vector2 vector2 = this.localAnchorB;
    float[] arrayOfFloat = this.tmp;
    vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
    return this.localAnchorB;
  }
  
  public void setDampingRatio(float paramFloat) { jniSetDampingRatio(this.addr, paramFloat); }
  
  public void setFrequency(float paramFloat) { jniSetFrequency(this.addr, paramFloat); }
  
  public void setLength(float paramFloat) { jniSetLength(this.addr, paramFloat); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/DistanceJoint.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */