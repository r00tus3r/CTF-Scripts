package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.Vector3;

public final class PointSpawnShapeValue extends PrimitiveSpawnShapeValue {
  public PointSpawnShapeValue() {}
  
  public PointSpawnShapeValue(PointSpawnShapeValue paramPointSpawnShapeValue) {
    super(paramPointSpawnShapeValue);
    load(paramPointSpawnShapeValue);
  }
  
  public SpawnShapeValue copy() { return new PointSpawnShapeValue(this); }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    paramVector3.x = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(paramFloat);
    paramVector3.y = this.spawnHeight + this.spawnHeightDiff * this.spawnHeightValue.getScale(paramFloat);
    paramVector3.z = this.spawnDepth + this.spawnDepthDiff * this.spawnDepthValue.getScale(paramFloat);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/PointSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */