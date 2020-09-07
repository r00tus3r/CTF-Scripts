package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Frustum;
import com.badlogic.gdx.math.Vector3;

public class FrustumShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, Camera paramCamera) { build(paramMeshPartBuilder, paramCamera, tmpColor0.set(1.0F, 0.66F, 0.0F, 1.0F), tmpColor1.set(1.0F, 0.0F, 0.0F, 1.0F), tmpColor2.set(0.0F, 0.66F, 1.0F, 1.0F), tmpColor3.set(1.0F, 1.0F, 1.0F, 1.0F), tmpColor4.set(0.2F, 0.2F, 0.2F, 1.0F)); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, Camera paramCamera, Color paramColor1, Color paramColor2, Color paramColor3, Color paramColor4, Color paramColor5) {
    Vector3[] arrayOfVector3 = paramCamera.frustum.planePoints;
    build(paramMeshPartBuilder, paramCamera.frustum, paramColor1, paramColor5);
    paramMeshPartBuilder.line(arrayOfVector3[0], paramColor2, paramCamera.position, paramColor2);
    paramMeshPartBuilder.line(arrayOfVector3[1], paramColor2, paramCamera.position, paramColor2);
    paramMeshPartBuilder.line(arrayOfVector3[2], paramColor2, paramCamera.position, paramColor2);
    paramMeshPartBuilder.line(arrayOfVector3[3], paramColor2, paramCamera.position, paramColor2);
    paramMeshPartBuilder.line(paramCamera.position, paramColor4, centerPoint(arrayOfVector3[4], arrayOfVector3[5], arrayOfVector3[6]), paramColor4);
    float f = tmpV0.set(arrayOfVector3[1]).sub(arrayOfVector3[0]).scl(0.5F).len();
    Vector3 vector3 = centerPoint(arrayOfVector3[0], arrayOfVector3[1], arrayOfVector3[2]);
    tmpV0.set(paramCamera.up).scl(f * 2.0F);
    vector3.add(tmpV0);
    paramMeshPartBuilder.line(vector3, paramColor3, arrayOfVector3[2], paramColor3);
    paramMeshPartBuilder.line(arrayOfVector3[2], paramColor3, arrayOfVector3[3], paramColor3);
    paramMeshPartBuilder.line(arrayOfVector3[3], paramColor3, vector3, paramColor3);
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, Frustum paramFrustum, Color paramColor1, Color paramColor2) {
    Vector3[] arrayOfVector3 = paramFrustum.planePoints;
    paramMeshPartBuilder.line(arrayOfVector3[0], paramColor1, arrayOfVector3[1], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[1], paramColor1, arrayOfVector3[2], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[2], paramColor1, arrayOfVector3[3], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[3], paramColor1, arrayOfVector3[0], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[4], paramColor1, arrayOfVector3[5], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[5], paramColor1, arrayOfVector3[6], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[6], paramColor1, arrayOfVector3[7], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[7], paramColor1, arrayOfVector3[4], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[0], paramColor1, arrayOfVector3[4], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[1], paramColor1, arrayOfVector3[5], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[2], paramColor1, arrayOfVector3[6], paramColor1);
    paramMeshPartBuilder.line(arrayOfVector3[3], paramColor1, arrayOfVector3[7], paramColor1);
    paramMeshPartBuilder.line(middlePoint(arrayOfVector3[1], arrayOfVector3[0]), paramColor2, middlePoint(arrayOfVector3[3], arrayOfVector3[2]), paramColor2);
    paramMeshPartBuilder.line(middlePoint(arrayOfVector3[2], arrayOfVector3[1]), paramColor2, middlePoint(arrayOfVector3[3], arrayOfVector3[0]), paramColor2);
    paramMeshPartBuilder.line(middlePoint(arrayOfVector3[5], arrayOfVector3[4]), paramColor2, middlePoint(arrayOfVector3[7], arrayOfVector3[6]), paramColor2);
    paramMeshPartBuilder.line(middlePoint(arrayOfVector3[6], arrayOfVector3[5]), paramColor2, middlePoint(arrayOfVector3[7], arrayOfVector3[4]), paramColor2);
  }
  
  private static Vector3 centerPoint(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33) {
    tmpV0.set(paramVector32).sub(paramVector31).scl(0.5F);
    tmpV1.set(paramVector31).add(tmpV0);
    tmpV0.set(paramVector33).sub(paramVector32).scl(0.5F);
    return tmpV1.add(tmpV0);
  }
  
  private static Vector3 middlePoint(Vector3 paramVector31, Vector3 paramVector32) {
    tmpV0.set(paramVector32).sub(paramVector31).scl(0.5F);
    return tmpV1.set(paramVector31).add(tmpV0);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/FrustumShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */