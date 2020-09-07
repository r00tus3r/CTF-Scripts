package com.uwsoft.editor.renderer.spine;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import com.uwsoft.editor.renderer.data.SpineVO;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import java.lang.reflect.InvocationTargetException;

public class SpineDataHelper {
  public float height;
  
  private float minX;
  
  private float minY;
  
  private SpineReflectionHelper reflectionData;
  
  private Object renderer;
  
  private Object skeletonData;
  
  private Object skeletonObject;
  
  public Object stateObject;
  
  public float width;
  
  private void computeBoundBox() {
    this.reflectionData.updateWorldTransformMethodIndex.invoke(this.skeletonObject, new Object[0]);
    this.minX = Float.MAX_VALUE;
    this.minY = Float.MAX_VALUE;
    Array array = (Array)this.reflectionData.getSlotsMethodIndex.invoke(this.skeletonObject, new Object[0]);
    int i = array.size;
    byte b = 0;
    float f1 = Float.MIN_VALUE;
    float f2 = Float.MIN_VALUE;
    while (b < i) {
      Object object1 = array.get(b);
      Object object2 = this.reflectionData.getAttachmentMethodIndex.invoke(object1, new Object[0]);
      if (object2 != null && this.reflectionData.regionAttachmentClass.isInstance(object2)) {
        this.reflectionData.updateWorldVerticesMethodIndex.invoke(object2, new Object[] { object1, Boolean.valueOf(false) });
        float[] arrayOfFloat = (float[])this.reflectionData.getWorldVerticesIndex.invoke(object2, new Object[0]);
        int j = arrayOfFloat.length;
        for (boolean bool = false; bool < j; bool += true) {
          this.minX = Math.min(this.minX, arrayOfFloat[bool]);
          float f = this.minY;
          boolean bool1 = bool + true;
          this.minY = Math.min(f, arrayOfFloat[bool1]);
          f1 = Math.max(f1, arrayOfFloat[bool]);
          f2 = Math.max(f2, arrayOfFloat[bool1]);
        } 
      } 
      b++;
    } 
    this.width = f1 - this.minX;
    this.height = f2 - this.minY;
  }
  
  public void act(float paramFloat1, float paramFloat2, float paramFloat3) {
    try {
      this.reflectionData.updateWorldTransformMethodIndex.invoke(this.skeletonObject, new Object[0]);
      this.reflectionData.updateMethodIndex.invoke(this.stateObject, new Object[] { Float.valueOf(paramFloat1) });
      this.reflectionData.applyMethodIndex.invoke(this.stateObject, new Object[] { this.skeletonObject });
      this.reflectionData.setPositionMethodIndex.invoke(this.skeletonObject, new Object[] { Float.valueOf(paramFloat2 - this.minX), Float.valueOf(paramFloat3 - this.minY) });
    } catch (ReflectionException reflectionException) {}
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    try {
      this.reflectionData.skeletonRendererDrawMethodIndex.invoke(this.renderer, new Object[] { paramBatch, this.skeletonObject });
    } catch (ReflectionException paramBatch) {}
  }
  
  public Array<Object> getAnimations() {
    try {
      return (Array)this.reflectionData.getAnimationMethodIndex.invoke(this.skeletonData, new Object[0]);
    } catch (ReflectionException reflectionException) {
      reflectionException.printStackTrace();
      return null;
    } 
  }
  
  public void initSpine(SpineVO paramSpineVO, IResourceRetriever paramIResourceRetriever, SpineReflectionHelper paramSpineReflectionHelper, float paramFloat) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, ReflectionException {
    this.renderer = paramSpineReflectionHelper.skeletonRendererObject;
    this.reflectionData = paramSpineReflectionHelper;
    Object object2 = this.reflectionData.skeletonJsonConstructorAccess.newInstance(new Object[] { paramIResourceRetriever.getSkeletonAtlas(paramSpineVO.animationName) });
    ClassReflection.getMethod(this.reflectionData.skeletonJsonClass, "setScale", new Class[] { float.class }).invoke(object2, new Object[] { Float.valueOf(paramSpineVO.scaleX * paramFloat) });
    this.skeletonData = ClassReflection.getMethod(this.reflectionData.skeletonJsonClass, "readSkeletonData", new Class[] { com.badlogic.gdx.files.FileHandle.class }).invoke(object2, new Object[] { paramIResourceRetriever.getSkeletonJSON(paramSpineVO.animationName) });
    this.skeletonObject = this.reflectionData.skeletonConstructorAccess.newInstance(new Object[] { this.skeletonData });
    Object object1 = this.reflectionData.animationStateDataConstructorAccess.newInstance(new Object[] { this.skeletonData });
    computeBoundBox();
    this.stateObject = this.reflectionData.animationStateConstructorAccess.newInstance(new Object[] { object1 });
    object1 = ((Array)this.reflectionData.getAnimationMethodIndex.invoke(this.skeletonData, new Object[0])).get(0);
    setAnimation((String)this.reflectionData.getAnimNameMethodIndex.invoke(object1, new Object[0]));
  }
  
  public void setAnimation(String paramString) {
    if (paramString == null) {
      System.out.println("NO ANIM NAME");
      return;
    } 
    try {
      this.reflectionData.setAnimationMethodIndex.invoke(this.stateObject, new Object[] { Integer.valueOf(0), paramString, Boolean.valueOf(true) });
    } catch (ReflectionException paramString) {
      paramString.printStackTrace();
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/spine/SpineDataHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */