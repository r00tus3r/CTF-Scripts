package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.input.GestureDetector;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;

public class CameraInputController extends GestureDetector {
  public int activateKey = 0;
  
  protected boolean activatePressed;
  
  public boolean alwaysScroll = true;
  
  public boolean autoUpdate = true;
  
  public int backwardKey = 47;
  
  protected boolean backwardPressed;
  
  protected int button = -1;
  
  public Camera camera;
  
  public int forwardButton = 2;
  
  public int forwardKey = 51;
  
  protected boolean forwardPressed;
  
  public boolean forwardTarget = true;
  
  protected final CameraGestureListener gestureListener;
  
  private boolean multiTouch;
  
  public float pinchZoomFactor = 10.0F;
  
  public float rotateAngle = 360.0F;
  
  public int rotateButton = 0;
  
  public int rotateLeftKey = 32;
  
  protected boolean rotateLeftPressed;
  
  public int rotateRightKey = 29;
  
  protected boolean rotateRightPressed;
  
  public float scrollFactor = -0.1F;
  
  public boolean scrollTarget = false;
  
  private float startX;
  
  private float startY;
  
  public Vector3 target = new Vector3();
  
  private final Vector3 tmpV1 = new Vector3();
  
  private final Vector3 tmpV2 = new Vector3();
  
  private int touched;
  
  public int translateButton = 1;
  
  public boolean translateTarget = true;
  
  public float translateUnits = 10.0F;
  
  public CameraInputController(Camera paramCamera) { this(new CameraGestureListener(), paramCamera); }
  
  protected CameraInputController(CameraGestureListener paramCameraGestureListener, Camera paramCamera) {
    super(paramCameraGestureListener);
    this.gestureListener = paramCameraGestureListener;
    this.gestureListener.controller = this;
    this.camera = paramCamera;
  }
  
  public boolean keyDown(int paramInt) {
    if (paramInt == this.activateKey)
      this.activatePressed = true; 
    if (paramInt == this.forwardKey) {
      this.forwardPressed = true;
    } else if (paramInt == this.backwardKey) {
      this.backwardPressed = true;
    } else if (paramInt == this.rotateRightKey) {
      this.rotateRightPressed = true;
    } else if (paramInt == this.rotateLeftKey) {
      this.rotateLeftPressed = true;
    } 
    return false;
  }
  
  public boolean keyUp(int paramInt) {
    if (paramInt == this.activateKey) {
      this.activatePressed = false;
      this.button = -1;
    } 
    if (paramInt == this.forwardKey) {
      this.forwardPressed = false;
    } else if (paramInt == this.backwardKey) {
      this.backwardPressed = false;
    } else if (paramInt == this.rotateRightKey) {
      this.rotateRightPressed = false;
    } else if (paramInt == this.rotateLeftKey) {
      this.rotateLeftPressed = false;
    } 
    return false;
  }
  
  protected boolean pinchZoom(float paramFloat) { return zoom(this.pinchZoomFactor * paramFloat); }
  
  protected boolean process(float paramFloat1, float paramFloat2, int paramInt) {
    if (paramInt == this.rotateButton) {
      (this.tmpV1.set(this.camera.direction).crs(this.camera.up)).y = 0.0F;
      this.camera.rotateAround(this.target, this.tmpV1.nor(), paramFloat2 * this.rotateAngle);
      this.camera.rotateAround(this.target, Vector3.Y, paramFloat1 * -this.rotateAngle);
    } else if (paramInt == this.translateButton) {
      Camera camera1 = this.camera;
      camera1.translate(this.tmpV1.set(camera1.direction).crs(this.camera.up).nor().scl(-paramFloat1 * this.translateUnits));
      camera1 = this.camera;
      camera1.translate(this.tmpV2.set(camera1.up).scl(-paramFloat2 * this.translateUnits));
      if (this.translateTarget)
        this.target.add(this.tmpV1).add(this.tmpV2); 
    } else if (paramInt == this.forwardButton) {
      Camera camera1 = this.camera;
      camera1.translate(this.tmpV1.set(camera1.direction).scl(paramFloat2 * this.translateUnits));
      if (this.forwardTarget)
        this.target.add(this.tmpV1); 
    } 
    if (this.autoUpdate)
      this.camera.update(); 
    return true;
  }
  
  public boolean scrolled(int paramInt) { return zoom(paramInt * this.scrollFactor * this.translateUnits); }
  
  public boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    int i = this.touched;
    byte b = 1;
    this.touched = i | 1 << paramInt3;
    this.multiTouch = MathUtils.isPowerOfTwo(this.touched) ^ true;
    if (this.multiTouch) {
      this.button = -1;
    } else if (this.button < 0 && (this.activateKey == 0 || this.activatePressed)) {
      this.startX = paramInt1;
      this.startY = paramInt2;
      this.button = paramInt4;
    } 
    int j = b;
    if (!super.touchDown(paramInt1, paramInt2, paramInt3, paramInt4)) {
      j = b;
      if (this.activateKey != 0)
        if (this.activatePressed) {
          j = b;
        } else {
          j = 0;
        }  
    } 
    return j;
  }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) {
    boolean bool = super.touchDragged(paramInt1, paramInt2, paramInt3);
    if (bool || this.button < 0)
      return bool; 
    float f1 = paramInt1;
    float f2 = (f1 - this.startX) / Gdx.graphics.getWidth();
    float f3 = this.startY;
    float f4 = paramInt2;
    f3 = (f3 - f4) / Gdx.graphics.getHeight();
    this.startX = f1;
    this.startY = f4;
    return process(f2, f3, this.button);
  }
  
  public boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    int i = this.touched;
    byte b = 1;
    this.touched = i & (1 << paramInt3 ^ 0xFFFFFFFF);
    this.multiTouch = MathUtils.isPowerOfTwo(this.touched) ^ true;
    if (paramInt4 == this.button)
      this.button = -1; 
    int j = b;
    if (!super.touchUp(paramInt1, paramInt2, paramInt3, paramInt4))
      if (this.activatePressed) {
        j = b;
      } else {
        j = 0;
      }  
    return j;
  }
  
  public void update() {
    if (this.rotateRightPressed || this.rotateLeftPressed || this.forwardPressed || this.backwardPressed) {
      float f = Gdx.graphics.getDeltaTime();
      if (this.rotateRightPressed) {
        Camera camera1 = this.camera;
        camera1.rotate(camera1.up, -f * this.rotateAngle);
      } 
      if (this.rotateLeftPressed) {
        Camera camera1 = this.camera;
        camera1.rotate(camera1.up, this.rotateAngle * f);
      } 
      if (this.forwardPressed) {
        Camera camera1 = this.camera;
        camera1.translate(this.tmpV1.set(camera1.direction).scl(this.translateUnits * f));
        if (this.forwardTarget)
          this.target.add(this.tmpV1); 
      } 
      if (this.backwardPressed) {
        Camera camera1 = this.camera;
        camera1.translate(this.tmpV1.set(camera1.direction).scl(-f * this.translateUnits));
        if (this.forwardTarget)
          this.target.add(this.tmpV1); 
      } 
      if (this.autoUpdate)
        this.camera.update(); 
    } 
  }
  
  public boolean zoom(float paramFloat) {
    if (!this.alwaysScroll && this.activateKey != 0 && !this.activatePressed)
      return false; 
    Camera camera1 = this.camera;
    camera1.translate(this.tmpV1.set(camera1.direction).scl(paramFloat));
    if (this.scrollTarget)
      this.target.add(this.tmpV1); 
    if (this.autoUpdate)
      this.camera.update(); 
    return true;
  }
  
  protected static class CameraGestureListener extends GestureDetector.GestureAdapter {
    public CameraInputController controller;
    
    private float previousZoom;
    
    public boolean fling(float param1Float1, float param1Float2, int param1Int) { return false; }
    
    public boolean longPress(float param1Float1, float param1Float2) { return false; }
    
    public boolean pan(float param1Float1, float param1Float2, float param1Float3, float param1Float4) { return false; }
    
    public boolean pinch(Vector2 param1Vector21, Vector2 param1Vector22, Vector2 param1Vector23, Vector2 param1Vector24) { return false; }
    
    public boolean tap(float param1Float1, float param1Float2, int param1Int1, int param1Int2) { return false; }
    
    public boolean touchDown(float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
      this.previousZoom = 0.0F;
      return false;
    }
    
    public boolean zoom(float param1Float1, float param1Float2) {
      float f1 = param1Float2 - param1Float1;
      float f2 = this.previousZoom;
      this.previousZoom = f1;
      param1Float2 = Gdx.graphics.getWidth();
      float f3 = Gdx.graphics.getHeight();
      CameraInputController cameraInputController = this.controller;
      param1Float1 = param1Float2;
      if (param1Float2 > f3)
        param1Float1 = f3; 
      return cameraInputController.pinchZoom((f1 - f2) / param1Float1);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/CameraInputController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */