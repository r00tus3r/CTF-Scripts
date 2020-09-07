package com.badlogic.gdx.graphics.g3d.model.data;

import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;

public class ModelNode {
  public ModelNode[] children;
  
  public String id;
  
  public String meshId;
  
  public ModelNodePart[] parts;
  
  public Quaternion rotation;
  
  public Vector3 scale;
  
  public Vector3 translation;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/data/ModelNode.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */