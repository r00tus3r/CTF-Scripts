package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class FrictionJoint extends Joint {
  private final Vector2 localAnchorA = new Vector2();
  
  private final Vector2 localAnchorB = new Vector2();
  
  private final float[] tmp = new float[2];
  
  public FrictionJoint(World paramWorld, long paramLong) { super(paramWorld, paramLong); }
  
  private native void jniGetLocalAnchorA(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLocalAnchorB(long paramLong, float[] paramArrayOfFloat);
  
  private native float jniGetMaxForce(long paramLong);
  
  private native float jniGetMaxTorque(long paramLong);
  
  private native void jniSetMaxForce(long paramLong, float paramFloat);
  
  private native void jniSetMaxTorque(long paramLong, float paramFloat);
  
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
  
  public float getMaxForce() { return jniGetMaxForce(this.addr); }
  
  public float getMaxTorque() { return jniGetMaxTorque(this.addr); }
  
  public void setMaxForce(float paramFloat) { jniSetMaxForce(this.addr, paramFloat); }
  
  public void setMaxTorque(float paramFloat) { jniSetMaxTorque(this.addr, paramFloat); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/FrictionJoint.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */