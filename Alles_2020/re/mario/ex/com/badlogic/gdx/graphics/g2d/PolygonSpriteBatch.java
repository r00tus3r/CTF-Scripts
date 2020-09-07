package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Affine2;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;

public class PolygonSpriteBatch implements PolygonBatch {
  private int blendDstFunc = 771;
  
  private int blendDstFuncAlpha = 771;
  
  private int blendSrcFunc = 770;
  
  private int blendSrcFuncAlpha = 770;
  
  private boolean blendingDisabled;
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  float colorPacked = Color.WHITE_FLOAT_BITS;
  
  private final Matrix4 combinedMatrix = new Matrix4();
  
  private ShaderProgram customShader;
  
  private boolean drawing;
  
  private float invTexHeight = 0.0F;
  
  private float invTexWidth = 0.0F;
  
  private Texture lastTexture;
  
  public int maxTrianglesInBatch = 0;
  
  private Mesh mesh;
  
  private boolean ownsShader;
  
  private final Matrix4 projectionMatrix = new Matrix4();
  
  public int renderCalls = 0;
  
  private final ShaderProgram shader;
  
  public int totalRenderCalls = 0;
  
  private final Matrix4 transformMatrix = new Matrix4();
  
  private int triangleIndex;
  
  private final short[] triangles;
  
  private int vertexIndex;
  
  private final float[] vertices;
  
  public PolygonSpriteBatch() { this(2000, null); }
  
  public PolygonSpriteBatch(int paramInt) { this(paramInt, paramInt * 2, null); }
  
  public PolygonSpriteBatch(int paramInt1, int paramInt2, ShaderProgram paramShaderProgram) {
    if (paramInt1 <= 32767) {
      Mesh.VertexDataType vertexDataType = Mesh.VertexDataType.VertexArray;
      if (Gdx.gl30 != null)
        vertexDataType = Mesh.VertexDataType.VertexBufferObjectWithVAO; 
      paramInt2 *= 3;
      this.mesh = new Mesh(vertexDataType, false, paramInt1, paramInt2, new VertexAttribute[] { new VertexAttribute(true, 2, "a_position"), new VertexAttribute(4, 4, "a_color"), new VertexAttribute(16, 2, "a_texCoord0") });
      this.vertices = new float[paramInt1 * 5];
      this.triangles = new short[paramInt2];
      if (paramShaderProgram == null) {
        this.shader = SpriteBatch.createDefaultShader();
        this.ownsShader = true;
      } else {
        this.shader = paramShaderProgram;
      } 
      this.projectionMatrix.setToOrtho2D(0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Can't have more than 32767 vertices per batch: ");
    stringBuilder.append(paramInt1);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public PolygonSpriteBatch(int paramInt, ShaderProgram paramShaderProgram) { this(paramInt, paramInt * 2, paramShaderProgram); }
  
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
  
  private void switchTexture(Texture paramTexture) {
    flush();
    this.lastTexture = paramTexture;
    this.invTexWidth = 1.0F / paramTexture.getWidth();
    this.invTexHeight = 1.0F / paramTexture.getHeight();
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
    throw new IllegalStateException("PolygonSpriteBatch.end must be called before begin.");
  }
  
  public void disableBlending() {
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
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.triangleIndex + 6 > arrayOfShort.length || this.vertexIndex + 20 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex;
      int k = j / 5;
      int m = i + 1;
      short s1 = (short)k;
      arrayOfShort[i] = (short)s1;
      i = m + 1;
      arrayOfShort[m] = (short)(short)(k + 1);
      m = i + 1;
      short s2 = (short)(k + 2);
      arrayOfShort[i] = (short)s2;
      i = m + 1;
      arrayOfShort[m] = (short)s2;
      m = i + 1;
      arrayOfShort[i] = (short)(short)(k + 3);
      arrayOfShort[m] = (short)s1;
      this.triangleIndex = m + 1;
      paramFloat3 += paramFloat1;
      float f = paramFloat4 + paramFloat2;
      paramFloat4 = this.colorPacked;
      k = j + 1;
      arrayOfFloat[j] = paramFloat1;
      int n = k + 1;
      arrayOfFloat[k] = paramFloat2;
      j = n + 1;
      arrayOfFloat[n] = paramFloat4;
      k = j + 1;
      arrayOfFloat[j] = 0.0F;
      j = k + 1;
      arrayOfFloat[k] = 1.0F;
      k = j + 1;
      arrayOfFloat[j] = paramFloat1;
      j = k + 1;
      arrayOfFloat[k] = f;
      k = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = k + 1;
      arrayOfFloat[k] = 0.0F;
      n = j + 1;
      arrayOfFloat[j] = 0.0F;
      k = n + 1;
      arrayOfFloat[n] = paramFloat3;
      j = k + 1;
      arrayOfFloat[k] = f;
      k = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = k + 1;
      arrayOfFloat[k] = 1.0F;
      n = j + 1;
      arrayOfFloat[j] = 0.0F;
      k = n + 1;
      arrayOfFloat[n] = paramFloat3;
      j = k + 1;
      arrayOfFloat[k] = paramFloat2;
      k = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = k + 1;
      arrayOfFloat[k] = 1.0F;
      arrayOfFloat[j] = 1.0F;
      this.vertexIndex = j + 1;
      return;
    } 
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) {
    if (this.drawing) {
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.triangleIndex + 6 > arrayOfShort.length || this.vertexIndex + 20 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex;
      int k = j / 5;
      int m = i + 1;
      short s = (short)k;
      arrayOfShort[i] = (short)s;
      i = m + 1;
      arrayOfShort[m] = (short)(short)(k + 1);
      int i1 = i + 1;
      m = (short)(k + 2);
      arrayOfShort[i] = (short)m;
      i = i1 + 1;
      arrayOfShort[i1] = (short)m;
      m = i + 1;
      arrayOfShort[i] = (short)(short)(k + 3);
      arrayOfShort[m] = (short)s;
      this.triangleIndex = m + 1;
      paramFloat3 = paramFloat1 + paramFloat3;
      float f = paramFloat2 + paramFloat4;
      paramFloat4 = this.colorPacked;
      int n = j + 1;
      arrayOfFloat[j] = paramFloat1;
      j = n + 1;
      arrayOfFloat[n] = paramFloat2;
      n = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = n + 1;
      arrayOfFloat[n] = paramFloat5;
      n = j + 1;
      arrayOfFloat[j] = paramFloat6;
      j = n + 1;
      arrayOfFloat[n] = paramFloat1;
      n = j + 1;
      arrayOfFloat[j] = f;
      j = n + 1;
      arrayOfFloat[n] = paramFloat4;
      n = j + 1;
      arrayOfFloat[j] = paramFloat5;
      k = n + 1;
      arrayOfFloat[n] = paramFloat8;
      j = k + 1;
      arrayOfFloat[k] = paramFloat3;
      n = j + 1;
      arrayOfFloat[j] = f;
      j = n + 1;
      arrayOfFloat[n] = paramFloat4;
      n = j + 1;
      arrayOfFloat[j] = paramFloat7;
      j = n + 1;
      arrayOfFloat[n] = paramFloat8;
      n = j + 1;
      arrayOfFloat[j] = paramFloat3;
      j = n + 1;
      arrayOfFloat[n] = paramFloat2;
      n = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = n + 1;
      arrayOfFloat[n] = paramFloat7;
      arrayOfFloat[j] = paramFloat6;
      this.vertexIndex = j + 1;
      return;
    } 
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 815
    //   7: aload_0
    //   8: getfield triangles : [S
    //   11: astore #17
    //   13: aload_0
    //   14: getfield vertices : [F
    //   17: astore #18
    //   19: aload_1
    //   20: aload_0
    //   21: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   24: if_acmpeq -> 35
    //   27: aload_0
    //   28: aload_1
    //   29: invokespecial switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   32: goto -> 65
    //   35: aload_0
    //   36: getfield triangleIndex : I
    //   39: bipush #6
    //   41: iadd
    //   42: aload #17
    //   44: arraylength
    //   45: if_icmpgt -> 61
    //   48: aload_0
    //   49: getfield vertexIndex : I
    //   52: bipush #20
    //   54: iadd
    //   55: aload #18
    //   57: arraylength
    //   58: if_icmple -> 65
    //   61: aload_0
    //   62: invokevirtual flush : ()V
    //   65: aload_0
    //   66: getfield triangleIndex : I
    //   69: istore #19
    //   71: aload_0
    //   72: getfield vertexIndex : I
    //   75: iconst_5
    //   76: idiv
    //   77: istore #20
    //   79: iload #19
    //   81: iconst_1
    //   82: iadd
    //   83: istore #21
    //   85: iload #20
    //   87: i2s
    //   88: istore #22
    //   90: aload #17
    //   92: iload #19
    //   94: iload #22
    //   96: i2s
    //   97: sastore
    //   98: iload #21
    //   100: iconst_1
    //   101: iadd
    //   102: istore #19
    //   104: aload #17
    //   106: iload #21
    //   108: iload #20
    //   110: iconst_1
    //   111: iadd
    //   112: i2s
    //   113: i2s
    //   114: sastore
    //   115: iload #19
    //   117: iconst_1
    //   118: iadd
    //   119: istore #21
    //   121: iload #20
    //   123: iconst_2
    //   124: iadd
    //   125: i2s
    //   126: istore #23
    //   128: aload #17
    //   130: iload #19
    //   132: iload #23
    //   134: i2s
    //   135: sastore
    //   136: iload #21
    //   138: iconst_1
    //   139: iadd
    //   140: istore #19
    //   142: aload #17
    //   144: iload #21
    //   146: iload #23
    //   148: i2s
    //   149: sastore
    //   150: iload #19
    //   152: iconst_1
    //   153: iadd
    //   154: istore #21
    //   156: aload #17
    //   158: iload #19
    //   160: iload #20
    //   162: iconst_3
    //   163: iadd
    //   164: i2s
    //   165: i2s
    //   166: sastore
    //   167: aload #17
    //   169: iload #21
    //   171: iload #22
    //   173: i2s
    //   174: sastore
    //   175: aload_0
    //   176: iload #21
    //   178: iconst_1
    //   179: iadd
    //   180: putfield triangleIndex : I
    //   183: fload_2
    //   184: fload #4
    //   186: fadd
    //   187: fstore #24
    //   189: fload_3
    //   190: fload #5
    //   192: fadd
    //   193: fstore #25
    //   195: fload #4
    //   197: fneg
    //   198: fstore #26
    //   200: fload #5
    //   202: fneg
    //   203: fstore #27
    //   205: fload #6
    //   207: fload #4
    //   209: fsub
    //   210: fstore #6
    //   212: fload #7
    //   214: fload #5
    //   216: fsub
    //   217: fstore #7
    //   219: fload #8
    //   221: fconst_1
    //   222: fcmpl
    //   223: ifne -> 247
    //   226: fload #6
    //   228: fstore_2
    //   229: fload #7
    //   231: fstore_3
    //   232: fload #26
    //   234: fstore #5
    //   236: fload #27
    //   238: fstore #4
    //   240: fload #9
    //   242: fconst_1
    //   243: fcmpl
    //   244: ifeq -> 273
    //   247: fload #26
    //   249: fload #8
    //   251: fmul
    //   252: fstore #5
    //   254: fload #27
    //   256: fload #9
    //   258: fmul
    //   259: fstore #4
    //   261: fload #6
    //   263: fload #8
    //   265: fmul
    //   266: fstore_2
    //   267: fload #7
    //   269: fload #9
    //   271: fmul
    //   272: fstore_3
    //   273: fload #10
    //   275: fconst_0
    //   276: fcmpl
    //   277: ifeq -> 406
    //   280: fload #10
    //   282: invokestatic cosDeg : (F)F
    //   285: fstore #9
    //   287: fload #10
    //   289: invokestatic sinDeg : (F)F
    //   292: fstore #8
    //   294: fload #9
    //   296: fload #5
    //   298: fmul
    //   299: fstore #7
    //   301: fload #7
    //   303: fload #8
    //   305: fload #4
    //   307: fmul
    //   308: fsub
    //   309: fstore #6
    //   311: fload #5
    //   313: fload #8
    //   315: fmul
    //   316: fstore #10
    //   318: fload #4
    //   320: fload #9
    //   322: fmul
    //   323: fload #10
    //   325: fadd
    //   326: fstore #4
    //   328: fload #8
    //   330: fload_3
    //   331: fmul
    //   332: fstore #5
    //   334: fload #7
    //   336: fload #5
    //   338: fsub
    //   339: fstore #7
    //   341: fload_3
    //   342: fload #9
    //   344: fmul
    //   345: fstore #27
    //   347: fload #10
    //   349: fload #27
    //   351: fadd
    //   352: fstore #10
    //   354: fload #9
    //   356: fload_2
    //   357: fmul
    //   358: fload #5
    //   360: fsub
    //   361: fstore_3
    //   362: fload #27
    //   364: fload #8
    //   366: fload_2
    //   367: fmul
    //   368: fadd
    //   369: fstore #27
    //   371: fload_3
    //   372: fload #7
    //   374: fsub
    //   375: fload #6
    //   377: fadd
    //   378: fstore #8
    //   380: fload_3
    //   381: fstore_2
    //   382: fload #27
    //   384: fstore #9
    //   386: fload #10
    //   388: fstore_3
    //   389: fload #6
    //   391: fstore #5
    //   393: fload #27
    //   395: fload #10
    //   397: fload #4
    //   399: fsub
    //   400: fsub
    //   401: fstore #6
    //   403: goto -> 420
    //   406: fload_2
    //   407: fstore #8
    //   409: fload_3
    //   410: fstore #9
    //   412: fload #5
    //   414: fstore #7
    //   416: fload #4
    //   418: fstore #6
    //   420: iload #11
    //   422: i2f
    //   423: fstore #10
    //   425: aload_0
    //   426: getfield invTexWidth : F
    //   429: fstore #26
    //   431: fload #10
    //   433: fload #26
    //   435: fmul
    //   436: fstore #27
    //   438: iload #12
    //   440: iload #14
    //   442: iadd
    //   443: i2f
    //   444: fstore #10
    //   446: aload_0
    //   447: getfield invTexHeight : F
    //   450: fstore #28
    //   452: fload #10
    //   454: fload #28
    //   456: fmul
    //   457: fstore #10
    //   459: iload #11
    //   461: iload #13
    //   463: iadd
    //   464: i2f
    //   465: fload #26
    //   467: fmul
    //   468: fstore #26
    //   470: iload #12
    //   472: i2f
    //   473: fload #28
    //   475: fmul
    //   476: fstore #28
    //   478: iload #15
    //   480: ifeq -> 486
    //   483: goto -> 498
    //   486: fload #27
    //   488: fstore #29
    //   490: fload #26
    //   492: fstore #27
    //   494: fload #29
    //   496: fstore #26
    //   498: iload #16
    //   500: ifeq -> 506
    //   503: goto -> 518
    //   506: fload #10
    //   508: fstore #29
    //   510: fload #28
    //   512: fstore #10
    //   514: fload #29
    //   516: fstore #28
    //   518: aload_0
    //   519: getfield colorPacked : F
    //   522: fstore #29
    //   524: aload_0
    //   525: getfield vertexIndex : I
    //   528: istore #12
    //   530: iload #12
    //   532: iconst_1
    //   533: iadd
    //   534: istore #11
    //   536: aload #18
    //   538: iload #12
    //   540: fload #5
    //   542: fload #24
    //   544: fadd
    //   545: fastore
    //   546: iload #11
    //   548: iconst_1
    //   549: iadd
    //   550: istore #12
    //   552: aload #18
    //   554: iload #11
    //   556: fload #4
    //   558: fload #25
    //   560: fadd
    //   561: fastore
    //   562: iload #12
    //   564: iconst_1
    //   565: iadd
    //   566: istore #11
    //   568: aload #18
    //   570: iload #12
    //   572: fload #29
    //   574: fastore
    //   575: iload #11
    //   577: iconst_1
    //   578: iadd
    //   579: istore #12
    //   581: aload #18
    //   583: iload #11
    //   585: fload #26
    //   587: fastore
    //   588: iload #12
    //   590: iconst_1
    //   591: iadd
    //   592: istore #11
    //   594: aload #18
    //   596: iload #12
    //   598: fload #28
    //   600: fastore
    //   601: iload #11
    //   603: iconst_1
    //   604: iadd
    //   605: istore #12
    //   607: aload #18
    //   609: iload #11
    //   611: fload #7
    //   613: fload #24
    //   615: fadd
    //   616: fastore
    //   617: iload #12
    //   619: iconst_1
    //   620: iadd
    //   621: istore #11
    //   623: aload #18
    //   625: iload #12
    //   627: fload_3
    //   628: fload #25
    //   630: fadd
    //   631: fastore
    //   632: iload #11
    //   634: iconst_1
    //   635: iadd
    //   636: istore #13
    //   638: aload #18
    //   640: iload #11
    //   642: fload #29
    //   644: fastore
    //   645: iload #13
    //   647: iconst_1
    //   648: iadd
    //   649: istore #12
    //   651: aload #18
    //   653: iload #13
    //   655: fload #26
    //   657: fastore
    //   658: iload #12
    //   660: iconst_1
    //   661: iadd
    //   662: istore #11
    //   664: aload #18
    //   666: iload #12
    //   668: fload #10
    //   670: fastore
    //   671: iload #11
    //   673: iconst_1
    //   674: iadd
    //   675: istore #12
    //   677: aload #18
    //   679: iload #11
    //   681: fload_2
    //   682: fload #24
    //   684: fadd
    //   685: fastore
    //   686: iload #12
    //   688: iconst_1
    //   689: iadd
    //   690: istore #11
    //   692: aload #18
    //   694: iload #12
    //   696: fload #9
    //   698: fload #25
    //   700: fadd
    //   701: fastore
    //   702: iload #11
    //   704: iconst_1
    //   705: iadd
    //   706: istore #12
    //   708: aload #18
    //   710: iload #11
    //   712: fload #29
    //   714: fastore
    //   715: iload #12
    //   717: iconst_1
    //   718: iadd
    //   719: istore #11
    //   721: aload #18
    //   723: iload #12
    //   725: fload #27
    //   727: fastore
    //   728: iload #11
    //   730: iconst_1
    //   731: iadd
    //   732: istore #12
    //   734: aload #18
    //   736: iload #11
    //   738: fload #10
    //   740: fastore
    //   741: iload #12
    //   743: iconst_1
    //   744: iadd
    //   745: istore #11
    //   747: aload #18
    //   749: iload #12
    //   751: fload #8
    //   753: fload #24
    //   755: fadd
    //   756: fastore
    //   757: iload #11
    //   759: iconst_1
    //   760: iadd
    //   761: istore #12
    //   763: aload #18
    //   765: iload #11
    //   767: fload #6
    //   769: fload #25
    //   771: fadd
    //   772: fastore
    //   773: iload #12
    //   775: iconst_1
    //   776: iadd
    //   777: istore #11
    //   779: aload #18
    //   781: iload #12
    //   783: fload #29
    //   785: fastore
    //   786: iload #11
    //   788: iconst_1
    //   789: iadd
    //   790: istore #12
    //   792: aload #18
    //   794: iload #11
    //   796: fload #27
    //   798: fastore
    //   799: aload #18
    //   801: iload #12
    //   803: fload #28
    //   805: fastore
    //   806: aload_0
    //   807: iload #12
    //   809: iconst_1
    //   810: iadd
    //   811: putfield vertexIndex : I
    //   814: return
    //   815: new java/lang/IllegalStateException
    //   818: dup
    //   819: ldc 'PolygonSpriteBatch.begin must be called before draw.'
    //   821: invokespecial <init> : (Ljava/lang/String;)V
    //   824: athrow }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) {
    if (this.drawing) {
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.triangleIndex + 6 > arrayOfShort.length || this.vertexIndex + 20 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex / 5;
      int k = i + 1;
      short s = (short)j;
      arrayOfShort[i] = (short)s;
      i = k + 1;
      arrayOfShort[k] = (short)(short)(j + 1);
      int m = i + 1;
      k = (short)(j + 2);
      arrayOfShort[i] = (short)k;
      i = m + 1;
      arrayOfShort[m] = (short)k;
      k = i + 1;
      arrayOfShort[i] = (short)(short)(j + 3);
      arrayOfShort[k] = (short)s;
      this.triangleIndex = k + 1;
      float f1 = paramInt1;
      float f2 = this.invTexWidth;
      float f3 = f1 * f2;
      f1 = (paramInt2 + paramInt4);
      float f4 = this.invTexHeight;
      f1 *= f4;
      f2 = (paramInt1 + paramInt3) * f2;
      f4 = paramInt2 * f4;
      float f5 = paramFloat1 + paramFloat3;
      float f6 = paramFloat2 + paramFloat4;
      if (paramBoolean1) {
        paramFloat3 = f2;
      } else {
        paramFloat3 = f3;
        f3 = f2;
      } 
      f2 = f4;
      paramFloat4 = f1;
      if (paramBoolean2) {
        paramFloat4 = f4;
        f2 = f1;
      } 
      f1 = this.colorPacked;
      paramInt1 = this.vertexIndex;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = paramFloat1;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = paramFloat2;
      paramInt3 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f1;
      paramInt2 = paramInt3 + 1;
      arrayOfFloat[paramInt3] = paramFloat3;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = paramFloat4;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = paramFloat1;
      paramInt3 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f6;
      paramInt1 = paramInt3 + 1;
      arrayOfFloat[paramInt3] = f1;
      paramInt3 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = paramFloat3;
      paramInt2 = paramInt3 + 1;
      arrayOfFloat[paramInt3] = f2;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f5;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f6;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f1;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f3;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f2;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f5;
      paramInt3 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = paramFloat2;
      paramInt1 = paramInt3 + 1;
      arrayOfFloat[paramInt3] = f1;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f3;
      arrayOfFloat[paramInt2] = paramFloat4;
      this.vertexIndex = paramInt2 + 1;
      return;
    } 
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (this.drawing) {
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.triangleIndex + 6 > arrayOfShort.length || this.vertexIndex + 20 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex;
      int k = j / 5;
      int m = i + 1;
      short s1 = (short)k;
      arrayOfShort[i] = (short)s1;
      i = m + 1;
      arrayOfShort[m] = (short)(short)(k + 1);
      m = i + 1;
      short s2 = (short)(k + 2);
      arrayOfShort[i] = (short)s2;
      i = m + 1;
      arrayOfShort[m] = (short)s2;
      m = i + 1;
      arrayOfShort[i] = (short)(short)(k + 3);
      arrayOfShort[m] = (short)s1;
      this.triangleIndex = m + 1;
      float f1 = paramInt1;
      float f2 = this.invTexWidth;
      f1 *= f2;
      float f3 = (paramInt2 + paramInt4);
      float f4 = this.invTexHeight;
      f3 *= f4;
      f2 = (paramInt1 + paramInt3) * f2;
      float f5 = paramInt2 * f4;
      float f6 = paramInt3 + paramFloat1;
      float f7 = paramInt4 + paramFloat2;
      f4 = this.colorPacked;
      paramInt1 = j + 1;
      arrayOfFloat[j] = paramFloat1;
      paramInt3 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = paramFloat2;
      paramInt2 = paramInt3 + 1;
      arrayOfFloat[paramInt3] = f4;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f1;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f3;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = paramFloat1;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f7;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f4;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f1;
      paramInt3 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f5;
      paramInt1 = paramInt3 + 1;
      arrayOfFloat[paramInt3] = f6;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f7;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f4;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f2;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f5;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f6;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = paramFloat2;
      paramInt2 = paramInt1 + 1;
      arrayOfFloat[paramInt1] = f4;
      paramInt1 = paramInt2 + 1;
      arrayOfFloat[paramInt2] = f2;
      arrayOfFloat[paramInt1] = f3;
      this.vertexIndex = paramInt1 + 1;
      return;
    } 
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
  }
  
  public void draw(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (this.drawing) {
      int n;
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      int m = paramInt2 / 20 * 6;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
        int i1 = Math.min(Math.min(paramInt2, arrayOfFloat.length - arrayOfFloat.length % 20), arrayOfShort.length / 6 * 20);
        n = i1 / 20;
      } else if (this.triangleIndex + m > arrayOfShort.length || this.vertexIndex + paramInt2 > arrayOfFloat.length) {
        flush();
        int i1 = Math.min(Math.min(paramInt2, arrayOfFloat.length - arrayOfFloat.length % 20), arrayOfShort.length / 6 * 20);
        n = i1 / 20;
      } else {
        int i1 = paramInt2;
        int i2 = this.vertexIndex;
        short s1 = (short)(i2 / 5);
        int i3 = this.triangleIndex;
        n = i3;
      } 
      m = n * 6;
    } else {
      IllegalStateException illegalStateException = new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
      throw illegalStateException;
    } 
    int j = this.vertexIndex;
    short s = (short)(j / 5);
    int k = this.triangleIndex;
    int i = k;
  }
  
  public void draw(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2, short[] paramArrayOfShort, int paramInt3, int paramInt4) {
    if (this.drawing) {
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      if (paramTexture != this.lastTexture) {
        switchTexture(paramTexture);
      } else if (this.triangleIndex + paramInt4 > arrayOfShort.length || this.vertexIndex + paramInt2 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex;
      int k = j / 5;
      int m = paramInt3;
      while (m < paramInt4 + paramInt3) {
        arrayOfShort[i] = (short)(short)(paramArrayOfShort[m] + k);
        m++;
        i++;
      } 
      this.triangleIndex = i;
      System.arraycopy(paramArrayOfFloat, paramInt1, arrayOfFloat, j, paramInt2);
      this.vertexIndex += paramInt2;
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
    throw illegalStateException;
  }
  
  public void draw(PolygonRegion paramPolygonRegion, float paramFloat1, float paramFloat2) {
    if (this.drawing) {
      short[] arrayOfShort1 = this.triangles;
      short[] arrayOfShort2 = paramPolygonRegion.triangles;
      int i = arrayOfShort2.length;
      float[] arrayOfFloat3 = paramPolygonRegion.vertices;
      int j = arrayOfFloat3.length;
      Texture texture = paramPolygonRegion.region.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.triangleIndex + i > arrayOfShort1.length || this.vertexIndex + j * 5 / 2 > this.vertices.length) {
        flush();
      } 
      int k = this.triangleIndex;
      int m = this.vertexIndex;
      int n = m / 5;
      int i1 = 0;
      int i2 = 0;
      while (i2 < i) {
        arrayOfShort1[k] = (short)(short)(arrayOfShort2[i2] + n);
        i2++;
        k++;
      } 
      this.triangleIndex = k;
      float[] arrayOfFloat2 = this.vertices;
      float f = this.colorPacked;
      float[] arrayOfFloat1 = paramPolygonRegion.textureCoords;
      k = i1;
      for (i2 = m; k < j; i2 = m + 1) {
        m = i2 + 1;
        arrayOfFloat2[i2] = arrayOfFloat3[k] + paramFloat1;
        n = m + 1;
        i2 = k + 1;
        arrayOfFloat2[m] = arrayOfFloat3[i2] + paramFloat2;
        i1 = n + 1;
        arrayOfFloat2[n] = f;
        m = i1 + 1;
        arrayOfFloat2[i1] = arrayOfFloat1[k];
        arrayOfFloat2[m] = arrayOfFloat1[i2];
        k += 2;
      } 
      this.vertexIndex = i2;
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
    throw illegalStateException;
  }
  
  public void draw(PolygonRegion paramPolygonRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (this.drawing) {
      short[] arrayOfShort1 = this.triangles;
      short[] arrayOfShort2 = paramPolygonRegion.triangles;
      int i = arrayOfShort2.length;
      float[] arrayOfFloat3 = paramPolygonRegion.vertices;
      int j = arrayOfFloat3.length;
      TextureRegion textureRegion = paramPolygonRegion.region;
      Texture texture = textureRegion.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.triangleIndex + i > arrayOfShort1.length || this.vertexIndex + j * 5 / 2 > this.vertices.length) {
        flush();
      } 
      i = this.triangleIndex;
      int k = this.vertexIndex;
      int m = k / 5;
      int n = arrayOfShort2.length;
      int i1 = 0;
      int i2 = 0;
      while (i2 < n) {
        arrayOfShort1[i] = (short)(short)(arrayOfShort2[i2] + m);
        i2++;
        i++;
      } 
      this.triangleIndex = i;
      float[] arrayOfFloat2 = this.vertices;
      float f = this.colorPacked;
      float[] arrayOfFloat1 = paramPolygonRegion.textureCoords;
      paramFloat3 /= textureRegion.regionWidth;
      paramFloat4 /= textureRegion.regionHeight;
      i = i1;
      for (i2 = k; i < j; i2 = i1 + 1) {
        k = i2 + 1;
        arrayOfFloat2[i2] = arrayOfFloat3[i] * paramFloat3 + paramFloat1;
        i1 = k + 1;
        i2 = i + 1;
        arrayOfFloat2[k] = arrayOfFloat3[i2] * paramFloat4 + paramFloat2;
        k = i1 + 1;
        arrayOfFloat2[i1] = f;
        i1 = k + 1;
        arrayOfFloat2[k] = arrayOfFloat1[i];
        arrayOfFloat2[i1] = arrayOfFloat1[i2];
        i += 2;
      } 
      this.vertexIndex = i2;
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
    throw illegalStateException;
  }
  
  public void draw(PolygonRegion paramPolygonRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    if (this.drawing) {
      short[] arrayOfShort1 = this.triangles;
      short[] arrayOfShort2 = paramPolygonRegion.triangles;
      int i = arrayOfShort2.length;
      float[] arrayOfFloat3 = paramPolygonRegion.vertices;
      int j = arrayOfFloat3.length;
      TextureRegion textureRegion = paramPolygonRegion.region;
      Texture texture = textureRegion.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.triangleIndex + i > arrayOfShort1.length || this.vertexIndex + j * 5 / 2 > this.vertices.length) {
        flush();
      } 
      int k = this.triangleIndex;
      int m = this.vertexIndex;
      int n = m / 5;
      int i1 = 0;
      int i2 = 0;
      while (i2 < i) {
        arrayOfShort1[k] = (short)(short)(arrayOfShort2[i2] + n);
        i2++;
        k++;
      } 
      this.triangleIndex = k;
      float[] arrayOfFloat2 = this.vertices;
      float f1 = this.colorPacked;
      float[] arrayOfFloat1 = paramPolygonRegion.textureCoords;
      paramFloat5 /= textureRegion.regionWidth;
      paramFloat6 /= textureRegion.regionHeight;
      float f2 = MathUtils.cosDeg(paramFloat9);
      float f3 = MathUtils.sinDeg(paramFloat9);
      k = i1;
      for (i2 = m; k < j; i2++) {
        paramFloat9 = (arrayOfFloat3[k] * paramFloat5 - paramFloat3) * paramFloat7;
        m = k + 1;
        float f = (arrayOfFloat3[m] * paramFloat6 - paramFloat4) * paramFloat8;
        i1 = i2 + 1;
        arrayOfFloat2[i2] = f2 * paramFloat9 - f3 * f + paramFloat1 + paramFloat3;
        i2 = i1 + 1;
        arrayOfFloat2[i1] = paramFloat9 * f3 + f * f2 + paramFloat2 + paramFloat4;
        i1 = i2 + 1;
        arrayOfFloat2[i2] = f1;
        i2 = i1 + 1;
        arrayOfFloat2[i1] = arrayOfFloat1[k];
        arrayOfFloat2[i2] = arrayOfFloat1[m];
        k += 2;
      } 
      this.vertexIndex = i2;
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
    throw illegalStateException;
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2) { draw(paramTextureRegion, paramFloat1, paramFloat2, paramTextureRegion.getRegionWidth(), paramTextureRegion.getRegionHeight()); }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (this.drawing) {
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      Texture texture = paramTextureRegion.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.triangleIndex + 6 > arrayOfShort.length || this.vertexIndex + 20 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex / 5;
      int k = i + 1;
      short s = (short)j;
      arrayOfShort[i] = (short)s;
      i = k + 1;
      arrayOfShort[k] = (short)(short)(j + 1);
      int n = i + 1;
      k = (short)(j + 2);
      arrayOfShort[i] = (short)k;
      i = n + 1;
      arrayOfShort[n] = (short)k;
      k = i + 1;
      arrayOfShort[i] = (short)(short)(j + 3);
      arrayOfShort[k] = (short)s;
      this.triangleIndex = k + 1;
      paramFloat3 += paramFloat1;
      float f1 = paramFloat4 + paramFloat2;
      paramFloat4 = paramTextureRegion.u;
      float f2 = paramTextureRegion.v2;
      float f3 = paramTextureRegion.u2;
      float f4 = paramTextureRegion.v;
      float f5 = this.colorPacked;
      int m = this.vertexIndex;
      j = m + 1;
      arrayOfFloat[m] = paramFloat1;
      m = j + 1;
      arrayOfFloat[j] = paramFloat2;
      j = m + 1;
      arrayOfFloat[m] = f5;
      m = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = m + 1;
      arrayOfFloat[m] = f2;
      i = j + 1;
      arrayOfFloat[j] = paramFloat1;
      m = i + 1;
      arrayOfFloat[i] = f1;
      j = m + 1;
      arrayOfFloat[m] = f5;
      m = j + 1;
      arrayOfFloat[j] = paramFloat4;
      j = m + 1;
      arrayOfFloat[m] = f4;
      m = j + 1;
      arrayOfFloat[j] = paramFloat3;
      j = m + 1;
      arrayOfFloat[m] = f1;
      m = j + 1;
      arrayOfFloat[j] = f5;
      j = m + 1;
      arrayOfFloat[m] = f3;
      m = j + 1;
      arrayOfFloat[j] = f4;
      j = m + 1;
      arrayOfFloat[m] = paramFloat3;
      m = j + 1;
      arrayOfFloat[j] = paramFloat2;
      j = m + 1;
      arrayOfFloat[m] = f5;
      m = j + 1;
      arrayOfFloat[j] = f3;
      arrayOfFloat[m] = f2;
      this.vertexIndex = m + 1;
      return;
    } 
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 756
    //   7: aload_0
    //   8: getfield triangles : [S
    //   11: astore #11
    //   13: aload_0
    //   14: getfield vertices : [F
    //   17: astore #12
    //   19: aload_1
    //   20: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   23: astore #13
    //   25: aload #13
    //   27: aload_0
    //   28: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   31: if_acmpeq -> 43
    //   34: aload_0
    //   35: aload #13
    //   37: invokespecial switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   40: goto -> 73
    //   43: aload_0
    //   44: getfield triangleIndex : I
    //   47: bipush #6
    //   49: iadd
    //   50: aload #11
    //   52: arraylength
    //   53: if_icmpgt -> 69
    //   56: aload_0
    //   57: getfield vertexIndex : I
    //   60: bipush #20
    //   62: iadd
    //   63: aload #12
    //   65: arraylength
    //   66: if_icmple -> 73
    //   69: aload_0
    //   70: invokevirtual flush : ()V
    //   73: aload_0
    //   74: getfield triangleIndex : I
    //   77: istore #14
    //   79: aload_0
    //   80: getfield vertexIndex : I
    //   83: iconst_5
    //   84: idiv
    //   85: istore #15
    //   87: iload #14
    //   89: iconst_1
    //   90: iadd
    //   91: istore #16
    //   93: iload #15
    //   95: i2s
    //   96: istore #17
    //   98: aload #11
    //   100: iload #14
    //   102: iload #17
    //   104: i2s
    //   105: sastore
    //   106: iload #16
    //   108: iconst_1
    //   109: iadd
    //   110: istore #14
    //   112: aload #11
    //   114: iload #16
    //   116: iload #15
    //   118: iconst_1
    //   119: iadd
    //   120: i2s
    //   121: i2s
    //   122: sastore
    //   123: iload #14
    //   125: iconst_1
    //   126: iadd
    //   127: istore #18
    //   129: iload #15
    //   131: iconst_2
    //   132: iadd
    //   133: i2s
    //   134: istore #16
    //   136: aload #11
    //   138: iload #14
    //   140: iload #16
    //   142: i2s
    //   143: sastore
    //   144: iload #18
    //   146: iconst_1
    //   147: iadd
    //   148: istore #14
    //   150: aload #11
    //   152: iload #18
    //   154: iload #16
    //   156: i2s
    //   157: sastore
    //   158: iload #14
    //   160: iconst_1
    //   161: iadd
    //   162: istore #16
    //   164: aload #11
    //   166: iload #14
    //   168: iload #15
    //   170: iconst_3
    //   171: iadd
    //   172: i2s
    //   173: i2s
    //   174: sastore
    //   175: aload #11
    //   177: iload #16
    //   179: iload #17
    //   181: i2s
    //   182: sastore
    //   183: aload_0
    //   184: iload #16
    //   186: iconst_1
    //   187: iadd
    //   188: putfield triangleIndex : I
    //   191: fload_2
    //   192: fload #4
    //   194: fadd
    //   195: fstore #19
    //   197: fload_3
    //   198: fload #5
    //   200: fadd
    //   201: fstore #20
    //   203: fload #4
    //   205: fneg
    //   206: fstore #21
    //   208: fload #5
    //   210: fneg
    //   211: fstore #22
    //   213: fload #6
    //   215: fload #4
    //   217: fsub
    //   218: fstore #6
    //   220: fload #7
    //   222: fload #5
    //   224: fsub
    //   225: fstore #7
    //   227: fload #8
    //   229: fconst_1
    //   230: fcmpl
    //   231: ifne -> 255
    //   234: fload #6
    //   236: fstore #5
    //   238: fload #7
    //   240: fstore_2
    //   241: fload #21
    //   243: fstore #4
    //   245: fload #22
    //   247: fstore_3
    //   248: fload #9
    //   250: fconst_1
    //   251: fcmpl
    //   252: ifeq -> 281
    //   255: fload #21
    //   257: fload #8
    //   259: fmul
    //   260: fstore #4
    //   262: fload #22
    //   264: fload #9
    //   266: fmul
    //   267: fstore_3
    //   268: fload #6
    //   270: fload #8
    //   272: fmul
    //   273: fstore #5
    //   275: fload #7
    //   277: fload #9
    //   279: fmul
    //   280: fstore_2
    //   281: fload #10
    //   283: fconst_0
    //   284: fcmpl
    //   285: ifeq -> 421
    //   288: fload #10
    //   290: invokestatic cosDeg : (F)F
    //   293: fstore #7
    //   295: fload #10
    //   297: invokestatic sinDeg : (F)F
    //   300: fstore #9
    //   302: fload #7
    //   304: fload #4
    //   306: fmul
    //   307: fstore #8
    //   309: fload #8
    //   311: fload #9
    //   313: fload_3
    //   314: fmul
    //   315: fsub
    //   316: fstore #6
    //   318: fload #4
    //   320: fload #9
    //   322: fmul
    //   323: fstore #4
    //   325: fload_3
    //   326: fload #7
    //   328: fmul
    //   329: fload #4
    //   331: fadd
    //   332: fstore_3
    //   333: fload #9
    //   335: fload_2
    //   336: fmul
    //   337: fstore #10
    //   339: fload #8
    //   341: fload #10
    //   343: fsub
    //   344: fstore #8
    //   346: fload_2
    //   347: fload #7
    //   349: fmul
    //   350: fstore_2
    //   351: fload #4
    //   353: fload_2
    //   354: fadd
    //   355: fstore #22
    //   357: fload #7
    //   359: fload #5
    //   361: fmul
    //   362: fload #10
    //   364: fsub
    //   365: fstore #7
    //   367: fload_2
    //   368: fload #9
    //   370: fload #5
    //   372: fmul
    //   373: fadd
    //   374: fstore #5
    //   376: fload #7
    //   378: fload #8
    //   380: fsub
    //   381: fload #6
    //   383: fadd
    //   384: fstore #10
    //   386: fload #5
    //   388: fstore #9
    //   390: fload #22
    //   392: fstore_2
    //   393: fload #6
    //   395: fstore #4
    //   397: fload #5
    //   399: fload #22
    //   401: fload_3
    //   402: fsub
    //   403: fsub
    //   404: fstore #22
    //   406: fload #7
    //   408: fstore #5
    //   410: fload #10
    //   412: fstore #6
    //   414: fload #22
    //   416: fstore #7
    //   418: goto -> 435
    //   421: fload #5
    //   423: fstore #6
    //   425: fload_2
    //   426: fstore #9
    //   428: fload #4
    //   430: fstore #8
    //   432: fload_3
    //   433: fstore #7
    //   435: aload_1
    //   436: getfield u : F
    //   439: fstore #23
    //   441: aload_1
    //   442: getfield v2 : F
    //   445: fstore #21
    //   447: aload_1
    //   448: getfield u2 : F
    //   451: fstore #24
    //   453: aload_1
    //   454: getfield v : F
    //   457: fstore #10
    //   459: aload_0
    //   460: getfield colorPacked : F
    //   463: fstore #22
    //   465: aload_0
    //   466: getfield vertexIndex : I
    //   469: istore #17
    //   471: iload #17
    //   473: iconst_1
    //   474: iadd
    //   475: istore #15
    //   477: aload #12
    //   479: iload #17
    //   481: fload #4
    //   483: fload #19
    //   485: fadd
    //   486: fastore
    //   487: iload #15
    //   489: iconst_1
    //   490: iadd
    //   491: istore #17
    //   493: aload #12
    //   495: iload #15
    //   497: fload_3
    //   498: fload #20
    //   500: fadd
    //   501: fastore
    //   502: iload #17
    //   504: iconst_1
    //   505: iadd
    //   506: istore #15
    //   508: aload #12
    //   510: iload #17
    //   512: fload #22
    //   514: fastore
    //   515: iload #15
    //   517: iconst_1
    //   518: iadd
    //   519: istore #17
    //   521: aload #12
    //   523: iload #15
    //   525: fload #23
    //   527: fastore
    //   528: iload #17
    //   530: iconst_1
    //   531: iadd
    //   532: istore #15
    //   534: aload #12
    //   536: iload #17
    //   538: fload #21
    //   540: fastore
    //   541: iload #15
    //   543: iconst_1
    //   544: iadd
    //   545: istore #17
    //   547: aload #12
    //   549: iload #15
    //   551: fload #8
    //   553: fload #19
    //   555: fadd
    //   556: fastore
    //   557: iload #17
    //   559: iconst_1
    //   560: iadd
    //   561: istore #15
    //   563: aload #12
    //   565: iload #17
    //   567: fload_2
    //   568: fload #20
    //   570: fadd
    //   571: fastore
    //   572: iload #15
    //   574: iconst_1
    //   575: iadd
    //   576: istore #17
    //   578: aload #12
    //   580: iload #15
    //   582: fload #22
    //   584: fastore
    //   585: iload #17
    //   587: iconst_1
    //   588: iadd
    //   589: istore #16
    //   591: aload #12
    //   593: iload #17
    //   595: fload #23
    //   597: fastore
    //   598: iload #16
    //   600: iconst_1
    //   601: iadd
    //   602: istore #15
    //   604: aload #12
    //   606: iload #16
    //   608: fload #10
    //   610: fastore
    //   611: iload #15
    //   613: iconst_1
    //   614: iadd
    //   615: istore #17
    //   617: aload #12
    //   619: iload #15
    //   621: fload #5
    //   623: fload #19
    //   625: fadd
    //   626: fastore
    //   627: iload #17
    //   629: iconst_1
    //   630: iadd
    //   631: istore #15
    //   633: aload #12
    //   635: iload #17
    //   637: fload #9
    //   639: fload #20
    //   641: fadd
    //   642: fastore
    //   643: iload #15
    //   645: iconst_1
    //   646: iadd
    //   647: istore #17
    //   649: aload #12
    //   651: iload #15
    //   653: fload #22
    //   655: fastore
    //   656: iload #17
    //   658: iconst_1
    //   659: iadd
    //   660: istore #15
    //   662: aload #12
    //   664: iload #17
    //   666: fload #24
    //   668: fastore
    //   669: iload #15
    //   671: iconst_1
    //   672: iadd
    //   673: istore #17
    //   675: aload #12
    //   677: iload #15
    //   679: fload #10
    //   681: fastore
    //   682: iload #17
    //   684: iconst_1
    //   685: iadd
    //   686: istore #15
    //   688: aload #12
    //   690: iload #17
    //   692: fload #6
    //   694: fload #19
    //   696: fadd
    //   697: fastore
    //   698: iload #15
    //   700: iconst_1
    //   701: iadd
    //   702: istore #17
    //   704: aload #12
    //   706: iload #15
    //   708: fload #7
    //   710: fload #20
    //   712: fadd
    //   713: fastore
    //   714: iload #17
    //   716: iconst_1
    //   717: iadd
    //   718: istore #15
    //   720: aload #12
    //   722: iload #17
    //   724: fload #22
    //   726: fastore
    //   727: iload #15
    //   729: iconst_1
    //   730: iadd
    //   731: istore #17
    //   733: aload #12
    //   735: iload #15
    //   737: fload #24
    //   739: fastore
    //   740: aload #12
    //   742: iload #17
    //   744: fload #21
    //   746: fastore
    //   747: aload_0
    //   748: iload #17
    //   750: iconst_1
    //   751: iadd
    //   752: putfield vertexIndex : I
    //   755: return
    //   756: new java/lang/IllegalStateException
    //   759: dup
    //   760: ldc 'PolygonSpriteBatch.begin must be called before draw.'
    //   762: invokespecial <init> : (Ljava/lang/String;)V
    //   765: athrow }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 836
    //   7: aload_0
    //   8: getfield triangles : [S
    //   11: astore #12
    //   13: aload_0
    //   14: getfield vertices : [F
    //   17: astore #13
    //   19: aload_1
    //   20: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   23: astore #14
    //   25: aload #14
    //   27: aload_0
    //   28: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   31: if_acmpeq -> 43
    //   34: aload_0
    //   35: aload #14
    //   37: invokespecial switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   40: goto -> 73
    //   43: aload_0
    //   44: getfield triangleIndex : I
    //   47: bipush #6
    //   49: iadd
    //   50: aload #12
    //   52: arraylength
    //   53: if_icmpgt -> 69
    //   56: aload_0
    //   57: getfield vertexIndex : I
    //   60: bipush #20
    //   62: iadd
    //   63: aload #13
    //   65: arraylength
    //   66: if_icmple -> 73
    //   69: aload_0
    //   70: invokevirtual flush : ()V
    //   73: aload_0
    //   74: getfield triangleIndex : I
    //   77: istore #15
    //   79: aload_0
    //   80: getfield vertexIndex : I
    //   83: iconst_5
    //   84: idiv
    //   85: istore #16
    //   87: iload #15
    //   89: iconst_1
    //   90: iadd
    //   91: istore #17
    //   93: iload #16
    //   95: i2s
    //   96: istore #18
    //   98: aload #12
    //   100: iload #15
    //   102: iload #18
    //   104: i2s
    //   105: sastore
    //   106: iload #17
    //   108: iconst_1
    //   109: iadd
    //   110: istore #15
    //   112: aload #12
    //   114: iload #17
    //   116: iload #16
    //   118: iconst_1
    //   119: iadd
    //   120: i2s
    //   121: i2s
    //   122: sastore
    //   123: iload #15
    //   125: iconst_1
    //   126: iadd
    //   127: istore #17
    //   129: iload #16
    //   131: iconst_2
    //   132: iadd
    //   133: i2s
    //   134: istore #19
    //   136: aload #12
    //   138: iload #15
    //   140: iload #19
    //   142: i2s
    //   143: sastore
    //   144: iload #17
    //   146: iconst_1
    //   147: iadd
    //   148: istore #15
    //   150: aload #12
    //   152: iload #17
    //   154: iload #19
    //   156: i2s
    //   157: sastore
    //   158: iload #15
    //   160: iconst_1
    //   161: iadd
    //   162: istore #17
    //   164: aload #12
    //   166: iload #15
    //   168: iload #16
    //   170: iconst_3
    //   171: iadd
    //   172: i2s
    //   173: i2s
    //   174: sastore
    //   175: aload #12
    //   177: iload #17
    //   179: iload #18
    //   181: i2s
    //   182: sastore
    //   183: aload_0
    //   184: iload #17
    //   186: iconst_1
    //   187: iadd
    //   188: putfield triangleIndex : I
    //   191: fload_2
    //   192: fload #4
    //   194: fadd
    //   195: fstore #20
    //   197: fload_3
    //   198: fload #5
    //   200: fadd
    //   201: fstore #21
    //   203: fload #4
    //   205: fneg
    //   206: fstore #22
    //   208: fload #5
    //   210: fneg
    //   211: fstore #23
    //   213: fload #6
    //   215: fload #4
    //   217: fsub
    //   218: fstore #6
    //   220: fload #7
    //   222: fload #5
    //   224: fsub
    //   225: fstore #7
    //   227: fload #8
    //   229: fconst_1
    //   230: fcmpl
    //   231: ifne -> 255
    //   234: fload #6
    //   236: fstore #5
    //   238: fload #7
    //   240: fstore_2
    //   241: fload #22
    //   243: fstore #4
    //   245: fload #23
    //   247: fstore_3
    //   248: fload #9
    //   250: fconst_1
    //   251: fcmpl
    //   252: ifeq -> 281
    //   255: fload #22
    //   257: fload #8
    //   259: fmul
    //   260: fstore #4
    //   262: fload #23
    //   264: fload #9
    //   266: fmul
    //   267: fstore_3
    //   268: fload #6
    //   270: fload #8
    //   272: fmul
    //   273: fstore #5
    //   275: fload #7
    //   277: fload #9
    //   279: fmul
    //   280: fstore_2
    //   281: fload #10
    //   283: fconst_0
    //   284: fcmpl
    //   285: ifeq -> 415
    //   288: fload #10
    //   290: invokestatic cosDeg : (F)F
    //   293: fstore #7
    //   295: fload #10
    //   297: invokestatic sinDeg : (F)F
    //   300: fstore #10
    //   302: fload #7
    //   304: fload #4
    //   306: fmul
    //   307: fstore #9
    //   309: fload #9
    //   311: fload #10
    //   313: fload_3
    //   314: fmul
    //   315: fsub
    //   316: fstore #6
    //   318: fload #4
    //   320: fload #10
    //   322: fmul
    //   323: fstore #4
    //   325: fload_3
    //   326: fload #7
    //   328: fmul
    //   329: fload #4
    //   331: fadd
    //   332: fstore #8
    //   334: fload #10
    //   336: fload_2
    //   337: fmul
    //   338: fstore_3
    //   339: fload #9
    //   341: fload_3
    //   342: fsub
    //   343: fstore #9
    //   345: fload_2
    //   346: fload #7
    //   348: fmul
    //   349: fstore_2
    //   350: fload #4
    //   352: fload_2
    //   353: fadd
    //   354: fstore #23
    //   356: fload #7
    //   358: fload #5
    //   360: fmul
    //   361: fload_3
    //   362: fsub
    //   363: fstore #7
    //   365: fload_2
    //   366: fload #10
    //   368: fload #5
    //   370: fmul
    //   371: fadd
    //   372: fstore #5
    //   374: fload #7
    //   376: fload #9
    //   378: fsub
    //   379: fload #6
    //   381: fadd
    //   382: fstore #10
    //   384: fload #5
    //   386: fstore_3
    //   387: fload #23
    //   389: fstore_2
    //   390: fload #6
    //   392: fstore #4
    //   394: fload #5
    //   396: fload #23
    //   398: fload #8
    //   400: fsub
    //   401: fsub
    //   402: fstore #6
    //   404: fload #7
    //   406: fstore #5
    //   408: fload #10
    //   410: fstore #7
    //   412: goto -> 435
    //   415: fload #5
    //   417: fstore #7
    //   419: fload_2
    //   420: fstore #10
    //   422: fload #4
    //   424: fstore #9
    //   426: fload_3
    //   427: fstore #6
    //   429: fload_3
    //   430: fstore #8
    //   432: fload #10
    //   434: fstore_3
    //   435: iload #11
    //   437: ifeq -> 491
    //   440: aload_1
    //   441: getfield u2 : F
    //   444: fstore #24
    //   446: aload_1
    //   447: getfield v2 : F
    //   450: fstore #25
    //   452: aload_1
    //   453: getfield u : F
    //   456: fstore #26
    //   458: aload_1
    //   459: getfield v2 : F
    //   462: fstore #22
    //   464: aload_1
    //   465: getfield u : F
    //   468: fstore #10
    //   470: aload_1
    //   471: getfield v : F
    //   474: fstore #27
    //   476: aload_1
    //   477: getfield u2 : F
    //   480: fstore #28
    //   482: aload_1
    //   483: getfield v : F
    //   486: fstore #23
    //   488: goto -> 539
    //   491: aload_1
    //   492: getfield u : F
    //   495: fstore #24
    //   497: aload_1
    //   498: getfield v : F
    //   501: fstore #25
    //   503: aload_1
    //   504: getfield u2 : F
    //   507: fstore #26
    //   509: aload_1
    //   510: getfield v : F
    //   513: fstore #22
    //   515: aload_1
    //   516: getfield u2 : F
    //   519: fstore #10
    //   521: aload_1
    //   522: getfield v2 : F
    //   525: fstore #27
    //   527: aload_1
    //   528: getfield u : F
    //   531: fstore #28
    //   533: aload_1
    //   534: getfield v2 : F
    //   537: fstore #23
    //   539: aload_0
    //   540: getfield colorPacked : F
    //   543: fstore #29
    //   545: aload_0
    //   546: getfield vertexIndex : I
    //   549: istore #18
    //   551: iload #18
    //   553: iconst_1
    //   554: iadd
    //   555: istore #16
    //   557: aload #13
    //   559: iload #18
    //   561: fload #4
    //   563: fload #20
    //   565: fadd
    //   566: fastore
    //   567: iload #16
    //   569: iconst_1
    //   570: iadd
    //   571: istore #17
    //   573: aload #13
    //   575: iload #16
    //   577: fload #8
    //   579: fload #21
    //   581: fadd
    //   582: fastore
    //   583: iload #17
    //   585: iconst_1
    //   586: iadd
    //   587: istore #18
    //   589: aload #13
    //   591: iload #17
    //   593: fload #29
    //   595: fastore
    //   596: iload #18
    //   598: iconst_1
    //   599: iadd
    //   600: istore #16
    //   602: aload #13
    //   604: iload #18
    //   606: fload #24
    //   608: fastore
    //   609: iload #16
    //   611: iconst_1
    //   612: iadd
    //   613: istore #17
    //   615: aload #13
    //   617: iload #16
    //   619: fload #25
    //   621: fastore
    //   622: iload #17
    //   624: iconst_1
    //   625: iadd
    //   626: istore #18
    //   628: aload #13
    //   630: iload #17
    //   632: fload #9
    //   634: fload #20
    //   636: fadd
    //   637: fastore
    //   638: iload #18
    //   640: iconst_1
    //   641: iadd
    //   642: istore #16
    //   644: aload #13
    //   646: iload #18
    //   648: fload_2
    //   649: fload #21
    //   651: fadd
    //   652: fastore
    //   653: iload #16
    //   655: iconst_1
    //   656: iadd
    //   657: istore #18
    //   659: aload #13
    //   661: iload #16
    //   663: fload #29
    //   665: fastore
    //   666: iload #18
    //   668: iconst_1
    //   669: iadd
    //   670: istore #16
    //   672: aload #13
    //   674: iload #18
    //   676: fload #26
    //   678: fastore
    //   679: iload #16
    //   681: iconst_1
    //   682: iadd
    //   683: istore #18
    //   685: aload #13
    //   687: iload #16
    //   689: fload #22
    //   691: fastore
    //   692: iload #18
    //   694: iconst_1
    //   695: iadd
    //   696: istore #16
    //   698: aload #13
    //   700: iload #18
    //   702: fload #5
    //   704: fload #20
    //   706: fadd
    //   707: fastore
    //   708: iload #16
    //   710: iconst_1
    //   711: iadd
    //   712: istore #18
    //   714: aload #13
    //   716: iload #16
    //   718: fload_3
    //   719: fload #21
    //   721: fadd
    //   722: fastore
    //   723: iload #18
    //   725: iconst_1
    //   726: iadd
    //   727: istore #16
    //   729: aload #13
    //   731: iload #18
    //   733: fload #29
    //   735: fastore
    //   736: iload #16
    //   738: iconst_1
    //   739: iadd
    //   740: istore #18
    //   742: aload #13
    //   744: iload #16
    //   746: fload #10
    //   748: fastore
    //   749: iload #18
    //   751: iconst_1
    //   752: iadd
    //   753: istore #16
    //   755: aload #13
    //   757: iload #18
    //   759: fload #27
    //   761: fastore
    //   762: iload #16
    //   764: iconst_1
    //   765: iadd
    //   766: istore #18
    //   768: aload #13
    //   770: iload #16
    //   772: fload #7
    //   774: fload #20
    //   776: fadd
    //   777: fastore
    //   778: iload #18
    //   780: iconst_1
    //   781: iadd
    //   782: istore #16
    //   784: aload #13
    //   786: iload #18
    //   788: fload #6
    //   790: fload #21
    //   792: fadd
    //   793: fastore
    //   794: iload #16
    //   796: iconst_1
    //   797: iadd
    //   798: istore #18
    //   800: aload #13
    //   802: iload #16
    //   804: fload #29
    //   806: fastore
    //   807: iload #18
    //   809: iconst_1
    //   810: iadd
    //   811: istore #16
    //   813: aload #13
    //   815: iload #18
    //   817: fload #28
    //   819: fastore
    //   820: aload #13
    //   822: iload #16
    //   824: fload #23
    //   826: fastore
    //   827: aload_0
    //   828: iload #16
    //   830: iconst_1
    //   831: iadd
    //   832: putfield vertexIndex : I
    //   835: return
    //   836: new java/lang/IllegalStateException
    //   839: dup
    //   840: ldc 'PolygonSpriteBatch.begin must be called before draw.'
    //   842: invokespecial <init> : (Ljava/lang/String;)V
    //   845: athrow }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, Affine2 paramAffine2) {
    if (this.drawing) {
      short[] arrayOfShort = this.triangles;
      float[] arrayOfFloat = this.vertices;
      Texture texture = paramTextureRegion.texture;
      if (texture != this.lastTexture) {
        switchTexture(texture);
      } else if (this.triangleIndex + 6 > arrayOfShort.length || this.vertexIndex + 20 > arrayOfFloat.length) {
        flush();
      } 
      int i = this.triangleIndex;
      int j = this.vertexIndex / 5;
      int k = i + 1;
      short s1 = (short)j;
      arrayOfShort[i] = (short)s1;
      i = k + 1;
      arrayOfShort[k] = (short)(short)(j + 1);
      k = i + 1;
      short s2 = (short)(j + 2);
      arrayOfShort[i] = (short)s2;
      i = k + 1;
      arrayOfShort[k] = (short)s2;
      k = i + 1;
      arrayOfShort[i] = (short)(short)(j + 3);
      arrayOfShort[k] = (short)s1;
      this.triangleIndex = k + 1;
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
      int m = this.vertexIndex;
      j = m + 1;
      arrayOfFloat[m] = f1;
      m = j + 1;
      arrayOfFloat[j] = f2;
      j = m + 1;
      arrayOfFloat[m] = f21;
      m = j + 1;
      arrayOfFloat[j] = f17;
      j = m + 1;
      arrayOfFloat[m] = f18;
      m = j + 1;
      arrayOfFloat[j] = f3 * paramFloat2 + f4;
      j = m + 1;
      arrayOfFloat[m] = f5 * paramFloat2 + f6;
      m = j + 1;
      arrayOfFloat[j] = f21;
      j = m + 1;
      arrayOfFloat[m] = f17;
      m = j + 1;
      arrayOfFloat[j] = f20;
      j = m + 1;
      arrayOfFloat[m] = f7 * paramFloat1 + f8 * paramFloat2 + f9;
      m = j + 1;
      arrayOfFloat[j] = f10 * paramFloat1 + f11 * paramFloat2 + f12;
      j = m + 1;
      arrayOfFloat[m] = f21;
      i = j + 1;
      arrayOfFloat[j] = f19;
      m = i + 1;
      arrayOfFloat[i] = f20;
      j = m + 1;
      arrayOfFloat[m] = f13 * paramFloat1 + f14;
      i = j + 1;
      arrayOfFloat[j] = f15 * paramFloat1 + f16;
      m = i + 1;
      arrayOfFloat[i] = f21;
      j = m + 1;
      arrayOfFloat[m] = f19;
      arrayOfFloat[j] = f18;
      this.vertexIndex = j + 1;
      return;
    } 
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before draw.");
  }
  
  public void enableBlending() {
    flush();
    this.blendingDisabled = false;
  }
  
  public void end() {
    if (this.drawing) {
      if (this.vertexIndex > 0)
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
    throw new IllegalStateException("PolygonSpriteBatch.begin must be called before end.");
  }
  
  public void flush() {
    if (this.vertexIndex == 0)
      return; 
    this.renderCalls++;
    this.totalRenderCalls++;
    int i = this.triangleIndex;
    if (i > this.maxTrianglesInBatch)
      this.maxTrianglesInBatch = i; 
    this.lastTexture.bind();
    Mesh mesh1 = this.mesh;
    mesh1.setVertices(this.vertices, 0, this.vertexIndex);
    mesh1.setIndices(this.triangles, 0, i);
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
    this.vertexIndex = 0;
    this.triangleIndex = 0;
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
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PolygonSpriteBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */