package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Affine2;
import com.badlogic.gdx.math.Matrix4;

public class SpriteBatch implements Batch {
  @Deprecated
  public static Mesh.VertexDataType defaultVertexDataType = Mesh.VertexDataType.VertexArray;
  
  private int blendDstFunc = 771;
  
  private int blendDstFuncAlpha = 771;
  
  private int blendSrcFunc = 770;
  
  private int blendSrcFuncAlpha = 770;
  
  private boolean blendingDisabled = false;
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  float colorPacked = Color.WHITE_FLOAT_BITS;
  
  private final Matrix4 combinedMatrix = new Matrix4();
  
  private ShaderProgram customShader = null;
  
  boolean drawing = false;
  
  int idx = 0;
  
  float invTexHeight = 0.0F;
  
  float invTexWidth = 0.0F;
  
  Texture lastTexture = null;
  
  public int maxSpritesInBatch = 0;
  
  private Mesh mesh;
  
  private boolean ownsShader;
  
  private final Matrix4 projectionMatrix = new Matrix4();
  
  public int renderCalls = 0;
  
  private final ShaderProgram shader;
  
  public int totalRenderCalls = 0;
  
  private final Matrix4 transformMatrix = new Matrix4();
  
  final float[] vertices;
  
  public SpriteBatch() { this(1000, null); }
  
  public SpriteBatch(int paramInt) { this(paramInt, null); }
  
  public SpriteBatch(int paramInt, ShaderProgram paramShaderProgram) {
    if (paramInt <= 8191) {
      Mesh.VertexDataType vertexDataType;
      if (Gdx.gl30 != null) {
        vertexDataType = Mesh.VertexDataType.VertexBufferObjectWithVAO;
      } else {
        vertexDataType = defaultVertexDataType;
      } 
      int i = paramInt * 6;
      this.mesh = new Mesh(vertexDataType, false, paramInt * 4, i, new VertexAttribute[] { new VertexAttribute(true, 2, "a_position"), new VertexAttribute(4, 4, "a_color"), new VertexAttribute(16, 2, "a_texCoord0") });
      this.projectionMatrix.setToOrtho2D(0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
      this.vertices = new float[paramInt * 20];
      short[] arrayOfShort = new short[i];
      boolean bool = false;
      for (paramInt = 0; bool < i; paramInt = (short)(paramInt + 4)) {
        arrayOfShort[bool] = (short)paramInt;
        arrayOfShort[bool + true] = (short)(short)(paramInt + 1);
        short s = (short)(paramInt + 2);
        arrayOfShort[bool + 2] = (short)s;
        arrayOfShort[bool + 3] = (short)s;
        arrayOfShort[bool + 4] = (short)(short)(paramInt + 3);
        arrayOfShort[bool + 5] = (short)paramInt;
        bool += true;
      } 
      this.mesh.setIndices(arrayOfShort);
      if (paramShaderProgram == null) {
        this.shader = createDefaultShader();
        this.ownsShader = true;
      } else {
        this.shader = paramShaderProgram;
      } 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Can't have more than 8191 sprites per batch: ");
    stringBuilder.append(paramInt);
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException(stringBuilder.toString());
    throw illegalArgumentException;
  }
  
  public static ShaderProgram createDefaultShader() {
    ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projTrans * a_position;\n}\n", "#ifdef GL_ES\n#define LOWP lowp\nprecision mediump float;\n#else\n#define LOWP \n#endif\nvarying LOWP vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}");
    if (shaderProgram.isCompiled())
      return shaderProgram; 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Error compiling shader: ");
    stringBuilder.append(shaderProgram.getLog());
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  private void setupMatrices() {
    this.combinedMatrix.set(this.projectionMatrix).mul(this.transformMatrix);
    ShaderProgram shaderProgram = this.customShader;
    if (shaderProgram != null) {
      shaderProgram.setUniformMatrix("u_projTrans", this.combinedMatrix);
      this.customShader.setUniformi("u_texture", 0);
    } else {
      this.shader.setUniformMatrix("u_projTrans", this.combinedMatrix);
      this.shader.setUniformi("u_texture", 0);
    } 
  }
  
  public void begin() {
    if (!this.drawing) {
      this.renderCalls = 0;
      Gdx.gl.glDepthMask(false);
      ShaderProgram shaderProgram = this.customShader;
      if (shaderProgram != null) {
        shaderProgram.begin();
      } else {
        this.shader.begin();
      } 
      setupMatrices();
      this.drawing = true;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.end must be called before begin.");
  }
  
  public void disableBlending() {
    if (this.blendingDisabled)
      return; 
    flush();
    this.blendingDisabled = true;
  }
  
  public void dispose() {
    this.mesh.dispose();
    if (this.ownsShader) {
      ShaderProgram shaderProgram = this.shader;
      if (shaderProgram != null)
        shaderProgram.dispose(); 
    } 
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2) { draw(paramTexture, paramFloat1, paramFloat2, paramTexture.getWidth(), paramTexture.getHeight()); }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (this.drawing) {
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.idx == arrayOfFloat.length) {
        flush();
      } 
      paramFloat3 += paramFloat1;
      paramFloat4 += paramFloat2;
      float f = this.colorPacked;
      int i = this.idx;
      arrayOfFloat[i] = paramFloat1;
      arrayOfFloat[i + 1] = paramFloat2;
      arrayOfFloat[i + 2] = f;
      arrayOfFloat[i + 3] = 0.0F;
      arrayOfFloat[i + 4] = 1.0F;
      arrayOfFloat[i + 5] = paramFloat1;
      arrayOfFloat[i + 6] = paramFloat4;
      arrayOfFloat[i + 7] = f;
      arrayOfFloat[i + 8] = 0.0F;
      arrayOfFloat[i + 9] = 0.0F;
      arrayOfFloat[i + 10] = paramFloat3;
      arrayOfFloat[i + 11] = paramFloat4;
      arrayOfFloat[i + 12] = f;
      arrayOfFloat[i + 13] = 1.0F;
      arrayOfFloat[i + 14] = 0.0F;
      arrayOfFloat[i + 15] = paramFloat3;
      arrayOfFloat[i + 16] = paramFloat2;
      arrayOfFloat[i + 17] = f;
      arrayOfFloat[i + 18] = 1.0F;
      arrayOfFloat[i + 19] = 1.0F;
      this.idx = i + 20;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) {
    if (this.drawing) {
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.idx == arrayOfFloat.length) {
        flush();
      } 
      paramFloat3 += paramFloat1;
      paramFloat4 += paramFloat2;
      float f = this.colorPacked;
      int i = this.idx;
      arrayOfFloat[i] = paramFloat1;
      arrayOfFloat[i + 1] = paramFloat2;
      arrayOfFloat[i + 2] = f;
      arrayOfFloat[i + 3] = paramFloat5;
      arrayOfFloat[i + 4] = paramFloat6;
      arrayOfFloat[i + 5] = paramFloat1;
      arrayOfFloat[i + 6] = paramFloat4;
      arrayOfFloat[i + 7] = f;
      arrayOfFloat[i + 8] = paramFloat5;
      arrayOfFloat[i + 9] = paramFloat8;
      arrayOfFloat[i + 10] = paramFloat3;
      arrayOfFloat[i + 11] = paramFloat4;
      arrayOfFloat[i + 12] = f;
      arrayOfFloat[i + 13] = paramFloat7;
      arrayOfFloat[i + 14] = paramFloat8;
      arrayOfFloat[i + 15] = paramFloat3;
      arrayOfFloat[i + 16] = paramFloat2;
      arrayOfFloat[i + 17] = f;
      arrayOfFloat[i + 18] = paramFloat7;
      arrayOfFloat[i + 19] = paramFloat6;
      this.idx = i + 20;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 622
    //   7: aload_0
    //   8: getfield vertices : [F
    //   11: astore #17
    //   13: aload_1
    //   14: aload_0
    //   15: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   18: if_acmpeq -> 29
    //   21: aload_0
    //   22: aload_1
    //   23: invokevirtual switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   26: goto -> 43
    //   29: aload_0
    //   30: getfield idx : I
    //   33: aload #17
    //   35: arraylength
    //   36: if_icmpne -> 43
    //   39: aload_0
    //   40: invokevirtual flush : ()V
    //   43: fload_2
    //   44: fload #4
    //   46: fadd
    //   47: fstore #18
    //   49: fload_3
    //   50: fload #5
    //   52: fadd
    //   53: fstore #19
    //   55: fload #4
    //   57: fneg
    //   58: fstore #20
    //   60: fload #5
    //   62: fneg
    //   63: fstore #21
    //   65: fload #6
    //   67: fload #4
    //   69: fsub
    //   70: fstore #6
    //   72: fload #7
    //   74: fload #5
    //   76: fsub
    //   77: fstore #7
    //   79: fload #8
    //   81: fconst_1
    //   82: fcmpl
    //   83: ifne -> 107
    //   86: fload #6
    //   88: fstore_2
    //   89: fload #7
    //   91: fstore_3
    //   92: fload #20
    //   94: fstore #5
    //   96: fload #21
    //   98: fstore #4
    //   100: fload #9
    //   102: fconst_1
    //   103: fcmpl
    //   104: ifeq -> 133
    //   107: fload #20
    //   109: fload #8
    //   111: fmul
    //   112: fstore #5
    //   114: fload #21
    //   116: fload #9
    //   118: fmul
    //   119: fstore #4
    //   121: fload #6
    //   123: fload #8
    //   125: fmul
    //   126: fstore_2
    //   127: fload #7
    //   129: fload #9
    //   131: fmul
    //   132: fstore_3
    //   133: fload #10
    //   135: fconst_0
    //   136: fcmpl
    //   137: ifeq -> 274
    //   140: fload #10
    //   142: invokestatic cosDeg : (F)F
    //   145: fstore #9
    //   147: fload #10
    //   149: invokestatic sinDeg : (F)F
    //   152: fstore #8
    //   154: fload #9
    //   156: fload #5
    //   158: fmul
    //   159: fstore #6
    //   161: fload #6
    //   163: fload #8
    //   165: fload #4
    //   167: fmul
    //   168: fsub
    //   169: fstore #7
    //   171: fload #5
    //   173: fload #8
    //   175: fmul
    //   176: fstore #10
    //   178: fload #4
    //   180: fload #9
    //   182: fmul
    //   183: fload #10
    //   185: fadd
    //   186: fstore #4
    //   188: fload #8
    //   190: fload_3
    //   191: fmul
    //   192: fstore #5
    //   194: fload #6
    //   196: fload #5
    //   198: fsub
    //   199: fstore #6
    //   201: fload_3
    //   202: fload #9
    //   204: fmul
    //   205: fstore #21
    //   207: fload #10
    //   209: fload #21
    //   211: fadd
    //   212: fstore #10
    //   214: fload #9
    //   216: fload_2
    //   217: fmul
    //   218: fload #5
    //   220: fsub
    //   221: fstore_3
    //   222: fload #21
    //   224: fload #8
    //   226: fload_2
    //   227: fmul
    //   228: fadd
    //   229: fstore #21
    //   231: fload_3
    //   232: fload #6
    //   234: fsub
    //   235: fload #7
    //   237: fadd
    //   238: fstore #9
    //   240: fload_3
    //   241: fstore_2
    //   242: fload #21
    //   244: fstore #8
    //   246: fload #10
    //   248: fstore_3
    //   249: fload #7
    //   251: fstore #5
    //   253: fload #21
    //   255: fload #10
    //   257: fload #4
    //   259: fsub
    //   260: fsub
    //   261: fstore #10
    //   263: fload #9
    //   265: fstore #7
    //   267: fload #10
    //   269: fstore #9
    //   271: goto -> 288
    //   274: fload_2
    //   275: fstore #7
    //   277: fload_3
    //   278: fstore #8
    //   280: fload #5
    //   282: fstore #6
    //   284: fload #4
    //   286: fstore #9
    //   288: iload #11
    //   290: i2f
    //   291: fstore #10
    //   293: aload_0
    //   294: getfield invTexWidth : F
    //   297: fstore #20
    //   299: fload #10
    //   301: fload #20
    //   303: fmul
    //   304: fstore #21
    //   306: iload #12
    //   308: iload #14
    //   310: iadd
    //   311: i2f
    //   312: fstore #10
    //   314: aload_0
    //   315: getfield invTexHeight : F
    //   318: fstore #22
    //   320: fload #10
    //   322: fload #22
    //   324: fmul
    //   325: fstore #10
    //   327: iload #11
    //   329: iload #13
    //   331: iadd
    //   332: i2f
    //   333: fload #20
    //   335: fmul
    //   336: fstore #20
    //   338: iload #12
    //   340: i2f
    //   341: fload #22
    //   343: fmul
    //   344: fstore #22
    //   346: iload #15
    //   348: ifeq -> 354
    //   351: goto -> 366
    //   354: fload #20
    //   356: fstore #23
    //   358: fload #21
    //   360: fstore #20
    //   362: fload #23
    //   364: fstore #21
    //   366: iload #16
    //   368: ifeq -> 374
    //   371: goto -> 386
    //   374: fload #10
    //   376: fstore #23
    //   378: fload #22
    //   380: fstore #10
    //   382: fload #23
    //   384: fstore #22
    //   386: aload_0
    //   387: getfield colorPacked : F
    //   390: fstore #23
    //   392: aload_0
    //   393: getfield idx : I
    //   396: istore #11
    //   398: aload #17
    //   400: iload #11
    //   402: fload #5
    //   404: fload #18
    //   406: fadd
    //   407: fastore
    //   408: aload #17
    //   410: iload #11
    //   412: iconst_1
    //   413: iadd
    //   414: fload #4
    //   416: fload #19
    //   418: fadd
    //   419: fastore
    //   420: aload #17
    //   422: iload #11
    //   424: iconst_2
    //   425: iadd
    //   426: fload #23
    //   428: fastore
    //   429: aload #17
    //   431: iload #11
    //   433: iconst_3
    //   434: iadd
    //   435: fload #20
    //   437: fastore
    //   438: aload #17
    //   440: iload #11
    //   442: iconst_4
    //   443: iadd
    //   444: fload #22
    //   446: fastore
    //   447: aload #17
    //   449: iload #11
    //   451: iconst_5
    //   452: iadd
    //   453: fload #6
    //   455: fload #18
    //   457: fadd
    //   458: fastore
    //   459: aload #17
    //   461: iload #11
    //   463: bipush #6
    //   465: iadd
    //   466: fload_3
    //   467: fload #19
    //   469: fadd
    //   470: fastore
    //   471: aload #17
    //   473: iload #11
    //   475: bipush #7
    //   477: iadd
    //   478: fload #23
    //   480: fastore
    //   481: aload #17
    //   483: iload #11
    //   485: bipush #8
    //   487: iadd
    //   488: fload #20
    //   490: fastore
    //   491: aload #17
    //   493: iload #11
    //   495: bipush #9
    //   497: iadd
    //   498: fload #10
    //   500: fastore
    //   501: aload #17
    //   503: iload #11
    //   505: bipush #10
    //   507: iadd
    //   508: fload_2
    //   509: fload #18
    //   511: fadd
    //   512: fastore
    //   513: aload #17
    //   515: iload #11
    //   517: bipush #11
    //   519: iadd
    //   520: fload #8
    //   522: fload #19
    //   524: fadd
    //   525: fastore
    //   526: aload #17
    //   528: iload #11
    //   530: bipush #12
    //   532: iadd
    //   533: fload #23
    //   535: fastore
    //   536: aload #17
    //   538: iload #11
    //   540: bipush #13
    //   542: iadd
    //   543: fload #21
    //   545: fastore
    //   546: aload #17
    //   548: iload #11
    //   550: bipush #14
    //   552: iadd
    //   553: fload #10
    //   555: fastore
    //   556: aload #17
    //   558: iload #11
    //   560: bipush #15
    //   562: iadd
    //   563: fload #7
    //   565: fload #18
    //   567: fadd
    //   568: fastore
    //   569: aload #17
    //   571: iload #11
    //   573: bipush #16
    //   575: iadd
    //   576: fload #9
    //   578: fload #19
    //   580: fadd
    //   581: fastore
    //   582: aload #17
    //   584: iload #11
    //   586: bipush #17
    //   588: iadd
    //   589: fload #23
    //   591: fastore
    //   592: aload #17
    //   594: iload #11
    //   596: bipush #18
    //   598: iadd
    //   599: fload #21
    //   601: fastore
    //   602: aload #17
    //   604: iload #11
    //   606: bipush #19
    //   608: iadd
    //   609: fload #22
    //   611: fastore
    //   612: aload_0
    //   613: iload #11
    //   615: bipush #20
    //   617: iadd
    //   618: putfield idx : I
    //   621: return
    //   622: new java/lang/IllegalStateException
    //   625: dup
    //   626: ldc_w 'SpriteBatch.begin must be called before draw.'
    //   629: invokespecial <init> : (Ljava/lang/String;)V
    //   632: athrow }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) {
    if (this.drawing) {
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.idx == arrayOfFloat.length) {
        flush();
      } 
      float f1 = paramInt1;
      float f2 = this.invTexWidth;
      float f3 = f1 * f2;
      f1 = (paramInt4 + paramInt2);
      float f4 = this.invTexHeight;
      f1 *= f4;
      f2 = (paramInt1 + paramInt3) * f2;
      f4 = paramInt2 * f4;
      float f5 = paramFloat3 + paramFloat1;
      float f6 = paramFloat4 + paramFloat2;
      paramFloat4 = f3;
      paramFloat3 = f2;
      if (paramBoolean1) {
        paramFloat3 = f3;
        paramFloat4 = f2;
      } 
      if (!paramBoolean2) {
        f3 = f1;
        f1 = f4;
        f4 = f3;
      } 
      f3 = this.colorPacked;
      paramInt1 = this.idx;
      arrayOfFloat[paramInt1] = paramFloat1;
      arrayOfFloat[paramInt1 + 1] = paramFloat2;
      arrayOfFloat[paramInt1 + 2] = f3;
      arrayOfFloat[paramInt1 + 3] = paramFloat4;
      arrayOfFloat[paramInt1 + 4] = f4;
      arrayOfFloat[paramInt1 + 5] = paramFloat1;
      arrayOfFloat[paramInt1 + 6] = f6;
      arrayOfFloat[paramInt1 + 7] = f3;
      arrayOfFloat[paramInt1 + 8] = paramFloat4;
      arrayOfFloat[paramInt1 + 9] = f1;
      arrayOfFloat[paramInt1 + 10] = f5;
      arrayOfFloat[paramInt1 + 11] = f6;
      arrayOfFloat[paramInt1 + 12] = f3;
      arrayOfFloat[paramInt1 + 13] = paramFloat3;
      arrayOfFloat[paramInt1 + 14] = f1;
      arrayOfFloat[paramInt1 + 15] = f5;
      arrayOfFloat[paramInt1 + 16] = paramFloat2;
      arrayOfFloat[paramInt1 + 17] = f3;
      arrayOfFloat[paramInt1 + 18] = paramFloat3;
      arrayOfFloat[paramInt1 + 19] = f4;
      this.idx = paramInt1 + 20;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (this.drawing) {
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.idx == arrayOfFloat.length) {
        flush();
      } 
      float f1 = paramInt1;
      float f2 = this.invTexWidth;
      f1 *= f2;
      float f3 = (paramInt2 + paramInt4);
      float f4 = this.invTexHeight;
      f3 *= f4;
      f2 = (paramInt1 + paramInt3) * f2;
      float f5 = paramInt2 * f4;
      f4 = paramInt3 + paramFloat1;
      float f6 = paramInt4 + paramFloat2;
      float f7 = this.colorPacked;
      paramInt1 = this.idx;
      arrayOfFloat[paramInt1] = paramFloat1;
      arrayOfFloat[paramInt1 + 1] = paramFloat2;
      arrayOfFloat[paramInt1 + 2] = f7;
      arrayOfFloat[paramInt1 + 3] = f1;
      arrayOfFloat[paramInt1 + 4] = f3;
      arrayOfFloat[paramInt1 + 5] = paramFloat1;
      arrayOfFloat[paramInt1 + 6] = f6;
      arrayOfFloat[paramInt1 + 7] = f7;
      arrayOfFloat[paramInt1 + 8] = f1;
      arrayOfFloat[paramInt1 + 9] = f5;
      arrayOfFloat[paramInt1 + 10] = f4;
      arrayOfFloat[paramInt1 + 11] = f6;
      arrayOfFloat[paramInt1 + 12] = f7;
      arrayOfFloat[paramInt1 + 13] = f2;
      arrayOfFloat[paramInt1 + 14] = f5;
      arrayOfFloat[paramInt1 + 15] = f4;
      arrayOfFloat[paramInt1 + 16] = paramFloat2;
      arrayOfFloat[paramInt1 + 17] = f7;
      arrayOfFloat[paramInt1 + 18] = f2;
      arrayOfFloat[paramInt1 + 19] = f3;
      this.idx = paramInt1 + 20;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 152
    //   7: aload_0
    //   8: getfield vertices : [F
    //   11: arraylength
    //   12: istore #5
    //   14: aload_1
    //   15: aload_0
    //   16: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   19: if_acmpeq -> 30
    //   22: aload_0
    //   23: aload_1
    //   24: invokevirtual switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   27: goto -> 52
    //   30: iload #5
    //   32: aload_0
    //   33: getfield idx : I
    //   36: isub
    //   37: istore #6
    //   39: iload #6
    //   41: istore #7
    //   43: iload #6
    //   45: ifne -> 56
    //   48: aload_0
    //   49: invokevirtual flush : ()V
    //   52: iload #5
    //   54: istore #7
    //   56: iload #7
    //   58: iload #4
    //   60: invokestatic min : (II)I
    //   63: istore #6
    //   65: aload_2
    //   66: iload_3
    //   67: aload_0
    //   68: getfield vertices : [F
    //   71: aload_0
    //   72: getfield idx : I
    //   75: iload #6
    //   77: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   80: aload_0
    //   81: aload_0
    //   82: getfield idx : I
    //   85: iload #6
    //   87: iadd
    //   88: putfield idx : I
    //   91: iload_3
    //   92: istore #7
    //   94: iload #6
    //   96: istore_3
    //   97: iload #4
    //   99: iload_3
    //   100: isub
    //   101: istore #4
    //   103: iload #4
    //   105: ifle -> 151
    //   108: iload #7
    //   110: iload_3
    //   111: iadd
    //   112: istore #7
    //   114: aload_0
    //   115: invokevirtual flush : ()V
    //   118: iload #5
    //   120: iload #4
    //   122: invokestatic min : (II)I
    //   125: istore_3
    //   126: aload_2
    //   127: iload #7
    //   129: aload_0
    //   130: getfield vertices : [F
    //   133: iconst_0
    //   134: iload_3
    //   135: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   138: aload_0
    //   139: aload_0
    //   140: getfield idx : I
    //   143: iload_3
    //   144: iadd
    //   145: putfield idx : I
    //   148: goto -> 97
    //   151: return
    //   152: new java/lang/IllegalStateException
    //   155: dup
    //   156: ldc_w 'SpriteBatch.begin must be called before draw.'
    //   159: invokespecial <init> : (Ljava/lang/String;)V
    //   162: astore_1
    //   163: goto -> 168
    //   166: aload_1
    //   167: athrow
    //   168: goto -> 166 }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2) { draw(paramTextureRegion, paramFloat1, paramFloat2, paramTextureRegion.getRegionWidth(), paramTextureRegion.getRegionHeight()); }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (this.drawing) {
      float[] arrayOfFloat = this.vertices;
      Texture texture = paramTextureRegion.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.idx == arrayOfFloat.length) {
        flush();
      } 
      paramFloat3 += paramFloat1;
      float f1 = paramFloat4 + paramFloat2;
      float f2 = paramTextureRegion.u;
      float f3 = paramTextureRegion.v2;
      float f4 = paramTextureRegion.u2;
      paramFloat4 = paramTextureRegion.v;
      float f5 = this.colorPacked;
      int i = this.idx;
      arrayOfFloat[i] = paramFloat1;
      arrayOfFloat[i + 1] = paramFloat2;
      arrayOfFloat[i + 2] = f5;
      arrayOfFloat[i + 3] = f2;
      arrayOfFloat[i + 4] = f3;
      arrayOfFloat[i + 5] = paramFloat1;
      arrayOfFloat[i + 6] = f1;
      arrayOfFloat[i + 7] = f5;
      arrayOfFloat[i + 8] = f2;
      arrayOfFloat[i + 9] = paramFloat4;
      arrayOfFloat[i + 10] = paramFloat3;
      arrayOfFloat[i + 11] = f1;
      arrayOfFloat[i + 12] = f5;
      arrayOfFloat[i + 13] = f4;
      arrayOfFloat[i + 14] = paramFloat4;
      arrayOfFloat[i + 15] = paramFloat3;
      arrayOfFloat[i + 16] = paramFloat2;
      arrayOfFloat[i + 17] = f5;
      arrayOfFloat[i + 18] = f4;
      arrayOfFloat[i + 19] = f3;
      this.idx = i + 20;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 534
    //   7: aload_0
    //   8: getfield vertices : [F
    //   11: astore #11
    //   13: aload_1
    //   14: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   17: astore #12
    //   19: aload #12
    //   21: aload_0
    //   22: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   25: if_acmpeq -> 37
    //   28: aload_0
    //   29: aload #12
    //   31: invokevirtual switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   34: goto -> 51
    //   37: aload_0
    //   38: getfield idx : I
    //   41: aload #11
    //   43: arraylength
    //   44: if_icmpne -> 51
    //   47: aload_0
    //   48: invokevirtual flush : ()V
    //   51: fload_2
    //   52: fload #4
    //   54: fadd
    //   55: fstore #13
    //   57: fload_3
    //   58: fload #5
    //   60: fadd
    //   61: fstore #14
    //   63: fload #4
    //   65: fneg
    //   66: fstore #15
    //   68: fload #5
    //   70: fneg
    //   71: fstore #16
    //   73: fload #6
    //   75: fload #4
    //   77: fsub
    //   78: fstore #6
    //   80: fload #7
    //   82: fload #5
    //   84: fsub
    //   85: fstore #7
    //   87: fload #8
    //   89: fconst_1
    //   90: fcmpl
    //   91: ifne -> 115
    //   94: fload #15
    //   96: fstore #5
    //   98: fload #16
    //   100: fstore #4
    //   102: fload #6
    //   104: fstore_2
    //   105: fload #7
    //   107: fstore_3
    //   108: fload #9
    //   110: fconst_1
    //   111: fcmpl
    //   112: ifeq -> 141
    //   115: fload #15
    //   117: fload #8
    //   119: fmul
    //   120: fstore #5
    //   122: fload #16
    //   124: fload #9
    //   126: fmul
    //   127: fstore #4
    //   129: fload #6
    //   131: fload #8
    //   133: fmul
    //   134: fstore_2
    //   135: fload #7
    //   137: fload #9
    //   139: fmul
    //   140: fstore_3
    //   141: fload #10
    //   143: fconst_0
    //   144: fcmpl
    //   145: ifeq -> 260
    //   148: fload #10
    //   150: invokestatic cosDeg : (F)F
    //   153: fstore #7
    //   155: fload #10
    //   157: invokestatic sinDeg : (F)F
    //   160: fstore #9
    //   162: fload #7
    //   164: fload #5
    //   166: fmul
    //   167: fstore #16
    //   169: fload #16
    //   171: fload #9
    //   173: fload #4
    //   175: fmul
    //   176: fsub
    //   177: fstore #6
    //   179: fload #5
    //   181: fload #9
    //   183: fmul
    //   184: fstore #10
    //   186: fload #4
    //   188: fload #7
    //   190: fmul
    //   191: fload #10
    //   193: fadd
    //   194: fstore #4
    //   196: fload #9
    //   198: fload_3
    //   199: fmul
    //   200: fstore #8
    //   202: fload #16
    //   204: fload #8
    //   206: fsub
    //   207: fstore #5
    //   209: fload_3
    //   210: fload #7
    //   212: fmul
    //   213: fstore #16
    //   215: fload #10
    //   217: fload #16
    //   219: fadd
    //   220: fstore_3
    //   221: fload #7
    //   223: fload_2
    //   224: fmul
    //   225: fload #8
    //   227: fsub
    //   228: fstore #8
    //   230: fload #16
    //   232: fload #9
    //   234: fload_2
    //   235: fmul
    //   236: fadd
    //   237: fstore #7
    //   239: fload #6
    //   241: fload #8
    //   243: fload #5
    //   245: fsub
    //   246: fadd
    //   247: fstore_2
    //   248: fload #7
    //   250: fload_3
    //   251: fload #4
    //   253: fsub
    //   254: fsub
    //   255: fstore #9
    //   257: goto -> 274
    //   260: fload_2
    //   261: fstore #8
    //   263: fload_3
    //   264: fstore #7
    //   266: fload #5
    //   268: fstore #6
    //   270: fload #4
    //   272: fstore #9
    //   274: aload_1
    //   275: getfield u : F
    //   278: fstore #10
    //   280: aload_1
    //   281: getfield v2 : F
    //   284: fstore #17
    //   286: aload_1
    //   287: getfield u2 : F
    //   290: fstore #15
    //   292: aload_1
    //   293: getfield v : F
    //   296: fstore #18
    //   298: aload_0
    //   299: getfield colorPacked : F
    //   302: fstore #16
    //   304: aload_0
    //   305: getfield idx : I
    //   308: istore #19
    //   310: aload #11
    //   312: iload #19
    //   314: fload #6
    //   316: fload #13
    //   318: fadd
    //   319: fastore
    //   320: aload #11
    //   322: iload #19
    //   324: iconst_1
    //   325: iadd
    //   326: fload #4
    //   328: fload #14
    //   330: fadd
    //   331: fastore
    //   332: aload #11
    //   334: iload #19
    //   336: iconst_2
    //   337: iadd
    //   338: fload #16
    //   340: fastore
    //   341: aload #11
    //   343: iload #19
    //   345: iconst_3
    //   346: iadd
    //   347: fload #10
    //   349: fastore
    //   350: aload #11
    //   352: iload #19
    //   354: iconst_4
    //   355: iadd
    //   356: fload #17
    //   358: fastore
    //   359: aload #11
    //   361: iload #19
    //   363: iconst_5
    //   364: iadd
    //   365: fload #5
    //   367: fload #13
    //   369: fadd
    //   370: fastore
    //   371: aload #11
    //   373: iload #19
    //   375: bipush #6
    //   377: iadd
    //   378: fload_3
    //   379: fload #14
    //   381: fadd
    //   382: fastore
    //   383: aload #11
    //   385: iload #19
    //   387: bipush #7
    //   389: iadd
    //   390: fload #16
    //   392: fastore
    //   393: aload #11
    //   395: iload #19
    //   397: bipush #8
    //   399: iadd
    //   400: fload #10
    //   402: fastore
    //   403: aload #11
    //   405: iload #19
    //   407: bipush #9
    //   409: iadd
    //   410: fload #18
    //   412: fastore
    //   413: aload #11
    //   415: iload #19
    //   417: bipush #10
    //   419: iadd
    //   420: fload #8
    //   422: fload #13
    //   424: fadd
    //   425: fastore
    //   426: aload #11
    //   428: iload #19
    //   430: bipush #11
    //   432: iadd
    //   433: fload #7
    //   435: fload #14
    //   437: fadd
    //   438: fastore
    //   439: aload #11
    //   441: iload #19
    //   443: bipush #12
    //   445: iadd
    //   446: fload #16
    //   448: fastore
    //   449: aload #11
    //   451: iload #19
    //   453: bipush #13
    //   455: iadd
    //   456: fload #15
    //   458: fastore
    //   459: aload #11
    //   461: iload #19
    //   463: bipush #14
    //   465: iadd
    //   466: fload #18
    //   468: fastore
    //   469: aload #11
    //   471: iload #19
    //   473: bipush #15
    //   475: iadd
    //   476: fload_2
    //   477: fload #13
    //   479: fadd
    //   480: fastore
    //   481: aload #11
    //   483: iload #19
    //   485: bipush #16
    //   487: iadd
    //   488: fload #9
    //   490: fload #14
    //   492: fadd
    //   493: fastore
    //   494: aload #11
    //   496: iload #19
    //   498: bipush #17
    //   500: iadd
    //   501: fload #16
    //   503: fastore
    //   504: aload #11
    //   506: iload #19
    //   508: bipush #18
    //   510: iadd
    //   511: fload #15
    //   513: fastore
    //   514: aload #11
    //   516: iload #19
    //   518: bipush #19
    //   520: iadd
    //   521: fload #17
    //   523: fastore
    //   524: aload_0
    //   525: iload #19
    //   527: bipush #20
    //   529: iadd
    //   530: putfield idx : I
    //   533: return
    //   534: new java/lang/IllegalStateException
    //   537: dup
    //   538: ldc_w 'SpriteBatch.begin must be called before draw.'
    //   541: invokespecial <init> : (Ljava/lang/String;)V
    //   544: athrow }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 631
    //   7: aload_0
    //   8: getfield vertices : [F
    //   11: astore #12
    //   13: aload_1
    //   14: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   17: astore #13
    //   19: aload #13
    //   21: aload_0
    //   22: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   25: if_acmpeq -> 37
    //   28: aload_0
    //   29: aload #13
    //   31: invokevirtual switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   34: goto -> 51
    //   37: aload_0
    //   38: getfield idx : I
    //   41: aload #12
    //   43: arraylength
    //   44: if_icmpne -> 51
    //   47: aload_0
    //   48: invokevirtual flush : ()V
    //   51: fload_2
    //   52: fload #4
    //   54: fadd
    //   55: fstore #14
    //   57: fload_3
    //   58: fload #5
    //   60: fadd
    //   61: fstore #15
    //   63: fload #4
    //   65: fneg
    //   66: fstore #16
    //   68: fload #5
    //   70: fneg
    //   71: fstore #17
    //   73: fload #6
    //   75: fload #4
    //   77: fsub
    //   78: fstore #6
    //   80: fload #7
    //   82: fload #5
    //   84: fsub
    //   85: fstore #7
    //   87: fload #8
    //   89: fconst_1
    //   90: fcmpl
    //   91: ifne -> 115
    //   94: fload #6
    //   96: fstore #5
    //   98: fload #7
    //   100: fstore_2
    //   101: fload #16
    //   103: fstore #4
    //   105: fload #17
    //   107: fstore_3
    //   108: fload #9
    //   110: fconst_1
    //   111: fcmpl
    //   112: ifeq -> 141
    //   115: fload #16
    //   117: fload #8
    //   119: fmul
    //   120: fstore #4
    //   122: fload #17
    //   124: fload #9
    //   126: fmul
    //   127: fstore_3
    //   128: fload #6
    //   130: fload #8
    //   132: fmul
    //   133: fstore #5
    //   135: fload #7
    //   137: fload #9
    //   139: fmul
    //   140: fstore_2
    //   141: fload #10
    //   143: fconst_0
    //   144: fcmpl
    //   145: ifeq -> 277
    //   148: fload #10
    //   150: invokestatic cosDeg : (F)F
    //   153: fstore #9
    //   155: fload #10
    //   157: invokestatic sinDeg : (F)F
    //   160: fstore #8
    //   162: fload #9
    //   164: fload #4
    //   166: fmul
    //   167: fstore #6
    //   169: fload #6
    //   171: fload #8
    //   173: fload_3
    //   174: fmul
    //   175: fsub
    //   176: fstore #7
    //   178: fload #4
    //   180: fload #8
    //   182: fmul
    //   183: fstore #4
    //   185: fload_3
    //   186: fload #9
    //   188: fmul
    //   189: fload #4
    //   191: fadd
    //   192: fstore_3
    //   193: fload #8
    //   195: fload_2
    //   196: fmul
    //   197: fstore #10
    //   199: fload #6
    //   201: fload #10
    //   203: fsub
    //   204: fstore #6
    //   206: fload_2
    //   207: fload #9
    //   209: fmul
    //   210: fstore_2
    //   211: fload #4
    //   213: fload_2
    //   214: fadd
    //   215: fstore #17
    //   217: fload #9
    //   219: fload #5
    //   221: fmul
    //   222: fload #10
    //   224: fsub
    //   225: fstore #9
    //   227: fload_2
    //   228: fload #8
    //   230: fload #5
    //   232: fmul
    //   233: fadd
    //   234: fstore #5
    //   236: fload #9
    //   238: fload #6
    //   240: fsub
    //   241: fload #7
    //   243: fadd
    //   244: fstore #10
    //   246: fload #5
    //   248: fstore #8
    //   250: fload #17
    //   252: fstore_2
    //   253: fload #7
    //   255: fstore #4
    //   257: fload #5
    //   259: fload #17
    //   261: fload_3
    //   262: fsub
    //   263: fsub
    //   264: fstore #7
    //   266: fload #9
    //   268: fstore #5
    //   270: fload #10
    //   272: fstore #9
    //   274: goto -> 291
    //   277: fload #5
    //   279: fstore #9
    //   281: fload_2
    //   282: fstore #8
    //   284: fload #4
    //   286: fstore #6
    //   288: fload_3
    //   289: fstore #7
    //   291: iload #11
    //   293: ifeq -> 347
    //   296: aload_1
    //   297: getfield u2 : F
    //   300: fstore #18
    //   302: aload_1
    //   303: getfield v2 : F
    //   306: fstore #19
    //   308: aload_1
    //   309: getfield u : F
    //   312: fstore #16
    //   314: aload_1
    //   315: getfield v2 : F
    //   318: fstore #17
    //   320: aload_1
    //   321: getfield u : F
    //   324: fstore #10
    //   326: aload_1
    //   327: getfield v : F
    //   330: fstore #20
    //   332: aload_1
    //   333: getfield u2 : F
    //   336: fstore #21
    //   338: aload_1
    //   339: getfield v : F
    //   342: fstore #22
    //   344: goto -> 395
    //   347: aload_1
    //   348: getfield u : F
    //   351: fstore #18
    //   353: aload_1
    //   354: getfield v : F
    //   357: fstore #19
    //   359: aload_1
    //   360: getfield u2 : F
    //   363: fstore #16
    //   365: aload_1
    //   366: getfield v : F
    //   369: fstore #17
    //   371: aload_1
    //   372: getfield u2 : F
    //   375: fstore #10
    //   377: aload_1
    //   378: getfield v2 : F
    //   381: fstore #20
    //   383: aload_1
    //   384: getfield u : F
    //   387: fstore #21
    //   389: aload_1
    //   390: getfield v2 : F
    //   393: fstore #22
    //   395: aload_0
    //   396: getfield colorPacked : F
    //   399: fstore #23
    //   401: aload_0
    //   402: getfield idx : I
    //   405: istore #24
    //   407: aload #12
    //   409: iload #24
    //   411: fload #4
    //   413: fload #14
    //   415: fadd
    //   416: fastore
    //   417: aload #12
    //   419: iload #24
    //   421: iconst_1
    //   422: iadd
    //   423: fload_3
    //   424: fload #15
    //   426: fadd
    //   427: fastore
    //   428: aload #12
    //   430: iload #24
    //   432: iconst_2
    //   433: iadd
    //   434: fload #23
    //   436: fastore
    //   437: aload #12
    //   439: iload #24
    //   441: iconst_3
    //   442: iadd
    //   443: fload #18
    //   445: fastore
    //   446: aload #12
    //   448: iload #24
    //   450: iconst_4
    //   451: iadd
    //   452: fload #19
    //   454: fastore
    //   455: aload #12
    //   457: iload #24
    //   459: iconst_5
    //   460: iadd
    //   461: fload #6
    //   463: fload #14
    //   465: fadd
    //   466: fastore
    //   467: aload #12
    //   469: iload #24
    //   471: bipush #6
    //   473: iadd
    //   474: fload_2
    //   475: fload #15
    //   477: fadd
    //   478: fastore
    //   479: aload #12
    //   481: iload #24
    //   483: bipush #7
    //   485: iadd
    //   486: fload #23
    //   488: fastore
    //   489: aload #12
    //   491: iload #24
    //   493: bipush #8
    //   495: iadd
    //   496: fload #16
    //   498: fastore
    //   499: aload #12
    //   501: iload #24
    //   503: bipush #9
    //   505: iadd
    //   506: fload #17
    //   508: fastore
    //   509: aload #12
    //   511: iload #24
    //   513: bipush #10
    //   515: iadd
    //   516: fload #5
    //   518: fload #14
    //   520: fadd
    //   521: fastore
    //   522: aload #12
    //   524: iload #24
    //   526: bipush #11
    //   528: iadd
    //   529: fload #8
    //   531: fload #15
    //   533: fadd
    //   534: fastore
    //   535: aload #12
    //   537: iload #24
    //   539: bipush #12
    //   541: iadd
    //   542: fload #23
    //   544: fastore
    //   545: aload #12
    //   547: iload #24
    //   549: bipush #13
    //   551: iadd
    //   552: fload #10
    //   554: fastore
    //   555: aload #12
    //   557: iload #24
    //   559: bipush #14
    //   561: iadd
    //   562: fload #20
    //   564: fastore
    //   565: aload #12
    //   567: iload #24
    //   569: bipush #15
    //   571: iadd
    //   572: fload #9
    //   574: fload #14
    //   576: fadd
    //   577: fastore
    //   578: aload #12
    //   580: iload #24
    //   582: bipush #16
    //   584: iadd
    //   585: fload #7
    //   587: fload #15
    //   589: fadd
    //   590: fastore
    //   591: aload #12
    //   593: iload #24
    //   595: bipush #17
    //   597: iadd
    //   598: fload #23
    //   600: fastore
    //   601: aload #12
    //   603: iload #24
    //   605: bipush #18
    //   607: iadd
    //   608: fload #21
    //   610: fastore
    //   611: aload #12
    //   613: iload #24
    //   615: bipush #19
    //   617: iadd
    //   618: fload #22
    //   620: fastore
    //   621: aload_0
    //   622: iload #24
    //   624: bipush #20
    //   626: iadd
    //   627: putfield idx : I
    //   630: return
    //   631: new java/lang/IllegalStateException
    //   634: dup
    //   635: ldc_w 'SpriteBatch.begin must be called before draw.'
    //   638: invokespecial <init> : (Ljava/lang/String;)V
    //   641: athrow }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, Affine2 paramAffine2) {
    if (this.drawing) {
      float[] arrayOfFloat = this.vertices;
      Texture texture = paramTextureRegion.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.idx == arrayOfFloat.length) {
        flush();
      } 
      float f1 = paramAffine2.m02;
      float f2 = paramAffine2.m12;
      float f3 = paramAffine2.m01;
      float f4 = paramAffine2.m02;
      float f5 = paramAffine2.m11;
      float f6 = paramAffine2.m12;
      float f7 = paramAffine2.m00;
      float f8 = paramAffine2.m01;
      float f9 = paramAffine2.m02;
      float f10 = paramAffine2.m10;
      float f11 = paramAffine2.m11;
      float f12 = paramAffine2.m12;
      float f13 = paramAffine2.m00;
      float f14 = paramAffine2.m02;
      float f15 = paramAffine2.m10;
      float f16 = paramAffine2.m12;
      float f17 = paramTextureRegion.u;
      float f18 = paramTextureRegion.v2;
      float f19 = paramTextureRegion.u2;
      float f20 = paramTextureRegion.v;
      float f21 = this.colorPacked;
      int i = this.idx;
      arrayOfFloat[i] = f1;
      arrayOfFloat[i + 1] = f2;
      arrayOfFloat[i + 2] = f21;
      arrayOfFloat[i + 3] = f17;
      arrayOfFloat[i + 4] = f18;
      arrayOfFloat[i + 5] = f3 * paramFloat2 + f4;
      arrayOfFloat[i + 6] = f5 * paramFloat2 + f6;
      arrayOfFloat[i + 7] = f21;
      arrayOfFloat[i + 8] = f17;
      arrayOfFloat[i + 9] = f20;
      arrayOfFloat[i + 10] = f7 * paramFloat1 + f8 * paramFloat2 + f9;
      arrayOfFloat[i + 11] = f10 * paramFloat1 + f11 * paramFloat2 + f12;
      arrayOfFloat[i + 12] = f21;
      arrayOfFloat[i + 13] = f19;
      arrayOfFloat[i + 14] = f20;
      arrayOfFloat[i + 15] = f13 * paramFloat1 + f14;
      arrayOfFloat[i + 16] = f15 * paramFloat1 + f16;
      arrayOfFloat[i + 17] = f21;
      arrayOfFloat[i + 18] = f19;
      arrayOfFloat[i + 19] = f18;
      this.idx = i + 20;
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
  }
  
  public void enableBlending() {
    if (!this.blendingDisabled)
      return; 
    flush();
    this.blendingDisabled = false;
  }
  
  public void end() {
    if (this.drawing) {
      if (this.idx > 0)
        flush(); 
      this.lastTexture = null;
      this.drawing = false;
      GL20 gL20 = Gdx.gl;
      gL20.glDepthMask(true);
      if (isBlendingEnabled())
        gL20.glDisable(3042); 
      ShaderProgram shaderProgram = this.customShader;
      if (shaderProgram != null) {
        shaderProgram.end();
      } else {
        this.shader.end();
      } 
      return;
    } 
    throw new IllegalStateException("SpriteBatch.begin must be called before end.");
  }
  
  public void flush() {
    int i = this.idx;
    if (i == 0)
      return; 
    this.renderCalls++;
    this.totalRenderCalls++;
    i /= 20;
    if (i > this.maxSpritesInBatch)
      this.maxSpritesInBatch = i; 
    i *= 6;
    this.lastTexture.bind();
    Mesh mesh1 = this.mesh;
    mesh1.setVertices(this.vertices, 0, this.idx);
    mesh1.getIndicesBuffer().position(0);
    mesh1.getIndicesBuffer().limit(i);
    if (this.blendingDisabled) {
      Gdx.gl.glDisable(3042);
    } else {
      Gdx.gl.glEnable(3042);
      if (this.blendSrcFunc != -1)
        Gdx.gl.glBlendFuncSeparate(this.blendSrcFunc, this.blendDstFunc, this.blendSrcFuncAlpha, this.blendDstFuncAlpha); 
    } 
    ShaderProgram shaderProgram = this.customShader;
    if (shaderProgram == null)
      shaderProgram = this.shader; 
    mesh1.render(shaderProgram, 4, 0, i);
    this.idx = 0;
  }
  
  public int getBlendDstFunc() { return this.blendDstFunc; }
  
  public int getBlendDstFuncAlpha() { return this.blendDstFuncAlpha; }
  
  public int getBlendSrcFunc() { return this.blendSrcFunc; }
  
  public int getBlendSrcFuncAlpha() { return this.blendSrcFuncAlpha; }
  
  public Color getColor() { return this.color; }
  
  public float getPackedColor() { return this.colorPacked; }
  
  public Matrix4 getProjectionMatrix() { return this.projectionMatrix; }
  
  public ShaderProgram getShader() {
    ShaderProgram shaderProgram1 = this.customShader;
    ShaderProgram shaderProgram2 = shaderProgram1;
    if (shaderProgram1 == null)
      shaderProgram2 = this.shader; 
    return shaderProgram2;
  }
  
  public Matrix4 getTransformMatrix() { return this.transformMatrix; }
  
  public boolean isBlendingEnabled() { return this.blendingDisabled ^ true; }
  
  public boolean isDrawing() { return this.drawing; }
  
  public void setBlendFunction(int paramInt1, int paramInt2) { setBlendFunctionSeparate(paramInt1, paramInt2, paramInt1, paramInt2); }
  
  public void setBlendFunctionSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (this.blendSrcFunc == paramInt1 && this.blendDstFunc == paramInt2 && this.blendSrcFuncAlpha == paramInt3 && this.blendDstFuncAlpha == paramInt4)
      return; 
    flush();
    this.blendSrcFunc = paramInt1;
    this.blendDstFunc = paramInt2;
    this.blendSrcFuncAlpha = paramInt3;
    this.blendDstFuncAlpha = paramInt4;
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.colorPacked = this.color.toFloatBits();
  }
  
  public void setColor(Color paramColor) {
    this.color.set(paramColor);
    this.colorPacked = paramColor.toFloatBits();
  }
  
  public void setPackedColor(float paramFloat) {
    Color.abgr8888ToColor(this.color, paramFloat);
    this.colorPacked = paramFloat;
  }
  
  public void setProjectionMatrix(Matrix4 paramMatrix4) {
    if (this.drawing)
      flush(); 
    this.projectionMatrix.set(paramMatrix4);
    if (this.drawing)
      setupMatrices(); 
  }
  
  public void setShader(ShaderProgram paramShaderProgram) {
    if (this.drawing) {
      flush();
      ShaderProgram shaderProgram = this.customShader;
      if (shaderProgram != null) {
        shaderProgram.end();
      } else {
        this.shader.end();
      } 
    } 
    this.customShader = paramShaderProgram;
    if (this.drawing) {
      paramShaderProgram = this.customShader;
      if (paramShaderProgram != null) {
        paramShaderProgram.begin();
      } else {
        this.shader.begin();
      } 
      setupMatrices();
    } 
  }
  
  public void setTransformMatrix(Matrix4 paramMatrix4) {
    if (this.drawing)
      flush(); 
    this.transformMatrix.set(paramMatrix4);
    if (this.drawing)
      setupMatrices(); 
  }
  
  protected void switchTexture(Texture paramTexture) {
    flush();
    this.lastTexture = paramTexture;
    this.invTexWidth = 1.0F / paramTexture.getWidth();
    this.invTexHeight = 1.0F / paramTexture.getHeight();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/SpriteBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */