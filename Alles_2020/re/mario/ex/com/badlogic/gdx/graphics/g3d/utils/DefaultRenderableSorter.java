package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import java.util.Comparator;

public class DefaultRenderableSorter extends Object implements RenderableSorter, Comparator<Renderable> {
  private Camera camera;
  
  private final Vector3 tmpV1 = new Vector3();
  
  private final Vector3 tmpV2 = new Vector3();
  
  private Vector3 getTranslation(Matrix4 paramMatrix4, Vector3 paramVector31, Vector3 paramVector32) {
    if (paramVector31.isZero()) {
      paramMatrix4.getTranslation(paramVector32);
    } else if (!paramMatrix4.hasRotationOrScaling()) {
      paramMatrix4.getTranslation(paramVector32).add(paramVector31);
    } else {
      paramVector32.set(paramVector31).mul(paramMatrix4);
    } 
    return paramVector32;
  }
  
  public int compare(Renderable paramRenderable1, Renderable paramRenderable2) {
    byte b2;
    boolean bool1;
    boolean bool = paramRenderable1.material.has(BlendingAttribute.Type);
    byte b1 = 0;
    byte b = 1;
    if (bool && ((BlendingAttribute)paramRenderable1.material.get(BlendingAttribute.Type)).blended) {
      bool1 = true;
    } else {
      bool1 = false;
    } 
    if (paramRenderable2.material.has(BlendingAttribute.Type) && ((BlendingAttribute)paramRenderable2.material.get(BlendingAttribute.Type)).blended) {
      b2 = 1;
    } else {
      b2 = 0;
    } 
    if (bool1 != b2) {
      if (bool1) {
        b2 = b;
      } else {
        b2 = -1;
      } 
      return b2;
    } 
    getTranslation(paramRenderable1.worldTransform, paramRenderable1.meshPart.center, this.tmpV1);
    getTranslation(paramRenderable2.worldTransform, paramRenderable2.meshPart.center, this.tmpV2);
    float f = ((int)(this.camera.position.dst2(this.tmpV1) * 1000.0F) - (int)(this.camera.position.dst2(this.tmpV2) * 1000.0F));
    if (f < 0.0F) {
      b2 = -1;
    } else {
      b2 = b1;
      if (f > 0.0F)
        b2 = 1; 
    } 
    b1 = b2;
    if (bool1)
      b1 = -b2; 
    return b1;
  }
  
  public void sort(Camera paramCamera, Array<Renderable> paramArray) {
    this.camera = paramCamera;
    paramArray.sort(this);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */