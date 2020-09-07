package com.badlogic.gdx.backends.android;

import android.view.View;

public class AndroidVisibilityListener {
  public void createListener(AndroidApplicationBase paramAndroidApplicationBase) {
    try {
      View view = paramAndroidApplicationBase.getApplicationWindow().getDecorView();
      View.OnSystemUiVisibilityChangeListener onSystemUiVisibilityChangeListener = new View.OnSystemUiVisibilityChangeListener() {
          public void onSystemUiVisibilityChange(int param1Int) { application.getHandler().post(new Runnable() {
                  public void run() { application.useImmersiveMode(true); }
                }); }
        };
      super(this, paramAndroidApplicationBase);
      view.setOnSystemUiVisibilityChangeListener(onSystemUiVisibilityChangeListener);
    } catch (Throwable throwable) {
      paramAndroidApplicationBase.log("AndroidApplication", "Can't create OnSystemUiVisibilityChangeListener, unable to use immersive mode.", throwable);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidVisibilityListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */