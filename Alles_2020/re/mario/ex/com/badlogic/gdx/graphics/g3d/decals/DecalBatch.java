package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.SortedIntList;
import java.util.Iterator;

public class DecalBatch implements Disposable {
  private static final int DEFAULT_SIZE = 1000;
  
  private final SortedIntList<Array<Decal>> groupList = new SortedIntList();
  
  private final Pool<Array<Decal>> groupPool = new Pool<Array<Decal>>(16) {
      protected Array<Decal> newObject() { return new Array(false, 100); }
    };
  
  private GroupStrategy groupStrategy;
  
  private Mesh mesh;
  
  private final Array<Array<Decal>> usedGroups = new Array(16);
  
  private float[] vertices;
  
  public DecalBatch(int paramInt, GroupStrategy paramGroupStrategy) {
    initialize(paramInt);
    setGroupStrategy(paramGroupStrategy);
  }
  
  public DecalBatch(GroupStrategy paramGroupStrategy) { this(1000, paramGroupStrategy); }
  
  private void render(ShaderProgram paramShaderProgram, Array<Decal> paramArray) {
    byte b;
    Iterator iterator = paramArray.iterator();
    paramArray = null;
    while (true) {
      b = 0;
      Array<Decal> array = paramArray;
      while (true) {
        while (true)
          break; 
        if (SYNTHETIC_LOCAL_VARIABLE_7 == this.vertices.length)
          flush(paramShaderProgram, SYNTHETIC_LOCAL_VARIABLE_7); 
      } 
      break;
    } 
    if (b)
      flush(paramShaderProgram, b); 
  }
  
  public void add(Decal paramDecal) {
    int i = this.groupStrategy.decideGroup(paramDecal);
    Array array1 = (Array)this.groupList.get(i);
    Array array2 = array1;
    if (array1 == null) {
      array2 = (Array)this.groupPool.obtain();
      array2.clear();
      this.usedGroups.add(array2);
      this.groupList.insert(i, array2);
    } 
    array2.add(paramDecal);
  }
  
  protected void clear() {
    this.groupList.clear();
    this.groupPool.freeAll(this.usedGroups);
    this.usedGroups.clear();
  }
  
  public void dispose() {
    clear();
    this.vertices = null;
    this.mesh.dispose();
  }
  
  public void flush() {
    render();
    clear();
  }
  
  protected void flush(ShaderProgram paramShaderProgram, int paramInt) {
    this.mesh.setVertices(this.vertices, 0, paramInt);
    this.mesh.render(paramShaderProgram, 4, 0, paramInt / 4);
  }
  
  public int getSize() { return this.vertices.length / 24; }
  
  public void initialize(int paramInt) {
    this.vertices = new float[paramInt * 24];
    Mesh.VertexDataType vertexDataType = Mesh.VertexDataType.VertexArray;
    if (Gdx.gl30 != null)
      vertexDataType = Mesh.VertexDataType.VertexBufferObjectWithVAO; 
    int i = paramInt * 6;
    VertexAttribute vertexAttribute = new VertexAttribute(true, 3, "a_position");
    int j = 0;
    this.mesh = new Mesh(vertexDataType, false, paramInt * 4, i, new VertexAttribute[] { vertexAttribute, new VertexAttribute(4, 4, "a_color"), new VertexAttribute(16, 2, "a_texCoord0") });
    short[] arrayOfShort = new short[i];
    i = 0;
    paramInt = j;
    for (j = i; paramInt < arrayOfShort.length; j += 4) {
      arrayOfShort[paramInt] = (short)(short)j;
      short s = (short)(j + 2);
      arrayOfShort[paramInt + 1] = (short)s;
      i = (short)(j + 1);
      arrayOfShort[paramInt + 2] = (short)i;
      arrayOfShort[paramInt + 3] = (short)i;
      arrayOfShort[paramInt + 4] = (short)s;
      arrayOfShort[paramInt + 5] = (short)(short)(j + 3);
      paramInt += 6;
    } 
    this.mesh.setIndices(arrayOfShort);
  }
  
  protected void render() {
    this.groupStrategy.beforeGroups();
    for (SortedIntList.Node node : this.groupList) {
      this.groupStrategy.beforeGroup(node.index, (Array)node.value);
      render(this.groupStrategy.getGroupShader(node.index), (Array)node.value);
      this.groupStrategy.afterGroup(node.index);
    } 
    this.groupStrategy.afterGroups();
  }
  
  public void setGroupStrategy(GroupStrategy paramGroupStrategy) { this.groupStrategy = paramGroupStrategy; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/decals/DecalBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */