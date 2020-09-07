package box2dLight;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import shaders.DiffuseShader;
import shaders.Gaussian;
import shaders.ShadowShader;
import shaders.WithoutShadowShader;

class LightMap {
  public static final int U1 = 2;
  
  public static final int U2 = 6;
  
  public static final int U3 = 10;
  
  public static final int U4 = 14;
  
  public static final int V1 = 3;
  
  public static final int V2 = 7;
  
  public static final int V3 = 11;
  
  public static final int V4 = 15;
  
  public static final int VERT_SIZE = 16;
  
  public static final int X1 = 0;
  
  public static final int X2 = 4;
  
  public static final int X3 = 8;
  
  public static final int X4 = 12;
  
  public static final int Y1 = 1;
  
  public static final int Y2 = 5;
  
  public static final int Y3 = 9;
  
  public static final int Y4 = 13;
  
  private ShaderProgram blurShader;
  
  private ShaderProgram diffuseShader;
  
  FrameBuffer frameBuffer;
  
  boolean lightMapDrawingDisabled;
  
  private Mesh lightMapMesh;
  
  private FrameBuffer pingPongBuffer;
  
  private RayHandler rayHandler;
  
  private ShaderProgram shadowShader;
  
  private ShaderProgram withoutShadowShader;
  
  public LightMap(RayHandler paramRayHandler, int paramInt1, int paramInt2) {
    this.rayHandler = paramRayHandler;
    int i = 1;
    int j = paramInt1;
    if (paramInt1 <= 0)
      j = 1; 
    if (paramInt2 <= 0) {
      paramInt1 = i;
    } else {
      paramInt1 = paramInt2;
    } 
    this.frameBuffer = new FrameBuffer(Pixmap.Format.RGBA8888, j, paramInt1, false);
    this.pingPongBuffer = new FrameBuffer(Pixmap.Format.RGBA8888, j, paramInt1, false);
    this.lightMapMesh = createLightMapMesh();
    this.shadowShader = ShadowShader.createShadowShader();
    this.diffuseShader = DiffuseShader.createShadowShader();
    this.withoutShadowShader = WithoutShadowShader.createShadowShader();
    this.blurShader = Gaussian.createBlurShader(j, paramInt1);
  }
  
  private Mesh createLightMapMesh() {
    Mesh mesh = new Mesh(true, 4, false, new VertexAttribute[] { new VertexAttribute(true, 2, "a_position"), new VertexAttribute(16, 2, "a_texCoord") });
    mesh.setVertices(new float[] { 
          -1.0F, -1.0F, 0.0F, 0.0F, 1.0F, -1.0F, 1.0F, 0.0F, 1.0F, 1.0F, 
          1.0F, 1.0F, -1.0F, 1.0F, 0.0F, 1.0F });
    return mesh;
  }
  
  void dispose() {
    this.shadowShader.dispose();
    this.blurShader.dispose();
    this.lightMapMesh.dispose();
    this.frameBuffer.dispose();
    this.pingPongBuffer.dispose();
  }
  
  public void gaussianBlur() {
    Gdx.gl20.glDisable(3042);
    for (byte b = 0; b < this.rayHandler.blurNum; b++) {
      ((Texture)this.frameBuffer.getColorBufferTexture()).bind(0);
      this.pingPongBuffer.begin();
      this.blurShader.begin();
      this.blurShader.setUniformf("dir", 1.0F, 0.0F);
      this.lightMapMesh.render(this.blurShader, 6, 0, 4);
      this.blurShader.end();
      this.pingPongBuffer.end();
      ((Texture)this.pingPongBuffer.getColorBufferTexture()).bind(0);
      this.frameBuffer.begin();
      this.blurShader.begin();
      this.blurShader.setUniformf("dir", 0.0F, 1.0F);
      this.lightMapMesh.render(this.blurShader, 6, 0, 4);
      this.blurShader.end();
      if (this.rayHandler.customViewport) {
        this.frameBuffer.end(this.rayHandler.viewportX, this.rayHandler.viewportY, this.rayHandler.viewportWidth, this.rayHandler.viewportHeight);
      } else {
        this.frameBuffer.end();
      } 
    } 
    Gdx.gl20.glEnable(3042);
  }
  
  public void render() {
    boolean bool;
    if (this.rayHandler.lightRenderedLastFrame > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    if (bool && this.rayHandler.blur)
      gaussianBlur(); 
    if (this.lightMapDrawingDisabled)
      return; 
    ((Texture)this.frameBuffer.getColorBufferTexture()).bind(0);
    if (this.rayHandler.shadows) {
      Color color = this.rayHandler.ambientLight;
      ShaderProgram shaderProgram = this.shadowShader;
      if (RayHandler.isDiffuse) {
        shaderProgram = this.diffuseShader;
        shaderProgram.begin();
        this.rayHandler.diffuseBlendFunc.apply();
        shaderProgram.setUniformf("ambient", color.r, color.g, color.b, color.a);
      } else {
        shaderProgram.begin();
        this.rayHandler.shadowBlendFunc.apply();
        shaderProgram.setUniformf("ambient", color.r * color.a, color.g * color.a, color.b * color.a, 1.0F - color.a);
      } 
      this.lightMapMesh.render(shaderProgram, 6);
      shaderProgram.end();
    } else if (bool) {
      this.rayHandler.simpleBlendFunc.apply();
      this.withoutShadowShader.begin();
      this.lightMapMesh.render(this.withoutShadowShader, 6);
      this.withoutShadowShader.end();
    } 
    Gdx.gl20.glDisable(3042);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/LightMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */