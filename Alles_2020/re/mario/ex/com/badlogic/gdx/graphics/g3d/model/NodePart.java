package com.badlogic.gdx.graphics.g3d.model;

import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.ArrayMap;

public class NodePart {
  public Matrix4[] bones;
  
  public boolean enabled = true;
  
  public ArrayMap<Node, Matrix4> invBoneBindTransforms;
  
  public Material material;
  
  public MeshPart meshPart;
  
  public NodePart() {}
  
  public NodePart(MeshPart paramMeshPart, Material paramMaterial) {
    this.meshPart = paramMeshPart;
    this.material = paramMaterial;
  }
  
  public NodePart copy() { return (new NodePart()).set(this); }
  
  protected NodePart set(NodePart paramNodePart) {
    this.meshPart = new MeshPart(paramNodePart.meshPart);
    this.material = paramNodePart.material;
    this.enabled = paramNodePart.enabled;
    ArrayMap arrayMap = paramNodePart.invBoneBindTransforms;
    if (arrayMap == null) {
      this.invBoneBindTransforms = null;
      this.bones = null;
    } else {
      ArrayMap arrayMap1 = this.invBoneBindTransforms;
      if (arrayMap1 == null) {
        this.invBoneBindTransforms = new ArrayMap(true, arrayMap.size, Node.class, Matrix4.class);
      } else {
        arrayMap1.clear();
      } 
      this.invBoneBindTransforms.putAll(paramNodePart.invBoneBindTransforms);
      Matrix4[] arrayOfMatrix4 = this.bones;
      if (arrayOfMatrix4 == null || arrayOfMatrix4.length != this.invBoneBindTransforms.size)
        this.bones = new Matrix4[this.invBoneBindTransforms.size]; 
      byte b = 0;
      while (true) {
        arrayOfMatrix4 = this.bones;
        if (b < arrayOfMatrix4.length) {
          if (arrayOfMatrix4[b] == null)
            arrayOfMatrix4[b] = new Matrix4(); 
          b++;
          continue;
        } 
        break;
      } 
    } 
    return this;
  }
  
  public Renderable setRenderable(Renderable paramRenderable) {
    paramRenderable.material = this.material;
    paramRenderable.meshPart.set(this.meshPart);
    paramRenderable.bones = this.bones;
    return paramRenderable;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/NodePart.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */