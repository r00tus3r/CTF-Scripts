package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;

public abstract class ParticleControllerRenderer<D extends ParticleControllerRenderData, T extends ParticleBatch<D>> extends ParticleControllerComponent {
  protected T batch;
  
  protected D renderData;
  
  protected ParticleControllerRenderer() {}
  
  protected ParticleControllerRenderer(D paramD) { this.renderData = paramD; }
  
  public abstract boolean isCompatible(ParticleBatch<?> paramParticleBatch);
  
  public void set(ParticleController paramParticleController) {
    super.set(paramParticleController);
    ParticleControllerRenderData particleControllerRenderData = this.renderData;
    if (particleControllerRenderData != null)
      particleControllerRenderData.controller = this.controller; 
  }
  
  public boolean setBatch(ParticleBatch<?> paramParticleBatch) {
    if (isCompatible(paramParticleBatch)) {
      this.batch = paramParticleBatch;
      return true;
    } 
    return false;
  }
  
  public void update() { this.batch.draw(this.renderData); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */