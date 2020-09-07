package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Affine2;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class CpuSpriteBatch extends SpriteBatch {
  private final Affine2 adjustAffine = new Affine2();
  
  private boolean adjustNeeded;
  
  private boolean haveIdentityRealMatrix = true;
  
  private final Affine2 tmpAffine = new Affine2();
  
  private final Matrix4 virtualMatrix = new Matrix4();
  
  public CpuSpriteBatch() { this(1000); }
  
  public CpuSpriteBatch(int paramInt) { this(paramInt, null); }
  
  public CpuSpriteBatch(int paramInt, ShaderProgram paramShaderProgram) { super(paramInt, paramShaderProgram); }
  
  private static boolean checkEqual(Matrix4 paramMatrix4, Affine2 paramAffine2) {
    float[] arrayOfFloat = paramMatrix4.getValues();
    byte b = 0;
    int i = b;
    if (arrayOfFloat[0] == paramAffine2.m00) {
      i = b;
      if (arrayOfFloat[1] == paramAffine2.m10) {
        i = b;
        if (arrayOfFloat[4] == paramAffine2.m01) {
          i = b;
          if (arrayOfFloat[5] == paramAffine2.m11) {
            i = b;
            if (arrayOfFloat[12] == paramAffine2.m02) {
              i = b;
              if (arrayOfFloat[13] == paramAffine2.m12)
                i = 1; 
            } 
          } 
        } 
      } 
    } 
    return i;
  }
  
  private static boolean checkEqual(Matrix4 paramMatrix41, Matrix4 paramMatrix42) {
    boolean bool = true;
    if (paramMatrix41 == paramMatrix42)
      return true; 
    if (paramMatrix41.val[0] != paramMatrix42.val[0] || paramMatrix41.val[1] != paramMatrix42.val[1] || paramMatrix41.val[4] != paramMatrix42.val[4] || paramMatrix41.val[5] != paramMatrix42.val[5] || paramMatrix41.val[12] != paramMatrix42.val[12] || paramMatrix41.val[13] != paramMatrix42.val[13])
      bool = false; 
    return bool;
  }
  
  private static boolean checkIdt(Matrix4 paramMatrix4) {
    float[] arrayOfFloat = paramMatrix4.getValues();
    byte b = 0;
    int i = b;
    if (arrayOfFloat[0] == 1.0F) {
      i = b;
      if (arrayOfFloat[1] == 0.0F) {
        i = b;
        if (arrayOfFloat[4] == 0.0F) {
          i = b;
          if (arrayOfFloat[5] == 1.0F) {
            i = b;
            if (arrayOfFloat[12] == 0.0F) {
              i = b;
              if (arrayOfFloat[13] == 0.0F)
                i = 1; 
            } 
          } 
        } 
      } 
    } 
    return i;
  }
  
  private void drawAdjusted(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) {
    float f1 = 1.0F / paramTexture.getWidth();
    float f2 = 1.0F / paramTexture.getHeight();
    drawAdjustedUV(paramTexture, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramInt1 * f1, (paramInt2 + paramInt4) * f2, f1 * (paramInt1 + paramInt3), f2 * paramInt2, paramBoolean1, paramBoolean2);
  }
  
  private void drawAdjusted(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (this.drawing) {
      if (paramTexture != this.lastTexture)
        switchTexture(paramTexture); 
      Affine2 affine2 = this.adjustAffine;
      int i = Math.min(this.vertices.length - this.idx, paramInt2);
      int j = paramInt1;
      paramInt1 = i;
      do {
        i = paramInt2 - paramInt1;
        paramInt2 = j;
        while (paramInt1 > 0) {
          float f1 = paramArrayOfFloat[paramInt2];
          float f2 = paramArrayOfFloat[paramInt2 + 1];
          this.vertices[this.idx] = affine2.m00 * f1 + affine2.m01 * f2 + affine2.m02;
          this.vertices[this.idx + 1] = affine2.m10 * f1 + affine2.m11 * f2 + affine2.m12;
          this.vertices[this.idx + 2] = paramArrayOfFloat[paramInt2 + 2];
          this.vertices[this.idx + 3] = paramArrayOfFloat[paramInt2 + 3];
          this.vertices[this.idx + 4] = paramArrayOfFloat[paramInt2 + 4];
          this.idx += 5;
          paramInt2 += 5;
          paramInt1 -= 5;
        } 
        if (i > 0) {
          flush();
          paramInt1 = Math.min(this.vertices.length, i);
        } 
        j = paramInt2;
        paramInt2 = i;
      } while (i > 0);
      return;
    } 
    IllegalStateException illegalStateException = new IllegalStateException("CpuSpriteBatch.begin must be called before draw.");
    throw illegalStateException;
  }
  
  private void drawAdjusted(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { drawAdjustedUV(paramTextureRegion.texture, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramTextureRegion.u, paramTextureRegion.v2, paramTextureRegion.u2, paramTextureRegion.v, false, false); }
  
  private void drawAdjusted(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, boolean paramBoolean) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 886
    //   7: aload_1
    //   8: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   11: aload_0
    //   12: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   15: if_acmpeq -> 29
    //   18: aload_0
    //   19: aload_1
    //   20: getfield texture : Lcom/badlogic/gdx/graphics/Texture;
    //   23: invokevirtual switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   26: goto -> 45
    //   29: aload_0
    //   30: getfield idx : I
    //   33: aload_0
    //   34: getfield vertices : [F
    //   37: arraylength
    //   38: if_icmpne -> 45
    //   41: aload_0
    //   42: invokespecial flush : ()V
    //   45: fload_2
    //   46: fload #4
    //   48: fadd
    //   49: fstore #12
    //   51: fload_3
    //   52: fload #5
    //   54: fadd
    //   55: fstore #13
    //   57: fload #4
    //   59: fneg
    //   60: fstore #14
    //   62: fload #5
    //   64: fneg
    //   65: fstore #15
    //   67: fload #6
    //   69: fload #4
    //   71: fsub
    //   72: fstore #6
    //   74: fload #7
    //   76: fload #5
    //   78: fsub
    //   79: fstore #7
    //   81: fload #8
    //   83: fconst_1
    //   84: fcmpl
    //   85: ifne -> 109
    //   88: fload #6
    //   90: fstore #5
    //   92: fload #7
    //   94: fstore_2
    //   95: fload #14
    //   97: fstore #4
    //   99: fload #15
    //   101: fstore_3
    //   102: fload #9
    //   104: fconst_1
    //   105: fcmpl
    //   106: ifeq -> 135
    //   109: fload #14
    //   111: fload #8
    //   113: fmul
    //   114: fstore #4
    //   116: fload #15
    //   118: fload #9
    //   120: fmul
    //   121: fstore_3
    //   122: fload #6
    //   124: fload #8
    //   126: fmul
    //   127: fstore #5
    //   129: fload #7
    //   131: fload #9
    //   133: fmul
    //   134: fstore_2
    //   135: fload #10
    //   137: fconst_0
    //   138: fcmpl
    //   139: ifeq -> 269
    //   142: fload #10
    //   144: invokestatic cosDeg : (F)F
    //   147: fstore #7
    //   149: fload #10
    //   151: invokestatic sinDeg : (F)F
    //   154: fstore #10
    //   156: fload #7
    //   158: fload #4
    //   160: fmul
    //   161: fstore #8
    //   163: fload #8
    //   165: fload #10
    //   167: fload_3
    //   168: fmul
    //   169: fsub
    //   170: fstore #6
    //   172: fload #4
    //   174: fload #10
    //   176: fmul
    //   177: fstore #4
    //   179: fload_3
    //   180: fload #7
    //   182: fmul
    //   183: fload #4
    //   185: fadd
    //   186: fstore #9
    //   188: fload #10
    //   190: fload_2
    //   191: fmul
    //   192: fstore_3
    //   193: fload #8
    //   195: fload_3
    //   196: fsub
    //   197: fstore #8
    //   199: fload_2
    //   200: fload #7
    //   202: fmul
    //   203: fstore_2
    //   204: fload #4
    //   206: fload_2
    //   207: fadd
    //   208: fstore #15
    //   210: fload #7
    //   212: fload #5
    //   214: fmul
    //   215: fload_3
    //   216: fsub
    //   217: fstore #7
    //   219: fload_2
    //   220: fload #10
    //   222: fload #5
    //   224: fmul
    //   225: fadd
    //   226: fstore #5
    //   228: fload #7
    //   230: fload #8
    //   232: fsub
    //   233: fload #6
    //   235: fadd
    //   236: fstore #10
    //   238: fload #5
    //   240: fstore_2
    //   241: fload #15
    //   243: fstore_3
    //   244: fload #6
    //   246: fstore #4
    //   248: fload #5
    //   250: fload #15
    //   252: fload #9
    //   254: fsub
    //   255: fsub
    //   256: fstore #6
    //   258: fload #7
    //   260: fstore #5
    //   262: fload #10
    //   264: fstore #7
    //   266: goto -> 291
    //   269: fload #5
    //   271: fstore #7
    //   273: fload_2
    //   274: fstore #10
    //   276: fload #4
    //   278: fstore #8
    //   280: fload_3
    //   281: fstore #6
    //   283: fload_3
    //   284: fstore #9
    //   286: fload_2
    //   287: fstore_3
    //   288: fload #10
    //   290: fstore_2
    //   291: fload #4
    //   293: fload #12
    //   295: fadd
    //   296: fstore #10
    //   298: fload #9
    //   300: fload #13
    //   302: fadd
    //   303: fstore #15
    //   305: fload #8
    //   307: fload #12
    //   309: fadd
    //   310: fstore #14
    //   312: fload_3
    //   313: fload #13
    //   315: fadd
    //   316: fstore #16
    //   318: fload #5
    //   320: fload #12
    //   322: fadd
    //   323: fstore #17
    //   325: fload_2
    //   326: fload #13
    //   328: fadd
    //   329: fstore #18
    //   331: fload #7
    //   333: fload #12
    //   335: fadd
    //   336: fstore #12
    //   338: fload #6
    //   340: fload #13
    //   342: fadd
    //   343: fstore #13
    //   345: iload #11
    //   347: ifeq -> 399
    //   350: aload_1
    //   351: getfield u2 : F
    //   354: fstore #6
    //   356: aload_1
    //   357: getfield v2 : F
    //   360: fstore_2
    //   361: aload_1
    //   362: getfield u : F
    //   365: fstore #9
    //   367: aload_1
    //   368: getfield v2 : F
    //   371: fstore #4
    //   373: aload_1
    //   374: getfield u : F
    //   377: fstore #8
    //   379: aload_1
    //   380: getfield v : F
    //   383: fstore_3
    //   384: aload_1
    //   385: getfield u2 : F
    //   388: fstore #7
    //   390: aload_1
    //   391: getfield v : F
    //   394: fstore #5
    //   396: goto -> 445
    //   399: aload_1
    //   400: getfield u : F
    //   403: fstore #6
    //   405: aload_1
    //   406: getfield v : F
    //   409: fstore_2
    //   410: aload_1
    //   411: getfield u2 : F
    //   414: fstore #9
    //   416: aload_1
    //   417: getfield v : F
    //   420: fstore #4
    //   422: aload_1
    //   423: getfield u2 : F
    //   426: fstore #8
    //   428: aload_1
    //   429: getfield v2 : F
    //   432: fstore_3
    //   433: aload_1
    //   434: getfield u : F
    //   437: fstore #7
    //   439: aload_1
    //   440: getfield v2 : F
    //   443: fstore #5
    //   445: aload_0
    //   446: getfield adjustAffine : Lcom/badlogic/gdx/math/Affine2;
    //   449: astore_1
    //   450: aload_0
    //   451: getfield vertices : [F
    //   454: aload_0
    //   455: getfield idx : I
    //   458: iconst_0
    //   459: iadd
    //   460: aload_1
    //   461: getfield m00 : F
    //   464: fload #10
    //   466: fmul
    //   467: aload_1
    //   468: getfield m01 : F
    //   471: fload #15
    //   473: fmul
    //   474: fadd
    //   475: aload_1
    //   476: getfield m02 : F
    //   479: fadd
    //   480: fastore
    //   481: aload_0
    //   482: getfield vertices : [F
    //   485: aload_0
    //   486: getfield idx : I
    //   489: iconst_1
    //   490: iadd
    //   491: aload_1
    //   492: getfield m10 : F
    //   495: fload #10
    //   497: fmul
    //   498: aload_1
    //   499: getfield m11 : F
    //   502: fload #15
    //   504: fmul
    //   505: fadd
    //   506: aload_1
    //   507: getfield m12 : F
    //   510: fadd
    //   511: fastore
    //   512: aload_0
    //   513: getfield vertices : [F
    //   516: aload_0
    //   517: getfield idx : I
    //   520: iconst_2
    //   521: iadd
    //   522: aload_0
    //   523: getfield colorPacked : F
    //   526: fastore
    //   527: aload_0
    //   528: getfield vertices : [F
    //   531: aload_0
    //   532: getfield idx : I
    //   535: iconst_3
    //   536: iadd
    //   537: fload #6
    //   539: fastore
    //   540: aload_0
    //   541: getfield vertices : [F
    //   544: aload_0
    //   545: getfield idx : I
    //   548: iconst_4
    //   549: iadd
    //   550: fload_2
    //   551: fastore
    //   552: aload_0
    //   553: getfield vertices : [F
    //   556: aload_0
    //   557: getfield idx : I
    //   560: iconst_5
    //   561: iadd
    //   562: aload_1
    //   563: getfield m00 : F
    //   566: fload #14
    //   568: fmul
    //   569: aload_1
    //   570: getfield m01 : F
    //   573: fload #16
    //   575: fmul
    //   576: fadd
    //   577: aload_1
    //   578: getfield m02 : F
    //   581: fadd
    //   582: fastore
    //   583: aload_0
    //   584: getfield vertices : [F
    //   587: aload_0
    //   588: getfield idx : I
    //   591: bipush #6
    //   593: iadd
    //   594: aload_1
    //   595: getfield m10 : F
    //   598: fload #14
    //   600: fmul
    //   601: aload_1
    //   602: getfield m11 : F
    //   605: fload #16
    //   607: fmul
    //   608: fadd
    //   609: aload_1
    //   610: getfield m12 : F
    //   613: fadd
    //   614: fastore
    //   615: aload_0
    //   616: getfield vertices : [F
    //   619: aload_0
    //   620: getfield idx : I
    //   623: bipush #7
    //   625: iadd
    //   626: aload_0
    //   627: getfield colorPacked : F
    //   630: fastore
    //   631: aload_0
    //   632: getfield vertices : [F
    //   635: aload_0
    //   636: getfield idx : I
    //   639: bipush #8
    //   641: iadd
    //   642: fload #9
    //   644: fastore
    //   645: aload_0
    //   646: getfield vertices : [F
    //   649: aload_0
    //   650: getfield idx : I
    //   653: bipush #9
    //   655: iadd
    //   656: fload #4
    //   658: fastore
    //   659: aload_0
    //   660: getfield vertices : [F
    //   663: aload_0
    //   664: getfield idx : I
    //   667: bipush #10
    //   669: iadd
    //   670: aload_1
    //   671: getfield m00 : F
    //   674: fload #17
    //   676: fmul
    //   677: aload_1
    //   678: getfield m01 : F
    //   681: fload #18
    //   683: fmul
    //   684: fadd
    //   685: aload_1
    //   686: getfield m02 : F
    //   689: fadd
    //   690: fastore
    //   691: aload_0
    //   692: getfield vertices : [F
    //   695: aload_0
    //   696: getfield idx : I
    //   699: bipush #11
    //   701: iadd
    //   702: aload_1
    //   703: getfield m10 : F
    //   706: fload #17
    //   708: fmul
    //   709: aload_1
    //   710: getfield m11 : F
    //   713: fload #18
    //   715: fmul
    //   716: fadd
    //   717: aload_1
    //   718: getfield m12 : F
    //   721: fadd
    //   722: fastore
    //   723: aload_0
    //   724: getfield vertices : [F
    //   727: aload_0
    //   728: getfield idx : I
    //   731: bipush #12
    //   733: iadd
    //   734: aload_0
    //   735: getfield colorPacked : F
    //   738: fastore
    //   739: aload_0
    //   740: getfield vertices : [F
    //   743: aload_0
    //   744: getfield idx : I
    //   747: bipush #13
    //   749: iadd
    //   750: fload #8
    //   752: fastore
    //   753: aload_0
    //   754: getfield vertices : [F
    //   757: aload_0
    //   758: getfield idx : I
    //   761: bipush #14
    //   763: iadd
    //   764: fload_3
    //   765: fastore
    //   766: aload_0
    //   767: getfield vertices : [F
    //   770: aload_0
    //   771: getfield idx : I
    //   774: bipush #15
    //   776: iadd
    //   777: aload_1
    //   778: getfield m00 : F
    //   781: fload #12
    //   783: fmul
    //   784: aload_1
    //   785: getfield m01 : F
    //   788: fload #13
    //   790: fmul
    //   791: fadd
    //   792: aload_1
    //   793: getfield m02 : F
    //   796: fadd
    //   797: fastore
    //   798: aload_0
    //   799: getfield vertices : [F
    //   802: aload_0
    //   803: getfield idx : I
    //   806: bipush #16
    //   808: iadd
    //   809: aload_1
    //   810: getfield m10 : F
    //   813: fload #12
    //   815: fmul
    //   816: aload_1
    //   817: getfield m11 : F
    //   820: fload #13
    //   822: fmul
    //   823: fadd
    //   824: aload_1
    //   825: getfield m12 : F
    //   828: fadd
    //   829: fastore
    //   830: aload_0
    //   831: getfield vertices : [F
    //   834: aload_0
    //   835: getfield idx : I
    //   838: bipush #17
    //   840: iadd
    //   841: aload_0
    //   842: getfield colorPacked : F
    //   845: fastore
    //   846: aload_0
    //   847: getfield vertices : [F
    //   850: aload_0
    //   851: getfield idx : I
    //   854: bipush #18
    //   856: iadd
    //   857: fload #7
    //   859: fastore
    //   860: aload_0
    //   861: getfield vertices : [F
    //   864: aload_0
    //   865: getfield idx : I
    //   868: bipush #19
    //   870: iadd
    //   871: fload #5
    //   873: fastore
    //   874: aload_0
    //   875: aload_0
    //   876: getfield idx : I
    //   879: bipush #20
    //   881: iadd
    //   882: putfield idx : I
    //   885: return
    //   886: new java/lang/IllegalStateException
    //   889: dup
    //   890: ldc 'CpuSpriteBatch.begin must be called before draw.'
    //   892: invokespecial <init> : (Ljava/lang/String;)V
    //   895: athrow }
  
  private void drawAdjusted(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, Affine2 paramAffine2) {
    if (this.drawing) {
      if (paramTextureRegion.texture != this.lastTexture) {
        switchTexture(paramTextureRegion.texture);
      } else if (this.idx == this.vertices.length) {
        flush();
      } 
      float f1 = paramAffine2.m02;
      float f2 = paramAffine2.m12;
      float f3 = paramAffine2.m01 * paramFloat2 + paramAffine2.m02;
      float f4 = paramAffine2.m11 * paramFloat2 + paramAffine2.m12;
      float f5 = paramAffine2.m00 * paramFloat1 + paramAffine2.m01 * paramFloat2 + paramAffine2.m02;
      float f6 = paramAffine2.m10 * paramFloat1 + paramAffine2.m11 * paramFloat2 + paramAffine2.m12;
      paramFloat2 = paramAffine2.m00 * paramFloat1 + paramAffine2.m02;
      paramFloat1 = paramAffine2.m10 * paramFloat1 + paramAffine2.m12;
      float f7 = paramTextureRegion.u;
      float f8 = paramTextureRegion.v2;
      float f9 = paramTextureRegion.u2;
      float f10 = paramTextureRegion.v;
      Affine2 affine2 = this.adjustAffine;
      this.vertices[this.idx + 0] = affine2.m00 * f1 + affine2.m01 * f2 + affine2.m02;
      this.vertices[this.idx + 1] = affine2.m10 * f1 + affine2.m11 * f2 + affine2.m12;
      this.vertices[this.idx + 2] = this.colorPacked;
      this.vertices[this.idx + 3] = f7;
      this.vertices[this.idx + 4] = f8;
      this.vertices[this.idx + 5] = affine2.m00 * f3 + affine2.m01 * f4 + affine2.m02;
      this.vertices[this.idx + 6] = affine2.m10 * f3 + affine2.m11 * f4 + affine2.m12;
      this.vertices[this.idx + 7] = this.colorPacked;
      this.vertices[this.idx + 8] = f7;
      this.vertices[this.idx + 9] = f10;
      this.vertices[this.idx + 10] = affine2.m00 * f5 + affine2.m01 * f6 + affine2.m02;
      this.vertices[this.idx + 11] = affine2.m10 * f5 + affine2.m11 * f6 + affine2.m12;
      this.vertices[this.idx + 12] = this.colorPacked;
      this.vertices[this.idx + 13] = f9;
      this.vertices[this.idx + 14] = f10;
      this.vertices[this.idx + 15] = affine2.m00 * paramFloat2 + affine2.m01 * paramFloat1 + affine2.m02;
      this.vertices[this.idx + 16] = affine2.m10 * paramFloat2 + affine2.m11 * paramFloat1 + affine2.m12;
      this.vertices[this.idx + 17] = this.colorPacked;
      this.vertices[this.idx + 18] = f9;
      this.vertices[this.idx + 19] = f8;
      this.idx += 20;
      return;
    } 
    throw new IllegalStateException("CpuSpriteBatch.begin must be called before draw.");
  }
  
  private void drawAdjustedUV(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: aload_0
    //   1: getfield drawing : Z
    //   4: ifeq -> 813
    //   7: aload_1
    //   8: aload_0
    //   9: getfield lastTexture : Lcom/badlogic/gdx/graphics/Texture;
    //   12: if_acmpeq -> 23
    //   15: aload_0
    //   16: aload_1
    //   17: invokevirtual switchTexture : (Lcom/badlogic/gdx/graphics/Texture;)V
    //   20: goto -> 39
    //   23: aload_0
    //   24: getfield idx : I
    //   27: aload_0
    //   28: getfield vertices : [F
    //   31: arraylength
    //   32: if_icmpne -> 39
    //   35: aload_0
    //   36: invokespecial flush : ()V
    //   39: fload_2
    //   40: fload #4
    //   42: fadd
    //   43: fstore #17
    //   45: fload_3
    //   46: fload #5
    //   48: fadd
    //   49: fstore #18
    //   51: fload #4
    //   53: fneg
    //   54: fstore #19
    //   56: fload #5
    //   58: fneg
    //   59: fstore #20
    //   61: fload #6
    //   63: fload #4
    //   65: fsub
    //   66: fstore #6
    //   68: fload #7
    //   70: fload #5
    //   72: fsub
    //   73: fstore #7
    //   75: fload #8
    //   77: fconst_1
    //   78: fcmpl
    //   79: ifne -> 103
    //   82: fload #6
    //   84: fstore_2
    //   85: fload #7
    //   87: fstore_3
    //   88: fload #19
    //   90: fstore #5
    //   92: fload #20
    //   94: fstore #4
    //   96: fload #9
    //   98: fconst_1
    //   99: fcmpl
    //   100: ifeq -> 129
    //   103: fload #19
    //   105: fload #8
    //   107: fmul
    //   108: fstore #5
    //   110: fload #20
    //   112: fload #9
    //   114: fmul
    //   115: fstore #4
    //   117: fload #6
    //   119: fload #8
    //   121: fmul
    //   122: fstore_2
    //   123: fload #7
    //   125: fload #9
    //   127: fmul
    //   128: fstore_3
    //   129: fload #10
    //   131: fconst_0
    //   132: fcmpl
    //   133: ifeq -> 262
    //   136: fload #10
    //   138: invokestatic cosDeg : (F)F
    //   141: fstore #8
    //   143: fload #10
    //   145: invokestatic sinDeg : (F)F
    //   148: fstore #7
    //   150: fload #8
    //   152: fload #5
    //   154: fmul
    //   155: fstore #9
    //   157: fload #9
    //   159: fload #7
    //   161: fload #4
    //   163: fmul
    //   164: fsub
    //   165: fstore #6
    //   167: fload #5
    //   169: fload #7
    //   171: fmul
    //   172: fstore #10
    //   174: fload #4
    //   176: fload #8
    //   178: fmul
    //   179: fload #10
    //   181: fadd
    //   182: fstore #4
    //   184: fload #7
    //   186: fload_3
    //   187: fmul
    //   188: fstore #5
    //   190: fload #9
    //   192: fload #5
    //   194: fsub
    //   195: fstore #9
    //   197: fload_3
    //   198: fload #8
    //   200: fmul
    //   201: fstore #20
    //   203: fload #10
    //   205: fload #20
    //   207: fadd
    //   208: fstore #10
    //   210: fload #8
    //   212: fload_2
    //   213: fmul
    //   214: fload #5
    //   216: fsub
    //   217: fstore_3
    //   218: fload #20
    //   220: fload #7
    //   222: fload_2
    //   223: fmul
    //   224: fadd
    //   225: fstore #20
    //   227: fload_3
    //   228: fload #9
    //   230: fsub
    //   231: fload #6
    //   233: fadd
    //   234: fstore #7
    //   236: fload_3
    //   237: fstore_2
    //   238: fload #20
    //   240: fstore #8
    //   242: fload #10
    //   244: fstore_3
    //   245: fload #6
    //   247: fstore #5
    //   249: fload #20
    //   251: fload #10
    //   253: fload #4
    //   255: fsub
    //   256: fsub
    //   257: fstore #6
    //   259: goto -> 276
    //   262: fload_2
    //   263: fstore #7
    //   265: fload_3
    //   266: fstore #8
    //   268: fload #5
    //   270: fstore #9
    //   272: fload #4
    //   274: fstore #6
    //   276: fload #5
    //   278: fload #17
    //   280: fadd
    //   281: fstore #10
    //   283: fload #4
    //   285: fload #18
    //   287: fadd
    //   288: fstore #20
    //   290: fload #9
    //   292: fload #17
    //   294: fadd
    //   295: fstore #9
    //   297: fload_3
    //   298: fload #18
    //   300: fadd
    //   301: fstore #19
    //   303: fload_2
    //   304: fload #17
    //   306: fadd
    //   307: fstore #21
    //   309: fload #8
    //   311: fload #18
    //   313: fadd
    //   314: fstore #8
    //   316: fload #7
    //   318: fload #17
    //   320: fadd
    //   321: fstore #7
    //   323: fload #6
    //   325: fload #18
    //   327: fadd
    //   328: fstore #6
    //   330: iload #15
    //   332: ifeq -> 344
    //   335: fload #11
    //   337: fstore_2
    //   338: fload #13
    //   340: fstore_3
    //   341: goto -> 350
    //   344: fload #11
    //   346: fstore_3
    //   347: fload #13
    //   349: fstore_2
    //   350: iload #16
    //   352: ifeq -> 366
    //   355: fload #14
    //   357: fstore #4
    //   359: fload #12
    //   361: fstore #5
    //   363: goto -> 374
    //   366: fload #14
    //   368: fstore #5
    //   370: fload #12
    //   372: fstore #4
    //   374: aload_0
    //   375: getfield adjustAffine : Lcom/badlogic/gdx/math/Affine2;
    //   378: astore_1
    //   379: aload_0
    //   380: getfield vertices : [F
    //   383: aload_0
    //   384: getfield idx : I
    //   387: iconst_0
    //   388: iadd
    //   389: aload_1
    //   390: getfield m00 : F
    //   393: fload #10
    //   395: fmul
    //   396: aload_1
    //   397: getfield m01 : F
    //   400: fload #20
    //   402: fmul
    //   403: fadd
    //   404: aload_1
    //   405: getfield m02 : F
    //   408: fadd
    //   409: fastore
    //   410: aload_0
    //   411: getfield vertices : [F
    //   414: aload_0
    //   415: getfield idx : I
    //   418: iconst_1
    //   419: iadd
    //   420: aload_1
    //   421: getfield m10 : F
    //   424: fload #10
    //   426: fmul
    //   427: aload_1
    //   428: getfield m11 : F
    //   431: fload #20
    //   433: fmul
    //   434: fadd
    //   435: aload_1
    //   436: getfield m12 : F
    //   439: fadd
    //   440: fastore
    //   441: aload_0
    //   442: getfield vertices : [F
    //   445: aload_0
    //   446: getfield idx : I
    //   449: iconst_2
    //   450: iadd
    //   451: aload_0
    //   452: getfield colorPacked : F
    //   455: fastore
    //   456: aload_0
    //   457: getfield vertices : [F
    //   460: aload_0
    //   461: getfield idx : I
    //   464: iconst_3
    //   465: iadd
    //   466: fload_3
    //   467: fastore
    //   468: aload_0
    //   469: getfield vertices : [F
    //   472: aload_0
    //   473: getfield idx : I
    //   476: iconst_4
    //   477: iadd
    //   478: fload #4
    //   480: fastore
    //   481: aload_0
    //   482: getfield vertices : [F
    //   485: aload_0
    //   486: getfield idx : I
    //   489: iconst_5
    //   490: iadd
    //   491: aload_1
    //   492: getfield m00 : F
    //   495: fload #9
    //   497: fmul
    //   498: aload_1
    //   499: getfield m01 : F
    //   502: fload #19
    //   504: fmul
    //   505: fadd
    //   506: aload_1
    //   507: getfield m02 : F
    //   510: fadd
    //   511: fastore
    //   512: aload_0
    //   513: getfield vertices : [F
    //   516: aload_0
    //   517: getfield idx : I
    //   520: bipush #6
    //   522: iadd
    //   523: aload_1
    //   524: getfield m10 : F
    //   527: fload #9
    //   529: fmul
    //   530: aload_1
    //   531: getfield m11 : F
    //   534: fload #19
    //   536: fmul
    //   537: fadd
    //   538: aload_1
    //   539: getfield m12 : F
    //   542: fadd
    //   543: fastore
    //   544: aload_0
    //   545: getfield vertices : [F
    //   548: aload_0
    //   549: getfield idx : I
    //   552: bipush #7
    //   554: iadd
    //   555: aload_0
    //   556: getfield colorPacked : F
    //   559: fastore
    //   560: aload_0
    //   561: getfield vertices : [F
    //   564: aload_0
    //   565: getfield idx : I
    //   568: bipush #8
    //   570: iadd
    //   571: fload_3
    //   572: fastore
    //   573: aload_0
    //   574: getfield vertices : [F
    //   577: aload_0
    //   578: getfield idx : I
    //   581: bipush #9
    //   583: iadd
    //   584: fload #5
    //   586: fastore
    //   587: aload_0
    //   588: getfield vertices : [F
    //   591: aload_0
    //   592: getfield idx : I
    //   595: bipush #10
    //   597: iadd
    //   598: aload_1
    //   599: getfield m00 : F
    //   602: fload #21
    //   604: fmul
    //   605: aload_1
    //   606: getfield m01 : F
    //   609: fload #8
    //   611: fmul
    //   612: fadd
    //   613: aload_1
    //   614: getfield m02 : F
    //   617: fadd
    //   618: fastore
    //   619: aload_0
    //   620: getfield vertices : [F
    //   623: aload_0
    //   624: getfield idx : I
    //   627: bipush #11
    //   629: iadd
    //   630: aload_1
    //   631: getfield m10 : F
    //   634: fload #21
    //   636: fmul
    //   637: aload_1
    //   638: getfield m11 : F
    //   641: fload #8
    //   643: fmul
    //   644: fadd
    //   645: aload_1
    //   646: getfield m12 : F
    //   649: fadd
    //   650: fastore
    //   651: aload_0
    //   652: getfield vertices : [F
    //   655: aload_0
    //   656: getfield idx : I
    //   659: bipush #12
    //   661: iadd
    //   662: aload_0
    //   663: getfield colorPacked : F
    //   666: fastore
    //   667: aload_0
    //   668: getfield vertices : [F
    //   671: aload_0
    //   672: getfield idx : I
    //   675: bipush #13
    //   677: iadd
    //   678: fload_2
    //   679: fastore
    //   680: aload_0
    //   681: getfield vertices : [F
    //   684: aload_0
    //   685: getfield idx : I
    //   688: bipush #14
    //   690: iadd
    //   691: fload #5
    //   693: fastore
    //   694: aload_0
    //   695: getfield vertices : [F
    //   698: aload_0
    //   699: getfield idx : I
    //   702: bipush #15
    //   704: iadd
    //   705: aload_1
    //   706: getfield m00 : F
    //   709: fload #7
    //   711: fmul
    //   712: aload_1
    //   713: getfield m01 : F
    //   716: fload #6
    //   718: fmul
    //   719: fadd
    //   720: aload_1
    //   721: getfield m02 : F
    //   724: fadd
    //   725: fastore
    //   726: aload_0
    //   727: getfield vertices : [F
    //   730: aload_0
    //   731: getfield idx : I
    //   734: bipush #16
    //   736: iadd
    //   737: aload_1
    //   738: getfield m10 : F
    //   741: fload #7
    //   743: fmul
    //   744: aload_1
    //   745: getfield m11 : F
    //   748: fload #6
    //   750: fmul
    //   751: fadd
    //   752: aload_1
    //   753: getfield m12 : F
    //   756: fadd
    //   757: fastore
    //   758: aload_0
    //   759: getfield vertices : [F
    //   762: aload_0
    //   763: getfield idx : I
    //   766: bipush #17
    //   768: iadd
    //   769: aload_0
    //   770: getfield colorPacked : F
    //   773: fastore
    //   774: aload_0
    //   775: getfield vertices : [F
    //   778: aload_0
    //   779: getfield idx : I
    //   782: bipush #18
    //   784: iadd
    //   785: fload_2
    //   786: fastore
    //   787: aload_0
    //   788: getfield vertices : [F
    //   791: aload_0
    //   792: getfield idx : I
    //   795: bipush #19
    //   797: iadd
    //   798: fload #4
    //   800: fastore
    //   801: aload_0
    //   802: aload_0
    //   803: getfield idx : I
    //   806: bipush #20
    //   808: iadd
    //   809: putfield idx : I
    //   812: return
    //   813: new java/lang/IllegalStateException
    //   816: dup
    //   817: ldc 'CpuSpriteBatch.begin must be called before draw.'
    //   819: invokespecial <init> : (Ljava/lang/String;)V
    //   822: athrow }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2) {
    if (!this.adjustNeeded) {
      super.draw(paramTexture, paramFloat1, paramFloat2);
    } else {
      drawAdjusted(paramTexture, paramFloat1, paramFloat2, 0.0F, 0.0F, paramTexture.getWidth(), paramTexture.getHeight(), 1.0F, 1.0F, 0.0F, 0, 1, 1, 0, false, false);
    } 
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (!this.adjustNeeded) {
      super.draw(paramTexture, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    } else {
      drawAdjusted(paramTexture, paramFloat1, paramFloat2, 0.0F, 0.0F, paramFloat3, paramFloat4, 1.0F, 1.0F, 0.0F, 0, 1, 1, 0, false, false);
    } 
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) {
    if (!this.adjustNeeded) {
      super.draw(paramTexture, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8);
    } else {
      drawAdjustedUV(paramTexture, paramFloat1, paramFloat2, 0.0F, 0.0F, paramFloat3, paramFloat4, 1.0F, 1.0F, 0.0F, paramFloat5, paramFloat6, paramFloat7, paramFloat8, false, false);
    } 
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) {
    if (!this.adjustNeeded) {
      super.draw(paramTexture, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramInt1, paramInt2, paramInt3, paramInt4, paramBoolean1, paramBoolean2);
    } else {
      drawAdjusted(paramTexture, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramInt1, paramInt2, paramInt3, paramInt4, paramBoolean1, paramBoolean2);
    } 
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2) {
    if (!this.adjustNeeded) {
      super.draw(paramTexture, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt1, paramInt2, paramInt3, paramInt4, paramBoolean1, paramBoolean2);
    } else {
      drawAdjusted(paramTexture, paramFloat1, paramFloat2, 0.0F, 0.0F, paramFloat3, paramFloat4, 1.0F, 1.0F, 0.0F, paramInt1, paramInt2, paramInt3, paramInt4, paramBoolean1, paramBoolean2);
    } 
  }
  
  public void draw(Texture paramTexture, float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (!this.adjustNeeded) {
      super.draw(paramTexture, paramFloat1, paramFloat2, paramInt1, paramInt2, paramInt3, paramInt4);
    } else {
      drawAdjusted(paramTexture, paramFloat1, paramFloat2, 0.0F, 0.0F, paramInt3, paramInt4, 1.0F, 1.0F, 0.0F, paramInt1, paramInt2, paramInt3, paramInt4, false, false);
    } 
  }
  
  public void draw(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (paramInt2 % 20 == 0) {
      if (!this.adjustNeeded) {
        super.draw(paramTexture, paramArrayOfFloat, paramInt1, paramInt2);
      } else {
        drawAdjusted(paramTexture, paramArrayOfFloat, paramInt1, paramInt2);
      } 
      return;
    } 
    throw new GdxRuntimeException("invalid vertex count");
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2) {
    if (!this.adjustNeeded) {
      super.draw(paramTextureRegion, paramFloat1, paramFloat2);
    } else {
      drawAdjusted(paramTextureRegion, paramFloat1, paramFloat2, 0.0F, 0.0F, paramTextureRegion.getRegionWidth(), paramTextureRegion.getRegionHeight(), 1.0F, 1.0F, 0.0F);
    } 
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (!this.adjustNeeded) {
      super.draw(paramTextureRegion, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    } else {
      drawAdjusted(paramTextureRegion, paramFloat1, paramFloat2, 0.0F, 0.0F, paramFloat3, paramFloat4, 1.0F, 1.0F, 0.0F);
    } 
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    if (!this.adjustNeeded) {
      super.draw(paramTextureRegion, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9);
    } else {
      drawAdjusted(paramTextureRegion, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9);
    } 
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, boolean paramBoolean) {
    if (!this.adjustNeeded) {
      super.draw(paramTextureRegion, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramBoolean);
    } else {
      drawAdjusted(paramTextureRegion, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramBoolean);
    } 
  }
  
  public void draw(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2, Affine2 paramAffine2) {
    if (!this.adjustNeeded) {
      super.draw(paramTextureRegion, paramFloat1, paramFloat2, paramAffine2);
    } else {
      drawAdjusted(paramTextureRegion, paramFloat1, paramFloat2, paramAffine2);
    } 
  }
  
  public void flushAndSyncTransformMatrix() {
    flush();
    if (this.adjustNeeded) {
      this.haveIdentityRealMatrix = checkIdt(this.virtualMatrix);
      if (this.haveIdentityRealMatrix || this.virtualMatrix.det() != 0.0F) {
        this.adjustNeeded = false;
        super.setTransformMatrix(this.virtualMatrix);
        return;
      } 
      throw new GdxRuntimeException("Transform matrix is singular, can't sync");
    } 
  }
  
  public Matrix4 getTransformMatrix() {
    Matrix4 matrix4;
    if (this.adjustNeeded) {
      matrix4 = this.virtualMatrix;
    } else {
      matrix4 = super.getTransformMatrix();
    } 
    return matrix4;
  }
  
  public void setTransformMatrix(Affine2 paramAffine2) {
    Matrix4 matrix4 = super.getTransformMatrix();
    if (checkEqual(matrix4, paramAffine2)) {
      this.adjustNeeded = false;
    } else {
      this.virtualMatrix.setAsAffine(paramAffine2);
      if (isDrawing()) {
        this.adjustNeeded = true;
        if (this.haveIdentityRealMatrix) {
          this.adjustAffine.set(paramAffine2);
        } else {
          this.adjustAffine.set(matrix4).inv().mul(paramAffine2);
        } 
      } else {
        matrix4.setAsAffine(paramAffine2);
        this.haveIdentityRealMatrix = checkIdt(matrix4);
      } 
    } 
  }
  
  public void setTransformMatrix(Matrix4 paramMatrix4) {
    Matrix4 matrix4 = super.getTransformMatrix();
    if (checkEqual(matrix4, paramMatrix4)) {
      this.adjustNeeded = false;
    } else if (isDrawing()) {
      this.virtualMatrix.setAsAffine(paramMatrix4);
      this.adjustNeeded = true;
      if (this.haveIdentityRealMatrix) {
        this.adjustAffine.set(paramMatrix4);
      } else {
        this.tmpAffine.set(paramMatrix4);
        this.adjustAffine.set(matrix4).inv().mul(this.tmpAffine);
      } 
    } else {
      matrix4.setAsAffine(paramMatrix4);
      this.haveIdentityRealMatrix = checkIdt(matrix4);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/CpuSpriteBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */