package com.badlogic.gdx.backends.android.surfaceview;

import android.content.Context;
import android.opengl.GLDebugHelper;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.io.Writer;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GLSurfaceViewAPI18 extends SurfaceView implements SurfaceHolder.Callback {
  public static final int DEBUG_CHECK_GL_ERROR = 1;
  
  public static final int DEBUG_LOG_GL_CALLS = 2;
  
  private static final boolean LOG_ATTACH_DETACH = false;
  
  private static final boolean LOG_EGL = false;
  
  private static final boolean LOG_PAUSE_RESUME = false;
  
  private static final boolean LOG_RENDERER = false;
  
  private static final boolean LOG_RENDERER_DRAW_FRAME = false;
  
  private static final boolean LOG_SURFACE = false;
  
  private static final boolean LOG_THREADS = false;
  
  public static final int RENDERMODE_CONTINUOUSLY = 1;
  
  public static final int RENDERMODE_WHEN_DIRTY = 0;
  
  private static final String TAG = "GLSurfaceViewAPI18";
  
  private static final GLThreadManager sGLThreadManager = new GLThreadManager(null);
  
  private int mDebugFlags;
  
  private boolean mDetached;
  
  private GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
  
  private int mEGLContextClientVersion;
  
  private EGLContextFactory mEGLContextFactory;
  
  private EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
  
  private GLThread mGLThread;
  
  private GLWrapper mGLWrapper;
  
  private boolean mPreserveEGLContextOnPause;
  
  private GLSurfaceView.Renderer mRenderer;
  
  private final WeakReference<GLSurfaceViewAPI18> mThisWeakRef = new WeakReference(this);
  
  public GLSurfaceViewAPI18(Context paramContext) {
    super(paramContext);
    init();
  }
  
  public GLSurfaceViewAPI18(Context paramContext, AttributeSet paramAttributeSet) {
    super(paramContext, paramAttributeSet);
    init();
  }
  
  private void checkRenderThreadState() {
    if (this.mGLThread == null)
      return; 
    throw new IllegalStateException("setRenderer has already been called for this instance.");
  }
  
  private void init() {
    SurfaceHolder surfaceHolder = getHolder();
    surfaceHolder.addCallback(this);
    if (Build.VERSION.SDK_INT <= 8)
      surfaceHolder.setFormat(4); 
  }
  
  protected void finalize() {
    try {
      if (this.mGLThread != null)
        this.mGLThread.requestExitAndWait(); 
      return;
    } finally {
      super.finalize();
    } 
  }
  
  public int getDebugFlags() { return this.mDebugFlags; }
  
  public boolean getPreserveEGLContextOnPause() { return this.mPreserveEGLContextOnPause; }
  
  public int getRenderMode() { return this.mGLThread.getRenderMode(); }
  
  protected void onAttachedToWindow() {
    super.onAttachedToWindow();
    if (this.mDetached && this.mRenderer != null) {
      byte b;
      GLThread gLThread = this.mGLThread;
      if (gLThread != null) {
        b = gLThread.getRenderMode();
      } else {
        b = 1;
      } 
      this.mGLThread = new GLThread(this.mThisWeakRef);
      if (b != 1)
        this.mGLThread.setRenderMode(b); 
      this.mGLThread.start();
    } 
    this.mDetached = false;
  }
  
  protected void onDetachedFromWindow() {
    GLThread gLThread = this.mGLThread;
    if (gLThread != null)
      gLThread.requestExitAndWait(); 
    this.mDetached = true;
    super.onDetachedFromWindow();
  }
  
  public void onPause() { this.mGLThread.onPause(); }
  
  public void onResume() { this.mGLThread.onResume(); }
  
  public void queueEvent(Runnable paramRunnable) { this.mGLThread.queueEvent(paramRunnable); }
  
  public void requestRender() { this.mGLThread.requestRender(); }
  
  public void setDebugFlags(int paramInt) { this.mDebugFlags = paramInt; }
  
  public void setEGLConfigChooser(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) { setEGLConfigChooser(new ComponentSizeChooser(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6)); }
  
  public void setEGLConfigChooser(GLSurfaceView.EGLConfigChooser paramEGLConfigChooser) {
    checkRenderThreadState();
    this.mEGLConfigChooser = paramEGLConfigChooser;
  }
  
  public void setEGLConfigChooser(boolean paramBoolean) { setEGLConfigChooser(new SimpleEGLConfigChooser(paramBoolean)); }
  
  public void setEGLContextClientVersion(int paramInt) {
    checkRenderThreadState();
    this.mEGLContextClientVersion = paramInt;
  }
  
  public void setEGLContextFactory(EGLContextFactory paramEGLContextFactory) {
    checkRenderThreadState();
    this.mEGLContextFactory = paramEGLContextFactory;
  }
  
  public void setEGLWindowSurfaceFactory(EGLWindowSurfaceFactory paramEGLWindowSurfaceFactory) {
    checkRenderThreadState();
    this.mEGLWindowSurfaceFactory = paramEGLWindowSurfaceFactory;
  }
  
  public void setGLWrapper(GLWrapper paramGLWrapper) { this.mGLWrapper = paramGLWrapper; }
  
  public void setPreserveEGLContextOnPause(boolean paramBoolean) { this.mPreserveEGLContextOnPause = paramBoolean; }
  
  public void setRenderMode(int paramInt) { this.mGLThread.setRenderMode(paramInt); }
  
  public void setRenderer(GLSurfaceView.Renderer paramRenderer) {
    checkRenderThreadState();
    if (this.mEGLConfigChooser == null)
      this.mEGLConfigChooser = new SimpleEGLConfigChooser(true); 
    if (this.mEGLContextFactory == null)
      this.mEGLContextFactory = new DefaultContextFactory(null); 
    if (this.mEGLWindowSurfaceFactory == null)
      this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory(null); 
    this.mRenderer = paramRenderer;
    this.mGLThread = new GLThread(this.mThisWeakRef);
    this.mGLThread.start();
  }
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3) { this.mGLThread.onWindowResize(paramInt2, paramInt3); }
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder) { this.mGLThread.surfaceCreated(); }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder) { this.mGLThread.surfaceDestroyed(); }
  
  private abstract class BaseConfigChooser implements GLSurfaceView.EGLConfigChooser {
    protected int[] mConfigSpec;
    
    public BaseConfigChooser(int[] param1ArrayOfInt) { this.mConfigSpec = filterConfigSpec(param1ArrayOfInt); }
    
    private int[] filterConfigSpec(int[] param1ArrayOfInt) {
      if (GLSurfaceViewAPI18.this.mEGLContextClientVersion != 2)
        return param1ArrayOfInt; 
      int i = param1ArrayOfInt.length;
      int[] arrayOfInt = new int[i + 2];
      int j = i - 1;
      System.arraycopy(param1ArrayOfInt, 0, arrayOfInt, 0, j);
      arrayOfInt[j] = 12352;
      arrayOfInt[i] = 4;
      arrayOfInt[i + 1] = 12344;
      return arrayOfInt;
    }
    
    public EGLConfig chooseConfig(EGL10 param1EGL10, EGLDisplay param1EGLDisplay) {
      int[] arrayOfInt = new int[1];
      if (param1EGL10.eglChooseConfig(param1EGLDisplay, this.mConfigSpec, null, 0, arrayOfInt)) {
        int i = arrayOfInt[0];
        if (i > 0) {
          EGLConfig[] arrayOfEGLConfig = new EGLConfig[i];
          if (param1EGL10.eglChooseConfig(param1EGLDisplay, this.mConfigSpec, arrayOfEGLConfig, i, arrayOfInt)) {
            EGLConfig eGLConfig = chooseConfig(param1EGL10, param1EGLDisplay, arrayOfEGLConfig);
            if (eGLConfig != null)
              return eGLConfig; 
            throw new IllegalArgumentException("No config chosen");
          } 
          throw new IllegalArgumentException("eglChooseConfig#2 failed");
        } 
        throw new IllegalArgumentException("No configs match configSpec");
      } 
      throw new IllegalArgumentException("eglChooseConfig failed");
    }
    
    abstract EGLConfig chooseConfig(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig[] param1ArrayOfEGLConfig);
  }
  
  private class ComponentSizeChooser extends BaseConfigChooser {
    protected int mAlphaSize;
    
    protected int mBlueSize;
    
    protected int mDepthSize;
    
    protected int mGreenSize;
    
    protected int mRedSize;
    
    protected int mStencilSize;
    
    private int[] mValue = new int[1];
    
    public ComponentSizeChooser(int param1Int1, int param1Int2, int param1Int3, int param1Int4, int param1Int5, int param1Int6) {
      super(GLSurfaceViewAPI18.this, new int[] { 
            12324, param1Int1, 12323, param1Int2, 12322, param1Int3, 12321, param1Int4, 12325, param1Int5, 
            12326, param1Int6, 12344 });
      this.mRedSize = param1Int1;
      this.mGreenSize = param1Int2;
      this.mBlueSize = param1Int3;
      this.mAlphaSize = param1Int4;
      this.mDepthSize = param1Int5;
      this.mStencilSize = param1Int6;
    }
    
    private int findConfigAttrib(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig, int param1Int1, int param1Int2) { return param1EGL10.eglGetConfigAttrib(param1EGLDisplay, param1EGLConfig, param1Int1, this.mValue) ? this.mValue[0] : param1Int2; }
    
    public EGLConfig chooseConfig(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig[] param1ArrayOfEGLConfig) {
      int i = param1ArrayOfEGLConfig.length;
      for (byte b = 0; b < i; b++) {
        EGLConfig eGLConfig = param1ArrayOfEGLConfig[b];
        int j = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12325, 0);
        int k = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12326, 0);
        if (j >= this.mDepthSize && k >= this.mStencilSize) {
          int m = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12324, 0);
          int n = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12323, 0);
          k = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12322, 0);
          j = findConfigAttrib(param1EGL10, param1EGLDisplay, eGLConfig, 12321, 0);
          if (m == this.mRedSize && n == this.mGreenSize && k == this.mBlueSize && j == this.mAlphaSize)
            return eGLConfig; 
        } 
      } 
      return null;
    }
  }
  
  private class DefaultContextFactory implements EGLContextFactory {
    private int EGL_CONTEXT_CLIENT_VERSION = 12440;
    
    private DefaultContextFactory() {}
    
    public EGLContext createContext(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig) {
      int[] arrayOfInt = new int[3];
      arrayOfInt[0] = this.EGL_CONTEXT_CLIENT_VERSION;
      arrayOfInt[1] = GLSurfaceViewAPI18.this.mEGLContextClientVersion;
      arrayOfInt[2] = 12344;
      EGLContext eGLContext = EGL10.EGL_NO_CONTEXT;
      if (GLSurfaceViewAPI18.this.mEGLContextClientVersion == 0)
        arrayOfInt = null; 
      return param1EGL10.eglCreateContext(param1EGLDisplay, param1EGLConfig, eGLContext, arrayOfInt);
    }
    
    public void destroyContext(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLContext param1EGLContext) {
      if (!param1EGL10.eglDestroyContext(param1EGLDisplay, param1EGLContext)) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("display:");
        stringBuilder.append(param1EGLDisplay);
        stringBuilder.append(" context: ");
        stringBuilder.append(param1EGLContext);
        Log.e("DefaultContextFactory", stringBuilder.toString());
        GLSurfaceViewAPI18.EglHelper.throwEglException("eglDestroyContex", param1EGL10.eglGetError());
      } 
    }
  }
  
  private static class DefaultWindowSurfaceFactory implements EGLWindowSurfaceFactory {
    private DefaultWindowSurfaceFactory() {}
    
    public EGLSurface createWindowSurface(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig, Object param1Object) {
      EGL10 eGL10 = null;
      try {
        EGLSurface eGLSurface = param1EGL10.eglCreateWindowSurface(param1EGLDisplay, param1EGLConfig, param1Object, null);
      } catch (IllegalArgumentException param1EGL10) {
        Log.e("GLSurfaceViewAPI18", "eglCreateWindowSurface", param1EGL10);
        param1EGL10 = eGL10;
      } 
      return param1EGL10;
    }
    
    public void destroySurface(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLSurface param1EGLSurface) { param1EGL10.eglDestroySurface(param1EGLDisplay, param1EGLSurface); }
  }
  
  public static interface EGLContextFactory {
    EGLContext createContext(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig);
    
    void destroyContext(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLContext param1EGLContext);
  }
  
  public static interface EGLWindowSurfaceFactory {
    EGLSurface createWindowSurface(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLConfig param1EGLConfig, Object param1Object);
    
    void destroySurface(EGL10 param1EGL10, EGLDisplay param1EGLDisplay, EGLSurface param1EGLSurface);
  }
  
  private static class EglHelper {
    EGL10 mEgl;
    
    EGLConfig mEglConfig;
    
    EGLContext mEglContext;
    
    EGLDisplay mEglDisplay;
    
    EGLSurface mEglSurface;
    
    private WeakReference<GLSurfaceViewAPI18> mGLSurfaceViewWeakRef;
    
    public EglHelper(WeakReference<GLSurfaceViewAPI18> param1WeakReference) { this.mGLSurfaceViewWeakRef = param1WeakReference; }
    
    private void destroySurfaceImp() {
      EGLSurface eGLSurface = this.mEglSurface;
      if (eGLSurface != null && eGLSurface != EGL10.EGL_NO_SURFACE) {
        this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        GLSurfaceViewAPI18 gLSurfaceViewAPI18 = (GLSurfaceViewAPI18)this.mGLSurfaceViewWeakRef.get();
        if (gLSurfaceViewAPI18 != null)
          gLSurfaceViewAPI18.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface); 
        this.mEglSurface = null;
      } 
    }
    
    public static String formatEglError(String param1String, int param1Int) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(param1String);
      stringBuilder.append(" failed: ");
      stringBuilder.append(getErrorString(param1Int));
      return stringBuilder.toString();
    }
    
    private static String getErrorString(int param1Int) {
      StringBuilder stringBuilder;
      switch (param1Int) {
        default:
          stringBuilder = new StringBuilder();
          stringBuilder.append("0x");
          stringBuilder.append(Integer.toHexString(param1Int));
          return stringBuilder.toString();
        case 12302:
          return "EGL_CONTEXT_LOST";
        case 12301:
          return "EGL_BAD_SURFACE";
        case 12300:
          return "EGL_BAD_PARAMETER";
        case 12299:
          return "EGL_BAD_NATIVE_WINDOW";
        case 12298:
          return "EGL_BAD_NATIVE_PIXMAP";
        case 12297:
          return "EGL_BAD_MATCH";
        case 12296:
          return "EGL_BAD_DISPLAY";
        case 12295:
          return "EGL_BAD_CURRENT_SURFACE";
        case 12294:
          return "EGL_BAD_CONTEXT";
        case 12293:
          return "EGL_BAD_CONFIG";
        case 12292:
          return "EGL_BAD_ATTRIBUTE";
        case 12291:
          return "EGL_BAD_ALLOC";
        case 12290:
          return "EGL_BAD_ACCESS";
        case 12289:
          return "EGL_NOT_INITIALIZED";
        case 12288:
          break;
      } 
      return "EGL_SUCCESS";
    }
    
    public static void logEglErrorAsWarning(String param1String1, String param1String2, int param1Int) { Log.w(param1String1, formatEglError(param1String2, param1Int)); }
    
    private void throwEglException(String param1String) { throwEglException(param1String, this.mEgl.eglGetError()); }
    
    public static void throwEglException(String param1String, int param1Int) { throw new RuntimeException(formatEglError(param1String, param1Int)); }
    
    GL createGL() {
      GL gL1 = this.mEglContext.getGL();
      GLSurfaceViewAPI18 gLSurfaceViewAPI18 = (GLSurfaceViewAPI18)this.mGLSurfaceViewWeakRef.get();
      GL gL2 = gL1;
      if (gLSurfaceViewAPI18 != null) {
        GL gL = gL1;
        if (gLSurfaceViewAPI18.mGLWrapper != null)
          gL = gLSurfaceViewAPI18.mGLWrapper.wrap(gL1); 
        gL2 = gL;
        if ((gLSurfaceViewAPI18.mDebugFlags & 0x3) != 0) {
          GLSurfaceViewAPI18.LogWriter logWriter;
          byte b = 0;
          gL2 = null;
          if ((gLSurfaceViewAPI18.mDebugFlags & true) != 0)
            b = 1; 
          if ((gLSurfaceViewAPI18.mDebugFlags & 0x2) != 0)
            logWriter = new GLSurfaceViewAPI18.LogWriter(); 
          gL2 = GLDebugHelper.wrap(gL, b, logWriter);
        } 
      } 
      return gL2;
    }
    
    public boolean createSurface() {
      if (this.mEgl != null) {
        if (this.mEglDisplay != null) {
          if (this.mEglConfig != null) {
            destroySurfaceImp();
            GLSurfaceViewAPI18 gLSurfaceViewAPI18 = (GLSurfaceViewAPI18)this.mGLSurfaceViewWeakRef.get();
            if (gLSurfaceViewAPI18 != null) {
              this.mEglSurface = gLSurfaceViewAPI18.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, gLSurfaceViewAPI18.getHolder());
            } else {
              this.mEglSurface = null;
            } 
            EGLSurface eGLSurface1 = this.mEglSurface;
            if (eGLSurface1 == null || eGLSurface1 == EGL10.EGL_NO_SURFACE) {
              if (this.mEgl.eglGetError() == 12299)
                Log.e("EglHelper", "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."); 
              return false;
            } 
            EGL10 eGL10 = this.mEgl;
            EGLDisplay eGLDisplay = this.mEglDisplay;
            EGLSurface eGLSurface2 = this.mEglSurface;
            if (!eGL10.eglMakeCurrent(eGLDisplay, eGLSurface2, eGLSurface2, this.mEglContext)) {
              logEglErrorAsWarning("EGLHelper", "eglMakeCurrent", this.mEgl.eglGetError());
              return false;
            } 
            return true;
          } 
          throw new RuntimeException("mEglConfig not initialized");
        } 
        throw new RuntimeException("eglDisplay not initialized");
      } 
      throw new RuntimeException("egl not initialized");
    }
    
    public void destroySurface() { destroySurfaceImp(); }
    
    public void finish() {
      if (this.mEglContext != null) {
        GLSurfaceViewAPI18 gLSurfaceViewAPI18 = (GLSurfaceViewAPI18)this.mGLSurfaceViewWeakRef.get();
        if (gLSurfaceViewAPI18 != null)
          gLSurfaceViewAPI18.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext); 
        this.mEglContext = null;
      } 
      EGLDisplay eGLDisplay = this.mEglDisplay;
      if (eGLDisplay != null) {
        this.mEgl.eglTerminate(eGLDisplay);
        this.mEglDisplay = null;
      } 
    }
    
    public void start() {
      this.mEgl = (EGL10)EGLContext.getEGL();
      this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
      if (this.mEglDisplay != EGL10.EGL_NO_DISPLAY) {
        int[] arrayOfInt = new int[2];
        if (this.mEgl.eglInitialize(this.mEglDisplay, arrayOfInt)) {
          GLSurfaceViewAPI18 gLSurfaceViewAPI18 = (GLSurfaceViewAPI18)this.mGLSurfaceViewWeakRef.get();
          if (gLSurfaceViewAPI18 == null) {
            this.mEglConfig = null;
            this.mEglContext = null;
          } else {
            this.mEglConfig = gLSurfaceViewAPI18.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
            this.mEglContext = gLSurfaceViewAPI18.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig);
          } 
          EGLContext eGLContext = this.mEglContext;
          if (eGLContext == null || eGLContext == EGL10.EGL_NO_CONTEXT) {
            this.mEglContext = null;
            throwEglException("createContext");
          } 
          this.mEglSurface = null;
          return;
        } 
        throw new RuntimeException("eglInitialize failed");
      } 
      throw new RuntimeException("eglGetDisplay failed");
    }
    
    public int swap() { return !this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface) ? this.mEgl.eglGetError() : 12288; }
  }
  
  static class GLThread extends Thread {
    private GLSurfaceViewAPI18.EglHelper mEglHelper;
    
    private ArrayList<Runnable> mEventQueue = new ArrayList();
    
    private boolean mExited;
    
    private boolean mFinishedCreatingEglSurface;
    
    private WeakReference<GLSurfaceViewAPI18> mGLSurfaceViewWeakRef;
    
    private boolean mHasSurface;
    
    private boolean mHaveEglContext;
    
    private boolean mHaveEglSurface;
    
    private int mHeight = 0;
    
    private boolean mPaused;
    
    private boolean mRenderComplete;
    
    private int mRenderMode = 1;
    
    private boolean mRequestPaused;
    
    private boolean mRequestRender = true;
    
    private boolean mShouldExit;
    
    private boolean mShouldReleaseEglContext;
    
    private boolean mSizeChanged = true;
    
    private boolean mSurfaceIsBad;
    
    private boolean mWaitingForSurface;
    
    private int mWidth = 0;
    
    GLThread(WeakReference<GLSurfaceViewAPI18> param1WeakReference) { this.mGLSurfaceViewWeakRef = param1WeakReference; }
    
    private void guardedRun() { // Byte code:
      //   0: aload_0
      //   1: new com/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper
      //   4: dup
      //   5: aload_0
      //   6: getfield mGLSurfaceViewWeakRef : Ljava/lang/ref/WeakReference;
      //   9: invokespecial <init> : (Ljava/lang/ref/WeakReference;)V
      //   12: putfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   15: aload_0
      //   16: iconst_0
      //   17: putfield mHaveEglContext : Z
      //   20: aload_0
      //   21: iconst_0
      //   22: putfield mHaveEglSurface : Z
      //   25: iconst_0
      //   26: istore_1
      //   27: iconst_0
      //   28: istore_2
      //   29: iconst_0
      //   30: istore_3
      //   31: aconst_null
      //   32: astore #4
      //   34: iconst_0
      //   35: istore #5
      //   37: iconst_0
      //   38: istore #6
      //   40: iconst_0
      //   41: istore #7
      //   43: iconst_0
      //   44: istore #8
      //   46: iconst_0
      //   47: istore #9
      //   49: iconst_0
      //   50: istore #10
      //   52: iconst_0
      //   53: istore #11
      //   55: aconst_null
      //   56: astore #12
      //   58: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   61: astore #13
      //   63: aload #13
      //   65: monitorenter
      //   66: iload #11
      //   68: istore #14
      //   70: iload #7
      //   72: istore #11
      //   74: iload_2
      //   75: istore #7
      //   77: aload_0
      //   78: getfield mShouldExit : Z
      //   81: ifeq -> 115
      //   84: aload #13
      //   86: monitorexit
      //   87: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   90: astore #4
      //   92: aload #4
      //   94: monitorenter
      //   95: aload_0
      //   96: invokespecial stopEglSurfaceLocked : ()V
      //   99: aload_0
      //   100: invokespecial stopEglContextLocked : ()V
      //   103: aload #4
      //   105: monitorexit
      //   106: return
      //   107: astore #12
      //   109: aload #4
      //   111: monitorexit
      //   112: aload #12
      //   114: athrow
      //   115: aload_0
      //   116: getfield mEventQueue : Ljava/util/ArrayList;
      //   119: invokevirtual isEmpty : ()Z
      //   122: ifne -> 152
      //   125: aload_0
      //   126: getfield mEventQueue : Ljava/util/ArrayList;
      //   129: iconst_0
      //   130: invokevirtual remove : (I)Ljava/lang/Object;
      //   133: checkcast java/lang/Runnable
      //   136: astore #12
      //   138: iload #7
      //   140: istore_2
      //   141: iload #11
      //   143: istore #7
      //   145: iload #14
      //   147: istore #11
      //   149: goto -> 642
      //   152: aload_0
      //   153: getfield mPaused : Z
      //   156: aload_0
      //   157: getfield mRequestPaused : Z
      //   160: if_icmpeq -> 186
      //   163: aload_0
      //   164: getfield mRequestPaused : Z
      //   167: istore #15
      //   169: aload_0
      //   170: aload_0
      //   171: getfield mRequestPaused : Z
      //   174: putfield mPaused : Z
      //   177: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   180: invokevirtual notifyAll : ()V
      //   183: goto -> 189
      //   186: iconst_0
      //   187: istore #15
      //   189: aload_0
      //   190: getfield mShouldReleaseEglContext : Z
      //   193: ifeq -> 211
      //   196: aload_0
      //   197: invokespecial stopEglSurfaceLocked : ()V
      //   200: aload_0
      //   201: invokespecial stopEglContextLocked : ()V
      //   204: aload_0
      //   205: iconst_0
      //   206: putfield mShouldReleaseEglContext : Z
      //   209: iconst_1
      //   210: istore_3
      //   211: iload_1
      //   212: istore #16
      //   214: iload_1
      //   215: ifeq -> 229
      //   218: aload_0
      //   219: invokespecial stopEglSurfaceLocked : ()V
      //   222: aload_0
      //   223: invokespecial stopEglContextLocked : ()V
      //   226: iconst_0
      //   227: istore #16
      //   229: iload #15
      //   231: ifeq -> 245
      //   234: aload_0
      //   235: getfield mHaveEglSurface : Z
      //   238: ifeq -> 245
      //   241: aload_0
      //   242: invokespecial stopEglSurfaceLocked : ()V
      //   245: iload #15
      //   247: ifeq -> 305
      //   250: aload_0
      //   251: getfield mHaveEglContext : Z
      //   254: ifeq -> 305
      //   257: aload_0
      //   258: getfield mGLSurfaceViewWeakRef : Ljava/lang/ref/WeakReference;
      //   261: invokevirtual get : ()Ljava/lang/Object;
      //   264: checkcast com/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18
      //   267: astore #17
      //   269: aload #17
      //   271: ifnonnull -> 280
      //   274: iconst_0
      //   275: istore #18
      //   277: goto -> 287
      //   280: aload #17
      //   282: invokestatic access$900 : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;)Z
      //   285: istore #18
      //   287: iload #18
      //   289: ifeq -> 301
      //   292: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   295: invokevirtual shouldReleaseEGLContextWhenPausing : ()Z
      //   298: ifeq -> 305
      //   301: aload_0
      //   302: invokespecial stopEglContextLocked : ()V
      //   305: iload #15
      //   307: ifeq -> 326
      //   310: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   313: invokevirtual shouldTerminateEGLWhenPausing : ()Z
      //   316: ifeq -> 326
      //   319: aload_0
      //   320: getfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   323: invokevirtual finish : ()V
      //   326: aload_0
      //   327: getfield mHasSurface : Z
      //   330: ifne -> 367
      //   333: aload_0
      //   334: getfield mWaitingForSurface : Z
      //   337: ifne -> 367
      //   340: aload_0
      //   341: getfield mHaveEglSurface : Z
      //   344: ifeq -> 351
      //   347: aload_0
      //   348: invokespecial stopEglSurfaceLocked : ()V
      //   351: aload_0
      //   352: iconst_1
      //   353: putfield mWaitingForSurface : Z
      //   356: aload_0
      //   357: iconst_0
      //   358: putfield mSurfaceIsBad : Z
      //   361: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   364: invokevirtual notifyAll : ()V
      //   367: aload_0
      //   368: getfield mHasSurface : Z
      //   371: ifeq -> 392
      //   374: aload_0
      //   375: getfield mWaitingForSurface : Z
      //   378: ifeq -> 392
      //   381: aload_0
      //   382: iconst_0
      //   383: putfield mWaitingForSurface : Z
      //   386: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   389: invokevirtual notifyAll : ()V
      //   392: iload #7
      //   394: istore_2
      //   395: iload #7
      //   397: ifeq -> 416
      //   400: aload_0
      //   401: iconst_1
      //   402: putfield mRenderComplete : Z
      //   405: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   408: invokevirtual notifyAll : ()V
      //   411: iconst_0
      //   412: istore_2
      //   413: iconst_0
      //   414: istore #14
      //   416: iload_3
      //   417: istore #19
      //   419: iload #11
      //   421: istore #20
      //   423: iload #8
      //   425: istore #21
      //   427: iload #9
      //   429: istore #22
      //   431: iload #10
      //   433: istore #23
      //   435: aload_0
      //   436: invokespecial readyToDraw : ()Z
      //   439: ifeq -> 1077
      //   442: iload_3
      //   443: istore_1
      //   444: iload #11
      //   446: istore #7
      //   448: aload_0
      //   449: getfield mHaveEglContext : Z
      //   452: ifne -> 526
      //   455: iload_3
      //   456: ifeq -> 468
      //   459: iconst_0
      //   460: istore_1
      //   461: iload #11
      //   463: istore #7
      //   465: goto -> 526
      //   468: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   471: aload_0
      //   472: invokevirtual tryAcquireEglContextLocked : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThread;)Z
      //   475: istore #15
      //   477: iload_3
      //   478: istore_1
      //   479: iload #11
      //   481: istore #7
      //   483: iload #15
      //   485: ifeq -> 526
      //   488: aload_0
      //   489: getfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   492: invokevirtual start : ()V
      //   495: aload_0
      //   496: iconst_1
      //   497: putfield mHaveEglContext : Z
      //   500: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   503: invokevirtual notifyAll : ()V
      //   506: iconst_1
      //   507: istore #7
      //   509: iload_3
      //   510: istore_1
      //   511: goto -> 526
      //   514: astore #4
      //   516: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   519: aload_0
      //   520: invokevirtual releaseEglContextLocked : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThread;)V
      //   523: aload #4
      //   525: athrow
      //   526: aload_0
      //   527: getfield mHaveEglContext : Z
      //   530: ifeq -> 557
      //   533: aload_0
      //   534: getfield mHaveEglSurface : Z
      //   537: ifne -> 557
      //   540: aload_0
      //   541: iconst_1
      //   542: putfield mHaveEglSurface : Z
      //   545: iconst_1
      //   546: istore #10
      //   548: iconst_1
      //   549: istore #9
      //   551: iconst_1
      //   552: istore #8
      //   554: goto -> 569
      //   557: iload #8
      //   559: istore #11
      //   561: iload #10
      //   563: istore #8
      //   565: iload #11
      //   567: istore #10
      //   569: aload_0
      //   570: getfield mHaveEglSurface : Z
      //   573: ifeq -> 1058
      //   576: aload_0
      //   577: getfield mSizeChanged : Z
      //   580: ifeq -> 612
      //   583: aload_0
      //   584: getfield mWidth : I
      //   587: istore #5
      //   589: aload_0
      //   590: getfield mHeight : I
      //   593: istore #6
      //   595: aload_0
      //   596: iconst_0
      //   597: putfield mSizeChanged : Z
      //   600: iconst_1
      //   601: istore #10
      //   603: iconst_1
      //   604: istore #8
      //   606: iconst_1
      //   607: istore #11
      //   609: goto -> 616
      //   612: iload #14
      //   614: istore #11
      //   616: aload_0
      //   617: iconst_0
      //   618: putfield mRequestRender : Z
      //   621: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   624: invokevirtual notifyAll : ()V
      //   627: iload #10
      //   629: istore_3
      //   630: iload #8
      //   632: istore #10
      //   634: iload_3
      //   635: istore #8
      //   637: iload_1
      //   638: istore_3
      //   639: iload #16
      //   641: istore_1
      //   642: aload #13
      //   644: monitorexit
      //   645: aload #12
      //   647: ifnull -> 660
      //   650: aload #12
      //   652: invokeinterface run : ()V
      //   657: goto -> 55
      //   660: iload #8
      //   662: istore #16
      //   664: iload #8
      //   666: ifeq -> 769
      //   669: aload_0
      //   670: getfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   673: invokevirtual createSurface : ()Z
      //   676: ifeq -> 715
      //   679: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   682: astore #13
      //   684: aload #13
      //   686: monitorenter
      //   687: aload_0
      //   688: iconst_1
      //   689: putfield mFinishedCreatingEglSurface : Z
      //   692: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   695: invokevirtual notifyAll : ()V
      //   698: aload #13
      //   700: monitorexit
      //   701: iconst_0
      //   702: istore #16
      //   704: goto -> 769
      //   707: astore #4
      //   709: aload #13
      //   711: monitorexit
      //   712: aload #4
      //   714: athrow
      //   715: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   718: astore #13
      //   720: aload #13
      //   722: monitorenter
      //   723: aload_0
      //   724: iconst_1
      //   725: putfield mFinishedCreatingEglSurface : Z
      //   728: aload_0
      //   729: iconst_1
      //   730: putfield mSurfaceIsBad : Z
      //   733: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   736: invokevirtual notifyAll : ()V
      //   739: aload #13
      //   741: monitorexit
      //   742: iload #8
      //   744: istore #14
      //   746: aload #4
      //   748: astore #13
      //   750: aload #13
      //   752: astore #4
      //   754: iload #14
      //   756: istore #8
      //   758: goto -> 58
      //   761: astore #4
      //   763: aload #13
      //   765: monitorexit
      //   766: aload #4
      //   768: athrow
      //   769: iload #9
      //   771: istore #8
      //   773: iload #9
      //   775: ifeq -> 801
      //   778: aload_0
      //   779: getfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   782: invokevirtual createGL : ()Ljavax/microedition/khronos/opengles/GL;
      //   785: checkcast javax/microedition/khronos/opengles/GL10
      //   788: astore #4
      //   790: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   793: aload #4
      //   795: invokevirtual checkGLDriver : (Ljavax/microedition/khronos/opengles/GL10;)V
      //   798: iconst_0
      //   799: istore #8
      //   801: iload #7
      //   803: istore #19
      //   805: iload #7
      //   807: ifeq -> 849
      //   810: aload_0
      //   811: getfield mGLSurfaceViewWeakRef : Ljava/lang/ref/WeakReference;
      //   814: invokevirtual get : ()Ljava/lang/Object;
      //   817: checkcast com/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18
      //   820: astore #13
      //   822: aload #13
      //   824: ifnull -> 846
      //   827: aload #13
      //   829: invokestatic access$1000 : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;)Landroid/opengl/GLSurfaceView$Renderer;
      //   832: aload #4
      //   834: aload_0
      //   835: getfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   838: getfield mEglConfig : Ljavax/microedition/khronos/egl/EGLConfig;
      //   841: invokeinterface onSurfaceCreated : (Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
      //   846: iconst_0
      //   847: istore #19
      //   849: iload #10
      //   851: istore #23
      //   853: iload #10
      //   855: ifeq -> 894
      //   858: aload_0
      //   859: getfield mGLSurfaceViewWeakRef : Ljava/lang/ref/WeakReference;
      //   862: invokevirtual get : ()Ljava/lang/Object;
      //   865: checkcast com/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18
      //   868: astore #13
      //   870: aload #13
      //   872: ifnull -> 891
      //   875: aload #13
      //   877: invokestatic access$1000 : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;)Landroid/opengl/GLSurfaceView$Renderer;
      //   880: aload #4
      //   882: iload #5
      //   884: iload #6
      //   886: invokeinterface onSurfaceChanged : (Ljavax/microedition/khronos/opengles/GL10;II)V
      //   891: iconst_0
      //   892: istore #23
      //   894: aload_0
      //   895: getfield mGLSurfaceViewWeakRef : Ljava/lang/ref/WeakReference;
      //   898: invokevirtual get : ()Ljava/lang/Object;
      //   901: checkcast com/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18
      //   904: astore #13
      //   906: aload #13
      //   908: ifnull -> 923
      //   911: aload #13
      //   913: invokestatic access$1000 : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;)Landroid/opengl/GLSurfaceView$Renderer;
      //   916: aload #4
      //   918: invokeinterface onDrawFrame : (Ljavax/microedition/khronos/opengles/GL10;)V
      //   923: aload_0
      //   924: getfield mEglHelper : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EglHelper;
      //   927: invokevirtual swap : ()I
      //   930: istore #10
      //   932: iload #10
      //   934: sipush #12288
      //   937: if_icmpeq -> 999
      //   940: iload #10
      //   942: sipush #12302
      //   945: if_icmpeq -> 993
      //   948: ldc 'GLThread'
      //   950: ldc 'eglSwapBuffers'
      //   952: iload #10
      //   954: invokestatic logEglErrorAsWarning : (Ljava/lang/String;Ljava/lang/String;I)V
      //   957: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   960: astore #13
      //   962: aload #13
      //   964: monitorenter
      //   965: aload_0
      //   966: iconst_1
      //   967: putfield mSurfaceIsBad : Z
      //   970: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   973: invokevirtual notifyAll : ()V
      //   976: aload #13
      //   978: monitorexit
      //   979: iload_1
      //   980: istore #22
      //   982: goto -> 1002
      //   985: astore #4
      //   987: aload #13
      //   989: monitorexit
      //   990: aload #4
      //   992: athrow
      //   993: iconst_1
      //   994: istore #22
      //   996: goto -> 1002
      //   999: iload_1
      //   1000: istore #22
      //   1002: iload #22
      //   1004: istore_1
      //   1005: aload #4
      //   1007: astore #13
      //   1009: iload #19
      //   1011: istore #7
      //   1013: iload #16
      //   1015: istore #14
      //   1017: iload #8
      //   1019: istore #9
      //   1021: iload #23
      //   1023: istore #10
      //   1025: iload #11
      //   1027: ifeq -> 750
      //   1030: iconst_1
      //   1031: istore_2
      //   1032: iload #22
      //   1034: istore_1
      //   1035: aload #4
      //   1037: astore #13
      //   1039: iload #19
      //   1041: istore #7
      //   1043: iload #16
      //   1045: istore #14
      //   1047: iload #8
      //   1049: istore #9
      //   1051: iload #23
      //   1053: istore #10
      //   1055: goto -> 750
      //   1058: iload #8
      //   1060: istore #23
      //   1062: iload #9
      //   1064: istore #22
      //   1066: iload #10
      //   1068: istore #21
      //   1070: iload #7
      //   1072: istore #20
      //   1074: iload_1
      //   1075: istore #19
      //   1077: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   1080: invokevirtual wait : ()V
      //   1083: iload #16
      //   1085: istore_1
      //   1086: iload_2
      //   1087: istore #7
      //   1089: iload #19
      //   1091: istore_3
      //   1092: iload #20
      //   1094: istore #11
      //   1096: iload #21
      //   1098: istore #8
      //   1100: iload #22
      //   1102: istore #9
      //   1104: iload #23
      //   1106: istore #10
      //   1108: goto -> 77
      //   1111: astore #4
      //   1113: aload #13
      //   1115: monitorexit
      //   1116: aload #4
      //   1118: athrow
      //   1119: astore #12
      //   1121: invokestatic access$800 : ()Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThreadManager;
      //   1124: astore #4
      //   1126: aload #4
      //   1128: monitorenter
      //   1129: aload_0
      //   1130: invokespecial stopEglSurfaceLocked : ()V
      //   1133: aload_0
      //   1134: invokespecial stopEglContextLocked : ()V
      //   1137: aload #4
      //   1139: monitorexit
      //   1140: aload #12
      //   1142: athrow
      //   1143: astore #12
      //   1145: aload #4
      //   1147: monitorexit
      //   1148: goto -> 1154
      //   1151: aload #12
      //   1153: athrow
      //   1154: goto -> 1151
      // Exception table:
      //   from	to	target	type
      //   58	66	1119	finally
      //   77	87	1111	finally
      //   95	106	107	finally
      //   109	112	107	finally
      //   115	138	1111	finally
      //   152	183	1111	finally
      //   189	209	1111	finally
      //   218	226	1111	finally
      //   234	245	1111	finally
      //   250	269	1111	finally
      //   280	287	1111	finally
      //   292	301	1111	finally
      //   301	305	1111	finally
      //   310	326	1111	finally
      //   326	351	1111	finally
      //   351	367	1111	finally
      //   367	392	1111	finally
      //   400	411	1111	finally
      //   435	442	1111	finally
      //   448	455	1111	finally
      //   468	477	1111	finally
      //   488	495	514	java/lang/RuntimeException
      //   488	495	1111	finally
      //   495	506	1111	finally
      //   516	526	1111	finally
      //   526	545	1111	finally
      //   569	600	1111	finally
      //   616	627	1111	finally
      //   642	645	1111	finally
      //   650	657	1119	finally
      //   669	687	1119	finally
      //   687	701	707	finally
      //   709	712	707	finally
      //   712	715	1119	finally
      //   715	723	1119	finally
      //   723	742	761	finally
      //   763	766	761	finally
      //   766	769	1119	finally
      //   778	798	1119	finally
      //   810	822	1119	finally
      //   827	846	1119	finally
      //   858	870	1119	finally
      //   875	891	1119	finally
      //   894	906	1119	finally
      //   911	923	1119	finally
      //   923	932	1119	finally
      //   948	965	1119	finally
      //   965	979	985	finally
      //   987	990	985	finally
      //   990	993	1119	finally
      //   1077	1083	1111	finally
      //   1113	1116	1111	finally
      //   1116	1119	1119	finally
      //   1129	1140	1143	finally
      //   1145	1148	1143	finally }
    
    private boolean readyToDraw() {
      null = this.mPaused;
      boolean bool = true;
      if (!null && this.mHasSurface && !this.mSurfaceIsBad && this.mWidth > 0 && this.mHeight > 0) {
        null = bool;
        if (!this.mRequestRender) {
          if (this.mRenderMode == 1)
            return bool; 
        } else {
          return null;
        } 
      } 
      return false;
    }
    
    private void stopEglContextLocked() {
      if (this.mHaveEglContext) {
        this.mEglHelper.finish();
        this.mHaveEglContext = false;
        sGLThreadManager.releaseEglContextLocked(this);
      } 
    }
    
    private void stopEglSurfaceLocked() {
      if (this.mHaveEglSurface) {
        this.mHaveEglSurface = false;
        this.mEglHelper.destroySurface();
      } 
    }
    
    public boolean ableToDraw() {
      boolean bool;
      if (this.mHaveEglContext && this.mHaveEglSurface && readyToDraw()) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public int getRenderMode() {
      synchronized (sGLThreadManager) {
        return this.mRenderMode;
      } 
    }
    
    public void onPause() {
      synchronized (sGLThreadManager) {
        this.mRequestPaused = true;
        sGLThreadManager.notifyAll();
        while (!this.mExited) {
          boolean bool = this.mPaused;
          if (!bool)
            try {
              sGLThreadManager.wait();
            } catch (InterruptedException interruptedException) {
              Thread.currentThread().interrupt();
            }  
        } 
        return;
      } 
    }
    
    public void onResume() {
      synchronized (sGLThreadManager) {
        this.mRequestPaused = false;
        this.mRequestRender = true;
        this.mRenderComplete = false;
        sGLThreadManager.notifyAll();
        while (!this.mExited && this.mPaused) {
          boolean bool = this.mRenderComplete;
          if (!bool)
            try {
              sGLThreadManager.wait();
            } catch (InterruptedException interruptedException) {
              Thread.currentThread().interrupt();
            }  
        } 
        return;
      } 
    }
    
    public void onWindowResize(int param1Int1, int param1Int2) {
      synchronized (sGLThreadManager) {
        this.mWidth = param1Int1;
        this.mHeight = param1Int2;
        this.mSizeChanged = true;
        this.mRequestRender = true;
        this.mRenderComplete = false;
        sGLThreadManager.notifyAll();
        while (!this.mExited && !this.mPaused && !this.mRenderComplete) {
          boolean bool = ableToDraw();
          if (bool)
            try {
              sGLThreadManager.wait();
            } catch (InterruptedException interruptedException) {
              Thread.currentThread().interrupt();
            }  
        } 
        return;
      } 
    }
    
    public void queueEvent(Runnable param1Runnable) {
      if (param1Runnable != null)
        synchronized (sGLThreadManager) {
          this.mEventQueue.add(param1Runnable);
          sGLThreadManager.notifyAll();
          return;
        }  
      throw new IllegalArgumentException("r must not be null");
    }
    
    public void requestExitAndWait() {
      synchronized (sGLThreadManager) {
        this.mShouldExit = true;
        sGLThreadManager.notifyAll();
        while (true) {
          boolean bool = this.mExited;
          if (!bool)
            try {
              sGLThreadManager.wait();
              continue;
            } catch (InterruptedException interruptedException) {
              Thread.currentThread().interrupt();
              continue;
            }  
          break;
        } 
        return;
      } 
    }
    
    public void requestReleaseEglContextLocked() {
      this.mShouldReleaseEglContext = true;
      sGLThreadManager.notifyAll();
    }
    
    public void requestRender() {
      synchronized (sGLThreadManager) {
        this.mRequestRender = true;
        sGLThreadManager.notifyAll();
        return;
      } 
    }
    
    public void run() {
      null = new StringBuilder();
      null.append("GLThread ");
      null.append(getId());
      setName(null.toString());
      try {
      
      } catch (InterruptedException null) {
      
      } finally {
        sGLThreadManager.threadExiting(this);
      } 
      sGLThreadManager.threadExiting(this);
    }
    
    public void setRenderMode(int param1Int) {
      if (param1Int >= 0 && param1Int <= 1)
        synchronized (sGLThreadManager) {
          this.mRenderMode = param1Int;
          sGLThreadManager.notifyAll();
          return;
        }  
      throw new IllegalArgumentException("renderMode");
    }
    
    public void surfaceCreated() {
      synchronized (sGLThreadManager) {
        this.mHasSurface = true;
        this.mFinishedCreatingEglSurface = false;
        sGLThreadManager.notifyAll();
        while (this.mWaitingForSurface && !this.mFinishedCreatingEglSurface) {
          boolean bool = this.mExited;
          if (!bool)
            try {
              sGLThreadManager.wait();
            } catch (InterruptedException interruptedException) {
              Thread.currentThread().interrupt();
            }  
        } 
        return;
      } 
    }
    
    public void surfaceDestroyed() {
      synchronized (sGLThreadManager) {
        this.mHasSurface = false;
        sGLThreadManager.notifyAll();
        while (!this.mWaitingForSurface) {
          boolean bool = this.mExited;
          if (!bool)
            try {
              sGLThreadManager.wait();
            } catch (InterruptedException interruptedException) {
              Thread.currentThread().interrupt();
            }  
        } 
        return;
      } 
    }
  }
  
  private static class GLThreadManager {
    private static String TAG = "GLThreadManager";
    
    private static final int kGLES_20 = 131072;
    
    private static final String kMSM7K_RENDERER_PREFIX = "Q3Dimension MSM7500 ";
    
    private GLSurfaceViewAPI18.GLThread mEglOwner;
    
    private boolean mGLESDriverCheckComplete;
    
    private int mGLESVersion;
    
    private boolean mGLESVersionCheckComplete;
    
    private boolean mLimitedGLESContexts;
    
    private boolean mMultipleGLESContextsAllowed;
    
    static  {
    
    }
    
    private GLThreadManager() {}
    
    private void checkGLESVersion() {
      if (!this.mGLESVersionCheckComplete) {
        this.mGLESVersion = 131072;
        if (this.mGLESVersion >= 131072)
          this.mMultipleGLESContextsAllowed = true; 
        this.mGLESVersionCheckComplete = true;
      } 
    }
    
    public void checkGLDriver(GL10 param1GL10) { // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield mGLESDriverCheckComplete : Z
      //   6: ifne -> 88
      //   9: aload_0
      //   10: invokespecial checkGLESVersion : ()V
      //   13: aload_1
      //   14: sipush #7937
      //   17: invokeinterface glGetString : (I)Ljava/lang/String;
      //   22: astore_1
      //   23: aload_0
      //   24: getfield mGLESVersion : I
      //   27: istore_2
      //   28: iconst_0
      //   29: istore_3
      //   30: iload_2
      //   31: ldc 131072
      //   33: if_icmpge -> 64
      //   36: aload_1
      //   37: ldc 'Q3Dimension MSM7500 '
      //   39: invokevirtual startsWith : (Ljava/lang/String;)Z
      //   42: ifne -> 51
      //   45: iconst_1
      //   46: istore #4
      //   48: goto -> 54
      //   51: iconst_0
      //   52: istore #4
      //   54: aload_0
      //   55: iload #4
      //   57: putfield mMultipleGLESContextsAllowed : Z
      //   60: aload_0
      //   61: invokevirtual notifyAll : ()V
      //   64: iload_3
      //   65: istore #4
      //   67: aload_0
      //   68: getfield mMultipleGLESContextsAllowed : Z
      //   71: ifne -> 77
      //   74: iconst_1
      //   75: istore #4
      //   77: aload_0
      //   78: iload #4
      //   80: putfield mLimitedGLESContexts : Z
      //   83: aload_0
      //   84: iconst_1
      //   85: putfield mGLESDriverCheckComplete : Z
      //   88: aload_0
      //   89: monitorexit
      //   90: return
      //   91: astore_1
      //   92: aload_0
      //   93: monitorexit
      //   94: aload_1
      //   95: athrow
      // Exception table:
      //   from	to	target	type
      //   2	28	91	finally
      //   36	45	91	finally
      //   54	64	91	finally
      //   67	74	91	finally
      //   77	88	91	finally }
    
    public void releaseEglContextLocked(GLSurfaceViewAPI18.GLThread param1GLThread) {
      if (this.mEglOwner == param1GLThread)
        this.mEglOwner = null; 
      notifyAll();
    }
    
    public boolean shouldReleaseEGLContextWhenPausing() { // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield mLimitedGLESContexts : Z
      //   6: istore_1
      //   7: aload_0
      //   8: monitorexit
      //   9: iload_1
      //   10: ireturn
      //   11: astore_2
      //   12: aload_0
      //   13: monitorexit
      //   14: aload_2
      //   15: athrow
      // Exception table:
      //   from	to	target	type
      //   2	7	11	finally }
    
    public boolean shouldTerminateEGLWhenPausing() { // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: invokespecial checkGLESVersion : ()V
      //   6: aload_0
      //   7: getfield mMultipleGLESContextsAllowed : Z
      //   10: istore_1
      //   11: aload_0
      //   12: monitorexit
      //   13: iload_1
      //   14: iconst_1
      //   15: ixor
      //   16: ireturn
      //   17: astore_2
      //   18: aload_0
      //   19: monitorexit
      //   20: aload_2
      //   21: athrow
      // Exception table:
      //   from	to	target	type
      //   2	11	17	finally }
    
    public void threadExiting(GLSurfaceViewAPI18.GLThread param1GLThread) { // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_1
      //   3: iconst_1
      //   4: invokestatic access$1102 : (Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThread;Z)Z
      //   7: pop
      //   8: aload_0
      //   9: getfield mEglOwner : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThread;
      //   12: aload_1
      //   13: if_acmpne -> 21
      //   16: aload_0
      //   17: aconst_null
      //   18: putfield mEglOwner : Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$GLThread;
      //   21: aload_0
      //   22: invokevirtual notifyAll : ()V
      //   25: aload_0
      //   26: monitorexit
      //   27: return
      //   28: astore_1
      //   29: aload_0
      //   30: monitorexit
      //   31: aload_1
      //   32: athrow
      // Exception table:
      //   from	to	target	type
      //   2	21	28	finally
      //   21	25	28	finally }
    
    public boolean tryAcquireEglContextLocked(GLSurfaceViewAPI18.GLThread param1GLThread) {
      GLSurfaceViewAPI18.GLThread gLThread = this.mEglOwner;
      if (gLThread == param1GLThread || gLThread == null) {
        this.mEglOwner = param1GLThread;
        notifyAll();
        return true;
      } 
      checkGLESVersion();
      if (this.mMultipleGLESContextsAllowed)
        return true; 
      param1GLThread = this.mEglOwner;
      if (param1GLThread != null)
        param1GLThread.requestReleaseEglContextLocked(); 
      return false;
    }
  }
  
  public static interface GLWrapper {
    GL wrap(GL param1GL);
  }
  
  static class LogWriter extends Writer {
    private StringBuilder mBuilder = new StringBuilder();
    
    private void flushBuilder() {
      if (this.mBuilder.length() > 0) {
        Log.v("GLSurfaceView", this.mBuilder.toString());
        StringBuilder stringBuilder = this.mBuilder;
        stringBuilder.delete(0, stringBuilder.length());
      } 
    }
    
    public void close() { flushBuilder(); }
    
    public void flush() { flushBuilder(); }
    
    public void write(char[] param1ArrayOfChar, int param1Int1, int param1Int2) {
      for (int i = 0; i < param1Int2; i++) {
        char c = param1ArrayOfChar[param1Int1 + i];
        if (c == '\n') {
          flushBuilder();
        } else {
          this.mBuilder.append(c);
        } 
      } 
    }
  }
  
  private class SimpleEGLConfigChooser extends ComponentSizeChooser {
    public SimpleEGLConfigChooser(boolean param1Boolean) { super(GLSurfaceViewAPI18.this, 8, 8, 8, 0, b, 0); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */