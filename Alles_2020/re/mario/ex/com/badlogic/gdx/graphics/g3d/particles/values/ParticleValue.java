package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class ParticleValue implements Json.Serializable {
  public boolean active;
  
  public ParticleValue() {}
  
  public ParticleValue(ParticleValue paramParticleValue) { this.active = paramParticleValue.active; }
  
  public boolean isActive() { return this.active; }
  
  public void load(ParticleValue paramParticleValue) { this.active = paramParticleValue.active; }
  
  public void read(Json paramJson, JsonValue paramJsonValue) { this.active = ((Boolean)paramJson.readValue("active", Boolean.class, paramJsonValue)).booleanValue(); }
  
  public void setActive(boolean paramBoolean) { this.active = paramBoolean; }
  
  public void write(Json paramJson) { paramJson.writeValue("active", Boolean.valueOf(this.active)); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/ParticleValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */