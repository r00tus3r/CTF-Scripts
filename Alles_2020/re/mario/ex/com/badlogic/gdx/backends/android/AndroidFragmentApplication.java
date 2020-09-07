package com.badlogic.gdx.backends.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
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

public class AndroidFragmentApplication extends Fragment implements AndroidApplicationBase {
  private final Array<AndroidEventListener> androidEventListeners = new Array();
  
  protected ApplicationLogger applicationLogger;
  
  protected AndroidAudio audio;
  
  protected Callbacks callbacks;
  
  protected AndroidClipboard clipboard;
  
  protected final Array<Runnable> executedRunnables = new Array();
  
  protected AndroidFiles files;
  
  protected boolean firstResume = true;
  
  protected AndroidGraphics graphics;
  
  public Handler handler;
  
  protected AndroidInput input;
  
  protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray(LifecycleListener.class);
  
  protected ApplicationListener listener;
  
  protected int logLevel = 2;
  
  protected AndroidNet net;
  
  protected final Array<Runnable> runnables = new Array();
  
  static  {
    GdxNativesLoader.load();
  }
  
  private boolean isAnyParentFragmentRemoving() {
    for (Fragment fragment = getParentFragment(); fragment != null; fragment = fragment.getParentFragment()) {
      if (fragment.isRemoving())
        return true; 
    } 
    return false;
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
      getActivity().getWindow().addFlags(128); 
  }
  
  public void debug(String paramString1, String paramString2) {
    if (this.logLevel >= 3)
      Log.d(paramString1, paramString2); 
  }
  
  public void debug(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 3)
      Log.d(paramString1, paramString2, paramThrowable); 
  }
  
  public void error(String paramString1, String paramString2) {
    if (this.logLevel >= 1)
      Log.e(paramString1, paramString2); 
  }
  
  public void error(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 1)
      Log.e(paramString1, paramString2, paramThrowable); 
  }
  
  public void exit() { this.handler.post(new Runnable() {
          public void run() { AndroidFragmentApplication.this.callbacks.exit(); }
        }); }
  
  public ApplicationListener getApplicationListener() { return this.listener; }
  
  public ApplicationLogger getApplicationLogger() { return this.applicationLogger; }
  
  public Window getApplicationWindow() { return getActivity().getWindow(); }
  
  public Audio getAudio() { return this.audio; }
  
  public Clipboard getClipboard() { return this.clipboard; }
  
  public Context getContext() { return getActivity(); }
  
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
  
  public Preferences getPreferences(String paramString) { return new AndroidPreferences(getActivity().getSharedPreferences(paramString, 0)); }
  
  public Array<Runnable> getRunnables() { return this.runnables; }
  
  public Application.ApplicationType getType() { return Application.ApplicationType.Android; }
  
  public int getVersion() { return Build.VERSION.SDK_INT; }
  
  public WindowManager getWindowManager() { return (WindowManager)getContext().getSystemService("window"); }
  
  public View initializeForView(ApplicationListener paramApplicationListener) { return initializeForView(paramApplicationListener, new AndroidApplicationConfiguration()); }
  
  public View initializeForView(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    if (getVersion() >= 9) {
      ResolutionStrategy resolutionStrategy;
      setApplicationLogger(new AndroidApplicationLogger());
      if (paramAndroidApplicationConfiguration.resolutionStrategy == null) {
        resolutionStrategy = new FillResolutionStrategy();
      } else {
        resolutionStrategy = paramAndroidApplicationConfiguration.resolutionStrategy;
      } 
      this.graphics = new AndroidGraphics(this, paramAndroidApplicationConfiguration, resolutionStrategy);
      this.input = AndroidInputFactory.newAndroidInput(this, getActivity(), this.graphics.view, paramAndroidApplicationConfiguration);
      this.audio = new AndroidAudio(getActivity(), paramAndroidApplicationConfiguration);
      this.files = new AndroidFiles(getResources().getAssets(), getActivity().getFilesDir().getAbsolutePath());
      this.net = new AndroidNet(this, paramAndroidApplicationConfiguration);
      this.listener = paramApplicationListener;
      this.handler = new Handler();
      this.clipboard = new AndroidClipboard(getActivity());
      addLifecycleListener(new LifecycleListener() {
            public void dispose() { AndroidFragmentApplication.this.audio.dispose(); }
            
            public void pause() { AndroidFragmentApplication.this.audio.pause(); }
            
            public void resume() { AndroidFragmentApplication.this.audio.resume(); }
          });
      Gdx.app = this;
      Gdx.input = getInput();
      Gdx.audio = getAudio();
      Gdx.files = getFiles();
      Gdx.graphics = getGraphics();
      Gdx.net = getNet();
      createWakeLock(paramAndroidApplicationConfiguration.useWakelock);
      useImmersiveMode(paramAndroidApplicationConfiguration.useImmersiveMode);
      if (paramAndroidApplicationConfiguration.useImmersiveMode && getVersion() >= 19)
        try {
          Class clazz = Class.forName("com.badlogic.gdx.backends.android.AndroidVisibilityListener");
          Object object = clazz.newInstance();
          clazz.getDeclaredMethod("createListener", new Class[] { AndroidApplicationBase.class }).invoke(object, new Object[] { this });
        } catch (Exception paramApplicationListener) {
          log("AndroidApplication", "Failed to create AndroidVisibilityListener", paramApplicationListener);
        }  
      if ((getResources().getConfiguration()).keyboard != 1)
        (getInput()).keyboardAvailable = true; 
      return this.graphics.getView();
    } 
    throw new GdxRuntimeException("LibGDX requires Android API Level 9 or later.");
  }
  
  public void log(String paramString1, String paramString2) {
    if (this.logLevel >= 2)
      Log.i(paramString1, paramString2); 
  }
  
  public void log(String paramString1, String paramString2, Throwable paramThrowable) {
    if (this.logLevel >= 2)
      Log.i(paramString1, paramString2, paramThrowable); 
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent) { // Byte code:
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
  
  public void onAttach(Activity paramActivity) {
    if (paramActivity instanceof Callbacks) {
      this.callbacks = (Callbacks)paramActivity;
    } else if (getParentFragment() instanceof Callbacks) {
      this.callbacks = (Callbacks)getParentFragment();
    } else if (getTargetFragment() instanceof Callbacks) {
      this.callbacks = (Callbacks)getTargetFragment();
    } else {
      throw new RuntimeException("Missing AndroidFragmentApplication.Callbacks. Please implement AndroidFragmentApplication.Callbacks on the parent activity, fragment or target fragment.");
    } 
    super.onAttach(paramActivity);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration) {
    super.onConfigurationChanged(paramConfiguration);
    int i = paramConfiguration.hardKeyboardHidden;
    boolean bool = true;
    if (i != 1)
      bool = false; 
    this.input.keyboardAvailable = bool;
  }
  
  public void onDetach() {
    super.onDetach();
    this.callbacks = null;
  }
  
  public void onPause() {
    boolean bool1 = this.graphics.isContinuousRendering();
    boolean bool2 = AndroidGraphics.enforceContinuousRendering;
    AndroidGraphics.enforceContinuousRendering = true;
    this.graphics.setContinuousRendering(true);
    this.graphics.pause();
    this.input.onPause();
    if (isRemoving() || isAnyParentFragmentRemoving() || getActivity().isFinishing()) {
      this.graphics.clearManagedCaches();
      this.graphics.destroy();
    } 
    AndroidGraphics.enforceContinuousRendering = bool2;
    this.graphics.setContinuousRendering(bool1);
    this.graphics.onPauseGLSurfaceView();
    super.onPause();
  }
  
  public void onResume() {
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
    super.onResume();
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
  
  public void runOnUiThread(Runnable paramRunnable) { getActivity().runOnUiThread(paramRunnable); }
  
  public void setApplicationLogger(ApplicationLogger paramApplicationLogger) { this.applicationLogger = paramApplicationLogger; }
  
  public void setLogLevel(int paramInt) { this.logLevel = paramInt; }
  
  @TargetApi(19)
  public void useImmersiveMode(boolean paramBoolean) {
    if (paramBoolean && getVersion() >= 19)
      try {
        View view = this.graphics.getView();
        View.class.getMethod("setSystemUiVisibility", new Class[] { int.class }).invoke(view, new Object[] { Integer.valueOf(5894) });
      } catch (Exception exception) {
        log("AndroidApplication", "Failed to setup immersive mode, a throwable has occurred.", exception);
      }  
  }
  
  public static interface Callbacks {
    void exit();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidFragmentApplication.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */