package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.RenderableProvider;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.Pool;

public class ShapeCache implements Disposable, RenderableProvider {
  private final MeshBuilder builder;
  
  private boolean building;
  
  private final String id = "id";
  
  private final Mesh mesh;
  
  private final Renderable renderable = new Renderable();
  
  public ShapeCache() { this(5000, 5000, new VertexAttributes(new VertexAttribute[] { new VertexAttribute(true, 3, "a_position"), new VertexAttribute(4, 4, "a_color") }), 1); }
  
  public ShapeCache(int paramInt1, int paramInt2, VertexAttributes paramVertexAttributes, int paramInt3) {
    this.mesh = new Mesh(false, paramInt1, paramInt2, paramVertexAttributes);
    this.builder = new MeshBuilder();
    this.renderable.meshPart.mesh = this.mesh;
    this.renderable.meshPart.primitiveType = paramInt3;
    this.renderable.material = new Material();
  }
  
  public MeshPartBuilder begin() { return begin(1); }
  
  public MeshPartBuilder begin(int paramInt) {
    if (!this.building) {
      this.building = true;
      this.builder.begin(this.mesh.getVertexAttributes());
      this.builder.part("id", paramInt, this.renderable.meshPart);
      return this.builder;
    } 
    throw new GdxRuntimeException("Call end() after calling begin()");
  }
  
  public void dispose() { this.mesh.dispose(); }
  
  public void end() {
    if (this.building) {
      this.building = false;
      this.builder.end(this.mesh);
      return;
    } 
    throw new GdxRuntimeException("Call begin() prior to calling end()");
  }
  
  public Material getMaterial() { return this.renderable.material; }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) { paramArray.add(this.renderable); }
  
  public Matrix4 getWorldTransform() { return this.renderable.worldTransform; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/ShapeCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */