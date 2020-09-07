package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public abstract class ModelInfluencer extends Influencer {
  ParallelArray.ObjectChannel<ModelInstance> modelChannel;
  
  public Array<Model> models = new Array(true, true, Model.class);
  
  public ModelInfluencer() {}
  
  public ModelInfluencer(ModelInfluencer paramModelInfluencer) { this((Model[])paramModelInfluencer.models.toArray(Model.class)); }
  
  public ModelInfluencer(Model... paramVarArgs) {}
  
  public void allocateChannels() { this.modelChannel = (ParallelArray.ObjectChannel)this.controller.particles.addChannel(ParticleChannels.ModelInstance); }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.getSaveData();
    while (true) {
      AssetDescriptor assetDescriptor = saveData.loadAsset();
      if (assetDescriptor != null) {
        Model model = (Model)paramAssetManager.get(assetDescriptor);
        if (model != null) {
          this.models.add(model);
          continue;
        } 
        throw new RuntimeException("Model is null");
      } 
      break;
    } 
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.createSaveData();
    Iterator iterator = this.models.iterator();
    while (iterator.hasNext())
      saveData.saveAsset(paramAssetManager.getAssetFileName((Model)iterator.next()), Model.class); 
  }
  
  public static class Random extends ModelInfluencer {
    ModelInstancePool pool = new ModelInstancePool();
    
    public Random() {}
    
    public Random(Random param1Random) { super(param1Random); }
    
    public Random(Model... param1VarArgs) { super(param1VarArgs); }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      for (int i = param1Int1; i < param1Int2 + param1Int1; i++)
        (ModelInstance[])this.modelChannel.data[i] = (ModelInstance)this.pool.obtain(); 
    }
    
    public Random copy() { return new Random(this); }
    
    public void init() { this.pool.clear(); }
    
    public void killParticles(int param1Int1, int param1Int2) {
      for (int i = param1Int1; i < param1Int2 + param1Int1; i++) {
        this.pool.free((ModelInstance[])this.modelChannel.data[i]);
        (ModelInstance[])this.modelChannel.data[i] = null;
      } 
    }
    
    private class ModelInstancePool extends Pool<ModelInstance> {
      public ModelInstance newObject() { return new ModelInstance((Model)ModelInfluencer.Random.this.models.random()); }
    }
  }
  
  private class ModelInstancePool extends Pool<ModelInstance> {
    public ModelInstancePool() {}
    
    public ModelInstance newObject() { return new ModelInstance((Model)this.this$0.models.random()); }
  }
  
  public static class Single extends ModelInfluencer {
    public Single() {}
    
    public Single(Single param1Single) { super(param1Single); }
    
    public Single(Model... param1VarArgs) { super(param1VarArgs); }
    
    public Single copy() { return new Single(this); }
    
    public void init() {
      Model model = (Model)this.models.first();
      int i = this.controller.emitter.maxParticleCount;
      for (byte b = 0; b < i; b++)
        (ModelInstance[])this.modelChannel.data[b] = new ModelInstance(model); 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */