package com.badlogic.gdx.graphics.g3d.loader;

import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.ModelLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.g3d.model.data.ModelAnimation;
import com.badlogic.gdx.graphics.g3d.model.data.ModelData;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMesh;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMeshPart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNode;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodeKeyframe;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodePart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ArrayMap;
import com.badlogic.gdx.utils.BaseJsonReader;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.JsonValue;
import java.util.Iterator;

public class G3dModelLoader extends ModelLoader<ModelLoader.ModelParameters> {
  public static final short VERSION_HI = 0;
  
  public static final short VERSION_LO = 1;
  
  protected final BaseJsonReader reader;
  
  protected final Quaternion tempQ = new Quaternion();
  
  public G3dModelLoader(BaseJsonReader paramBaseJsonReader) { this(paramBaseJsonReader, null); }
  
  public G3dModelLoader(BaseJsonReader paramBaseJsonReader, FileHandleResolver paramFileHandleResolver) {
    super(paramFileHandleResolver);
    this.reader = paramBaseJsonReader;
  }
  
  public ModelData loadModelData(FileHandle paramFileHandle, ModelLoader.ModelParameters paramModelParameters) { return parseModel(paramFileHandle); }
  
  protected void parseAnimations(ModelData paramModelData, JsonValue paramJsonValue) {
    paramJsonValue = paramJsonValue.get("animations");
    if (paramJsonValue == null)
      return; 
    paramModelData.animations.ensureCapacity(paramJsonValue.size);
    for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
      JsonValue jsonValue = paramJsonValue.get("bones");
      if (jsonValue != null) {
        ModelAnimation modelAnimation = new ModelAnimation();
        paramModelData.animations.add(modelAnimation);
        modelAnimation.nodeAnimations.ensureCapacity(jsonValue.size);
        modelAnimation.id = paramJsonValue.getString("id");
        for (jsonValue = jsonValue.child; jsonValue != null; jsonValue = jsonValue.next) {
          ModelNodeAnimation modelNodeAnimation = new ModelNodeAnimation();
          modelAnimation.nodeAnimations.add(modelNodeAnimation);
          modelNodeAnimation.nodeId = jsonValue.getString("boneId");
          JsonValue jsonValue1 = jsonValue.get("keyframes");
          if (jsonValue1 != null && jsonValue1.isArray()) {
            for (jsonValue1 = jsonValue1.child; jsonValue1 != null; jsonValue1 = jsonValue1.next) {
              float f = jsonValue1.getFloat("keytime", 0.0F) / 1000.0F;
              JsonValue jsonValue2 = jsonValue1.get("translation");
              if (jsonValue2 != null && jsonValue2.size == 3) {
                if (modelNodeAnimation.translation == null)
                  modelNodeAnimation.translation = new Array(); 
                ModelNodeKeyframe modelNodeKeyframe = new ModelNodeKeyframe();
                modelNodeKeyframe.keytime = f;
                modelNodeKeyframe.value = new Vector3(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2));
                modelNodeAnimation.translation.add(modelNodeKeyframe);
              } 
              jsonValue2 = jsonValue1.get("rotation");
              if (jsonValue2 != null && jsonValue2.size == 4) {
                if (modelNodeAnimation.rotation == null)
                  modelNodeAnimation.rotation = new Array(); 
                ModelNodeKeyframe modelNodeKeyframe = new ModelNodeKeyframe();
                modelNodeKeyframe.keytime = f;
                modelNodeKeyframe.value = new Quaternion(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2), jsonValue2.getFloat(3));
                modelNodeAnimation.rotation.add(modelNodeKeyframe);
              } 
              jsonValue2 = jsonValue1.get("scale");
              if (jsonValue2 != null && jsonValue2.size == 3) {
                if (modelNodeAnimation.scaling == null)
                  modelNodeAnimation.scaling = new Array(); 
                ModelNodeKeyframe modelNodeKeyframe = new ModelNodeKeyframe();
                modelNodeKeyframe.keytime = f;
                modelNodeKeyframe.value = new Vector3(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2));
                modelNodeAnimation.scaling.add(modelNodeKeyframe);
              } 
            } 
          } else {
            jsonValue1 = jsonValue.get("translation");
            if (jsonValue1 != null && jsonValue1.isArray()) {
              modelNodeAnimation.translation = new Array();
              modelNodeAnimation.translation.ensureCapacity(jsonValue1.size);
              for (jsonValue1 = jsonValue1.child; jsonValue1 != null; jsonValue1 = jsonValue1.next) {
                ModelNodeKeyframe modelNodeKeyframe = new ModelNodeKeyframe();
                modelNodeAnimation.translation.add(modelNodeKeyframe);
                modelNodeKeyframe.keytime = jsonValue1.getFloat("keytime", 0.0F) / 1000.0F;
                JsonValue jsonValue2 = jsonValue1.get("value");
                if (jsonValue2 != null && jsonValue2.size >= 3)
                  modelNodeKeyframe.value = new Vector3(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2)); 
              } 
            } 
            jsonValue1 = jsonValue.get("rotation");
            if (jsonValue1 != null && jsonValue1.isArray()) {
              modelNodeAnimation.rotation = new Array();
              modelNodeAnimation.rotation.ensureCapacity(jsonValue1.size);
              for (jsonValue1 = jsonValue1.child; jsonValue1 != null; jsonValue1 = jsonValue1.next) {
                ModelNodeKeyframe modelNodeKeyframe = new ModelNodeKeyframe();
                modelNodeAnimation.rotation.add(modelNodeKeyframe);
                modelNodeKeyframe.keytime = jsonValue1.getFloat("keytime", 0.0F) / 1000.0F;
                JsonValue jsonValue2 = jsonValue1.get("value");
                if (jsonValue2 != null && jsonValue2.size >= 4)
                  modelNodeKeyframe.value = new Quaternion(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2), jsonValue2.getFloat(3)); 
              } 
            } 
            jsonValue1 = jsonValue.get("scaling");
            if (jsonValue1 != null && jsonValue1.isArray()) {
              modelNodeAnimation.scaling = new Array();
              modelNodeAnimation.scaling.ensureCapacity(jsonValue1.size);
              for (jsonValue1 = jsonValue1.child; jsonValue1 != null; jsonValue1 = jsonValue1.next) {
                ModelNodeKeyframe modelNodeKeyframe = new ModelNodeKeyframe();
                modelNodeAnimation.scaling.add(modelNodeKeyframe);
                modelNodeKeyframe.keytime = jsonValue1.getFloat("keytime", 0.0F) / 1000.0F;
                JsonValue jsonValue2 = jsonValue1.get("value");
                if (jsonValue2 != null && jsonValue2.size >= 3)
                  modelNodeKeyframe.value = new Vector3(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2)); 
              } 
            } 
          } 
        } 
      } 
    } 
  }
  
  protected VertexAttribute[] parseAttributes(JsonValue paramJsonValue) {
    Array array = new Array();
    paramJsonValue = paramJsonValue.child;
    byte b1 = 0;
    byte b2 = 0;
    while (paramJsonValue != null) {
      StringBuilder stringBuilder;
      String str = paramJsonValue.asString();
      if (str.equals("POSITION")) {
        array.add(VertexAttribute.Position());
      } else if (str.equals("NORMAL")) {
        array.add(VertexAttribute.Normal());
      } else if (str.equals("COLOR")) {
        array.add(VertexAttribute.ColorUnpacked());
      } else if (str.equals("COLORPACKED")) {
        array.add(VertexAttribute.ColorPacked());
      } else if (str.equals("TANGENT")) {
        array.add(VertexAttribute.Tangent());
      } else if (str.equals("BINORMAL")) {
        array.add(VertexAttribute.Binormal());
      } else if (str.startsWith("TEXCOORD")) {
        array.add(VertexAttribute.TexCoords(b1));
        b1++;
      } else if (str.startsWith("BLENDWEIGHT")) {
        array.add(VertexAttribute.BoneWeight(b2));
        b2++;
      } else {
        stringBuilder = new StringBuilder();
        stringBuilder.append("Unknown vertex attribute '");
        stringBuilder.append(str);
        stringBuilder.append("', should be one of position, normal, uv, tangent or binormal");
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
      JsonValue jsonValue = stringBuilder.next;
    } 
    return (VertexAttribute[])array.toArray(VertexAttribute.class);
  }
  
  protected Color parseColor(JsonValue paramJsonValue) {
    if (paramJsonValue.size >= 3)
      return new Color(paramJsonValue.getFloat(0), paramJsonValue.getFloat(1), paramJsonValue.getFloat(2), 1.0F); 
    throw new GdxRuntimeException("Expected Color values <> than three.");
  }
  
  protected void parseMaterials(ModelData paramModelData, JsonValue paramJsonValue, String paramString) {
    paramJsonValue = paramJsonValue.get("materials");
    if (paramJsonValue != null) {
      paramModelData.materials.ensureCapacity(paramJsonValue.size);
      paramJsonValue = paramJsonValue.child;
      while (paramJsonValue != null) {
        ModelMaterial modelMaterial = new ModelMaterial();
        String str = paramJsonValue.getString("id", null);
        if (str != null) {
          modelMaterial.id = str;
          JsonValue jsonValue = paramJsonValue.get("diffuse");
          if (jsonValue != null)
            modelMaterial.diffuse = parseColor(jsonValue); 
          jsonValue = paramJsonValue.get("ambient");
          if (jsonValue != null)
            modelMaterial.ambient = parseColor(jsonValue); 
          jsonValue = paramJsonValue.get("emissive");
          if (jsonValue != null)
            modelMaterial.emissive = parseColor(jsonValue); 
          jsonValue = paramJsonValue.get("specular");
          if (jsonValue != null)
            modelMaterial.specular = parseColor(jsonValue); 
          jsonValue = paramJsonValue.get("reflection");
          if (jsonValue != null)
            modelMaterial.reflection = parseColor(jsonValue); 
          modelMaterial.shininess = paramJsonValue.getFloat("shininess", 0.0F);
          modelMaterial.opacity = paramJsonValue.getFloat("opacity", 1.0F);
          jsonValue = paramJsonValue.get("textures");
          if (jsonValue != null) {
            jsonValue = jsonValue.child;
            while (jsonValue != null) {
              ModelTexture modelTexture = new ModelTexture();
              String str1 = jsonValue.getString("id", null);
              if (str1 != null) {
                modelTexture.id = str1;
                String str2 = jsonValue.getString("filename", null);
                if (str2 != null) {
                  StringBuilder stringBuilder = new StringBuilder();
                  stringBuilder.append(paramString);
                  int i = paramString.length();
                  str1 = "/";
                  if (i == 0 || paramString.endsWith("/"))
                    str1 = ""; 
                  stringBuilder.append(str1);
                  stringBuilder.append(str2);
                  modelTexture.fileName = stringBuilder.toString();
                  modelTexture.uvTranslation = readVector2(jsonValue.get("uvTranslation"), 0.0F, 0.0F);
                  modelTexture.uvScaling = readVector2(jsonValue.get("uvScaling"), 1.0F, 1.0F);
                  str1 = jsonValue.getString("type", null);
                  if (str1 != null) {
                    modelTexture.usage = parseTextureUsage(str1);
                    if (modelMaterial.textures == null)
                      modelMaterial.textures = new Array(); 
                    modelMaterial.textures.add(modelTexture);
                    jsonValue = jsonValue.next;
                    continue;
                  } 
                  throw new GdxRuntimeException("Texture needs type.");
                } 
                throw new GdxRuntimeException("Texture needs filename.");
              } 
              throw new GdxRuntimeException("Texture has no id.");
            } 
          } 
          paramModelData.materials.add(modelMaterial);
          paramJsonValue = paramJsonValue.next;
          continue;
        } 
        throw new GdxRuntimeException("Material needs an id.");
      } 
    } 
  }
  
  protected void parseMeshes(ModelData paramModelData, JsonValue paramJsonValue) {
    paramJsonValue = paramJsonValue.get("meshes");
    if (paramJsonValue != null) {
      paramModelData.meshes.ensureCapacity(paramJsonValue.size);
      for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
        StringBuilder stringBuilder;
        ModelMesh modelMesh = new ModelMesh();
        modelMesh.id = paramJsonValue.getString("id", "");
        modelMesh.attributes = parseAttributes(paramJsonValue.require("attributes"));
        modelMesh.vertices = paramJsonValue.require("vertices").asFloatArray();
        JsonValue jsonValue = paramJsonValue.require("parts");
        Array array = new Array();
        jsonValue = jsonValue.child;
        while (jsonValue != null) {
          ModelMeshPart modelMeshPart = new ModelMeshPart();
          String str = jsonValue.getString("id", null);
          if (str != null) {
            Iterator iterator = array.iterator();
            while (iterator.hasNext()) {
              if (!((ModelMeshPart)iterator.next()).id.equals(str))
                continue; 
              StringBuilder stringBuilder1 = new StringBuilder();
              stringBuilder1.append("Mesh part with id '");
              stringBuilder1.append(str);
              stringBuilder1.append("' already in defined");
              throw new GdxRuntimeException(stringBuilder1.toString());
            } 
            modelMeshPart.id = str;
            String str1 = jsonValue.getString("type", null);
            if (str1 != null) {
              modelMeshPart.primitiveType = parseType(str1);
              modelMeshPart.indices = jsonValue.require("indices").asShortArray();
              array.add(modelMeshPart);
              jsonValue = jsonValue.next;
              continue;
            } 
            stringBuilder = new StringBuilder();
            stringBuilder.append("No primitive type given for mesh part '");
            stringBuilder.append(str);
            stringBuilder.append("'");
            throw new GdxRuntimeException(stringBuilder.toString());
          } 
          throw new GdxRuntimeException("Not id given for mesh part");
        } 
        modelMesh.parts = (ModelMeshPart[])array.toArray(ModelMeshPart.class);
        stringBuilder.meshes.add(modelMesh);
      } 
    } 
  }
  
  public ModelData parseModel(FileHandle paramFileHandle) {
    JsonValue jsonValue1 = this.reader.parse(paramFileHandle);
    ModelData modelData = new ModelData();
    JsonValue jsonValue2 = jsonValue1.require("version");
    modelData.version[0] = jsonValue2.getShort(0);
    modelData.version[1] = jsonValue2.getShort(1);
    if (modelData.version[0] == 0 && modelData.version[1] == 1) {
      modelData.id = jsonValue1.getString("id", "");
      parseMeshes(modelData, jsonValue1);
      parseMaterials(modelData, jsonValue1, paramFileHandle.parent().path());
      parseNodes(modelData, jsonValue1);
      parseAnimations(modelData, jsonValue1);
      return modelData;
    } 
    throw new GdxRuntimeException("Model version not supported");
  }
  
  protected Array<ModelNode> parseNodes(ModelData paramModelData, JsonValue paramJsonValue) {
    paramJsonValue = paramJsonValue.get("nodes");
    if (paramJsonValue != null) {
      paramModelData.nodes.ensureCapacity(paramJsonValue.size);
      for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next)
        paramModelData.nodes.add(parseNodesRecursively(paramJsonValue)); 
    } 
    return paramModelData.nodes;
  }
  
  protected ModelNode parseNodesRecursively(JsonValue paramJsonValue) {
    ModelNode modelNode = new ModelNode();
    String str = paramJsonValue.getString("id", null);
    if (str != null) {
      modelNode.id = str;
      String str1 = "translation";
      JsonValue jsonValue = paramJsonValue.get("translation");
      if (jsonValue == null || jsonValue.size == 3) {
        Vector3 vector3;
        if (jsonValue == null) {
          jsonValue = null;
        } else {
          vector3 = new Vector3(jsonValue.getFloat(0), jsonValue.getFloat(1), jsonValue.getFloat(2));
        } 
        modelNode.translation = vector3;
        String str2 = "rotation";
        JsonValue jsonValue1 = paramJsonValue.get("rotation");
        if (jsonValue1 == null || jsonValue1.size == 4) {
          Quaternion quaternion;
          if (jsonValue1 == null) {
            jsonValue1 = null;
          } else {
            quaternion = new Quaternion(jsonValue1.getFloat(0), jsonValue1.getFloat(1), jsonValue1.getFloat(2), jsonValue1.getFloat(3));
          } 
          modelNode.rotation = quaternion;
          JsonValue jsonValue2 = paramJsonValue.get("scale");
          if (jsonValue2 == null || jsonValue2.size == 3) {
            Vector3 vector31;
            StringBuilder stringBuilder;
            if (jsonValue2 == null) {
              jsonValue2 = null;
            } else {
              vector31 = new Vector3(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2));
            } 
            modelNode.scale = vector31;
            String str3 = paramJsonValue.getString("mesh", null);
            if (str3 != null)
              modelNode.meshId = str3; 
            JsonValue jsonValue4 = paramJsonValue.get("parts");
            if (jsonValue4 != null) {
              modelNode.parts = new ModelNodePart[jsonValue4.size];
              JsonValue jsonValue5 = jsonValue4.child;
              byte b1 = 0;
              String str4 = str1;
              while (jsonValue5 != null) {
                ModelNodePart modelNodePart = new ModelNodePart();
                str1 = jsonValue5.getString("meshpartid", null);
                String str5 = jsonValue5.getString("materialid", null);
                if (str1 != null && str5 != null) {
                  Matrix4 matrix42;
                  modelNodePart.materialId = str5;
                  modelNodePart.meshPartId = str1;
                  JsonValue jsonValue6 = jsonValue5.get("bones");
                  str5 = str4;
                  str1 = str2;
                  if (jsonValue6 != null) {
                    modelNodePart.bones = new ArrayMap(true, jsonValue6.size, String.class, Matrix4.class);
                    jsonValue6 = jsonValue6.child;
                    while (true) {
                      str5 = str4;
                      str1 = str2;
                      if (jsonValue6 != null) {
                        str1 = jsonValue6.getString("node", null);
                        if (str1 != null) {
                          matrix42 = new Matrix4();
                          JsonValue jsonValue7 = jsonValue6.get(str4);
                          if (jsonValue7 != null && jsonValue7.size >= 3)
                            matrix42.translate(jsonValue7.getFloat(0), jsonValue7.getFloat(1), jsonValue7.getFloat(2)); 
                          jsonValue7 = jsonValue6.get(str2);
                          if (jsonValue7 != null && jsonValue7.size >= 4)
                            matrix42.rotate(this.tempQ.set(jsonValue7.getFloat(0), jsonValue7.getFloat(1), jsonValue7.getFloat(2), jsonValue7.getFloat(3))); 
                          jsonValue7 = jsonValue6.get("scale");
                          if (jsonValue7 != null && jsonValue7.size >= 3)
                            matrix42.scale(jsonValue7.getFloat(0), jsonValue7.getFloat(1), jsonValue7.getFloat(2)); 
                          modelNodePart.bones.put(str1, matrix42);
                          jsonValue6 = jsonValue6.next;
                          continue;
                        } 
                        throw new GdxRuntimeException("Bone node ID missing");
                      } 
                      break;
                    } 
                  } 
                  modelNode.parts[b1] = modelNodePart;
                  jsonValue5 = jsonValue5.next;
                  b1++;
                  Matrix4 matrix41 = matrix42;
                  str2 = str1;
                  continue;
                } 
                stringBuilder = new StringBuilder();
                stringBuilder.append("Node ");
                stringBuilder.append(str);
                stringBuilder.append(" part is missing meshPartId or materialId");
                throw new GdxRuntimeException(stringBuilder.toString());
              } 
            } 
            byte b = 0;
            JsonValue jsonValue3 = stringBuilder.get("children");
            if (jsonValue3 != null) {
              modelNode.children = new ModelNode[jsonValue3.size];
              jsonValue3 = jsonValue3.child;
              while (jsonValue3 != null) {
                modelNode.children[b] = parseNodesRecursively(jsonValue3);
                jsonValue3 = jsonValue3.next;
                b++;
              } 
            } 
            return modelNode;
          } 
          throw new GdxRuntimeException("Node scale incomplete");
        } 
        throw new GdxRuntimeException("Node rotation incomplete");
      } 
      throw new GdxRuntimeException("Node translation incomplete");
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Node id missing.");
    throw gdxRuntimeException;
  }
  
  protected int parseTextureUsage(String paramString) { return paramString.equalsIgnoreCase("AMBIENT") ? 4 : (paramString.equalsIgnoreCase("BUMP") ? 8 : (paramString.equalsIgnoreCase("DIFFUSE") ? 2 : (paramString.equalsIgnoreCase("EMISSIVE") ? 3 : (paramString.equalsIgnoreCase("NONE") ? 1 : (paramString.equalsIgnoreCase("NORMAL") ? 7 : (paramString.equalsIgnoreCase("REFLECTION") ? 10 : (paramString.equalsIgnoreCase("SHININESS") ? 6 : (paramString.equalsIgnoreCase("SPECULAR") ? 5 : (paramString.equalsIgnoreCase("TRANSPARENCY") ? 9 : 0))))))))); }
  
  protected int parseType(String paramString) {
    if (paramString.equals("TRIANGLES"))
      return 4; 
    if (paramString.equals("LINES"))
      return 1; 
    if (paramString.equals("POINTS"))
      return 0; 
    if (paramString.equals("TRIANGLE_STRIP"))
      return 5; 
    if (paramString.equals("LINE_STRIP"))
      return 3; 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Unknown primitive type '");
    stringBuilder.append(paramString);
    stringBuilder.append("', should be one of triangle, trianglestrip, line, linestrip, lineloop or point");
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  protected Vector2 readVector2(JsonValue paramJsonValue, float paramFloat1, float paramFloat2) {
    if (paramJsonValue == null)
      return new Vector2(paramFloat1, paramFloat2); 
    if (paramJsonValue.size == 2)
      return new Vector2(paramJsonValue.getFloat(0), paramJsonValue.getFloat(1)); 
    throw new GdxRuntimeException("Expected Vector2 values <> than two.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/loader/G3dModelLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */