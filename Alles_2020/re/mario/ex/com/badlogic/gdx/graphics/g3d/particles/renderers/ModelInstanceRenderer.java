package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.ModelInstanceParticleBatch;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;

public class ModelInstanceRenderer extends ParticleControllerRenderer<ModelInstanceControllerRenderData, ModelInstanceParticleBatch> {
  private boolean hasColor;
  
  private boolean hasRotation;
  
  private boolean hasScale;
  
  public ModelInstanceRenderer() { super(new ModelInstanceControllerRenderData()); }
  
  public ModelInstanceRenderer(ModelInstanceParticleBatch paramModelInstanceParticleBatch) {
    this();
    setBatch(paramModelInstanceParticleBatch);
  }
  
  public void allocateChannels() { ((ModelInstanceControllerRenderData)this.renderData).positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position); }
  
  public ParticleControllerComponent copy() { return new ModelInstanceRenderer((ModelInstanceParticleBatch)this.batch); }
  
  public void init() {
    byte b2;
    ((ModelInstanceControllerRenderData)this.renderData).modelInstanceChannel = (ParallelArray.ObjectChannel)this.controller.particles.getChannel(ParticleChannels.ModelInstance);
    ((ModelInstanceControllerRenderData)this.renderData).colorChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.Color);
    ((ModelInstanceControllerRenderData)this.renderData).scaleChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.Scale);
    ((ModelInstanceControllerRenderData)this.renderData).rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.Rotation3D);
    ParallelArray.FloatChannel floatChannel = ((ModelInstanceControllerRenderData)this.renderData).colorChannel;
    byte b1 = 1;
    if (floatChannel != null) {
      b2 = 1;
    } else {
      b2 = 0;
    } 
    this.hasColor = b2;
    if (((ModelInstanceControllerRenderData)this.renderData).scaleChannel != null) {
      b2 = 1;
    } else {
      b2 = 0;
    } 
    this.hasScale = b2;
    if (((ModelInstanceControllerRenderData)this.renderData).rotationChannel != null) {
      b2 = b1;
    } else {
      b2 = 0;
    } 
    this.hasRotation = b2;
  }
  
  public boolean isCompatible(ParticleBatch<?> paramParticleBatch) { return paramParticleBatch instanceof ModelInstanceParticleBatch; }
  
  public void update() {
    int i = this.controller.particles.size;
    int j = 0;
    for (int k = 0; j < i; k += ((ModelInstanceControllerRenderData)this.renderData).positionChannel.strideSize) {
      float f5;
      float f4;
      float f3;
      float f2;
      float f1;
      ModelInstance modelInstance = (ModelInstance[])((ModelInstanceControllerRenderData)this.renderData).modelInstanceChannel.data[j];
      if (this.hasScale) {
        f1 = ((ModelInstanceControllerRenderData)this.renderData).scaleChannel.data[j];
      } else {
        f1 = 1.0F;
      } 
      if (this.hasRotation) {
        int m = ((ModelInstanceControllerRenderData)this.renderData).rotationChannel.strideSize * j;
        f2 = ((ModelInstanceControllerRenderData)this.renderData).rotationChannel.data[m + 0];
        f3 = ((ModelInstanceControllerRenderData)this.renderData).rotationChannel.data[m + 1];
        f4 = ((ModelInstanceControllerRenderData)this.renderData).rotationChannel.data[m + 2];
        f5 = ((ModelInstanceControllerRenderData)this.renderData).rotationChannel.data[m + 3];
      } else {
        f2 = 0.0F;
        f3 = 0.0F;
        f4 = 0.0F;
        f5 = 1.0F;
      } 
      modelInstance.transform.set(((ModelInstanceControllerRenderData)this.renderData).positionChannel.data[k + false], ((ModelInstanceControllerRenderData)this.renderData).positionChannel.data[k + true], ((ModelInstanceControllerRenderData)this.renderData).positionChannel.data[k + 2], f2, f3, f4, f5, f1, f1, f1);
      if (this.hasColor) {
        int m = ((ModelInstanceControllerRenderData)this.renderData).colorChannel.strideSize * j;
        ColorAttribute colorAttribute = (ColorAttribute)((Material)modelInstance.materials.get(0)).get(ColorAttribute.Diffuse);
        BlendingAttribute blendingAttribute = (BlendingAttribute)((Material)modelInstance.materials.get(0)).get(BlendingAttribute.Type);
        colorAttribute.color.r = ((ModelInstanceControllerRenderData)this.renderData).colorChannel.data[m + 0];
        colorAttribute.color.g = ((ModelInstanceControllerRenderData)this.renderData).colorChannel.data[m + 1];
        colorAttribute.color.b = ((ModelInstanceControllerRenderData)this.renderData).colorChannel.data[m + 2];
        if (blendingAttribute != null)
          blendingAttribute.opacity = ((ModelInstanceControllerRenderData)this.renderData).colorChannel.data[m + 3]; 
      } 
      j++;
    } 
    super.update();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */