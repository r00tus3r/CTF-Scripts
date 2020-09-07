package com.uwsoft.editor.renderer;

import box2dLight.RayHandler;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.utils.viewport.Viewport;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.resources.ResourceManager;
import com.uwsoft.editor.renderer.spine.SpineReflectionHelper;

public class Overlap2DStage extends Stage {
  public Essentials essentials;
  
  public boolean physiscStopped = false;
  
  public SceneLoader sceneLoader;
  
  private float timeAcc = 0.0F;
  
  public Overlap2DStage() { initStage(); }
  
  public Overlap2DStage(Viewport paramViewport) {
    super(paramViewport);
    initStage();
  }
  
  public void act(float paramFloat) {
    if (this.essentials.world != null && !this.physiscStopped) {
      float f;
      while (true) {
        f = this.timeAcc;
        if (f < paramFloat) {
          this.timeAcc = f + 0.016666668F;
          this.essentials.world.step(0.016666668F, 10, 10);
          continue;
        } 
        break;
      } 
      this.timeAcc = f - paramFloat;
    } 
    if (this.essentials.rayHandler != null) {
      OrthographicCamera orthographicCamera = (OrthographicCamera)getCamera();
      RayHandler rayHandler = this.essentials.rayHandler;
      Matrix4 matrix4 = orthographicCamera.combined.scl(1.0F / PhysicsBodyLoader.SCALE);
      float f2 = orthographicCamera.position.x;
      float f3 = orthographicCamera.position.y;
      float f1 = orthographicCamera.viewportWidth;
      rayHandler.setCombinedMatrix(matrix4, f2, f3, orthographicCamera.zoom * f1, orthographicCamera.viewportHeight * orthographicCamera.zoom);
    } 
    super.act(paramFloat);
  }
  
  public void draw() {
    super.draw();
    if (this.essentials.rayHandler != null)
      this.essentials.rayHandler.updateAndRender(); 
  }
  
  public World getWorld() { return this.essentials.world; }
  
  protected void initLightsConfiguration() {
    RayHandler.setGammaCorrection(true);
    RayHandler.useDiffuseLight(true);
    RayHandler rayHandler = new RayHandler(null);
    rayHandler.setAmbientLight(1.0F, 1.0F, 1.0F, 1.0F);
    rayHandler.setCulling(true);
    rayHandler.setBlur(true);
    rayHandler.setBlurNum(3);
    rayHandler.setShadows(true);
    rayHandler.setCombinedMatrix((OrthographicCamera)getCamera());
    this.essentials.rayHandler = rayHandler;
  }
  
  public void initSceneLoader() {
    ResourceManager resourceManager = new ResourceManager();
    resourceManager.initAllResources();
    this.sceneLoader = new SceneLoader(this.essentials);
    this.essentials.rayHandler.setWorld(this.essentials.world);
    this.essentials.rm = resourceManager;
  }
  
  public void initSceneLoader(ResourceManager paramResourceManager) {
    this.sceneLoader = new SceneLoader(this.essentials);
    this.essentials.rayHandler.setWorld(this.essentials.world);
    this.essentials.rm = paramResourceManager;
  }
  
  protected void initStage() {
    this.essentials = new Essentials();
    SpineReflectionHelper spineReflectionHelper = new SpineReflectionHelper();
    if (spineReflectionHelper.isSpineAviable)
      this.essentials.spineReflectionHelper = spineReflectionHelper; 
    initLightsConfiguration();
  }
  
  public void loadScene(String paramString) {
    this.sceneLoader.loadScene(paramString);
    setAmbienceInfo(this.sceneLoader.getSceneVO());
    addActor(this.sceneLoader.getRoot());
  }
  
  public void setAmbienceInfo(SceneVO paramSceneVO) {
    Color color = new Color(paramSceneVO.ambientColor[0], paramSceneVO.ambientColor[1], paramSceneVO.ambientColor[2], paramSceneVO.ambientColor[3]);
    this.essentials.rayHandler.setAmbientLight(color);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/Overlap2DStage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */