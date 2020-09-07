package com.uwsoft.editor.renderer.data;

import com.badlogic.gdx.math.Vector2;

public class PhysicsBodyDataVO {
  public boolean allowSleep;
  
  public boolean awake;
  
  public int bodyType = 0;
  
  public boolean bullet;
  
  public Vector2 centerOfMass;
  
  public float damping;
  
  public float density;
  
  public float friction;
  
  public float gravityScale;
  
  public float mass;
  
  public float restitution;
  
  public float rotationalInertia;
  
  public PhysicsBodyDataVO() { this.centerOfMass = new Vector2(); }
  
  public PhysicsBodyDataVO(PhysicsBodyDataVO paramPhysicsBodyDataVO) {
    this.bodyType = paramPhysicsBodyDataVO.bodyType;
    this.mass = paramPhysicsBodyDataVO.mass;
    this.centerOfMass = paramPhysicsBodyDataVO.centerOfMass.cpy();
    this.rotationalInertia = paramPhysicsBodyDataVO.rotationalInertia;
    this.damping = paramPhysicsBodyDataVO.damping;
    this.gravityScale = paramPhysicsBodyDataVO.gravityScale;
    this.allowSleep = paramPhysicsBodyDataVO.allowSleep;
    this.awake = paramPhysicsBodyDataVO.awake;
    this.bullet = paramPhysicsBodyDataVO.bullet;
    this.density = paramPhysicsBodyDataVO.density;
    this.friction = paramPhysicsBodyDataVO.friction;
    this.restitution = paramPhysicsBodyDataVO.restitution;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/PhysicsBodyDataVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */