package com.badlogic.gdx.graphics.g3d.model.data;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.utils.Array;

public class ModelMaterial {
  public Color ambient;
  
  public Color diffuse;
  
  public Color emissive;
  
  public String id;
  
  public float opacity = 1.0F;
  
  public Color reflection;
  
  public float shininess;
  
  public Color specular;
  
  public Array<ModelTexture> textures;
  
  public MaterialType type;
  
  public enum MaterialType {
    Lambert, Phong;
    
    static  {
      $VALUES = new MaterialType[] { Lambert, Phong };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/data/ModelMaterial.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */