package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class WorldManifold {
  protected final Vector2 normal = new Vector2();
  
  protected int numContactPoints;
  
  protected final Vector2[] points = { new Vector2(), new Vector2() };
  
  protected final float[] separations = new float[2];
  
  public Vector2 getNormal() { return this.normal; }
  
  public int getNumberOfContactPoints() { return this.numContactPoints; }
  
  public Vector2[] getPoints() { return this.points; }
  
  public float[] getSeparations() { return this.separations; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/WorldManifold.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */