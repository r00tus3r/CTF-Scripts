package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ModelInstanceControllerRenderData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;

public class ModelInstanceParticleBatch extends Object implements ParticleBatch<ModelInstanceControllerRenderData> {
  int bufferedParticlesCount;
  
  Array<ModelInstanceControllerRenderData> controllersRenderData = new Array(false, 5);
  
  public void begin() {
    this.controllersRenderData.clear();
    this.bufferedParticlesCount = 0;
  }
  
  public void draw(ModelInstanceControllerRenderData paramModelInstanceControllerRenderData) {
    this.controllersRenderData.add(paramModelInstanceControllerRenderData);
    this.bufferedParticlesCount += paramModelInstanceControllerRenderData.controller.particles.size;
  }
  
  public void end() {}
  
  public int getBufferedCount() { return this.bufferedParticlesCount; }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    for (ModelInstanceControllerRenderData modelInstanceControllerRenderData : this.controllersRenderData) {
      byte b = 0;
      int i = modelInstanceControllerRenderData.controller.particles.size;
      while (b < i) {
        (ModelInstance[])modelInstanceControllerRenderData.modelInstanceChannel.data[b].getRenderables(paramArray, paramPool);
        b++;
      } 
    } 
  }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {}
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/batches/ModelInstanceParticleBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */