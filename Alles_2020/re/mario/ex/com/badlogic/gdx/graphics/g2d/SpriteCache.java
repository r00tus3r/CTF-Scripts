package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import java.nio.FloatBuffer;

public class SpriteCache implements Disposable {
  private static final float[] tempVertices = new float[30];
  
  private Array<Cache> caches = new Array();
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private float colorPacked = Color.WHITE_FLOAT_BITS;
  
  private final Matrix4 combinedMatrix = new Matrix4();
  
  private final IntArray counts = new IntArray(8);
  
  private Cache currentCache;
  
  private ShaderProgram customShader = null;
  
  private boolean drawing;
  
  private final Mesh mesh;
  
  private final Matrix4 projectionMatrix = new Matrix4();
  
  public int renderCalls;
  
  private final ShaderProgram shader;
  
  private final Array<Texture> textures = new Array(8);
  
  public int totalRenderCalls;
  
  private final Matrix4 transformMatrix = new Matrix4();
  
  public SpriteCache() { this(1000, false); }
  
  public SpriteCache(int paramInt, ShaderProgram paramShaderProgram, boolean paramBoolean) {
    int i = 0;
    this.renderCalls = 0;
    this.totalRenderCalls = 0;
    this.shader = paramShaderProgram;
    if (!paramBoolean || paramInt <= 8191) {
      int k;
      int j;
      if (paramBoolean) {
        j = 4;
      } else {
        j = 6;
      } 
      if (paramBoolean) {
        k = paramInt * 6;
      } else {
        k = 0;
      } 
      this.mesh = new Mesh(true, j * paramInt, k, new VertexAttribute[] { new VertexAttribute(true, 2, "a_position"), new VertexAttribute(4, 4, "a_color"), new VertexAttribute(16, 2, "a_texCoord0") });
      this.mesh.setAutoBind(false);
      if (paramBoolean) {
        k = paramInt * 6;
        short[] arrayOfShort = new short[k];
        paramInt = 0;
        j = i;
        while (j < k) {
          arrayOfShort[j + 0] = (short)paramInt;
          arrayOfShort[j + 1] = (short)(short)(paramInt + 1);
          i = (short)(paramInt + 2);
          arrayOfShort[j + 2] = (short)i;
          arrayOfShort[j + 3] = (short)i;
          arrayOfShort[j + 4] = (short)(short)(paramInt + 3);
          arrayOfShort[j + 5] = (short)paramInt;
          j += 6;
          paramInt = (short)(paramInt + 4);
        } 
        this.mesh.setIndices(arrayOfShort);
      } 
      this.projectionMatrix.setToOrtho2D(0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Can't have more than 8191 sprites per batch: ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public SpriteCache(int paramInt, boolean paramBoolean) { this(paramInt, createDefaultShader(), paramBoolean); }
  
  static ShaderProgram createDefaultShader() {
    ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projectionViewMatrix;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projectionViewMatrix * a_position;\n}\n", "#ifdef GL_ES\nprecision mediump float;\n#endif\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}");
    if (shaderProgram.isCompiled())
      return shaderProgram; 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Error compiling shader: ");
    stringBuilder.append(shaderProgram.getLog());
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void add(Texture paramTexture, float paramFloat1, float paramFloat2) {
    float f1 = paramTexture.getWidth() + paramFloat1;
    float f2 = paramTexture.getHeight() + paramFloat2;
    float[] arrayOfFloat = tempVertices;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = paramFloat2;
    float f3 = this.colorPacked;
    arrayOfFloat[2] = f3;
    arrayOfFloat[3] = 0.0F;
    arrayOfFloat[4] = 1.0F;
    arrayOfFloat[5] = paramFloat1;
    arrayOfFloat[6] = f2;
    arrayOfFloat[7] = f3;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[9] = 0.0F;
    arrayOfFloat[10] = f1;
    arrayOfFloat[11] = f2;
    arrayOfFloat[12] = f3;
    arrayOfFloat[13] = 1.0F;
    arrayOfFloat[14] = 0.0F;
    if (this.mesh.getNumIndices() > 0) {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f1;
      arrayOfFloat[16] = paramFloat2;
      arrayOfFloat[17] = this.colorPacked;
      arrayOfFloat[18] = 1.0F;
      arrayOfFloat[19] = 1.0F;
      add(paramTexture, arrayOfFloat, 0, 20);
    } else {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f1;
      arrayOfFloat[16] = f2;
      f3 = this.colorPacked;
      arrayOfFloat[17] = f3;
      arrayOfFloat[18] = 1.0F;
      arrayOfFloat[19] = 0.0F;
      arrayOfFloat[20] = f1;
      arrayOfFloat[21] = paramFloat2;
      arrayOfFloat[22] = f3;
      arrayOfFloat[23] = 1.0F;
      arrayOfFloat[24] = 1.0F;
      arrayOfFloat[25] = paramFloat1;
      arrayOfFloat[26] = paramFloat2;
      arrayOfFloat[27] = f3;
      arrayOfFloat[28] = 0.0F;
      arrayOfFloat[29] = 1.0F;
      add(paramTexture, arrayOfFloat, 0, 30);
    } 
  }
  
  public void add(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: fload_2
    //   1: fload #4
    //   3: fadd
    //   4: fstore #17
    //   6: fload_3
    //   7: fload #5
    //   9: fadd
    //   10: fstore #18
    //   12: fload #4
    //   14: fneg
    //   15: fstore #19
    //   17: fload #5
    //   19: fneg
    //   20: fstore #20
    //   22: fload #6
    //   24: fload #4
    //   26: fsub
    //   27: fstore #6
    //   29: fload #7
    //   31: fload #5
    //   33: fsub
    //   34: fstore #7
    //   36: fload #8
    //   38: fconst_1
    //   39: fcmpl
    //   40: ifne -> 64
    //   43: fload #6
    //   45: fstore_2
    //   46: fload #7
    //   48: fstore_3
    //   49: fload #19
    //   51: fstore #5
    //   53: fload #20
    //   55: fstore #4
    //   57: fload #9
    //   59: fconst_1
    //   60: fcmpl
    //   61: ifeq -> 90
    //   64: fload #19
    //   66: fload #8
    //   68: fmul
    //   69: fstore #5
    //   71: fload #20
    //   73: fload #9
    //   75: fmul
    //   76: fstore #4
    //   78: fload #6
    //   80: fload #8
    //   82: fmul
    //   83: fstore_2
    //   84: fload #7
    //   86: fload #9
    //   88: fmul
    //   89: fstore_3
    //   90: fload #10
    //   92: fconst_0
    //   93: fcmpl
    //   94: ifeq -> 223
    //   97: fload #10
    //   99: invokestatic cosDeg : (F)F
    //   102: fstore #9
    //   104: fload #10
    //   106: invokestatic sinDeg : (F)F
    //   109: fstore #8
    //   111: fload #9
    //   113: fload #5
    //   115: fmul
    //   116: fstore #6
    //   118: fload #6
    //   120: fload #8
    //   122: fload #4
    //   124: fmul
    //   125: fsub
    //   126: fstore #7
    //   128: fload #5
    //   130: fload #8
    //   132: fmul
    //   133: fstore #10
    //   135: fload #4
    //   137: fload #9
    //   139: fmul
    //   140: fload #10
    //   142: fadd
    //   143: fstore #4
    //   145: fload #8
    //   147: fload_3
    //   148: fmul
    //   149: fstore #5
    //   151: fload #6
    //   153: fload #5
    //   155: fsub
    //   156: fstore #6
    //   158: fload_3
    //   159: fload #9
    //   161: fmul
    //   162: fstore #20
    //   164: fload #10
    //   166: fload #20
    //   168: fadd
    //   169: fstore #10
    //   171: fload #9
    //   173: fload_2
    //   174: fmul
    //   175: fload #5
    //   177: fsub
    //   178: fstore_3
    //   179: fload #20
    //   181: fload #8
    //   183: fload_2
    //   184: fmul
    //   185: fadd
    //   186: fstore #20
    //   188: fload_3
    //   189: fload #6
    //   191: fsub
    //   192: fload #7
    //   194: fadd
    //   195: fstore #8
    //   197: fload_3
    //   198: fstore_2
    //   199: fload #20
    //   201: fstore #9
    //   203: fload #10
    //   205: fstore_3
    //   206: fload #7
    //   208: fstore #5
    //   210: fload #20
    //   212: fload #10
    //   214: fload #4
    //   216: fsub
    //   217: fsub
    //   218: fstore #7
    //   220: goto -> 237
    //   223: fload_2
    //   224: fstore #8
    //   226: fload_3
    //   227: fstore #9
    //   229: fload #5
    //   231: fstore #6
    //   233: fload #4
    //   235: fstore #7
    //   237: fload #5
    //   239: fload #17
    //   241: fadd
    //   242: fstore #10
    //   244: fload #4
    //   246: fload #18
    //   248: fadd
    //   249: fstore #20
    //   251: fload_2
    //   252: fload #17
    //   254: fadd
    //   255: fstore #19
    //   257: fload #9
    //   259: fload #18
    //   261: fadd
    //   262: fstore #21
    //   264: fload #8
    //   266: fload #17
    //   268: fadd
    //   269: fstore #22
    //   271: fload #7
    //   273: fload #18
    //   275: fadd
    //   276: fstore #23
    //   278: fconst_1
    //   279: aload_1
    //   280: invokevirtual getWidth : ()I
    //   283: i2f
    //   284: fdiv
    //   285: fstore #4
    //   287: fconst_1
    //   288: aload_1
    //   289: invokevirtual getHeight : ()I
    //   292: i2f
    //   293: fdiv
    //   294: fstore #7
    //   296: iload #11
    //   298: i2f
    //   299: fload #4
    //   301: fmul
    //   302: fstore #5
    //   304: iload #12
    //   306: iload #14
    //   308: iadd
    //   309: i2f
    //   310: fload #7
    //   312: fmul
    //   313: fstore_2
    //   314: iload #11
    //   316: iload #13
    //   318: iadd
    //   319: i2f
    //   320: fload #4
    //   322: fmul
    //   323: fstore #4
    //   325: iload #12
    //   327: i2f
    //   328: fload #7
    //   330: fmul
    //   331: fstore #7
    //   333: iload #15
    //   335: ifeq -> 341
    //   338: goto -> 353
    //   341: fload #4
    //   343: fstore #8
    //   345: fload #5
    //   347: fstore #4
    //   349: fload #8
    //   351: fstore #5
    //   353: fload #7
    //   355: fstore #9
    //   357: fload_2
    //   358: fstore #8
    //   360: iload #16
    //   362: ifeq -> 372
    //   365: fload #7
    //   367: fstore #8
    //   369: fload_2
    //   370: fstore #9
    //   372: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   375: astore #24
    //   377: aload #24
    //   379: iconst_0
    //   380: fload #10
    //   382: fastore
    //   383: aload #24
    //   385: iconst_1
    //   386: fload #20
    //   388: fastore
    //   389: aload_0
    //   390: getfield colorPacked : F
    //   393: fstore_2
    //   394: aload #24
    //   396: iconst_2
    //   397: fload_2
    //   398: fastore
    //   399: aload #24
    //   401: iconst_3
    //   402: fload #4
    //   404: fastore
    //   405: aload #24
    //   407: iconst_4
    //   408: fload #8
    //   410: fastore
    //   411: aload #24
    //   413: iconst_5
    //   414: fload #6
    //   416: fload #17
    //   418: fadd
    //   419: fastore
    //   420: aload #24
    //   422: bipush #6
    //   424: fload_3
    //   425: fload #18
    //   427: fadd
    //   428: fastore
    //   429: aload #24
    //   431: bipush #7
    //   433: fload_2
    //   434: fastore
    //   435: aload #24
    //   437: bipush #8
    //   439: fload #4
    //   441: fastore
    //   442: aload #24
    //   444: bipush #9
    //   446: fload #9
    //   448: fastore
    //   449: aload #24
    //   451: bipush #10
    //   453: fload #19
    //   455: fastore
    //   456: aload #24
    //   458: bipush #11
    //   460: fload #21
    //   462: fastore
    //   463: aload #24
    //   465: bipush #12
    //   467: fload_2
    //   468: fastore
    //   469: aload #24
    //   471: bipush #13
    //   473: fload #5
    //   475: fastore
    //   476: aload #24
    //   478: bipush #14
    //   480: fload #9
    //   482: fastore
    //   483: aload_0
    //   484: getfield mesh : Lcom/badlogic/gdx/graphics/Mesh;
    //   487: invokevirtual getNumIndices : ()I
    //   490: ifle -> 548
    //   493: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   496: astore #24
    //   498: aload #24
    //   500: bipush #15
    //   502: fload #22
    //   504: fastore
    //   505: aload #24
    //   507: bipush #16
    //   509: fload #23
    //   511: fastore
    //   512: aload #24
    //   514: bipush #17
    //   516: aload_0
    //   517: getfield colorPacked : F
    //   520: fastore
    //   521: aload #24
    //   523: bipush #18
    //   525: fload #5
    //   527: fastore
    //   528: aload #24
    //   530: bipush #19
    //   532: fload #8
    //   534: fastore
    //   535: aload_0
    //   536: aload_1
    //   537: aload #24
    //   539: iconst_0
    //   540: bipush #20
    //   542: invokevirtual add : (Lcom/badlogic/gdx/graphics/Texture;[FII)V
    //   545: goto -> 670
    //   548: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   551: astore #24
    //   553: aload #24
    //   555: bipush #15
    //   557: fload #19
    //   559: fastore
    //   560: aload #24
    //   562: bipush #16
    //   564: fload #21
    //   566: fastore
    //   567: aload_0
    //   568: getfield colorPacked : F
    //   571: fstore_2
    //   572: aload #24
    //   574: bipush #17
    //   576: fload_2
    //   577: fastore
    //   578: aload #24
    //   580: bipush #18
    //   582: fload #5
    //   584: fastore
    //   585: aload #24
    //   587: bipush #19
    //   589: fload #9
    //   591: fastore
    //   592: aload #24
    //   594: bipush #20
    //   596: fload #22
    //   598: fastore
    //   599: aload #24
    //   601: bipush #21
    //   603: fload #23
    //   605: fastore
    //   606: aload #24
    //   608: bipush #22
    //   610: fload_2
    //   611: fastore
    //   612: aload #24
    //   614: bipush #23
    //   616: fload #5
    //   618: fastore
    //   619: aload #24
    //   621: bipush #24
    //   623: fload #8
    //   625: fastore
    //   626: aload #24
    //   628: bipush #25
    //   630: fload #10
    //   632: fastore
    //   633: aload #24
    //   635: bipush #26
    //   637: fload #20
    //   639: fastore
    //   640: aload #24
    //   642: bipush #27
    //   644: fload_2
    //   645: fastore
    //   646: aload #24
    //   648: bipush #28
    //   650: fload #4
    //   652: fastore
    //   653: aload #24
    //   655: bipush #29
    //   657: fload #8
    //   659: fastore
    //   660: aload_0
    //   661: aload_1
    //   662: aload #24
    //   664: iconst_0
    //   665: bipush #30
    //   667: invokevirtual add : (Lcom/badlogic/gdx/graphics/Texture;[FII)V
    //   670: return }
  
  public void add(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) {
    float f1 = 1.0F / paramTexture.getWidth();
    float f2 = 1.0F / paramTexture.getHeight();
    float f3 = paramInt1 * f1;
    float f4 = (paramInt2 + paramInt4) * f2;
    f1 = (paramInt1 + paramInt3) * f1;
    f2 = paramInt2 * f2;
    float f5 = paramFloat1 + paramFloat3;
    float f6 = paramFloat2 + paramFloat4;
    paramFloat4 = f1;
    paramFloat3 = f3;
    if (paramBoolean1) {
      paramFloat3 = f1;
      paramFloat4 = f3;
    } 
    f1 = f2;
    f3 = f4;
    if (paramBoolean2) {
      f3 = f2;
      f1 = f4;
    } 
    float[] arrayOfFloat = tempVertices;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = paramFloat2;
    f4 = this.colorPacked;
    arrayOfFloat[2] = f4;
    arrayOfFloat[3] = paramFloat3;
    arrayOfFloat[4] = f3;
    arrayOfFloat[5] = paramFloat1;
    arrayOfFloat[6] = f6;
    arrayOfFloat[7] = f4;
    arrayOfFloat[8] = paramFloat3;
    arrayOfFloat[9] = f1;
    arrayOfFloat[10] = f5;
    arrayOfFloat[11] = f6;
    arrayOfFloat[12] = f4;
    arrayOfFloat[13] = paramFloat4;
    arrayOfFloat[14] = f1;
    if (this.mesh.getNumIndices() > 0) {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f5;
      arrayOfFloat[16] = paramFloat2;
      arrayOfFloat[17] = this.colorPacked;
      arrayOfFloat[18] = paramFloat4;
      arrayOfFloat[19] = f3;
      add(paramTexture, arrayOfFloat, 0, 20);
    } else {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f5;
      arrayOfFloat[16] = f6;
      f4 = this.colorPacked;
      arrayOfFloat[17] = f4;
      arrayOfFloat[18] = paramFloat4;
      arrayOfFloat[19] = f1;
      arrayOfFloat[20] = f5;
      arrayOfFloat[21] = paramFloat2;
      arrayOfFloat[22] = f4;
      arrayOfFloat[23] = paramFloat4;
      arrayOfFloat[24] = f3;
      arrayOfFloat[25] = paramFloat1;
      arrayOfFloat[26] = paramFloat2;
      arrayOfFloat[27] = f4;
      arrayOfFloat[28] = paramFloat3;
      arrayOfFloat[29] = f3;
      add(paramTexture, arrayOfFloat, 0, 30);
    } 
  }
  
  public void add(Texture paramTexture, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) {
    float f1 = paramInt1 + paramFloat1;
    float f2 = paramInt2 + paramFloat2;
    float[] arrayOfFloat = tempVertices;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = paramFloat2;
    arrayOfFloat[2] = paramFloat7;
    arrayOfFloat[3] = paramFloat3;
    arrayOfFloat[4] = paramFloat4;
    arrayOfFloat[5] = paramFloat1;
    arrayOfFloat[6] = f2;
    arrayOfFloat[7] = paramFloat7;
    arrayOfFloat[8] = paramFloat3;
    arrayOfFloat[9] = paramFloat6;
    arrayOfFloat[10] = f1;
    arrayOfFloat[11] = f2;
    arrayOfFloat[12] = paramFloat7;
    arrayOfFloat[13] = paramFloat5;
    arrayOfFloat[14] = paramFloat6;
    if (this.mesh.getNumIndices() > 0) {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f1;
      arrayOfFloat[16] = paramFloat2;
      arrayOfFloat[17] = paramFloat7;
      arrayOfFloat[18] = paramFloat5;
      arrayOfFloat[19] = paramFloat4;
      add(paramTexture, arrayOfFloat, 0, 20);
    } else {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f1;
      arrayOfFloat[16] = f2;
      arrayOfFloat[17] = paramFloat7;
      arrayOfFloat[18] = paramFloat5;
      arrayOfFloat[19] = paramFloat6;
      arrayOfFloat[20] = f1;
      arrayOfFloat[21] = paramFloat2;
      arrayOfFloat[22] = paramFloat7;
      arrayOfFloat[23] = paramFloat5;
      arrayOfFloat[24] = paramFloat4;
      arrayOfFloat[25] = paramFloat1;
      arrayOfFloat[26] = paramFloat2;
      arrayOfFloat[27] = paramFloat7;
      arrayOfFloat[28] = paramFloat3;
      arrayOfFloat[29] = paramFloat4;
      add(paramTexture, arrayOfFloat, 0, 30);
    } 
  }
  
  public void add(Texture paramTexture, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    float f1 = 1.0F / paramTexture.getWidth();
    float f2 = 1.0F / paramTexture.getHeight();
    float f3 = paramInt1 * f1;
    float f4 = (paramInt2 + paramInt4) * f2;
    f1 = (paramInt1 + paramInt3) * f1;
    float f5 = paramInt2 * f2;
    f2 = paramFloat1 + paramInt3;
    float f6 = paramFloat2 + paramInt4;
    float[] arrayOfFloat = tempVertices;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = paramFloat2;
    float f7 = this.colorPacked;
    arrayOfFloat[2] = f7;
    arrayOfFloat[3] = f3;
    arrayOfFloat[4] = f4;
    arrayOfFloat[5] = paramFloat1;
    arrayOfFloat[6] = f6;
    arrayOfFloat[7] = f7;
    arrayOfFloat[8] = f3;
    arrayOfFloat[9] = f5;
    arrayOfFloat[10] = f2;
    arrayOfFloat[11] = f6;
    arrayOfFloat[12] = f7;
    arrayOfFloat[13] = f1;
    arrayOfFloat[14] = f5;
    if (this.mesh.getNumIndices() > 0) {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f2;
      arrayOfFloat[16] = paramFloat2;
      arrayOfFloat[17] = this.colorPacked;
      arrayOfFloat[18] = f1;
      arrayOfFloat[19] = f4;
      add(paramTexture, arrayOfFloat, 0, 20);
    } else {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = f2;
      arrayOfFloat[16] = f6;
      f7 = this.colorPacked;
      arrayOfFloat[17] = f7;
      arrayOfFloat[18] = f1;
      arrayOfFloat[19] = f5;
      arrayOfFloat[20] = f2;
      arrayOfFloat[21] = paramFloat2;
      arrayOfFloat[22] = f7;
      arrayOfFloat[23] = f1;
      arrayOfFloat[24] = f4;
      arrayOfFloat[25] = paramFloat1;
      arrayOfFloat[26] = paramFloat2;
      arrayOfFloat[27] = f7;
      arrayOfFloat[28] = f3;
      arrayOfFloat[29] = f4;
      add(paramTexture, arrayOfFloat, 0, 30);
    } 
  }
  
  public void add(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (this.currentCache != null) {
      if (this.mesh.getNumIndices() > 0) {
        i = 4;
      } else {
        i = 6;
      } 
      int j = paramInt2 / i * 5 * 6;
      int i = this.textures.size - 1;
      if (i < 0 || this.textures.get(i) != paramTexture) {
        this.textures.add(paramTexture);
        this.counts.add(j);
      } else {
        this.counts.incr(i, j);
      } 
      this.mesh.getVerticesBuffer().put(paramArrayOfFloat, paramInt1, paramInt2);
      return;
    } 
    throw new IllegalStateException("beginCache must be called before add.");
  }
  
  public void add(Sprite paramSprite) {
    if (this.mesh.getNumIndices() > 0) {
      add(paramSprite.getTexture(), paramSprite.getVertices(), 0, 20);
      return;
    } 
    float[] arrayOfFloat = paramSprite.getVertices();
    System.arraycopy(arrayOfFloat, 0, tempVertices, 0, 15);
    System.arraycopy(arrayOfFloat, 10, tempVertices, 15, 5);
    System.arraycopy(arrayOfFloat, 15, tempVertices, 20, 5);
    System.arraycopy(arrayOfFloat, 0, tempVertices, 25, 5);
    add(paramSprite.getTexture(), tempVertices, 0, 30);
  }
  
  public void add(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2) { add(paramTextureRegion, paramFloat1, paramFloat2, paramTextureRegion.getRegionWidth(), paramTextureRegion.getRegionHeight()); }
  
  public void add(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    paramFloat3 = paramFloat1 + paramFloat3;
    float f1 = paramFloat2 + paramFloat4;
    float f2 = paramTextureRegion.u;
    float f3 = paramTextureRegion.v2;
    paramFloat4 = paramTextureRegion.u2;
    float f4 = paramTextureRegion.v;
    float[] arrayOfFloat = tempVertices;
    arrayOfFloat[0] = paramFloat1;
    arrayOfFloat[1] = paramFloat2;
    float f5 = this.colorPacked;
    arrayOfFloat[2] = f5;
    arrayOfFloat[3] = f2;
    arrayOfFloat[4] = f3;
    arrayOfFloat[5] = paramFloat1;
    arrayOfFloat[6] = f1;
    arrayOfFloat[7] = f5;
    arrayOfFloat[8] = f2;
    arrayOfFloat[9] = f4;
    arrayOfFloat[10] = paramFloat3;
    arrayOfFloat[11] = f1;
    arrayOfFloat[12] = f5;
    arrayOfFloat[13] = paramFloat4;
    arrayOfFloat[14] = f4;
    if (this.mesh.getNumIndices() > 0) {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = paramFloat3;
      arrayOfFloat[16] = paramFloat2;
      arrayOfFloat[17] = this.colorPacked;
      arrayOfFloat[18] = paramFloat4;
      arrayOfFloat[19] = f3;
      add(paramTextureRegion.texture, tempVertices, 0, 20);
    } else {
      arrayOfFloat = tempVertices;
      arrayOfFloat[15] = paramFloat3;
      arrayOfFloat[16] = f1;
      f5 = this.colorPacked;
      arrayOfFloat[17] = f5;
      arrayOfFloat[18] = paramFloat4;
      arrayOfFloat[19] = f4;
      arrayOfFloat[20] = paramFloat3;
      arrayOfFloat[21] = paramFloat2;
      arrayOfFloat[22] = f5;
      arrayOfFloat[23] = paramFloat4;
      arrayOfFloat[24] = f3;
      arrayOfFloat[25] = paramFloat1;
      arrayOfFloat[26] = paramFloat2;
      arrayOfFloat[27] = f5;
      arrayOfFloat[28] = f2;
      arrayOfFloat[29] = f3;
      add(paramTextureRegion.texture, tempVertices, 0, 30);
    } 
  }
  
  public void add(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { // Byte code:
    //   0: fload_2
    //   1: fload #4
    //   3: fadd
    //   4: fstore #11
    //   6: fload_3
    //   7: fload #5
    //   9: fadd
    //   10: fstore #12
    //   12: fload #4
    //   14: fneg
    //   15: fstore #13
    //   17: fload #5
    //   19: fneg
    //   20: fstore #14
    //   22: fload #6
    //   24: fload #4
    //   26: fsub
    //   27: fstore #6
    //   29: fload #7
    //   31: fload #5
    //   33: fsub
    //   34: fstore #7
    //   36: fload #8
    //   38: fconst_1
    //   39: fcmpl
    //   40: ifne -> 64
    //   43: fload #6
    //   45: fstore #5
    //   47: fload #7
    //   49: fstore_2
    //   50: fload #13
    //   52: fstore #4
    //   54: fload #14
    //   56: fstore_3
    //   57: fload #9
    //   59: fconst_1
    //   60: fcmpl
    //   61: ifeq -> 90
    //   64: fload #13
    //   66: fload #8
    //   68: fmul
    //   69: fstore #4
    //   71: fload #14
    //   73: fload #9
    //   75: fmul
    //   76: fstore_3
    //   77: fload #6
    //   79: fload #8
    //   81: fmul
    //   82: fstore #5
    //   84: fload #7
    //   86: fload #9
    //   88: fmul
    //   89: fstore_2
    //   90: fload #10
    //   92: fconst_0
    //   93: fcmpl
    //   94: ifeq -> 224
    //   97: fload #10
    //   99: invokestatic cosDeg : (F)F
    //   102: fstore #8
    //   104: fload #10
    //   106: invokestatic sinDeg : (F)F
    //   109: fstore #10
    //   111: fload #8
    //   113: fload #4
    //   115: fmul
    //   116: fstore #6
    //   118: fload #6
    //   120: fload #10
    //   122: fload_3
    //   123: fmul
    //   124: fsub
    //   125: fstore #7
    //   127: fload #4
    //   129: fload #10
    //   131: fmul
    //   132: fstore #4
    //   134: fload_3
    //   135: fload #8
    //   137: fmul
    //   138: fload #4
    //   140: fadd
    //   141: fstore #9
    //   143: fload #10
    //   145: fload_2
    //   146: fmul
    //   147: fstore_3
    //   148: fload #6
    //   150: fload_3
    //   151: fsub
    //   152: fstore #6
    //   154: fload_2
    //   155: fload #8
    //   157: fmul
    //   158: fstore_2
    //   159: fload #4
    //   161: fload_2
    //   162: fadd
    //   163: fstore #14
    //   165: fload #8
    //   167: fload #5
    //   169: fmul
    //   170: fload_3
    //   171: fsub
    //   172: fstore #8
    //   174: fload_2
    //   175: fload #10
    //   177: fload #5
    //   179: fmul
    //   180: fadd
    //   181: fstore #5
    //   183: fload #8
    //   185: fload #6
    //   187: fsub
    //   188: fload #7
    //   190: fadd
    //   191: fstore #10
    //   193: fload #5
    //   195: fstore_3
    //   196: fload #14
    //   198: fstore_2
    //   199: fload #7
    //   201: fstore #4
    //   203: fload #5
    //   205: fload #14
    //   207: fload #9
    //   209: fsub
    //   210: fsub
    //   211: fstore #7
    //   213: fload #8
    //   215: fstore #5
    //   217: fload #10
    //   219: fstore #8
    //   221: goto -> 244
    //   224: fload #5
    //   226: fstore #8
    //   228: fload_2
    //   229: fstore #10
    //   231: fload #4
    //   233: fstore #6
    //   235: fload_3
    //   236: fstore #7
    //   238: fload_3
    //   239: fstore #9
    //   241: fload #10
    //   243: fstore_3
    //   244: fload #4
    //   246: fload #11
    //   248: fadd
    //   249: fstore #4
    //   251: fload #9
    //   253: fload #12
    //   255: fadd
    //   256: fstore #9
    //   258: fload #5
    //   260: fload #11
    //   262: fadd
    //   263: fstore #5
    //   265: fload_3
    //   266: fload #12
    //   268: fadd
    //   269: fstore_3
    //   270: fload #8
    //   272: fload #11
    //   274: fadd
    //   275: fstore #8
    //   277: fload #7
    //   279: fload #12
    //   281: fadd
    //   282: fstore #7
    //   284: aload_1
    //   285: getfield u : F
    //   288: fstore #15
    //   290: aload_1
    //   291: getfield v2 : F
    //   294: fstore #13
    //   296: aload_1
    //   297: getfield u2 : F
    //   300: fstore #10
    //   302: aload_1
    //   303: getfield v : F
    //   306: fstore #14
    //   308: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   311: astore #16
    //   313: aload #16
    //   315: iconst_0
    //   316: fload #4
    //   318: fastore
    //   319: aload #16
    //   321: iconst_1
    //   322: fload #9
    //   324: fastore
    //   325: aload_0
    //   326: getfield colorPacked : F
    //   329: fstore #17
    //   331: aload #16
    //   333: iconst_2
    //   334: fload #17
    //   336: fastore
    //   337: aload #16
    //   339: iconst_3
    //   340: fload #15
    //   342: fastore
    //   343: aload #16
    //   345: iconst_4
    //   346: fload #13
    //   348: fastore
    //   349: aload #16
    //   351: iconst_5
    //   352: fload #6
    //   354: fload #11
    //   356: fadd
    //   357: fastore
    //   358: aload #16
    //   360: bipush #6
    //   362: fload_2
    //   363: fload #12
    //   365: fadd
    //   366: fastore
    //   367: aload #16
    //   369: bipush #7
    //   371: fload #17
    //   373: fastore
    //   374: aload #16
    //   376: bipush #8
    //   378: fload #15
    //   380: fastore
    //   381: aload #16
    //   383: bipush #9
    //   385: fload #14
    //   387: fastore
    //   388: aload #16
    //   390: bipush #10
    //   392: fload #5
    //   394: fastore
    //   395: aload #16
    //   397: bipush #11
    //   399: fload_3
    //   400: fastore
    //   401: aload #16
    //   403: bipush #12
    //   405: fload #17
    //   407: fastore
    //   408: aload #16
    //   410: bipush #13
    //   412: fload #10
    //   414: fastore
    //   415: aload #16
    //   417: bipush #14
    //   419: fload #14
    //   421: fastore
    //   422: aload_0
    //   423: getfield mesh : Lcom/badlogic/gdx/graphics/Mesh;
    //   426: invokevirtual getNumIndices : ()I
    //   429: ifle -> 491
    //   432: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   435: astore #16
    //   437: aload #16
    //   439: bipush #15
    //   441: fload #8
    //   443: fastore
    //   444: aload #16
    //   446: bipush #16
    //   448: fload #7
    //   450: fastore
    //   451: aload #16
    //   453: bipush #17
    //   455: aload_0
    //   456: getfield colorPacked : F
    //   459: fastore
    //   460: aload #16
    //   462: bipush #18
    //   464: fload #10
    //   466: fastore
    //   467: aload #16
    //   469: bipush #19
    //   471: fload #13
    //   473: fastore
    //   474: aload_0
    //   475: aload_1
    //   476: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   479: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   482: iconst_0
    //   483: bipush #20
    //   485: invokevirtual add : (Lcom/badlogic/gdx/graphics/Texture;[FII)V
    //   488: goto -> 616
    //   491: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   494: astore #16
    //   496: aload #16
    //   498: bipush #15
    //   500: fload #5
    //   502: fastore
    //   503: aload #16
    //   505: bipush #16
    //   507: fload_3
    //   508: fastore
    //   509: aload_0
    //   510: getfield colorPacked : F
    //   513: fstore_2
    //   514: aload #16
    //   516: bipush #17
    //   518: fload_2
    //   519: fastore
    //   520: aload #16
    //   522: bipush #18
    //   524: fload #10
    //   526: fastore
    //   527: aload #16
    //   529: bipush #19
    //   531: fload #14
    //   533: fastore
    //   534: aload #16
    //   536: bipush #20
    //   538: fload #8
    //   540: fastore
    //   541: aload #16
    //   543: bipush #21
    //   545: fload #7
    //   547: fastore
    //   548: aload #16
    //   550: bipush #22
    //   552: fload_2
    //   553: fastore
    //   554: aload #16
    //   556: bipush #23
    //   558: fload #10
    //   560: fastore
    //   561: aload #16
    //   563: bipush #24
    //   565: fload #13
    //   567: fastore
    //   568: aload #16
    //   570: bipush #25
    //   572: fload #4
    //   574: fastore
    //   575: aload #16
    //   577: bipush #26
    //   579: fload #9
    //   581: fastore
    //   582: aload #16
    //   584: bipush #27
    //   586: fload_2
    //   587: fastore
    //   588: aload #16
    //   590: bipush #28
    //   592: fload #15
    //   594: fastore
    //   595: aload #16
    //   597: bipush #29
    //   599: fload #13
    //   601: fastore
    //   602: aload_0
    //   603: aload_1
    //   604: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   607: getstatic com/badlogic/gdx/graphics/g2d/SpriteCache.tempVertices : [F
    //   610: iconst_0
    //   611: bipush #30
    //   613: invokevirtual add : (Lcom/badlogic/gdx/graphics/Texture;[FII)V
    //   616: return }
  
  public void begin() {
    if (!this.drawing) {
      if (this.currentCache == null) {
        this.renderCalls = 0;
        this.combinedMatrix.set(this.projectionMatrix).mul(this.transformMatrix);
        Gdx.gl20.glDepthMask(false);
        ShaderProgram shaderProgram = this.customShader;
        if (shaderProgram != null) {
          shaderProgram.begin();
          this.customShader.setUniformMatrix("u_proj", this.projectionMatrix);
          this.customShader.setUniformMatrix("u_trans", this.transformMatrix);
          this.customShader.setUniformMatrix("u_projTrans", this.combinedMatrix);
          this.customShader.setUniformi("u_texture", 0);
          this.mesh.bind(this.customShader);
        } else {
          this.shader.begin();
          this.shader.setUniformMatrix("u_projectionViewMatrix", this.combinedMatrix);
          this.shader.setUniformi("u_texture", 0);
          this.mesh.bind(this.shader);
        } 
        this.drawing = true;
        return;
      } 
      throw new IllegalStateException("endCache must be called before begin");
    } 
    throw new IllegalStateException("end must be called before begin.");
  }
  
  public void beginCache() {
    if (!this.drawing) {
      if (this.currentCache == null) {
        this.mesh.getNumIndices();
        this.currentCache = new Cache(this.caches.size, this.mesh.getVerticesBuffer().limit());
        this.caches.add(this.currentCache);
        this.mesh.getVerticesBuffer().compact();
        return;
      } 
      throw new IllegalStateException("endCache must be called before begin.");
    } 
    throw new IllegalStateException("end must be called before beginCache");
  }
  
  public void beginCache(int paramInt) {
    if (!this.drawing) {
      if (this.currentCache == null) {
        if (paramInt == this.caches.size - 1) {
          Cache cache = (Cache)this.caches.removeIndex(paramInt);
          this.mesh.getVerticesBuffer().limit(cache.offset);
          beginCache();
          return;
        } 
        this.currentCache = (Cache)this.caches.get(paramInt);
        this.mesh.getVerticesBuffer().position(this.currentCache.offset);
        return;
      } 
      throw new IllegalStateException("endCache must be called before begin.");
    } 
    throw new IllegalStateException("end must be called before beginCache");
  }
  
  public void clear() {
    this.caches.clear();
    this.mesh.getVerticesBuffer().clear().flip();
  }
  
  public void dispose() {
    this.mesh.dispose();
    ShaderProgram shaderProgram = this.shader;
    if (shaderProgram != null)
      shaderProgram.dispose(); 
  }
  
  public void draw(int paramInt) {
    if (this.drawing) {
      Cache cache = (Cache)this.caches.get(paramInt);
      if (this.mesh.getNumIndices() > 0) {
        paramInt = 4;
      } else {
        paramInt = 6;
      } 
      int i = cache.offset / paramInt * 5 * 6;
      Texture[] arrayOfTexture = cache.textures;
      int[] arrayOfInt = cache.counts;
      int j = cache.textureCount;
      for (paramInt = 0; paramInt < j; paramInt++) {
        int k = arrayOfInt[paramInt];
        arrayOfTexture[paramInt].bind();
        ShaderProgram shaderProgram = this.customShader;
        if (shaderProgram != null) {
          this.mesh.render(shaderProgram, 4, i, k);
        } else {
          this.mesh.render(this.shader, 4, i, k);
        } 
        i += k;
      } 
      this.renderCalls += j;
      this.totalRenderCalls += j;
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("SpriteCache.begin must be called before draw.");
    throw illegalStateException;
  }
  
  public void draw(int paramInt1, int paramInt2, int paramInt3) {
    if (this.drawing) {
      Cache cache = (Cache)this.caches.get(paramInt1);
      int i = paramInt2 * 6 + cache.offset;
      paramInt1 = paramInt3 * 6;
      Texture[] arrayOfTexture = cache.textures;
      int[] arrayOfInt = cache.counts;
      int j = cache.textureCount;
      paramInt2 = 0;
      while (paramInt2 < j) {
        arrayOfTexture[paramInt2].bind();
        int k = arrayOfInt[paramInt2];
        if (k > paramInt1) {
          paramInt3 = paramInt1;
          paramInt2 = j;
        } else {
          paramInt3 = paramInt1 - k;
          paramInt1 = k;
        } 
        ShaderProgram shaderProgram = this.customShader;
        if (shaderProgram != null) {
          this.mesh.render(shaderProgram, 4, i, paramInt1);
        } else {
          this.mesh.render(this.shader, 4, i, paramInt1);
        } 
        i += paramInt1;
        paramInt2++;
        paramInt1 = paramInt3;
      } 
      this.renderCalls += cache.textureCount;
      this.totalRenderCalls += j;
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("SpriteCache.begin must be called before draw.");
    throw illegalStateException;
  }
  
  public void end() {
    if (this.drawing) {
      this.drawing = false;
      this.shader.end();
      Gdx.gl20.glDepthMask(true);
      ShaderProgram shaderProgram = this.customShader;
      if (shaderProgram != null) {
        this.mesh.unbind(shaderProgram);
      } else {
        this.mesh.unbind(this.shader);
      } 
      return;
    } 
    throw new IllegalStateException("begin must be called before end.");
  }
  
  public int endCache() {
    Cache cache = this.currentCache;
    if (cache != null) {
      int i = this.mesh.getVerticesBuffer().position() - cache.offset;
      Texture[] arrayOfTexture = cache.textures;
      byte b = 0;
      if (arrayOfTexture == null) {
        cache.maxCount = i;
        cache.textureCount = this.textures.size;
        cache.textures = (Texture[])this.textures.toArray(Texture.class);
        cache.counts = new int[cache.textureCount];
        i = this.counts.size;
        while (b < i) {
          cache.counts[b] = this.counts.get(b);
          b++;
        } 
        this.mesh.getVerticesBuffer().flip();
      } else {
        if (i <= cache.maxCount) {
          cache.textureCount = this.textures.size;
          if (cache.textures.length < cache.textureCount)
            cache.textures = new Texture[cache.textureCount]; 
          i = cache.textureCount;
          for (b = 0; b < i; b++)
            cache.textures[b] = (Texture)this.textures.get(b); 
          if (cache.counts.length < cache.textureCount)
            cache.counts = new int[cache.textureCount]; 
          i = cache.textureCount;
          for (b = 0; b < i; b++)
            cache.counts[b] = this.counts.get(b); 
          FloatBuffer floatBuffer = this.mesh.getVerticesBuffer();
          floatBuffer.position(0);
          Array array = this.caches;
          Cache cache1 = (Cache)array.get(array.size - 1);
          floatBuffer.limit(cache1.offset + cache1.maxCount);
          this.currentCache = null;
          this.textures.clear();
          this.counts.clear();
          return cache.id;
        } 
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("If a cache is not the last created, it cannot be redefined with more entries than when it was first created: ");
        stringBuilder.append(i);
        stringBuilder.append(" (");
        stringBuilder.append(cache.maxCount);
        stringBuilder.append(" max)");
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
      this.currentCache = null;
      this.textures.clear();
      this.counts.clear();
      return cache.id;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("beginCache must be called before endCache.");
    throw illegalStateException;
  }
  
  public Color getColor() { return this.color; }
  
  public ShaderProgram getCustomShader() { return this.customShader; }
  
  public float getPackedColor() { return this.colorPacked; }
  
  public Matrix4 getProjectionMatrix() { return this.projectionMatrix; }
  
  public Matrix4 getTransformMatrix() { return this.transformMatrix; }
  
  public boolean isDrawing() { return this.drawing; }
  
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
    if (!this.drawing) {
      this.projectionMatrix.set(paramMatrix4);
      return;
    } 
    throw new IllegalStateException("Can't set the matrix within begin/end.");
  }
  
  public void setShader(ShaderProgram paramShaderProgram) { this.customShader = paramShaderProgram; }
  
  public void setTransformMatrix(Matrix4 paramMatrix4) {
    if (!this.drawing) {
      this.transformMatrix.set(paramMatrix4);
      return;
    } 
    throw new IllegalStateException("Can't set the matrix within begin/end.");
  }
  
  private static class Cache {
    int[] counts;
    
    final int id;
    
    int maxCount;
    
    final int offset;
    
    int textureCount;
    
    Texture[] textures;
    
    public Cache(int param1Int1, int param1Int2) {
      this.id = param1Int1;
      this.offset = param1Int2;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/SpriteCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */