package com.badlogic.gdx.graphics.g3d.model.data;

import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.ArrayMap;

public class ModelNodePart {
  public ArrayMap<String, Matrix4> bones;
  
  public String materialId;
  
  public String meshPartId;
  
  public int[][] uvMapping;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/data/ModelNodePart.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */