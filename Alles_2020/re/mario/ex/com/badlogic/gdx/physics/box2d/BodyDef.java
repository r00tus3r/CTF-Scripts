package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class BodyDef {
  public boolean active = true;
  
  public boolean allowSleep = true;
  
  public float angle = 0.0F;
  
  public float angularDamping = 0.0F;
  
  public float angularVelocity = 0.0F;
  
  public boolean awake = true;
  
  public boolean bullet = false;
  
  public boolean fixedRotation = false;
  
  public float gravityScale = 1.0F;
  
  public float linearDamping = 0.0F;
  
  public final Vector2 linearVelocity = new Vector2();
  
  public final Vector2 position = new Vector2();
  
  public BodyType type = BodyType.StaticBody;
  
  public enum BodyType {
    DynamicBody,
    KinematicBody,
    StaticBody(false);
    
    private int value;
    
    static  {
      KinematicBody = new BodyType("KinematicBody", true, true);
      DynamicBody = new BodyType("DynamicBody", 2, 2);
      $VALUES = new BodyType[] { StaticBody, KinematicBody, DynamicBody };
    }
    
    BodyType(int param1Int1) { this.value = param1Int1; }
    
    public int getValue() { return this.value; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/BodyDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */