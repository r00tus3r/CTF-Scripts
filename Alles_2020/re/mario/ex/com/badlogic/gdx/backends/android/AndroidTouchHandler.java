package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.view.MotionEvent;

public interface AndroidTouchHandler {
  void onTouch(MotionEvent paramMotionEvent, AndroidInput paramAndroidInput);
  
  boolean supportsMultitouch(Context paramContext);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidTouchHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */