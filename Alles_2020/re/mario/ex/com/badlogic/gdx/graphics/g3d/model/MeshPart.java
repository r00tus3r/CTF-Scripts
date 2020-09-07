package com.badlogic.gdx.graphics.g3d.model;

import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;

public class MeshPart {
  private static final BoundingBox bounds = new BoundingBox();
  
  public final Vector3 center = new Vector3();
  
  public final Vector3 halfExtents = new Vector3();
  
  public String id;
  
  public Mesh mesh;
  
  public int offset;
  
  public int primitiveType;
  
  public float radius = -1.0F;
  
  public int size;
  
  public MeshPart() {}
  
  public MeshPart(MeshPart paramMeshPart) { set(paramMeshPart); }
  
  public MeshPart(String paramString, Mesh paramMesh, int paramInt1, int paramInt2, int paramInt3) { set(paramString, paramMesh, paramInt1, paramInt2, paramInt3); }
  
  public boolean equals(MeshPart paramMeshPart) { return (paramMeshPart == this || (paramMeshPart != null && paramMeshPart.mesh == this.mesh && paramMeshPart.primitiveType == this.primitiveType && paramMeshPart.offset == this.offset && paramMeshPart.size == this.size)); }
  
  public boolean equals(Object paramObject) { return (paramObject == null) ? false : ((paramObject == this) ? true : (!(paramObject instanceof MeshPart) ? false : equals((MeshPart)paramObject))); }
  
  public void render(ShaderProgram paramShaderProgram) { this.mesh.render(paramShaderProgram, this.primitiveType, this.offset, this.size); }
  
  public void render(ShaderProgram paramShaderProgram, boolean paramBoolean) { this.mesh.render(paramShaderProgram, this.primitiveType, this.offset, this.size, paramBoolean); }
  
  public MeshPart set(MeshPart paramMeshPart) {
    this.id = paramMeshPart.id;
    this.mesh = paramMeshPart.mesh;
    this.offset = paramMeshPart.offset;
    this.size = paramMeshPart.size;
    this.primitiveType = paramMeshPart.primitiveType;
    this.center.set(paramMeshPart.center);
    this.halfExtents.set(paramMeshPart.halfExtents);
    this.radius = paramMeshPart.radius;
    return this;
  }
  
  public MeshPart set(String paramString, Mesh paramMesh, int paramInt1, int paramInt2, int paramInt3) {
    this.id = paramString;
    this.mesh = paramMesh;
    this.offset = paramInt1;
    this.size = paramInt2;
    this.primitiveType = paramInt3;
    this.center.set(0.0F, 0.0F, 0.0F);
    this.halfExtents.set(0.0F, 0.0F, 0.0F);
    this.radius = -1.0F;
    return this;
  }
  
  public void update() {
    this.mesh.calculateBoundingBox(bounds, this.offset, this.size);
    bounds.getCenter(this.center);
    bounds.getDimensions(this.halfExtents).scl(0.5F);
    this.radius = this.halfExtents.len();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/MeshPart.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */