package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.NodeKeyframe;
import com.badlogic.gdx.graphics.g3d.model.NodePart;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ArrayMap;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class ModelInstance implements RenderableProvider {
  public static boolean defaultShareKeyframes = true;
  
  public final Array<Animation> animations = new Array();
  
  public final Array<Material> materials = new Array();
  
  public final Model model;
  
  public final Array<Node> nodes = new Array();
  
  public Matrix4 transform;
  
  public Object userData;
  
  static  {
  
  }
  
  public ModelInstance(Model paramModel) { this(paramModel, (String[])null); }
  
  public ModelInstance(Model paramModel, float paramFloat1, float paramFloat2, float paramFloat3) {
    this(paramModel);
    this.transform.setToTranslation(paramFloat1, paramFloat2, paramFloat3);
  }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4) { this(paramModel, paramMatrix4, (String[])null); }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, Array<String> paramArray) { this(paramModel, paramMatrix4, paramArray, defaultShareKeyframes); }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, Array<String> paramArray, boolean paramBoolean) {
    this.model = paramModel;
    Matrix4 matrix4 = paramMatrix4;
    if (paramMatrix4 == null)
      matrix4 = new Matrix4(); 
    this.transform = matrix4;
    copyNodes(paramModel.nodes, paramArray);
    copyAnimations(paramModel.animations, paramBoolean);
    calculateTransforms();
  }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, String paramString, boolean paramBoolean) { this(paramModel, paramMatrix4, paramString, false, false, paramBoolean); }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, String paramString, boolean paramBoolean1, boolean paramBoolean2) { this(paramModel, paramMatrix4, paramString, true, paramBoolean1, paramBoolean2); }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) { this(paramModel, paramMatrix4, paramString, paramBoolean1, paramBoolean2, paramBoolean3, defaultShareKeyframes); }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4) {
    this.model = paramModel;
    Matrix4 matrix42 = paramMatrix4;
    if (paramMatrix4 == null)
      matrix42 = new Matrix4(); 
    this.transform = matrix42;
    Matrix4 matrix41 = paramModel.getNode(paramString, paramBoolean1);
    Array array = this.nodes;
    Node node = matrix41.copy();
    array.add(node);
    if (paramBoolean3) {
      Matrix4 matrix4 = this.transform;
      if (paramBoolean2) {
        matrix41 = matrix41.globalTransform;
      } else {
        matrix41 = matrix41.localTransform;
      } 
      matrix4.mul(matrix41);
      node.translation.set(0.0F, 0.0F, 0.0F);
      node.rotation.idt();
      node.scale.set(1.0F, 1.0F, 1.0F);
    } else if (paramBoolean2 && node.hasParent()) {
      this.transform.mul((matrix41.getParent()).globalTransform);
    } 
    invalidate();
    copyAnimations(paramModel.animations, paramBoolean4);
    calculateTransforms();
  }
  
  public ModelInstance(Model paramModel, Matrix4 paramMatrix4, String... paramVarArgs) {
    this.model = paramModel;
    Matrix4 matrix4 = paramMatrix4;
    if (paramMatrix4 == null)
      matrix4 = new Matrix4(); 
    this.transform = matrix4;
    if (paramVarArgs == null) {
      copyNodes(paramModel.nodes);
    } else {
      copyNodes(paramModel.nodes, paramVarArgs);
    } 
    copyAnimations(paramModel.animations, defaultShareKeyframes);
    calculateTransforms();
  }
  
  public ModelInstance(Model paramModel, Vector3 paramVector3) {
    this(paramModel);
    this.transform.setToTranslation(paramVector3);
  }
  
  public ModelInstance(Model paramModel, Array<String> paramArray) { this(paramModel, null, paramArray); }
  
  public ModelInstance(Model paramModel, String paramString, boolean paramBoolean) { this(paramModel, null, paramString, false, false, paramBoolean); }
  
  public ModelInstance(Model paramModel, String paramString, boolean paramBoolean1, boolean paramBoolean2) { this(paramModel, null, paramString, true, paramBoolean1, paramBoolean2); }
  
  public ModelInstance(Model paramModel, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) { this(paramModel, null, paramString, paramBoolean1, paramBoolean2, paramBoolean3); }
  
  public ModelInstance(Model paramModel, String... paramVarArgs) { this(paramModel, null, paramVarArgs); }
  
  public ModelInstance(ModelInstance paramModelInstance) { this(paramModelInstance, paramModelInstance.transform.cpy()); }
  
  public ModelInstance(ModelInstance paramModelInstance, Matrix4 paramMatrix4) { this(paramModelInstance, paramMatrix4, defaultShareKeyframes); }
  
  public ModelInstance(ModelInstance paramModelInstance, Matrix4 paramMatrix4, boolean paramBoolean) {
    this.model = paramModelInstance.model;
    Matrix4 matrix4 = paramMatrix4;
    if (paramMatrix4 == null)
      matrix4 = new Matrix4(); 
    this.transform = matrix4;
    copyNodes(paramModelInstance.nodes);
    copyAnimations(paramModelInstance.animations, paramBoolean);
    calculateTransforms();
  }
  
  private void copyNodes(Array<Node> paramArray) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      this.nodes.add(node.copy());
    } 
    invalidate();
  }
  
  private void copyNodes(Array<Node> paramArray1, Array<String> paramArray2) {
    int i = paramArray1.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray1.get(b);
      Iterator iterator = paramArray2.iterator();
      while (iterator.hasNext()) {
        if (((String)iterator.next()).equals(node.id)) {
          this.nodes.add(node.copy());
          break;
        } 
      } 
    } 
    invalidate();
  }
  
  private void copyNodes(Array<Node> paramArray, String... paramVarArgs) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      int j = paramVarArgs.length;
      for (byte b1 = 0; b1 < j; b1++) {
        if (paramVarArgs[b1].equals(node.id)) {
          this.nodes.add(node.copy());
          break;
        } 
      } 
    } 
    invalidate();
  }
  
  private void invalidate() {
    int i = this.nodes.size;
    for (byte b = 0; b < i; b++)
      invalidate((Node)this.nodes.get(b)); 
  }
  
  private void invalidate(Node paramNode) {
    int i = paramNode.parts.size;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      NodePart nodePart = (NodePart)paramNode.parts.get(b2);
      ArrayMap arrayMap = nodePart.invBoneBindTransforms;
      if (arrayMap != null)
        for (byte b = 0; b < arrayMap.size; b++)
          (Node[])arrayMap.keys[b] = getNode(((Node[])arrayMap.keys[b]).id);  
      if (!this.materials.contains(nodePart.material, true)) {
        int k = this.materials.indexOf(nodePart.material, false);
        if (k < 0) {
          Array array = this.materials;
          Material material = nodePart.material.copy();
          nodePart.material = material;
          array.add(material);
        } else {
          nodePart.material = (Material)this.materials.get(k);
        } 
      } 
    } 
    int j = paramNode.getChildCount();
    for (b2 = b1; b2 < j; b2++)
      invalidate(paramNode.getChild(b2)); 
  }
  
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
  
  public ModelInstance copy() { return new ModelInstance(this); }
  
  public void copyAnimation(Animation paramAnimation) { copyAnimation(paramAnimation, defaultShareKeyframes); }
  
  public void copyAnimation(Animation paramAnimation, boolean paramBoolean) {
    Animation animation = new Animation();
    animation.id = paramAnimation.id;
    animation.duration = paramAnimation.duration;
    for (NodeAnimation nodeAnimation1 : paramAnimation.nodeAnimations) {
      Node node = getNode(nodeAnimation1.node.id);
      if (node == null)
        continue; 
      NodeAnimation nodeAnimation2 = new NodeAnimation();
      nodeAnimation2.node = node;
      if (paramBoolean) {
        nodeAnimation2.translation = nodeAnimation1.translation;
        nodeAnimation2.rotation = nodeAnimation1.rotation;
        nodeAnimation2.scaling = nodeAnimation1.scaling;
      } else {
        if (nodeAnimation1.translation != null) {
          nodeAnimation2.translation = new Array();
          for (NodeKeyframe nodeKeyframe : nodeAnimation1.translation)
            nodeAnimation2.translation.add(new NodeKeyframe(nodeKeyframe.keytime, nodeKeyframe.value)); 
        } 
        if (nodeAnimation1.rotation != null) {
          nodeAnimation2.rotation = new Array();
          for (NodeKeyframe nodeKeyframe : nodeAnimation1.rotation)
            nodeAnimation2.rotation.add(new NodeKeyframe(nodeKeyframe.keytime, nodeKeyframe.value)); 
        } 
        if (nodeAnimation1.scaling != null) {
          nodeAnimation2.scaling = new Array();
          for (NodeKeyframe nodeKeyframe : nodeAnimation1.scaling)
            nodeAnimation2.scaling.add(new NodeKeyframe(nodeKeyframe.keytime, nodeKeyframe.value)); 
        } 
      } 
      if (nodeAnimation2.translation != null || nodeAnimation2.rotation != null || nodeAnimation2.scaling != null)
        animation.nodeAnimations.add(nodeAnimation2); 
    } 
    if (animation.nodeAnimations.size > 0)
      this.animations.add(animation); 
  }
  
  public void copyAnimations(Iterable<Animation> paramIterable) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      copyAnimation((Animation)iterator.next(), defaultShareKeyframes); 
  }
  
  public void copyAnimations(Iterable<Animation> paramIterable, boolean paramBoolean) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      copyAnimation((Animation)iterator.next(), paramBoolean); 
  }
  
  public BoundingBox extendBoundingBox(BoundingBox paramBoundingBox) {
    int i = this.nodes.size;
    for (byte b = 0; b < i; b++)
      ((Node)this.nodes.get(b)).extendBoundingBox(paramBoundingBox); 
    return paramBoundingBox;
  }
  
  public Animation getAnimation(String paramString) { return getAnimation(paramString, false); }
  
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
  
  public Renderable getRenderable(Renderable paramRenderable) { return getRenderable(paramRenderable, (Node)this.nodes.get(0)); }
  
  public Renderable getRenderable(Renderable paramRenderable, Node paramNode) { return getRenderable(paramRenderable, paramNode, (NodePart)paramNode.parts.get(0)); }
  
  public Renderable getRenderable(Renderable paramRenderable, Node paramNode, NodePart paramNodePart) {
    paramNodePart.setRenderable(paramRenderable);
    if (paramNodePart.bones == null && this.transform != null) {
      paramRenderable.worldTransform.set(this.transform).mul(paramNode.globalTransform);
    } else if (this.transform != null) {
      paramRenderable.worldTransform.set(this.transform);
    } else {
      paramRenderable.worldTransform.idt();
    } 
    paramRenderable.userData = this.userData;
    return paramRenderable;
  }
  
  protected void getRenderables(Node paramNode, Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    if (paramNode.parts.size > 0)
      for (NodePart nodePart : paramNode.parts) {
        if (nodePart.enabled)
          paramArray.add(getRenderable((Renderable)paramPool.obtain(), paramNode, nodePart)); 
      }  
    Iterator iterator = paramNode.getChildren().iterator();
    while (iterator.hasNext())
      getRenderables((Node)iterator.next(), paramArray, paramPool); 
  }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    Iterator iterator = this.nodes.iterator();
    while (iterator.hasNext())
      getRenderables((Node)iterator.next(), paramArray, paramPool); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/ModelInstance.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */