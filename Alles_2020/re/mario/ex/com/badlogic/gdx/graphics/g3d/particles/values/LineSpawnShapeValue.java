package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class LineSpawnShapeValue extends PrimitiveSpawnShapeValue {
  public LineSpawnShapeValue() {}
  
  public LineSpawnShapeValue(LineSpawnShapeValue paramLineSpawnShapeValue) {
    super(paramLineSpawnShapeValue);
    load(paramLineSpawnShapeValue);
  }
  
  public SpawnShapeValue copy() { return new LineSpawnShapeValue(this); }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    float f1 = this.spawnWidth;
    float f2 = this.spawnWidthDiff;
    float f3 = this.spawnWidthValue.getScale(paramFloat);
    float f4 = this.spawnHeight;
    float f5 = this.spawnHeightDiff;
    float f6 = this.spawnHeightValue.getScale(paramFloat);
    float f7 = this.spawnDepth;
    float f8 = this.spawnDepthDiff;
    paramFloat = this.spawnDepthValue.getScale(paramFloat);
    float f9 = MathUtils.random();
    paramVector3.x = (f1 + f2 * f3) * f9;
    paramVector3.y = (f4 + f5 * f6) * f9;
    paramVector3.z = f9 * (f7 + f8 * paramFloat);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/LineSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */