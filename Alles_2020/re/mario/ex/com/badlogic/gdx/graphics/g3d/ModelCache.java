package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.utils.MeshBuilder;
import com.badlogic.gdx.graphics.g3d.utils.RenderableSorter;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.FlushablePool;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.Pool;
import java.util.Comparator;
import java.util.Iterator;

public class ModelCache implements Disposable, RenderableProvider {
  private boolean building;
  
  private Camera camera;
  
  private Array<Renderable> items = new Array();
  
  private MeshBuilder meshBuilder;
  
  private FlushablePool<MeshPart> meshPartPool = new FlushablePool<MeshPart>() {
      protected MeshPart newObject() { return new MeshPart(); }
    };
  
  private MeshPool meshPool;
  
  private Array<Renderable> renderables = new Array();
  
  private FlushablePool<Renderable> renderablesPool = new FlushablePool<Renderable>() {
      protected Renderable newObject() { return new Renderable(); }
    };
  
  private RenderableSorter sorter;
  
  private Array<Renderable> tmp = new Array();
  
  public ModelCache() { this(new Sorter(), new SimpleMeshPool()); }
  
  public ModelCache(RenderableSorter paramRenderableSorter, MeshPool paramMeshPool) {
    this.sorter = paramRenderableSorter;
    this.meshPool = paramMeshPool;
    this.meshBuilder = new MeshBuilder();
  }
  
  private Renderable obtainRenderable(Material paramMaterial, int paramInt) {
    Renderable renderable = (Renderable)this.renderablesPool.obtain();
    renderable.bones = null;
    renderable.environment = null;
    renderable.material = paramMaterial;
    renderable.meshPart.mesh = null;
    renderable.meshPart.offset = 0;
    renderable.meshPart.size = 0;
    renderable.meshPart.primitiveType = paramInt;
    renderable.meshPart.center.set(0.0F, 0.0F, 0.0F);
    renderable.meshPart.halfExtents.set(0.0F, 0.0F, 0.0F);
    renderable.meshPart.radius = -1.0F;
    renderable.shader = null;
    renderable.userData = null;
    renderable.worldTransform.idt();
    return renderable;
  }
  
  public void add(Renderable paramRenderable) {
    if (this.building) {
      if (paramRenderable.bones == null) {
        this.items.add(paramRenderable);
      } else {
        this.renderables.add(paramRenderable);
      } 
      return;
    } 
    throw new GdxRuntimeException("Can only add items to the ModelCache in between .begin() and .end()");
  }
  
  public void add(RenderableProvider paramRenderableProvider) {
    paramRenderableProvider.getRenderables(this.tmp, this.renderablesPool);
    int i = this.tmp.size;
    for (byte b = 0; b < i; b++)
      add((Renderable)this.tmp.get(b)); 
    this.tmp.clear();
  }
  
  public <T extends RenderableProvider> void add(Iterable<T> paramIterable) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      add((RenderableProvider)iterator.next()); 
  }
  
  public void begin() { begin(null); }
  
  public void begin(Camera paramCamera) {
    if (!this.building) {
      this.building = true;
      this.camera = paramCamera;
      this.renderablesPool.flush();
      this.renderables.clear();
      this.items.clear();
      this.meshPartPool.flush();
      this.meshPool.flush();
      return;
    } 
    throw new GdxRuntimeException("Call end() after calling begin()");
  }
  
  public void dispose() {
    if (!this.building) {
      this.meshPool.dispose();
      return;
    } 
    throw new GdxRuntimeException("Cannot dispose a ModelCache in between .begin() and .end()");
  }
  
  public void end() {
    if (this.building) {
      this.building = false;
      if (this.items.size == 0)
        return; 
      this.sorter.sort(this.camera, this.items);
      int i = this.items.size;
      i = this.renderables.size;
      Renderable renderable2 = (Renderable)this.items.get(0);
      VertexAttributes vertexAttributes = renderable2.meshPart.mesh.getVertexAttributes();
      Material material = renderable2.material;
      int j = renderable2.meshPart.primitiveType;
      i = this.renderables.size;
      this.meshBuilder.begin(vertexAttributes);
      MeshPart meshPart = this.meshBuilder.part("", j, (MeshPart)this.meshPartPool.obtain());
      this.renderables.add(obtainRenderable(material, j));
      int k = this.items.size;
      byte b = 0;
      while (b < k) {
        boolean bool2;
        boolean bool1;
        Renderable renderable = (Renderable)this.items.get(b);
        VertexAttributes vertexAttributes2 = renderable.meshPart.mesh.getVertexAttributes();
        Material material1 = renderable.material;
        int m = renderable.meshPart.primitiveType;
        if (vertexAttributes2.equals(vertexAttributes) && renderable.meshPart.size + this.meshBuilder.getNumVertices() < 32767) {
          bool1 = true;
        } else {
          bool1 = false;
        } 
        if (bool1 && m == j && material1.same(material, true)) {
          bool2 = true;
        } else {
          bool2 = false;
        } 
        VertexAttributes vertexAttributes1 = vertexAttributes;
        int n = i;
        MeshPart meshPart1 = meshPart;
        if (!bool2) {
          vertexAttributes1 = vertexAttributes;
          j = i;
          if (!bool1) {
            MeshBuilder meshBuilder2 = this.meshBuilder;
            Mesh mesh1 = meshBuilder2.end(this.meshPool.obtain(vertexAttributes, meshBuilder2.getNumVertices(), this.meshBuilder.getNumIndices()));
            while (i < this.renderables.size) {
              ((Renderable)this.renderables.get(i)).meshPart.mesh = mesh1;
              i++;
            } 
            this.meshBuilder.begin(vertexAttributes2);
            vertexAttributes1 = vertexAttributes2;
            j = i;
          } 
          meshPart1 = this.meshBuilder.part("", m, (MeshPart)this.meshPartPool.obtain());
          Array array1 = this.renderables;
          Renderable renderable3 = (Renderable)array1.get(array1.size - 1);
          renderable3.meshPart.offset = meshPart.offset;
          renderable3.meshPart.size = meshPart.size;
          this.renderables.add(obtainRenderable(material1, m));
          material = material1;
          i = m;
          n = j;
          j = i;
        } 
        this.meshBuilder.setVertexTransform(renderable.worldTransform);
        this.meshBuilder.addMesh(renderable.meshPart.mesh, renderable.meshPart.offset, renderable.meshPart.size);
        b++;
        vertexAttributes = vertexAttributes1;
        i = n;
        meshPart = meshPart1;
      } 
      MeshBuilder meshBuilder1 = this.meshBuilder;
      Mesh mesh = meshBuilder1.end(this.meshPool.obtain(vertexAttributes, meshBuilder1.getNumVertices(), this.meshBuilder.getNumIndices()));
      while (i < this.renderables.size) {
        ((Renderable)this.renderables.get(i)).meshPart.mesh = mesh;
        i++;
      } 
      Array array = this.renderables;
      Renderable renderable1 = (Renderable)array.get(array.size - 1);
      renderable1.meshPart.offset = meshPart.offset;
      renderable1.meshPart.size = meshPart.size;
      return;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Call begin() prior to calling end()");
    throw gdxRuntimeException;
  }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    if (!this.building) {
      for (Renderable renderable : this.renderables) {
        renderable.shader = null;
        renderable.environment = null;
      } 
      paramArray.addAll(this.renderables);
      return;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Cannot render a ModelCache in between .begin() and .end()");
    throw gdxRuntimeException;
  }
  
  public static interface MeshPool extends Disposable {
    void flush();
    
    Mesh obtain(VertexAttributes param1VertexAttributes, int param1Int1, int param1Int2);
  }
  
  public static class SimpleMeshPool implements MeshPool {
    private Array<Mesh> freeMeshes = new Array();
    
    private Array<Mesh> usedMeshes = new Array();
    
    public void dispose() {
      Iterator iterator = this.usedMeshes.iterator();
      while (iterator.hasNext())
        ((Mesh)iterator.next()).dispose(); 
      this.usedMeshes.clear();
      iterator = this.freeMeshes.iterator();
      while (iterator.hasNext())
        ((Mesh)iterator.next()).dispose(); 
      this.freeMeshes.clear();
    }
    
    public void flush() {
      this.freeMeshes.addAll(this.usedMeshes);
      this.usedMeshes.clear();
    }
    
    public Mesh obtain(VertexAttributes param1VertexAttributes, int param1Int1, int param1Int2) {
      int i = this.freeMeshes.size;
      for (byte b = 0; b < i; b++) {
        Mesh mesh1 = (Mesh)this.freeMeshes.get(b);
        if (mesh1.getVertexAttributes().equals(param1VertexAttributes) && mesh1.getMaxVertices() >= param1Int1 && mesh1.getMaxIndices() >= param1Int2) {
          this.freeMeshes.removeIndex(b);
          this.usedMeshes.add(mesh1);
          return mesh1;
        } 
      } 
      Mesh mesh = new Mesh(false, '耀', Math.max(32768, 1 << 32 - Integer.numberOfLeadingZeros(param1Int2 - 1)), param1VertexAttributes);
      this.usedMeshes.add(mesh);
      return mesh;
    }
  }
  
  public static class Sorter extends Object implements RenderableSorter, Comparator<Renderable> {
    public int compare(Renderable param1Renderable1, Renderable param1Renderable2) {
      int i = param1Renderable1.meshPart.mesh.getVertexAttributes().compareTo(param1Renderable2.meshPart.mesh.getVertexAttributes());
      int j = i;
      if (i == 0) {
        i = param1Renderable1.material.compareTo(param1Renderable2.material);
        j = i;
        if (i == 0)
          return param1Renderable1.meshPart.primitiveType - param1Renderable2.meshPart.primitiveType; 
      } 
      return j;
    }
    
    public void sort(Camera param1Camera, Array<Renderable> param1Array) { param1Array.sort(this); }
  }
  
  public static class TightMeshPool implements MeshPool {
    private Array<Mesh> freeMeshes = new Array();
    
    private Array<Mesh> usedMeshes = new Array();
    
    public void dispose() {
      Iterator iterator = this.usedMeshes.iterator();
      while (iterator.hasNext())
        ((Mesh)iterator.next()).dispose(); 
      this.usedMeshes.clear();
      iterator = this.freeMeshes.iterator();
      while (iterator.hasNext())
        ((Mesh)iterator.next()).dispose(); 
      this.freeMeshes.clear();
    }
    
    public void flush() {
      this.freeMeshes.addAll(this.usedMeshes);
      this.usedMeshes.clear();
    }
    
    public Mesh obtain(VertexAttributes param1VertexAttributes, int param1Int1, int param1Int2) {
      int i = this.freeMeshes.size;
      for (byte b = 0; b < i; b++) {
        Mesh mesh1 = (Mesh)this.freeMeshes.get(b);
        if (mesh1.getVertexAttributes().equals(param1VertexAttributes) && mesh1.getMaxVertices() == param1Int1 && mesh1.getMaxIndices() == param1Int2) {
          this.freeMeshes.removeIndex(b);
          this.usedMeshes.add(mesh1);
          return mesh1;
        } 
      } 
      Mesh mesh = new Mesh(true, param1Int1, param1Int2, param1VertexAttributes);
      this.usedMeshes.add(mesh);
      return mesh;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/ModelCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */