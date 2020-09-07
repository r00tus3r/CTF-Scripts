package com.badlogic.gdx.physics.box2d;

public class JointEdge {
  public final Joint joint;
  
  public final Body other;
  
  protected JointEdge(Body paramBody, Joint paramJoint) {
    this.other = paramBody;
    this.joint = paramJoint;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/JointEdge.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */