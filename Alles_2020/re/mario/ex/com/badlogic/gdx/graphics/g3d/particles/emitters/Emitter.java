package com.badlogic.gdx.graphics.g3d.particles.emitters;

import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class Emitter extends ParticleControllerComponent implements Json.Serializable {
  public int maxParticleCount = 4;
  
  public int minParticleCount;
  
  public float percent;
  
  public Emitter() {}
  
  public Emitter(Emitter paramEmitter) { set(paramEmitter); }
  
  public void end() { this.controller.particles.size = 0; }
  
  public int getMaxParticleCount() { return this.maxParticleCount; }
  
  public int getMinParticleCount() { return this.minParticleCount; }
  
  public void init() { this.controller.particles.size = 0; }
  
  public boolean isComplete() {
    boolean bool;
    if (this.percent >= 1.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    this.minParticleCount = ((Integer)paramJson.readValue("minParticleCount", int.class, paramJsonValue)).intValue();
    this.maxParticleCount = ((Integer)paramJson.readValue("maxParticleCount", int.class, paramJsonValue)).intValue();
  }
  
  public void set(Emitter paramEmitter) {
    this.minParticleCount = paramEmitter.minParticleCount;
    this.maxParticleCount = paramEmitter.maxParticleCount;
  }
  
  public void setMaxParticleCount(int paramInt) { this.maxParticleCount = paramInt; }
  
  public void setMinParticleCount(int paramInt) { this.minParticleCount = paramInt; }
  
  public void setParticleCount(int paramInt1, int paramInt2) {
    setMinParticleCount(paramInt1);
    setMaxParticleCount(paramInt2);
  }
  
  public void write(Json paramJson) {
    paramJson.writeValue("minParticleCount", Integer.valueOf(this.minParticleCount));
    paramJson.writeValue("maxParticleCount", Integer.valueOf(this.maxParticleCount));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/emitters/Emitter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */