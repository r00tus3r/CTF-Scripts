package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;

public class MotorJointDef extends JointDef {
  public float angularOffset = 0.0F;
  
  public float correctionFactor = 0.3F;
  
  public final Vector2 linearOffset = new Vector2();
  
  public float maxForce = 1.0F;
  
  public float maxTorque = 1.0F;
  
  public void initialize(Body paramBody1, Body paramBody2) {
    this.bodyA = paramBody1;
    this.bodyB = paramBody2;
    this.linearOffset.set(this.bodyA.getLocalPoint(this.bodyB.getPosition()));
    this.angularOffset = this.bodyB.getAngle() - this.bodyA.getAngle();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/MotorJointDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */