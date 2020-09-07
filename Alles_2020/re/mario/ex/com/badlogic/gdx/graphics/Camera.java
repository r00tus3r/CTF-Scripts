package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Frustum;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.Ray;

public abstract class Camera {
  public final Matrix4 combined = new Matrix4();
  
  public final Vector3 direction = new Vector3(0.0F, 0.0F, -1.0F);
  
  public float far = 100.0F;
  
  public final Frustum frustum = new Frustum();
  
  public final Matrix4 invProjectionView = new Matrix4();
  
  public float near = 1.0F;
  
  public final Vector3 position = new Vector3();
  
  public final Matrix4 projection = new Matrix4();
  
  private final Ray ray = new Ray(new Vector3(), new Vector3());
  
  private final Vector3 tmpVec = new Vector3();
  
  public final Vector3 up = new Vector3(0.0F, 1.0F, 0.0F);
  
  public final Matrix4 view = new Matrix4();
  
  public float viewportHeight = 0.0F;
  
  public float viewportWidth = 0.0F;
  
  public Ray getPickRay(float paramFloat1, float paramFloat2) { return getPickRay(paramFloat1, paramFloat2, 0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight()); }
  
  public Ray getPickRay(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    unproject(this.ray.origin.set(paramFloat1, paramFloat2, 0.0F), paramFloat3, paramFloat4, paramFloat5, paramFloat6);
    unproject(this.ray.direction.set(paramFloat1, paramFloat2, 1.0F), paramFloat3, paramFloat4, paramFloat5, paramFloat6);
    this.ray.direction.sub(this.ray.origin).nor();
    return this.ray;
  }
  
  public void lookAt(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.tmpVec.set(paramFloat1, paramFloat2, paramFloat3).sub(this.position).nor();
    if (!this.tmpVec.isZero()) {
      paramFloat1 = this.tmpVec.dot(this.up);
      if (Math.abs(paramFloat1 - 1.0F) < 1.0E-9F) {
        this.up.set(this.direction).scl(-1.0F);
      } else if (Math.abs(paramFloat1 + 1.0F) < 1.0E-9F) {
        this.up.set(this.direction);
      } 
      this.direction.set(this.tmpVec);
      normalizeUp();
    } 
  }
  
  public void lookAt(Vector3 paramVector3) { lookAt(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public void normalizeUp() {
    this.tmpVec.set(this.direction).crs(this.up).nor();
    this.up.set(this.tmpVec).crs(this.direction).nor();
  }
  
  public Vector3 project(Vector3 paramVector3) {
    project(paramVector3, 0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
    return paramVector3;
  }
  
  public Vector3 project(Vector3 paramVector3, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    paramVector3.prj(this.combined);
    paramVector3.x = paramFloat3 * (paramVector3.x + 1.0F) / 2.0F + paramFloat1;
    paramVector3.y = paramFloat4 * (paramVector3.y + 1.0F) / 2.0F + paramFloat2;
    paramVector3.z = (paramVector3.z + 1.0F) / 2.0F;
    return paramVector3;
  }
  
  public void rotate(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.direction.rotate(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.up.rotate(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void rotate(Matrix4 paramMatrix4) {
    this.direction.rot(paramMatrix4);
    this.up.rot(paramMatrix4);
  }
  
  public void rotate(Quaternion paramQuaternion) {
    paramQuaternion.transform(this.direction);
    paramQuaternion.transform(this.up);
  }
  
  public void rotate(Vector3 paramVector3, float paramFloat) {
    this.direction.rotate(paramVector3, paramFloat);
    this.up.rotate(paramVector3, paramFloat);
  }
  
  public void rotateAround(Vector3 paramVector31, Vector3 paramVector32, float paramFloat) {
    this.tmpVec.set(paramVector31);
    this.tmpVec.sub(this.position);
    translate(this.tmpVec);
    rotate(paramVector32, paramFloat);
    this.tmpVec.rotate(paramVector32, paramFloat);
    translate(-this.tmpVec.x, -this.tmpVec.y, -this.tmpVec.z);
  }
  
  public void transform(Matrix4 paramMatrix4) {
    this.position.mul(paramMatrix4);
    rotate(paramMatrix4);
  }
  
  public void translate(float paramFloat1, float paramFloat2, float paramFloat3) { this.position.add(paramFloat1, paramFloat2, paramFloat3); }
  
  public void translate(Vector3 paramVector3) { this.position.add(paramVector3); }
  
  public Vector3 unproject(Vector3 paramVector3) {
    unproject(paramVector3, 0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
    return paramVector3;
  }
  
  public Vector3 unproject(Vector3 paramVector3, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    float f1 = paramVector3.x;
    float f2 = paramVector3.y;
    float f3 = Gdx.graphics.getHeight();
    paramVector3.x = (f1 - paramFloat1) * 2.0F / paramFloat3 - 1.0F;
    paramVector3.y = (f3 - f2 - 1.0F - paramFloat2) * 2.0F / paramFloat4 - 1.0F;
    paramVector3.z = paramVector3.z * 2.0F - 1.0F;
    paramVector3.prj(this.invProjectionView);
    return paramVector3;
  }
  
  public abstract void update();
  
  public abstract void update(boolean paramBoolean);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Camera.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */