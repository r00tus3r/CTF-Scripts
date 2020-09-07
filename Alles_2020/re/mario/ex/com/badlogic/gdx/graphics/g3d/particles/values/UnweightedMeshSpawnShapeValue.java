package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class UnweightedMeshSpawnShapeValue extends MeshSpawnShapeValue {
  private short[] indices;
  
  private int positionOffset;
  
  private int triangleCount;
  
  private int vertexCount;
  
  private int vertexSize;
  
  private float[] vertices;
  
  public UnweightedMeshSpawnShapeValue() {}
  
  public UnweightedMeshSpawnShapeValue(UnweightedMeshSpawnShapeValue paramUnweightedMeshSpawnShapeValue) {
    super(paramUnweightedMeshSpawnShapeValue);
    load(paramUnweightedMeshSpawnShapeValue);
  }
  
  public SpawnShapeValue copy() { return new UnweightedMeshSpawnShapeValue(this); }
  
  public void setMesh(Mesh paramMesh, Model paramModel) {
    super.setMesh(paramMesh, paramModel);
    this.vertexSize = paramMesh.getVertexSize() / 4;
    this.positionOffset = (paramMesh.getVertexAttribute(1)).offset / 4;
    int i = paramMesh.getNumIndices();
    if (i > 0) {
      this.indices = new short[i];
      paramMesh.getIndices(this.indices);
      this.triangleCount = this.indices.length / 3;
    } else {
      this.indices = null;
    } 
    this.vertexCount = paramMesh.getNumVertices();
    this.vertices = new float[this.vertexCount * this.vertexSize];
    paramMesh.getVertices(this.vertices);
  }
  
  public void spawnAux(Vector3 paramVector3, float paramFloat) {
    if (this.indices == null) {
      int i = MathUtils.random(this.vertexCount - 3);
      int j = this.vertexSize;
      i = i * j + this.positionOffset;
      int k = i + j;
      j += k;
      float[] arrayOfFloat = this.vertices;
      MeshSpawnShapeValue.Triangle.pick(arrayOfFloat[i], arrayOfFloat[i + 1], arrayOfFloat[i + 2], arrayOfFloat[k], arrayOfFloat[k + 1], arrayOfFloat[k + 2], arrayOfFloat[j], arrayOfFloat[j + 1], arrayOfFloat[j + 2], paramVector3);
    } else {
      int k = MathUtils.random(this.triangleCount - 1) * 3;
      short[] arrayOfShort = this.indices;
      short s1 = arrayOfShort[k];
      int j = this.vertexSize;
      int i = this.positionOffset;
      s1 = s1 * j + i;
      short s2 = arrayOfShort[k + 1] * j + i;
      i = arrayOfShort[k + 2] * j + i;
      float[] arrayOfFloat = this.vertices;
      MeshSpawnShapeValue.Triangle.pick(arrayOfFloat[s1], arrayOfFloat[s1 + 1], arrayOfFloat[s1 + 2], arrayOfFloat[s2], arrayOfFloat[s2 + 1], arrayOfFloat[s2 + 2], arrayOfFloat[i], arrayOfFloat[i + 1], arrayOfFloat[i + 2], paramVector3);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */