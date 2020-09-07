package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.ParticleEmitter;
import com.badlogic.gdx.scenes.scene2d.Actor;

public class ParticleActor extends Actor {
  private float lastDelta = 0.0F;
  
  private ParticleEffect particleEffect;
  
  public ParticleActor(ParticleEffect paramParticleEffect) {
    setVisible(true);
    this.particleEffect = paramParticleEffect;
  }
  
  public void act(float paramFloat) {
    this.lastDelta = paramFloat;
    this.particleEffect.setPosition(getX(), getY());
  }
  
  public void draw(Batch paramBatch, float paramFloat) { this.particleEffect.draw(paramBatch, this.lastDelta); }
  
  public void fastForward(float paramFloat) { act(paramFloat); }
  
  public ParticleEffect getParticleEffect() { return this.particleEffect; }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    setX(paramFloat1);
    setY(paramFloat2);
    this.particleEffect.setPosition(getX(), getY());
  }
  
  public void start() {
    this.particleEffect.reset();
    this.particleEffect.start();
  }
  
  public void stop() {
    for (byte b = 0; b < (this.particleEffect.getEmitters()).size; b++) {
      ((ParticleEmitter)this.particleEffect.getEmitters().get(b)).setContinuous(false);
      ((ParticleEmitter)this.particleEffect.getEmitters().get(b)).allowCompletion();
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/ParticleActor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */