package com.badlogic.gdx.graphics.g3d.model;

import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class Node {
  private final Array<Node> children = new Array(2);
  
  public final Matrix4 globalTransform = new Matrix4();
  
  public String id;
  
  public boolean inheritTransform = true;
  
  public boolean isAnimated;
  
  public final Matrix4 localTransform = new Matrix4();
  
  protected Node parent;
  
  public Array<NodePart> parts = new Array(2);
  
  public final Quaternion rotation = new Quaternion(0.0F, 0.0F, 0.0F, 1.0F);
  
  public final Vector3 scale = new Vector3(1.0F, 1.0F, 1.0F);
  
  public final Vector3 translation = new Vector3();
  
  public static Node getNode(Array<Node> paramArray, String paramString, boolean paramBoolean1, boolean paramBoolean2) {
    int i = paramArray.size;
    boolean bool = false;
    if (paramBoolean2) {
      for (byte b = 0; b < i; b++) {
        Node node = (Node)paramArray.get(b);
        if (node.id.equalsIgnoreCase(paramString))
          return node; 
      } 
    } else {
      for (byte b = 0; b < i; b++) {
        Node node = (Node)paramArray.get(b);
        if (node.id.equals(paramString))
          return node; 
      } 
    } 
    if (paramBoolean1)
      for (byte b = bool; b < i; b++) {
        Node node = getNode(((Node)paramArray.get(b)).children, paramString, true, paramBoolean2);
        if (node != null)
          return node; 
      }  
    return null;
  }
  
  public <T extends Node> int addChild(T paramT) { return insertChild(-1, paramT); }
  
  public <T extends Node> int addChildren(Iterable<T> paramIterable) { return insertChildren(-1, paramIterable); }
  
  public <T extends Node> void attachTo(T paramT) { paramT.addChild(this); }
  
  public void calculateBoneTransforms(boolean paramBoolean) {
    for (NodePart nodePart : this.parts) {
      if (nodePart.invBoneBindTransforms == null || nodePart.bones == null || nodePart.invBoneBindTransforms.size != nodePart.bones.length)
        continue; 
      int i = nodePart.invBoneBindTransforms.size;
      for (byte b = 0; b < i; b++)
        nodePart.bones[b].set(((Node[])nodePart.invBoneBindTransforms.keys[b]).globalTransform).mul((Matrix4[])nodePart.invBoneBindTransforms.values[b]); 
    } 
    if (paramBoolean) {
      Iterator iterator = this.children.iterator();
      while (iterator.hasNext())
        ((Node)iterator.next()).calculateBoneTransforms(true); 
    } 
  }
  
  public BoundingBox calculateBoundingBox(BoundingBox paramBoundingBox) {
    paramBoundingBox.inf();
    return extendBoundingBox(paramBoundingBox);
  }
  
  public BoundingBox calculateBoundingBox(BoundingBox paramBoundingBox, boolean paramBoolean) {
    paramBoundingBox.inf();
    return extendBoundingBox(paramBoundingBox, paramBoolean);
  }
  
  public Matrix4 calculateLocalTransform() {
    if (!this.isAnimated)
      this.localTransform.set(this.translation, this.rotation, this.scale); 
    return this.localTransform;
  }
  
  public void calculateTransforms(boolean paramBoolean) {
    calculateLocalTransform();
    calculateWorldTransform();
    if (paramBoolean) {
      Iterator iterator = this.children.iterator();
      while (iterator.hasNext())
        ((Node)iterator.next()).calculateTransforms(true); 
    } 
  }
  
  public Matrix4 calculateWorldTransform() {
    if (this.inheritTransform) {
      Node node = this.parent;
      if (node != null) {
        this.globalTransform.set(node.globalTransform).mul(this.localTransform);
        return this.globalTransform;
      } 
    } 
    this.globalTransform.set(this.localTransform);
    return this.globalTransform;
  }
  
  public Node copy() { return (new Node()).set(this); }
  
  public void detach() {
    Node node = this.parent;
    if (node != null) {
      node.removeChild(this);
      this.parent = null;
    } 
  }
  
  public BoundingBox extendBoundingBox(BoundingBox paramBoundingBox) { return extendBoundingBox(paramBoundingBox, true); }
  
  public BoundingBox extendBoundingBox(BoundingBox paramBoundingBox, boolean paramBoolean) {
    int i = this.parts.size;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      NodePart nodePart = (NodePart)this.parts.get(b2);
      if (nodePart.enabled) {
        MeshPart meshPart = nodePart.meshPart;
        if (paramBoolean) {
          meshPart.mesh.extendBoundingBox(paramBoundingBox, meshPart.offset, meshPart.size, this.globalTransform);
        } else {
          meshPart.mesh.extendBoundingBox(paramBoundingBox, meshPart.offset, meshPart.size);
        } 
      } 
    } 
    i = this.children.size;
    for (b2 = b1; b2 < i; b2++)
      ((Node)this.children.get(b2)).extendBoundingBox(paramBoundingBox); 
    return paramBoundingBox;
  }
  
  public Node getChild(int paramInt) { return (Node)this.children.get(paramInt); }
  
  public Node getChild(String paramString, boolean paramBoolean1, boolean paramBoolean2) { return getNode(this.children, paramString, paramBoolean1, paramBoolean2); }
  
  public int getChildCount() { return this.children.size; }
  
  public Iterable<Node> getChildren() { return this.children; }
  
  public Node getParent() { return this.parent; }
  
  public boolean hasChildren() {
    boolean bool;
    Array array = this.children;
    if (array != null && array.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasParent() {
    boolean bool;
    if (this.parent != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public <T extends Node> int insertChild(int paramInt, T paramT) {
    Node node = this;
    while (node != null) {
      if (node != paramT) {
        node = node.getParent();
        continue;
      } 
      throw new GdxRuntimeException("Cannot add a parent as a child");
    } 
    node = paramT.getParent();
    if (node == null || node.removeChild(paramT)) {
      if (paramInt < 0 || paramInt >= this.children.size) {
        paramInt = this.children.size;
        this.children.add(paramT);
        paramT.parent = this;
        return paramInt;
      } 
      this.children.insert(paramInt, paramT);
      paramT.parent = this;
      return paramInt;
    } 
    throw new GdxRuntimeException("Could not remove child from its current parent");
  }
  
  public <T extends Node> int insertChildren(int paramInt, Iterable<T> paramIterable) { // Byte code:
    //   0: iload_1
    //   1: iflt -> 17
    //   4: iload_1
    //   5: istore_3
    //   6: iload_1
    //   7: aload_0
    //   8: getfield children : Lcom/badlogic/gdx/utils/Array;
    //   11: getfield size : I
    //   14: if_icmple -> 25
    //   17: aload_0
    //   18: getfield children : Lcom/badlogic/gdx/utils/Array;
    //   21: getfield size : I
    //   24: istore_3
    //   25: aload_2
    //   26: invokeinterface iterator : ()Ljava/util/Iterator;
    //   31: astore_2
    //   32: iload_3
    //   33: istore_1
    //   34: aload_2
    //   35: invokeinterface hasNext : ()Z
    //   40: ifeq -> 64
    //   43: aload_0
    //   44: iload_1
    //   45: aload_2
    //   46: invokeinterface next : ()Ljava/lang/Object;
    //   51: checkcast com/badlogic/gdx/graphics/g3d/model/Node
    //   54: invokevirtual insertChild : (ILcom/badlogic/gdx/graphics/g3d/model/Node;)I
    //   57: pop
    //   58: iinc #1, 1
    //   61: goto -> 34
    //   64: iload_3
    //   65: ireturn }
  
  public <T extends Node> boolean removeChild(T paramT) {
    if (!this.children.removeValue(paramT, true))
      return false; 
    paramT.parent = null;
    return true;
  }
  
  protected Node set(Node paramNode) {
    detach();
    this.id = paramNode.id;
    this.isAnimated = paramNode.isAnimated;
    this.inheritTransform = paramNode.inheritTransform;
    this.translation.set(paramNode.translation);
    this.rotation.set(paramNode.rotation);
    this.scale.set(paramNode.scale);
    this.localTransform.set(paramNode.localTransform);
    this.globalTransform.set(paramNode.globalTransform);
    this.parts.clear();
    for (NodePart nodePart : paramNode.parts)
      this.parts.add(nodePart.copy()); 
    this.children.clear();
    Iterator iterator = paramNode.getChildren().iterator();
    while (iterator.hasNext())
      addChild(((Node)iterator.next()).copy()); 
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/model/Node.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */