package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;

public class PrismaticJointDef extends JointDef {
  public boolean enableLimit = false;
  
  public boolean enableMotor = false;
  
  public final Vector2 localAnchorA = new Vector2();
  
  public final Vector2 localAnchorB = new Vector2();
  
  public final Vector2 localAxisA = new Vector2(1.0F, 0.0F);
  
  public float lowerTranslation = 0.0F;
  
  public float maxMotorForce = 0.0F;
  
  public float motorSpeed = 0.0F;
  
  public float referenceAngle = 0.0F;
  
  public float upperTranslation = 0.0F;
  
  public void initialize(Body paramBody1, Body paramBody2, Vector2 paramVector21, Vector2 paramVector22) {
    this.bodyA = paramBody1;
    this.bodyB = paramBody2;
    this.localAnchorA.set(paramBody1.getLocalPoint(paramVector21));
    this.localAnchorB.set(paramBody2.getLocalPoint(paramVector21));
    this.localAxisA.set(paramBody1.getLocalVector(paramVector22));
    this.referenceAngle = paramBody2.getAngle() - paramBody1.getAngle();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/PrismaticJointDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */