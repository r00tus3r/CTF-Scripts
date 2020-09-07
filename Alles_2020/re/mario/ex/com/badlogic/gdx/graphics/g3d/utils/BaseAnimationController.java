package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.NodeKeyframe;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class BaseAnimationController {
  private static final Transform tmpT;
  
  private static final ObjectMap<Node, Transform> transforms = new ObjectMap();
  
  private boolean applying = false;
  
  public final ModelInstance target;
  
  private final Pool<Transform> transformPool = new Pool<Transform>() {
      protected BaseAnimationController.Transform newObject() { return new BaseAnimationController.Transform(); }
    };
  
  static  {
    tmpT = new Transform();
  }
  
  public BaseAnimationController(ModelInstance paramModelInstance) { this.target = paramModelInstance; }
  
  protected static void applyAnimation(ObjectMap<Node, Transform> paramObjectMap, Pool<Transform> paramPool, float paramFloat1, Animation paramAnimation, float paramFloat2) {
    Iterator iterator;
    if (paramObjectMap == null) {
      iterator = paramAnimation.nodeAnimations.iterator();
      while (iterator.hasNext())
        applyNodeAnimationDirectly((NodeAnimation)iterator.next(), paramFloat2); 
    } else {
      ObjectMap.Keys keys = iterator.keys().iterator();
      while (keys.hasNext())
        ((Node)keys.next()).isAnimated = false; 
      Iterator iterator1 = paramAnimation.nodeAnimations.iterator();
      while (iterator1.hasNext())
        applyNodeAnimationBlending((NodeAnimation)iterator1.next(), iterator, paramPool, paramFloat1, paramFloat2); 
      ObjectMap.Entries entries = iterator.entries().iterator();
      while (entries.hasNext()) {
        ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
        if (!((Node)entry.key).isAnimated) {
          ((Node)entry.key).isAnimated = true;
          ((Transform)entry.value).lerp(((Node)entry.key).translation, ((Node)entry.key).rotation, ((Node)entry.key).scale, paramFloat1);
        } 
      } 
    } 
  }
  
  private static final void applyNodeAnimationBlending(NodeAnimation paramNodeAnimation, ObjectMap<Node, Transform> paramObjectMap, Pool<Transform> paramPool, float paramFloat1, float paramFloat2) {
    Node node = paramNodeAnimation.node;
    node.isAnimated = true;
    Transform transform1 = getNodeAnimationTransform(paramNodeAnimation, paramFloat2);
    Transform transform2 = (Transform)paramObjectMap.get(node, null);
    if (transform2 != null) {
      if (paramFloat1 > 0.999999F) {
        transform2.set(transform1);
      } else {
        transform2.lerp(transform1, paramFloat1);
      } 
    } else if (paramFloat1 > 0.999999F) {
      paramObjectMap.put(node, ((Transform)paramPool.obtain()).set(transform1));
    } else {
      paramObjectMap.put(node, ((Transform)paramPool.obtain()).set(node.translation, node.rotation, node.scale).lerp(transform1, paramFloat1));
    } 
  }
  
  private static final void applyNodeAnimationDirectly(NodeAnimation paramNodeAnimation, float paramFloat) {
    Node node = paramNodeAnimation.node;
    node.isAnimated = true;
    getNodeAnimationTransform(paramNodeAnimation, paramFloat).toMatrix4(node.localTransform);
  }
  
  static final <T> int getFirstKeyframeIndexAtTime(Array<NodeKeyframe<T>> paramArray, float paramFloat) {
    int i = paramArray.size - 1;
    byte b = 0;
    int j = 0;
    int k = b;
    if (i > 0) {
      k = b;
      if (paramFloat >= ((NodeKeyframe)paramArray.get(0)).keytime) {
        int m = i;
        if (paramFloat > ((NodeKeyframe)paramArray.get(i)).keytime) {
          k = b;
        } else {
          while (true) {
            k = j;
            if (j < m) {
              i = (j + m) / 2;
              k = i + 1;
              if (paramFloat > ((NodeKeyframe)paramArray.get(k)).keytime) {
                j = k;
                continue;
              } 
              if (paramFloat < ((NodeKeyframe)paramArray.get(i)).keytime) {
                m = i - 1;
                continue;
              } 
              return i;
            } 
            break;
          } 
        } 
      } 
    } 
    return k;
  }
  
  private static final Transform getNodeAnimationTransform(NodeAnimation paramNodeAnimation, float paramFloat) {
    Transform transform = tmpT;
    getTranslationAtTime(paramNodeAnimation, paramFloat, transform.translation);
    getRotationAtTime(paramNodeAnimation, paramFloat, transform.rotation);
    getScalingAtTime(paramNodeAnimation, paramFloat, transform.scale);
    return transform;
  }
  
  private static final Quaternion getRotationAtTime(NodeAnimation paramNodeAnimation, float paramFloat, Quaternion paramQuaternion) {
    if (paramNodeAnimation.rotation == null)
      return paramQuaternion.set(paramNodeAnimation.node.rotation); 
    if (paramNodeAnimation.rotation.size == 1)
      return paramQuaternion.set((Quaternion)((NodeKeyframe)paramNodeAnimation.rotation.get(0)).value); 
    int i = getFirstKeyframeIndexAtTime(paramNodeAnimation.rotation, paramFloat);
    NodeKeyframe nodeKeyframe = (NodeKeyframe)paramNodeAnimation.rotation.get(i);
    paramQuaternion.set((Quaternion)nodeKeyframe.value);
    if (++i < paramNodeAnimation.rotation.size) {
      NodeKeyframe nodeKeyframe1 = (NodeKeyframe)paramNodeAnimation.rotation.get(i);
      paramFloat = (paramFloat - nodeKeyframe.keytime) / (nodeKeyframe1.keytime - nodeKeyframe.keytime);
      paramQuaternion.slerp((Quaternion)nodeKeyframe1.value, paramFloat);
    } 
    return paramQuaternion;
  }
  
  private static final Vector3 getScalingAtTime(NodeAnimation paramNodeAnimation, float paramFloat, Vector3 paramVector3) {
    if (paramNodeAnimation.scaling == null)
      return paramVector3.set(paramNodeAnimation.node.scale); 
    if (paramNodeAnimation.scaling.size == 1)
      return paramVector3.set((Vector3)((NodeKeyframe)paramNodeAnimation.scaling.get(0)).value); 
    int i = getFirstKeyframeIndexAtTime(paramNodeAnimation.scaling, paramFloat);
    NodeKeyframe nodeKeyframe = (NodeKeyframe)paramNodeAnimation.scaling.get(i);
    paramVector3.set((Vector3)nodeKeyframe.value);
    if (++i < paramNodeAnimation.scaling.size) {
      NodeKeyframe nodeKeyframe1 = (NodeKeyframe)paramNodeAnimation.scaling.get(i);
      paramFloat = (paramFloat - nodeKeyframe.keytime) / (nodeKeyframe1.keytime - nodeKeyframe.keytime);
      paramVector3.lerp((Vector3)nodeKeyframe1.value, paramFloat);
    } 
    return paramVector3;
  }
  
  private static final Vector3 getTranslationAtTime(NodeAnimation paramNodeAnimation, float paramFloat, Vector3 paramVector3) {
    if (paramNodeAnimation.translation == null)
      return paramVector3.set(paramNodeAnimation.node.translation); 
    if (paramNodeAnimation.translation.size == 1)
      return paramVector3.set((Vector3)((NodeKeyframe)paramNodeAnimation.translation.get(0)).value); 
    int i = getFirstKeyframeIndexAtTime(paramNodeAnimation.translation, paramFloat);
    NodeKeyframe nodeKeyframe = (NodeKeyframe)paramNodeAnimation.translation.get(i);
    paramVector3.set((Vector3)nodeKeyframe.value);
    if (++i < paramNodeAnimation.translation.size) {
      NodeKeyframe nodeKeyframe1 = (NodeKeyframe)paramNodeAnimation.translation.get(i);
      paramFloat = (paramFloat - nodeKeyframe.keytime) / (nodeKeyframe1.keytime - nodeKeyframe.keytime);
      paramVector3.lerp((Vector3)nodeKeyframe1.value, paramFloat);
    } 
    return paramVector3;
  }
  
  protected void apply(Animation paramAnimation, float paramFloat1, float paramFloat2) {
    if (this.applying) {
      applyAnimation(transforms, this.transformPool, paramFloat2, paramAnimation, paramFloat1);
      return;
    } 
    throw new GdxRuntimeException("You must call begin() before adding an animation");
  }
  
  protected void applyAnimation(Animation paramAnimation, float paramFloat) {
    if (!this.applying) {
      applyAnimation(null, null, 1.0F, paramAnimation, paramFloat);
      this.target.calculateTransforms();
      return;
    } 
    throw new GdxRuntimeException("Call end() first");
  }
  
  protected void applyAnimations(Animation paramAnimation1, float paramFloat1, Animation paramAnimation2, float paramFloat2, float paramFloat3) {
    if (paramAnimation2 == null || paramFloat3 == 0.0F) {
      applyAnimation(paramAnimation1, paramFloat1);
      return;
    } 
    if (paramAnimation1 == null || paramFloat3 == 1.0F) {
      applyAnimation(paramAnimation2, paramFloat2);
      return;
    } 
    if (!this.applying) {
      begin();
      apply(paramAnimation1, paramFloat1, 1.0F);
      apply(paramAnimation2, paramFloat2, paramFloat3);
      end();
    } else {
      throw new GdxRuntimeException("Call end() first");
    } 
  }
  
  protected void begin() {
    if (!this.applying) {
      this.applying = true;
      return;
    } 
    throw new GdxRuntimeException("You must call end() after each call to being()");
  }
  
  protected void end() {
    if (this.applying) {
      ObjectMap.Entries entries = transforms.entries().iterator();
      while (entries.hasNext()) {
        ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
        ((Transform)entry.value).toMatrix4(((Node)entry.key).localTransform);
        this.transformPool.free(entry.value);
      } 
      transforms.clear();
      this.target.calculateTransforms();
      this.applying = false;
      return;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("You must call begin() first");
    throw gdxRuntimeException;
  }
  
  protected void removeAnimation(Animation paramAnimation) {
    Iterator iterator = paramAnimation.nodeAnimations.iterator();
    while (iterator.hasNext())
      ((NodeAnimation)iterator.next()).node.isAnimated = false; 
  }
  
  public static final class Transform implements Pool.Poolable {
    public final Quaternion rotation = new Quaternion();
    
    public final Vector3 scale = new Vector3(1.0F, 1.0F, 1.0F);
    
    public final Vector3 translation = new Vector3();
    
    public Transform idt() {
      this.translation.set(0.0F, 0.0F, 0.0F);
      this.rotation.idt();
      this.scale.set(1.0F, 1.0F, 1.0F);
      return this;
    }
    
    public Transform lerp(Transform param1Transform, float param1Float) { return lerp(param1Transform.translation, param1Transform.rotation, param1Transform.scale, param1Float); }
    
    public Transform lerp(Vector3 param1Vector31, Quaternion param1Quaternion, Vector3 param1Vector32, float param1Float) {
      this.translation.lerp(param1Vector31, param1Float);
      this.rotation.slerp(param1Quaternion, param1Float);
      this.scale.lerp(param1Vector32, param1Float);
      return this;
    }
    
    public void reset() { idt(); }
    
    public Transform set(Transform param1Transform) { return set(param1Transform.translation, param1Transform.rotation, param1Transform.scale); }
    
    public Transform set(Vector3 param1Vector31, Quaternion param1Quaternion, Vector3 param1Vector32) {
      this.translation.set(param1Vector31);
      this.rotation.set(param1Quaternion);
      this.scale.set(param1Vector32);
      return this;
    }
    
    public Matrix4 toMatrix4(Matrix4 param1Matrix4) { return param1Matrix4.set(this.translation, this.rotation, this.scale); }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(this.translation.toString());
      stringBuilder.append(" - ");
      stringBuilder.append(this.rotation.toString());
      stringBuilder.append(" - ");
      stringBuilder.append(this.scale.toString());
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/BaseAnimationController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */