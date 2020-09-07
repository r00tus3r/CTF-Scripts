package com.badlogic.gdx.backends.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
import android.view.View;
import android.view.Window;
import android.widget.FrameLayout;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.ApplicationLogger;
import com.badlogic.gdx.Audio;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.LifecycleListener;
import com.badlogic.gdx.Net;
import com.badlogic.gdx.Preferences;
import com.badlogic.gdx.backends.android.surfaceview.FillResolutionStrategy;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Clipboard;
import com.badlogic.gdx.utils.GdxNativesLoader;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.SnapshotArray;
import java.lang.reflect.Method;

public class AndroidApplication extends Activity implements AndroidApplicationBase {
  private final Array<AndroidEventListener> androidEventListeners = new Array();
  
  protected ApplicationLogger applicationLogger;
  
  protected AndroidAudio audio;
  
  protected AndroidClipboard clipboard;
  
  protected final Array<Runnable> executedRunnables = new Array();
  
  protected AndroidFiles files;
  
  protected boolean firstResume = true;
  
  protected AndroidGraphics graphics;
  
  public Handler handler;
  
  protected boolean hideStatusBar = false;
  
  protected AndroidInput input;
  
  private boolean isWaitingForAudio = false;
  
  protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray(LifecycleListener.class);
  
  protected ApplicationListener listener;
  
  protected int logLevel = 2;
  
  protected AndroidNet net;
  
  protected final Array<Runnable> runnables = new Array();
  
  protected boolean useImmersiveMode = false;
  
  private int wasFocusChanged = -1;
  
  static  {
    GdxNativesLoader.load();
  }
  
  private void init(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration, boolean paramBoolean) {
    if (getVersion() >= 9) {
      ResolutionStrategy resolutionStrategy;
      setApplicationLogger(new AndroidApplicationLogger());
      if (paramAndroidApplicationConfiguration.resolutionStrategy == null) {
        resolutionStrategy = new FillResolutionStrategy();
      } else {
        resolutionStrategy = paramAndroidApplicationConfiguration.resolutionStrategy;
      } 
      this.graphics = new AndroidGraphics(this, paramAndroidApplicationConfiguration, resolutionStrategy);
      this.input = AndroidInputFactory.newAndroidInput(this, this, this.graphics.view, paramAndroidApplicationConfiguration);
      this.audio = new AndroidAudio(this, paramAndroidApplicationConfiguration);
      getFilesDir();
      this.files = new AndroidFiles(getAssets(), getFilesDir().getAbsolutePath());
      this.net = new AndroidNet(this, paramAndroidApplicationConfiguration);
      this.listener = paramApplicationListener;
      this.handler = new Handler();
      this.useImmersiveMode = paramAndroidApplicationConfiguration.useImmersiveMode;
      this.hideStatusBar = paramAndroidApplicationConfiguration.hideStatusBar;
      this.clipboard = new AndroidClipboard(this);
      addLifecycleListener(new LifecycleListener() {
            public void dispose() { AndroidApplication.this.audio.dispose(); }
            
            public void pause() { AndroidApplication.this.audio.pause(); }
            
            public void resume() {}
          });
      Gdx.app = this;
      Gdx.input = getInput();
      Gdx.audio = getAudio();
      Gdx.files = getFiles();
      Gdx.graphics = getGraphics();
      Gdx.net = getNet();
      if (!paramBoolean) {
        try {
          requestWindowFeature(1);
        } catch (Exception paramApplicationListener) {
          log("AndroidApplication", "Content already displayed, cannot request FEATURE_NO_TITLE", paramApplicationListener);
        } 
        getWindow().setFlags(1024, 1024);
        getWindow().clearFlags(2048);
        setContentView(this.graphics.getView(), createLayoutParams());
      } 
      createWakeLock(paramAndroidApplicationConfiguration.useWakelock);
      hideStatusBar(this.hideStatusBar);
      useImmersiveMode(this.useImmersiveMode);
      if (this.useImmersiveMode && getVersion() >= 19)
        try {
          Class clazz = Class.forName("com.badlogic.gdx.backends.android.AndroidVisibilityListener");
          Object object = clazz.newInstance();
          clazz.getDeclaredMethod("createListener", new Class[] { AndroidApplicationBase.class }).invoke(object, new Object[] { this });
        } catch (Exception paramApplicationListener) {
          log("AndroidApplication", "Failed to create AndroidVisibilityListener", paramApplicationListener);
        }  
      if ((getResources().getConfiguration()).keyboard != 1)
        (getInput()).keyboardAvailable = true; 
      return;
    } 
    throw new GdxRuntimeException("LibGDX requires Android API Level 9 or later.");
  }
  
  public void addAndroidEventListener(AndroidEventListener paramAndroidEventListener) {
    synchronized (this.androidEventListeners) {
      this.androidEventListeners.add(paramAndroidEventListener);
      return;
    } 
  }
  
  public void addLifecycleListener(LifecycleListener paramLifecycleListener) {
    synchronized (this.lifecycleListeners) {
      this.lifecycleListeners.add(paramLifecycleListener);
      return;
    } 
  }
  
  protected FrameLayout.LayoutParams createLayoutParams() {
    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
    layoutParams.gravity = 17;
    return layoutParams;
  }
  
  protected void createWakeLock(boolean paramBoolean) {
    if (paramBoolean)
      getWindow().addFlags(128); 
  }
  
  public void debug(String paramString1, String paramString2) {
    if (this.logLevel >= 3)
      getApplicationLogger().debug(paramString1, paramString2); 
  }
  
  public void debug(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 3)
      getApplicationLogger().debug(paramString1, paramString2, paramThrowable); 
  }
  
  public void error(String paramString1, String paramString2) {
    if (this.logLevel >= 1)
      getApplicationLogger().error(paramString1, paramString2); 
  }
  
  public void error(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 1)
      getApplicationLogger().error(paramString1, paramString2, paramThrowable); 
  }
  
  public void exit() { this.handler.post(new Runnable() {
          public void run() { AndroidApplication.this.finish(); }
        }); }
  
  public ApplicationListener getApplicationListener() { return this.listener; }
  
  public ApplicationLogger getApplicationLogger() { return this.applicationLogger; }
  
  public Window getApplicationWindow() { return getWindow(); }
  
  public Audio getAudio() { return this.audio; }
  
  public Clipboard getClipboard() { return this.clipboard; }
  
  public Context getContext() { return this; }
  
  public Array<Runnable> getExecutedRunnables() { return this.executedRunnables; }
  
  public Files getFiles() { return this.files; }
  
  public Graphics getGraphics() { return this.graphics; }
  
  public Handler getHandler() { return this.handler; }
  
  public AndroidInput getInput() { return this.input; }
  
  public long getJavaHeap() { return Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory(); }
  
  public SnapshotArray<LifecycleListener> getLifecycleListeners() { return this.lifecycleListeners; }
  
  public int getLogLevel() { return this.logLevel; }
  
  public long getNativeHeap() { return Debug.getNativeHeapAllocatedSize(); }
  
  public Net getNet() { return this.net; }
  
  public Preferences getPreferences(String paramString) { return new AndroidPreferences(getSharedPreferences(paramString, 0)); }
  
  public Array<Runnable> getRunnables() { return this.runnables; }
  
  public Application.ApplicationType getType() { return Application.ApplicationType.Android; }
  
  public int getVersion() { return Build.VERSION.SDK_INT; }
  
  protected void hideStatusBar(boolean paramBoolean) {
    if (paramBoolean && getVersion() >= 11) {
      View view = getWindow().getDecorView();
      try {
        Method method = View.class.getMethod("setSystemUiVisibility", new Class[] { int.class });
        if (getVersion() <= 13)
          method.invoke(view, new Object[] { Integer.valueOf(0) }); 
        method.invoke(view, new Object[] { Integer.valueOf(1) });
      } catch (Exception exception) {
        log("AndroidApplication", "Can't hide status bar", exception);
      } 
    } 
  }
  
  public void initialize(ApplicationListener paramApplicationListener) { initialize(paramApplicationListener, new AndroidApplicationConfiguration()); }
  
  public void initialize(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) { init(paramApplicationListener, paramAndroidApplicationConfiguration, false); }
  
  public View initializeForView(ApplicationListener paramApplicationListener) { return initializeForView(paramApplicationListener, new AndroidApplicationConfiguration()); }
  
  public View initializeForView(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    init(paramApplicationListener, paramAndroidApplicationConfiguration, true);
    return this.graphics.getView();
  }
  
  public void log(String paramString1, String paramString2) {
    if (this.logLevel >= 2)
      getApplicationLogger().log(paramString1, paramString2); 
  }
  
  public void log(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 2)
      getApplicationLogger().log(paramString1, paramString2, paramThrowable); 
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent) { // Byte code:
    //   0: aload_0
    //   1: iload_1
    //   2: iload_2
    //   3: aload_3
    //   4: invokespecial onActivityResult : (IILandroid/content/Intent;)V
    //   7: aload_0
    //   8: getfield androidEventListeners : Lcom/badlogic/gdx/utils/Array;
    //   11: astore #4
    //   13: aload #4
    //   15: monitorenter
    //   16: iconst_0
    //   17: istore #5
    //   19: iload #5
    //   21: aload_0
    //   22: getfield androidEventListeners : Lcom/badlogic/gdx/utils/Array;
    //   25: getfield size : I
    //   28: if_icmpge -> 57
    //   31: aload_0
    //   32: getfield androidEventListeners : Lcom/badlogic/gdx/utils/Array;
    //   35: iload #5
    //   37: invokevirtual get : (I)Ljava/lang/Object;
    //   40: checkcast com/badlogic/gdx/backends/android/AndroidEventListener
    //   43: iload_1
    //   44: iload_2
    //   45: aload_3
    //   46: invokeinterface onActivityResult : (IILandroid/content/Intent;)V
    //   51: iinc #5, 1
    //   54: goto -> 19
    //   57: aload #4
    //   59: monitorexit
    //   60: return
    //   61: astore_3
    //   62: aload #4
    //   64: monitorexit
    //   65: goto -> 70
    //   68: aload_3
    //   69: athrow
    //   70: goto -> 68
    // Exception table:
    //   from	to	target	type
    //   19	51	61	finally
    //   57	60	61	finally
    //   62	65	61	finally }
  
  public void onConfigurationChanged(Configuration paramConfiguration) {
    super.onConfigurationChanged(paramConfiguration);
    int i = paramConfiguration.hardKeyboardHidden;
    boolean bool = true;
    if (i != 1)
      bool = false; 
    this.input.keyboardAvailable = bool;
  }
  
  protected void onDestroy() { super.onDestroy(); }
  
  protected void onPause() {
    boolean bool1 = this.graphics.isContinuousRendering();
    boolean bool2 = AndroidGraphics.enforceContinuousRendering;
    AndroidGraphics.enforceContinuousRendering = true;
    this.graphics.setContinuousRendering(true);
    this.graphics.pause();
    this.input.onPause();
    if (isFinishing()) {
      this.graphics.clearManagedCaches();
      this.graphics.destroy();
    } 
    AndroidGraphics.enforceContinuousRendering = bool2;
    this.graphics.setContinuousRendering(bool1);
    this.graphics.onPauseGLSurfaceView();
    super.onPause();
  }
  
  protected void onResume() {
    Gdx.app = this;
    Gdx.input = getInput();
    Gdx.audio = getAudio();
    Gdx.files = getFiles();
    Gdx.graphics = getGraphics();
    Gdx.net = getNet();
    this.input.onResume();
    AndroidGraphics androidGraphics = this.graphics;
    if (androidGraphics != null)
      androidGraphics.onResumeGLSurfaceView(); 
    if (!this.firstResume) {
      this.graphics.resume();
    } else {
      this.firstResume = false;
    } 
    this.isWaitingForAudio = true;
    int i = this.wasFocusChanged;
    if (i == 1 || i == -1) {
      this.audio.resume();
      this.isWaitingForAudio = false;
    } 
    super.onResume();
  }
  
  public void onWindowFocusChanged(boolean paramBoolean) {
    super.onWindowFocusChanged(paramBoolean);
    useImmersiveMode(this.useImmersiveMode);
    hideStatusBar(this.hideStatusBar);
    if (paramBoolean) {
      this.wasFocusChanged = 1;
      if (this.isWaitingForAudio) {
        this.audio.resume();
        this.isWaitingForAudio = false;
      } 
    } else {
      this.wasFocusChanged = 0;
    } 
  }
  
  public void postRunnable(Runnable paramRunnable) {
    synchronized (this.runnables) {
      this.runnables.add(paramRunnable);
      Gdx.graphics.requestRendering();
      return;
    } 
  }
  
  public void removeAndroidEventListener(AndroidEventListener paramAndroidEventListener) {
    synchronized (this.androidEventListeners) {
      this.androidEventListeners.removeValue(paramAndroidEventListener, true);
      return;
    } 
  }
  
  public void removeLifecycleListener(LifecycleListener paramLifecycleListener) {
    synchronized (this.lifecycleListeners) {
      this.lifecycleListeners.removeValue(paramLifecycleListener, true);
      return;
    } 
  }
  
  public void setApplicationLogger(ApplicationLogger paramApplicationLogger) { this.applicationLogger = paramApplicationLogger; }
  
  public void setLogLevel(int paramInt) { this.logLevel = paramInt; }
  
  @TargetApi(19)
  public void useImmersiveMode(boolean paramBoolean) {
    if (paramBoolean && getVersion() >= 19) {
      view = getWindow().getDecorView();
      try {
        View.class.getMethod("setSystemUiVisibility", new Class[] { int.class }).invoke(view, new Object[] { Integer.valueOf(5894) });
      } catch (Exception view) {
        log("AndroidApplication", "Can't set immersive mode", view);
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidApplication.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */