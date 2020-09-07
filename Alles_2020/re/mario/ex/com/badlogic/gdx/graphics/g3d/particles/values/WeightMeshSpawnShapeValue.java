package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.math.CumulativeDistribution;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class WeightMeshSpawnShapeValue extends MeshSpawnShapeValue {
  private CumulativeDistribution<MeshSpawnShapeValue.Triangle> distribution = new CumulativeDistribution();
  
  public WeightMeshSpawnShapeValue() {}
  
  public WeightMeshSpawnShapeValue(WeightMeshSpawnShapeValue paramWeightMeshSpawnShapeValue) {
    super(paramWeightMeshSpawnShapeValue);
    load(paramWeightMeshSpawnShapeValue);
  }
  
  public void calculateWeights() {
    this.distribution.clear();
    VertexAttributes vertexAttributes = this.mesh.getVertexAttributes();
    int i = this.mesh.getNumIndices();
    int j = this.mesh.getNumVertices();
    short s1 = (short)(vertexAttributes.vertexSize / 4);
    short s2 = (short)((vertexAttributes.findByUsage(1)).offset / 4);
    float[] arrayOfFloat = new float[j * s1];
    this.mesh.getVertices(arrayOfFloat);
    short s3 = 0;
    short s4 = 0;
    if (i > 0) {
      short[] arrayOfShort = new short[i];
      this.mesh.getIndices(arrayOfShort);
      for (s3 = s4; s3 < i; s3 += 3) {
        s4 = arrayOfShort[s3] * s1 + s2;
        j = arrayOfShort[s3 + 1] * s1 + s2;
        short s = arrayOfShort[s3 + 2] * s1 + s2;
        float f1 = arrayOfFloat[s4];
        float f2 = arrayOfFloat[s4 + 1];
        float f3 = arrayOfFloat[s4 + 2];
        float f4 = arrayOfFloat[j];
        float f5 = arrayOfFloat[j + 1];
        float f6 = arrayOfFloat[j + 2];
        float f7 = arrayOfFloat[s];
        float f8 = arrayOfFloat[s + 1];
        float f9 = arrayOfFloat[s + 2];
        float f10 = Math.abs(((f5 - f8) * f1 + (f8 - f2) * f4 + (f2 - f5) * f7) / 2.0F);
        this.distribution.add(new MeshSpawnShapeValue.Triangle(f1, f2, f3, f4, f5, f6, f7, f8, f9), f10);
      } 
    } else {
      while (s3 < j) {
        s4 = s3 + s2;
        short s = s4 + s1;
        i = s + s1;
        float f4 = arrayOfFloat[s4];
        float f9 = arrayOfFloat[s4 + 1];
        float f2 = arrayOfFloat[s4 + 2];
        float f6 = arrayOfFloat[s];
        float f1 = arrayOfFloat[s + 1];
        float f7 = arrayOfFloat[s + 2];
        float f5 = arrayOfFloat[i];
        float f8 = arrayOfFloat[i + 1];
        float f10 = arrayOfFloat[i + 2];
        float f3 = Math.abs(((f1 - f8) * f4 + (f8 - f9) * f6 + (f9 - f1) * f5) / 2.0F);
        this.distribution.add(new MeshSpawnShapeValue.Triangle(f4, f9, f2, f6, f1, f7, f5, f8, f10), f3);
        s3 += s1;
      } 
    } 
    this.distribution.generateNormalized();
  }
  
  public SpawnShapeValue copy() { return new WeightMeshSpawnShapeValue(this); }
  
  public void init() { calculateWeights(); }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    MeshSpawnShapeValue.Triangle triangle = (MeshSpawnShapeValue.Triangle)this.distribution.value();
    float f = MathUtils.random();
    paramFloat = MathUtils.random();
    paramVector3.set(triangle.x1 + (triangle.x2 - triangle.x1) * f + (triangle.x3 - triangle.x1) * paramFloat, triangle.y1 + (triangle.y2 - triangle.y1) * f + (triangle.y3 - triangle.y1) * paramFloat, triangle.z1 + f * (triangle.z2 - triangle.z1) + paramFloat * (triangle.z3 - triangle.z1));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */