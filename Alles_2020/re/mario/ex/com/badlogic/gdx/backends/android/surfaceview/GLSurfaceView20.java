package com.badlogic.gdx.backends.android.surfaceview;

import android.annotation.TargetApi;
import android.content.Context;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;

public class GLSurfaceView20 extends GLSurfaceView {
  private static final boolean DEBUG = false;
  
  static String TAG = "GL2JNIView";
  
  static int targetGLESVersion;
  
  final ResolutionStrategy resolutionStrategy;
  
  static  {
  
  }
  
  public GLSurfaceView20(Context paramContext, ResolutionStrategy paramResolutionStrategy) { this(paramContext, paramResolutionStrategy, 2); }
  
  public GLSurfaceView20(Context paramContext, ResolutionStrategy paramResolutionStrategy, int paramInt) {
    super(paramContext);
    targetGLESVersion = paramInt;
    this.resolutionStrategy = paramResolutionStrategy;
    init(false, 16, 0);
  }
  
  public GLSurfaceView20(Context paramContext, boolean paramBoolean, int paramInt1, int paramInt2, ResolutionStrategy paramResolutionStrategy) {
    super(paramContext);
    this.resolutionStrategy = paramResolutionStrategy;
    init(paramBoolean, paramInt1, paramInt2);
  }
  
  static boolean checkEglError(String paramString, EGL10 paramEGL10) {
    boolean bool = true;
    while (true) {
      int i = paramEGL10.eglGetError();
      if (i != 12288) {
        Log.e(TAG, String.format("%s: EGL error: 0x%x", new Object[] { paramString, Integer.valueOf(i) }));
        bool = false;
        continue;
      } 
      break;
    } 
    return bool;
  }
  
  private void init(boolean paramBoolean, int paramInt1, int paramInt2) {
    ConfigChooser configChooser;
    if (paramBoolean)
      getHolder().setFormat(-3); 
    setEGLContextFactory(new ContextFactory());
    if (paramBoolean) {
      configChooser = new ConfigChooser(8, 8, 8, 8, paramInt1, paramInt2);
    } else {
      configChooser = new ConfigChooser(5, 6, 5, false, paramInt1, paramInt2);
    } 
    setEGLConfigChooser(configChooser);
  }
  
  public InputConnection onCreateInputConnection(EditorInfo paramEditorInfo) {
    if (paramEditorInfo != null)
      paramEditorInfo.imeOptions |= 0x10000000; 
    return new BaseInputConnection(this, false) {
        @TargetApi(16)
        private void sendDownUpKeyEventForBackwardCompatibility(int param1Int) {
          long l = SystemClock.uptimeMillis();
          sendKeyEvent(new KeyEvent(l, l, false, param1Int, false, false, -1, false, 6));
          sendKeyEvent(new KeyEvent(SystemClock.uptimeMillis(), l, true, param1Int, false, false, -1, false, 6));
        }
        
        public boolean deleteSurroundingText(int param1Int1, int param1Int2) {
          if (Build.VERSION.SDK_INT >= 16 && param1Int1 == 1 && param1Int2 == 0) {
            sendDownUpKeyEventForBackwardCompatibility(67);
            return true;
          } 
          return super.deleteSurroundingText(param1Int1, param1Int2);
        }
      };
  }
  
  protected void onMeasure(int paramInt1, int paramInt2) {
    ResolutionStrategy.MeasuredDimension measuredDimension = this.resolutionStrategy.calcMeasures(paramInt1, paramInt2);
    setMeasuredDimension(measuredDimension.width, measuredDimension.height);
  }
  
  private static class ConfigChooser implements GLSurfaceView.EGLConfigChooser {
    private static int EGL_OPENGL_ES2_BIT = 4;
    
    private static int[] s_configAttribs2 = { 12324, 4, 12323, 4, 12322, 4, 12352, EGL_OPENGL_ES2_BIT, 12344 };
    
    protected int mAlphaSize;
    
    protected int mBlueSize;
    
    protected int mDepthSize;
    
    protected int mGreenSize;
    
    protected int mRedSize;
    
    protected int mStencilSize;
    
    private int[] mValue = new int[1];
    
    public ConfigChooser(int param1Int1, int param1Int2, int param1Int3, int param1Int4, int param1Int5, int param1Int6) {
      this.mRedSize = param1Int1;
      this.mGreenSize = param1Int2;
      this.mBlueSize = param1Int3;
      this.mAlphaSize = param1Int4;
      this.mDepthSize = param1Int5;
      this.mStencilSize = param1Int6;
    }
    
    private int findConfigAttrib(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig, int param1Int1, int param1Int2) { return param1EGL10.eglGetConfigAttrib(param1EGLDisplay, param1EGLConfig, param1Int1, this.mValue) ? this.mValue[0] : param1Int2; }
    
    private void printConfig(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig) {
      int[] arrayOfInt1 = new int[33];
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
      arrayOfInt1;
      int[] arrayOfInt2 = new int[1];
      for (byte b = 0; b < arrayOfInt1.length; b++) {
        int i = arrayOfInt1[b];
        new String[33][0] = "EGL_BUFFER_SIZE";
        new String[33][1] = "EGL_ALPHA_SIZE";
        new String[33][2] = "EGL_BLUE_SIZE";
        new String[33][3] = "EGL_GREEN_SIZE";
        new String[33][4] = "EGL_RED_SIZE";
        new String[33][5] = "EGL_DEPTH_SIZE";
        new String[33][6] = "EGL_STENCIL_SIZE";
        new String[33][7] = "EGL_CONFIG_CAVEAT";
        new String[33][8] = "EGL_CONFIG_ID";
        new String[33][9] = "EGL_LEVEL";
        new String[33][10] = "EGL_MAX_PBUFFER_HEIGHT";
        new String[33][11] = "EGL_MAX_PBUFFER_PIXELS";
        new String[33][12] = "EGL_MAX_PBUFFER_WIDTH";
        new String[33][13] = "EGL_NATIVE_RENDERABLE";
        new String[33][14] = "EGL_NATIVE_VISUAL_ID";
        new String[33][15] = "EGL_NATIVE_VISUAL_TYPE";
        new String[33][16] = "EGL_PRESERVED_RESOURCES";
        new String[33][17] = "EGL_SAMPLES";
        new String[33][18] = "EGL_SAMPLE_BUFFERS";
        new String[33][19] = "EGL_SURFACE_TYPE";
        new String[33][20] = "EGL_TRANSPARENT_TYPE";
        new String[33][21] = "EGL_TRANSPARENT_RED_VALUE";
        new String[33][22] = "EGL_TRANSPARENT_GREEN_VALUE";
        new String[33][23] = "EGL_TRANSPARENT_BLUE_VALUE";
        new String[33][24] = "EGL_BIND_TO_TEXTURE_RGB";
        new String[33][25] = "EGL_BIND_TO_TEXTURE_RGBA";
        new String[33][26] = "EGL_MIN_SWAP_INTERVAL";
        new String[33][27] = "EGL_MAX_SWAP_INTERVAL";
        new String[33][28] = "EGL_LUMINANCE_SIZE";
        new String[33][29] = "EGL_ALPHA_MASK_SIZE";
        new String[33][30] = "EGL_COLOR_BUFFER_TYPE";
        new String[33][31] = "EGL_RENDERABLE_TYPE";
        new String[33][32] = "EGL_CONFORMANT";
        String str = new String[33][b];
        if (param1EGL10.eglGetConfigAttrib(param1EGLDisplay, param1EGLConfig, i, arrayOfInt2)) {
          Log.w(GLSurfaceView20.TAG, String.format("  %s: %d\n", new Object[] { str, Integer.valueOf(arrayOfInt2[0]) }));
        } else {
          while (param1EGL10.eglGetError() != 12288);
        } 
      } 
    }
    
    private void printConfigs(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig[] param1ArrayOfEGLConfig) {
      int i = param1ArrayOfEGLConfig.length;
      Log.w(GLSurfaceView20.TAG, String.format("%d configurations", new Object[] { Integer.valueOf(i) }));
      for (byte b = 0; b < i; b++) {
        Log.w(GLSurfaceView20.TAG, String.format("Configuration %d:\n", new Object[] { Integer.valueOf(b) }));
        printConfig(param1EGL10, param1EGLDisplay, param1ArrayOfEGLConfig[b]);
      } 
    }
    
    public EGLConfig chooseConfig(EGL10 param1EGL10, EGLDisplay param1EGLDisplay) {
      int[] arrayOfInt = new int[1];
      param1EGL10.eglChooseConfig(param1EGLDisplay, s_configAttribs2, null, 0, arrayOfInt);
      int i = arrayOfInt[0];
      if (i > 0) {
        EGLConfig[] arrayOfEGLConfig = new EGLConfig[i];
        param1EGL10.eglChooseConfig(param1EGLDisplay, s_configAttribs2, arrayOfEGLConfig, i, arrayOfInt);
        return chooseConfig(param1EGL10, param1EGLDisplay, arrayOfEGLConfig);
      } 
      throw new IllegalArgumentException("No configs match configSpec");
    }
    
    public EGLConfig chooseConfig(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig[] param1ArrayOfEGLConfig) {
      int i = param1ArrayOfEGLConfig.length;
      for (byte b = 0; b < i; b++) {
        EGLConfig eGLConfig = param1ArrayOfEGLConfig[b];
        int j = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12325, 0);
        int k = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12326, 0);
        if (j >= this.mDepthSize && k >= this.mStencilSize) {
          j = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12324, 0);
          k = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12323, 0);
          int m = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12322, 0);
          int n = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12321, 0);
          if (j == this.mRedSize && k == this.mGreenSize && m == this.mBlueSize && n == this.mAlphaSize)
            return eGLConfig; 
        } 
      } 
      return null;
    }
  }
  
  static class ContextFactory implements GLSurfaceView.EGLContextFactory {
    private static int EGL_CONTEXT_CLIENT_VERSION = 12440;
    
    static  {
    
    }
    
    public EGLContext createContext(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig) {
      String str2 = GLSurfaceView20.TAG;
      StringBuilder stringBuilder3 = new StringBuilder();
      stringBuilder3.append("creating OpenGL ES ");
      stringBuilder3.append(GLSurfaceView20.targetGLESVersion);
      stringBuilder3.append(".0 context");
      Log.w(str2, stringBuilder3.toString());
      StringBuilder stringBuilder2 = new StringBuilder();
      stringBuilder2.append("Before eglCreateContext ");
      stringBuilder2.append(GLSurfaceView20.targetGLESVersion);
      GLSurfaceView20.checkEglError(stringBuilder2.toString(), param1EGL10);
      int i = EGL_CONTEXT_CLIENT_VERSION;
      int j = GLSurfaceView20.targetGLESVersion;
      EGLContext eGLContext = param1EGL10.eglCreateContext(param1EGLDisplay, param1EGLConfig, EGL10.EGL_NO_CONTEXT, new int[] { i, j, 12344 });
      stringBuilder3 = new StringBuilder();
      stringBuilder3.append("After eglCreateContext ");
      stringBuilder3.append(GLSurfaceView20.targetGLESVersion);
      if ((!GLSurfaceView20.checkEglError(stringBuilder3.toString(), param1EGL10) || eGLContext == null) && GLSurfaceView20.targetGLESVersion > 2) {
        Log.w(GLSurfaceView20.TAG, "Falling back to GLES 2");
        GLSurfaceView20.targetGLESVersion = 2;
        return createContext(param1EGL10, param1EGLDisplay, param1EGLConfig);
      } 
      String str1 = GLSurfaceView20.TAG;
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Returning a GLES ");
      stringBuilder1.append(GLSurfaceView20.targetGLESVersion);
      stringBuilder1.append(" context");
      Log.w(str1, stringBuilder1.toString());
      return eGLContext;
    }
    
    public void destroyContext(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLContext param1EGLContext) { param1EGL10.eglDestroyContext(param1EGLDisplay, param1EGLContext); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */