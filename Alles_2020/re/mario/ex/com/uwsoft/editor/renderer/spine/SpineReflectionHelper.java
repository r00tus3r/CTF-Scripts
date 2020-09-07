package com.uwsoft.editor.renderer.spine;

import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.Constructor;
import com.badlogic.gdx.utils.reflect.Method;
import com.badlogic.gdx.utils.reflect.ReflectionException;

public class SpineReflectionHelper {
  public Class<?> animationClass;
  
  public Constructor animationStateConstructorAccess;
  
  public Class<?> animationStateDataClass;
  
  public Constructor animationStateDataConstructorAccess;
  
  public Method applyMethodIndex;
  
  public Method getAnimNameMethodIndex;
  
  public Method getAnimationMethodIndex;
  
  public Method getAttachmentMethodIndex;
  
  public Method getSlotsMethodIndex;
  
  public Method getWorldVerticesIndex;
  
  public boolean isSpineAviable = true;
  
  public Class<?> regionAttachmentClass;
  
  public Method setAnimationMethodIndex;
  
  public Method setPositionMethodIndex;
  
  public Class<?> skeletonClass;
  
  public Constructor skeletonConstructorAccess;
  
  private Class<?> skeletonDataClass;
  
  public Class<?> skeletonJsonClass;
  
  public Constructor skeletonJsonConstructorAccess;
  
  private Class<?> skeletonRendererClass;
  
  private Constructor skeletonRendererConstructorAccess;
  
  public Method skeletonRendererDrawMethodIndex;
  
  public Object skeletonRendererObject;
  
  public Class<?> slotClass;
  
  public Class<?> stateClass;
  
  public Method updateMethodIndex;
  
  public Method updateWorldTransformMethodIndex;
  
  public Method updateWorldVerticesMethodIndex;
  
  public SpineReflectionHelper() {
    try {
      this.skeletonJsonClass = ClassReflection.forName("com.esotericsoftware.spine.SkeletonJson");
      this.skeletonClass = ClassReflection.forName("com.esotericsoftware.spine.Skeleton");
      this.skeletonDataClass = ClassReflection.forName("com.esotericsoftware.spine.SkeletonData");
      this.animationStateDataClass = ClassReflection.forName("com.esotericsoftware.spine.AnimationStateData");
      this.stateClass = ClassReflection.forName("com.esotericsoftware.spine.AnimationState");
      this.animationClass = ClassReflection.forName("com.esotericsoftware.spine.Animation");
      this.skeletonRendererClass = ClassReflection.forName("com.esotericsoftware.spine.SkeletonRenderer");
      this.slotClass = ClassReflection.forName("com.esotericsoftware.spine.Slot");
      this.regionAttachmentClass = ClassReflection.forName("com.esotericsoftware.spine.attachments.RegionAttachment");
      this.skeletonJsonConstructorAccess = ClassReflection.getConstructor(this.skeletonJsonClass, new Class[] { com.badlogic.gdx.graphics.g2d.TextureAtlas.class });
      this.skeletonConstructorAccess = ClassReflection.getConstructor(this.skeletonClass, new Class[] { this.skeletonDataClass });
      this.animationStateDataConstructorAccess = ClassReflection.getConstructor(this.animationStateDataClass, new Class[] { this.skeletonDataClass });
      this.animationStateConstructorAccess = ClassReflection.getConstructor(this.stateClass, new Class[] { this.animationStateDataClass });
      this.skeletonRendererConstructorAccess = ClassReflection.getConstructor(this.skeletonRendererClass, new Class[0]);
      this.updateWorldTransformMethodIndex = ClassReflection.getMethod(this.skeletonClass, "updateWorldTransform", new Class[0]);
      this.setPositionMethodIndex = ClassReflection.getMethod(this.skeletonClass, "setPosition", new Class[] { float.class, float.class });
      this.getSlotsMethodIndex = ClassReflection.getMethod(this.skeletonClass, "getSlots", new Class[0]);
      this.getAnimationMethodIndex = ClassReflection.getMethod(this.skeletonDataClass, "getAnimations", new Class[0]);
      this.setAnimationMethodIndex = ClassReflection.getMethod(this.stateClass, "setAnimation", new Class[] { int.class, String.class, boolean.class });
      this.updateMethodIndex = ClassReflection.getMethod(this.stateClass, "update", new Class[] { float.class });
      this.applyMethodIndex = ClassReflection.getMethod(this.stateClass, "apply", new Class[] { this.skeletonClass });
      this.getAnimNameMethodIndex = ClassReflection.getMethod(this.animationClass, "getName", new Class[0]);
      this.getAttachmentMethodIndex = ClassReflection.getMethod(this.slotClass, "getAttachment", new Class[0]);
      this.updateWorldVerticesMethodIndex = ClassReflection.getMethod(this.regionAttachmentClass, "updateWorldVertices", new Class[] { this.slotClass, boolean.class });
      this.getWorldVerticesIndex = ClassReflection.getMethod(this.regionAttachmentClass, "getWorldVertices", new Class[0]);
      this.skeletonRendererDrawMethodIndex = ClassReflection.getMethod(this.skeletonRendererClass, "draw", new Class[] { com.badlogic.gdx.graphics.g2d.Batch.class, this.skeletonClass });
      this.skeletonRendererObject = this.skeletonRendererConstructorAccess.newInstance(new Object[0]);
      return;
    } catch (ReflectionException reflectionException) {
      this.isSpineAviable = false;
      return;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/spine/SpineReflectionHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */