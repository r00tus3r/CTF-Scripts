package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.BillboardParticleBatch;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;

public class BillboardRenderer extends ParticleControllerRenderer<BillboardControllerRenderData, BillboardParticleBatch> {
  public BillboardRenderer() { super(new BillboardControllerRenderData()); }
  
  public BillboardRenderer(BillboardParticleBatch paramBillboardParticleBatch) {
    this();
    setBatch(paramBillboardParticleBatch);
  }
  
  public void allocateChannels() {
    ((BillboardControllerRenderData)this.renderData).positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position);
    ((BillboardControllerRenderData)this.renderData).regionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.TextureRegion, ParticleChannels.TextureRegionInitializer.get());
    ((BillboardControllerRenderData)this.renderData).colorChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Color, ParticleChannels.ColorInitializer.get());
    ((BillboardControllerRenderData)this.renderData).scaleChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Scale, ParticleChannels.ScaleInitializer.get());
    ((BillboardControllerRenderData)this.renderData).rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Rotation2D, ParticleChannels.Rotation2dInitializer.get());
  }
  
  public ParticleControllerComponent copy() { return new BillboardRenderer((BillboardParticleBatch)this.batch); }
  
  public boolean isCompatible(ParticleBatch<?> paramParticleBatch) { return paramParticleBatch instanceof BillboardParticleBatch; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/renderers/BillboardRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */