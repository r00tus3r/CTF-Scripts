package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class PrimitiveSpawnShapeValue extends SpawnShapeValue {
  protected static final Vector3 TMP_V1 = new Vector3();
  
  boolean edges = false;
  
  protected float spawnDepth;
  
  protected float spawnDepthDiff;
  
  public ScaledNumericValue spawnDepthValue = new ScaledNumericValue();
  
  protected float spawnHeight;
  
  protected float spawnHeightDiff;
  
  public ScaledNumericValue spawnHeightValue = new ScaledNumericValue();
  
  protected float spawnWidth;
  
  protected float spawnWidthDiff;
  
  public ScaledNumericValue spawnWidthValue = new ScaledNumericValue();
  
  public PrimitiveSpawnShapeValue() {}
  
  public PrimitiveSpawnShapeValue(PrimitiveSpawnShapeValue paramPrimitiveSpawnShapeValue) { super(paramPrimitiveSpawnShapeValue); }
  
  public ScaledNumericValue getSpawnDepth() { return this.spawnDepthValue; }
  
  public ScaledNumericValue getSpawnHeight() { return this.spawnHeightValue; }
  
  public ScaledNumericValue getSpawnWidth() { return this.spawnWidthValue; }
  
  public boolean isEdges() { return this.edges; }
  
  public void load(ParticleValue paramParticleValue) {
    super.load(paramParticleValue);
    paramParticleValue = (PrimitiveSpawnShapeValue)paramParticleValue;
    this.edges = paramParticleValue.edges;
    this.spawnWidthValue.load(paramParticleValue.spawnWidthValue);
    this.spawnHeightValue.load(paramParticleValue.spawnHeightValue);
    this.spawnDepthValue.load(paramParticleValue.spawnDepthValue);
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.spawnWidthValue = (ScaledNumericValue)paramJson.readValue("spawnWidthValue", ScaledNumericValue.class, paramJsonValue);
    this.spawnHeightValue = (ScaledNumericValue)paramJson.readValue("spawnHeightValue", ScaledNumericValue.class, paramJsonValue);
    this.spawnDepthValue = (ScaledNumericValue)paramJson.readValue("spawnDepthValue", ScaledNumericValue.class, paramJsonValue);
    this.edges = ((Boolean)paramJson.readValue("edges", boolean.class, paramJsonValue)).booleanValue();
  }
  
  public void setActive(boolean paramBoolean) {
    super.setActive(paramBoolean);
    this.spawnWidthValue.setActive(true);
    this.spawnHeightValue.setActive(true);
    this.spawnDepthValue.setActive(true);
  }
  
  public void setDimensions(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.spawnWidthValue.setHigh(paramFloat1);
    this.spawnHeightValue.setHigh(paramFloat2);
    this.spawnDepthValue.setHigh(paramFloat3);
  }
  
  public void setEdges(boolean paramBoolean) { this.edges = paramBoolean; }
  
  public void start() {
    this.spawnWidth = this.spawnWidthValue.newLowValue();
    this.spawnWidthDiff = this.spawnWidthValue.newHighValue();
    if (!this.spawnWidthValue.isRelative())
      this.spawnWidthDiff -= this.spawnWidth; 
    this.spawnHeight = this.spawnHeightValue.newLowValue();
    this.spawnHeightDiff = this.spawnHeightValue.newHighValue();
    if (!this.spawnHeightValue.isRelative())
      this.spawnHeightDiff -= this.spawnHeight; 
    this.spawnDepth = this.spawnDepthValue.newLowValue();
    this.spawnDepthDiff = this.spawnDepthValue.newHighValue();
    if (!this.spawnDepthValue.isRelative())
      this.spawnDepthDiff -= this.spawnDepth; 
  }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("spawnWidthValue", this.spawnWidthValue);
    paramJson.writeValue("spawnHeightValue", this.spawnHeightValue);
    paramJson.writeValue("spawnDepthValue", this.spawnDepthValue);
    paramJson.writeValue("edges", Boolean.valueOf(this.edges));
  }
  
  public enum SpawnSide {
    both, bottom, top;
    
    static  {
      bottom = new SpawnSide("bottom", 2);
      $VALUES = new SpawnSide[] { both, top, bottom };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/PrimitiveSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */