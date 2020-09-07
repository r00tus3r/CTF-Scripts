package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;

public abstract class MeshSpawnShapeValue extends SpawnShapeValue {
  protected Mesh mesh;
  
  protected Model model;
  
  public MeshSpawnShapeValue() {}
  
  public MeshSpawnShapeValue(MeshSpawnShapeValue paramMeshSpawnShapeValue) { super(paramMeshSpawnShapeValue); }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.getSaveData();
    AssetDescriptor assetDescriptor = saveData.loadAsset();
    if (assetDescriptor != null) {
      Model model1 = (Model)paramAssetManager.get(assetDescriptor);
      setMesh((Mesh)model1.meshes.get(((Integer)saveData.load("index")).intValue()), model1);
    } 
  }
  
  public void load(ParticleValue paramParticleValue) {
    super.load(paramParticleValue);
    paramParticleValue = (MeshSpawnShapeValue)paramParticleValue;
    setMesh(paramParticleValue.mesh, paramParticleValue.model);
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {
    if (this.model != null) {
      ResourceData.SaveData saveData = paramResourceData.createSaveData();
      saveData.saveAsset(paramAssetManager.getAssetFileName(this.model), Model.class);
      saveData.save("index", Integer.valueOf(this.model.meshes.indexOf(this.mesh, true)));
    } 
  }
  
  public void setMesh(Mesh paramMesh) { setMesh(paramMesh, null); }
  
  public void setMesh(Mesh paramMesh, Model paramModel) {
    if (paramMesh.getVertexAttribute(true) != null) {
      this.model = paramModel;
      this.mesh = paramMesh;
      return;
    } 
    throw new GdxRuntimeException("Mesh vertices must have Usage.Position");
  }
  
  public static class Triangle {
    float x1;
    
    float x2;
    
    float x3;
    
    float y1;
    
    float y2;
    
    float y3;
    
    float z1;
    
    float z2;
    
    float z3;
    
    public Triangle(float param1Float1, float param1Float2, float param1Float3, float param1Float4, float param1Float5, float param1Float6, float param1Float7, float param1Float8, float param1Float9) {
      this.x1 = param1Float1;
      this.y1 = param1Float2;
      this.z1 = param1Float3;
      this.x2 = param1Float4;
      this.y2 = param1Float5;
      this.z2 = param1Float6;
      this.x3 = param1Float7;
      this.y3 = param1Float8;
      this.z3 = param1Float9;
    }
    
    public static Vector3 pick(float param1Float1, float param1Float2, float param1Float3, float param1Float4, float param1Float5, float param1Float6, float param1Float7, float param1Float8, float param1Float9, Vector3 param1Vector3) {
      float f1 = MathUtils.random();
      float f2 = MathUtils.random();
      return param1Vector3.set((param1Float4 - param1Float1) * f1 + param1Float1 + (param1Float7 - param1Float1) * f2, (param1Float5 - param1Float2) * f1 + param1Float2 + (param1Float8 - param1Float2) * f2, f1 * (param1Float6 - param1Float3) + param1Float3 + f2 * (param1Float9 - param1Float3));
    }
    
    public Vector3 pick(Vector3 param1Vector3) {
      float f1 = MathUtils.random();
      float f2 = MathUtils.random();
      float f3 = this.x1;
      float f4 = this.x2;
      float f5 = this.x3;
      float f6 = this.y1;
      float f7 = this.y2;
      float f8 = this.y3;
      float f9 = this.z1;
      return param1Vector3.set((f4 - f3) * f1 + f3 + (f5 - f3) * f2, (f7 - f6) * f1 + f6 + (f8 - f6) * f2, f1 * (this.z2 - f9) + f9 + f2 * (this.z3 - f9));
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */