package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;

public class DistanceJointDef extends JointDef {
  public float dampingRatio = 0.0F;
  
  public float frequencyHz = 0.0F;
  
  public float length = 1.0F;
  
  public final Vector2 localAnchorA = new Vector2();
  
  public final Vector2 localAnchorB = new Vector2();
  
  public void initialize(Body paramBody1, Body paramBody2, Vector2 paramVector21, Vector2 paramVector22) {
    this.bodyA = paramBody1;
    this.bodyB = paramBody2;
    this.localAnchorA.set(paramBody1.getLocalPoint(paramVector21));
    this.localAnchorB.set(paramBody2.getLocalPoint(paramVector22));
    this.length = paramVector21.dst(paramVector22);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/DistanceJointDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */