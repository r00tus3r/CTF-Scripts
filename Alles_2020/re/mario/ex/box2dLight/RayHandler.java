package box2dLight;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;
import shaders.LightShader;

public class RayHandler implements Disposable {
  static final float GAMMA_COR = 0.625F;
  
  static boolean gammaCorrection = false;
  
  static float gammaCorrectionParameter = 1.0F;
  
  public static boolean isDiffuse = false;
  
  final Color ambientLight = new Color();
  
  boolean blur = true;
  
  int blurNum = 1;
  
  final Matrix4 combined = new Matrix4();
  
  boolean culling = true;
  
  ShaderProgram customLightShader = null;
  
  boolean customViewport = false;
  
  public final BlendFunc diffuseBlendFunc = new BlendFunc('̆', false);
  
  final Array<Light> disabledLights = new Array(false, 16);
  
  final Array<Light> lightList = new Array(false, 16);
  
  LightMap lightMap;
  
  int lightRenderedLastFrame = 0;
  
  final ShaderProgram lightShader;
  
  public final BlendFunc shadowBlendFunc = new BlendFunc(true, '̃');
  
  boolean shadows = true;
  
  public final BlendFunc simpleBlendFunc = new BlendFunc('̂', true);
  
  int viewportHeight = Gdx.graphics.getHeight();
  
  int viewportWidth = Gdx.graphics.getWidth();
  
  int viewportX = 0;
  
  int viewportY = 0;
  
  World world;
  
  float x1;
  
  float x2;
  
  float y1;
  
  float y2;
  
  static  {
  
  }
  
  public RayHandler(World paramWorld) { this(paramWorld, Gdx.graphics.getWidth() / 4, Gdx.graphics.getHeight() / 4); }
  
  public RayHandler(World paramWorld, int paramInt1, int paramInt2) {
    this.world = paramWorld;
    resizeFBO(paramInt1, paramInt2);
    this.lightShader = LightShader.createLightShader();
  }
  
  public static boolean getGammaCorrection() { return gammaCorrection; }
  
  public static void setGammaCorrection(boolean paramBoolean) {
    float f;
    gammaCorrection = paramBoolean;
    if (gammaCorrection) {
      f = 0.625F;
    } else {
      f = 1.0F;
    } 
    gammaCorrectionParameter = f;
  }
  
  public static void useDiffuseLight(boolean paramBoolean) { isDiffuse = paramBoolean; }
  
  public void dispose() {
    removeAll();
    LightMap lightMap1 = this.lightMap;
    if (lightMap1 != null)
      lightMap1.dispose(); 
    ShaderProgram shaderProgram = this.lightShader;
    if (shaderProgram != null)
      shaderProgram.dispose(); 
  }
  
  public FrameBuffer getLightMapBuffer() { return this.lightMap.frameBuffer; }
  
  public Texture getLightMapTexture() { return (Texture)this.lightMap.frameBuffer.getColorBufferTexture(); }
  
  boolean intersect(float paramFloat1, float paramFloat2, float paramFloat3) {
    boolean bool;
    if (this.x1 < paramFloat1 + paramFloat3 && this.x2 > paramFloat1 - paramFloat3 && this.y1 < paramFloat2 + paramFloat3 && this.y2 > paramFloat2 - paramFloat3) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean pointAtLight(float paramFloat1, float paramFloat2) {
    Iterator iterator = this.lightList.iterator();
    while (iterator.hasNext()) {
      if (((Light)iterator.next()).contains(paramFloat1, paramFloat2))
        return true; 
    } 
    return false;
  }
  
  public boolean pointAtShadow(float paramFloat1, float paramFloat2) {
    Iterator iterator = this.lightList.iterator();
    while (iterator.hasNext()) {
      if (((Light)iterator.next()).contains(paramFloat1, paramFloat2))
        return false; 
    } 
    return true;
  }
  
  public void removeAll() {
    Iterator iterator = this.lightList.iterator();
    while (iterator.hasNext())
      ((Light)iterator.next()).dispose(); 
    this.lightList.clear();
    iterator = this.disabledLights.iterator();
    while (iterator.hasNext())
      ((Light)iterator.next()).dispose(); 
    this.disabledLights.clear();
  }
  
  public void render() {
    boolean bool = false;
    this.lightRenderedLastFrame = 0;
    Gdx.gl.glDepthMask(false);
    Gdx.gl.glEnable(3042);
    this.simpleBlendFunc.apply();
    if (this.shadows || this.blur)
      bool = true; 
    if (bool) {
      this.lightMap.frameBuffer.begin();
      Gdx.gl.glClearColor(0.0F, 0.0F, 0.0F, 0.0F);
      Gdx.gl.glClear(16384);
    } 
    ShaderProgram shaderProgram = this.customLightShader;
    if (shaderProgram == null)
      shaderProgram = this.lightShader; 
    shaderProgram.begin();
    shaderProgram.setUniformMatrix("u_projTrans", this.combined);
    if (this.customLightShader != null)
      updateLightShader(); 
    for (Light light : this.lightList) {
      if (this.customLightShader != null)
        updateLightShaderPerLight(light); 
      light.render();
    } 
    shaderProgram.end();
    if (bool) {
      if (this.customViewport) {
        this.lightMap.frameBuffer.end(this.viewportX, this.viewportY, this.viewportWidth, this.viewportHeight);
      } else {
        this.lightMap.frameBuffer.end();
      } 
      this.lightMap.render();
    } 
  }
  
  public void resizeFBO(int paramInt1, int paramInt2) {
    LightMap lightMap1 = this.lightMap;
    if (lightMap1 != null)
      lightMap1.dispose(); 
    this.lightMap = new LightMap(this, paramInt1, paramInt2);
  }
  
  public void setAmbientLight(float paramFloat) { this.ambientLight.a = MathUtils.clamp(paramFloat, 0.0F, 1.0F); }
  
  public void setAmbientLight(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.ambientLight.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setAmbientLight(Color paramColor) { this.ambientLight.set(paramColor); }
  
  public void setBlur(boolean paramBoolean) { this.blur = paramBoolean; }
  
  public void setBlurNum(int paramInt) { this.blurNum = paramInt; }
  
  public void setCombinedMatrix(OrthographicCamera paramOrthographicCamera) {
    Matrix4 matrix4 = paramOrthographicCamera.combined;
    float f1 = paramOrthographicCamera.position.x;
    float f2 = paramOrthographicCamera.position.y;
    float f3 = paramOrthographicCamera.viewportWidth;
    setCombinedMatrix(matrix4, f1, f2, paramOrthographicCamera.zoom * f3, paramOrthographicCamera.viewportHeight * paramOrthographicCamera.zoom);
  }
  
  @Deprecated
  public void setCombinedMatrix(Matrix4 paramMatrix4) {
    System.arraycopy(paramMatrix4.val, 0, this.combined.val, 0, 16);
    float f1 = 1.0F / paramMatrix4.val[0];
    float f2 = -f1 * paramMatrix4.val[12];
    this.x1 = f2 - f1;
    this.x2 = f2 + f1;
    f2 = 1.0F / paramMatrix4.val[5];
    f1 = -f2 * paramMatrix4.val[13];
    this.y1 = f1 - f2;
    this.y2 = f1 + f2;
  }
  
  public void setCombinedMatrix(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    System.arraycopy(paramMatrix4.val, 0, this.combined.val, 0, 16);
    paramFloat3 *= 0.5F;
    this.x1 = paramFloat1 - paramFloat3;
    this.x2 = paramFloat1 + paramFloat3;
    paramFloat1 = paramFloat4 * 0.5F;
    this.y1 = paramFloat2 - paramFloat1;
    this.y2 = paramFloat2 + paramFloat1;
  }
  
  public void setCulling(boolean paramBoolean) { this.culling = paramBoolean; }
  
  public void setLightMapRendering(boolean paramBoolean) { this.lightMap.lightMapDrawingDisabled = paramBoolean ^ true; }
  
  public void setLightShader(ShaderProgram paramShaderProgram) { this.customLightShader = paramShaderProgram; }
  
  public void setShadows(boolean paramBoolean) { this.shadows = paramBoolean; }
  
  public void setWorld(World paramWorld) { this.world = paramWorld; }
  
  public void update() {
    Iterator iterator = this.lightList.iterator();
    while (iterator.hasNext())
      ((Light)iterator.next()).update(); 
  }
  
  public void updateAndRender() {
    update();
    render();
  }
  
  protected void updateLightShader() {}
  
  protected void updateLightShaderPerLight(Light paramLight) {}
  
  public void useCustomViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.customViewport = true;
    this.viewportX = paramInt1;
    this.viewportY = paramInt2;
    this.viewportWidth = paramInt3;
    this.viewportHeight = paramInt4;
  }
  
  public void useDefaultViewport() { this.customViewport = false; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/RayHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */