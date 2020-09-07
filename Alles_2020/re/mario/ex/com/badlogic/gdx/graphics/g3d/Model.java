package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.NodeKeyframe;
import com.badlogic.gdx.graphics.g3d.model.NodePart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelAnimation;
import com.badlogic.gdx.graphics.g3d.model.data.ModelData;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMesh;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMeshPart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNode;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.graphics.g3d.utils.TextureProvider;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ArrayMap;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.ObjectMap;
import java.util.Iterator;

public class Model implements Disposable {
  public final Array<Animation> animations = new Array();
  
  protected final Array<Disposable> disposables = new Array();
  
  public final Array<Material> materials = new Array();
  
  public final Array<MeshPart> meshParts = new Array();
  
  public final Array<Mesh> meshes = new Array();
  
  private ObjectMap<NodePart, ArrayMap<String, Matrix4>> nodePartBones = new ObjectMap();
  
  public final Array<Node> nodes = new Array();
  
  public Model() {}
  
  public Model(ModelData paramModelData) { this(paramModelData, new TextureProvider.FileTextureProvider()); }
  
  public Model(ModelData paramModelData, TextureProvider paramTextureProvider) { load(paramModelData, paramTextureProvider); }
  
  public BoundingBox calculateBoundingBox(BoundingBox paramBoundingBox) {
    paramBoundingBox.inf();
    return extendBoundingBox(paramBoundingBox);
  }
  
  public void calculateTransforms() {
    byte b2;
    int i = this.nodes.size;
    boolean bool = false;
    byte b1 = 0;
    while (true) {
      b2 = bool;
      if (b1 < i) {
        ((Node)this.nodes.get(b1)).calculateTransforms(true);
        b1++;
        continue;
      } 
      break;
    } 
    while (b2 < i) {
      ((Node)this.nodes.get(b2)).calculateBoneTransforms(true);
      b2++;
    } 
  }
  
  protected Material convertMaterial(ModelMaterial paramModelMaterial, TextureProvider paramTextureProvider) {
    Material material = new Material();
    material.id = paramModelMaterial.id;
    if (paramModelMaterial.ambient != null)
      material.set(new ColorAttribute(ColorAttribute.Ambient, paramModelMaterial.ambient)); 
    if (paramModelMaterial.diffuse != null)
      material.set(new ColorAttribute(ColorAttribute.Diffuse, paramModelMaterial.diffuse)); 
    if (paramModelMaterial.specular != null)
      material.set(new ColorAttribute(ColorAttribute.Specular, paramModelMaterial.specular)); 
    if (paramModelMaterial.emissive != null)
      material.set(new ColorAttribute(ColorAttribute.Emissive, paramModelMaterial.emissive)); 
    if (paramModelMaterial.reflection != null)
      material.set(new ColorAttribute(ColorAttribute.Reflection, paramModelMaterial.reflection)); 
    if (paramModelMaterial.shininess > 0.0F)
      material.set(new FloatAttribute(FloatAttribute.Shininess, paramModelMaterial.shininess)); 
    if (paramModelMaterial.opacity != 1.0F)
      material.set(new BlendingAttribute('̂', '̃', paramModelMaterial.opacity)); 
    ObjectMap objectMap = new ObjectMap();
    if (paramModelMaterial.textures != null)
      for (ModelTexture modelTexture : paramModelMaterial.textures) {
        float f4;
        float f3;
        float f2;
        float f1;
        Texture texture;
        if (objectMap.containsKey(modelTexture.fileName)) {
          texture = (Texture)objectMap.get(modelTexture.fileName);
        } else {
          texture = paramTextureProvider.load(modelTexture.fileName);
          objectMap.put(modelTexture.fileName, texture);
          this.disposables.add(texture);
        } 
        TextureDescriptor textureDescriptor = new TextureDescriptor(texture);
        textureDescriptor.minFilter = texture.getMinFilter();
        textureDescriptor.magFilter = texture.getMagFilter();
        textureDescriptor.uWrap = texture.getUWrap();
        textureDescriptor.vWrap = texture.getVWrap();
        if (modelTexture.uvTranslation == null) {
          f1 = 0.0F;
        } else {
          f1 = modelTexture.uvTranslation.x;
        } 
        if (modelTexture.uvTranslation == null) {
          f2 = 0.0F;
        } else {
          f2 = modelTexture.uvTranslation.y;
        } 
        if (modelTexture.uvScaling == null) {
          f3 = 1.0F;
        } else {
          f3 = modelTexture.uvScaling.x;
        } 
        if (modelTexture.uvScaling == null) {
          f4 = 1.0F;
        } else {
          f4 = modelTexture.uvScaling.y;
        } 
        int i = modelTexture.usage;
        if (i != 2) {
          if (i != 3) {
            if (i != 4) {
              if (i != 5) {
                if (i != 7) {
                  if (i != 8) {
                    if (i != 10)
                      continue; 
                    material.set(new TextureAttribute(TextureAttribute.Reflection, textureDescriptor, f1, f2, f3, f4));
                    continue;
                  } 
                  material.set(new TextureAttribute(TextureAttribute.Bump, textureDescriptor, f1, f2, f3, f4));
                  continue;
                } 
                material.set(new TextureAttribute(TextureAttribute.Normal, textureDescriptor, f1, f2, f3, f4));
                continue;
              } 
              material.set(new TextureAttribute(TextureAttribute.Specular, textureDescriptor, f1, f2, f3, f4));
              continue;
            } 
            material.set(new TextureAttribute(TextureAttribute.Ambient, textureDescriptor, f1, f2, f3, f4));
            continue;
          } 
          material.set(new TextureAttribute(TextureAttribute.Emissive, textureDescriptor, f1, f2, f3, f4));
          continue;
        } 
        material.set(new TextureAttribute(TextureAttribute.Diffuse, textureDescriptor, f1, f2, f3, f4));
      }  
    return material;
  }
  
  protected void convertMesh(ModelMesh paramModelMesh) {
    ModelMeshPart[] arrayOfModelMeshPart1 = paramModelMesh.parts;
    int i = arrayOfModelMeshPart1.length;
    byte b = 0;
    int j = 0;
    while (b < i) {
      j += (arrayOfModelMeshPart1[b]).indices.length;
      b++;
    } 
    if (j > 0) {
      b = 1;
    } else {
      b = 0;
    } 
    VertexAttributes vertexAttributes = new VertexAttributes(paramModelMesh.attributes);
    int k = paramModelMesh.vertices.length / vertexAttributes.vertexSize / 4;
    Mesh mesh = new Mesh(true, k, j, vertexAttributes);
    this.meshes.add(mesh);
    this.disposables.add(mesh);
    BufferUtils.copy(paramModelMesh.vertices, mesh.getVerticesBuffer(), paramModelMesh.vertices.length, 0);
    mesh.getIndicesBuffer().clear();
    ModelMeshPart[] arrayOfModelMeshPart2 = paramModelMesh.parts;
    int m = arrayOfModelMeshPart2.length;
    j = 0;
    i = 0;
    while (j < m) {
      int n;
      ModelMeshPart modelMeshPart = arrayOfModelMeshPart2[j];
      MeshPart meshPart = new MeshPart();
      meshPart.id = modelMeshPart.id;
      meshPart.primitiveType = modelMeshPart.primitiveType;
      meshPart.offset = i;
      if (b != 0) {
        n = modelMeshPart.indices.length;
      } else {
        n = k;
      } 
      meshPart.size = n;
      meshPart.mesh = mesh;
      if (b != 0)
        mesh.getIndicesBuffer().put(modelMeshPart.indices); 
      i += meshPart.size;
      this.meshParts.add(meshPart);
      j++;
    } 
    mesh.getIndicesBuffer().position(0);
    Iterator iterator = this.meshParts.iterator();
    while (iterator.hasNext())
      ((MeshPart)iterator.next()).update(); 
  }
  
  public void dispose() {
    Iterator iterator = this.disposables.iterator();
    while (iterator.hasNext())
      ((Disposable)iterator.next()).dispose(); 
  }
  
  public BoundingBox extendBoundingBox(BoundingBox paramBoundingBox) {
    int i = this.nodes.size;
    for (byte b = 0; b < i; b++)
      ((Node)this.nodes.get(b)).extendBoundingBox(paramBoundingBox); 
    return paramBoundingBox;
  }
  
  public Animation getAnimation(String paramString) { return getAnimation(paramString, true); }
  
  public Animation getAnimation(String paramString, boolean paramBoolean) {
    int i = this.animations.size;
    byte b1 = 0;
    byte b2 = 0;
    if (paramBoolean) {
      for (b1 = b2; b1 < i; b1++) {
        Animation animation = (Animation)this.animations.get(b1);
        if (animation.id.equalsIgnoreCase(paramString))
          return animation; 
      } 
    } else {
      while (b1 < i) {
        Animation animation = (Animation)this.animations.get(b1);
        if (animation.id.equals(paramString))
          return animation; 
        b1++;
      } 
    } 
    return null;
  }
  
  public Iterable<Disposable> getManagedDisposables() { return this.disposables; }
  
  public Material getMaterial(String paramString) { return getMaterial(paramString, true); }
  
  public Material getMaterial(String paramString, boolean paramBoolean) {
    int i = this.materials.size;
    byte b1 = 0;
    byte b2 = 0;
    if (paramBoolean) {
      for (b1 = b2; b1 < i; b1++) {
        Material material = (Material)this.materials.get(b1);
        if (material.id.equalsIgnoreCase(paramString))
          return material; 
      } 
    } else {
      while (b1 < i) {
        Material material = (Material)this.materials.get(b1);
        if (material.id.equals(paramString))
          return material; 
        b1++;
      } 
    } 
    return null;
  }
  
  public Node getNode(String paramString) { return getNode(paramString, true); }
  
  public Node getNode(String paramString, boolean paramBoolean) { return getNode(paramString, paramBoolean, false); }
  
  public Node getNode(String paramString, boolean paramBoolean1, boolean paramBoolean2) { return Node.getNode(this.nodes, paramString, paramBoolean1, paramBoolean2); }
  
  protected void load(ModelData paramModelData, TextureProvider paramTextureProvider) {
    loadMeshes(paramModelData.meshes);
    loadMaterials(paramModelData.materials, paramTextureProvider);
    loadNodes(paramModelData.nodes);
    loadAnimations(paramModelData.animations);
    calculateTransforms();
  }
  
  protected void loadAnimations(Iterable<ModelAnimation> paramIterable) {
    for (ModelAnimation modelAnimation : paramIterable) {
      Animation animation = new Animation();
      animation.id = modelAnimation.id;
      for (ModelNodeAnimation modelNodeAnimation : modelAnimation.nodeAnimations) {
        Node node = getNode(modelNodeAnimation.nodeId);
        if (node == null)
          continue; 
        NodeAnimation nodeAnimation = new NodeAnimation();
        nodeAnimation.node = node;
        if (modelNodeAnimation.translation != null) {
          nodeAnimation.translation = new Array();
          nodeAnimation.translation.ensureCapacity(modelNodeAnimation.translation.size);
          for (Vector3 vector3 : modelNodeAnimation.translation) {
            if (vector3.keytime > animation.duration)
              animation.duration = vector3.keytime; 
            Array array = nodeAnimation.translation;
            float f = vector3.keytime;
            if (vector3.value == null) {
              vector3 = node.translation;
            } else {
              vector3 = (Vector3)vector3.value;
            } 
            array.add(new NodeKeyframe(f, new Vector3(vector3)));
          } 
        } 
        if (modelNodeAnimation.rotation != null) {
          nodeAnimation.rotation = new Array();
          nodeAnimation.rotation.ensureCapacity(modelNodeAnimation.rotation.size);
          for (Quaternion quaternion : modelNodeAnimation.rotation) {
            if (quaternion.keytime > animation.duration)
              animation.duration = quaternion.keytime; 
            Array array = nodeAnimation.rotation;
            float f = quaternion.keytime;
            if (quaternion.value == null) {
              quaternion = node.rotation;
            } else {
              quaternion = (Quaternion)quaternion.value;
            } 
            array.add(new NodeKeyframe(f, new Quaternion(quaternion)));
          } 
        } 
        if (modelNodeAnimation.scaling != null) {
          nodeAnimation.scaling = new Array();
          nodeAnimation.scaling.ensureCapacity(modelNodeAnimation.scaling.size);
          for (Vector3 vector3 : modelNodeAnimation.scaling) {
            if (vector3.keytime > animation.duration)
              animation.duration = vector3.keytime; 
            Array array = nodeAnimation.scaling;
            float f = vector3.keytime;
            if (vector3.value == null) {
              vector3 = node.scale;
            } else {
              vector3 = (Vector3)vector3.value;
            } 
            array.add(new NodeKeyframe(f, new Vector3(vector3)));
          } 
        } 
        if ((nodeAnimation.translation != null && nodeAnimation.translation.size > 0) || (nodeAnimation.rotation != null && nodeAnimation.rotation.size > 0) || (nodeAnimation.scaling != null && nodeAnimation.scaling.size > 0))
          animation.nodeAnimations.add(nodeAnimation); 
      } 
      if (animation.nodeAnimations.size > 0)
        this.animations.add(animation); 
    } 
  }
  
  protected void loadMaterials(Iterable<ModelMaterial> paramIterable, TextureProvider paramTextureProvider) {
    for (ModelMaterial modelMaterial : paramIterable)
      this.materials.add(convertMaterial(modelMaterial, paramTextureProvider)); 
  }
  
  protected void loadMeshes(Iterable<ModelMesh> paramIterable) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      convertMesh((ModelMesh)iterator.next()); 
  }
  
  protected Node loadNode(ModelNode paramModelNode) { // Byte code:
    //   0: new com/badlogic/gdx/graphics/g3d/model/Node
    //   3: dup
    //   4: invokespecial <init> : ()V
    //   7: astore_2
    //   8: aload_2
    //   9: aload_1
    //   10: getfield id : Ljava/lang/String;
    //   13: putfield id : Ljava/lang/String;
    //   16: aload_1
    //   17: getfield translation : Lcom/badlogic/gdx/math/Vector3;
    //   20: ifnull -> 35
    //   23: aload_2
    //   24: getfield translation : Lcom/badlogic/gdx/math/Vector3;
    //   27: aload_1
    //   28: getfield translation : Lcom/badlogic/gdx/math/Vector3;
    //   31: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   34: pop
    //   35: aload_1
    //   36: getfield rotation : Lcom/badlogic/gdx/math/Quaternion;
    //   39: ifnull -> 54
    //   42: aload_2
    //   43: getfield rotation : Lcom/badlogic/gdx/math/Quaternion;
    //   46: aload_1
    //   47: getfield rotation : Lcom/badlogic/gdx/math/Quaternion;
    //   50: invokevirtual set : (Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;
    //   53: pop
    //   54: aload_1
    //   55: getfield scale : Lcom/badlogic/gdx/math/Vector3;
    //   58: ifnull -> 73
    //   61: aload_2
    //   62: getfield scale : Lcom/badlogic/gdx/math/Vector3;
    //   65: aload_1
    //   66: getfield scale : Lcom/badlogic/gdx/math/Vector3;
    //   69: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   72: pop
    //   73: aload_1
    //   74: getfield parts : [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;
    //   77: astore_3
    //   78: iconst_0
    //   79: istore #4
    //   81: aload_3
    //   82: ifnull -> 354
    //   85: aload_1
    //   86: getfield parts : [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;
    //   89: astore #5
    //   91: aload #5
    //   93: arraylength
    //   94: istore #6
    //   96: iconst_0
    //   97: istore #7
    //   99: iload #7
    //   101: iload #6
    //   103: if_icmpge -> 354
    //   106: aload #5
    //   108: iload #7
    //   110: aaload
    //   111: astore #8
    //   113: aload #8
    //   115: getfield meshPartId : Ljava/lang/String;
    //   118: astore_3
    //   119: aconst_null
    //   120: astore #9
    //   122: aload_3
    //   123: ifnull -> 174
    //   126: aload_0
    //   127: getfield meshParts : Lcom/badlogic/gdx/utils/Array;
    //   130: invokevirtual iterator : ()Ljava/util/Iterator;
    //   133: astore #10
    //   135: aload #10
    //   137: invokeinterface hasNext : ()Z
    //   142: ifeq -> 174
    //   145: aload #10
    //   147: invokeinterface next : ()Ljava/lang/Object;
    //   152: checkcast com/badlogic/gdx/graphics/g3d/model/MeshPart
    //   155: astore_3
    //   156: aload #8
    //   158: getfield meshPartId : Ljava/lang/String;
    //   161: aload_3
    //   162: getfield id : Ljava/lang/String;
    //   165: invokevirtual equals : (Ljava/lang/Object;)Z
    //   168: ifeq -> 135
    //   171: goto -> 176
    //   174: aconst_null
    //   175: astore_3
    //   176: aload #9
    //   178: astore #10
    //   180: aload #8
    //   182: getfield materialId : Ljava/lang/String;
    //   185: ifnull -> 239
    //   188: aload_0
    //   189: getfield materials : Lcom/badlogic/gdx/utils/Array;
    //   192: invokevirtual iterator : ()Ljava/util/Iterator;
    //   195: astore #11
    //   197: aload #9
    //   199: astore #10
    //   201: aload #11
    //   203: invokeinterface hasNext : ()Z
    //   208: ifeq -> 239
    //   211: aload #11
    //   213: invokeinterface next : ()Ljava/lang/Object;
    //   218: checkcast com/badlogic/gdx/graphics/g3d/Material
    //   221: astore #10
    //   223: aload #8
    //   225: getfield materialId : Ljava/lang/String;
    //   228: aload #10
    //   230: getfield id : Ljava/lang/String;
    //   233: invokevirtual equals : (Ljava/lang/Object;)Z
    //   236: ifeq -> 197
    //   239: aload_3
    //   240: ifnull -> 317
    //   243: aload #10
    //   245: ifnull -> 317
    //   248: aload_3
    //   249: ifnull -> 311
    //   252: aload #10
    //   254: ifnull -> 311
    //   257: new com/badlogic/gdx/graphics/g3d/model/NodePart
    //   260: dup
    //   261: invokespecial <init> : ()V
    //   264: astore #9
    //   266: aload #9
    //   268: aload_3
    //   269: putfield meshPart : Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    //   272: aload #9
    //   274: aload #10
    //   276: putfield material : Lcom/badlogic/gdx/graphics/g3d/Material;
    //   279: aload_2
    //   280: getfield parts : Lcom/badlogic/gdx/utils/Array;
    //   283: aload #9
    //   285: invokevirtual add : (Ljava/lang/Object;)V
    //   288: aload #8
    //   290: getfield bones : Lcom/badlogic/gdx/utils/ArrayMap;
    //   293: ifnull -> 311
    //   296: aload_0
    //   297: getfield nodePartBones : Lcom/badlogic/gdx/utils/ObjectMap;
    //   300: aload #9
    //   302: aload #8
    //   304: getfield bones : Lcom/badlogic/gdx/utils/ArrayMap;
    //   307: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   310: pop
    //   311: iinc #7, 1
    //   314: goto -> 99
    //   317: new java/lang/StringBuilder
    //   320: dup
    //   321: invokespecial <init> : ()V
    //   324: astore_1
    //   325: aload_1
    //   326: ldc_w 'Invalid node: '
    //   329: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   332: pop
    //   333: aload_1
    //   334: aload_2
    //   335: getfield id : Ljava/lang/String;
    //   338: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   341: pop
    //   342: new com/badlogic/gdx/utils/GdxRuntimeException
    //   345: dup
    //   346: aload_1
    //   347: invokevirtual toString : ()Ljava/lang/String;
    //   350: invokespecial <init> : (Ljava/lang/String;)V
    //   353: athrow
    //   354: aload_1
    //   355: getfield children : [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;
    //   358: ifnull -> 400
    //   361: aload_1
    //   362: getfield children : [Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;
    //   365: astore_1
    //   366: aload_1
    //   367: arraylength
    //   368: istore #6
    //   370: iload #4
    //   372: istore #7
    //   374: iload #7
    //   376: iload #6
    //   378: if_icmpge -> 400
    //   381: aload_2
    //   382: aload_0
    //   383: aload_1
    //   384: iload #7
    //   386: aaload
    //   387: invokevirtual loadNode : (Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    //   390: invokevirtual addChild : (Lcom/badlogic/gdx/graphics/g3d/model/Node;)I
    //   393: pop
    //   394: iinc #7, 1
    //   397: goto -> 374
    //   400: aload_2
    //   401: areturn }
  
  protected void loadNodes(Iterable<ModelNode> paramIterable) {
    this.nodePartBones.clear();
    for (ModelNode modelNode : paramIterable)
      this.nodes.add(loadNode(modelNode)); 
    ObjectMap.Entries entries = this.nodePartBones.entries().iterator();
    while (entries.hasNext()) {
      ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
      if (((NodePart)entry.key).invBoneBindTransforms == null)
        ((NodePart)entry.key).invBoneBindTransforms = new ArrayMap(Node.class, Matrix4.class); 
      ((NodePart)entry.key).invBoneBindTransforms.clear();
      for (ObjectMap.Entry entry1 : ((ArrayMap)entry.value).entries())
        ((NodePart)entry.key).invBoneBindTransforms.put(getNode((String)entry1.key), (new Matrix4((Matrix4)entry1.value)).inv()); 
    } 
  }
  
  public void manageDisposable(Disposable paramDisposable) {
    if (!this.disposables.contains(paramDisposable, true))
      this.disposables.add(paramDisposable); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Model.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */