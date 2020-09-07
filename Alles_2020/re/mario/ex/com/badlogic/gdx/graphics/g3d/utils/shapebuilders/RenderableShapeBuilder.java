package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.RenderableProvider;
import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FlushablePool;
import java.util.Iterator;

public class RenderableShapeBuilder extends BaseShapeBuilder {
  private static final int FLOAT_BYTES = 4;
  
  private static short[] indices;
  
  private static final Array<Renderable> renderables;
  
  private static final RenderablePool renderablesPool = new RenderablePool();
  
  private static float[] vertices;
  
  static  {
    renderables = new Array();
  }
  
  public static void buildNormals(MeshPartBuilder paramMeshPartBuilder, Renderable paramRenderable, float paramFloat, Color paramColor1, Color paramColor2, Color paramColor3) {
    int i2;
    int i1;
    int m;
    int k;
    int j;
    int i;
    Mesh mesh = paramRenderable.meshPart.mesh;
    if (mesh.getVertexAttribute(true) != null) {
      i = (mesh.getVertexAttribute(1)).offset / 4;
    } else {
      i = -1;
    } 
    if (mesh.getVertexAttribute(8) != null) {
      j = (mesh.getVertexAttribute(8)).offset / 4;
    } else {
      j = -1;
    } 
    if (mesh.getVertexAttribute('') != null) {
      k = (mesh.getVertexAttribute(128)).offset / 4;
    } else {
      k = -1;
    } 
    if (mesh.getVertexAttribute('Ā') != null) {
      m = (mesh.getVertexAttribute(256)).offset / 4;
    } else {
      m = -1;
    } 
    int n = mesh.getVertexSize() / 4;
    if (mesh.getNumIndices() > 0) {
      ensureIndicesCapacity(mesh.getNumIndices());
      mesh.getIndices(paramRenderable.meshPart.offset, paramRenderable.meshPart.size, indices, 0);
      i1 = minVerticeInIndices();
      i2 = maxVerticeInIndices() - i1;
    } else {
      i1 = paramRenderable.meshPart.offset;
      i2 = paramRenderable.meshPart.size;
    } 
    int i3 = i2 * n;
    ensureVerticesCapacity(i3);
    mesh.getVertices(i1 * n, i3, vertices, 0);
    while (i1 < i2) {
      i3 = i1 * n;
      Vector3 vector3 = tmpV0;
      float[] arrayOfFloat = vertices;
      int i4 = i3 + i;
      vector3.set(arrayOfFloat[i4], arrayOfFloat[i4 + 1], arrayOfFloat[i4 + 2]);
      if (j != -1) {
        vector3 = tmpV1;
        arrayOfFloat = vertices;
        i4 = i3 + j;
        vector3.set(arrayOfFloat[i4], arrayOfFloat[i4 + 1], arrayOfFloat[i4 + 2]);
        tmpV2.set(tmpV0).add(tmpV1.scl(paramFloat));
      } 
      if (k != -1) {
        vector3 = tmpV3;
        arrayOfFloat = vertices;
        i4 = i3 + k;
        vector3.set(arrayOfFloat[i4], arrayOfFloat[i4 + 1], arrayOfFloat[i4 + 2]);
        tmpV4.set(tmpV0).add(tmpV3.scl(paramFloat));
      } 
      if (m != -1) {
        vector3 = tmpV5;
        arrayOfFloat = vertices;
        i3 += m;
        vector3.set(arrayOfFloat[i3], arrayOfFloat[i3 + 1], arrayOfFloat[i3 + 2]);
        tmpV6.set(tmpV0).add(tmpV5.scl(paramFloat));
      } 
      tmpV0.mul(paramRenderable.worldTransform);
      tmpV2.mul(paramRenderable.worldTransform);
      tmpV4.mul(paramRenderable.worldTransform);
      tmpV6.mul(paramRenderable.worldTransform);
      if (j != -1) {
        paramMeshPartBuilder.setColor(paramColor1);
        paramMeshPartBuilder.line(tmpV0, tmpV2);
      } 
      if (k != -1) {
        paramMeshPartBuilder.setColor(paramColor2);
        paramMeshPartBuilder.line(tmpV0, tmpV4);
      } 
      if (m != -1) {
        paramMeshPartBuilder.setColor(paramColor3);
        paramMeshPartBuilder.line(tmpV0, tmpV6);
      } 
      i1++;
    } 
  }
  
  public static void buildNormals(MeshPartBuilder paramMeshPartBuilder, RenderableProvider paramRenderableProvider, float paramFloat) { buildNormals(paramMeshPartBuilder, paramRenderableProvider, paramFloat, tmpColor0.set(0.0F, 0.0F, 1.0F, 1.0F), tmpColor1.set(1.0F, 0.0F, 0.0F, 1.0F), tmpColor2.set(0.0F, 1.0F, 0.0F, 1.0F)); }
  
  public static void buildNormals(MeshPartBuilder paramMeshPartBuilder, RenderableProvider paramRenderableProvider, float paramFloat, Color paramColor1, Color paramColor2, Color paramColor3) {
    paramRenderableProvider.getRenderables(renderables, renderablesPool);
    Iterator iterator = renderables.iterator();
    while (iterator.hasNext())
      buildNormals(paramMeshPartBuilder, (Renderable)iterator.next(), paramFloat, paramColor1, paramColor2, paramColor3); 
    renderablesPool.flush();
    renderables.clear();
  }
  
  private static void ensureIndicesCapacity(int paramInt) {
    short[] arrayOfShort = indices;
    if (arrayOfShort == null || arrayOfShort.length < paramInt)
      indices = new short[paramInt]; 
  }
  
  private static void ensureVerticesCapacity(int paramInt) {
    float[] arrayOfFloat = vertices;
    if (arrayOfFloat == null || arrayOfFloat.length < paramInt)
      vertices = new float[paramInt]; 
  }
  
  private static short maxVerticeInIndices() {
    short s = -32768;
    byte b = 0;
    short s1 = s;
    while (true) {
      short[] arrayOfShort = indices;
      if (b < arrayOfShort.length) {
        s = s1;
        if (arrayOfShort[b] > s1)
          s = arrayOfShort[b]; 
        b++;
        s1 = s;
        continue;
      } 
      break;
    } 
    return s1;
  }
  
  private static short minVerticeInIndices() {
    short s = Short.MAX_VALUE;
    byte b = 0;
    short s1 = s;
    while (true) {
      short[] arrayOfShort = indices;
      if (b < arrayOfShort.length) {
        s = s1;
        if (arrayOfShort[b] < s1)
          s = arrayOfShort[b]; 
        b++;
        s1 = s;
        continue;
      } 
      break;
    } 
    return s1;
  }
  
  private static class RenderablePool extends FlushablePool<Renderable> {
    protected Renderable newObject() { return new Renderable(); }
    
    public Renderable obtain() {
      Renderable renderable = (Renderable)super.obtain();
      renderable.environment = null;
      renderable.material = null;
      renderable.meshPart.set("", null, 0, 0, 0);
      renderable.shader = null;
      renderable.userData = null;
      return renderable;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/RenderableShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */