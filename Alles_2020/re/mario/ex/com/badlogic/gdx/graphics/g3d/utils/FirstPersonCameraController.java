package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputAdapter;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.IntIntMap;

public class FirstPersonCameraController extends InputAdapter {
  private int BACKWARD = 47;
  
  private int DOWN = 33;
  
  private int FORWARD = 51;
  
  private int STRAFE_LEFT = 29;
  
  private int STRAFE_RIGHT = 32;
  
  private int UP = 45;
  
  private final Camera camera;
  
  private float degreesPerPixel = 0.5F;
  
  private final IntIntMap keys = new IntIntMap();
  
  private final Vector3 tmp = new Vector3();
  
  private float velocity = 5.0F;
  
  public FirstPersonCameraController(Camera paramCamera) { this.camera = paramCamera; }
  
  public boolean keyDown(int paramInt) {
    this.keys.put(paramInt, paramInt);
    return true;
  }
  
  public boolean keyUp(int paramInt) {
    this.keys.remove(paramInt, 0);
    return true;
  }
  
  public void setDegreesPerPixel(float paramFloat) { this.degreesPerPixel = paramFloat; }
  
  public void setVelocity(float paramFloat) { this.velocity = paramFloat; }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) {
    float f1 = -Gdx.input.getDeltaX();
    float f2 = this.degreesPerPixel;
    float f3 = -Gdx.input.getDeltaY();
    float f4 = this.degreesPerPixel;
    this.camera.direction.rotate(this.camera.up, f1 * f2);
    this.tmp.set(this.camera.direction).crs(this.camera.up).nor();
    this.camera.direction.rotate(this.tmp, f3 * f4);
    return true;
  }
  
  public void update() { update(Gdx.graphics.getDeltaTime()); }
  
  public void update(float paramFloat) {
    if (this.keys.containsKey(this.FORWARD)) {
      this.tmp.set(this.camera.direction).nor().scl(this.velocity * paramFloat);
      this.camera.position.add(this.tmp);
    } 
    if (this.keys.containsKey(this.BACKWARD)) {
      this.tmp.set(this.camera.direction).nor().scl(-paramFloat * this.velocity);
      this.camera.position.add(this.tmp);
    } 
    if (this.keys.containsKey(this.STRAFE_LEFT)) {
      this.tmp.set(this.camera.direction).crs(this.camera.up).nor().scl(-paramFloat * this.velocity);
      this.camera.position.add(this.tmp);
    } 
    if (this.keys.containsKey(this.STRAFE_RIGHT)) {
      this.tmp.set(this.camera.direction).crs(this.camera.up).nor().scl(this.velocity * paramFloat);
      this.camera.position.add(this.tmp);
    } 
    if (this.keys.containsKey(this.UP)) {
      this.tmp.set(this.camera.up).nor().scl(this.velocity * paramFloat);
      this.camera.position.add(this.tmp);
    } 
    if (this.keys.containsKey(this.DOWN)) {
      this.tmp.set(this.camera.up).nor().scl(-paramFloat * this.velocity);
      this.camera.position.add(this.tmp);
    } 
    this.camera.update(true);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/FirstPersonCameraController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */