package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleShader;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.PointSpriteControllerRenderData;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class PointSpriteParticleBatch extends BufferedParticleBatch<PointSpriteControllerRenderData> {
  protected static final VertexAttributes CPU_ATTRIBUTES;
  
  protected static final int CPU_COLOR_OFFSET;
  
  protected static final int CPU_POSITION_OFFSET;
  
  protected static final int CPU_REGION_OFFSET;
  
  protected static final int CPU_SIZE_AND_ROTATION_OFFSET;
  
  protected static final int CPU_VERTEX_SIZE;
  
  protected static final Vector3 TMP_V1 = new Vector3();
  
  private static boolean pointSpritesEnabled = false;
  
  protected static final int sizeAndRotationUsage = 512;
  
  Renderable renderable;
  
  private float[] vertices;
  
  static  {
    CPU_ATTRIBUTES = new VertexAttributes(new VertexAttribute[] { new VertexAttribute(true, 3, "a_position"), new VertexAttribute(2, 4, "a_color"), new VertexAttribute(16, 4, "a_region"), new VertexAttribute('Ȁ', 3, "a_sizeAndRotation") });
    CPU_VERTEX_SIZE = (short)(CPU_ATTRIBUTES.vertexSize / 4);
    CPU_POSITION_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(1)).offset / 4);
    CPU_COLOR_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(2)).offset / 4);
    CPU_REGION_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(16)).offset / 4);
    CPU_SIZE_AND_ROTATION_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(512)).offset / 4);
  }
  
  public PointSpriteParticleBatch() { this(1000); }
  
  public PointSpriteParticleBatch(int paramInt) { this(paramInt, new ParticleShader.Config(ParticleShader.ParticleType.Point)); }
  
  public PointSpriteParticleBatch(int paramInt, ParticleShader.Config paramConfig) {
    super(PointSpriteControllerRenderData.class);
    if (!pointSpritesEnabled)
      enablePointSprites(); 
    allocRenderable();
    ensureCapacity(paramInt);
    Renderable renderable1 = this.renderable;
    renderable1.shader = new ParticleShader(renderable1, paramConfig);
    this.renderable.shader.init();
  }
  
  private static void enablePointSprites() {
    Gdx.gl.glEnable(34370);
    if (Gdx.app.getType() == Application.ApplicationType.Desktop)
      Gdx.gl.glEnable(34913); 
    pointSpritesEnabled = true;
  }
  
  protected void allocParticlesData(int paramInt) {
    this.vertices = new float[CPU_VERTEX_SIZE * paramInt];
    if (this.renderable.meshPart.mesh != null)
      this.renderable.meshPart.mesh.dispose(); 
    this.renderable.meshPart.mesh = new Mesh(false, paramInt, false, CPU_ATTRIBUTES);
  }
  
  protected void allocRenderable() {
    this.renderable = new Renderable();
    this.renderable.meshPart.primitiveType = 0;
    this.renderable.meshPart.offset = 0;
    this.renderable.material = new Material(new Attribute[] { new BlendingAttribute(true, '̃', 1.0F), new DepthTestAttribute('ȃ', false), TextureAttribute.createDiffuse((Texture)null) });
  }
  
  protected void flush(int[] paramArrayOfInt) {
    Iterator iterator = this.renderData.iterator();
    byte b = 0;
    while (iterator.hasNext()) {
      PointSpriteControllerRenderData pointSpriteControllerRenderData = (PointSpriteControllerRenderData)iterator.next();
      ParallelArray.FloatChannel floatChannel1 = pointSpriteControllerRenderData.scaleChannel;
      ParallelArray.FloatChannel floatChannel2 = pointSpriteControllerRenderData.regionChannel;
      ParallelArray.FloatChannel floatChannel3 = pointSpriteControllerRenderData.positionChannel;
      ParallelArray.FloatChannel floatChannel4 = pointSpriteControllerRenderData.colorChannel;
      ParallelArray.FloatChannel floatChannel5 = pointSpriteControllerRenderData.rotationChannel;
      int i = 0;
      while (i < pointSpriteControllerRenderData.controller.particles.size) {
        int j = paramArrayOfInt[b] * CPU_VERTEX_SIZE;
        int k = floatChannel2.strideSize * i;
        int m = floatChannel3.strideSize * i;
        int n = floatChannel4.strideSize * i;
        int i1 = floatChannel5.strideSize * i;
        this.vertices[j + CPU_POSITION_OFFSET] = floatChannel3.data[m + 0];
        this.vertices[CPU_POSITION_OFFSET + j + 1] = floatChannel3.data[m + 1];
        this.vertices[CPU_POSITION_OFFSET + j + 2] = floatChannel3.data[m + 2];
        this.vertices[CPU_COLOR_OFFSET + j] = floatChannel4.data[n + 0];
        this.vertices[CPU_COLOR_OFFSET + j + 1] = floatChannel4.data[n + 1];
        this.vertices[CPU_COLOR_OFFSET + j + 2] = floatChannel4.data[n + 2];
        this.vertices[CPU_COLOR_OFFSET + j + 3] = floatChannel4.data[n + 3];
        this.vertices[CPU_SIZE_AND_ROTATION_OFFSET + j] = floatChannel1.data[floatChannel1.strideSize * i];
        this.vertices[CPU_SIZE_AND_ROTATION_OFFSET + j + 1] = floatChannel5.data[i1 + 0];
        this.vertices[CPU_SIZE_AND_ROTATION_OFFSET + j + 2] = floatChannel5.data[i1 + 1];
        this.vertices[CPU_REGION_OFFSET + j] = floatChannel2.data[k + 0];
        this.vertices[CPU_REGION_OFFSET + j + 1] = floatChannel2.data[k + 1];
        this.vertices[CPU_REGION_OFFSET + j + 2] = floatChannel2.data[k + 2];
        this.vertices[j + CPU_REGION_OFFSET + 3] = floatChannel2.data[k + 3];
        i++;
        b++;
      } 
    } 
    this.renderable.meshPart.size = this.bufferedParticlesCount;
    this.renderable.meshPart.mesh.setVertices(this.vertices, 0, this.bufferedParticlesCount * CPU_VERTEX_SIZE);
    this.renderable.meshPart.update();
  }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    if (this.bufferedParticlesCount > 0)
      paramArray.add(((Renderable)paramPool.obtain()).set(this.renderable)); 
  }
  
  public Texture getTexture() { return (Texture)((TextureAttribute)this.renderable.material.get(TextureAttribute.Diffuse)).textureDescription.texture; }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.getSaveData("pointSpriteBatch");
    if (saveData != null)
      setTexture((Texture)paramAssetManager.get(saveData.loadAsset())); 
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) { paramResourceData.createSaveData("pointSpriteBatch").saveAsset(paramAssetManager.getAssetFileName(getTexture()), Texture.class); }
  
  public void setTexture(Texture paramTexture) { ((TextureAttribute)this.renderable.material.get(TextureAttribute.Diffuse)).textureDescription.texture = paramTexture; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/batches/PointSpriteParticleBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */