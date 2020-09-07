package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.View;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20API18;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;
import com.badlogic.gdx.utils.GdxRuntimeException;
import javax.microedition.khronos.opengles.GL10;

public final class AndroidGraphicsLiveWallpaper extends AndroidGraphics {
  public AndroidGraphicsLiveWallpaper(AndroidLiveWallpaper paramAndroidLiveWallpaper, AndroidApplicationConfiguration paramAndroidApplicationConfiguration, ResolutionStrategy paramResolutionStrategy) { super(paramAndroidLiveWallpaper, paramAndroidApplicationConfiguration, paramResolutionStrategy, false); }
  
  protected View createGLSurfaceView(AndroidApplicationBase paramAndroidApplicationBase, ResolutionStrategy paramResolutionStrategy) {
    if (checkGL20()) {
      GLSurfaceView20API18 gLSurfaceView20API18;
      GLSurfaceView.EGLConfigChooser eGLConfigChooser = getEglConfigChooser();
      if (Build.VERSION.SDK_INT <= 10 && this.config.useGLSurfaceView20API18) {
        gLSurfaceView20API18 = new GLSurfaceView20API18(paramAndroidApplicationBase.getContext(), paramResolutionStrategy) {
            public SurfaceHolder getHolder() { return AndroidGraphicsLiveWallpaper.this.getSurfaceHolder(); }
            
            public void onDestroy() { onDetachedFromWindow(); }
          };
        if (eGLConfigChooser != null) {
          gLSurfaceView20API18.setEGLConfigChooser(eGLConfigChooser);
        } else {
          gLSurfaceView20API18.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
        } 
        gLSurfaceView20API18.setRenderer(this);
        return gLSurfaceView20API18;
      } 
      GLSurfaceView20 gLSurfaceView20 = new GLSurfaceView20(gLSurfaceView20API18.getContext(), paramResolutionStrategy) {
          public SurfaceHolder getHolder() { return AndroidGraphicsLiveWallpaper.this.getSurfaceHolder(); }
          
          public void onDestroy() { onDetachedFromWindow(); }
        };
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
  
  SurfaceHolder getSurfaceHolder() {
    synchronized (((AndroidLiveWallpaper)this.app).service.sync) {
      return ((AndroidLiveWallpaper)this.app).service.getSurfaceHolder();
    } 
  }
  
  protected void logManagedCachesStatus() {
    if (AndroidLiveWallpaperService.DEBUG)
      super.logManagedCachesStatus(); 
  }
  
  public void onDestroyGLSurfaceView() {
    if (this.view != null && (this.view instanceof GLSurfaceView || this.view instanceof com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18))
      try {
        this.view.getClass().getMethod("onDestroy", new Class[0]).invoke(this.view, new Object[0]);
        if (AndroidLiveWallpaperService.DEBUG)
          Log.d("WallpaperService", " > AndroidLiveWallpaper - onDestroy() stopped GLThread managed by GLSurfaceView"); 
      } catch (Throwable throwable) {
        Log.e("WallpaperService", "failed to destroy GLSurfaceView's thread! GLSurfaceView.onDetachedFromWindow impl changed since API lvl 16!");
        throwable.printStackTrace();
      }  
  }
  
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
      if (this.resume) {
        this.resume = false;
        this.synch.notifyAll();
      } 
      if (this.pause) {
        this.pause = false;
        this.synch.notifyAll();
      } 
      if (this.destroy) {
        this.destroy = false;
        this.synch.notifyAll();
      } 
      if (bool4) {
        this.app.getApplicationListener().resume();
        Gdx.app.log("AndroidGraphics", "resumed");
      } 
      if (bool1)
        synchronized (this.app.getRunnables()) {
          this.app.getExecutedRunnables().clear();
          this.app.getExecutedRunnables().addAll(this.app.getRunnables());
          this.app.getRunnables().clear();
          byte b = 0;
          while (true) {
            int i = (this.app.getExecutedRunnables()).size;
            if (b < i) {
              try {
                ((Runnable)this.app.getExecutedRunnables().get(b)).run();
              } catch (Throwable throwable) {
                throwable.printStackTrace();
              } 
              b++;
              continue;
            } 
            break;
          } 
          this.app.getInput().processEvents();
          this.frameId++;
          this.app.getApplicationListener().render();
        }  
      if (bool2) {
        this.app.getApplicationListener().pause();
        Gdx.app.log("AndroidGraphics", "paused");
      } 
      if (bool3) {
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
  
  void resume() {
    synchronized (this.synch) {
      this.running = true;
      this.resume = true;
      while (true) {
        boolean bool = this.resume;
        if (bool)
          try {
            requestRendering();
            this.synch.wait();
            continue;
          } catch (InterruptedException interruptedException) {
            Gdx.app.log("AndroidGraphics", "waiting for resume synchronization failed!");
            continue;
          }  
        break;
      } 
      return;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidGraphicsLiveWallpaper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */