package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Disposable;

public class DirectionalShadowLight extends DirectionalLight implements ShadowMap, Disposable {
  protected Camera cam;
  
  protected FrameBuffer fbo;
  
  protected float halfDepth;
  
  protected float halfHeight;
  
  protected final TextureDescriptor textureDesc;
  
  protected final Vector3 tmpV = new Vector3();
  
  public DirectionalShadowLight(int paramInt1, int paramInt2, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.fbo = new FrameBuffer(Pixmap.Format.RGBA8888, paramInt1, paramInt2, true);
    this.cam = new OrthographicCamera(paramFloat1, paramFloat2);
    Camera camera = this.cam;
    camera.near = paramFloat3;
    camera.far = paramFloat4;
    this.halfHeight = paramFloat2 * 0.5F;
    this.halfDepth = paramFloat3 + (paramFloat4 - paramFloat3) * 0.5F;
    this.textureDesc = new TextureDescriptor();
    TextureDescriptor textureDescriptor = this.textureDesc;
    Texture.TextureFilter textureFilter = Texture.TextureFilter.Nearest;
    textureDescriptor.magFilter = textureFilter;
    textureDescriptor.minFilter = textureFilter;
    textureDescriptor = this.textureDesc;
    Texture.TextureWrap textureWrap = Texture.TextureWrap.ClampToEdge;
    textureDescriptor.vWrap = textureWrap;
    textureDescriptor.uWrap = textureWrap;
  }
  
  public void begin() {
    int i = this.fbo.getWidth();
    int j = this.fbo.getHeight();
    this.fbo.begin();
    Gdx.gl.glViewport(0, 0, i, j);
    Gdx.gl.glClearColor(1.0F, 1.0F, 1.0F, 1.0F);
    Gdx.gl.glClear(16640);
    Gdx.gl.glEnable(3089);
    Gdx.gl.glScissor(1, 1, i - 2, j - 2);
  }
  
  public void begin(Camera paramCamera) {
    update(paramCamera);
    begin();
  }
  
  public void begin(Vector3 paramVector31, Vector3 paramVector32) {
    update(paramVector31, paramVector32);
    begin();
  }
  
  public void dispose() {
    FrameBuffer frameBuffer = this.fbo;
    if (frameBuffer != null)
      frameBuffer.dispose(); 
    this.fbo = null;
  }
  
  public void end() {
    Gdx.gl.glDisable(3089);
    this.fbo.end();
  }
  
  public Camera getCamera() { return this.cam; }
  
  public TextureDescriptor getDepthMap() {
    this.textureDesc.texture = this.fbo.getColorBufferTexture();
    return this.textureDesc;
  }
  
  public FrameBuffer getFrameBuffer() { return this.fbo; }
  
  public Matrix4 getProjViewTrans() { return this.cam.combined; }
  
  public void update(Camera paramCamera) { update(this.tmpV.set(paramCamera.direction).scl(this.halfHeight), paramCamera.direction); }
  
  public void update(Vector3 paramVector31, Vector3 paramVector32) {
    this.cam.position.set(this.direction).scl(-this.halfDepth).add(paramVector31);
    this.cam.direction.set(this.direction).nor();
    this.cam.normalizeUp();
    this.cam.update();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */