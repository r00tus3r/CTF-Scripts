package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.RenderableProvider;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderData;

public interface ParticleBatch<T extends ParticleControllerRenderData> extends RenderableProvider, ResourceData.Configurable {
  void begin();
  
  void draw(T paramT);
  
  void end();
  
  void load(AssetManager paramAssetManager, ResourceData paramResourceData);
  
  void save(AssetManager paramAssetManager, ResourceData paramResourceData);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */