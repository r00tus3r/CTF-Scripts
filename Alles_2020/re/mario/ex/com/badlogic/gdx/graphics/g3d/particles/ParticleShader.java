package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.IntAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.shaders.BaseShader;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class ParticleShader extends BaseShader {
  static final Vector3 TMP_VECTOR3;
  
  private static String defaultFragmentShader;
  
  private static String defaultVertexShader;
  
  protected static long implementedFlags = BlendingAttribute.Type | TextureAttribute.Diffuse;
  
  private static final long optionalAttributes;
  
  protected final Config config;
  
  Material currentMaterial;
  
  private long materialMask;
  
  private Renderable renderable;
  
  private long vertexMask;
  
  static  {
    TMP_VECTOR3 = new Vector3();
    optionalAttributes = IntAttribute.CullFace | DepthTestAttribute.Type;
  }
  
  public ParticleShader(Renderable paramRenderable) { this(paramRenderable, new Config()); }
  
  public ParticleShader(Renderable paramRenderable, Config paramConfig) { this(paramRenderable, paramConfig, createPrefix(paramRenderable, paramConfig)); }
  
  public ParticleShader(Renderable paramRenderable, Config paramConfig, ShaderProgram paramShaderProgram) {
    this.config = paramConfig;
    this.program = paramShaderProgram;
    this.renderable = paramRenderable;
    this.materialMask = paramRenderable.material.getMask() | optionalAttributes;
    this.vertexMask = paramRenderable.meshPart.mesh.getVertexAttributes().getMask();
    if (!paramConfig.ignoreUnimplemented) {
      long l1 = implementedFlags;
      long l2 = this.materialMask;
      if ((l1 & l2) != l2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Some attributes not implemented yet (");
        stringBuilder.append(this.materialMask);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
    } 
    register(DefaultShader.Inputs.viewTrans, DefaultShader.Setters.viewTrans);
    register(DefaultShader.Inputs.projViewTrans, DefaultShader.Setters.projViewTrans);
    register(DefaultShader.Inputs.projTrans, DefaultShader.Setters.projTrans);
    register(Inputs.screenWidth, Setters.screenWidth);
    register(DefaultShader.Inputs.cameraUp, Setters.cameraUp);
    register(Inputs.cameraRight, Setters.cameraRight);
    register(Inputs.cameraInvDirection, Setters.cameraInvDirection);
    register(DefaultShader.Inputs.cameraPosition, Setters.cameraPosition);
    register(DefaultShader.Inputs.diffuseTexture, DefaultShader.Setters.diffuseTexture);
  }
  
  public ParticleShader(Renderable paramRenderable, Config paramConfig, String paramString) { this(paramRenderable, paramConfig, paramString, str1, str2); }
  
  public ParticleShader(Renderable paramRenderable, Config paramConfig, String paramString1, String paramString2, String paramString3) { this(paramRenderable, paramConfig, new ShaderProgram(paramString2, stringBuilder.toString())); }
  
  public static String createPrefix(Renderable paramRenderable, Config paramConfig) {
    String str2;
    if (Gdx.app.getType() == Application.ApplicationType.Desktop) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("");
      stringBuilder.append("#version 120\n");
      str2 = stringBuilder.toString();
    } else {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("");
      stringBuilder.append("#version 100\n");
      str2 = stringBuilder.toString();
    } 
    String str1 = str2;
    if (paramConfig.type == ParticleType.Billboard) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str2);
      stringBuilder.append("#define billboard\n");
      str2 = stringBuilder.toString();
      if (paramConfig.align == AlignMode.Screen) {
        stringBuilder = new StringBuilder();
        stringBuilder.append(str2);
        stringBuilder.append("#define screenFacing\n");
        String str = stringBuilder.toString();
      } else {
        String str = str2;
        if (paramConfig.align == AlignMode.ViewPoint) {
          StringBuilder stringBuilder1 = new StringBuilder();
          stringBuilder1.append(str2);
          stringBuilder1.append("#define viewPointFacing\n");
          str1 = stringBuilder1.toString();
        } 
      } 
    } 
    return str1;
  }
  
  public static String getDefaultFragmentShader() {
    if (defaultFragmentShader == null)
      defaultFragmentShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/particles/particles.fragment.glsl").readString(); 
    return defaultFragmentShader;
  }
  
  public static String getDefaultVertexShader() {
    if (defaultVertexShader == null)
      defaultVertexShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/particles/particles.vertex.glsl").readString(); 
    return defaultVertexShader;
  }
  
  public void begin(Camera paramCamera, RenderContext paramRenderContext) { super.begin(paramCamera, paramRenderContext); }
  
  protected void bindMaterial(Renderable paramRenderable) {
    int j;
    int i;
    if (this.currentMaterial == paramRenderable.material)
      return; 
    if (this.config.defaultCullFace == -1) {
      i = 1029;
    } else {
      i = this.config.defaultCullFace;
    } 
    if (this.config.defaultDepthFunc == -1) {
      j = 515;
    } else {
      j = this.config.defaultDepthFunc;
    } 
    float f1 = 0.0F;
    float f2 = 1.0F;
    this.currentMaterial = paramRenderable.material;
    Iterator iterator = this.currentMaterial.iterator();
    boolean bool = true;
    while (iterator.hasNext()) {
      DepthTestAttribute depthTestAttribute = (Attribute)iterator.next();
      long l = depthTestAttribute.type;
      if (BlendingAttribute.is(l)) {
        RenderContext renderContext = this.context;
        depthTestAttribute = (BlendingAttribute)depthTestAttribute;
        renderContext.setBlending(true, depthTestAttribute.sourceFunction, depthTestAttribute.destFunction);
        continue;
      } 
      if ((l & DepthTestAttribute.Type) == DepthTestAttribute.Type) {
        depthTestAttribute = (DepthTestAttribute)depthTestAttribute;
        j = depthTestAttribute.depthFunc;
        f1 = depthTestAttribute.depthRangeNear;
        f2 = depthTestAttribute.depthRangeFar;
        bool = depthTestAttribute.depthMask;
        continue;
      } 
      if (this.config.ignoreUnimplemented)
        continue; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Unknown material attribute: ");
      stringBuilder.append(depthTestAttribute.toString());
      throw new GdxRuntimeException(stringBuilder.toString());
    } 
    this.context.setCullFace(i);
    this.context.setDepthTest(j, f1, f2);
    this.context.setDepthMask(bool);
  }
  
  public boolean canRender(Renderable paramRenderable) {
    boolean bool;
    if (this.materialMask == (paramRenderable.material.getMask() | optionalAttributes) && this.vertexMask == paramRenderable.meshPart.mesh.getVertexAttributes().getMask()) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int compareTo(Shader paramShader) {
    if (paramShader == null)
      return -1; 
    if (paramShader == this);
    return 0;
  }
  
  public void dispose() {
    this.program.dispose();
    super.dispose();
  }
  
  public void end() {
    this.currentMaterial = null;
    super.end();
  }
  
  public boolean equals(ParticleShader paramParticleShader) {
    boolean bool;
    if (paramParticleShader == this) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool;
    if (paramObject instanceof ParticleShader && equals((ParticleShader)paramObject)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int getDefaultCullFace() {
    int i;
    if (this.config.defaultCullFace == -1) {
      i = 1029;
    } else {
      i = this.config.defaultCullFace;
    } 
    return i;
  }
  
  public int getDefaultDepthFunc() {
    int i;
    if (this.config.defaultDepthFunc == -1) {
      i = 515;
    } else {
      i = this.config.defaultDepthFunc;
    } 
    return i;
  }
  
  public void init() {
    ShaderProgram shaderProgram = this.program;
    this.program = null;
    init(shaderProgram, this.renderable);
    this.renderable = null;
  }
  
  public void render(Renderable paramRenderable) {
    if (!paramRenderable.material.has(BlendingAttribute.Type))
      this.context.setBlending(false, 770, 771); 
    bindMaterial(paramRenderable);
    super.render(paramRenderable);
  }
  
  public void setDefaultCullFace(int paramInt) { this.config.defaultCullFace = paramInt; }
  
  public void setDefaultDepthFunc(int paramInt) { this.config.defaultDepthFunc = paramInt; }
  
  public enum AlignMode {
    Screen, ViewPoint;
    
    static  {
      $VALUES = new AlignMode[] { Screen, ViewPoint };
    }
  }
  
  public static class Config {
    public ParticleShader.AlignMode align = ParticleShader.AlignMode.Screen;
    
    public int defaultCullFace = -1;
    
    public int defaultDepthFunc = -1;
    
    public String fragmentShader = null;
    
    public boolean ignoreUnimplemented = true;
    
    public ParticleShader.ParticleType type = ParticleShader.ParticleType.Billboard;
    
    public String vertexShader = null;
    
    public Config() {}
    
    public Config(ParticleShader.AlignMode param1AlignMode) { this.align = param1AlignMode; }
    
    public Config(ParticleShader.AlignMode param1AlignMode, ParticleShader.ParticleType param1ParticleType) {
      this.align = param1AlignMode;
      this.type = param1ParticleType;
    }
    
    public Config(ParticleShader.ParticleType param1ParticleType) { this.type = param1ParticleType; }
    
    public Config(String param1String1, String param1String2) {
      this.vertexShader = param1String1;
      this.fragmentShader = param1String2;
    }
  }
  
  public static class Inputs {
    public static final BaseShader.Uniform cameraInvDirection;
    
    public static final BaseShader.Uniform cameraRight = new BaseShader.Uniform("u_cameraRight");
    
    public static final BaseShader.Uniform regionSize;
    
    public static final BaseShader.Uniform screenWidth;
    
    static  {
      cameraInvDirection = new BaseShader.Uniform("u_cameraInvDirection");
      screenWidth = new BaseShader.Uniform("u_screenWidth");
      regionSize = new BaseShader.Uniform("u_regionSize");
    }
  }
  
  public enum ParticleType {
    Billboard, Point;
    
    static  {
      $VALUES = new ParticleType[] { Billboard, Point };
    }
  }
  
  public static class Setters {
    public static final BaseShader.Setter cameraInvDirection;
    
    public static final BaseShader.Setter cameraPosition;
    
    public static final BaseShader.Setter cameraRight = new BaseShader.Setter() {
        public boolean isGlobal(BaseShader param2BaseShader, int param2Int) { return true; }
        
        public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ParticleShader.TMP_VECTOR3.set(param2BaseShader.camera.direction).crs(param2BaseShader.camera.up).nor()); }
      };
    
    public static final BaseShader.Setter cameraUp = new BaseShader.Setter() {
        public boolean isGlobal(BaseShader param2BaseShader, int param2Int) { return true; }
        
        public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ParticleShader.TMP_VECTOR3.set(param2BaseShader.camera.up).nor()); }
      };
    
    public static final BaseShader.Setter screenWidth;
    
    public static final BaseShader.Setter worldViewTrans;
    
    static  {
      cameraInvDirection = new BaseShader.Setter() {
          public boolean isGlobal(BaseShader param2BaseShader, int param2Int) { return true; }
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ParticleShader.TMP_VECTOR3.set(-param2BaseShader.camera.direction.x, -param2BaseShader.camera.direction.y, -param2BaseShader.camera.direction.z).nor()); }
        };
      cameraPosition = new BaseShader.Setter() {
          public boolean isGlobal(BaseShader param2BaseShader, int param2Int) { return true; }
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.position); }
        };
      screenWidth = new BaseShader.Setter() {
          public boolean isGlobal(BaseShader param2BaseShader, int param2Int) { return true; }
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, Gdx.graphics.getWidth()); }
        };
      worldViewTrans = new BaseShader.Setter() {
          final Matrix4 temp = new Matrix4();
          
          public boolean isGlobal(BaseShader param2BaseShader, int param2Int) { return false; }
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, this.temp.set(param2BaseShader.camera.view).mul(param2Renderable.worldTransform)); }
        };
    }
  }
  
  static final class null implements BaseShader.Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return true; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ParticleShader.TMP_VECTOR3.set(param1BaseShader.camera.direction).crs(param1BaseShader.camera.up).nor()); }
  }
  
  static final class null implements BaseShader.Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return true; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ParticleShader.TMP_VECTOR3.set(param1BaseShader.camera.up).nor()); }
  }
  
  static final class null implements BaseShader.Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return true; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ParticleShader.TMP_VECTOR3.set(-param1BaseShader.camera.direction.x, -param1BaseShader.camera.direction.y, -param1BaseShader.camera.direction.z).nor()); }
  }
  
  static final class null implements BaseShader.Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return true; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.position); }
  }
  
  static final class null implements BaseShader.Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return true; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, Gdx.graphics.getWidth()); }
  }
  
  static final class null implements BaseShader.Setter {
    final Matrix4 temp = new Matrix4();
    
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return false; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, this.temp.set(param1BaseShader.camera.view).mul(param1Renderable.worldTransform)); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleShader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */