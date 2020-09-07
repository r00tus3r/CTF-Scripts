package com.badlogic.gdx.backends.android.surfaceview;

import android.opengl.GLSurfaceView;
import android.util.Log;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;

public class GdxEglConfigChooser implements GLSurfaceView.EGLConfigChooser {
  public static final int EGL_COVERAGE_BUFFERS_NV = 12512;
  
  public static final int EGL_COVERAGE_SAMPLES_NV = 12513;
  
  private static final int EGL_OPENGL_ES2_BIT = 4;
  
  private static final String TAG = "GdxEglConfigChooser";
  
  protected int mAlphaSize;
  
  protected int mBlueSize;
  
  protected final int[] mConfigAttribs;
  
  protected int mDepthSize;
  
  protected int mGreenSize;
  
  protected int mNumSamples;
  
  protected int mRedSize;
  
  protected int mStencilSize;
  
  private int[] mValue = new int[1];
  
  public GdxEglConfigChooser(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7) {
    this.mRedSize = paramInt1;
    this.mGreenSize = paramInt2;
    this.mBlueSize = paramInt3;
    this.mAlphaSize = paramInt4;
    this.mDepthSize = paramInt5;
    this.mStencilSize = paramInt6;
    this.mNumSamples = paramInt7;
    this.mConfigAttribs = new int[] { 12324, 4, 12323, 4, 12322, 4, 12352, 4, 12344 };
  }
  
  private int findConfigAttrib(EGL10 paramEGL10, EGLDisplay paramEGLDisplay, EGLConfig paramEGLConfig, int paramInt1, int paramInt2) { return paramEGL10.eglGetConfigAttrib(paramEGLDisplay, paramEGLConfig, paramInt1, this.mValue) ? this.mValue[0] : paramInt2; }
  
  private void printConfig(EGL10 paramEGL10, EGLDisplay paramEGLDisplay, EGLConfig paramEGLConfig) {
    int[] arrayOfInt1 = new int[35];
    arrayOfInt1[0] = 12320;
    arrayOfInt1[1] = 12321;
    arrayOfInt1[2] = 12322;
    arrayOfInt1[3] = 12323;
    arrayOfInt1[4] = 12324;
    arrayOfInt1[5] = 12325;
    arrayOfInt1[6] = 12326;
    arrayOfInt1[7] = 12327;
    arrayOfInt1[8] = 12328;
    arrayOfInt1[9] = 12329;
    arrayOfInt1[10] = 12330;
    arrayOfInt1[11] = 12331;
    arrayOfInt1[12] = 12332;
    arrayOfInt1[13] = 12333;
    arrayOfInt1[14] = 12334;
    arrayOfInt1[15] = 12335;
    arrayOfInt1[16] = 12336;
    arrayOfInt1[17] = 12337;
    arrayOfInt1[18] = 12338;
    arrayOfInt1[19] = 12339;
    arrayOfInt1[20] = 12340;
    arrayOfInt1[21] = 12343;
    arrayOfInt1[22] = 12342;
    arrayOfInt1[23] = 12341;
    arrayOfInt1[24] = 12345;
    arrayOfInt1[25] = 12346;
    arrayOfInt1[26] = 12347;
    arrayOfInt1[27] = 12348;
    arrayOfInt1[28] = 12349;
    arrayOfInt1[29] = 12350;
    arrayOfInt1[30] = 12351;
    arrayOfInt1[31] = 12352;
    arrayOfInt1[32] = 12354;
    arrayOfInt1[33] = 12512;
    arrayOfInt1[34] = 12513;
    arrayOfInt1;
    int[] arrayOfInt2 = new int[1];
    for (byte b = 0; b < arrayOfInt1.length; b++) {
      int i = arrayOfInt1[b];
      new String[35][0] = "EGL_BUFFER_SIZE";
      new String[35][1] = "EGL_ALPHA_SIZE";
      new String[35][2] = "EGL_BLUE_SIZE";
      new String[35][3] = "EGL_GREEN_SIZE";
      new String[35][4] = "EGL_RED_SIZE";
      new String[35][5] = "EGL_DEPTH_SIZE";
      new String[35][6] = "EGL_STENCIL_SIZE";
      new String[35][7] = "EGL_CONFIG_CAVEAT";
      new String[35][8] = "EGL_CONFIG_ID";
      new String[35][9] = "EGL_LEVEL";
      new String[35][10] = "EGL_MAX_PBUFFER_HEIGHT";
      new String[35][11] = "EGL_MAX_PBUFFER_PIXELS";
      new String[35][12] = "EGL_MAX_PBUFFER_WIDTH";
      new String[35][13] = "EGL_NATIVE_RENDERABLE";
      new String[35][14] = "EGL_NATIVE_VISUAL_ID";
      new String[35][15] = "EGL_NATIVE_VISUAL_TYPE";
      new String[35][16] = "EGL_PRESERVED_RESOURCES";
      new String[35][17] = "EGL_SAMPLES";
      new String[35][18] = "EGL_SAMPLE_BUFFERS";
      new String[35][19] = "EGL_SURFACE_TYPE";
      new String[35][20] = "EGL_TRANSPARENT_TYPE";
      new String[35][21] = "EGL_TRANSPARENT_RED_VALUE";
      new String[35][22] = "EGL_TRANSPARENT_GREEN_VALUE";
      new String[35][23] = "EGL_TRANSPARENT_BLUE_VALUE";
      new String[35][24] = "EGL_BIND_TO_TEXTURE_RGB";
      new String[35][25] = "EGL_BIND_TO_TEXTURE_RGBA";
      new String[35][26] = "EGL_MIN_SWAP_INTERVAL";
      new String[35][27] = "EGL_MAX_SWAP_INTERVAL";
      new String[35][28] = "EGL_LUMINANCE_SIZE";
      new String[35][29] = "EGL_ALPHA_MASK_SIZE";
      new String[35][30] = "EGL_COLOR_BUFFER_TYPE";
      new String[35][31] = "EGL_RENDERABLE_TYPE";
      new String[35][32] = "EGL_CONFORMANT";
      new String[35][33] = "EGL_COVERAGE_BUFFERS_NV";
      new String[35][34] = "EGL_COVERAGE_SAMPLES_NV";
      String str = new String[35][b];
      if (paramEGL10.eglGetConfigAttrib(paramEGLDisplay, paramEGLConfig, i, arrayOfInt2)) {
        Log.w("GdxEglConfigChooser", String.format("  %s: %d\n", new Object[] { str, Integer.valueOf(arrayOfInt2[0]) }));
      } else {
        paramEGL10.eglGetError();
      } 
    } 
  }
  
  private void printConfigs(EGL10 paramEGL10, EGLDisplay paramEGLDisplay, EGLConfig[] paramArrayOfEGLConfig) {
    int i = paramArrayOfEGLConfig.length;
    Log.w("GdxEglConfigChooser", String.format("%d configurations", new Object[] { Integer.valueOf(i) }));
    for (byte b = 0; b < i; b++) {
      Log.w("GdxEglConfigChooser", String.format("Configuration %d:\n", new Object[] { Integer.valueOf(b) }));
      printConfig(paramEGL10, paramEGLDisplay, paramArrayOfEGLConfig[b]);
    } 
  }
  
  public EGLConfig chooseConfig(EGL10 paramEGL10, EGLDisplay paramEGLDisplay) {
    int[] arrayOfInt = new int[1];
    paramEGL10.eglChooseConfig(paramEGLDisplay, this.mConfigAttribs, null, 0, arrayOfInt);
    int i = arrayOfInt[0];
    if (i > 0) {
      EGLConfig[] arrayOfEGLConfig = new EGLConfig[i];
      paramEGL10.eglChooseConfig(paramEGLDisplay, this.mConfigAttribs, arrayOfEGLConfig, i, arrayOfInt);
      return chooseConfig(paramEGL10, paramEGLDisplay, arrayOfEGLConfig);
    } 
    throw new IllegalArgumentException("No configs match configSpec");
  }
  
  public EGLConfig chooseConfig(EGL10 paramEGL10, EGLDisplay paramEGLDisplay, EGLConfig[] paramArrayOfEGLConfig) { // Byte code:
    //   0: aload_3
    //   1: arraylength
    //   2: istore #4
    //   4: aconst_null
    //   5: astore #5
    //   7: aload #5
    //   9: astore #6
    //   11: aload #6
    //   13: astore #7
    //   15: iconst_0
    //   16: istore #8
    //   18: iload #8
    //   20: iload #4
    //   22: if_icmpge -> 496
    //   25: aload_3
    //   26: iload #8
    //   28: aaload
    //   29: astore #9
    //   31: aload_0
    //   32: aload_1
    //   33: aload_2
    //   34: aload #9
    //   36: sipush #12325
    //   39: iconst_0
    //   40: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   43: istore #10
    //   45: aload_0
    //   46: aload_1
    //   47: aload_2
    //   48: aload #9
    //   50: sipush #12326
    //   53: iconst_0
    //   54: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   57: istore #11
    //   59: iload #10
    //   61: aload_0
    //   62: getfield mDepthSize : I
    //   65: if_icmplt -> 482
    //   68: iload #11
    //   70: aload_0
    //   71: getfield mStencilSize : I
    //   74: if_icmpge -> 80
    //   77: goto -> 482
    //   80: aload_0
    //   81: aload_1
    //   82: aload_2
    //   83: aload #9
    //   85: sipush #12324
    //   88: iconst_0
    //   89: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   92: istore #10
    //   94: aload_0
    //   95: aload_1
    //   96: aload_2
    //   97: aload #9
    //   99: sipush #12323
    //   102: iconst_0
    //   103: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   106: istore #11
    //   108: aload_0
    //   109: aload_1
    //   110: aload_2
    //   111: aload #9
    //   113: sipush #12322
    //   116: iconst_0
    //   117: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   120: istore #12
    //   122: aload_0
    //   123: aload_1
    //   124: aload_2
    //   125: aload #9
    //   127: sipush #12321
    //   130: iconst_0
    //   131: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   134: istore #13
    //   136: aload #5
    //   138: astore #14
    //   140: aload #5
    //   142: ifnonnull -> 189
    //   145: aload #5
    //   147: astore #14
    //   149: iload #10
    //   151: iconst_5
    //   152: if_icmpne -> 189
    //   155: aload #5
    //   157: astore #14
    //   159: iload #11
    //   161: bipush #6
    //   163: if_icmpne -> 189
    //   166: aload #5
    //   168: astore #14
    //   170: iload #12
    //   172: iconst_5
    //   173: if_icmpne -> 189
    //   176: aload #5
    //   178: astore #14
    //   180: iload #13
    //   182: ifne -> 189
    //   185: aload #9
    //   187: astore #14
    //   189: aload #6
    //   191: astore #15
    //   193: aload #6
    //   195: ifnonnull -> 264
    //   198: aload #6
    //   200: astore #15
    //   202: iload #10
    //   204: aload_0
    //   205: getfield mRedSize : I
    //   208: if_icmpne -> 264
    //   211: aload #6
    //   213: astore #15
    //   215: iload #11
    //   217: aload_0
    //   218: getfield mGreenSize : I
    //   221: if_icmpne -> 264
    //   224: aload #6
    //   226: astore #15
    //   228: iload #12
    //   230: aload_0
    //   231: getfield mBlueSize : I
    //   234: if_icmpne -> 264
    //   237: aload #6
    //   239: astore #15
    //   241: iload #13
    //   243: aload_0
    //   244: getfield mAlphaSize : I
    //   247: if_icmpne -> 264
    //   250: aload_0
    //   251: getfield mNumSamples : I
    //   254: ifne -> 260
    //   257: goto -> 504
    //   260: aload #9
    //   262: astore #15
    //   264: aload_0
    //   265: aload_1
    //   266: aload_2
    //   267: aload #9
    //   269: sipush #12338
    //   272: iconst_0
    //   273: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   276: istore #16
    //   278: aload_0
    //   279: aload_1
    //   280: aload_2
    //   281: aload #9
    //   283: sipush #12337
    //   286: iconst_0
    //   287: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   290: istore #17
    //   292: aload #7
    //   294: ifnonnull -> 351
    //   297: iload #16
    //   299: iconst_1
    //   300: if_icmpne -> 351
    //   303: iload #17
    //   305: aload_0
    //   306: getfield mNumSamples : I
    //   309: if_icmplt -> 351
    //   312: iload #10
    //   314: aload_0
    //   315: getfield mRedSize : I
    //   318: if_icmpne -> 351
    //   321: iload #11
    //   323: aload_0
    //   324: getfield mGreenSize : I
    //   327: if_icmpne -> 351
    //   330: iload #12
    //   332: aload_0
    //   333: getfield mBlueSize : I
    //   336: if_icmpne -> 351
    //   339: iload #13
    //   341: aload_0
    //   342: getfield mAlphaSize : I
    //   345: if_icmpne -> 351
    //   348: goto -> 463
    //   351: aload_0
    //   352: aload_1
    //   353: aload_2
    //   354: aload #9
    //   356: sipush #12512
    //   359: iconst_0
    //   360: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   363: istore #16
    //   365: aload_0
    //   366: aload_1
    //   367: aload_2
    //   368: aload #9
    //   370: sipush #12513
    //   373: iconst_0
    //   374: invokespecial findConfigAttrib : (Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    //   377: istore #17
    //   379: aload #7
    //   381: astore #5
    //   383: aload #7
    //   385: ifnonnull -> 467
    //   388: aload #7
    //   390: astore #5
    //   392: iload #16
    //   394: iconst_1
    //   395: if_icmpne -> 467
    //   398: aload #7
    //   400: astore #5
    //   402: iload #17
    //   404: aload_0
    //   405: getfield mNumSamples : I
    //   408: if_icmplt -> 467
    //   411: aload #7
    //   413: astore #5
    //   415: iload #10
    //   417: aload_0
    //   418: getfield mRedSize : I
    //   421: if_icmpne -> 467
    //   424: aload #7
    //   426: astore #5
    //   428: iload #11
    //   430: aload_0
    //   431: getfield mGreenSize : I
    //   434: if_icmpne -> 467
    //   437: aload #7
    //   439: astore #5
    //   441: iload #12
    //   443: aload_0
    //   444: getfield mBlueSize : I
    //   447: if_icmpne -> 467
    //   450: aload #7
    //   452: astore #5
    //   454: iload #13
    //   456: aload_0
    //   457: getfield mAlphaSize : I
    //   460: if_icmpne -> 467
    //   463: aload #9
    //   465: astore #5
    //   467: aload #15
    //   469: astore #6
    //   471: aload #14
    //   473: astore #9
    //   475: aload #5
    //   477: astore #7
    //   479: goto -> 486
    //   482: aload #5
    //   484: astore #9
    //   486: iinc #8, 1
    //   489: aload #9
    //   491: astore #5
    //   493: goto -> 18
    //   496: aload #6
    //   498: astore #9
    //   500: aload #5
    //   502: astore #14
    //   504: aload #7
    //   506: ifnull -> 512
    //   509: aload #7
    //   511: areturn
    //   512: aload #9
    //   514: ifnull -> 520
    //   517: aload #9
    //   519: areturn
    //   520: aload #14
    //   522: areturn }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */