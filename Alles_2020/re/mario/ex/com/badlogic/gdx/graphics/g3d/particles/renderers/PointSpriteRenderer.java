package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.graphics.g3d.particles.batches.PointSpriteParticleBatch;

public class PointSpriteRenderer extends ParticleControllerRenderer<PointSpriteControllerRenderData, PointSpriteParticleBatch> {
  public PointSpriteRenderer() { super(new PointSpriteControllerRenderData()); }
  
  public PointSpriteRenderer(PointSpriteParticleBatch paramPointSpriteParticleBatch) {
    this();
    setBatch(paramPointSpriteParticleBatch);
  }
  
  public void allocateChannels() {
    ((PointSpriteControllerRenderData)this.renderData).positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position);
    ((PointSpriteControllerRenderData)this.renderData).regionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.TextureRegion, ParticleChannels.TextureRegionInitializer.get());
    ((PointSpriteControllerRenderData)this.renderData).colorChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Color, ParticleChannels.ColorInitializer.get());
    ((PointSpriteControllerRenderData)this.renderData).scaleChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Scale, ParticleChannels.ScaleInitializer.get());
    ((PointSpriteControllerRenderData)this.renderData).rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Rotation2D, ParticleChannels.Rotation2dInitializer.get());
  }
  
  public ParticleControllerComponent copy() { return new PointSpriteRenderer((PointSpriteParticleBatch)this.batch); }
  
  public boolean isCompatible(ParticleBatch<?> paramParticleBatch) { return paramParticleBatch instanceof PointSpriteParticleBatch; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/renderers/PointSpriteRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */