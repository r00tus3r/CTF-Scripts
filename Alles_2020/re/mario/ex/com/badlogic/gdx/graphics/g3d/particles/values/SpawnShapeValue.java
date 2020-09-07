package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class SpawnShapeValue extends ParticleValue implements ResourceData.Configurable, Json.Serializable {
  public RangedNumericValue xOffsetValue = new RangedNumericValue();
  
  public RangedNumericValue yOffsetValue = new RangedNumericValue();
  
  public RangedNumericValue zOffsetValue = new RangedNumericValue();
  
  public SpawnShapeValue() {}
  
  public SpawnShapeValue(SpawnShapeValue paramSpawnShapeValue) { this(); }
  
  public abstract SpawnShapeValue copy();
  
  public void init() {}
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {}
  
  public void load(ParticleValue paramParticleValue) {
    super.load(paramParticleValue);
    paramParticleValue = (SpawnShapeValue)paramParticleValue;
    this.xOffsetValue.load(paramParticleValue.xOffsetValue);
    this.yOffsetValue.load(paramParticleValue.yOffsetValue);
    this.zOffsetValue.load(paramParticleValue.zOffsetValue);
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.xOffsetValue = (RangedNumericValue)paramJson.readValue("xOffsetValue", RangedNumericValue.class, paramJsonValue);
    this.yOffsetValue = (RangedNumericValue)paramJson.readValue("yOffsetValue", RangedNumericValue.class, paramJsonValue);
    this.zOffsetValue = (RangedNumericValue)paramJson.readValue("zOffsetValue", RangedNumericValue.class, paramJsonValue);
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {}
  
  public final Vector3 spawn(Vector3 paramVector3, float paramFloat) {
    spawnAux(paramVector3, paramFloat);
    if (this.xOffsetValue.active)
      paramVector3.x += this.xOffsetValue.newLowValue(); 
    if (this.yOffsetValue.active)
      paramVector3.y += this.yOffsetValue.newLowValue(); 
    if (this.zOffsetValue.active)
      paramVector3.z += this.zOffsetValue.newLowValue(); 
    return paramVector3;
  }
  
  public abstract void spawnAux(Vector3 paramVector3, float paramFloat);
  
  public void start() {}
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("xOffsetValue", this.xOffsetValue);
    paramJson.writeValue("yOffsetValue", this.yOffsetValue);
    paramJson.writeValue("zOffsetValue", this.zOffsetValue);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */