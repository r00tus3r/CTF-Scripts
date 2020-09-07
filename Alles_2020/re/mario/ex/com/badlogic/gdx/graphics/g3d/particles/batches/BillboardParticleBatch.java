package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleShader;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.BillboardControllerRenderData;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class BillboardParticleBatch extends BufferedParticleBatch<BillboardControllerRenderData> {
  private static final VertexAttributes CPU_ATTRIBUTES;
  
  private static final int CPU_COLOR_OFFSET;
  
  private static final int CPU_POSITION_OFFSET;
  
  private static final int CPU_UV_OFFSET;
  
  private static final int CPU_VERTEX_SIZE;
  
  private static final VertexAttributes GPU_ATTRIBUTES;
  
  private static final int GPU_COLOR_OFFSET;
  
  private static final int GPU_POSITION_OFFSET;
  
  private static final int GPU_SIZE_ROTATION_OFFSET;
  
  private static final int GPU_UV_OFFSET;
  
  private static final int GPU_VERTEX_SIZE;
  
  private static final int MAX_PARTICLES_PER_MESH = 8191;
  
  private static final int MAX_VERTICES_PER_MESH = 32764;
  
  protected static final Matrix3 TMP_M3;
  
  protected static final Vector3 TMP_V1 = new Vector3();
  
  protected static final Vector3 TMP_V2 = new Vector3();
  
  protected static final Vector3 TMP_V3 = new Vector3();
  
  protected static final Vector3 TMP_V4 = new Vector3();
  
  protected static final Vector3 TMP_V5 = new Vector3();
  
  protected static final Vector3 TMP_V6 = new Vector3();
  
  protected static final int directionUsage = 1024;
  
  protected static final int sizeAndRotationUsage = 512;
  
  protected BlendingAttribute blendingAttribute;
  
  private VertexAttributes currentAttributes;
  
  private int currentVertexSize = 0;
  
  protected DepthTestAttribute depthTestAttribute;
  
  private short[] indices;
  
  protected ParticleShader.AlignMode mode = ParticleShader.AlignMode.Screen;
  
  private RenderablePool renderablePool = new RenderablePool();
  
  private Array<Renderable> renderables = new Array();
  
  Shader shader;
  
  protected Texture texture;
  
  protected boolean useGPU = false;
  
  private float[] vertices;
  
  static  {
    TMP_M3 = new Matrix3();
    GPU_ATTRIBUTES = new VertexAttributes(new VertexAttribute[] { new VertexAttribute(true, 3, "a_position"), new VertexAttribute(16, 2, "a_texCoord0"), new VertexAttribute(2, 4, "a_color"), new VertexAttribute('Ȁ', 4, "a_sizeAndRotation") });
    CPU_ATTRIBUTES = new VertexAttributes(new VertexAttribute[] { new VertexAttribute(true, 3, "a_position"), new VertexAttribute(16, 2, "a_texCoord0"), new VertexAttribute(2, 4, "a_color") });
    GPU_POSITION_OFFSET = (short)((GPU_ATTRIBUTES.findByUsage(1)).offset / 4);
    GPU_UV_OFFSET = (short)((GPU_ATTRIBUTES.findByUsage(16)).offset / 4);
    GPU_SIZE_ROTATION_OFFSET = (short)((GPU_ATTRIBUTES.findByUsage(512)).offset / 4);
    GPU_COLOR_OFFSET = (short)((GPU_ATTRIBUTES.findByUsage(2)).offset / 4);
    GPU_VERTEX_SIZE = GPU_ATTRIBUTES.vertexSize / 4;
    CPU_POSITION_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(1)).offset / 4);
    CPU_UV_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(16)).offset / 4);
    CPU_COLOR_OFFSET = (short)((CPU_ATTRIBUTES.findByUsage(2)).offset / 4);
    CPU_VERTEX_SIZE = CPU_ATTRIBUTES.vertexSize / 4;
  }
  
  public BillboardParticleBatch() { this(ParticleShader.AlignMode.Screen, false, 100); }
  
  public BillboardParticleBatch(int paramInt) { this(ParticleShader.AlignMode.Screen, false, paramInt); }
  
  public BillboardParticleBatch(ParticleShader.AlignMode paramAlignMode, boolean paramBoolean, int paramInt) { this(paramAlignMode, paramBoolean, paramInt, null, null); }
  
  public BillboardParticleBatch(ParticleShader.AlignMode paramAlignMode, boolean paramBoolean, int paramInt, BlendingAttribute paramBlendingAttribute, DepthTestAttribute paramDepthTestAttribute) {
    super(BillboardControllerRenderData.class);
    this.blendingAttribute = paramBlendingAttribute;
    this.depthTestAttribute = paramDepthTestAttribute;
    if (this.blendingAttribute == null)
      this.blendingAttribute = new BlendingAttribute(true, '̃', 1.0F); 
    if (this.depthTestAttribute == null)
      this.depthTestAttribute = new DepthTestAttribute('ȃ', false); 
    allocIndices();
    initRenderData();
    ensureCapacity(paramInt);
    setUseGpu(paramBoolean);
    setAlignMode(paramAlignMode);
  }
  
  private void allocIndices() {
    this.indices = new short[49146];
    boolean bool1 = false;
    for (boolean bool2 = false; bool1 < '뿺'; bool2 += true) {
      short[] arrayOfShort = this.indices;
      short s1 = (short)bool2;
      arrayOfShort[bool1] = (short)s1;
      arrayOfShort[bool1 + true] = (short)(short)(bool2 + true);
      short s2 = (short)(bool2 + 2);
      arrayOfShort[bool1 + 2] = (short)s2;
      arrayOfShort[bool1 + 3] = (short)s2;
      arrayOfShort[bool1 + 4] = (short)(short)(bool2 + 3);
      arrayOfShort[bool1 + 5] = (short)s1;
      bool1 += true;
    } 
  }
  
  private void allocRenderables(int paramInt) {
    int i = MathUtils.ceil((paramInt / 8191));
    int j = this.renderablePool.getFree();
    if (j < i)
      for (paramInt = 0; paramInt < i - j; paramInt++) {
        RenderablePool renderablePool1 = this.renderablePool;
        renderablePool1.free(renderablePool1.newObject());
      }  
  }
  
  private void allocShader() {
    Renderable renderable = allocRenderable();
    Shader shader1 = getShader(renderable);
    renderable.shader = shader1;
    this.shader = shader1;
    this.renderablePool.free(renderable);
  }
  
  private void clearRenderablesPool() {
    this.renderablePool.freeAll(this.renderables);
    int i = this.renderablePool.getFree();
    for (byte b = 0; b < i; b++)
      ((Renderable)this.renderablePool.obtain()).meshPart.mesh.dispose(); 
    this.renderables.clear();
  }
  
  private void fillVerticesGPU(int[] paramArrayOfInt) {
    Iterator iterator = this.renderData.iterator();
    byte b = 0;
    while (iterator.hasNext()) {
      BillboardControllerRenderData billboardControllerRenderData = (BillboardControllerRenderData)iterator.next();
      ParallelArray.FloatChannel floatChannel1 = billboardControllerRenderData.scaleChannel;
      ParallelArray.FloatChannel floatChannel2 = billboardControllerRenderData.regionChannel;
      ParallelArray.FloatChannel floatChannel3 = billboardControllerRenderData.positionChannel;
      ParallelArray.FloatChannel floatChannel4 = billboardControllerRenderData.colorChannel;
      ParallelArray.FloatChannel floatChannel5 = billboardControllerRenderData.rotationChannel;
      int i = billboardControllerRenderData.controller.particles.size;
      int j = 0;
      while (j < i) {
        int k = paramArrayOfInt[b] * this.currentVertexSize * 4;
        float f1 = floatChannel1.data[floatChannel1.strideSize * j];
        int m = floatChannel2.strideSize * j;
        int n = floatChannel3.strideSize * j;
        int i1 = floatChannel4.strideSize * j;
        int i2 = floatChannel5.strideSize * j;
        float f2 = floatChannel3.data[n + 0];
        float f3 = floatChannel3.data[n + 1];
        float f4 = floatChannel3.data[n + 2];
        float f5 = floatChannel2.data[m + 0];
        float f6 = floatChannel2.data[m + 1];
        float f7 = floatChannel2.data[m + 2];
        float f8 = floatChannel2.data[m + 3];
        float f9 = floatChannel2.data[m + 4] * f1;
        float f10 = floatChannel2.data[m + 5] * f1;
        float f11 = floatChannel4.data[i1 + 0];
        f1 = floatChannel4.data[i1 + 1];
        float f12 = floatChannel4.data[i1 + 2];
        float f13 = floatChannel4.data[i1 + 3];
        float f14 = floatChannel5.data[i2 + 0];
        float f15 = floatChannel5.data[i2 + 1];
        float[] arrayOfFloat = this.vertices;
        float f16 = -f9;
        float f17 = -f10;
        putVertex(arrayOfFloat, k, f2, f3, f4, f5, f8, f16, f17, f14, f15, f11, f1, f12, f13);
        i2 = k + this.currentVertexSize;
        putVertex(this.vertices, i2, f2, f3, f4, f7, f8, f9, f17, f14, f15, f11, f1, f12, f13);
        n = i2 + this.currentVertexSize;
        putVertex(this.vertices, n, f2, f3, f4, f7, f6, f9, f10, f14, f15, f11, f1, f12, f13);
        i2 = this.currentVertexSize;
        putVertex(this.vertices, n + i2, f2, f3, f4, f5, f6, f16, f10, f14, f15, f11, f1, f12, f13);
        i2 = this.currentVertexSize;
        j++;
        b++;
      } 
    } 
  }
  
  private void fillVerticesToScreenCPU(int[] paramArrayOfInt) {
    Vector3 vector31 = TMP_V3.set(this.camera.direction).scl(-1.0F);
    Vector3 vector32 = TMP_V4.set(this.camera.up).crs(vector31).nor();
    Vector3 vector33 = this.camera.up;
    Iterator iterator = this.renderData.iterator();
    byte b = 0;
    while (iterator.hasNext()) {
      BillboardControllerRenderData billboardControllerRenderData = (BillboardControllerRenderData)iterator.next();
      ParallelArray.FloatChannel floatChannel1 = billboardControllerRenderData.scaleChannel;
      ParallelArray.FloatChannel floatChannel2 = billboardControllerRenderData.regionChannel;
      ParallelArray.FloatChannel floatChannel3 = billboardControllerRenderData.positionChannel;
      ParallelArray.FloatChannel floatChannel4 = billboardControllerRenderData.colorChannel;
      ParallelArray.FloatChannel floatChannel5 = billboardControllerRenderData.rotationChannel;
      int i = billboardControllerRenderData.controller.particles.size;
      int j = 0;
      while (j < i) {
        int k = paramArrayOfInt[b] * this.currentVertexSize * 4;
        float f1 = floatChannel1.data[floatChannel1.strideSize * j];
        int m = floatChannel2.strideSize * j;
        int n = floatChannel3.strideSize * j;
        int i1 = floatChannel4.strideSize * j;
        int i2 = floatChannel5.strideSize * j;
        float f2 = floatChannel3.data[n + 0];
        float f3 = floatChannel3.data[n + 1];
        float f4 = floatChannel3.data[n + 2];
        float f5 = floatChannel2.data[m + 0];
        float f6 = floatChannel2.data[m + 1];
        float f7 = floatChannel2.data[m + 2];
        float f8 = floatChannel2.data[m + 3];
        float f9 = floatChannel2.data[m + 4];
        float f10 = floatChannel2.data[m + 5];
        float f11 = floatChannel4.data[i1 + 0];
        float f12 = floatChannel4.data[i1 + 1];
        float f13 = floatChannel4.data[i1 + 2];
        float f14 = floatChannel4.data[i1 + 3];
        float f15 = floatChannel5.data[i2 + 0];
        float f16 = floatChannel5.data[i2 + 1];
        TMP_V1.set(vector32).scl(f9 * f1);
        TMP_V2.set(vector33).scl(f10 * f1);
        if (f15 != 1.0F) {
          TMP_M3.setToRotation(vector31, f15, f16);
          putVertex(this.vertices, k, TMP_V6.set(-TMP_V1.x - TMP_V2.x, -TMP_V1.y - TMP_V2.y, -TMP_V1.z - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f8, f11, f12, f13, f14);
          n = k + this.currentVertexSize;
          putVertex(this.vertices, n, TMP_V6.set(TMP_V1.x - TMP_V2.x, TMP_V1.y - TMP_V2.y, TMP_V1.z - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f8, f11, f12, f13, f14);
          m = n + this.currentVertexSize;
          putVertex(this.vertices, m, TMP_V6.set(TMP_V1.x + TMP_V2.x, TMP_V1.y + TMP_V2.y, TMP_V1.z + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f6, f11, f12, f13, f14);
          n = this.currentVertexSize;
          putVertex(this.vertices, m + n, TMP_V6.set(-TMP_V1.x + TMP_V2.x, -TMP_V1.y + TMP_V2.y, -TMP_V1.z + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f6, f11, f12, f13, f14);
        } else {
          putVertex(this.vertices, k, TMP_V6.set(-TMP_V1.x - TMP_V2.x + f2, -TMP_V1.y - TMP_V2.y + f3, -TMP_V1.z - TMP_V2.z + f4), f5, f8, f11, f12, f13, f14);
          n = k + this.currentVertexSize;
          putVertex(this.vertices, n, TMP_V6.set(TMP_V1.x - TMP_V2.x + f2, TMP_V1.y - TMP_V2.y + f3, TMP_V1.z - TMP_V2.z + f4), f7, f8, f11, f12, f13, f14);
          n += this.currentVertexSize;
          putVertex(this.vertices, n, TMP_V6.set(TMP_V1.x + TMP_V2.x + f2, TMP_V1.y + TMP_V2.y + f3, TMP_V1.z + TMP_V2.z + f4), f7, f6, f11, f12, f13, f14);
          m = this.currentVertexSize;
          putVertex(this.vertices, n + m, TMP_V6.set(-TMP_V1.x + TMP_V2.x + f2, -TMP_V1.y + TMP_V2.y + f3, -TMP_V1.z + TMP_V2.z + f4), f5, f6, f11, f12, f13, f14);
        } 
        j++;
        b++;
      } 
    } 
  }
  
  private void fillVerticesToViewPointCPU(int[] paramArrayOfInt) {
    Iterator iterator = this.renderData.iterator();
    byte b = 0;
    while (iterator.hasNext()) {
      BillboardControllerRenderData billboardControllerRenderData = (BillboardControllerRenderData)iterator.next();
      ParallelArray.FloatChannel floatChannel1 = billboardControllerRenderData.scaleChannel;
      ParallelArray.FloatChannel floatChannel2 = billboardControllerRenderData.regionChannel;
      ParallelArray.FloatChannel floatChannel3 = billboardControllerRenderData.positionChannel;
      ParallelArray.FloatChannel floatChannel4 = billboardControllerRenderData.colorChannel;
      ParallelArray.FloatChannel floatChannel5 = billboardControllerRenderData.rotationChannel;
      int i = billboardControllerRenderData.controller.particles.size;
      int j = 0;
      while (j < i) {
        int k = paramArrayOfInt[b] * this.currentVertexSize * 4;
        float f1 = floatChannel1.data[floatChannel1.strideSize * j];
        int m = floatChannel2.strideSize * j;
        int n = floatChannel3.strideSize * j;
        int i1 = floatChannel4.strideSize * j;
        int i2 = floatChannel5.strideSize * j;
        float f2 = floatChannel3.data[n + 0];
        float f3 = floatChannel3.data[n + 1];
        float f4 = floatChannel3.data[n + 2];
        float f5 = floatChannel2.data[m + 0];
        float f6 = floatChannel2.data[m + 1];
        float f7 = floatChannel2.data[m + 2];
        float f8 = floatChannel2.data[m + 3];
        float f9 = floatChannel2.data[m + 4];
        float f10 = floatChannel2.data[m + 5];
        float f11 = floatChannel4.data[i1 + 0];
        float f12 = floatChannel4.data[i1 + 1];
        float f13 = floatChannel4.data[i1 + 2];
        float f14 = floatChannel4.data[i1 + 3];
        float f15 = floatChannel5.data[i2 + 0];
        float f16 = floatChannel5.data[i2 + 1];
        Vector3 vector32 = TMP_V3.set(this.camera.position).sub(f2, f3, f4).nor();
        Vector3 vector33 = TMP_V1.set(this.camera.up).crs(vector32).nor();
        Vector3 vector31 = TMP_V2.set(vector32).crs(vector33);
        vector33.scl(f9 * f1);
        vector31.scl(f10 * f1);
        if (f15 != 1.0F) {
          TMP_M3.setToRotation(vector32, f15, f16);
          putVertex(this.vertices, k, TMP_V6.set(-TMP_V1.x - TMP_V2.x, -TMP_V1.y - TMP_V2.y, -TMP_V1.z - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f8, f11, f12, f13, f14);
          k = this.currentVertexSize + k;
          putVertex(this.vertices, k, TMP_V6.set(TMP_V1.x - TMP_V2.x, TMP_V1.y - TMP_V2.y, TMP_V1.z - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f8, f11, f12, f13, f14);
          k += this.currentVertexSize;
          putVertex(this.vertices, k, TMP_V6.set(TMP_V1.x + TMP_V2.x, TMP_V1.y + TMP_V2.y, TMP_V1.z + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f6, f11, f12, f13, f14);
          i1 = this.currentVertexSize;
          putVertex(this.vertices, k + i1, TMP_V6.set(-TMP_V1.x + TMP_V2.x, -TMP_V1.y + TMP_V2.y, -TMP_V1.z + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f6, f11, f12, f13, f14);
        } else {
          putVertex(this.vertices, k, TMP_V6.set(-TMP_V1.x - TMP_V2.x + f2, -TMP_V1.y - TMP_V2.y + f3, -TMP_V1.z - TMP_V2.z + f4), f5, f8, f11, f12, f13, f14);
          k = this.currentVertexSize + k;
          putVertex(this.vertices, k, TMP_V6.set(TMP_V1.x - TMP_V2.x + f2, TMP_V1.y - TMP_V2.y + f3, TMP_V1.z - TMP_V2.z + f4), f7, f8, f11, f12, f13, f14);
          k += this.currentVertexSize;
          putVertex(this.vertices, k, TMP_V6.set(TMP_V1.x + TMP_V2.x + f2, TMP_V1.y + TMP_V2.y + f3, TMP_V1.z + TMP_V2.z + f4), f7, f6, f11, f12, f13, f14);
          i1 = this.currentVertexSize;
          putVertex(this.vertices, k + i1, TMP_V6.set(-TMP_V1.x + TMP_V2.x + f2, -TMP_V1.y + TMP_V2.y + f3, -TMP_V1.z + TMP_V2.z + f4), f5, f6, f11, f12, f13, f14);
        } 
        j++;
        b++;
      } 
    } 
  }
  
  private void initRenderData() {
    setVertexData();
    clearRenderablesPool();
    allocShader();
    resetCapacity();
  }
  
  private static void putVertex(float[] paramArrayOfFloat, int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13) {
    int i = GPU_POSITION_OFFSET;
    paramArrayOfFloat[paramInt + i] = paramFloat1;
    paramArrayOfFloat[paramInt + i + 1] = paramFloat2;
    paramArrayOfFloat[i + paramInt + 2] = paramFloat3;
    i = GPU_UV_OFFSET;
    paramArrayOfFloat[paramInt + i] = paramFloat4;
    paramArrayOfFloat[i + paramInt + 1] = paramFloat5;
    i = GPU_SIZE_ROTATION_OFFSET;
    paramArrayOfFloat[paramInt + i] = paramFloat6;
    paramArrayOfFloat[paramInt + i + 1] = paramFloat7;
    paramArrayOfFloat[paramInt + i + 2] = paramFloat8;
    paramArrayOfFloat[i + paramInt + 3] = paramFloat9;
    i = GPU_COLOR_OFFSET;
    paramArrayOfFloat[paramInt + i] = paramFloat10;
    paramArrayOfFloat[paramInt + i + 1] = paramFloat11;
    paramArrayOfFloat[paramInt + i + 2] = paramFloat12;
    paramArrayOfFloat[i + paramInt + 3] = paramFloat13;
  }
  
  private static void putVertex(float[] paramArrayOfFloat, int paramInt, Vector3 paramVector3, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    paramArrayOfFloat[CPU_POSITION_OFFSET + paramInt] = paramVector3.x;
    paramArrayOfFloat[CPU_POSITION_OFFSET + paramInt + 1] = paramVector3.y;
    paramArrayOfFloat[CPU_POSITION_OFFSET + paramInt + 2] = paramVector3.z;
    int i = CPU_UV_OFFSET;
    paramArrayOfFloat[paramInt + i] = paramFloat1;
    paramArrayOfFloat[i + paramInt + 1] = paramFloat2;
    i = CPU_COLOR_OFFSET;
    paramArrayOfFloat[paramInt + i] = paramFloat3;
    paramArrayOfFloat[paramInt + i + 1] = paramFloat4;
    paramArrayOfFloat[paramInt + i + 2] = paramFloat5;
    paramArrayOfFloat[paramInt + i + 3] = paramFloat6;
  }
  
  public void allocParticlesData(int paramInt) {
    this.vertices = new float[this.currentVertexSize * 4 * paramInt];
    allocRenderables(paramInt);
  }
  
  protected Renderable allocRenderable() {
    Renderable renderable = new Renderable();
    renderable.meshPart.primitiveType = 4;
    renderable.meshPart.offset = 0;
    renderable.material = new Material(new Attribute[] { this.blendingAttribute, this.depthTestAttribute, TextureAttribute.createDiffuse(this.texture) });
    renderable.meshPart.mesh = new Mesh(false, '翼', '뿺', this.currentAttributes);
    renderable.meshPart.mesh.setIndices(this.indices);
    renderable.shader = this.shader;
    return renderable;
  }
  
  public void begin() {
    super.begin();
    this.renderablePool.freeAll(this.renderables);
    this.renderables.clear();
  }
  
  protected void flush(int[] paramArrayOfInt) {
    if (this.useGPU) {
      fillVerticesGPU(paramArrayOfInt);
    } else if (this.mode == ParticleShader.AlignMode.Screen) {
      fillVerticesToScreenCPU(paramArrayOfInt);
    } else if (this.mode == ParticleShader.AlignMode.ViewPoint) {
      fillVerticesToViewPointCPU(paramArrayOfInt);
    } 
    int i = this.bufferedParticlesCount * 4;
    for (int j = 0; j < i; j += k) {
      int k = Math.min(i - j, 32764);
      Renderable renderable = (Renderable)this.renderablePool.obtain();
      renderable.meshPart.size = k / 4 * 6;
      Mesh mesh = renderable.meshPart.mesh;
      float[] arrayOfFloat = this.vertices;
      int m = this.currentVertexSize;
      mesh.setVertices(arrayOfFloat, m * j, m * k);
      renderable.meshPart.update();
      this.renderables.add(renderable);
    } 
  }
  
  public ParticleShader.AlignMode getAlignMode() { return this.mode; }
  
  public void getRenderables(Array<Renderable> paramArray, Pool<Renderable> paramPool) {
    for (Renderable renderable : this.renderables)
      paramArray.add(((Renderable)paramPool.obtain()).set(renderable)); 
  }
  
  protected Shader getShader(Renderable paramRenderable) {
    DefaultShader defaultShader;
    if (this.useGPU) {
      defaultShader = new ParticleShader(paramRenderable, new ParticleShader.Config(this.mode));
    } else {
      defaultShader = new DefaultShader(defaultShader);
    } 
    defaultShader.init();
    return defaultShader;
  }
  
  public Texture getTexture() { return this.texture; }
  
  public boolean isUseGPU() { return this.useGPU; }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.getSaveData("billboardBatch");
    if (saveData != null) {
      setTexture((Texture)paramAssetManager.get(saveData.loadAsset()));
      Config config = (Config)saveData.load("cfg");
      setUseGpu(config.useGPU);
      setAlignMode(config.mode);
    } 
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {
    ResourceData.SaveData saveData = paramResourceData.createSaveData("billboardBatch");
    saveData.save("cfg", new Config(this.useGPU, this.mode));
    saveData.saveAsset(paramAssetManager.getAssetFileName(this.texture), Texture.class);
  }
  
  public void setAlignMode(ParticleShader.AlignMode paramAlignMode) {
    if (paramAlignMode != this.mode) {
      this.mode = paramAlignMode;
      if (this.useGPU) {
        initRenderData();
        allocRenderables(this.bufferedParticlesCount);
      } 
    } 
  }
  
  public void setTexture(Texture paramTexture) {
    this.renderablePool.freeAll(this.renderables);
    this.renderables.clear();
    int i = this.renderablePool.getFree();
    for (byte b = 0; b < i; b++)
      ((TextureAttribute)((Renderable)this.renderablePool.obtain()).material.get(TextureAttribute.Diffuse)).textureDescription.texture = paramTexture; 
    this.texture = paramTexture;
  }
  
  public void setUseGpu(boolean paramBoolean) {
    if (this.useGPU != paramBoolean) {
      this.useGPU = paramBoolean;
      initRenderData();
      allocRenderables(this.bufferedParticlesCount);
    } 
  }
  
  public void setVertexData() {
    if (this.useGPU) {
      this.currentAttributes = GPU_ATTRIBUTES;
      this.currentVertexSize = GPU_VERTEX_SIZE;
    } else {
      this.currentAttributes = CPU_ATTRIBUTES;
      this.currentVertexSize = CPU_VERTEX_SIZE;
    } 
  }
  
  public static class Config {
    ParticleShader.AlignMode mode;
    
    boolean useGPU;
    
    public Config() {}
    
    public Config(boolean param1Boolean, ParticleShader.AlignMode param1AlignMode) {
      this.useGPU = param1Boolean;
      this.mode = param1AlignMode;
    }
  }
  
  private class RenderablePool extends Pool<Renderable> {
    public Renderable newObject() { return BillboardParticleBatch.this.allocRenderable(); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */