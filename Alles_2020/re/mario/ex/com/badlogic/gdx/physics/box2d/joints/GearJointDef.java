package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.JointDef;

public class GearJointDef extends JointDef {
  public Joint joint1 = null;
  
  public Joint joint2 = null;
  
  public float ratio = 1.0F;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/joints/GearJointDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */