package com.badlogic.gdx.graphics.g3d.model.data;

import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;

public class ModelNodeAnimation {
  public String nodeId;
  
  public Array<ModelNodeKeyframe<Quaternion>> rotation;
  
  public Array<ModelNodeKeyframe<Vector3>> scaling;
  
  public Array<ModelNodeKeyframe<Vector3>> translation;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */