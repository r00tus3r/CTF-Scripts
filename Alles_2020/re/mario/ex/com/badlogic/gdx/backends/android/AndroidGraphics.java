package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.os.Process;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.LifecycleListener;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20API18;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18;
import com.badlogic.gdx.backends.android.surfaceview.GdxEglConfigChooser;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.Cursor;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.TextureArray;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.graphics.glutils.GLVersion;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.WindowedMean;
import com.badlogic.gdx.utils.GdxRuntimeException;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;

public class AndroidGraphics implements Graphics, GLSurfaceView.Renderer {
  private static final String LOG_TAG = "AndroidGraphics";
  
  AndroidApplicationBase app;
  
  private Graphics.BufferFormat bufferFormat = new Graphics.BufferFormat(5, 6, 5, false, 16, false, false, false);
  
  protected final AndroidApplicationConfiguration config;
  
  protected float deltaTime = 0.0F;
  
  private float density = 1.0F;
  
  EGLContext eglContext;
  
  String extensions;
  
  protected int fps;
  
  protected long frameId = -1L;
  
  protected long frameStart = System.nanoTime();
  
  protected int frames = 0;
  
  GL20 gl20;
  
  GL30 gl30;
  
  GLVersion glVersion;
  
  int height;
  
  private boolean isContinuous = true;
  
  protected long lastFrameTime = System.nanoTime();
  
  protected WindowedMean mean = new WindowedMean(5);
  
  private float ppcX = 0.0F;
  
  private float ppcY = 0.0F;
  
  private float ppiX = 0.0F;
  
  private float ppiY = 0.0F;
  
  Object synch = new Object();
  
  int[] value = new int[1];
  
  final View view;
  
  int width;
  
  static  {
  
  }
  
  public AndroidGraphics(AndroidApplicationBase paramAndroidApplicationBase, AndroidApplicationConfiguration paramAndroidApplicationConfiguration, ResolutionStrategy paramResolutionStrategy) { this(paramAndroidApplicationBase, paramAndroidApplicationConfiguration, paramResolutionStrategy, true); }
  
  public AndroidGraphics(AndroidApplicationBase paramAndroidApplicationBase, AndroidApplicationConfiguration paramAndroidApplicationConfiguration, ResolutionStrategy paramResolutionStrategy, boolean paramBoolean) {
    this.config = paramAndroidApplicationConfiguration;
    this.app = paramAndroidApplicationBase;
    this.view = createGLSurfaceView(paramAndroidApplicationBase, paramResolutionStrategy);
    preserveEGLContextOnPause();
    if (paramBoolean) {
      this.view.setFocusable(true);
      this.view.setFocusableInTouchMode(true);
    } 
  }
  
  private int getAttrib(EGL10 paramEGL10, EGLDisplay paramEGLDisplay, EGLConfig paramEGLConfig, int paramInt1, int paramInt2) { return paramEGL10.eglGetConfigAttrib(paramEGLDisplay, paramEGLConfig, paramInt1, this.value) ? this.value[0] : paramInt2; }
  
  protected boolean checkGL20() {
    EGL10 eGL10 = (EGL10)EGLContext.getEGL();
    EGLDisplay eGLDisplay = eGL10.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
    eGL10.eglInitialize(eGLDisplay, new int[2]);
    EGLConfig[] arrayOfEGLConfig = new EGLConfig[10];
    int[] arrayOfInt = new int[1];
    eGL10.eglChooseConfig(eGLDisplay, new int[] { 12324, 4, 12323, 4, 12322, 4, 12352, 4, 12344 }, arrayOfEGLConfig, 10, arrayOfInt);
    eGL10.eglTerminate(eGLDisplay);
    boolean bool = false;
    if (arrayOfInt[0] > 0)
      bool = true; 
    return bool;
  }
  
  public void clearManagedCaches() {
    Mesh.clearAllMeshes(this.app);
    Texture.clearAllTextures(this.app);
    Cubemap.clearAllCubemaps(this.app);
    TextureArray.clearAllTextureArrays(this.app);
    ShaderProgram.clearAllShaderPrograms(this.app);
    FrameBuffer.clearAllFrameBuffers(this.app);
    logManagedCachesStatus();
  }
  
  protected View createGLSurfaceView(AndroidApplicationBase paramAndroidApplicationBase, ResolutionStrategy paramResolutionStrategy) {
    if (checkGL20()) {
      byte b;
      GLSurfaceView20API18 gLSurfaceView20API18;
      GLSurfaceView.EGLConfigChooser eGLConfigChooser = getEglConfigChooser();
      if (Build.VERSION.SDK_INT <= 10 && this.config.useGLSurfaceView20API18) {
        gLSurfaceView20API18 = new GLSurfaceView20API18(paramAndroidApplicationBase.getContext(), paramResolutionStrategy);
        if (eGLConfigChooser != null) {
          gLSurfaceView20API18.setEGLConfigChooser(eGLConfigChooser);
        } else {
          gLSurfaceView20API18.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
        } 
        gLSurfaceView20API18.setRenderer(this);
        return gLSurfaceView20API18;
      } 
      Context context = gLSurfaceView20API18.getContext();
      if (this.config.useGL30) {
        b = 3;
      } else {
        b = 2;
      } 
      GLSurfaceView20 gLSurfaceView20 = new GLSurfaceView20(context, paramResolutionStrategy, b);
      if (eGLConfigChooser != null) {
        gLSurfaceView20.setEGLConfigChooser(eGLConfigChooser);
      } else {
        gLSurfaceView20.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
      } 
      gLSurfaceView20.setRenderer(this);
      return gLSurfaceView20;
    } 
    throw new GdxRuntimeException("Libgdx requires OpenGL ES 2.0");
  }
  
  void destroy() {
    synchronized (this.synch) {
      this.running = false;
      this.destroy = true;
      while (true) {
        boolean bool = this.destroy;
        if (bool)
          try {
            this.synch.wait();
            continue;
          } catch (InterruptedException interruptedException) {
            Gdx.app.log("AndroidGraphics", "waiting for destroy synchronization failed!");
            continue;
          }  
        break;
      } 
      return;
    } 
  }
  
  public int getBackBufferHeight() { return this.height; }
  
  public int getBackBufferWidth() { return this.width; }
  
  public Graphics.BufferFormat getBufferFormat() { return this.bufferFormat; }
  
  public float getDeltaTime() {
    float f;
    if (this.mean.getMean() == 0.0F) {
      f = this.deltaTime;
    } else {
      f = this.mean.getMean();
    } 
    return f;
  }
  
  public float getDensity() { return this.density; }
  
  public Graphics.DisplayMode getDisplayMode() {
    DisplayMetrics displayMetrics = new DisplayMetrics();
    this.app.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
    return new AndroidDisplayMode(displayMetrics.widthPixels, displayMetrics.heightPixels, false, false);
  }
  
  public Graphics.DisplayMode getDisplayMode(Graphics.Monitor paramMonitor) { return getDisplayMode(); }
  
  public Graphics.DisplayMode[] getDisplayModes() { return new Graphics.DisplayMode[] { getDisplayMode() }; }
  
  public Graphics.DisplayMode[] getDisplayModes(Graphics.Monitor paramMonitor) { return getDisplayModes(); }
  
  protected GLSurfaceView.EGLConfigChooser getEglConfigChooser() { return new GdxEglConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil, this.config.numSamples); }
  
  public long getFrameId() { return this.frameId; }
  
  public int getFramesPerSecond() { return this.fps; }
  
  public GL20 getGL20() { return this.gl20; }
  
  public GL30 getGL30() { return this.gl30; }
  
  public GLVersion getGLVersion() { return this.glVersion; }
  
  public int getHeight() { return this.height; }
  
  public Graphics.Monitor getMonitor() { return getPrimaryMonitor(); }
  
  public Graphics.Monitor[] getMonitors() { return new Graphics.Monitor[] { getPrimaryMonitor() }; }
  
  public float getPpcX() { return this.ppcX; }
  
  public float getPpcY() { return this.ppcY; }
  
  public float getPpiX() { return this.ppiX; }
  
  public float getPpiY() { return this.ppiY; }
  
  public Graphics.Monitor getPrimaryMonitor() { return new AndroidMonitor(false, false, "Primary Monitor"); }
  
  public float getRawDeltaTime() { return this.deltaTime; }
  
  public Graphics.GraphicsType getType() { return Graphics.GraphicsType.AndroidGL; }
  
  public View getView() { return this.view; }
  
  public int getWidth() { return this.width; }
  
  public boolean isContinuousRendering() { return this.isContinuous; }
  
  public boolean isFullscreen() { return true; }
  
  public boolean isGL30Available() {
    boolean bool;
    if (this.gl30 != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  protected void logConfig(EGLConfig paramEGLConfig) {
    boolean bool;
    EGL10 eGL10 = (EGL10)EGLContext.getEGL();
    EGLDisplay eGLDisplay = eGL10.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
    int i = getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12324, 0);
    int j = getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12323, 0);
    int k = getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12322, 0);
    int m = getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12321, 0);
    int n = getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12325, 0);
    int i1 = getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12326, 0);
    int i2 = Math.max(getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12337, 0), getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12513, 0));
    if (getAttrib(eGL10, eGLDisplay, paramEGLConfig, 12513, 0) != 0) {
      bool = true;
    } else {
      bool = false;
    } 
    Application application2 = Gdx.app;
    StringBuilder stringBuilder3 = new StringBuilder();
    stringBuilder3.append("framebuffer: (");
    stringBuilder3.append(i);
    stringBuilder3.append(", ");
    stringBuilder3.append(j);
    stringBuilder3.append(", ");
    stringBuilder3.append(k);
    stringBuilder3.append(", ");
    stringBuilder3.append(m);
    stringBuilder3.append(")");
    application2.log("AndroidGraphics", stringBuilder3.toString());
    application2 = Gdx.app;
    stringBuilder3 = new StringBuilder();
    stringBuilder3.append("depthbuffer: (");
    stringBuilder3.append(n);
    stringBuilder3.append(")");
    application2.log("AndroidGraphics", stringBuilder3.toString());
    Application application3 = Gdx.app;
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append("stencilbuffer: (");
    stringBuilder1.append(i1);
    stringBuilder1.append(")");
    application3.log("AndroidGraphics", stringBuilder1.toString());
    application3 = Gdx.app;
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append("samples: (");
    stringBuilder1.append(i2);
    stringBuilder1.append(")");
    application3.log("AndroidGraphics", stringBuilder1.toString());
    Application application1 = Gdx.app;
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append("coverage sampling: (");
    stringBuilder2.append(bool);
    stringBuilder2.append(")");
    application1.log("AndroidGraphics", stringBuilder2.toString());
    this.bufferFormat = new Graphics.BufferFormat(i, j, k, m, n, i1, i2, bool);
  }
  
  protected void logManagedCachesStatus() {
    Gdx.app.log("AndroidGraphics", Mesh.getManagedStatus());
    Gdx.app.log("AndroidGraphics", Texture.getManagedStatus());
    Gdx.app.log("AndroidGraphics", Cubemap.getManagedStatus());
    Gdx.app.log("AndroidGraphics", ShaderProgram.getManagedStatus());
    Gdx.app.log("AndroidGraphics", FrameBuffer.getManagedStatus());
  }
  
  public Cursor newCursor(Pixmap paramPixmap, int paramInt1, int paramInt2) { return null; }
  
  public void onDrawFrame(GL10 paramGL10) {
    long l = System.nanoTime();
    this.deltaTime = (float)(l - this.lastFrameTime) / 1.0E9F;
    this.lastFrameTime = l;
    if (!this.resume) {
      this.mean.addValue(this.deltaTime);
    } else {
      this.deltaTime = 0.0F;
    } 
    synchronized (this.synch) {
      boolean bool1 = this.running;
      boolean bool2 = this.pause;
      boolean bool3 = this.destroy;
      boolean bool4 = this.resume;
      if (this.resume)
        this.resume = false; 
      if (this.pause) {
        this.pause = false;
        this.synch.notifyAll();
      } 
      if (this.destroy) {
        this.destroy = false;
        this.synch.notifyAll();
      } 
      if (bool4)
        synchronized (this.app.getLifecycleListeners()) {
          LifecycleListener[] arrayOfLifecycleListener = (LifecycleListener[])null.begin();
          int i = null.size;
          for (byte b = 0; b < i; b++)
            arrayOfLifecycleListener[b].resume(); 
          null.end();
          this.app.getApplicationListener().resume();
          Gdx.app.log("AndroidGraphics", "resumed");
        }  
      if (bool1)
        synchronized (this.app.getRunnables()) {
          this.app.getExecutedRunnables().clear();
          this.app.getExecutedRunnables().addAll(this.app.getRunnables());
          this.app.getRunnables().clear();
          for (byte b = 0; b < (this.app.getExecutedRunnables()).size; b++) {
            try {
              ((Runnable)this.app.getExecutedRunnables().get(b)).run();
            } catch (Throwable null) {
              null.printStackTrace();
            } 
          } 
          this.app.getInput().processEvents();
          this.frameId++;
          this.app.getApplicationListener().render();
        }  
      if (bool2)
        synchronized (this.app.getLifecycleListeners()) {
          LifecycleListener[] arrayOfLifecycleListener = (LifecycleListener[])null.begin();
          int i = null.size;
          for (byte b = 0; b < i; b++)
            arrayOfLifecycleListener[b].pause(); 
          this.app.getApplicationListener().pause();
          Gdx.app.log("AndroidGraphics", "paused");
        }  
      if (bool3)
        synchronized (this.app.getLifecycleListeners()) {
          LifecycleListener[] arrayOfLifecycleListener = (LifecycleListener[])null.begin();
          int i = null.size;
          for (byte b = 0; b < i; b++)
            arrayOfLifecycleListener[b].dispose(); 
          this.app.getApplicationListener().dispose();
          Gdx.app.log("AndroidGraphics", "destroyed");
        }  
      if (l - this.frameStart > 1000000000L) {
        this.fps = this.frames;
        this.frames = 0;
        this.frameStart = l;
      } 
      this.frames++;
      return;
    } 
  }
  
  public void onPauseGLSurfaceView() {
    View view1 = this.view;
    if (view1 != null) {
      if (view1 instanceof GLSurfaceViewAPI18)
        ((GLSurfaceViewAPI18)view1).onPause(); 
      view1 = this.view;
      if (view1 instanceof GLSurfaceView)
        ((GLSurfaceView)view1).onPause(); 
    } 
  }
  
  public void onResumeGLSurfaceView() {
    View view1 = this.view;
    if (view1 != null) {
      if (view1 instanceof GLSurfaceViewAPI18)
        ((GLSurfaceViewAPI18)view1).onResume(); 
      view1 = this.view;
      if (view1 instanceof GLSurfaceView)
        ((GLSurfaceView)view1).onResume(); 
    } 
  }
  
  public void onSurfaceChanged(GL10 paramGL10, int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: iload_2
    //   2: putfield width : I
    //   5: aload_0
    //   6: iload_3
    //   7: putfield height : I
    //   10: aload_0
    //   11: invokevirtual updatePpi : ()V
    //   14: aload_1
    //   15: iconst_0
    //   16: iconst_0
    //   17: aload_0
    //   18: getfield width : I
    //   21: aload_0
    //   22: getfield height : I
    //   25: invokeinterface glViewport : (IIII)V
    //   30: aload_0
    //   31: getfield created : Z
    //   34: ifne -> 73
    //   37: aload_0
    //   38: getfield app : Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;
    //   41: invokeinterface getApplicationListener : ()Lcom/badlogic/gdx/ApplicationListener;
    //   46: invokeinterface create : ()V
    //   51: aload_0
    //   52: iconst_1
    //   53: putfield created : Z
    //   56: aload_0
    //   57: monitorenter
    //   58: aload_0
    //   59: iconst_1
    //   60: putfield running : Z
    //   63: aload_0
    //   64: monitorexit
    //   65: goto -> 73
    //   68: astore_1
    //   69: aload_0
    //   70: monitorexit
    //   71: aload_1
    //   72: athrow
    //   73: aload_0
    //   74: getfield app : Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;
    //   77: invokeinterface getApplicationListener : ()Lcom/badlogic/gdx/ApplicationListener;
    //   82: iload_2
    //   83: iload_3
    //   84: invokeinterface resize : (II)V
    //   89: return
    // Exception table:
    //   from	to	target	type
    //   58	65	68	finally
    //   69	71	68	finally }
  
  public void onSurfaceCreated(GL10 paramGL10, EGLConfig paramEGLConfig) {
    this.eglContext = ((EGL10)EGLContext.getEGL()).eglGetCurrentContext();
    setupGL(paramGL10);
    logConfig(paramEGLConfig);
    updatePpi();
    Mesh.invalidateAllMeshes(this.app);
    Texture.invalidateAllTextures(this.app);
    Cubemap.invalidateAllCubemaps(this.app);
    TextureArray.invalidateAllTextureArrays(this.app);
    ShaderProgram.invalidateAllShaderPrograms(this.app);
    FrameBuffer.invalidateAllFrameBuffers(this.app);
    logManagedCachesStatus();
    Display display = this.app.getWindowManager().getDefaultDisplay();
    this.width = display.getWidth();
    this.height = display.getHeight();
    this.mean = new WindowedMean(5);
    this.lastFrameTime = System.nanoTime();
    paramGL10.glViewport(0, 0, this.width, this.height);
  }
  
  void pause() {
    synchronized (this.synch) {
      if (!this.running)
        return; 
      this.running = false;
      this.pause = true;
      while (true) {
        boolean bool = this.pause;
        if (bool)
          try {
            this.synch.wait(4000L);
            if (this.pause) {
              Gdx.app.error("AndroidGraphics", "waiting for pause synchronization took too long; assuming deadlock and killing");
              Process.killProcess(Process.myPid());
            } 
            continue;
          } catch (InterruptedException interruptedException) {
            Gdx.app.log("AndroidGraphics", "waiting for pause synchronization failed!");
            continue;
          }  
        break;
      } 
      return;
    } 
  }
  
  protected void preserveEGLContextOnPause() {
    if ((Build.VERSION.SDK_INT >= 11 && this.view instanceof GLSurfaceView20) || this.view instanceof GLSurfaceView20API18)
      try {
        this.view.getClass().getMethod("setPreserveEGLContextOnPause", new Class[] { boolean.class }).invoke(this.view, new Object[] { Boolean.valueOf(true) });
      } catch (Exception exception) {
        Gdx.app.log("AndroidGraphics", "Method GLSurfaceView.setPreserveEGLContextOnPause not found");
      }  
  }
  
  public void requestRendering() {
    View view1 = this.view;
    if (view1 != null) {
      if (view1 instanceof GLSurfaceViewAPI18)
        ((GLSurfaceViewAPI18)view1).requestRender(); 
      view1 = this.view;
      if (view1 instanceof GLSurfaceView)
        ((GLSurfaceView)view1).requestRender(); 
    } 
  }
  
  void resume() {
    synchronized (this.synch) {
      this.running = true;
      this.resume = true;
      return;
    } 
  }
  
  public void setContinuousRendering(boolean paramBoolean) {
    if (this.view != null) {
      if (enforceContinuousRendering || paramBoolean) {
        paramBoolean = true;
      } else {
        paramBoolean = false;
      } 
      this.isContinuous = paramBoolean;
      int i = this.isContinuous;
      View view1 = this.view;
      if (view1 instanceof GLSurfaceViewAPI18)
        ((GLSurfaceViewAPI18)view1).setRenderMode(i); 
      view1 = this.view;
      if (view1 instanceof GLSurfaceView)
        ((GLSurfaceView)view1).setRenderMode(i); 
      this.mean.clear();
    } 
  }
  
  public void setCursor(Cursor paramCursor) {}
  
  public boolean setFullscreenMode(Graphics.DisplayMode paramDisplayMode) { return false; }
  
  public void setGL20(GL20 paramGL20) {
    this.gl20 = paramGL20;
    if (this.gl30 == null) {
      Gdx.gl = paramGL20;
      Gdx.gl20 = paramGL20;
    } 
  }
  
  public void setGL30(GL30 paramGL30) {
    this.gl30 = paramGL30;
    if (paramGL30 != null) {
      this.gl20 = paramGL30;
      GL20 gL20 = this.gl20;
      Gdx.gl = gL20;
      Gdx.gl20 = gL20;
      Gdx.gl30 = paramGL30;
    } 
  }
  
  public void setResizable(boolean paramBoolean) {}
  
  public void setSystemCursor(Cursor.SystemCursor paramSystemCursor) {}
  
  public void setTitle(String paramString) {}
  
  public void setUndecorated(boolean paramBoolean) { this.app.getApplicationWindow().setFlags(1024, paramBoolean); }
  
  public void setVSync(boolean paramBoolean) {}
  
  public boolean setWindowedMode(int paramInt1, int paramInt2) { return false; }
  
  protected void setupGL(GL10 paramGL10) {
    String str1 = paramGL10.glGetString(7938);
    String str2 = paramGL10.glGetString(7936);
    String str3 = paramGL10.glGetString(7937);
    this.glVersion = new GLVersion(Application.ApplicationType.Android, str1, str2, str3);
    if (this.config.useGL30 && this.glVersion.getMajorVersion() > 2) {
      if (this.gl30 != null)
        return; 
      AndroidGL30 androidGL30 = new AndroidGL30();
      this.gl30 = androidGL30;
      this.gl20 = androidGL30;
      GL30 gL30 = this.gl30;
      Gdx.gl = gL30;
      Gdx.gl20 = gL30;
      Gdx.gl30 = gL30;
    } else {
      if (this.gl20 != null)
        return; 
      this.gl20 = new AndroidGL20();
      GL20 gL20 = this.gl20;
      Gdx.gl = gL20;
      Gdx.gl20 = gL20;
    } 
    Application application1 = Gdx.app;
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append("OGL renderer: ");
    stringBuilder2.append(paramGL10.glGetString(7937));
    application1.log("AndroidGraphics", stringBuilder2.toString());
    Application application2 = Gdx.app;
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append("OGL vendor: ");
    stringBuilder1.append(paramGL10.glGetString(7936));
    application2.log("AndroidGraphics", stringBuilder1.toString());
    application2 = Gdx.app;
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append("OGL version: ");
    stringBuilder1.append(paramGL10.glGetString(7938));
    application2.log("AndroidGraphics", stringBuilder1.toString());
    application2 = Gdx.app;
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append("OGL extensions: ");
    stringBuilder1.append(paramGL10.glGetString(7939));
    application2.log("AndroidGraphics", stringBuilder1.toString());
  }
  
  public boolean supportsDisplayModeChange() { return false; }
  
  public boolean supportsExtension(String paramString) {
    if (this.extensions == null)
      this.extensions = Gdx.gl.glGetString(7939); 
    return this.extensions.contains(paramString);
  }
  
  protected void updatePpi() {
    DisplayMetrics displayMetrics = new DisplayMetrics();
    this.app.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
    this.ppiX = displayMetrics.xdpi;
    this.ppiY = displayMetrics.ydpi;
    this.ppcX = displayMetrics.xdpi / 2.54F;
    this.ppcY = displayMetrics.ydpi / 2.54F;
    this.density = displayMetrics.density;
  }
  
  private class AndroidDisplayMode extends Graphics.DisplayMode {
    protected AndroidDisplayMode(int param1Int1, int param1Int2, int param1Int3, int param1Int4) { super(param1Int1, param1Int2, param1Int3, param1Int4); }
  }
  
  private class AndroidMonitor extends Graphics.Monitor {
    public AndroidMonitor(int param1Int1, int param1Int2, String param1String) { super(param1Int1, param1Int2, param1String); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidGraphics.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */