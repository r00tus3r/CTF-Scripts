package com.badlogic.gdx.backends.android;

import android.os.Build;
import android.os.Bundle;
import android.service.wallpaper.WallpaperService;
import android.util.Log;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.WindowManager;
import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.GdxNativesLoader;

public abstract class AndroidLiveWallpaperService extends WallpaperService {
  static boolean DEBUG = false;
  
  static final String TAG = "WallpaperService";
  
  protected int engines = 0;
  
  protected SurfaceHolder.Callback view = null;
  
  protected int viewFormat;
  
  protected int viewHeight;
  
  protected int viewWidth;
  
  protected int visibleEngines = 0;
  
  static  {
    GdxNativesLoader.load();
    DEBUG = false;
  }
  
  protected void finalize() {
    Log.i("WallpaperService", "service finalized");
    super.finalize();
  }
  
  public AndroidLiveWallpaper getLiveWallpaper() { return this.app; }
  
  public SurfaceHolder getSurfaceHolder() {
    if (DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaperService - getSurfaceHolder()"); 
    synchronized (this.sync) {
      if (this.linkedEngine == null)
        return null; 
      return this.linkedEngine.getSurfaceHolder();
    } 
  }
  
  public WindowManager getWindowManager() { return (WindowManager)getSystemService("window"); }
  
  public void initialize(ApplicationListener paramApplicationListener) { initialize(paramApplicationListener, new AndroidApplicationConfiguration()); }
  
  public void initialize(ApplicationListener paramApplicationListener, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    if (DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaperService - initialize()"); 
    this.app.initialize(paramApplicationListener, paramAndroidApplicationConfiguration);
    if (paramAndroidApplicationConfiguration.getTouchEventsForLiveWallpaper && Integer.parseInt(Build.VERSION.SDK) >= 7)
      this.linkedEngine.setTouchEventsEnabled(true); 
  }
  
  public void onCreate() {
    if (DEBUG) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(" > AndroidLiveWallpaperService - onCreate() ");
      stringBuilder.append(hashCode());
      Log.d("WallpaperService", stringBuilder.toString());
    } 
    Log.i("WallpaperService", "service created");
    super.onCreate();
  }
  
  public void onCreateApplication() {
    if (DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaperService - onCreateApplication()"); 
  }
  
  public WallpaperService.Engine onCreateEngine() {
    if (DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaperService - onCreateEngine()"); 
    Log.i("WallpaperService", "engine created");
    return new AndroidWallpaperEngine();
  }
  
  public void onDeepPauseApplication() {
    if (DEBUG)
      Log.d("WallpaperService", " > AndroidLiveWallpaperService - onDeepPauseApplication()"); 
    if (this.app != null)
      this.app.graphics.clearManagedCaches(); 
  }
  
  public void onDestroy() {
    if (DEBUG) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(" > AndroidLiveWallpaperService - onDestroy() ");
      stringBuilder.append(hashCode());
      Log.d("WallpaperService", stringBuilder.toString());
    } 
    Log.i("WallpaperService", "service destroyed");
    super.onDestroy();
    if (this.app != null) {
      this.app.onDestroy();
      this.app = null;
      this.view = null;
    } 
  }
  
  protected void setLinkedEngine(AndroidWallpaperEngine paramAndroidWallpaperEngine) {
    synchronized (this.sync) {
      this.linkedEngine = paramAndroidWallpaperEngine;
      return;
    } 
  }
  
  public class AndroidWallpaperEngine extends WallpaperService.Engine {
    protected int engineFormat;
    
    protected int engineHeight;
    
    protected boolean engineIsVisible = false;
    
    protected int engineWidth;
    
    boolean iconDropConsumed = true;
    
    boolean offsetsConsumed = true;
    
    int xIconDrop;
    
    float xOffset = 0.0F;
    
    float xOffsetStep = 0.0F;
    
    int xPixelOffset = 0;
    
    int yIconDrop;
    
    float yOffset = 0.0F;
    
    float yOffsetStep = 0.0F;
    
    int yPixelOffset = 0;
    
    public AndroidWallpaperEngine() {
      super(AndroidLiveWallpaperService.this);
      if (AndroidLiveWallpaperService.DEBUG) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine() ");
        stringBuilder.append(hashCode());
        Log.d("WallpaperService", stringBuilder.toString());
      } 
    }
    
    private void notifySurfaceChanged(int param1Int1, int param1Int2, int param1Int3, boolean param1Boolean) {
      if (!param1Boolean && param1Int1 == AndroidLiveWallpaperService.this.viewFormat && param1Int2 == AndroidLiveWallpaperService.this.viewWidth && param1Int3 == AndroidLiveWallpaperService.this.viewHeight) {
        if (AndroidLiveWallpaperService.DEBUG)
          Log.d("WallpaperService", " > surface is current, skipping surfaceChanged event"); 
      } else {
        this.engineFormat = param1Int1;
        this.engineWidth = param1Int2;
        this.engineHeight = param1Int3;
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          AndroidLiveWallpaperService androidLiveWallpaperService = AndroidLiveWallpaperService.this;
          androidLiveWallpaperService.viewFormat = this.engineFormat;
          androidLiveWallpaperService.viewWidth = this.engineWidth;
          androidLiveWallpaperService.viewHeight = this.engineHeight;
          androidLiveWallpaperService.view.surfaceChanged(getSurfaceHolder(), AndroidLiveWallpaperService.this.viewFormat, AndroidLiveWallpaperService.this.viewWidth, AndroidLiveWallpaperService.this.viewHeight);
        } else if (AndroidLiveWallpaperService.DEBUG) {
          Log.d("WallpaperService", " > engine is not active, skipping surfaceChanged event");
        } 
      } 
    }
    
    private void notifyVisibilityChanged(boolean param1Boolean) {
      if (this.engineIsVisible != param1Boolean) {
        this.engineIsVisible = param1Boolean;
        if (this.engineIsVisible) {
          onResume();
        } else {
          onPause();
        } 
      } else if (AndroidLiveWallpaperService.DEBUG) {
        Log.d("WallpaperService", " > visible state is current, skipping visibilityChanged event!");
      } 
    }
    
    protected void notifyIconDropped() {
      if (AndroidLiveWallpaperService.this.linkedEngine == this && this.this$0.app.listener instanceof AndroidWallpaperListener && !this.iconDropConsumed) {
        this.iconDropConsumed = true;
        AndroidLiveWallpaperService.this.app.postRunnable(new Runnable() {
              public void run() {
                synchronized (AndroidLiveWallpaperService.this.sync) {
                  boolean bool;
                  if (AndroidLiveWallpaperService.this.linkedEngine == AndroidLiveWallpaperService.AndroidWallpaperEngine.this) {
                    bool = true;
                  } else {
                    bool = false;
                  } 
                  if (bool)
                    ((AndroidWallpaperListener)this.this$1.this$0.app.listener).iconDropped(AndroidLiveWallpaperService.AndroidWallpaperEngine.this.xIconDrop, AndroidLiveWallpaperService.AndroidWallpaperEngine.this.yIconDrop); 
                  return;
                } 
              }
            });
      } 
    }
    
    protected void notifyOffsetsChanged() {
      if (AndroidLiveWallpaperService.this.linkedEngine == this && this.this$0.app.listener instanceof AndroidWallpaperListener && !this.offsetsConsumed) {
        this.offsetsConsumed = true;
        AndroidLiveWallpaperService.this.app.postRunnable(new Runnable() {
              public void run() {
                synchronized (AndroidLiveWallpaperService.this.sync) {
                  boolean bool;
                  if (AndroidLiveWallpaperService.this.linkedEngine == AndroidLiveWallpaperService.AndroidWallpaperEngine.this) {
                    bool = true;
                  } else {
                    bool = false;
                  } 
                  if (bool)
                    ((AndroidWallpaperListener)this.this$1.this$0.app.listener).offsetChange(AndroidLiveWallpaperService.AndroidWallpaperEngine.this.xOffset, AndroidLiveWallpaperService.AndroidWallpaperEngine.this.yOffset, AndroidLiveWallpaperService.AndroidWallpaperEngine.this.xOffsetStep, AndroidLiveWallpaperService.AndroidWallpaperEngine.this.yOffsetStep, AndroidLiveWallpaperService.AndroidWallpaperEngine.this.xPixelOffset, AndroidLiveWallpaperService.AndroidWallpaperEngine.this.yPixelOffset); 
                  return;
                } 
              }
            });
      } 
    }
    
    protected void notifyPreviewState() {
      if (AndroidLiveWallpaperService.this.linkedEngine == this && this.this$0.app.listener instanceof AndroidWallpaperListener) {
        final boolean currentPreviewState = AndroidLiveWallpaperService.this.linkedEngine.isPreview();
        AndroidLiveWallpaperService.this.app.postRunnable(new Runnable() {
              public void run() {
                synchronized (AndroidLiveWallpaperService.this.sync) {
                  boolean bool = AndroidLiveWallpaperService.this.isPreviewNotified;
                  boolean bool1 = true;
                  if (!bool || AndroidLiveWallpaperService.this.notifiedPreviewState != currentPreviewState) {
                    AndroidLiveWallpaperService.this.notifiedPreviewState = currentPreviewState;
                    AndroidLiveWallpaperService.this.isPreviewNotified = true;
                  } else {
                    bool1 = false;
                  } 
                  if (bool1) {
                    null = AndroidLiveWallpaperService.this.app;
                    if (null != null)
                      ((AndroidWallpaperListener)null.listener).previewStateChange(currentPreviewState); 
                  } 
                  return;
                } 
              }
            });
      } 
    }
    
    public Bundle onCommand(String param1String, int param1Int1, int param1Int2, int param1Int3, Bundle param1Bundle, boolean param1Boolean) {
      if (AndroidLiveWallpaperService.DEBUG) {
        boolean bool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onCommand(");
        stringBuilder.append(param1String);
        stringBuilder.append(" ");
        stringBuilder.append(param1Int1);
        stringBuilder.append(" ");
        stringBuilder.append(param1Int2);
        stringBuilder.append(" ");
        stringBuilder.append(param1Int3);
        stringBuilder.append(" ");
        stringBuilder.append(param1Bundle);
        stringBuilder.append(" ");
        stringBuilder.append(param1Boolean);
        stringBuilder.append("), linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          bool = true;
        } else {
          bool = false;
        } 
        stringBuilder.append(bool);
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      if (param1String.equals("android.home.drop")) {
        this.iconDropConsumed = false;
        this.xIconDrop = param1Int1;
        this.yIconDrop = param1Int2;
        notifyIconDropped();
      } 
      return super.onCommand(param1String, param1Int1, param1Int2, param1Int3, param1Bundle, param1Boolean);
    }
    
    public void onCreate(SurfaceHolder param1SurfaceHolder) {
      if (AndroidLiveWallpaperService.DEBUG) {
        boolean bool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onCreate() ");
        stringBuilder.append(hashCode());
        stringBuilder.append(" running: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.engines);
        stringBuilder.append(", linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          bool = true;
        } else {
          bool = false;
        } 
        stringBuilder.append(bool);
        stringBuilder.append(", thread: ");
        stringBuilder.append(Thread.currentThread().toString());
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      super.onCreate(param1SurfaceHolder);
    }
    
    public void onDestroy() { super.onDestroy(); }
    
    public void onOffsetsChanged(float param1Float1, float param1Float2, float param1Float3, float param1Float4, int param1Int1, int param1Int2) {
      this.offsetsConsumed = false;
      this.xOffset = param1Float1;
      this.yOffset = param1Float2;
      this.xOffsetStep = param1Float3;
      this.yOffsetStep = param1Float4;
      this.xPixelOffset = param1Int1;
      this.yPixelOffset = param1Int2;
      notifyOffsetsChanged();
      if (!Gdx.graphics.isContinuousRendering())
        Gdx.graphics.requestRendering(); 
      super.onOffsetsChanged(param1Float1, param1Float2, param1Float3, param1Float4, param1Int1, param1Int2);
    }
    
    public void onPause() {
      AndroidLiveWallpaperService androidLiveWallpaperService = AndroidLiveWallpaperService.this;
      androidLiveWallpaperService.visibleEngines--;
      if (AndroidLiveWallpaperService.DEBUG) {
        boolean bool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onPause() ");
        stringBuilder.append(hashCode());
        stringBuilder.append(", running: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.engines);
        stringBuilder.append(", linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          bool = true;
        } else {
          bool = false;
        } 
        stringBuilder.append(bool);
        stringBuilder.append(", visible: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.visibleEngines);
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      Log.i("WallpaperService", "engine paused");
      if (AndroidLiveWallpaperService.this.visibleEngines >= AndroidLiveWallpaperService.this.engines) {
        Log.e("WallpaperService", "wallpaper lifecycle error, counted too many visible engines! repairing..");
        androidLiveWallpaperService = AndroidLiveWallpaperService.this;
        androidLiveWallpaperService.visibleEngines = Math.max(androidLiveWallpaperService.engines - 1, 0);
      } 
      if (AndroidLiveWallpaperService.this.linkedEngine != null && AndroidLiveWallpaperService.this.visibleEngines == 0)
        AndroidLiveWallpaperService.this.app.onPause(); 
      if (AndroidLiveWallpaperService.DEBUG)
        Log.d("WallpaperService", " > AndroidWallpaperEngine - onPause() done!"); 
    }
    
    public void onResume() {
      AndroidLiveWallpaperService androidLiveWallpaperService = AndroidLiveWallpaperService.this;
      androidLiveWallpaperService.visibleEngines++;
      if (AndroidLiveWallpaperService.DEBUG) {
        boolean bool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onResume() ");
        stringBuilder.append(hashCode());
        stringBuilder.append(", running: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.engines);
        stringBuilder.append(", linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          bool = true;
        } else {
          bool = false;
        } 
        stringBuilder.append(bool);
        stringBuilder.append(", visible: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.visibleEngines);
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      Log.i("WallpaperService", "engine resumed");
      if (AndroidLiveWallpaperService.this.linkedEngine != null) {
        if (AndroidLiveWallpaperService.this.linkedEngine != this) {
          AndroidLiveWallpaperService.this.setLinkedEngine(this);
          AndroidLiveWallpaperService.this.view.surfaceDestroyed(getSurfaceHolder());
          notifySurfaceChanged(this.engineFormat, this.engineWidth, this.engineHeight, false);
          AndroidLiveWallpaperService.this.view.surfaceCreated(getSurfaceHolder());
        } else {
          notifySurfaceChanged(this.engineFormat, this.engineWidth, this.engineHeight, false);
        } 
        if (AndroidLiveWallpaperService.this.visibleEngines == 1)
          AndroidLiveWallpaperService.this.app.onResume(); 
        notifyPreviewState();
        notifyOffsetsChanged();
        if (!Gdx.graphics.isContinuousRendering())
          Gdx.graphics.requestRendering(); 
      } 
    }
    
    public void onSurfaceChanged(SurfaceHolder param1SurfaceHolder, int param1Int1, int param1Int2, int param1Int3) {
      if (AndroidLiveWallpaperService.DEBUG) {
        boolean bool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onSurfaceChanged() isPreview: ");
        stringBuilder.append(isPreview());
        stringBuilder.append(", ");
        stringBuilder.append(hashCode());
        stringBuilder.append(", running: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.engines);
        stringBuilder.append(", linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          bool = true;
        } else {
          bool = false;
        } 
        stringBuilder.append(bool);
        stringBuilder.append(", sufcace valid: ");
        stringBuilder.append(getSurfaceHolder().getSurface().isValid());
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      Log.i("WallpaperService", "engine surface changed");
      super.onSurfaceChanged(param1SurfaceHolder, param1Int1, param1Int2, param1Int3);
      notifySurfaceChanged(param1Int1, param1Int2, param1Int3, true);
    }
    
    public void onSurfaceCreated(SurfaceHolder param1SurfaceHolder) {
      AndroidLiveWallpaperService androidLiveWallpaperService = AndroidLiveWallpaperService.this;
      androidLiveWallpaperService.engines++;
      AndroidLiveWallpaperService.this.setLinkedEngine(this);
      if (AndroidLiveWallpaperService.DEBUG) {
        boolean bool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onSurfaceCreated() ");
        stringBuilder.append(hashCode());
        stringBuilder.append(", running: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.engines);
        stringBuilder.append(", linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine == this) {
          bool = true;
        } else {
          bool = false;
        } 
        stringBuilder.append(bool);
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      Log.i("WallpaperService", "engine surface created");
      super.onSurfaceCreated(param1SurfaceHolder);
      if (AndroidLiveWallpaperService.this.engines == 1)
        AndroidLiveWallpaperService.this.visibleEngines = 0; 
      if (AndroidLiveWallpaperService.this.engines == 1 && AndroidLiveWallpaperService.this.app == null) {
        androidLiveWallpaperService = AndroidLiveWallpaperService.this;
        androidLiveWallpaperService.viewFormat = 0;
        androidLiveWallpaperService.viewWidth = 0;
        androidLiveWallpaperService.viewHeight = 0;
        androidLiveWallpaperService.app = new AndroidLiveWallpaper(androidLiveWallpaperService);
        AndroidLiveWallpaperService.this.onCreateApplication();
        if (this.this$0.app.graphics == null)
          throw new Error("You must override 'AndroidLiveWallpaperService.onCreateApplication' method and call 'initialize' from its body."); 
      } 
      androidLiveWallpaperService = AndroidLiveWallpaperService.this;
      androidLiveWallpaperService.view = (SurfaceHolder.Callback)androidLiveWallpaperService.app.graphics.view;
      getSurfaceHolder().removeCallback(AndroidLiveWallpaperService.this.view);
      this.engineFormat = AndroidLiveWallpaperService.this.viewFormat;
      this.engineWidth = AndroidLiveWallpaperService.this.viewWidth;
      this.engineHeight = AndroidLiveWallpaperService.this.viewHeight;
      if (AndroidLiveWallpaperService.this.engines == 1) {
        AndroidLiveWallpaperService.this.view.surfaceCreated(param1SurfaceHolder);
      } else {
        AndroidLiveWallpaperService.this.view.surfaceDestroyed(param1SurfaceHolder);
        notifySurfaceChanged(this.engineFormat, this.engineWidth, this.engineHeight, false);
        AndroidLiveWallpaperService.this.view.surfaceCreated(param1SurfaceHolder);
      } 
      notifyPreviewState();
      notifyOffsetsChanged();
      if (!Gdx.graphics.isContinuousRendering())
        Gdx.graphics.requestRendering(); 
    }
    
    public void onSurfaceDestroyed(SurfaceHolder param1SurfaceHolder) {
      AndroidLiveWallpaperService androidLiveWallpaperService = AndroidLiveWallpaperService.this;
      int i = androidLiveWallpaperService.engines;
      boolean bool = true;
      androidLiveWallpaperService.engines = i - 1;
      if (AndroidLiveWallpaperService.DEBUG) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onSurfaceDestroyed() ");
        stringBuilder.append(hashCode());
        stringBuilder.append(", running: ");
        stringBuilder.append(AndroidLiveWallpaperService.this.engines);
        stringBuilder.append(" ,linked: ");
        if (AndroidLiveWallpaperService.this.linkedEngine != this)
          bool = false; 
        stringBuilder.append(bool);
        stringBuilder.append(", isVisible: ");
        stringBuilder.append(this.engineIsVisible);
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      Log.i("WallpaperService", "engine surface destroyed");
      if (AndroidLiveWallpaperService.this.engines == 0)
        AndroidLiveWallpaperService.this.onDeepPauseApplication(); 
      if (AndroidLiveWallpaperService.this.linkedEngine == this && AndroidLiveWallpaperService.this.view != null)
        AndroidLiveWallpaperService.this.view.surfaceDestroyed(param1SurfaceHolder); 
      this.engineFormat = 0;
      this.engineWidth = 0;
      this.engineHeight = 0;
      if (AndroidLiveWallpaperService.this.engines == 0)
        AndroidLiveWallpaperService.this.linkedEngine = null; 
      super.onSurfaceDestroyed(param1SurfaceHolder);
    }
    
    public void onTouchEvent(MotionEvent param1MotionEvent) {
      if (AndroidLiveWallpaperService.this.linkedEngine == this)
        this.this$0.app.input.onTouch(null, param1MotionEvent); 
    }
    
    public void onVisibilityChanged(boolean param1Boolean) {
      boolean bool = isVisible();
      if (AndroidLiveWallpaperService.DEBUG) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" > AndroidWallpaperEngine - onVisibilityChanged(paramVisible: ");
        stringBuilder.append(param1Boolean);
        stringBuilder.append(" reportedVisible: ");
        stringBuilder.append(bool);
        stringBuilder.append(") ");
        stringBuilder.append(hashCode());
        stringBuilder.append(", sufcace valid: ");
        stringBuilder.append(getSurfaceHolder().getSurface().isValid());
        Log.d("WallpaperService", stringBuilder.toString());
      } 
      super.onVisibilityChanged(param1Boolean);
      if (!bool && param1Boolean == true) {
        if (AndroidLiveWallpaperService.DEBUG)
          Log.d("WallpaperService", " > fake visibilityChanged event! Android WallpaperService likes do that!"); 
        return;
      } 
      notifyVisibilityChanged(param1Boolean);
    }
  }
  
  class null implements Runnable {
    null() {}
    
    public void run() {
      synchronized (AndroidLiveWallpaperService.this.sync) {
        boolean bool;
        if (AndroidLiveWallpaperService.this.linkedEngine == this.this$1) {
          bool = true;
        } else {
          bool = false;
        } 
        if (bool)
          ((AndroidWallpaperListener)this.this$1.this$0.app.listener).iconDropped(this.this$1.xIconDrop, this.this$1.yIconDrop); 
        return;
      } 
    }
  }
  
  class null implements Runnable {
    null() {}
    
    public void run() {
      synchronized (AndroidLiveWallpaperService.this.sync) {
        boolean bool;
        if (AndroidLiveWallpaperService.this.linkedEngine == this.this$1) {
          bool = true;
        } else {
          bool = false;
        } 
        if (bool)
          ((AndroidWallpaperListener)this.this$1.this$0.app.listener).offsetChange(this.this$1.xOffset, this.this$1.yOffset, this.this$1.xOffsetStep, this.this$1.yOffsetStep, this.this$1.xPixelOffset, this.this$1.yPixelOffset); 
        return;
      } 
    }
  }
  
  class null implements Runnable {
    public void run() {
      synchronized (AndroidLiveWallpaperService.this.sync) {
        boolean bool = AndroidLiveWallpaperService.this.isPreviewNotified;
        boolean bool1 = true;
        if (!bool || AndroidLiveWallpaperService.this.notifiedPreviewState != currentPreviewState) {
          AndroidLiveWallpaperService.this.notifiedPreviewState = currentPreviewState;
          AndroidLiveWallpaperService.this.isPreviewNotified = true;
        } else {
          bool1 = false;
        } 
        if (bool1) {
          null = AndroidLiveWallpaperService.this.app;
          if (null != null)
            ((AndroidWallpaperListener)null.listener).previewStateChange(currentPreviewState); 
        } 
        return;
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidLiveWallpaperService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */