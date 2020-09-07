package com.badlogic.gdx;

import com.badlogic.gdx.utils.Clipboard;

public interface Application {
  public static final int LOG_DEBUG = 3;
  
  public static final int LOG_ERROR = 1;
  
  public static final int LOG_INFO = 2;
  
  public static final int LOG_NONE = 0;
  
  void addLifecycleListener(LifecycleListener paramLifecycleListener);
  
  void debug(String paramString1, String paramString2);
  
  void debug(String paramString1, String paramString2, Throwable paramThrowable);
  
  void error(String paramString1, String paramString2);
  
  void error(String paramString1, String paramString2, Throwable paramThrowable);
  
  void exit();
  
  ApplicationListener getApplicationListener();
  
  ApplicationLogger getApplicationLogger();
  
  Audio getAudio();
  
  Clipboard getClipboard();
  
  Files getFiles();
  
  Graphics getGraphics();
  
  Input getInput();
  
  long getJavaHeap();
  
  int getLogLevel();
  
  long getNativeHeap();
  
  Net getNet();
  
  Preferences getPreferences(String paramString);
  
  ApplicationType getType();
  
  int getVersion();
  
  void log(String paramString1, String paramString2);
  
  void log(String paramString1, String paramString2, Throwable paramThrowable);
  
  void postRunnable(Runnable paramRunnable);
  
  void removeLifecycleListener(LifecycleListener paramLifecycleListener);
  
  void setApplicationLogger(ApplicationLogger paramApplicationLogger);
  
  void setLogLevel(int paramInt);
  
  public enum ApplicationType {
    Android, Applet, Desktop, HeadlessDesktop, WebGL, iOS;
    
    static  {
      Applet = new ApplicationType("Applet", 3);
      WebGL = new ApplicationType("WebGL", 4);
      iOS = new ApplicationType("iOS", 5);
      $VALUES = new ApplicationType[] { Android, Desktop, HeadlessDesktop, Applet, WebGL, iOS };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Application.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */