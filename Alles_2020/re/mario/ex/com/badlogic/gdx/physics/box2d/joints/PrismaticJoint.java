package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class PrismaticJoint extends Joint {
  private final Vector2 localAnchorA = new Vector2();
  
  private final Vector2 localAnchorB = new Vector2();
  
  private final Vector2 localAxisA = new Vector2();
  
  private final float[] tmp = new float[2];
  
  public PrismaticJoint(World paramWorld, long paramLong) { super(paramWorld, paramLong); }
  
  private native void jniEnableLimit(long paramLong, boolean paramBoolean);
  
  private native void jniEnableMotor(long paramLong, boolean paramBoolean);
  
  private native float jniGetJointSpeed(long paramLong);
  
  private native float jniGetJointTranslation(long paramLong);
  
  private native void jniGetLocalAnchorA(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLocalAnchorB(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLocalAxisA(long paramLong, float[] paramArrayOfFloat);
  
  private native float jniGetLowerLimit(long paramLong);
  
  private native float jniGetMaxMotorForce(long paramLong);
  
  private native float jniGetMotorForce(long paramLong, float paramFloat);
  
  private native float jniGetMotorSpeed(long paramLong);
  
  private native float jniGetReferenceAngle(long paramLong);
  
  private native float jniGetUpperLimit(long paramLong);
  
  private native boolean jniIsLimitEnabled(long paramLong);
  
  private native boolean jniIsMotorEnabled(long paramLong);
  
  private native void jniSetLimits(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetMaxMotorForce(long paramLong, float paramFloat);
  
  private native void jniSetMotorSpeed(long paramLong, float paramFloat);
  
  public void enableLimit(boolean paramBoolean) { jniEnableLimit(this.addr, paramBoolean); }
  
  public void enableMotor(boolean paramBoolean) { jniEnableMotor(this.addr, paramBoolean); }
  
  public float getJointSpeed() { return jniGetJointSpeed(this.addr); }
  
  public float getJointTranslation() { return jniGetJointTranslation(this.addr); }
  
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
  
  public Vector2 getLocalAxisA() {
    jniGetLocalAxisA(this.addr, this.tmp);
    Vector2 vector2 = this.localAxisA;
    float[] arrayOfFloat = this.tmp;
    vector2.set(arrayOfFloat[0], arrayOfFloat[1]);
    return this.localAxisA;
  }
  
  public float getLowerLimit() { return jniGetLowerLimit(this.addr); }
  
  public float getMaxMotorForce() { return jniGetMaxMotorForce(this.addr); }
  
  public float getMotorForce(float paramFloat) { return jniGetMotorForce(this.addr, paramFloat); }
  
  public float getMotorSpeed() { return jniGetMotorSpeed(this.addr); }
  
  public float getReferenceAngle() { return jniGetReferenceAngle(this.addr); }
  
  public float getUpperLimit() { return jniGetUpperLimit(this.addr); }
  
  public boolean isLimitEnabled() { return jniIsLimitEnabled(this.addr); }
  
  public boolean isMotorEnabled() { return jniIsMotorEnabled(this.addr); }
  
  public void setLimits(float paramFloat1, float paramFloat2) { jniSetLimits(this.addr, paramFloat1, paramFloat2); }
  
  public void setMaxMotorForce(float paramFloat) { jniSetMaxMotorForce(this.addr, paramFloat); }
  
  public void setMotorSpeed(float paramFloat) { jniSetMotorSpeed(this.addr, paramFloat); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/PrismaticJoint.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */