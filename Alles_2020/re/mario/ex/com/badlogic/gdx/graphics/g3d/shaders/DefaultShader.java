package com.badlogic.gdx.graphics.g3d.shaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Environment;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.CubemapAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DirectionalLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.IntAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.PointLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.SpotLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.environment.AmbientCubemap;
import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight;
import com.badlogic.gdx.graphics.g3d.environment.PointLight;
import com.badlogic.gdx.graphics.g3d.environment.SpotLight;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class DefaultShader extends BaseShader {
  @Deprecated
  public static int defaultCullFace;
  
  @Deprecated
  public static int defaultDepthFunc;
  
  private static String defaultFragmentShader;
  
  private static String defaultVertexShader;
  
  protected static long implementedFlags = BlendingAttribute.Type | TextureAttribute.Diffuse | ColorAttribute.Diffuse | ColorAttribute.Specular | FloatAttribute.Shininess;
  
  private static final long optionalAttributes;
  
  private static final Attributes tmpAttributes;
  
  protected final AmbientCubemap ambientCubemap = new AmbientCubemap();
  
  protected final long attributesMask;
  
  protected final Config config;
  
  protected int dirLightsColorOffset;
  
  protected int dirLightsDirectionOffset;
  
  protected int dirLightsLoc;
  
  protected int dirLightsSize;
  
  protected final DirectionalLight[] directionalLights;
  
  protected final boolean environmentCubemap;
  
  protected final boolean lighting;
  
  private boolean lightsSet;
  
  private final Matrix3 normalMatrix = new Matrix3();
  
  protected final PointLight[] pointLights;
  
  protected int pointLightsColorOffset;
  
  protected int pointLightsIntensityOffset;
  
  protected int pointLightsLoc;
  
  protected int pointLightsPositionOffset;
  
  protected int pointLightsSize;
  
  private Renderable renderable;
  
  protected final boolean shadowMap;
  
  protected final SpotLight[] spotLights;
  
  protected int spotLightsColorOffset;
  
  protected int spotLightsCutoffAngleOffset;
  
  protected int spotLightsDirectionOffset;
  
  protected int spotLightsExponentOffset;
  
  protected int spotLightsIntensityOffset;
  
  protected int spotLightsLoc;
  
  protected int spotLightsPositionOffset;
  
  protected int spotLightsSize;
  
  private float time;
  
  private final Vector3 tmpV1 = new Vector3();
  
  public final int u_alphaTest;
  
  protected final int u_ambientCubemap;
  
  public final int u_ambientTexture;
  
  public final int u_ambientUVTransform;
  
  public final int u_bones;
  
  public final int u_cameraDirection;
  
  public final int u_cameraNearFar;
  
  public final int u_cameraPosition;
  
  public final int u_cameraUp;
  
  public final int u_diffuseColor;
  
  public final int u_diffuseTexture;
  
  public final int u_diffuseUVTransform;
  
  protected final int u_dirLights0color = register(new BaseShader.Uniform("u_dirLights[0].color"));
  
  protected final int u_dirLights0direction = register(new BaseShader.Uniform("u_dirLights[0].direction"));
  
  protected final int u_dirLights1color = register(new BaseShader.Uniform("u_dirLights[1].color"));
  
  public final int u_emissiveColor;
  
  public final int u_emissiveTexture;
  
  public final int u_emissiveUVTransform;
  
  protected final int u_environmentCubemap;
  
  protected final int u_fogColor = register(new BaseShader.Uniform("u_fogColor"));
  
  public final int u_normalMatrix;
  
  public final int u_normalTexture;
  
  public final int u_normalUVTransform;
  
  public final int u_opacity;
  
  protected final int u_pointLights0color = register(new BaseShader.Uniform("u_pointLights[0].color"));
  
  protected final int u_pointLights0intensity = register(new BaseShader.Uniform("u_pointLights[0].intensity"));
  
  protected final int u_pointLights0position = register(new BaseShader.Uniform("u_pointLights[0].position"));
  
  protected final int u_pointLights1color = register(new BaseShader.Uniform("u_pointLights[1].color"));
  
  public final int u_projTrans;
  
  public final int u_projViewTrans;
  
  public final int u_projViewWorldTrans;
  
  public final int u_reflectionColor;
  
  public final int u_reflectionTexture;
  
  public final int u_reflectionUVTransform;
  
  protected final int u_shadowMapProjViewTrans = register(new BaseShader.Uniform("u_shadowMapProjViewTrans"));
  
  protected final int u_shadowPCFOffset = register(new BaseShader.Uniform("u_shadowPCFOffset"));
  
  protected final int u_shadowTexture = register(new BaseShader.Uniform("u_shadowTexture"));
  
  public final int u_shininess;
  
  public final int u_specularColor;
  
  public final int u_specularTexture;
  
  public final int u_specularUVTransform;
  
  protected final int u_spotLights0color = register(new BaseShader.Uniform("u_spotLights[0].color"));
  
  protected final int u_spotLights0cutoffAngle = register(new BaseShader.Uniform("u_spotLights[0].cutoffAngle"));
  
  protected final int u_spotLights0direction = register(new BaseShader.Uniform("u_spotLights[0].direction"));
  
  protected final int u_spotLights0exponent = register(new BaseShader.Uniform("u_spotLights[0].exponent"));
  
  protected final int u_spotLights0intensity = register(new BaseShader.Uniform("u_spotLights[0].intensity"));
  
  protected final int u_spotLights0position = register(new BaseShader.Uniform("u_spotLights[0].position"));
  
  protected final int u_spotLights1color = register(new BaseShader.Uniform("u_spotLights[1].color"));
  
  public final int u_time;
  
  public final int u_viewTrans;
  
  public final int u_viewWorldTrans;
  
  public final int u_worldTrans;
  
  private final long vertexMask;
  
  static  {
    defaultCullFace = 1029;
    defaultDepthFunc = 515;
    optionalAttributes = IntAttribute.CullFace | DepthTestAttribute.Type;
    tmpAttributes = new Attributes();
  }
  
  public DefaultShader(Renderable paramRenderable) { this(paramRenderable, new Config()); }
  
  public DefaultShader(Renderable paramRenderable, Config paramConfig) { this(paramRenderable, paramConfig, createPrefix(paramRenderable, paramConfig)); }
  
  public DefaultShader(Renderable paramRenderable, Config paramConfig, ShaderProgram paramShaderProgram) {
    Attributes attributes = combineAttributes(paramRenderable);
    this.config = paramConfig;
    this.program = paramShaderProgram;
    Environment environment = paramRenderable.environment;
    byte b1 = 1;
    int i = 0;
    if (environment != null) {
      b2 = 1;
    } else {
      b2 = 0;
    } 
    this.lighting = b2;
    if (attributes.has(CubemapAttribute.EnvironmentMap) || (this.lighting && attributes.has(CubemapAttribute.EnvironmentMap))) {
      b2 = 1;
    } else {
      b2 = 0;
    } 
    this.environmentCubemap = b2;
    if (this.lighting && paramRenderable.environment.shadowMap != null) {
      b2 = b1;
    } else {
      b2 = 0;
    } 
    this.shadowMap = b2;
    this.renderable = paramRenderable;
    this.attributesMask = attributes.getMask() | optionalAttributes;
    this.vertexMask = paramRenderable.meshPart.mesh.getVertexAttributes().getMaskWithSizePacked();
    if (this.lighting && paramConfig.numDirectionalLights > 0) {
      j = paramConfig.numDirectionalLights;
    } else {
      j = 0;
    } 
    this.directionalLights = new DirectionalLight[j];
    int j = 0;
    while (true) {
      DirectionalLight[] arrayOfDirectionalLight = this.directionalLights;
      if (j < arrayOfDirectionalLight.length) {
        arrayOfDirectionalLight[j] = new DirectionalLight();
        j++;
        continue;
      } 
      break;
    } 
    if (this.lighting && paramConfig.numPointLights > 0) {
      j = paramConfig.numPointLights;
    } else {
      j = 0;
    } 
    this.pointLights = new PointLight[j];
    j = 0;
    while (true) {
      PointLight[] arrayOfPointLight = this.pointLights;
      if (j < arrayOfPointLight.length) {
        arrayOfPointLight[j] = new PointLight();
        j++;
        continue;
      } 
      break;
    } 
    if (this.lighting && paramConfig.numSpotLights > 0) {
      j = paramConfig.numSpotLights;
    } else {
      j = 0;
    } 
    this.spotLights = new SpotLight[j];
    j = i;
    while (true) {
      SpotLight[] arrayOfSpotLight = this.spotLights;
      if (j < arrayOfSpotLight.length) {
        arrayOfSpotLight[j] = new SpotLight();
        j++;
        continue;
      } 
      break;
    } 
    if (!paramConfig.ignoreUnimplemented) {
      long l1 = implementedFlags;
      long l2 = this.attributesMask;
      if ((l1 & l2) != l2) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("Some attributes not implemented yet (");
        stringBuilder.append(this.attributesMask);
        stringBuilder.append(")");
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
    } 
    this.u_projTrans = register(Inputs.projTrans, Setters.projTrans);
    this.u_viewTrans = register(Inputs.viewTrans, Setters.viewTrans);
    this.u_projViewTrans = register(Inputs.projViewTrans, Setters.projViewTrans);
    this.u_cameraPosition = register(Inputs.cameraPosition, Setters.cameraPosition);
    this.u_cameraDirection = register(Inputs.cameraDirection, Setters.cameraDirection);
    this.u_cameraUp = register(Inputs.cameraUp, Setters.cameraUp);
    this.u_cameraNearFar = register(Inputs.cameraNearFar, Setters.cameraNearFar);
    this.u_time = register(new BaseShader.Uniform("u_time"));
    this.u_worldTrans = register(Inputs.worldTrans, Setters.worldTrans);
    this.u_viewWorldTrans = register(Inputs.viewWorldTrans, Setters.viewWorldTrans);
    this.u_projViewWorldTrans = register(Inputs.projViewWorldTrans, Setters.projViewWorldTrans);
    this.u_normalMatrix = register(Inputs.normalMatrix, Setters.normalMatrix);
    Matrix4[] arrayOfMatrix4 = stringBuilder.bones;
    i = -1;
    if (arrayOfMatrix4 != null && paramConfig.numBones > 0) {
      j = register(Inputs.bones, new Setters.Bones(paramConfig.numBones));
    } else {
      j = -1;
    } 
    this.u_bones = j;
    this.u_shininess = register(Inputs.shininess, Setters.shininess);
    this.u_opacity = register(Inputs.opacity);
    this.u_diffuseColor = register(Inputs.diffuseColor, Setters.diffuseColor);
    this.u_diffuseTexture = register(Inputs.diffuseTexture, Setters.diffuseTexture);
    this.u_diffuseUVTransform = register(Inputs.diffuseUVTransform, Setters.diffuseUVTransform);
    this.u_specularColor = register(Inputs.specularColor, Setters.specularColor);
    this.u_specularTexture = register(Inputs.specularTexture, Setters.specularTexture);
    this.u_specularUVTransform = register(Inputs.specularUVTransform, Setters.specularUVTransform);
    this.u_emissiveColor = register(Inputs.emissiveColor, Setters.emissiveColor);
    this.u_emissiveTexture = register(Inputs.emissiveTexture, Setters.emissiveTexture);
    this.u_emissiveUVTransform = register(Inputs.emissiveUVTransform, Setters.emissiveUVTransform);
    this.u_reflectionColor = register(Inputs.reflectionColor, Setters.reflectionColor);
    this.u_reflectionTexture = register(Inputs.reflectionTexture, Setters.reflectionTexture);
    this.u_reflectionUVTransform = register(Inputs.reflectionUVTransform, Setters.reflectionUVTransform);
    this.u_normalTexture = register(Inputs.normalTexture, Setters.normalTexture);
    this.u_normalUVTransform = register(Inputs.normalUVTransform, Setters.normalUVTransform);
    this.u_ambientTexture = register(Inputs.ambientTexture, Setters.ambientTexture);
    this.u_ambientUVTransform = register(Inputs.ambientUVTransform, Setters.ambientUVTransform);
    this.u_alphaTest = register(Inputs.alphaTest);
    if (this.lighting) {
      j = register(Inputs.ambientCube, new Setters.ACubemap(paramConfig.numDirectionalLights, paramConfig.numPointLights));
    } else {
      j = -1;
    } 
    this.u_ambientCubemap = j;
    j = i;
    if (this.environmentCubemap)
      j = register(Inputs.environmentCubemap, Setters.environmentCubemap); 
    this.u_environmentCubemap = j;
  }
  
  public DefaultShader(Renderable paramRenderable, Config paramConfig, String paramString) { this(paramRenderable, paramConfig, paramString, str1, str2); }
  
  public DefaultShader(Renderable paramRenderable, Config paramConfig, String paramString1, String paramString2, String paramString3) { this(paramRenderable, paramConfig, new ShaderProgram(str, stringBuilder1.toString())); }
  
  private static final boolean and(long paramLong1, long paramLong2) {
    boolean bool;
    if ((paramLong1 & paramLong2) == paramLong2) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  private static final long combineAttributeMasks(Renderable paramRenderable) {
    Environment environment = paramRenderable.environment;
    long l1 = 0L;
    if (environment != null)
      l1 = 0x0L | paramRenderable.environment.getMask(); 
    long l2 = l1;
    if (paramRenderable.material != null)
      l2 = l1 | paramRenderable.material.getMask(); 
    return l2;
  }
  
  private static final Attributes combineAttributes(Renderable paramRenderable) {
    tmpAttributes.clear();
    if (paramRenderable.environment != null)
      tmpAttributes.set(paramRenderable.environment); 
    if (paramRenderable.material != null)
      tmpAttributes.set(paramRenderable.material); 
    return tmpAttributes;
  }
  
  public static String createPrefix(Renderable paramRenderable, Config paramConfig) { // Byte code:
    //   0: aload_0
    //   1: invokestatic combineAttributes : (Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Attributes;
    //   4: astore_2
    //   5: aload_2
    //   6: invokevirtual getMask : ()J
    //   9: lstore_3
    //   10: aload_0
    //   11: getfield meshPart : Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    //   14: getfield mesh : Lcom/badlogic/gdx/graphics/Mesh;
    //   17: invokevirtual getVertexAttributes : ()Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   20: invokevirtual getMask : ()J
    //   23: lstore #5
    //   25: lload #5
    //   27: lconst_1
    //   28: invokestatic and : (JJ)Z
    //   31: istore #7
    //   33: ldc_w ''
    //   36: astore #8
    //   38: iload #7
    //   40: ifeq -> 77
    //   43: new java/lang/StringBuilder
    //   46: dup
    //   47: invokespecial <init> : ()V
    //   50: astore #8
    //   52: aload #8
    //   54: ldc_w ''
    //   57: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: pop
    //   61: aload #8
    //   63: ldc_w '#define positionFlag\\n'
    //   66: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   69: pop
    //   70: aload #8
    //   72: invokevirtual toString : ()Ljava/lang/String;
    //   75: astore #8
    //   77: aload #8
    //   79: astore #9
    //   81: lload #5
    //   83: ldc2_w 6
    //   86: invokestatic or : (JJ)Z
    //   89: ifeq -> 125
    //   92: new java/lang/StringBuilder
    //   95: dup
    //   96: invokespecial <init> : ()V
    //   99: astore #9
    //   101: aload #9
    //   103: aload #8
    //   105: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: pop
    //   109: aload #9
    //   111: ldc_w '#define colorFlag\\n'
    //   114: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: pop
    //   118: aload #9
    //   120: invokevirtual toString : ()Ljava/lang/String;
    //   123: astore #9
    //   125: aload #9
    //   127: astore #8
    //   129: lload #5
    //   131: ldc2_w 256
    //   134: invokestatic and : (JJ)Z
    //   137: ifeq -> 173
    //   140: new java/lang/StringBuilder
    //   143: dup
    //   144: invokespecial <init> : ()V
    //   147: astore #8
    //   149: aload #8
    //   151: aload #9
    //   153: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: pop
    //   157: aload #8
    //   159: ldc_w '#define binormalFlag\\n'
    //   162: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   165: pop
    //   166: aload #8
    //   168: invokevirtual toString : ()Ljava/lang/String;
    //   171: astore #8
    //   173: aload #8
    //   175: astore #10
    //   177: lload #5
    //   179: ldc2_w 128
    //   182: invokestatic and : (JJ)Z
    //   185: ifeq -> 221
    //   188: new java/lang/StringBuilder
    //   191: dup
    //   192: invokespecial <init> : ()V
    //   195: astore #9
    //   197: aload #9
    //   199: aload #8
    //   201: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   204: pop
    //   205: aload #9
    //   207: ldc_w '#define tangentFlag\\n'
    //   210: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   213: pop
    //   214: aload #9
    //   216: invokevirtual toString : ()Ljava/lang/String;
    //   219: astore #10
    //   221: aload #10
    //   223: astore #9
    //   225: lload #5
    //   227: ldc2_w 8
    //   230: invokestatic and : (JJ)Z
    //   233: ifeq -> 269
    //   236: new java/lang/StringBuilder
    //   239: dup
    //   240: invokespecial <init> : ()V
    //   243: astore #8
    //   245: aload #8
    //   247: aload #10
    //   249: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   252: pop
    //   253: aload #8
    //   255: ldc_w '#define normalFlag\\n'
    //   258: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: pop
    //   262: aload #8
    //   264: invokevirtual toString : ()Ljava/lang/String;
    //   267: astore #9
    //   269: lload #5
    //   271: ldc2_w 8
    //   274: invokestatic and : (JJ)Z
    //   277: ifne -> 295
    //   280: aload #9
    //   282: astore #8
    //   284: lload #5
    //   286: ldc2_w 384
    //   289: invokestatic and : (JJ)Z
    //   292: ifeq -> 669
    //   295: aload #9
    //   297: astore #8
    //   299: aload_0
    //   300: getfield environment : Lcom/badlogic/gdx/graphics/g3d/Environment;
    //   303: ifnull -> 669
    //   306: new java/lang/StringBuilder
    //   309: dup
    //   310: invokespecial <init> : ()V
    //   313: astore #8
    //   315: aload #8
    //   317: aload #9
    //   319: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   322: pop
    //   323: aload #8
    //   325: ldc_w '#define lightingFlag\\n'
    //   328: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   331: pop
    //   332: aload #8
    //   334: invokevirtual toString : ()Ljava/lang/String;
    //   337: astore #9
    //   339: new java/lang/StringBuilder
    //   342: dup
    //   343: invokespecial <init> : ()V
    //   346: astore #8
    //   348: aload #8
    //   350: aload #9
    //   352: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   355: pop
    //   356: aload #8
    //   358: ldc_w '#define ambientCubemapFlag\\n'
    //   361: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   364: pop
    //   365: aload #8
    //   367: invokevirtual toString : ()Ljava/lang/String;
    //   370: astore #8
    //   372: new java/lang/StringBuilder
    //   375: dup
    //   376: invokespecial <init> : ()V
    //   379: astore #9
    //   381: aload #9
    //   383: aload #8
    //   385: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   388: pop
    //   389: aload #9
    //   391: ldc_w '#define numDirectionalLights '
    //   394: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   397: pop
    //   398: aload #9
    //   400: aload_1
    //   401: getfield numDirectionalLights : I
    //   404: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   407: pop
    //   408: aload #9
    //   410: ldc_w '\\n'
    //   413: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   416: pop
    //   417: aload #9
    //   419: invokevirtual toString : ()Ljava/lang/String;
    //   422: astore #9
    //   424: new java/lang/StringBuilder
    //   427: dup
    //   428: invokespecial <init> : ()V
    //   431: astore #8
    //   433: aload #8
    //   435: aload #9
    //   437: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   440: pop
    //   441: aload #8
    //   443: ldc_w '#define numPointLights '
    //   446: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   449: pop
    //   450: aload #8
    //   452: aload_1
    //   453: getfield numPointLights : I
    //   456: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   459: pop
    //   460: aload #8
    //   462: ldc_w '\\n'
    //   465: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   468: pop
    //   469: aload #8
    //   471: invokevirtual toString : ()Ljava/lang/String;
    //   474: astore #8
    //   476: new java/lang/StringBuilder
    //   479: dup
    //   480: invokespecial <init> : ()V
    //   483: astore #9
    //   485: aload #9
    //   487: aload #8
    //   489: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   492: pop
    //   493: aload #9
    //   495: ldc_w '#define numSpotLights '
    //   498: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   501: pop
    //   502: aload #9
    //   504: aload_1
    //   505: getfield numSpotLights : I
    //   508: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   511: pop
    //   512: aload #9
    //   514: ldc_w '\\n'
    //   517: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   520: pop
    //   521: aload #9
    //   523: invokevirtual toString : ()Ljava/lang/String;
    //   526: astore #9
    //   528: aload #9
    //   530: astore #8
    //   532: aload_2
    //   533: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Fog : J
    //   536: invokevirtual has : (J)Z
    //   539: ifeq -> 575
    //   542: new java/lang/StringBuilder
    //   545: dup
    //   546: invokespecial <init> : ()V
    //   549: astore #8
    //   551: aload #8
    //   553: aload #9
    //   555: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   558: pop
    //   559: aload #8
    //   561: ldc_w '#define fogFlag\\n'
    //   564: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   567: pop
    //   568: aload #8
    //   570: invokevirtual toString : ()Ljava/lang/String;
    //   573: astore #8
    //   575: aload #8
    //   577: astore #9
    //   579: aload_0
    //   580: getfield environment : Lcom/badlogic/gdx/graphics/g3d/Environment;
    //   583: getfield shadowMap : Lcom/badlogic/gdx/graphics/g3d/environment/ShadowMap;
    //   586: ifnull -> 622
    //   589: new java/lang/StringBuilder
    //   592: dup
    //   593: invokespecial <init> : ()V
    //   596: astore #9
    //   598: aload #9
    //   600: aload #8
    //   602: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   605: pop
    //   606: aload #9
    //   608: ldc_w '#define shadowMapFlag\\n'
    //   611: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   614: pop
    //   615: aload #9
    //   617: invokevirtual toString : ()Ljava/lang/String;
    //   620: astore #9
    //   622: aload #9
    //   624: astore #8
    //   626: aload_2
    //   627: getstatic com/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute.EnvironmentMap : J
    //   630: invokevirtual has : (J)Z
    //   633: ifeq -> 669
    //   636: new java/lang/StringBuilder
    //   639: dup
    //   640: invokespecial <init> : ()V
    //   643: astore #8
    //   645: aload #8
    //   647: aload #9
    //   649: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   652: pop
    //   653: aload #8
    //   655: ldc_w '#define environmentCubemapFlag\\n'
    //   658: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   661: pop
    //   662: aload #8
    //   664: invokevirtual toString : ()Ljava/lang/String;
    //   667: astore #8
    //   669: aload_0
    //   670: getfield meshPart : Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    //   673: getfield mesh : Lcom/badlogic/gdx/graphics/Mesh;
    //   676: invokevirtual getVertexAttributes : ()Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   679: invokevirtual size : ()I
    //   682: istore #11
    //   684: iconst_0
    //   685: istore #12
    //   687: iload #12
    //   689: iload #11
    //   691: if_icmpge -> 861
    //   694: aload_0
    //   695: getfield meshPart : Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    //   698: getfield mesh : Lcom/badlogic/gdx/graphics/Mesh;
    //   701: invokevirtual getVertexAttributes : ()Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   704: iload #12
    //   706: invokevirtual get : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   709: astore #10
    //   711: aload #10
    //   713: getfield usage : I
    //   716: bipush #64
    //   718: if_icmpne -> 781
    //   721: new java/lang/StringBuilder
    //   724: dup
    //   725: invokespecial <init> : ()V
    //   728: astore #9
    //   730: aload #9
    //   732: aload #8
    //   734: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   737: pop
    //   738: aload #9
    //   740: ldc_w '#define boneWeight'
    //   743: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   746: pop
    //   747: aload #9
    //   749: aload #10
    //   751: getfield unit : I
    //   754: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   757: pop
    //   758: aload #9
    //   760: ldc_w 'Flag\\n'
    //   763: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   766: pop
    //   767: aload #9
    //   769: invokevirtual toString : ()Ljava/lang/String;
    //   772: astore #8
    //   774: aload #8
    //   776: astore #9
    //   778: goto -> 851
    //   781: aload #8
    //   783: astore #9
    //   785: aload #10
    //   787: getfield usage : I
    //   790: bipush #16
    //   792: if_icmpne -> 851
    //   795: new java/lang/StringBuilder
    //   798: dup
    //   799: invokespecial <init> : ()V
    //   802: astore #9
    //   804: aload #9
    //   806: aload #8
    //   808: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   811: pop
    //   812: aload #9
    //   814: ldc_w '#define texCoord'
    //   817: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   820: pop
    //   821: aload #9
    //   823: aload #10
    //   825: getfield unit : I
    //   828: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   831: pop
    //   832: aload #9
    //   834: ldc_w 'Flag\\n'
    //   837: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   840: pop
    //   841: aload #9
    //   843: invokevirtual toString : ()Ljava/lang/String;
    //   846: astore #8
    //   848: goto -> 774
    //   851: iinc #12, 1
    //   854: aload #9
    //   856: astore #8
    //   858: goto -> 687
    //   861: aload #8
    //   863: astore #9
    //   865: getstatic com/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute.Type : J
    //   868: lload_3
    //   869: land
    //   870: getstatic com/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute.Type : J
    //   873: lcmp
    //   874: ifne -> 910
    //   877: new java/lang/StringBuilder
    //   880: dup
    //   881: invokespecial <init> : ()V
    //   884: astore #9
    //   886: aload #9
    //   888: aload #8
    //   890: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   893: pop
    //   894: aload #9
    //   896: ldc_w '#define blendedFlag\\n'
    //   899: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   902: pop
    //   903: aload #9
    //   905: invokevirtual toString : ()Ljava/lang/String;
    //   908: astore #9
    //   910: aload #9
    //   912: astore #8
    //   914: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Diffuse : J
    //   917: lload_3
    //   918: land
    //   919: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Diffuse : J
    //   922: lcmp
    //   923: ifne -> 992
    //   926: new java/lang/StringBuilder
    //   929: dup
    //   930: invokespecial <init> : ()V
    //   933: astore #8
    //   935: aload #8
    //   937: aload #9
    //   939: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   942: pop
    //   943: aload #8
    //   945: ldc_w '#define diffuseTextureFlag\\n'
    //   948: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   951: pop
    //   952: aload #8
    //   954: invokevirtual toString : ()Ljava/lang/String;
    //   957: astore #9
    //   959: new java/lang/StringBuilder
    //   962: dup
    //   963: invokespecial <init> : ()V
    //   966: astore #8
    //   968: aload #8
    //   970: aload #9
    //   972: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   975: pop
    //   976: aload #8
    //   978: ldc_w '#define diffuseTextureCoord texCoord0\\n'
    //   981: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   984: pop
    //   985: aload #8
    //   987: invokevirtual toString : ()Ljava/lang/String;
    //   990: astore #8
    //   992: aload #8
    //   994: astore #9
    //   996: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Specular : J
    //   999: lload_3
    //   1000: land
    //   1001: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Specular : J
    //   1004: lcmp
    //   1005: ifne -> 1074
    //   1008: new java/lang/StringBuilder
    //   1011: dup
    //   1012: invokespecial <init> : ()V
    //   1015: astore #9
    //   1017: aload #9
    //   1019: aload #8
    //   1021: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1024: pop
    //   1025: aload #9
    //   1027: ldc_w '#define specularTextureFlag\\n'
    //   1030: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1033: pop
    //   1034: aload #9
    //   1036: invokevirtual toString : ()Ljava/lang/String;
    //   1039: astore #8
    //   1041: new java/lang/StringBuilder
    //   1044: dup
    //   1045: invokespecial <init> : ()V
    //   1048: astore #9
    //   1050: aload #9
    //   1052: aload #8
    //   1054: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1057: pop
    //   1058: aload #9
    //   1060: ldc_w '#define specularTextureCoord texCoord0\\n'
    //   1063: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1066: pop
    //   1067: aload #9
    //   1069: invokevirtual toString : ()Ljava/lang/String;
    //   1072: astore #9
    //   1074: aload #9
    //   1076: astore #10
    //   1078: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Normal : J
    //   1081: lload_3
    //   1082: land
    //   1083: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Normal : J
    //   1086: lcmp
    //   1087: ifne -> 1156
    //   1090: new java/lang/StringBuilder
    //   1093: dup
    //   1094: invokespecial <init> : ()V
    //   1097: astore #8
    //   1099: aload #8
    //   1101: aload #9
    //   1103: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1106: pop
    //   1107: aload #8
    //   1109: ldc_w '#define normalTextureFlag\\n'
    //   1112: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1115: pop
    //   1116: aload #8
    //   1118: invokevirtual toString : ()Ljava/lang/String;
    //   1121: astore #9
    //   1123: new java/lang/StringBuilder
    //   1126: dup
    //   1127: invokespecial <init> : ()V
    //   1130: astore #8
    //   1132: aload #8
    //   1134: aload #9
    //   1136: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1139: pop
    //   1140: aload #8
    //   1142: ldc_w '#define normalTextureCoord texCoord0\\n'
    //   1145: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1148: pop
    //   1149: aload #8
    //   1151: invokevirtual toString : ()Ljava/lang/String;
    //   1154: astore #10
    //   1156: aload #10
    //   1158: astore #8
    //   1160: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Emissive : J
    //   1163: lload_3
    //   1164: land
    //   1165: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Emissive : J
    //   1168: lcmp
    //   1169: ifne -> 1238
    //   1172: new java/lang/StringBuilder
    //   1175: dup
    //   1176: invokespecial <init> : ()V
    //   1179: astore #8
    //   1181: aload #8
    //   1183: aload #10
    //   1185: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1188: pop
    //   1189: aload #8
    //   1191: ldc_w '#define emissiveTextureFlag\\n'
    //   1194: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1197: pop
    //   1198: aload #8
    //   1200: invokevirtual toString : ()Ljava/lang/String;
    //   1203: astore #9
    //   1205: new java/lang/StringBuilder
    //   1208: dup
    //   1209: invokespecial <init> : ()V
    //   1212: astore #8
    //   1214: aload #8
    //   1216: aload #9
    //   1218: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1221: pop
    //   1222: aload #8
    //   1224: ldc_w '#define emissiveTextureCoord texCoord0\\n'
    //   1227: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1230: pop
    //   1231: aload #8
    //   1233: invokevirtual toString : ()Ljava/lang/String;
    //   1236: astore #8
    //   1238: aload #8
    //   1240: astore #9
    //   1242: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Reflection : J
    //   1245: lload_3
    //   1246: land
    //   1247: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Reflection : J
    //   1250: lcmp
    //   1251: ifne -> 1320
    //   1254: new java/lang/StringBuilder
    //   1257: dup
    //   1258: invokespecial <init> : ()V
    //   1261: astore #9
    //   1263: aload #9
    //   1265: aload #8
    //   1267: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1270: pop
    //   1271: aload #9
    //   1273: ldc_w '#define reflectionTextureFlag\\n'
    //   1276: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1279: pop
    //   1280: aload #9
    //   1282: invokevirtual toString : ()Ljava/lang/String;
    //   1285: astore #9
    //   1287: new java/lang/StringBuilder
    //   1290: dup
    //   1291: invokespecial <init> : ()V
    //   1294: astore #8
    //   1296: aload #8
    //   1298: aload #9
    //   1300: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1303: pop
    //   1304: aload #8
    //   1306: ldc_w '#define reflectionTextureCoord texCoord0\\n'
    //   1309: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1312: pop
    //   1313: aload #8
    //   1315: invokevirtual toString : ()Ljava/lang/String;
    //   1318: astore #9
    //   1320: aload #9
    //   1322: astore #8
    //   1324: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Ambient : J
    //   1327: lload_3
    //   1328: land
    //   1329: getstatic com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.Ambient : J
    //   1332: lcmp
    //   1333: ifne -> 1402
    //   1336: new java/lang/StringBuilder
    //   1339: dup
    //   1340: invokespecial <init> : ()V
    //   1343: astore #8
    //   1345: aload #8
    //   1347: aload #9
    //   1349: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1352: pop
    //   1353: aload #8
    //   1355: ldc_w '#define ambientTextureFlag\\n'
    //   1358: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1361: pop
    //   1362: aload #8
    //   1364: invokevirtual toString : ()Ljava/lang/String;
    //   1367: astore #9
    //   1369: new java/lang/StringBuilder
    //   1372: dup
    //   1373: invokespecial <init> : ()V
    //   1376: astore #8
    //   1378: aload #8
    //   1380: aload #9
    //   1382: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1385: pop
    //   1386: aload #8
    //   1388: ldc_w '#define ambientTextureCoord texCoord0\\n'
    //   1391: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1394: pop
    //   1395: aload #8
    //   1397: invokevirtual toString : ()Ljava/lang/String;
    //   1400: astore #8
    //   1402: aload #8
    //   1404: astore #9
    //   1406: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Diffuse : J
    //   1409: lload_3
    //   1410: land
    //   1411: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Diffuse : J
    //   1414: lcmp
    //   1415: ifne -> 1451
    //   1418: new java/lang/StringBuilder
    //   1421: dup
    //   1422: invokespecial <init> : ()V
    //   1425: astore #9
    //   1427: aload #9
    //   1429: aload #8
    //   1431: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1434: pop
    //   1435: aload #9
    //   1437: ldc_w '#define diffuseColorFlag\\n'
    //   1440: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1443: pop
    //   1444: aload #9
    //   1446: invokevirtual toString : ()Ljava/lang/String;
    //   1449: astore #9
    //   1451: aload #9
    //   1453: astore #8
    //   1455: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Specular : J
    //   1458: lload_3
    //   1459: land
    //   1460: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Specular : J
    //   1463: lcmp
    //   1464: ifne -> 1500
    //   1467: new java/lang/StringBuilder
    //   1470: dup
    //   1471: invokespecial <init> : ()V
    //   1474: astore #8
    //   1476: aload #8
    //   1478: aload #9
    //   1480: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1483: pop
    //   1484: aload #8
    //   1486: ldc_w '#define specularColorFlag\\n'
    //   1489: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1492: pop
    //   1493: aload #8
    //   1495: invokevirtual toString : ()Ljava/lang/String;
    //   1498: astore #8
    //   1500: aload #8
    //   1502: astore #9
    //   1504: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Emissive : J
    //   1507: lload_3
    //   1508: land
    //   1509: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Emissive : J
    //   1512: lcmp
    //   1513: ifne -> 1549
    //   1516: new java/lang/StringBuilder
    //   1519: dup
    //   1520: invokespecial <init> : ()V
    //   1523: astore #9
    //   1525: aload #9
    //   1527: aload #8
    //   1529: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1532: pop
    //   1533: aload #9
    //   1535: ldc_w '#define emissiveColorFlag\\n'
    //   1538: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1541: pop
    //   1542: aload #9
    //   1544: invokevirtual toString : ()Ljava/lang/String;
    //   1547: astore #9
    //   1549: aload #9
    //   1551: astore #8
    //   1553: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Reflection : J
    //   1556: lload_3
    //   1557: land
    //   1558: getstatic com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.Reflection : J
    //   1561: lcmp
    //   1562: ifne -> 1598
    //   1565: new java/lang/StringBuilder
    //   1568: dup
    //   1569: invokespecial <init> : ()V
    //   1572: astore #8
    //   1574: aload #8
    //   1576: aload #9
    //   1578: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1581: pop
    //   1582: aload #8
    //   1584: ldc_w '#define reflectionColorFlag\\n'
    //   1587: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1590: pop
    //   1591: aload #8
    //   1593: invokevirtual toString : ()Ljava/lang/String;
    //   1596: astore #8
    //   1598: aload #8
    //   1600: astore #9
    //   1602: getstatic com/badlogic/gdx/graphics/g3d/attributes/FloatAttribute.Shininess : J
    //   1605: lload_3
    //   1606: land
    //   1607: getstatic com/badlogic/gdx/graphics/g3d/attributes/FloatAttribute.Shininess : J
    //   1610: lcmp
    //   1611: ifne -> 1647
    //   1614: new java/lang/StringBuilder
    //   1617: dup
    //   1618: invokespecial <init> : ()V
    //   1621: astore #9
    //   1623: aload #9
    //   1625: aload #8
    //   1627: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1630: pop
    //   1631: aload #9
    //   1633: ldc_w '#define shininessFlag\\n'
    //   1636: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1639: pop
    //   1640: aload #9
    //   1642: invokevirtual toString : ()Ljava/lang/String;
    //   1645: astore #9
    //   1647: aload #9
    //   1649: astore #8
    //   1651: lload_3
    //   1652: getstatic com/badlogic/gdx/graphics/g3d/attributes/FloatAttribute.AlphaTest : J
    //   1655: land
    //   1656: getstatic com/badlogic/gdx/graphics/g3d/attributes/FloatAttribute.AlphaTest : J
    //   1659: lcmp
    //   1660: ifne -> 1696
    //   1663: new java/lang/StringBuilder
    //   1666: dup
    //   1667: invokespecial <init> : ()V
    //   1670: astore #8
    //   1672: aload #8
    //   1674: aload #9
    //   1676: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1679: pop
    //   1680: aload #8
    //   1682: ldc_w '#define alphaTestFlag\\n'
    //   1685: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1688: pop
    //   1689: aload #8
    //   1691: invokevirtual toString : ()Ljava/lang/String;
    //   1694: astore #8
    //   1696: aload #8
    //   1698: astore #9
    //   1700: aload_0
    //   1701: getfield bones : [Lcom/badlogic/gdx/math/Matrix4;
    //   1704: ifnull -> 1764
    //   1707: aload #8
    //   1709: astore #9
    //   1711: aload_1
    //   1712: getfield numBones : I
    //   1715: ifle -> 1764
    //   1718: new java/lang/StringBuilder
    //   1721: dup
    //   1722: invokespecial <init> : ()V
    //   1725: astore_0
    //   1726: aload_0
    //   1727: aload #8
    //   1729: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1732: pop
    //   1733: aload_0
    //   1734: ldc_w '#define numBones '
    //   1737: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1740: pop
    //   1741: aload_0
    //   1742: aload_1
    //   1743: getfield numBones : I
    //   1746: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   1749: pop
    //   1750: aload_0
    //   1751: ldc_w '\\n'
    //   1754: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1757: pop
    //   1758: aload_0
    //   1759: invokevirtual toString : ()Ljava/lang/String;
    //   1762: astore #9
    //   1764: aload #9
    //   1766: areturn }
  
  public static String getDefaultFragmentShader() {
    if (defaultFragmentShader == null)
      defaultFragmentShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/default.fragment.glsl").readString(); 
    return defaultFragmentShader;
  }
  
  public static String getDefaultVertexShader() {
    if (defaultVertexShader == null)
      defaultVertexShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/default.vertex.glsl").readString(); 
    return defaultVertexShader;
  }
  
  private static final boolean or(long paramLong1, long paramLong2) {
    boolean bool;
    if ((paramLong1 & paramLong2) != 0L) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void begin(Camera paramCamera, RenderContext paramRenderContext) {
    super.begin(paramCamera, paramRenderContext);
    DirectionalLight[] arrayOfDirectionalLight = this.directionalLights;
    int i = arrayOfDirectionalLight.length;
    int j;
    for (j = 0; j < i; j++)
      arrayOfDirectionalLight[j].set(0.0F, 0.0F, 0.0F, 0.0F, -1.0F, 0.0F); 
    PointLight[] arrayOfPointLight = this.pointLights;
    i = arrayOfPointLight.length;
    for (j = 0; j < i; j++)
      arrayOfPointLight[j].set(0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F); 
    SpotLight[] arrayOfSpotLight = this.spotLights;
    i = arrayOfSpotLight.length;
    for (j = 0; j < i; j++)
      arrayOfSpotLight[j].set(0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, -1.0F, 0.0F, 0.0F, 1.0F, 0.0F); 
    this.lightsSet = false;
    if (has(this.u_time)) {
      j = this.u_time;
      float f = this.time + Gdx.graphics.getDeltaTime();
      this.time = f;
      set(j, f);
    } 
  }
  
  protected void bindLights(Renderable paramRenderable, Attributes paramAttributes) {
    Environment environment = paramRenderable.environment;
    Array array1 = (DirectionalLightsAttribute)paramAttributes.get(DirectionalLightsAttribute.class, DirectionalLightsAttribute.Type);
    Array array2 = null;
    if (array1 == null) {
      array1 = null;
    } else {
      array1 = array1.lights;
    } 
    Array array3 = (PointLightsAttribute)paramAttributes.get(PointLightsAttribute.class, PointLightsAttribute.Type);
    if (array3 == null) {
      array3 = null;
    } else {
      array3 = array3.lights;
    } 
    SpotLightsAttribute spotLightsAttribute = (SpotLightsAttribute)paramAttributes.get(SpotLightsAttribute.class, SpotLightsAttribute.Type);
    if (spotLightsAttribute != null)
      array2 = spotLightsAttribute.lights; 
    int i = this.dirLightsLoc;
    int j = 0;
    if (i >= 0)
      for (i = 0; i < this.directionalLights.length; i++) {
        if (array1 == null || i >= array1.size) {
          if (this.lightsSet && (this.directionalLights[i]).color.r == 0.0F && (this.directionalLights[i]).color.g == 0.0F && (this.directionalLights[i]).color.b == 0.0F)
            continue; 
          (this.directionalLights[i]).color.set(0.0F, 0.0F, 0.0F, 1.0F);
        } else {
          if (this.lightsSet && this.directionalLights[i].equals((DirectionalLight)array1.get(i)))
            continue; 
          this.directionalLights[i].set((DirectionalLight)array1.get(i));
        } 
        int k = this.dirLightsLoc + this.dirLightsSize * i;
        this.program.setUniformf(this.dirLightsColorOffset + k, (this.directionalLights[i]).color.r, (this.directionalLights[i]).color.g, (this.directionalLights[i]).color.b);
        this.program.setUniformf(k + this.dirLightsDirectionOffset, (this.directionalLights[i]).direction.x, (this.directionalLights[i]).direction.y, (this.directionalLights[i]).direction.z);
        if (this.dirLightsSize <= 0)
          break; 
        continue;
      }  
    if (this.pointLightsLoc >= 0)
      for (i = 0; i < this.pointLights.length; i++) {
        if (array3 == null || i >= array3.size) {
          if (this.lightsSet && (this.pointLights[i]).intensity == 0.0F)
            continue; 
          (this.pointLights[i]).intensity = 0.0F;
        } else {
          if (this.lightsSet && this.pointLights[i].equals((PointLight)array3.get(i)))
            continue; 
          this.pointLights[i].set((PointLight)array3.get(i));
        } 
        int k = this.pointLightsLoc + this.pointLightsSize * i;
        this.program.setUniformf(this.pointLightsColorOffset + k, (this.pointLights[i]).color.r * (this.pointLights[i]).intensity, (this.pointLights[i]).color.g * (this.pointLights[i]).intensity, (this.pointLights[i]).color.b * (this.pointLights[i]).intensity);
        this.program.setUniformf(this.pointLightsPositionOffset + k, (this.pointLights[i]).position.x, (this.pointLights[i]).position.y, (this.pointLights[i]).position.z);
        if (this.pointLightsIntensityOffset >= 0)
          this.program.setUniformf(k + this.pointLightsIntensityOffset, (this.pointLights[i]).intensity); 
        if (this.pointLightsSize <= 0)
          break; 
        continue;
      }  
    if (this.spotLightsLoc >= 0)
      for (i = j; i < this.spotLights.length; i++) {
        if (array2 == null || i >= array2.size) {
          if (this.lightsSet && (this.spotLights[i]).intensity == 0.0F)
            continue; 
          (this.spotLights[i]).intensity = 0.0F;
        } else {
          if (this.lightsSet && this.spotLights[i].equals((SpotLight)array2.get(i)))
            continue; 
          this.spotLights[i].set((SpotLight)array2.get(i));
        } 
        j = this.spotLightsLoc + this.spotLightsSize * i;
        this.program.setUniformf(this.spotLightsColorOffset + j, (this.spotLights[i]).color.r * (this.spotLights[i]).intensity, (this.spotLights[i]).color.g * (this.spotLights[i]).intensity, (this.spotLights[i]).color.b * (this.spotLights[i]).intensity);
        this.program.setUniformf(this.spotLightsPositionOffset + j, (this.spotLights[i]).position);
        this.program.setUniformf(this.spotLightsDirectionOffset + j, (this.spotLights[i]).direction);
        this.program.setUniformf(this.spotLightsCutoffAngleOffset + j, (this.spotLights[i]).cutoffAngle);
        this.program.setUniformf(this.spotLightsExponentOffset + j, (this.spotLights[i]).exponent);
        if (this.spotLightsIntensityOffset >= 0)
          this.program.setUniformf(j + this.spotLightsIntensityOffset, (this.spotLights[i]).intensity); 
        if (this.spotLightsSize <= 0)
          break; 
        continue;
      }  
    if (paramAttributes.has(ColorAttribute.Fog))
      set(this.u_fogColor, ((ColorAttribute)paramAttributes.get(ColorAttribute.Fog)).color); 
    if (environment != null && environment.shadowMap != null) {
      set(this.u_shadowMapProjViewTrans, environment.shadowMap.getProjViewTrans());
      set(this.u_shadowTexture, environment.shadowMap.getDepthMap());
      set(this.u_shadowPCFOffset, 1.0F / (environment.shadowMap.getDepthMap()).texture.getWidth() * 2.0F);
    } 
    this.lightsSet = true;
  }
  
  protected void bindMaterial(Attributes paramAttributes) {
    int j;
    int i;
    if (this.config.defaultCullFace == -1) {
      i = defaultCullFace;
    } else {
      i = this.config.defaultCullFace;
    } 
    if (this.config.defaultDepthFunc == -1) {
      j = defaultDepthFunc;
    } else {
      j = this.config.defaultDepthFunc;
    } 
    float f1 = 0.0F;
    float f2 = 1.0F;
    Iterator iterator = paramAttributes.iterator();
    boolean bool = true;
    while (iterator.hasNext()) {
      BlendingAttribute blendingAttribute = (Attribute)iterator.next();
      long l = blendingAttribute.type;
      if (BlendingAttribute.is(l)) {
        RenderContext renderContext = this.context;
        blendingAttribute = (BlendingAttribute)blendingAttribute;
        renderContext.setBlending(true, blendingAttribute.sourceFunction, blendingAttribute.destFunction);
        set(this.u_opacity, blendingAttribute.opacity);
        continue;
      } 
      if ((IntAttribute.CullFace & l) == IntAttribute.CullFace) {
        i = ((IntAttribute)blendingAttribute).value;
        continue;
      } 
      if ((FloatAttribute.AlphaTest & l) == FloatAttribute.AlphaTest) {
        set(this.u_alphaTest, ((FloatAttribute)blendingAttribute).value);
        continue;
      } 
      if ((l & DepthTestAttribute.Type) == DepthTestAttribute.Type) {
        DepthTestAttribute depthTestAttribute = (DepthTestAttribute)blendingAttribute;
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
      stringBuilder.append(blendingAttribute.toString());
      throw new GdxRuntimeException(stringBuilder.toString());
    } 
    this.context.setCullFace(i);
    this.context.setDepthTest(j, f1, f2);
    this.context.setDepthMask(bool);
  }
  
  public boolean canRender(Renderable paramRenderable) {
    long l1 = combineAttributeMasks(paramRenderable);
    long l2 = this.attributesMask;
    long l3 = optionalAttributes;
    byte b = 1;
    if (l2 == (l1 | l3) && this.vertexMask == paramRenderable.meshPart.mesh.getVertexAttributes().getMaskWithSizePacked()) {
      int i;
      if (paramRenderable.environment != null) {
        i = 1;
      } else {
        i = 0;
      } 
      if (i == this.lighting)
        return b; 
    } 
    return false;
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
  
  public void end() { super.end(); }
  
  public boolean equals(DefaultShader paramDefaultShader) {
    boolean bool;
    if (paramDefaultShader == this) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool;
    if (paramObject instanceof DefaultShader && equals((DefaultShader)paramObject)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int getDefaultCullFace() {
    int i;
    if (this.config.defaultCullFace == -1) {
      i = defaultCullFace;
    } else {
      i = this.config.defaultCullFace;
    } 
    return i;
  }
  
  public int getDefaultDepthFunc() {
    int i;
    if (this.config.defaultDepthFunc == -1) {
      i = defaultDepthFunc;
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
    this.dirLightsLoc = loc(this.u_dirLights0color);
    this.dirLightsColorOffset = loc(this.u_dirLights0color) - this.dirLightsLoc;
    this.dirLightsDirectionOffset = loc(this.u_dirLights0direction) - this.dirLightsLoc;
    this.dirLightsSize = loc(this.u_dirLights1color) - this.dirLightsLoc;
    if (this.dirLightsSize < 0)
      this.dirLightsSize = 0; 
    this.pointLightsLoc = loc(this.u_pointLights0color);
    this.pointLightsColorOffset = loc(this.u_pointLights0color) - this.pointLightsLoc;
    this.pointLightsPositionOffset = loc(this.u_pointLights0position) - this.pointLightsLoc;
    boolean bool = has(this.u_pointLights0intensity);
    byte b = -1;
    if (bool) {
      i = loc(this.u_pointLights0intensity) - this.pointLightsLoc;
    } else {
      i = -1;
    } 
    this.pointLightsIntensityOffset = i;
    this.pointLightsSize = loc(this.u_pointLights1color) - this.pointLightsLoc;
    if (this.pointLightsSize < 0)
      this.pointLightsSize = 0; 
    this.spotLightsLoc = loc(this.u_spotLights0color);
    this.spotLightsColorOffset = loc(this.u_spotLights0color) - this.spotLightsLoc;
    this.spotLightsPositionOffset = loc(this.u_spotLights0position) - this.spotLightsLoc;
    this.spotLightsDirectionOffset = loc(this.u_spotLights0direction) - this.spotLightsLoc;
    int i = b;
    if (has(this.u_spotLights0intensity))
      i = loc(this.u_spotLights0intensity) - this.spotLightsLoc; 
    this.spotLightsIntensityOffset = i;
    this.spotLightsCutoffAngleOffset = loc(this.u_spotLights0cutoffAngle) - this.spotLightsLoc;
    this.spotLightsExponentOffset = loc(this.u_spotLights0exponent) - this.spotLightsLoc;
    this.spotLightsSize = loc(this.u_spotLights1color) - this.spotLightsLoc;
    if (this.spotLightsSize < 0)
      this.spotLightsSize = 0; 
  }
  
  public void render(Renderable paramRenderable, Attributes paramAttributes) {
    if (!paramAttributes.has(BlendingAttribute.Type))
      this.context.setBlending(false, 770, 771); 
    bindMaterial(paramAttributes);
    if (this.lighting)
      bindLights(paramRenderable, paramAttributes); 
    super.render(paramRenderable, paramAttributes);
  }
  
  public void setDefaultCullFace(int paramInt) { this.config.defaultCullFace = paramInt; }
  
  public void setDefaultDepthFunc(int paramInt) { this.config.defaultDepthFunc = paramInt; }
  
  public static class Config {
    public int defaultCullFace = -1;
    
    public int defaultDepthFunc = -1;
    
    public String fragmentShader = null;
    
    public boolean ignoreUnimplemented = true;
    
    public int numBones = 12;
    
    public int numDirectionalLights = 2;
    
    public int numPointLights = 5;
    
    public int numSpotLights = 0;
    
    public String vertexShader = null;
    
    public Config() {}
    
    public Config(String param1String1, String param1String2) {
      this.vertexShader = param1String1;
      this.fragmentShader = param1String2;
    }
  }
  
  public static class Inputs {
    public static final BaseShader.Uniform alphaTest;
    
    public static final BaseShader.Uniform ambientCube;
    
    public static final BaseShader.Uniform ambientTexture;
    
    public static final BaseShader.Uniform ambientUVTransform;
    
    public static final BaseShader.Uniform bones;
    
    public static final BaseShader.Uniform cameraDirection;
    
    public static final BaseShader.Uniform cameraNearFar;
    
    public static final BaseShader.Uniform cameraPosition;
    
    public static final BaseShader.Uniform cameraUp;
    
    public static final BaseShader.Uniform diffuseColor;
    
    public static final BaseShader.Uniform diffuseTexture;
    
    public static final BaseShader.Uniform diffuseUVTransform;
    
    public static final BaseShader.Uniform dirLights;
    
    public static final BaseShader.Uniform emissiveColor;
    
    public static final BaseShader.Uniform emissiveTexture;
    
    public static final BaseShader.Uniform emissiveUVTransform;
    
    public static final BaseShader.Uniform environmentCubemap;
    
    public static final BaseShader.Uniform normalMatrix;
    
    public static final BaseShader.Uniform normalTexture;
    
    public static final BaseShader.Uniform normalUVTransform;
    
    public static final BaseShader.Uniform opacity;
    
    public static final BaseShader.Uniform pointLights;
    
    public static final BaseShader.Uniform projTrans = new BaseShader.Uniform("u_projTrans");
    
    public static final BaseShader.Uniform projViewTrans;
    
    public static final BaseShader.Uniform projViewWorldTrans;
    
    public static final BaseShader.Uniform reflectionColor;
    
    public static final BaseShader.Uniform reflectionTexture;
    
    public static final BaseShader.Uniform reflectionUVTransform;
    
    public static final BaseShader.Uniform shininess;
    
    public static final BaseShader.Uniform specularColor;
    
    public static final BaseShader.Uniform specularTexture;
    
    public static final BaseShader.Uniform specularUVTransform;
    
    public static final BaseShader.Uniform spotLights;
    
    public static final BaseShader.Uniform viewTrans = new BaseShader.Uniform("u_viewTrans");
    
    public static final BaseShader.Uniform viewWorldTrans;
    
    public static final BaseShader.Uniform worldTrans;
    
    static  {
      projViewTrans = new BaseShader.Uniform("u_projViewTrans");
      cameraPosition = new BaseShader.Uniform("u_cameraPosition");
      cameraDirection = new BaseShader.Uniform("u_cameraDirection");
      cameraUp = new BaseShader.Uniform("u_cameraUp");
      cameraNearFar = new BaseShader.Uniform("u_cameraNearFar");
      worldTrans = new BaseShader.Uniform("u_worldTrans");
      viewWorldTrans = new BaseShader.Uniform("u_viewWorldTrans");
      projViewWorldTrans = new BaseShader.Uniform("u_projViewWorldTrans");
      normalMatrix = new BaseShader.Uniform("u_normalMatrix");
      bones = new BaseShader.Uniform("u_bones");
      shininess = new BaseShader.Uniform("u_shininess", FloatAttribute.Shininess);
      opacity = new BaseShader.Uniform("u_opacity", BlendingAttribute.Type);
      diffuseColor = new BaseShader.Uniform("u_diffuseColor", ColorAttribute.Diffuse);
      diffuseTexture = new BaseShader.Uniform("u_diffuseTexture", TextureAttribute.Diffuse);
      diffuseUVTransform = new BaseShader.Uniform("u_diffuseUVTransform", TextureAttribute.Diffuse);
      specularColor = new BaseShader.Uniform("u_specularColor", ColorAttribute.Specular);
      specularTexture = new BaseShader.Uniform("u_specularTexture", TextureAttribute.Specular);
      specularUVTransform = new BaseShader.Uniform("u_specularUVTransform", TextureAttribute.Specular);
      emissiveColor = new BaseShader.Uniform("u_emissiveColor", ColorAttribute.Emissive);
      emissiveTexture = new BaseShader.Uniform("u_emissiveTexture", TextureAttribute.Emissive);
      emissiveUVTransform = new BaseShader.Uniform("u_emissiveUVTransform", TextureAttribute.Emissive);
      reflectionColor = new BaseShader.Uniform("u_reflectionColor", ColorAttribute.Reflection);
      reflectionTexture = new BaseShader.Uniform("u_reflectionTexture", TextureAttribute.Reflection);
      reflectionUVTransform = new BaseShader.Uniform("u_reflectionUVTransform", TextureAttribute.Reflection);
      normalTexture = new BaseShader.Uniform("u_normalTexture", TextureAttribute.Normal);
      normalUVTransform = new BaseShader.Uniform("u_normalUVTransform", TextureAttribute.Normal);
      ambientTexture = new BaseShader.Uniform("u_ambientTexture", TextureAttribute.Ambient);
      ambientUVTransform = new BaseShader.Uniform("u_ambientUVTransform", TextureAttribute.Ambient);
      alphaTest = new BaseShader.Uniform("u_alphaTest");
      ambientCube = new BaseShader.Uniform("u_ambientCubemap");
      dirLights = new BaseShader.Uniform("u_dirLights");
      pointLights = new BaseShader.Uniform("u_pointLights");
      spotLights = new BaseShader.Uniform("u_spotLights");
      environmentCubemap = new BaseShader.Uniform("u_environmentCubemap");
    }
  }
  
  public static class Setters {
    public static final BaseShader.Setter ambientTexture;
    
    public static final BaseShader.Setter ambientUVTransform;
    
    public static final BaseShader.Setter cameraDirection;
    
    public static final BaseShader.Setter cameraNearFar;
    
    public static final BaseShader.Setter cameraPosition;
    
    public static final BaseShader.Setter cameraUp;
    
    public static final BaseShader.Setter diffuseColor;
    
    public static final BaseShader.Setter diffuseTexture;
    
    public static final BaseShader.Setter diffuseUVTransform;
    
    public static final BaseShader.Setter emissiveColor;
    
    public static final BaseShader.Setter emissiveTexture;
    
    public static final BaseShader.Setter emissiveUVTransform;
    
    public static final BaseShader.Setter environmentCubemap;
    
    public static final BaseShader.Setter normalMatrix;
    
    public static final BaseShader.Setter normalTexture;
    
    public static final BaseShader.Setter normalUVTransform;
    
    public static final BaseShader.Setter projTrans = new BaseShader.GlobalSetter() {
        public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.projection); }
      };
    
    public static final BaseShader.Setter projViewTrans;
    
    public static final BaseShader.Setter projViewWorldTrans;
    
    public static final BaseShader.Setter reflectionColor;
    
    public static final BaseShader.Setter reflectionTexture;
    
    public static final BaseShader.Setter reflectionUVTransform;
    
    public static final BaseShader.Setter shininess;
    
    public static final BaseShader.Setter specularColor;
    
    public static final BaseShader.Setter specularTexture;
    
    public static final BaseShader.Setter specularUVTransform;
    
    public static final BaseShader.Setter viewTrans = new BaseShader.GlobalSetter() {
        public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.view); }
      };
    
    public static final BaseShader.Setter viewWorldTrans;
    
    public static final BaseShader.Setter worldTrans;
    
    static  {
      projViewTrans = new BaseShader.GlobalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.combined); }
        };
      cameraPosition = new BaseShader.GlobalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.position.x, param2BaseShader.camera.position.y, param2BaseShader.camera.position.z, 1.1881F / param2BaseShader.camera.far * param2BaseShader.camera.far); }
        };
      cameraDirection = new BaseShader.GlobalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.direction); }
        };
      cameraUp = new BaseShader.GlobalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.up); }
        };
      cameraNearFar = new BaseShader.GlobalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.camera.near, param2BaseShader.camera.far); }
        };
      worldTrans = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2Renderable.worldTransform); }
        };
      viewWorldTrans = new BaseShader.LocalSetter() {
          final Matrix4 temp = new Matrix4();
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, this.temp.set(param2BaseShader.camera.view).mul(param2Renderable.worldTransform)); }
        };
      projViewWorldTrans = new BaseShader.LocalSetter() {
          final Matrix4 temp = new Matrix4();
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, this.temp.set(param2BaseShader.camera.combined).mul(param2Renderable.worldTransform)); }
        };
      normalMatrix = new BaseShader.LocalSetter() {
          private final Matrix3 tmpM = new Matrix3();
          
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, this.tmpM.set(param2Renderable.worldTransform).inv().transpose()); }
        };
      shininess = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ((FloatAttribute)param2Attributes.get(FloatAttribute.Shininess)).value); }
        };
      diffuseColor = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ((ColorAttribute)param2Attributes.get(ColorAttribute.Diffuse)).color); }
        };
      diffuseTexture = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((TextureAttribute)param2Attributes.get(TextureAttribute.Diffuse)).textureDescription)); }
        };
      diffuseUVTransform = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            TextureAttribute textureAttribute = (TextureAttribute)param2Attributes.get(TextureAttribute.Diffuse);
            param2BaseShader.set(param2Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
          }
        };
      specularColor = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ((ColorAttribute)param2Attributes.get(ColorAttribute.Specular)).color); }
        };
      specularTexture = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((TextureAttribute)param2Attributes.get(TextureAttribute.Specular)).textureDescription)); }
        };
      specularUVTransform = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            TextureAttribute textureAttribute = (TextureAttribute)param2Attributes.get(TextureAttribute.Specular);
            param2BaseShader.set(param2Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
          }
        };
      emissiveColor = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ((ColorAttribute)param2Attributes.get(ColorAttribute.Emissive)).color); }
        };
      emissiveTexture = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((TextureAttribute)param2Attributes.get(TextureAttribute.Emissive)).textureDescription)); }
        };
      emissiveUVTransform = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            TextureAttribute textureAttribute = (TextureAttribute)param2Attributes.get(TextureAttribute.Emissive);
            param2BaseShader.set(param2Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
          }
        };
      reflectionColor = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, ((ColorAttribute)param2Attributes.get(ColorAttribute.Reflection)).color); }
        };
      reflectionTexture = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((TextureAttribute)param2Attributes.get(TextureAttribute.Reflection)).textureDescription)); }
        };
      reflectionUVTransform = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            TextureAttribute textureAttribute = (TextureAttribute)param2Attributes.get(TextureAttribute.Reflection);
            param2BaseShader.set(param2Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
          }
        };
      normalTexture = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((TextureAttribute)param2Attributes.get(TextureAttribute.Normal)).textureDescription)); }
        };
      normalUVTransform = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            TextureAttribute textureAttribute = (TextureAttribute)param2Attributes.get(TextureAttribute.Normal);
            param2BaseShader.set(param2Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
          }
        };
      ambientTexture = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) { param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((TextureAttribute)param2Attributes.get(TextureAttribute.Ambient)).textureDescription)); }
        };
      ambientUVTransform = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            TextureAttribute textureAttribute = (TextureAttribute)param2Attributes.get(TextureAttribute.Ambient);
            param2BaseShader.set(param2Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
          }
        };
      environmentCubemap = new BaseShader.LocalSetter() {
          public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
            if (param2Attributes.has(CubemapAttribute.EnvironmentMap))
              param2BaseShader.set(param2Int, param2BaseShader.context.textureBinder.bind(((CubemapAttribute)param2Attributes.get(CubemapAttribute.EnvironmentMap)).textureDescription)); 
          }
        };
    }
    
    public static class ACubemap extends BaseShader.LocalSetter {
      private static final float[] ones = { 
          1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 
          1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F };
      
      private static final Vector3 tmpV1 = new Vector3();
      
      private final AmbientCubemap cacheAmbientCubemap = new AmbientCubemap();
      
      public final int dirLightsOffset;
      
      public final int pointLightsOffset;
      
      public ACubemap(int param2Int1, int param2Int2) {
        this.dirLightsOffset = param2Int1;
        this.pointLightsOffset = param2Int2;
      }
      
      public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
        ShaderProgram shaderProgram;
        float[] arrayOfFloat;
        if (param2Renderable.environment == null) {
          shaderProgram = param2BaseShader.program;
          param2Int = param2BaseShader.loc(param2Int);
          arrayOfFloat = ones;
          shaderProgram.setUniform3fv(param2Int, arrayOfFloat, 0, arrayOfFloat.length);
        } else {
          shaderProgram.worldTransform.getTranslation(tmpV1);
          if (param2Attributes.has(ColorAttribute.AmbientLight))
            this.cacheAmbientCubemap.set(((ColorAttribute)param2Attributes.get(ColorAttribute.AmbientLight)).color); 
          if (param2Attributes.has(DirectionalLightsAttribute.Type)) {
            Array array = ((DirectionalLightsAttribute)param2Attributes.get(DirectionalLightsAttribute.Type)).lights;
            for (int i = this.dirLightsOffset; i < array.size; i++)
              this.cacheAmbientCubemap.add(((DirectionalLight)array.get(i)).color, ((DirectionalLight)array.get(i)).direction); 
          } 
          if (param2Attributes.has(PointLightsAttribute.Type)) {
            Array array = ((PointLightsAttribute)param2Attributes.get(PointLightsAttribute.Type)).lights;
            for (int i = this.pointLightsOffset; i < array.size; i++)
              this.cacheAmbientCubemap.add(((PointLight)array.get(i)).color, ((PointLight)array.get(i)).position, tmpV1, ((PointLight)array.get(i)).intensity); 
          } 
          this.cacheAmbientCubemap.clamp();
          arrayOfFloat.program.setUniform3fv(arrayOfFloat.loc(param2Int), this.cacheAmbientCubemap.data, 0, this.cacheAmbientCubemap.data.length);
        } 
      }
    }
    
    public static class Bones extends BaseShader.LocalSetter {
      private static final Matrix4 idtMatrix = new Matrix4();
      
      public final float[] bones;
      
      public Bones(int param2Int) { this.bones = new float[param2Int * 16]; }
      
      public void set(BaseShader param2BaseShader, int param2Int, Renderable param2Renderable, Attributes param2Attributes) {
        byte b = 0;
        while (true) {
          float[] arrayOfFloat1 = this.bones;
          if (b < arrayOfFloat1.length) {
            float f;
            byte b1 = b / 16;
            if (param2Renderable.bones == null || b1 >= param2Renderable.bones.length || param2Renderable.bones[b1] == null) {
              f = idtMatrix.val[b % 16];
            } else {
              f = (param2Renderable.bones[b1]).val[b % 16];
            } 
            arrayOfFloat1[b] = f;
            b++;
            continue;
          } 
          break;
        } 
        ShaderProgram shaderProgram = param2BaseShader.program;
        param2Int = param2BaseShader.loc(param2Int);
        float[] arrayOfFloat = this.bones;
        shaderProgram.setUniformMatrix4fv(param2Int, arrayOfFloat, 0, arrayOfFloat.length);
      }
    }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.projection); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    final Matrix4 temp = new Matrix4();
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, this.temp.set(param1BaseShader.camera.combined).mul(param1Renderable.worldTransform)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    private final Matrix3 tmpM = new Matrix3();
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, this.tmpM.set(param1Renderable.worldTransform).inv().transpose()); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ((FloatAttribute)param1Attributes.get(FloatAttribute.Shininess)).value); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ((ColorAttribute)param1Attributes.get(ColorAttribute.Diffuse)).color); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((TextureAttribute)param1Attributes.get(TextureAttribute.Diffuse)).textureDescription)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      TextureAttribute textureAttribute = (TextureAttribute)param1Attributes.get(TextureAttribute.Diffuse);
      param1BaseShader.set(param1Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
    }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ((ColorAttribute)param1Attributes.get(ColorAttribute.Specular)).color); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((TextureAttribute)param1Attributes.get(TextureAttribute.Specular)).textureDescription)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      TextureAttribute textureAttribute = (TextureAttribute)param1Attributes.get(TextureAttribute.Specular);
      param1BaseShader.set(param1Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
    }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ((ColorAttribute)param1Attributes.get(ColorAttribute.Emissive)).color); }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.view); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((TextureAttribute)param1Attributes.get(TextureAttribute.Emissive)).textureDescription)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      TextureAttribute textureAttribute = (TextureAttribute)param1Attributes.get(TextureAttribute.Emissive);
      param1BaseShader.set(param1Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
    }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, ((ColorAttribute)param1Attributes.get(ColorAttribute.Reflection)).color); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((TextureAttribute)param1Attributes.get(TextureAttribute.Reflection)).textureDescription)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      TextureAttribute textureAttribute = (TextureAttribute)param1Attributes.get(TextureAttribute.Reflection);
      param1BaseShader.set(param1Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
    }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((TextureAttribute)param1Attributes.get(TextureAttribute.Normal)).textureDescription)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      TextureAttribute textureAttribute = (TextureAttribute)param1Attributes.get(TextureAttribute.Normal);
      param1BaseShader.set(param1Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
    }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((TextureAttribute)param1Attributes.get(TextureAttribute.Ambient)).textureDescription)); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      TextureAttribute textureAttribute = (TextureAttribute)param1Attributes.get(TextureAttribute.Ambient);
      param1BaseShader.set(param1Int, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
    }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      if (param1Attributes.has(CubemapAttribute.EnvironmentMap))
        param1BaseShader.set(param1Int, param1BaseShader.context.textureBinder.bind(((CubemapAttribute)param1Attributes.get(CubemapAttribute.EnvironmentMap)).textureDescription)); 
    }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.combined); }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.position.x, param1BaseShader.camera.position.y, param1BaseShader.camera.position.z, 1.1881F / param1BaseShader.camera.far * param1BaseShader.camera.far); }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.direction); }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.up); }
  }
  
  static final class null extends BaseShader.GlobalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1BaseShader.camera.near, param1BaseShader.camera.far); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, param1Renderable.worldTransform); }
  }
  
  static final class null extends BaseShader.LocalSetter {
    final Matrix4 temp = new Matrix4();
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) { param1BaseShader.set(param1Int, this.temp.set(param1BaseShader.camera.view).mul(param1Renderable.worldTransform)); }
  }
  
  public static class ACubemap extends BaseShader.LocalSetter {
    private static final float[] ones = { 
        1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 
        1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F };
    
    private static final Vector3 tmpV1 = new Vector3();
    
    private final AmbientCubemap cacheAmbientCubemap = new AmbientCubemap();
    
    public final int dirLightsOffset;
    
    public final int pointLightsOffset;
    
    public ACubemap(int param1Int1, int param1Int2) {
      this.dirLightsOffset = param1Int1;
      this.pointLightsOffset = param1Int2;
    }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      ShaderProgram shaderProgram;
      float[] arrayOfFloat;
      if (param1Renderable.environment == null) {
        shaderProgram = param1BaseShader.program;
        param1Int = param1BaseShader.loc(param1Int);
        arrayOfFloat = ones;
        shaderProgram.setUniform3fv(param1Int, arrayOfFloat, 0, arrayOfFloat.length);
      } else {
        shaderProgram.worldTransform.getTranslation(tmpV1);
        if (param1Attributes.has(ColorAttribute.AmbientLight))
          this.cacheAmbientCubemap.set(((ColorAttribute)param1Attributes.get(ColorAttribute.AmbientLight)).color); 
        if (param1Attributes.has(DirectionalLightsAttribute.Type)) {
          Array array = ((DirectionalLightsAttribute)param1Attributes.get(DirectionalLightsAttribute.Type)).lights;
          for (int i = this.dirLightsOffset; i < array.size; i++)
            this.cacheAmbientCubemap.add(((DirectionalLight)array.get(i)).color, ((DirectionalLight)array.get(i)).direction); 
        } 
        if (param1Attributes.has(PointLightsAttribute.Type)) {
          Array array = ((PointLightsAttribute)param1Attributes.get(PointLightsAttribute.Type)).lights;
          for (int i = this.pointLightsOffset; i < array.size; i++)
            this.cacheAmbientCubemap.add(((PointLight)array.get(i)).color, ((PointLight)array.get(i)).position, tmpV1, ((PointLight)array.get(i)).intensity); 
        } 
        this.cacheAmbientCubemap.clamp();
        arrayOfFloat.program.setUniform3fv(arrayOfFloat.loc(param1Int), this.cacheAmbientCubemap.data, 0, this.cacheAmbientCubemap.data.length);
      } 
    }
  }
  
  public static class Bones extends BaseShader.LocalSetter {
    private static final Matrix4 idtMatrix = new Matrix4();
    
    public final float[] bones;
    
    public Bones(int param1Int) { this.bones = new float[param1Int * 16]; }
    
    public void set(BaseShader param1BaseShader, int param1Int, Renderable param1Renderable, Attributes param1Attributes) {
      byte b = 0;
      while (true) {
        float[] arrayOfFloat1 = this.bones;
        if (b < arrayOfFloat1.length) {
          float f;
          byte b1 = b / 16;
          if (param1Renderable.bones == null || b1 >= param1Renderable.bones.length || param1Renderable.bones[b1] == null) {
            f = idtMatrix.val[b % 16];
          } else {
            f = (param1Renderable.bones[b1]).val[b % 16];
          } 
          arrayOfFloat1[b] = f;
          b++;
          continue;
        } 
        break;
      } 
      ShaderProgram shaderProgram = param1BaseShader.program;
      param1Int = param1BaseShader.loc(param1Int);
      float[] arrayOfFloat = this.bones;
      shaderProgram.setUniformMatrix4fv(param1Int, arrayOfFloat, 0, arrayOfFloat.length);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/shaders/DefaultShader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */