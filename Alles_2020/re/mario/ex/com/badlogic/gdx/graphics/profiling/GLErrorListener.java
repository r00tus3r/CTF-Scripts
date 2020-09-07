package com.badlogic.gdx.graphics.profiling;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.GdxRuntimeException;

public interface GLErrorListener {
  public static final GLErrorListener LOGGING_LISTENER = new GLErrorListener() {
      public void onError(int param1Int) {
        Exception exception1 = null;
        try {
          StackTraceElement[] arrayOfStackTraceElement = Thread.currentThread().getStackTrace();
          byte b = 0;
          while (true) {
            exception2 = exception1;
            if (b < arrayOfStackTraceElement.length) {
              if ("check".equals(arrayOfStackTraceElement[b].getMethodName())) {
                b++;
                exception2 = exception1;
                if (b < arrayOfStackTraceElement.length)
                  exception2 = arrayOfStackTraceElement[b].getMethodName(); 
                break;
              } 
              b++;
              continue;
            } 
            break;
          } 
        } catch (Exception exception2) {
          exception2 = exception1;
        } 
        if (exception2 != null) {
          Application application = Gdx.app;
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("Error ");
          stringBuilder.append(GLInterceptor.resolveErrorNumber(param1Int));
          stringBuilder.append(" from ");
          stringBuilder.append(exception2);
          application.error("GLProfiler", stringBuilder.toString());
        } else {
          Application application = Gdx.app;
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("Error ");
          stringBuilder.append(GLInterceptor.resolveErrorNumber(param1Int));
          stringBuilder.append(" at: ");
          application.error("GLProfiler", stringBuilder.toString(), new Exception());
        } 
      }
    };
  
  public static final GLErrorListener THROWING_LISTENER = new GLErrorListener() {
      public void onError(int param1Int) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("GLProfiler: Got GL error ");
        stringBuilder.append(GLInterceptor.resolveErrorNumber(param1Int));
        throw new GdxRuntimeException(stringBuilder.toString());
      }
    };
  
  void onError(int paramInt);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/profiling/GLErrorListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */