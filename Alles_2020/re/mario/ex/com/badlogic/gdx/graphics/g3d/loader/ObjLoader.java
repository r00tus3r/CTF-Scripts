package com.badlogic.gdx.graphics.g3d.loader;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.ModelLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.model.data.ModelData;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMesh;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMeshPart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNode;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodePart;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ObjLoader extends ModelLoader<ObjLoader.ObjLoaderParameters> {
  public static boolean logWarning = false;
  
  final Array<Group> groups = new Array(10);
  
  final FloatArray norms = new FloatArray('Ĭ');
  
  final FloatArray uvs = new FloatArray('È');
  
  final FloatArray verts = new FloatArray('Ĭ');
  
  static  {
  
  }
  
  public ObjLoader() { this(null); }
  
  public ObjLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  private int getIndex(String paramString, int paramInt) {
    if (paramString == null || paramString.length() == 0)
      return 0; 
    int i = Integer.parseInt(paramString);
    return (i < 0) ? (paramInt + i) : (i - 1);
  }
  
  private Group setActiveGroup(String paramString) {
    for (Group group1 : this.groups) {
      if (group1.name.equals(paramString))
        return group1; 
    } 
    Group group = new Group(paramString);
    this.groups.add(group);
    return group;
  }
  
  public Model loadModel(FileHandle paramFileHandle, boolean paramBoolean) { return loadModel(paramFileHandle, new ObjLoaderParameters(paramBoolean)); }
  
  public ModelData loadModelData(FileHandle paramFileHandle, ObjLoaderParameters paramObjLoaderParameters) {
    boolean bool;
    if (paramObjLoaderParameters != null && paramObjLoaderParameters.flipV) {
      bool = true;
    } else {
      bool = false;
    } 
    return loadModelData(paramFileHandle, bool);
  }
  
  protected ModelData loadModelData(FileHandle paramFileHandle, boolean paramBoolean) {
    if (logWarning)
      Gdx.app.error("ObjLoader", "Wavefront (OBJ) is not fully supported, consult the documentation for more information"); 
    MtlLoader mtlLoader = new MtlLoader();
    Group group = new Group("default");
    this.groups.add(group);
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(paramFileHandle.read()), 'က');
    try {
      while (true) {
        String str = bufferedReader.readLine();
        if (str != null) {
          String[] arrayOfString = str.split("\\s+");
          if (arrayOfString.length < 1)
            break; 
          if (arrayOfString[0].length() == 0)
            continue; 
          char c = arrayOfString[0].toLowerCase().charAt(0);
          if (c == '#')
            continue; 
          if (c == 'v') {
            if (arrayOfString[0].length() == 1) {
              this.verts.add(Float.parseFloat(arrayOfString[1]));
              this.verts.add(Float.parseFloat(arrayOfString[2]));
              this.verts.add(Float.parseFloat(arrayOfString[3]));
              continue;
            } 
            if (arrayOfString[0].charAt(1) == 'n') {
              this.norms.add(Float.parseFloat(arrayOfString[1]));
              this.norms.add(Float.parseFloat(arrayOfString[2]));
              this.norms.add(Float.parseFloat(arrayOfString[3]));
              continue;
            } 
            if (arrayOfString[0].charAt(1) == 't') {
              float f;
              this.uvs.add(Float.parseFloat(arrayOfString[1]));
              FloatArray floatArray = this.uvs;
              if (paramBoolean) {
                f = 1.0F - Float.parseFloat(arrayOfString[2]);
              } else {
                f = Float.parseFloat(arrayOfString[2]);
              } 
              floatArray.add(f);
            } 
            continue;
          } 
          if (c == 'f') {
            Array array = group.faces;
            for (c = '\001'; c < arrayOfString.length - 2; c--) {
              String[] arrayOfString1 = arrayOfString[1].split("/");
              array.add(Integer.valueOf(getIndex(arrayOfString1[0], this.verts.size)));
              if (arrayOfString1.length > 2) {
                if (c == '\001')
                  group.hasNorms = true; 
                array.add(Integer.valueOf(getIndex(arrayOfString1[2], this.norms.size)));
              } 
              if (arrayOfString1.length > 1 && arrayOfString1[1].length() > 0) {
                if (c == '\001')
                  group.hasUVs = true; 
                array.add(Integer.valueOf(getIndex(arrayOfString1[1], this.uvs.size)));
              } 
              arrayOfString1 = arrayOfString[++c].split("/");
              array.add(Integer.valueOf(getIndex(arrayOfString1[0], this.verts.size)));
              if (arrayOfString1.length > 2)
                array.add(Integer.valueOf(getIndex(arrayOfString1[2], this.norms.size))); 
              if (arrayOfString1.length > 1 && arrayOfString1[1].length() > 0)
                array.add(Integer.valueOf(getIndex(arrayOfString1[1], this.uvs.size))); 
              arrayOfString1 = arrayOfString[++c].split("/");
              array.add(Integer.valueOf(getIndex(arrayOfString1[0], this.verts.size)));
              if (arrayOfString1.length > 2)
                array.add(Integer.valueOf(getIndex(arrayOfString1[2], this.norms.size))); 
              if (arrayOfString1.length > 1 && arrayOfString1[1].length() > 0)
                array.add(Integer.valueOf(getIndex(arrayOfString1[1], this.uvs.size))); 
              group.numFaces++;
            } 
            continue;
          } 
          if (c == 'o' || c == 'g') {
            if (arrayOfString.length > 1) {
              group = setActiveGroup(arrayOfString[1]);
              continue;
            } 
            group = setActiveGroup("default");
            continue;
          } 
          if (arrayOfString[0].equals("mtllib")) {
            mtlLoader.load(paramFileHandle.parent().child(arrayOfString[1]));
            continue;
          } 
          if (arrayOfString[0].equals("usemtl")) {
            if (arrayOfString.length == 1) {
              group.materialName = "default";
              continue;
            } 
            group.materialName = arrayOfString[1].replace('.', '_');
          } 
          continue;
        } 
        break;
      } 
      bufferedReader.close();
      int i;
      for (i = 0; i < this.groups.size; i = b1 + 1) {
        byte b1 = i;
        if (((Group)this.groups.get(i)).numFaces < 1) {
          this.groups.removeIndex(i);
          b1 = i - 1;
        } 
      } 
      if (this.groups.size < 1)
        return null; 
      i = this.groups.size;
      ModelData modelData = new ModelData();
      int j = 0;
      byte b = 0;
      while (j < i) {
        String str2;
        Group group1 = (Group)this.groups.get(j);
        String str1 = group1.faces;
        int k = str1.size;
        int m = group1.numFaces;
        boolean bool = group1.hasNorms;
        paramBoolean = group1.hasUVs;
        int n = m * 3;
        if (bool) {
          m = 3;
        } else {
          m = 0;
        } 
        if (paramBoolean) {
          i1 = 2;
        } else {
          i1 = 0;
        } 
        float[] arrayOfFloat = new float[n * (m + 3 + i1)];
        int i2 = 0;
        m = 0;
        int i1 = j;
        while (i2 < k) {
          int i3 = i2 + true;
          int i4 = ((Integer)str1.get(i2)).intValue() * 3;
          i2 = m + 1;
          str2 = this.verts;
          j = i4 + 1;
          arrayOfFloat[m] = str2.get(i4);
          m = i2 + 1;
          arrayOfFloat[i2] = this.verts.get(j);
          i2 = m + 1;
          arrayOfFloat[m] = this.verts.get(j + 1);
          j = i3;
          m = i2;
          if (bool) {
            i4 = ((Integer)str1.get(i3)).intValue() * 3;
            m = i2 + 1;
            str2 = this.norms;
            j = i4 + 1;
            arrayOfFloat[i2] = str2.get(i4);
            i2 = m + 1;
            arrayOfFloat[m] = this.norms.get(j);
            m = i2 + 1;
            arrayOfFloat[i2] = this.norms.get(j + 1);
            j = i3 + 1;
          } 
          if (paramBoolean) {
            i2 = ((Integer)str1.get(j)).intValue() * 2;
            i3 = m + 1;
            arrayOfFloat[m] = this.uvs.get(i2);
            m = i3 + 1;
            arrayOfFloat[i3] = this.uvs.get(i2 + 1);
            j++;
          } 
          i2 = j;
        } 
        j = n;
        if (n >= 32767)
          j = 0; 
        short[] arrayOfShort = new short[j];
        if (j > 0)
          for (m = 0; m < j; m++)
            arrayOfShort[m] = (short)(short)m;  
        Array array = new Array();
        array.add(new VertexAttribute(true, 3, "a_position"));
        if (bool)
          array.add(new VertexAttribute(8, 3, "a_normal")); 
        if (paramBoolean)
          array.add(new VertexAttribute(16, 2, "a_texCoord0")); 
        String str3 = Integer.toString(++b);
        if ("default".equals(group1.name)) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("node");
          stringBuilder.append(str3);
          str2 = stringBuilder.toString();
        } else {
          str2 = group1.name;
        } 
        if ("default".equals(group1.name)) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("mesh");
          stringBuilder.append(str3);
          String str = stringBuilder.toString();
        } else {
          str1 = group1.name;
        } 
        if ("default".equals(group1.name)) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("part");
          stringBuilder.append(str3);
          str3 = stringBuilder.toString();
        } else {
          str3 = group1.name;
        } 
        ModelNode modelNode = new ModelNode();
        modelNode.id = str2;
        modelNode.meshId = str1;
        modelNode.scale = new Vector3(1.0F, 1.0F, 1.0F);
        modelNode.translation = new Vector3();
        modelNode.rotation = new Quaternion();
        ModelNodePart modelNodePart = new ModelNodePart();
        modelNodePart.meshPartId = str3;
        modelNodePart.materialId = group1.materialName;
        modelNode.parts = new ModelNodePart[] { modelNodePart };
        ModelMeshPart modelMeshPart = new ModelMeshPart();
        modelMeshPart.id = str3;
        modelMeshPart.indices = arrayOfShort;
        modelMeshPart.primitiveType = 4;
        ModelMesh modelMesh = new ModelMesh();
        modelMesh.id = str1;
        modelMesh.attributes = (VertexAttribute[])array.toArray(VertexAttribute.class);
        modelMesh.vertices = arrayOfFloat;
        modelMesh.parts = new ModelMeshPart[] { modelMeshPart };
        modelData.nodes.add(modelNode);
        modelData.meshes.add(modelMesh);
        ModelMaterial modelMaterial = mtlLoader.getMaterial(group1.materialName);
        modelData.materials.add(modelMaterial);
        j = i1 + 1;
      } 
      if (this.verts.size > 0)
        this.verts.clear(); 
      if (this.norms.size > 0)
        this.norms.clear(); 
      if (this.uvs.size > 0)
        this.uvs.clear(); 
      if (this.groups.size > 0)
        this.groups.clear(); 
      return modelData;
    } catch (IOException paramFileHandle) {
      return null;
    } 
  }
  
  private class Group {
    Array<Integer> faces;
    
    boolean hasNorms;
    
    boolean hasUVs;
    
    Material mat;
    
    String materialName;
    
    final String name;
    
    int numFaces;
    
    Group(String param1String) {
      this.name = param1String;
      this.faces = new Array('È');
      this.numFaces = 0;
      this.mat = new Material("");
      this.materialName = "default";
    }
  }
  
  public static class ObjLoaderParameters extends ModelLoader.ModelParameters {
    public boolean flipV;
    
    public ObjLoaderParameters() {}
    
    public ObjLoaderParameters(boolean param1Boolean) { this.flipV = param1Boolean; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/loader/ObjLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */