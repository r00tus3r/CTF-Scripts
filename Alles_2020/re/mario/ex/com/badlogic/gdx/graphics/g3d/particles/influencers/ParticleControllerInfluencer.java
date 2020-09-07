package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.ParticleEffect;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public abstract class ParticleControllerInfluencer extends Influencer {
  ParallelArray.ObjectChannel<ParticleController> particleControllerChannel;
  
  public Array<ParticleController> templates = new Array(true, true, ParticleController.class);
  
  public ParticleControllerInfluencer() {}
  
  public ParticleControllerInfluencer(ParticleControllerInfluencer paramParticleControllerInfluencer) { this((ParticleController[])paramParticleControllerInfluencer.templates.items); }
  
  public ParticleControllerInfluencer(ParticleController... paramVarArgs) {}
  
  public void allocateChannels() { this.particleControllerChannel = (ParallelArray.ObjectChannel)this.controller.particles.addChannel(ParticleChannels.ParticleController); }
  
  public void dispose() {
    if (this.controller != null)
      for (byte b = 0; b < this.controller.particles.size; b++) {
        ParticleController particleController = (ParticleController[])this.particleControllerChannel.data[b];
        if (particleController != null) {
          particleController.dispose();
          (ParticleController[])this.particleControllerChannel.data[b] = null;
        } 
      }  
  }
  
  public void end() {
    for (byte b = 0; b < this.controller.particles.size; b++)
      (ParticleController[])this.particleControllerChannel.data[b].end(); 
  }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.getSaveData();
    Iterator iterator = ((Array)saveData.load("indices")).iterator();
    while (true) {
      AssetDescriptor assetDescriptor = saveData.loadAsset();
      if (assetDescriptor != null) {
        ParticleEffect particleEffect = (ParticleEffect)paramAssetManager.get(assetDescriptor);
        if (particleEffect != null) {
          Array array = particleEffect.getControllers();
          IntArray intArray = (IntArray)iterator.next();
          byte b = 0;
          int i = intArray.size;
          while (b < i) {
            this.templates.add(array.get(intArray.get(b)));
            b++;
          } 
          continue;
        } 
        throw new RuntimeException("Template is null");
      } 
      break;
    } 
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.createSaveData();
    Array array1 = paramAssetManager.getAll(ParticleEffect.class, new Array());
    Array array2 = new Array(this.templates);
    Array array3 = new Array();
    for (byte b = 0; b < array1.size && array2.size > 0; b++) {
      IntArray intArray;
      ParticleEffect particleEffect = (ParticleEffect)array1.get(b);
      Array array = particleEffect.getControllers();
      Iterator iterator = array2.iterator();
      paramResourceData = null;
      while (iterator.hasNext()) {
        int i = array.indexOf((ParticleController)iterator.next(), true);
        if (i > -1) {
          IntArray intArray1 = paramResourceData;
          if (paramResourceData == null)
            intArray1 = new IntArray(); 
          iterator.remove();
          intArray1.add(i);
          intArray = intArray1;
        } 
      } 
      if (intArray != null) {
        saveData.saveAsset(paramAssetManager.getAssetFileName(particleEffect), ParticleEffect.class);
        array3.add(intArray);
      } 
    } 
    saveData.save("indices", array3);
  }
  
  public static class Random extends ParticleControllerInfluencer {
    ParticleControllerPool pool = new ParticleControllerPool();
    
    public Random() {}
    
    public Random(Random param1Random) { super(param1Random); }
    
    public Random(ParticleController... param1VarArgs) { super(param1VarArgs); }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      for (int i = param1Int1; i < param1Int2 + param1Int1; i++) {
        ParticleController particleController = (ParticleController)this.pool.obtain();
        particleController.start();
        (ParticleController[])this.particleControllerChannel.data[i] = particleController;
      } 
    }
    
    public Random copy() { return new Random(this); }
    
    public void dispose() {
      this.pool.clear();
      super.dispose();
    }
    
    public void init() {
      this.pool.clear();
      for (byte b = 0; b < this.controller.emitter.maxParticleCount; b++) {
        ParticleControllerPool particleControllerPool = this.pool;
        particleControllerPool.free(particleControllerPool.newObject());
      } 
    }
    
    public void killParticles(int param1Int1, int param1Int2) {
      for (int i = param1Int1; i < param1Int2 + param1Int1; i++) {
        ParticleController particleController = (ParticleController[])this.particleControllerChannel.data[i];
        particleController.end();
        this.pool.free(particleController);
        (ParticleController[])this.particleControllerChannel.data[i] = null;
      } 
    }
    
    private class ParticleControllerPool extends Pool<ParticleController> {
      public void clear() {
        int i = ParticleControllerInfluencer.Random.this.pool.getFree();
        for (byte b = 0; b < i; b++)
          ((ParticleController)ParticleControllerInfluencer.Random.this.pool.obtain()).dispose(); 
        super.clear();
      }
      
      public ParticleController newObject() {
        ParticleController particleController = ((ParticleController)ParticleControllerInfluencer.Random.this.templates.random()).copy();
        particleController.init();
        return particleController;
      }
    }
  }
  
  private class ParticleControllerPool extends Pool<ParticleController> {
    public ParticleControllerPool() {}
    
    public void clear() {
      int i = this.this$0.pool.getFree();
      for (byte b = 0; b < i; b++)
        ((ParticleController)this.this$0.pool.obtain()).dispose(); 
      super.clear();
    }
    
    public ParticleController newObject() {
      ParticleController particleController = ((ParticleController)this.this$0.templates.random()).copy();
      particleController.init();
      return particleController;
    }
  }
  
  public static class Single extends ParticleControllerInfluencer {
    public Single() {}
    
    public Single(Single param1Single) { super(param1Single); }
    
    public Single(ParticleController... param1VarArgs) { super(param1VarArgs); }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      for (int i = param1Int1; i < param1Int2 + param1Int1; i++)
        (ParticleController[])this.particleControllerChannel.data[i].start(); 
    }
    
    public Single copy() { return new Single(this); }
    
    public void init() {
      ParticleController particleController = (ParticleController)this.templates.first();
      int i = this.controller.particles.capacity;
      for (byte b = 0; b < i; b++) {
        ParticleController particleController1 = particleController.copy();
        particleController1.init();
        (ParticleController[])this.particleControllerChannel.data[b] = particleController1;
      } 
    }
    
    public void killParticles(int param1Int1, int param1Int2) {
      for (int i = param1Int1; i < param1Int2 + param1Int1; i++)
        (ParticleController[])this.particleControllerChannel.data[i].end(); 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */