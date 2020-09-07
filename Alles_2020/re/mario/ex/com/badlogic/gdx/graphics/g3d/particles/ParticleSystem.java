package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.RenderableProvider;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public final class ParticleSystem implements RenderableProvider {
  private static ParticleSystem instance;
  
  private Array<ParticleBatch<?>> batches = new Array();
  
  private Array<ParticleEffect> effects = new Array();
  
  public static ParticleSystem get() {
    if (instance == null)
      instance = new ParticleSystem(); 
    return instance;
  }
  
  public void add(ParticleEffect paramParticleEffect) { this.effects.add(paramParticleEffect); }
  
  public void add(ParticleBatch<?> paramParticleBatch) { this.batches.add(paramParticleBatch); }
  
  public void begin() {
    Iterator iterator = this.batches.iterator();
    while (iterator.hasNext())
      ((ParticleBatch)iterator.next()).begin(); 
  }
  
  public void draw() {
    Iterator iterator = this.effects.iterator();
    while (iterator.hasNext())
      ((ParticleEffect)iterator.next()).draw(); 
  }
  
  public void end() {
    Iterator iterator = this.batches.iterator();
    while (iterator.hasNext())
      ((ParticleBatch)iterator.next()).end(); 
  }
  
  public Array<ParticleBatch<?>> getBatches() { return this.batches; }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    Iterator iterator = this.batches.iterator();
    while (iterator.hasNext())
      ((ParticleBatch)iterator.next()).getRenderables(paramArray, paramPool); 
  }
  
  public void remove(ParticleEffect paramParticleEffect) { this.effects.removeValue(paramParticleEffect, true); }
  
  public void removeAll() { this.effects.clear(); }
  
  public void update() {
    Iterator iterator = this.effects.iterator();
    while (iterator.hasNext())
      ((ParticleEffect)iterator.next()).update(); 
  }
  
  public void update(float paramFloat) {
    Iterator iterator = this.effects.iterator();
    while (iterator.hasNext())
      ((ParticleEffect)iterator.next()).update(paramFloat); 
  }
  
  public void updateAndDraw() {
    for (ParticleEffect particleEffect : this.effects) {
      particleEffect.update();
      particleEffect.draw();
    } 
  }
  
  public void updateAndDraw(float paramFloat) {
    for (ParticleEffect particleEffect : this.effects) {
      particleEffect.update(paramFloat);
      particleEffect.draw();
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleSystem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */