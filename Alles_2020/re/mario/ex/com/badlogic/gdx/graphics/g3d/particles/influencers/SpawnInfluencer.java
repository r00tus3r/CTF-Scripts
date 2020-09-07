package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.values.PointSpawnShapeValue;
import com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class SpawnInfluencer extends Influencer {
  ParallelArray.FloatChannel positionChannel;
  
  public SpawnShapeValue spawnShapeValue = new PointSpawnShapeValue();
  
  public SpawnInfluencer() {}
  
  public SpawnInfluencer(SpawnInfluencer paramSpawnInfluencer) {}
  
  public SpawnInfluencer(SpawnShapeValue paramSpawnShapeValue) {}
  
  public void activateParticles(int paramInt1, int paramInt2) {
    int i = paramInt1 * this.positionChannel.strideSize;
    int j = this.positionChannel.strideSize;
    for (paramInt1 = i; paramInt1 < paramInt2 * j + i; paramInt1 += this.positionChannel.strideSize) {
      this.spawnShapeValue.spawn(TMP_V1, this.controller.emitter.percent);
      TMP_V1.mul(this.controller.transform);
      this.positionChannel.data[paramInt1 + 0] = TMP_V1.x;
      this.positionChannel.data[paramInt1 + 1] = TMP_V1.y;
      this.positionChannel.data[paramInt1 + 2] = TMP_V1.z;
    } 
  }
  
  public void allocateChannels() { this.positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position); }
  
  public SpawnInfluencer copy() { return new SpawnInfluencer(this); }
  
  public void init() { this.spawnShapeValue.init(); }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) { this.spawnShapeValue.load(paramAssetManager, paramResourceData); }
  
  public void read(Json paramJson, JsonValue paramJsonValue) { this.spawnShapeValue = (SpawnShapeValue)paramJson.readValue("spawnShape", SpawnShapeValue.class, paramJsonValue); }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) { this.spawnShapeValue.save(paramAssetManager, paramResourceData); }
  
  public void start() { this.spawnShapeValue.start(); }
  
  public void write(Json paramJson) { paramJson.writeValue("spawnShape", this.spawnShapeValue, SpawnShapeValue.class); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */