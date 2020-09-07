package com.badlogic.gdx.graphics.g3d.model.data;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ModelData {
  public final Array<ModelAnimation> animations = new Array();
  
  public String id;
  
  public final Array<ModelMaterial> materials = new Array();
  
  public final Array<ModelMesh> meshes = new Array();
  
  public final Array<ModelNode> nodes = new Array();
  
  public final short[] version = new short[2];
  
  public void addMesh(ModelMesh paramModelMesh) {
    StringBuilder stringBuilder;
    for (ModelMesh modelMesh : this.meshes) {
      if (!modelMesh.id.equals(paramModelMesh.id))
        continue; 
      stringBuilder = new StringBuilder();
      stringBuilder.append("Mesh with id '");
      stringBuilder.append(modelMesh.id);
      stringBuilder.append("' already in model");
      throw new GdxRuntimeException(stringBuilder.toString());
    } 
    this.meshes.add(stringBuilder);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/data/ModelData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */