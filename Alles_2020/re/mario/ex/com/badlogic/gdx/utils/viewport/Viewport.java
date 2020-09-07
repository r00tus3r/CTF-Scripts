package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.glutils.HdpiUtils;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.Ray;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;

public abstract class Viewport {
  private Camera camera;
  
  private int screenHeight;
  
  private int screenWidth;
  
  private int screenX;
  
  private int screenY;
  
  private final Vector3 tmp = new Vector3();
  
  private float worldHeight;
  
  private float worldWidth;
  
  public void apply() { apply(false); }
  
  public void apply(boolean paramBoolean) {
    HdpiUtils.glViewport(this.screenX, this.screenY, this.screenWidth, this.screenHeight);
    Camera camera1 = this.camera;
    camera1.viewportWidth = this.worldWidth;
    camera1.viewportHeight = this.worldHeight;
    if (paramBoolean)
      camera1.position.set(this.worldWidth / 2.0F, this.worldHeight / 2.0F, 0.0F); 
    this.camera.update();
  }
  
  public void calculateScissors(Matrix4 paramMatrix4, Rectangle paramRectangle1, Rectangle paramRectangle2) { ScissorStack.calculateScissors(this.camera, this.screenX, this.screenY, this.screenWidth, this.screenHeight, paramMatrix4, paramRectangle1, paramRectangle2); }
  
  public int getBottomGutterHeight() { return this.screenY; }
  
  public Camera getCamera() { return this.camera; }
  
  public int getLeftGutterWidth() { return this.screenX; }
  
  public Ray getPickRay(float paramFloat1, float paramFloat2) { return this.camera.getPickRay(paramFloat1, paramFloat2, this.screenX, this.screenY, this.screenWidth, this.screenHeight); }
  
  public int getRightGutterWidth() { return Gdx.graphics.getWidth() - this.screenX + this.screenWidth; }
  
  public int getRightGutterX() { return this.screenX + this.screenWidth; }
  
  public int getScreenHeight() { return this.screenHeight; }
  
  public int getScreenWidth() { return this.screenWidth; }
  
  public int getScreenX() { return this.screenX; }
  
  public int getScreenY() { return this.screenY; }
  
  public int getTopGutterHeight() { return Gdx.graphics.getHeight() - this.screenY + this.screenHeight; }
  
  public int getTopGutterY() { return this.screenY + this.screenHeight; }
  
  public float getWorldHeight() { return this.worldHeight; }
  
  public float getWorldWidth() { return this.worldWidth; }
  
  public Vector2 project(Vector2 paramVector2) {
    this.tmp.set(paramVector2.x, paramVector2.y, 1.0F);
    this.camera.project(this.tmp, this.screenX, this.screenY, this.screenWidth, this.screenHeight);
    paramVector2.set(this.tmp.x, this.tmp.y);
    return paramVector2;
  }
  
  public Vector3 project(Vector3 paramVector3) {
    this.camera.project(paramVector3, this.screenX, this.screenY, this.screenWidth, this.screenHeight);
    return paramVector3;
  }
  
  public void setCamera(Camera paramCamera) { this.camera = paramCamera; }
  
  public void setScreenBounds(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.screenX = paramInt1;
    this.screenY = paramInt2;
    this.screenWidth = paramInt3;
    this.screenHeight = paramInt4;
  }
  
  public void setScreenHeight(int paramInt) { this.screenHeight = paramInt; }
  
  public void setScreenPosition(int paramInt1, int paramInt2) {
    this.screenX = paramInt1;
    this.screenY = paramInt2;
  }
  
  public void setScreenSize(int paramInt1, int paramInt2) {
    this.screenWidth = paramInt1;
    this.screenHeight = paramInt2;
  }
  
  public void setScreenWidth(int paramInt) { this.screenWidth = paramInt; }
  
  public void setScreenX(int paramInt) { this.screenX = paramInt; }
  
  public void setScreenY(int paramInt) { this.screenY = paramInt; }
  
  public void setWorldHeight(float paramFloat) { this.worldHeight = paramFloat; }
  
  public void setWorldSize(float paramFloat1, float paramFloat2) {
    this.worldWidth = paramFloat1;
    this.worldHeight = paramFloat2;
  }
  
  public void setWorldWidth(float paramFloat) { this.worldWidth = paramFloat; }
  
  public Vector2 toScreenCoordinates(Vector2 paramVector2, Matrix4 paramMatrix4) {
    this.tmp.set(paramVector2.x, paramVector2.y, 0.0F);
    this.tmp.mul(paramMatrix4);
    this.camera.project(this.tmp);
    this.tmp.y = Gdx.graphics.getHeight() - this.tmp.y;
    paramVector2.x = this.tmp.x;
    paramVector2.y = this.tmp.y;
    return paramVector2;
  }
  
  public Vector2 unproject(Vector2 paramVector2) {
    this.tmp.set(paramVector2.x, paramVector2.y, 1.0F);
    this.camera.unproject(this.tmp, this.screenX, this.screenY, this.screenWidth, this.screenHeight);
    paramVector2.set(this.tmp.x, this.tmp.y);
    return paramVector2;
  }
  
  public Vector3 unproject(Vector3 paramVector3) {
    this.camera.unproject(paramVector3, this.screenX, this.screenY, this.screenWidth, this.screenHeight);
    return paramVector3;
  }
  
  public final void update(int paramInt1, int paramInt2) { update(paramInt1, paramInt2, false); }
  
  public void update(int paramInt1, int paramInt2, boolean paramBoolean) { apply(paramBoolean); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/viewport/Viewport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */