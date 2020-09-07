package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class RangedNumericValue extends ParticleValue {
  private float lowMax;
  
  private float lowMin;
  
  public float getLowMax() { return this.lowMax; }
  
  public float getLowMin() { return this.lowMin; }
  
  public void load(RangedNumericValue paramRangedNumericValue) {
    load(paramRangedNumericValue);
    this.lowMax = paramRangedNumericValue.lowMax;
    this.lowMin = paramRangedNumericValue.lowMin;
  }
  
  public float newLowValue() {
    float f = this.lowMin;
    return f + (this.lowMax - f) * MathUtils.random();
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.lowMin = ((Float)paramJson.readValue("lowMin", float.class, paramJsonValue)).floatValue();
    this.lowMax = ((Float)paramJson.readValue("lowMax", float.class, paramJsonValue)).floatValue();
  }
  
  public void setLow(float paramFloat) {
    this.lowMin = paramFloat;
    this.lowMax = paramFloat;
  }
  
  public void setLow(float paramFloat1, float paramFloat2) {
    this.lowMin = paramFloat1;
    this.lowMax = paramFloat2;
  }
  
  public void setLowMax(float paramFloat) { this.lowMax = paramFloat; }
  
  public void setLowMin(float paramFloat) { this.lowMin = paramFloat; }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("lowMin", Float.valueOf(this.lowMin));
    paramJson.writeValue("lowMax", Float.valueOf(this.lowMax));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */