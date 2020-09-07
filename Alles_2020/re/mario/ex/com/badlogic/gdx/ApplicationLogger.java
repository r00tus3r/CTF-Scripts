package com.badlogic.gdx;

public interface ApplicationLogger {
  void debug(String paramString1, String paramString2);
  
  void debug(String paramString1, String paramString2, Throwable paramThrowable);
  
  void error(String paramString1, String paramString2);
  
  void error(String paramString1, String paramString2, Throwable paramThrowable);
  
  void log(String paramString1, String paramString2);
  
  void log(String paramString1, String paramString2, Throwable paramThrowable);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/ApplicationLogger.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */