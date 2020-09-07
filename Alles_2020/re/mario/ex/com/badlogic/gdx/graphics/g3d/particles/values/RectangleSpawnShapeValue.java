package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class RectangleSpawnShapeValue extends PrimitiveSpawnShapeValue {
  public RectangleSpawnShapeValue() {}
  
  public RectangleSpawnShapeValue(RectangleSpawnShapeValue paramRectangleSpawnShapeValue) {
    super(paramRectangleSpawnShapeValue);
    load(paramRectangleSpawnShapeValue);
  }
  
  public SpawnShapeValue copy() { return new RectangleSpawnShapeValue(this); }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    float f1 = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(paramFloat);
    float f2 = this.spawnHeight + this.spawnHeightDiff * this.spawnHeightValue.getScale(paramFloat);
    float f3 = this.spawnDepth + this.spawnDepthDiff * this.spawnDepthValue.getScale(paramFloat);
    if (this.edges) {
      float f;
      int i = MathUtils.random(-1, 1);
      if (i == -1) {
        if (MathUtils.random(1) == 0) {
          f = -f1 / 2.0F;
        } else {
          f = f1 / 2.0F;
        } 
        if (f == 0.0F) {
          if (MathUtils.random(1) == 0) {
            f1 = -f2 / 2.0F;
          } else {
            f1 = f2 / 2.0F;
          } 
          if (MathUtils.random(1) == 0) {
            paramFloat = -f3 / 2.0F;
          } else {
            paramFloat = f3 / 2.0F;
          } 
        } else {
          f1 = MathUtils.random(f2) - f2 / 2.0F;
          paramFloat = MathUtils.random(f3) - f3 / 2.0F;
        } 
        f2 = f1;
        f1 = f;
        f = f2;
      } else if (i == 0) {
        if (MathUtils.random(1) == 0) {
          paramFloat = -f3 / 2.0F;
        } else {
          paramFloat = f3 / 2.0F;
        } 
        if (paramFloat == 0.0F) {
          f = f2;
          if (MathUtils.random(1) == 0)
            f = -f2; 
          f2 = f / 2.0F;
          f = f1;
          if (MathUtils.random(1) == 0)
            f = -f1; 
          f1 = f / 2.0F;
          f = f2;
        } else {
          f = MathUtils.random(f2) - f2 / 2.0F;
          f1 = MathUtils.random(f1) - f1 / 2.0F;
        } 
      } else {
        if (MathUtils.random(1) == 0) {
          f = -f2 / 2.0F;
        } else {
          f = f2 / 2.0F;
        } 
        if (f == 0.0F) {
          paramFloat = f1;
          if (MathUtils.random(1) == 0)
            paramFloat = -f1; 
          f1 = paramFloat / 2.0F;
          if (MathUtils.random(1) == 0) {
            paramFloat = -f3 / 2.0F;
          } else {
            paramFloat = f3 / 2.0F;
          } 
        } else {
          f1 = MathUtils.random(f1) - f1 / 2.0F;
          paramFloat = MathUtils.random(f3) - f3 / 2.0F;
        } 
      } 
      paramVector3.x = f1;
      paramVector3.y = f;
      paramVector3.z = paramFloat;
    } else {
      paramVector3.x = MathUtils.random(f1) - f1 / 2.0F;
      paramVector3.y = MathUtils.random(f2) - f2 / 2.0F;
      paramVector3.z = MathUtils.random(f3) - f3 / 2.0F;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/RectangleSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */