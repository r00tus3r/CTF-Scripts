package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.JointDef;

public class MouseJointDef extends JointDef {
  public float dampingRatio = 0.7F;
  
  public float frequencyHz = 5.0F;
  
  public float maxForce = 0.0F;
  
  public final Vector2 target = new Vector2();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/MouseJointDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */