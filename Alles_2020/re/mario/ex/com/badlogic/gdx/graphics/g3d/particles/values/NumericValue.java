package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class NumericValue extends ParticleValue {
  private float value;
  
  public float getValue() { return this.value; }
  
  public void load(NumericValue paramNumericValue) {
    load(paramNumericValue);
    this.value = paramNumericValue.value;
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.value = ((Float)paramJson.readValue("value", float.class, paramJsonValue)).floatValue();
  }
  
  public void setValue(float paramFloat) { this.value = paramFloat; }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("value", Float.valueOf(this.value));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/NumericValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */