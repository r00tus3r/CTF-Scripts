package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.TimeUtils;

public class FPSLogger {
  long startTime = TimeUtils.nanoTime();
  
  public void log() {
    if (TimeUtils.nanoTime() - this.startTime > 1000000000L) {
      Application application = Gdx.app;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("fps: ");
      stringBuilder.append(Gdx.graphics.getFramesPerSecond());
      application.log("FPSLogger", stringBuilder.toString());
      this.startTime = TimeUtils.nanoTime();
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/FPSLogger.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */