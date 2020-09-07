package com.badlogic.gdx.math;

import com.badlogic.gdx.math.collision.BoundingBox;

public class Frustum {
  protected static final Vector3[] clipSpacePlanePoints;
  
  protected static final float[] clipSpacePlanePointsArray;
  
  private static final Vector3 tmpV;
  
  public final Vector3[] planePoints;
  
  protected final float[] planePointsArray;
  
  public final Plane[] planes = new Plane[6];
  
  static  {
    Vector3 vector3 = new Vector3(-1.0F, -1.0F, -1.0F);
    byte b1 = 0;
    clipSpacePlanePoints = new Vector3[] { vector3, new Vector3(1.0F, -1.0F, -1.0F), new Vector3(1.0F, 1.0F, -1.0F), new Vector3(-1.0F, 1.0F, -1.0F), new Vector3(-1.0F, -1.0F, 1.0F), new Vector3(1.0F, -1.0F, 1.0F), new Vector3(1.0F, 1.0F, 1.0F), new Vector3(-1.0F, 1.0F, 1.0F) };
    clipSpacePlanePointsArray = new float[24];
    Vector3[] arrayOfVector3 = clipSpacePlanePoints;
    int i = arrayOfVector3.length;
    for (byte b2 = 0; b1 < i; b2++) {
      Vector3 vector31 = arrayOfVector3[b1];
      float[] arrayOfFloat = clipSpacePlanePointsArray;
      boolean bool = b2 + true;
      arrayOfFloat[b2] = vector31.x;
      arrayOfFloat = clipSpacePlanePointsArray;
      b2 = bool + true;
      arrayOfFloat[bool] = vector31.y;
      clipSpacePlanePointsArray[b2] = vector31.z;
      b1++;
    } 
    tmpV = new Vector3();
  }
  
  public Frustum() {
    Vector3 vector3 = new Vector3();
    byte b = 0;
    this.planePoints = new Vector3[] { vector3, new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3() };
    this.planePointsArray = new float[24];
    while (b < 6) {
      this.planes[b] = new Plane(new Vector3(), 0.0F);
      b++;
    } 
  }
  
  public boolean boundsInFrustum(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    int i = this.planes.length;
    for (byte b = 0; b < i; b++) {
      Plane plane = this.planes[b];
      float f1 = paramFloat1 + paramFloat4;
      float f2 = paramFloat2 + paramFloat5;
      float f3 = paramFloat3 + paramFloat6;
      if (plane.testPoint(f1, f2, f3) == Plane.PlaneSide.Back) {
        plane = this.planes[b];
        float f = paramFloat3 - paramFloat6;
        if (plane.testPoint(f1, f2, f) == Plane.PlaneSide.Back) {
          plane = this.planes[b];
          float f4 = paramFloat2 - paramFloat5;
          if (plane.testPoint(f1, f4, f3) == Plane.PlaneSide.Back && this.planes[b].testPoint(f1, f4, f) == Plane.PlaneSide.Back) {
            plane = this.planes[b];
            f1 = paramFloat1 - paramFloat4;
            if (plane.testPoint(f1, f2, f3) == Plane.PlaneSide.Back && this.planes[b].testPoint(f1, f2, f) == Plane.PlaneSide.Back && this.planes[b].testPoint(f1, f4, f3) == Plane.PlaneSide.Back && this.planes[b].testPoint(f1, f4, f) == Plane.PlaneSide.Back)
              return false; 
          } 
        } 
      } 
    } 
    return true;
  }
  
  public boolean boundsInFrustum(Vector3 paramVector31, Vector3 paramVector32) { return boundsInFrustum(paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x / 2.0F, paramVector32.y / 2.0F, paramVector32.z / 2.0F); }
  
  public boolean boundsInFrustum(BoundingBox paramBoundingBox) {
    int i = this.planes.length;
    byte b = 0;
    while (b < i) {
      if (this.planes[b].testPoint(paramBoundingBox.getCorner000(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner001(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner010(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner011(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner100(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner101(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner110(tmpV)) != Plane.PlaneSide.Back || this.planes[b].testPoint(paramBoundingBox.getCorner111(tmpV)) != Plane.PlaneSide.Back) {
        b++;
        continue;
      } 
      return false;
    } 
    return true;
  }
  
  public boolean pointInFrustum(float paramFloat1, float paramFloat2, float paramFloat3) {
    byte b = 0;
    while (true) {
      Plane[] arrayOfPlane = this.planes;
      if (b < arrayOfPlane.length) {
        if (arrayOfPlane[b].testPoint(paramFloat1, paramFloat2, paramFloat3) == Plane.PlaneSide.Back)
          return false; 
        b++;
        continue;
      } 
      break;
    } 
    return true;
  }
  
  public boolean pointInFrustum(Vector3 paramVector3) {
    byte b = 0;
    while (true) {
      Plane[] arrayOfPlane = this.planes;
      if (b < arrayOfPlane.length) {
        if (arrayOfPlane[b].testPoint(paramVector3) == Plane.PlaneSide.Back)
          return false; 
        b++;
        continue;
      } 
      break;
    } 
    return true;
  }
  
  public boolean sphereInFrustum(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    for (byte b = 0; b < 6; b++) {
      if ((this.planes[b]).normal.x * paramFloat1 + (this.planes[b]).normal.y * paramFloat2 + (this.planes[b]).normal.z * paramFloat3 < -paramFloat4 - (this.planes[b]).d)
        return false; 
    } 
    return true;
  }
  
  public boolean sphereInFrustum(Vector3 paramVector3, float paramFloat) {
    for (byte b = 0; b < 6; b++) {
      if ((this.planes[b]).normal.x * paramVector3.x + (this.planes[b]).normal.y * paramVector3.y + (this.planes[b]).normal.z * paramVector3.z < -paramFloat - (this.planes[b]).d)
        return false; 
    } 
    return true;
  }
  
  public boolean sphereInFrustumWithoutNearFar(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    for (byte b = 2; b < 6; b++) {
      if ((this.planes[b]).normal.x * paramFloat1 + (this.planes[b]).normal.y * paramFloat2 + (this.planes[b]).normal.z * paramFloat3 < -paramFloat4 - (this.planes[b]).d)
        return false; 
    } 
    return true;
  }
  
  public boolean sphereInFrustumWithoutNearFar(Vector3 paramVector3, float paramFloat) {
    for (byte b = 2; b < 6; b++) {
      if ((this.planes[b]).normal.x * paramVector3.x + (this.planes[b]).normal.y * paramVector3.y + (this.planes[b]).normal.z * paramVector3.z < -paramFloat - (this.planes[b]).d)
        return false; 
    } 
    return true;
  }
  
  public void update(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = clipSpacePlanePointsArray;
    System.arraycopy(arrayOfFloat, 0, this.planePointsArray, 0, arrayOfFloat.length);
    Matrix4.prj(paramMatrix4.val, this.planePointsArray, 0, 8, 3);
    byte b1 = 0;
    for (byte b2 = 0; b1 < 8; b2++) {
      Vector3 vector3 = this.planePoints[b1];
      float[] arrayOfFloat1 = this.planePointsArray;
      boolean bool = b2 + true;
      vector3.x = arrayOfFloat1[b2];
      b2 = bool + true;
      vector3.y = arrayOfFloat1[bool];
      vector3.z = arrayOfFloat1[b2];
      b1++;
    } 
    Plane plane3 = this.planes[0];
    Vector3[] arrayOfVector32 = this.planePoints;
    plane3.set(arrayOfVector32[1], arrayOfVector32[0], arrayOfVector32[2]);
    plane3 = this.planes[1];
    arrayOfVector32 = this.planePoints;
    plane3.set(arrayOfVector32[4], arrayOfVector32[5], arrayOfVector32[7]);
    plane3 = this.planes[2];
    arrayOfVector32 = this.planePoints;
    plane3.set(arrayOfVector32[0], arrayOfVector32[4], arrayOfVector32[3]);
    Plane plane1 = this.planes[3];
    Vector3[] arrayOfVector33 = this.planePoints;
    plane1.set(arrayOfVector33[5], arrayOfVector33[1], arrayOfVector33[6]);
    plane1 = this.planes[4];
    arrayOfVector33 = this.planePoints;
    plane1.set(arrayOfVector33[2], arrayOfVector33[3], arrayOfVector33[6]);
    Plane plane2 = this.planes[5];
    Vector3[] arrayOfVector31 = this.planePoints;
    plane2.set(arrayOfVector31[4], arrayOfVector31[0], arrayOfVector31[1]);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Frustum.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */