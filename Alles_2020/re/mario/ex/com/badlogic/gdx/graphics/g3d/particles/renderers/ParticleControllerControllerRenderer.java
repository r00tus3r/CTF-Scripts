package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ParticleControllerControllerRenderer extends ParticleControllerRenderer {
  ParallelArray.ObjectChannel<ParticleController> controllerChannel;
  
  public ParticleControllerComponent copy() { return new ParticleControllerControllerRenderer(); }
  
  public void init() {
    this.controllerChannel = (ParallelArray.ObjectChannel)this.controller.particles.getChannel(ParticleChannels.ParticleController);
    if (this.controllerChannel != null)
      return; 
    throw new GdxRuntimeException("ParticleController channel not found, specify an influencer which will allocate it please.");
  }
  
  public boolean isCompatible(ParticleBatch paramParticleBatch) { return false; }
  
  public void update() {
    int i = this.controller.particles.size;
    for (byte b = 0; b < i; b++)
      (ParticleController[])this.controllerChannel.data[b].draw(); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerControllerRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */