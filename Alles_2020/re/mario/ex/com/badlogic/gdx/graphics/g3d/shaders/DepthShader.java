package com.badlogic.gdx.graphics.g3d.shaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix4;

public class DepthShader extends DefaultShader {
  private static String defaultFragmentShader;
  
  private static String defaultVertexShader;
  
  private static final Attributes tmpAttributes = new Attributes();
  
  private final FloatAttribute alphaTestAttribute;
  
  public final int numBones;
  
  public final int weights;
  
  public DepthShader(Renderable paramRenderable) { this(paramRenderable, new Config()); }
  
  public DepthShader(Renderable paramRenderable, Config paramConfig) { this(paramRenderable, paramConfig, createPrefix(paramRenderable, paramConfig)); }
  
  public DepthShader(Renderable paramRenderable, Config paramConfig, ShaderProgram paramShaderProgram) {
    super(paramRenderable, paramConfig, paramShaderProgram);
    combineAttributes(paramRenderable);
    Matrix4[] arrayOfMatrix4 = paramRenderable.bones;
    byte b = 0;
    if (arrayOfMatrix4 == null) {
      i = 0;
    } else {
      i = paramConfig.numBones;
    } 
    this.numBones = i;
    int j = paramRenderable.meshPart.mesh.getVertexAttributes().size();
    int k;
    for (k = 0; b < j; k = i) {
      VertexAttribute vertexAttribute = paramRenderable.meshPart.mesh.getVertexAttributes().get(b);
      i = k;
      if (vertexAttribute.usage == 64)
        i = k | 1 << vertexAttribute.unit; 
      b++;
    } 
    this.weights = k;
    this.alphaTestAttribute = new FloatAttribute(FloatAttribute.AlphaTest, paramConfig.defaultAlphaTest);
  }
  
  public DepthShader(Renderable paramRenderable, Config paramConfig, String paramString) { this(paramRenderable, paramConfig, paramString, str1, str2); }
  
  public DepthShader(Renderable paramRenderable, Config paramConfig, String paramString1, String paramString2, String paramString3) { this(paramRenderable, paramConfig, new ShaderProgram(paramString2, stringBuilder.toString())); }
  
  private static final Attributes combineAttributes(Renderable paramRenderable) {
    tmpAttributes.clear();
    if (paramRenderable.environment != null)
      tmpAttributes.set(paramRenderable.environment); 
    if (paramRenderable.material != null)
      tmpAttributes.set(paramRenderable.material); 
    return tmpAttributes;
  }
  
  public static String createPrefix(Renderable paramRenderable, Config paramConfig) {
    String str2 = DefaultShader.createPrefix(paramRenderable, paramConfig);
    String str1 = str2;
    if (!paramConfig.depthBufferOnly) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str2);
      stringBuilder.append("#define PackedDepthFlag\n");
      str1 = stringBuilder.toString();
    } 
    return str1;
  }
  
  public static final String getDefaultFragmentShader() {
    if (defaultFragmentShader == null)
      defaultFragmentShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/depth.fragment.glsl").readString(); 
    return defaultFragmentShader;
  }
  
  public static final String getDefaultVertexShader() {
    if (defaultVertexShader == null)
      defaultVertexShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/depth.vertex.glsl").readString(); 
    return defaultVertexShader;
  }
  
  public void begin(Camera paramCamera, RenderContext paramRenderContext) { super.begin(paramCamera, paramRenderContext); }
  
  public boolean canRender(Renderable paramRenderable) {
    Attributes attributes = combineAttributes(paramRenderable);
    boolean bool = attributes.has(BlendingAttribute.Type);
    boolean bool1 = true;
    if (bool) {
      if ((this.attributesMask & BlendingAttribute.Type) != BlendingAttribute.Type)
        return false; 
      boolean bool2 = attributes.has(TextureAttribute.Diffuse);
      if ((this.attributesMask & TextureAttribute.Diffuse) == TextureAttribute.Diffuse) {
        bool = true;
      } else {
        bool = false;
      } 
      if (bool2 != bool)
        return false; 
    } 
    if ((paramRenderable.meshPart.mesh.getVertexAttributes().getMask() & 0x40L) == 64L) {
      i = 1;
    } else {
      i = 0;
    } 
    if (this.numBones > 0) {
      b = 1;
    } else {
      b = 0;
    } 
    if (i != b)
      return false; 
    if (!i)
      return true; 
    int j = paramRenderable.meshPart.mesh.getVertexAttributes().size();
    byte b = 0;
    int i;
    for (i = 0; b < j; i = k) {
      VertexAttribute vertexAttribute = paramRenderable.meshPart.mesh.getVertexAttributes().get(b);
      int k = i;
      if (vertexAttribute.usage == 64)
        k = i | 1 << vertexAttribute.unit; 
      b++;
    } 
    if (i == this.weights) {
      bool = bool1;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void end() { super.end(); }
  
  public void render(Renderable paramRenderable, Attributes paramAttributes) {
    if (paramAttributes.has(BlendingAttribute.Type)) {
      BlendingAttribute blendingAttribute = (BlendingAttribute)paramAttributes.get(BlendingAttribute.Type);
      paramAttributes.remove(BlendingAttribute.Type);
      boolean bool = paramAttributes.has(FloatAttribute.AlphaTest);
      if (!bool)
        paramAttributes.set(this.alphaTestAttribute); 
      if (blendingAttribute.opacity >= ((FloatAttribute)paramAttributes.get(FloatAttribute.AlphaTest)).value)
        super.render(paramRenderable, paramAttributes); 
      if (!bool)
        paramAttributes.remove(FloatAttribute.AlphaTest); 
      paramAttributes.set(blendingAttribute);
    } else {
      super.render(paramRenderable, paramAttributes);
    } 
  }
  
  public static class Config extends DefaultShader.Config {
    public float defaultAlphaTest = 0.5F;
    
    public boolean depthBufferOnly = false;
    
    public Config() { this.defaultCullFace = 1028; }
    
    public Config(String param1String1, String param1String2) { super(param1String1, param1String2); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/shaders/DepthShader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */