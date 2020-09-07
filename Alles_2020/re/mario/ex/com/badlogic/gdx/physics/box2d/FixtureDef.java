package com.badlogic.gdx.physics.box2d;

public class FixtureDef {
  public float density = 0.0F;
  
  public final Filter filter = new Filter();
  
  public float friction = 0.2F;
  
  public boolean isSensor = false;
  
  public float restitution = 0.0F;
  
  public Shape shape;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/FixtureDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */