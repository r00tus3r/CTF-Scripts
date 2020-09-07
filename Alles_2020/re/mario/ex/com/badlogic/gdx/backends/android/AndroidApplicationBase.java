package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.view.Window;
import android.view.WindowManager;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.LifecycleListener;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.SnapshotArray;

public interface AndroidApplicationBase extends Application {
  public static final int MINIMUM_SDK = 9;
  
  Window getApplicationWindow();
  
  Context getContext();
  
  Array<Runnable> getExecutedRunnables();
  
  Handler getHandler();
  
  AndroidInput getInput();
  
  SnapshotArray<LifecycleListener> getLifecycleListeners();
  
  Array<Runnable> getRunnables();
  
  WindowManager getWindowManager();
  
  void runOnUiThread(Runnable paramRunnable);
  
  void startActivity(Intent paramIntent);
  
  void useImmersiveMode(boolean paramBoolean);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidApplicationBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */