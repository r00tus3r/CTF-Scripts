package com.badlogic.gdx.physics.box2d;

public interface ContactListener {
  void beginContact(Contact paramContact);
  
  void endContact(Contact paramContact);
  
  void postSolve(Contact paramContact, ContactImpulse paramContactImpulse);
  
  void preSolve(Contact paramContact, Manifold paramManifold);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/ContactListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */