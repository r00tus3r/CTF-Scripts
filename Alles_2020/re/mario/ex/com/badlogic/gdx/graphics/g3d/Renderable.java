package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.math.Matrix4;

public class Renderable {
  public Matrix4[] bones;
  
  public Environment environment;
  
  public Material material;
  
  public final MeshPart meshPart = new MeshPart();
  
  public Shader shader;
  
  public Object userData;
  
  public final Matrix4 worldTransform = new Matrix4();
  
  public Renderable set(Renderable paramRenderable) {
    this.worldTransform.set(paramRenderable.worldTransform);
    this.material = paramRenderable.material;
    this.meshPart.set(paramRenderable.meshPart);
    this.bones = paramRenderable.bones;
    this.environment = paramRenderable.environment;
    this.shader = paramRenderable.shader;
    this.userData = paramRenderable.userData;
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Renderable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */