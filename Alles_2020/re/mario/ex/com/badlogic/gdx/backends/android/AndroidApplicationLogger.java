package com.badlogic.gdx.backends.android;

import android.util.Log;
import com.badlogic.gdx.ApplicationLogger;

public class AndroidApplicationLogger implements ApplicationLogger {
  public void debug(String paramString1, String paramString2) { Log.d(paramString1, paramString2); }
  
  public void debug(String paramString1, String paramString2, Throwable paramThrowable) { Log.d(paramString1, paramString2, paramThrowable); }
  
  public void error(String paramString1, String paramString2) { Log.e(paramString1, paramString2); }
  
  public void error(String paramString1, String paramString2, Throwable paramThrowable) { Log.e(paramString1, paramString2, paramThrowable); }
  
  public void log(String paramString1, String paramString2) { Log.i(paramString1, paramString2); }
  
  public void log(String paramString1, String paramString2, Throwable paramThrowable) { Log.i(paramString1, paramString2, paramThrowable); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidApplicationLogger.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */