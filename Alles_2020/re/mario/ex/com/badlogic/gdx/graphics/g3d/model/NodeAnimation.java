package com.badlogic.gdx.graphics.g3d.model;

import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;

public class NodeAnimation {
  public Node node;
  
  public Array<NodeKeyframe<Quaternion>> rotation = null;
  
  public Array<NodeKeyframe<Vector3>> scaling = null;
  
  public Array<NodeKeyframe<Vector3>> translation = null;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/NodeAnimation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */