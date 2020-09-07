package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public final class EllipseSpawnShapeValue extends PrimitiveSpawnShapeValue {
  PrimitiveSpawnShapeValue.SpawnSide side = PrimitiveSpawnShapeValue.SpawnSide.both;
  
  public EllipseSpawnShapeValue() {}
  
  public EllipseSpawnShapeValue(EllipseSpawnShapeValue paramEllipseSpawnShapeValue) {
    super(paramEllipseSpawnShapeValue);
    load(paramEllipseSpawnShapeValue);
  }
  
  public SpawnShapeValue copy() { return new EllipseSpawnShapeValue(this); }
  
  public PrimitiveSpawnShapeValue.SpawnSide getSide() { return this.side; }
  
  public void load(ParticleValue paramParticleValue) {
    super.load(paramParticleValue);
    this.side = ((EllipseSpawnShapeValue)paramParticleValue).side;
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.side = (PrimitiveSpawnShapeValue.SpawnSide)paramJson.readValue("side", PrimitiveSpawnShapeValue.SpawnSide.class, paramJsonValue);
  }
  
  public void setSide(PrimitiveSpawnShapeValue.SpawnSide paramSpawnSide) { this.side = paramSpawnSide; }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    float f1 = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(paramFloat);
    float f2 = this.spawnHeight + this.spawnHeightDiff * this.spawnHeightValue.getScale(paramFloat);
    float f3 = this.spawnDepth + this.spawnDepthDiff * this.spawnDepthValue.getScale(paramFloat);
    if (this.side == PrimitiveSpawnShapeValue.SpawnSide.top) {
      paramFloat = 3.1415927F;
    } else if (this.side == PrimitiveSpawnShapeValue.SpawnSide.bottom) {
      paramFloat = -3.1415927F;
    } else {
      paramFloat = 6.2831855F;
    } 
    float f4 = MathUtils.random(0.0F, paramFloat);
    if (this.edges) {
      if (f1 == 0.0F) {
        paramVector3.set(0.0F, f2 / 2.0F * MathUtils.sin(f4), f3 / 2.0F * MathUtils.cos(f4));
        return;
      } 
      if (f2 == 0.0F) {
        paramVector3.set(f1 / 2.0F * MathUtils.cos(f4), 0.0F, f3 / 2.0F * MathUtils.sin(f4));
        return;
      } 
      if (f3 == 0.0F) {
        paramVector3.set(f1 / 2.0F * MathUtils.cos(f4), f2 / 2.0F * MathUtils.sin(f4), 0.0F);
        return;
      } 
      f1 /= 2.0F;
      f2 /= 2.0F;
      paramFloat = f3 / 2.0F;
    } else {
      f1 = MathUtils.random(f1 / 2.0F);
      f2 = MathUtils.random(f2 / 2.0F);
      paramFloat = MathUtils.random(f3 / 2.0F);
    } 
    f3 = MathUtils.random(-1.0F, 1.0F);
    float f5 = (float)Math.sqrt((1.0F - f3 * f3));
    paramVector3.set(f1 * f5 * MathUtils.cos(f4), f2 * f5 * MathUtils.sin(f4), paramFloat * f3);
  }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("side", this.side);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/EllipseSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */