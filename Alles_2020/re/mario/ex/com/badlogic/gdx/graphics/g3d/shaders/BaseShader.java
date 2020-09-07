package com.badlogic.gdx.graphics.g3d.shaders;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.IntIntMap;

public abstract class BaseShader implements Shader {
  private final IntIntMap attributes = new IntIntMap();
  
  public Camera camera;
  
  private Attributes combinedAttributes = new Attributes();
  
  public RenderContext context;
  
  private Mesh currentMesh;
  
  private final IntArray globalUniforms = new IntArray();
  
  private final IntArray localUniforms = new IntArray();
  
  private int[] locations;
  
  public ShaderProgram program;
  
  private final Array<Setter> setters = new Array();
  
  private final IntArray tempArray = new IntArray();
  
  private final Array<String> uniforms = new Array();
  
  private final Array<Validator> validators = new Array();
  
  private final int[] getAttributeLocations(VertexAttributes paramVertexAttributes) {
    this.tempArray.clear();
    int i = paramVertexAttributes.size();
    for (byte b = 0; b < i; b++)
      this.tempArray.add(this.attributes.get(paramVertexAttributes.get(b).getKey(), -1)); 
    this.tempArray.shrink();
    return this.tempArray.items;
  }
  
  public void begin(Camera paramCamera, RenderContext paramRenderContext) {
    this.camera = paramCamera;
    this.context = paramRenderContext;
    this.program.begin();
    this.currentMesh = null;
    for (byte b = 0; b < this.globalUniforms.size; b++) {
      Array array = this.setters;
      int i = this.globalUniforms.get(b);
      if (array.get(i) != null)
        ((Setter)this.setters.get(i)).set(this, i, null, null); 
    } 
  }
  
  public void dispose() {
    this.program = null;
    this.uniforms.clear();
    this.validators.clear();
    this.setters.clear();
    this.localUniforms.clear();
    this.globalUniforms.clear();
    this.locations = null;
  }
  
  public void end() {
    Mesh mesh = this.currentMesh;
    if (mesh != null) {
      mesh.unbind(this.program, this.tempArray.items);
      this.currentMesh = null;
    } 
    this.program.end();
  }
  
  public String getUniformAlias(int paramInt) { return (String)this.uniforms.get(paramInt); }
  
  public int getUniformID(String paramString) {
    int i = this.uniforms.size;
    for (byte b = 0; b < i; b++) {
      if (((String)this.uniforms.get(b)).equals(paramString))
        return b; 
    } 
    return -1;
  }
  
  public final boolean has(int paramInt) {
    if (paramInt >= 0) {
      int[] arrayOfInt = this.locations;
      if (paramInt < arrayOfInt.length && arrayOfInt[paramInt] >= 0)
        return true; 
    } 
    return false;
  }
  
  public void init(ShaderProgram paramShaderProgram, Renderable paramRenderable) {
    if (this.locations == null) {
      if (paramShaderProgram.isCompiled()) {
        this.program = paramShaderProgram;
        int i = this.uniforms.size;
        this.locations = new int[i];
        int j = 0;
        byte b;
        for (b = 0; b < i; b++) {
          String str = (String)this.uniforms.get(b);
          Validator validator = (Validator)this.validators.get(b);
          Setter setter = (Setter)this.setters.get(b);
          if (validator != null && !validator.validate(this, b, paramRenderable)) {
            this.locations[b] = -1;
          } else {
            this.locations[b] = paramShaderProgram.fetchUniformLocation(str, false);
            if (this.locations[b] >= 0 && setter != null)
              if (setter.isGlobal(this, b)) {
                this.globalUniforms.add(b);
              } else {
                this.localUniforms.add(b);
              }  
          } 
          if (this.locations[b] < 0) {
            this.validators.set(b, null);
            this.setters.set(b, null);
          } 
        } 
        if (paramRenderable != null) {
          VertexAttributes vertexAttributes = paramRenderable.meshPart.mesh.getVertexAttributes();
          i = vertexAttributes.size();
          for (b = j; b < i; b++) {
            VertexAttribute vertexAttribute = vertexAttributes.get(b);
            j = paramShaderProgram.getAttributeLocation(vertexAttribute.alias);
            if (j >= 0)
              this.attributes.put(vertexAttribute.getKey(), j); 
          } 
        } 
        return;
      } 
      throw new GdxRuntimeException(paramShaderProgram.getLog());
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Already initialized");
    throw gdxRuntimeException;
  }
  
  public final int loc(int paramInt) {
    if (paramInt >= 0) {
      int[] arrayOfInt = this.locations;
      if (paramInt < arrayOfInt.length)
        return arrayOfInt[paramInt]; 
    } 
    return -1;
  }
  
  public int register(Uniform paramUniform) { return register(paramUniform, null); }
  
  public int register(Uniform paramUniform, Setter paramSetter) { return register(paramUniform.alias, paramUniform, paramSetter); }
  
  public int register(String paramString) { return register(paramString, null, null); }
  
  public int register(String paramString, Setter paramSetter) { return register(paramString, null, paramSetter); }
  
  public int register(String paramString, Validator paramValidator) { return register(paramString, paramValidator, null); }
  
  public int register(String paramString, Validator paramValidator, Setter paramSetter) {
    if (this.locations == null) {
      int i = getUniformID(paramString);
      if (i >= 0) {
        this.validators.set(i, paramValidator);
        this.setters.set(i, paramSetter);
        return i;
      } 
      this.uniforms.add(paramString);
      this.validators.add(paramValidator);
      this.setters.add(paramSetter);
      return this.uniforms.size - 1;
    } 
    throw new GdxRuntimeException("Cannot register an uniform after initialization");
  }
  
  public void render(Renderable paramRenderable) {
    if (paramRenderable.worldTransform.det3x3() == 0.0F)
      return; 
    this.combinedAttributes.clear();
    if (paramRenderable.environment != null)
      this.combinedAttributes.set(paramRenderable.environment); 
    if (paramRenderable.material != null)
      this.combinedAttributes.set(paramRenderable.material); 
    render(paramRenderable, this.combinedAttributes);
  }
  
  public void render(Renderable paramRenderable, Attributes paramAttributes) {
    for (byte b = 0; b < this.localUniforms.size; b++) {
      Array array = this.setters;
      int i = this.localUniforms.get(b);
      if (array.get(i) != null)
        ((Setter)this.setters.get(i)).set(this, i, paramRenderable, paramAttributes); 
    } 
    if (this.currentMesh != paramRenderable.meshPart.mesh) {
      Mesh mesh = this.currentMesh;
      if (mesh != null)
        mesh.unbind(this.program, this.tempArray.items); 
      this.currentMesh = paramRenderable.meshPart.mesh;
      this.currentMesh.bind(this.program, getAttributeLocations(paramRenderable.meshPart.mesh.getVertexAttributes()));
    } 
    paramRenderable.meshPart.render(this.program, false);
  }
  
  public final boolean set(int paramInt, float paramFloat) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramFloat);
    return true;
  }
  
  public final boolean set(int paramInt, float paramFloat1, float paramFloat2) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramFloat1, paramFloat2);
    return true;
  }
  
  public final boolean set(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramFloat1, paramFloat2, paramFloat3);
    return true;
  }
  
  public final boolean set(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    return true;
  }
  
  public final boolean set(int paramInt1, int paramInt2) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt1] < 0)
      return false; 
    this.program.setUniformi(arrayOfInt[paramInt1], paramInt2);
    return true;
  }
  
  public final boolean set(int paramInt1, int paramInt2, int paramInt3) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt1] < 0)
      return false; 
    this.program.setUniformi(arrayOfInt[paramInt1], paramInt2, paramInt3);
    return true;
  }
  
  public final boolean set(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt1] < 0)
      return false; 
    this.program.setUniformi(arrayOfInt[paramInt1], paramInt2, paramInt3, paramInt4);
    return true;
  }
  
  public final boolean set(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt1] < 0)
      return false; 
    this.program.setUniformi(arrayOfInt[paramInt1], paramInt2, paramInt3, paramInt4, paramInt5);
    return true;
  }
  
  public final boolean set(int paramInt, Color paramColor) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramColor);
    return true;
  }
  
  public final boolean set(int paramInt, GLTexture paramGLTexture) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformi(arrayOfInt[paramInt], this.context.textureBinder.bind(paramGLTexture));
    return true;
  }
  
  public final boolean set(int paramInt, TextureDescriptor paramTextureDescriptor) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformi(arrayOfInt[paramInt], this.context.textureBinder.bind(paramTextureDescriptor));
    return true;
  }
  
  public final boolean set(int paramInt, Matrix3 paramMatrix3) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformMatrix(arrayOfInt[paramInt], paramMatrix3);
    return true;
  }
  
  public final boolean set(int paramInt, Matrix4 paramMatrix4) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformMatrix(arrayOfInt[paramInt], paramMatrix4);
    return true;
  }
  
  public final boolean set(int paramInt, Vector2 paramVector2) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramVector2);
    return true;
  }
  
  public final boolean set(int paramInt, Vector3 paramVector3) {
    int[] arrayOfInt = this.locations;
    if (arrayOfInt[paramInt] < 0)
      return false; 
    this.program.setUniformf(arrayOfInt[paramInt], paramVector3);
    return true;
  }
  
  public static abstract class GlobalSetter implements Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return true; }
  }
  
  public static abstract class LocalSetter implements Setter {
    public boolean isGlobal(BaseShader param1BaseShader, int param1Int) { return false; }
  }
  
  public static interface Setter {
    boolean isGlobal(BaseShader param1BaseShader, int param1Int);
    
    void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes);
  }
  
  public static class Uniform implements Validator {
    public final String alias;
    
    public final long environmentMask;
    
    public final long materialMask;
    
    public final long overallMask;
    
    public Uniform(String param1String) { this(param1String, 0L, 0L); }
    
    public Uniform(String param1String, long param1Long) { this(param1String, 0L, 0L, param1Long); }
    
    public Uniform(String param1String, long param1Long1, long param1Long2) { this(param1String, param1Long1, param1Long2, 0L); }
    
    public Uniform(String param1String, long param1Long1, long param1Long2, long param1Long3) {
      this.alias = param1String;
      this.materialMask = param1Long1;
      this.environmentMask = param1Long2;
      this.overallMask = param1Long3;
    }
    
    public boolean validate(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable) {
      long l2;
      long l1 = 0L;
      if (param1Renderable != null && param1Renderable.material != null) {
        l2 = param1Renderable.material.getMask();
      } else {
        l2 = 0L;
      } 
      long l3 = l1;
      if (param1Renderable != null) {
        l3 = l1;
        if (param1Renderable.environment != null)
          l3 = param1Renderable.environment.getMask(); 
      } 
      l1 = this.materialMask;
      if ((l2 & l1) == l1) {
        l1 = this.environmentMask;
        if ((l3 & l1) == l1) {
          l1 = this.overallMask;
          if (((l3 | l2) & l1) == l1)
            return true; 
        } 
      } 
      return false;
    }
  }
  
  public static interface Validator {
    boolean validate(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/shaders/BaseShader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */