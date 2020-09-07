package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;
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

public class AndroidLiveWallpaper implements AndroidApplicationBase {
  protected ApplicationLogger applicationLogger;
  
  protected AndroidAudio audio;
  
  protected AndroidClipboard clipboard;
  
  protected final Array<Runnable> executedRunnables = new Array();
  
  protected AndroidFiles files;
  
  protected boolean firstResume = true;
  
  protected AndroidGraphicsLiveWallpaper graphics;
  
  protected AndroidInput input;
  
  protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray(LifecycleListener.class);
  
  protected ApplicationListener listener;
  
  protected int logLevel = 2;
  
  protected AndroidNet net;
  
  protected final Array<Runnable> runnables = new Array();
  
  protected AndroidLiveWallpaperService service;
  
  static  {
    GdxNativesLoader.load();
  }
  
  public AndroidLiveWallpaper(AndroidLiveWallpaperService paramAndroidLiveWallpaperService) { this.service = paramAndroidLiveWallpaperService; }
  
  public void addLifecycleListener(LifecycleListener paramLifecycleListener) {
    synchronized (this.lifecycleListeners) {
      this.lifecycleListeners.add(paramLifecycleListener);
      return;
    } 
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
  
  public void exit() {}
  
  public ApplicationListener getApplicationListener() { return this.listener; }
  
  public ApplicationLogger getApplicationLogger() { return this.applicationLogger; }
  
  public Window getApplicationWindow() { throw new UnsupportedOperationException(); }
  
  public Audio getAudio() { return this.audio; }
  
  public Clipboard getClipboard() { return this.clipboard; }
  
  public Context getContext() { return this.service; }
  
  public Array<Runnable> getExecutedRunnables() { return this.executedRunnables; }
  
  public Files getFiles() { return this.files; }
  
  public Graphics getGraphics() { return this.graphics; }
  
  public Handler getHandler() { throw new UnsupportedOperationException(); }
  
  public AndroidInput getInput() { return this.input; }
  
  public long getJavaHeap() { return Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory(); }
  
  public SnapshotArray<LifecycleListener> getLifecycleListeners() { return this.lifecycleListeners; }
  
  public int getLogLevel() { return this.logLevel; }
  
  public long getNativeHeap() { return Debug.getNativeHeapAllocatedSize(); }
  
  public Net getNet() { return this.net; }
  
  public Preferences getPreferences(String paramString) { return new AndroidPreferences(this.service.getSharedPreferences(paramString, 0)); }
  
  public Array<Runnable> getRunnables() { return this.runnables; }
  
  public AndroidLiveWallpaperService getService() { return this.service; }
  
  public Application.ApplicationType getType() { return Application.ApplicationType.Android; }
  
  public int getVersion() { return Build.VERSION.SDK_INT; }
  
  public WindowManager getWindowManager() { return this.service.getWindowManager(); }
  
  public void initialize(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    if (getVersion() >= 9) {
      ResolutionStrategy resolutionStrategy;
      setApplicationLogger(new AndroidApplicationLogger());
      if (paramAndroidApplicationConfiguration.resolutionStrategy == null) {
        resolutionStrategy = new FillResolutionStrategy();
      } else {
        resolutionStrategy = paramAndroidApplicationConfiguration.resolutionStrategy;
      } 
      this.graphics = new AndroidGraphicsLiveWallpaper(this, paramAndroidApplicationConfiguration, resolutionStrategy);
      this.input = AndroidInputFactory.newAndroidInput(this, getService(), this.graphics.view, paramAndroidApplicationConfiguration);
      this.audio = new AndroidAudio(getService(), paramAndroidApplicationConfiguration);
      getService().getFilesDir();
      this.files = new AndroidFiles(getService().getAssets(), getService().getFilesDir().getAbsolutePath());
      this.net = new AndroidNet(this, paramAndroidApplicationConfiguration);
      this.listener = paramApplicationListener;
      this.clipboard = new AndroidClipboard(getService());
      Gdx.app = this;
      Gdx.input = this.input;
      Gdx.audio = this.audio;
      Gdx.files = this.files;
      Gdx.graphics = this.graphics;
      Gdx.net = this.net;
      return;
    } 
    throw new GdxRuntimeException("LibGDX requires Android API Level 9 or later.");
  }
  
  public void log(String paramString1, String paramString2) {
    if (this.logLevel >= 2)
      getApplicationLogger().log(paramString1, paramString2); 
  }
  
  public void log(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 2)
      getApplicationLogger().log(paramString1, paramString2, paramThrowable); 
  }
  
  public void onDestroy() {
    AndroidGraphicsLiveWallpaper androidGraphicsLiveWallpaper = this.graphics;
    if (androidGraphicsLiveWallpaper != null)
      androidGraphicsLiveWallpaper.onDestroyGLSurfaceView(); 
    AndroidAudio androidAudio = this.audio;
    if (androidAudio != null)
      androidAudio.dispose(); 
  }
  
  public void onPause() {
    if (AndroidLiveWallpaperService.DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaper - onPause()"); 
    this.audio.pause();
    this.input.onPause();
    AndroidGraphicsLiveWallpaper androidGraphicsLiveWallpaper = this.graphics;
    if (androidGraphicsLiveWallpaper != null)
      androidGraphicsLiveWallpaper.onPauseGLSurfaceView(); 
    if (AndroidLiveWallpaperService.DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaper - onPause() done!"); 
  }
  
  public void onResume() {
    Gdx.app = this;
    AndroidInput androidInput = this.input;
    Gdx.input = androidInput;
    Gdx.audio = this.audio;
    Gdx.files = this.files;
    Gdx.graphics = this.graphics;
    Gdx.net = this.net;
    androidInput.onResume();
    AndroidGraphicsLiveWallpaper androidGraphicsLiveWallpaper = this.graphics;
    if (androidGraphicsLiveWallpaper != null)
      androidGraphicsLiveWallpaper.onResumeGLSurfaceView(); 
    if (!this.firstResume) {
      this.audio.resume();
      this.graphics.resume();
    } else {
      this.firstResume = false;
    } 
  }
  
  public void postRunnable(Runnable paramRunnable) {
    synchronized (this.runnables) {
      this.runnables.add(paramRunnable);
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
  
  public void startActivity(Intent paramIntent) { this.service.startActivity(paramIntent); }
  
  public void useImmersiveMode(boolean paramBoolean) { throw new UnsupportedOperationException(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidLiveWallpaper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */