package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ParticleControllerFinalizerInfluencer extends Influencer {
  ParallelArray.ObjectChannel<ParticleController> controllerChannel;
  
  boolean hasRotation;
  
  boolean hasScale;
  
  ParallelArray.FloatChannel positionChannel;
  
  ParallelArray.FloatChannel rotationChannel;
  
  ParallelArray.FloatChannel scaleChannel;
  
  public void allocateChannels() { this.positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position); }
  
  public ParticleControllerFinalizerInfluencer copy() { return new ParticleControllerFinalizerInfluencer(); }
  
  public void init() {
    this.controllerChannel = (ParallelArray.ObjectChannel)this.controller.particles.getChannel(ParticleChannels.ParticleController);
    if (this.controllerChannel != null) {
      byte b2;
      this.scaleChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.Scale);
      this.rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.Rotation3D);
      ParallelArray.FloatChannel floatChannel = this.scaleChannel;
      byte b1 = 1;
      if (floatChannel != null) {
        b2 = 1;
      } else {
        b2 = 0;
      } 
      this.hasScale = b2;
      if (this.rotationChannel != null) {
        b2 = b1;
      } else {
        b2 = 0;
      } 
      this.hasRotation = b2;
      return;
    } 
    throw new GdxRuntimeException("ParticleController channel not found, specify an influencer which will allocate it please.");
  }
  
  public void update() {
    int i = this.controller.particles.size;
    int j = 0;
    for (int k = 0; j < i; k += this.positionChannel.strideSize) {
      float f5;
      float f4;
      float f3;
      float f2;
      float f1;
      ParticleController particleController = (ParticleController[])this.controllerChannel.data[j];
      if (this.hasScale) {
        f1 = this.scaleChannel.data[j];
      } else {
        f1 = 1.0F;
      } 
      if (this.hasRotation) {
        int m = this.rotationChannel.strideSize * j;
        f2 = this.rotationChannel.data[m + 0];
        f3 = this.rotationChannel.data[m + 1];
        f4 = this.rotationChannel.data[m + 2];
        f5 = this.rotationChannel.data[m + 3];
      } else {
        f2 = 0.0F;
        f3 = 0.0F;
        f4 = 0.0F;
        f5 = 1.0F;
      } 
      particleController.setTransform(this.positionChannel.data[k + false], this.positionChannel.data[k + true], this.positionChannel.data[k + 2], f2, f3, f4, f5, f1);
      particleController.update();
      j++;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerFinalizerInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */