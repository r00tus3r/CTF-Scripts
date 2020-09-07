package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.service.dreams.DreamService;
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
import com.badlogic.gdx.utils.SnapshotArray;
import java.lang.reflect.Method;
import java.util.Arrays;

public class AndroidDaydream extends DreamService implements AndroidApplicationBase {
  protected ApplicationLogger applicationLogger;
  
  protected AndroidAudio audio;
  
  protected AndroidClipboard clipboard;
  
  protected final Array<Runnable> executedRunnables = new Array();
  
  protected AndroidFiles files;
  
  protected boolean firstResume = true;
  
  protected AndroidGraphics graphics;
  
  protected Handler handler;
  
  protected AndroidInput input;
  
  protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray(LifecycleListener.class);
  
  protected ApplicationListener listener;
  
  protected int logLevel = 2;
  
  protected AndroidNet net;
  
  protected final Array<Runnable> runnables = new Array();
  
  static  {
    GdxNativesLoader.load();
  }
  
  private void init(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration, boolean paramBoolean) {
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
    this.clipboard = new AndroidClipboard(this);
    addLifecycleListener(new LifecycleListener() {
          public void dispose() {
            AndroidDaydream.this.audio.dispose();
            AndroidDaydream.this.audio = null;
          }
          
          public void pause() { AndroidDaydream.this.audio.pause(); }
          
          public void resume() { AndroidDaydream.this.audio.resume(); }
        });
    Gdx.app = this;
    Gdx.input = getInput();
    Gdx.audio = getAudio();
    Gdx.files = getFiles();
    Gdx.graphics = getGraphics();
    Gdx.net = getNet();
    if (!paramBoolean) {
      setFullscreen(true);
      setContentView(this.graphics.getView(), createLayoutParams());
    } 
    createWakeLock(paramAndroidApplicationConfiguration.useWakelock);
    hideStatusBar(paramAndroidApplicationConfiguration);
    if ((getResources().getConfiguration()).keyboard != 1)
      (getInput()).keyboardAvailable = true; 
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
          public void run() { AndroidDaydream.this.finish(); }
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
  
  protected void hideStatusBar(AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    if (paramAndroidApplicationConfiguration.hideStatusBar && getVersion() >= 11) {
      view = getWindow().getDecorView();
      try {
        Method method = View.class.getMethod("setSystemUiVisibility", new Class[] { int.class });
        method.invoke(view, new Object[] { Integer.valueOf(0) });
        method.invoke(view, new Object[] { Integer.valueOf(1) });
      } catch (Exception view) {
        log("AndroidApplication", "Can't hide status bar", view);
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
  
  public void onConfigurationChanged(Configuration paramConfiguration) {
    super.onConfigurationChanged(paramConfiguration);
    int i = paramConfiguration.hardKeyboardHidden;
    boolean bool = true;
    if (i != 1)
      bool = false; 
    this.input.keyboardAvailable = bool;
  }
  
  public void onDetachedFromWindow() { super.onDetachedFromWindow(); }
  
  public void onDreamingStarted() {
    Gdx.app = this;
    Gdx.input = getInput();
    Gdx.audio = getAudio();
    Gdx.files = getFiles();
    Gdx.graphics = getGraphics();
    Gdx.net = getNet();
    getInput().registerSensorListeners();
    AndroidGraphics androidGraphics = this.graphics;
    if (androidGraphics != null)
      androidGraphics.onResumeGLSurfaceView(); 
    if (!this.firstResume) {
      this.graphics.resume();
    } else {
      this.firstResume = false;
    } 
    super.onDreamingStarted();
  }
  
  public void onDreamingStopped() {
    boolean bool = this.graphics.isContinuousRendering();
    this.graphics.setContinuousRendering(true);
    this.graphics.pause();
    this.input.unregisterSensorListeners();
    Arrays.fill(this.input.realId, -1);
    Arrays.fill(this.input.touched, false);
    this.graphics.clearManagedCaches();
    this.graphics.destroy();
    this.graphics.setContinuousRendering(bool);
    this.graphics.onPauseGLSurfaceView();
    super.onDreamingStopped();
  }
  
  public void postRunnable(Runnable paramRunnable) {
    synchronized (this.runnables) {
      this.runnables.add(paramRunnable);
      Gdx.graphics.requestRendering();
      return;
    } 
  }
  
  public void removeLifecycleListener(LifecycleListener paramLifecycleListener) {
    synchronized (this.lifecycleListeners) {
      this.lifecycleListeners.removeValue(paramLifecycleListener, true);
      return;
    } 
  }
  
  public void runOnUiThread(Runnable paramRunnable) {
    if (Looper.myLooper() != Looper.getMainLooper()) {
      (new Handler(Looper.getMainLooper())).post(paramRunnable);
    } else {
      paramRunnable.run();
    } 
  }
  
  public void setApplicationLogger(ApplicationLogger paramApplicationLogger) { this.applicationLogger = paramApplicationLogger; }
  
  public void setLogLevel(int paramInt) { this.logLevel = paramInt; }
  
  public void useImmersiveMode(boolean paramBoolean) { throw new UnsupportedOperationException(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidDaydream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */