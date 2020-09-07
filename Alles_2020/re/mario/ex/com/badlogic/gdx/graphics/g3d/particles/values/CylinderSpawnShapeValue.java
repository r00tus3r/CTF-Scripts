package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class CylinderSpawnShapeValue extends PrimitiveSpawnShapeValue {
  public CylinderSpawnShapeValue() {}
  
  public CylinderSpawnShapeValue(CylinderSpawnShapeValue paramCylinderSpawnShapeValue) {
    super(paramCylinderSpawnShapeValue);
    load(paramCylinderSpawnShapeValue);
  }
  
  public SpawnShapeValue copy() { return new CylinderSpawnShapeValue(this); }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    boolean bool2;
    float f1 = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(paramFloat);
    float f2 = this.spawnHeight + this.spawnHeightDiff * this.spawnHeightValue.getScale(paramFloat);
    paramFloat = this.spawnDepth + this.spawnDepthDiff * this.spawnDepthValue.getScale(paramFloat);
    float f3 = f2 / 2.0F;
    float f4 = MathUtils.random(f2);
    if (this.edges) {
      f1 /= 2.0F;
    } else {
      f1 = MathUtils.random(f1) / 2.0F;
      paramFloat = MathUtils.random(paramFloat);
    } 
    float f5 = paramFloat / 2.0F;
    boolean bool1 = false;
    f2 = 0.0F;
    if (f1 == 0.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    if (f5 == 0.0F)
      bool1 = true; 
    if (!bool2 && !bool1) {
      paramFloat = MathUtils.random(360.0F);
    } else if (bool2) {
      if (MathUtils.random(1) == 0) {
        paramFloat = -90.0F;
      } else {
        paramFloat = 90.0F;
      } 
    } else {
      paramFloat = f2;
      if (bool1)
        if (MathUtils.random(1) == 0) {
          paramFloat = f2;
        } else {
          paramFloat = 180.0F;
        }  
    } 
    paramVector3.set(f1 * MathUtils.cosDeg(paramFloat), f4 - f3, f5 * MathUtils.sinDeg(paramFloat));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/CylinderSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */