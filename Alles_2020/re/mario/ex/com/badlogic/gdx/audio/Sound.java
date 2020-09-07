package com.badlogic.gdx.audio;

import com.badlogic.gdx.utils.Disposable;

public interface Sound extends Disposable {
  void dispose();
  
  long loop();
  
  long loop(float paramFloat);
  
  long loop(float paramFloat1, float paramFloat2, float paramFloat3);
  
  void pause();
  
  void pause(long paramLong);
  
  long play();
  
  long play(float paramFloat);
  
  long play(float paramFloat1, float paramFloat2, float paramFloat3);
  
  void resume();
  
  void resume(long paramLong);
  
  void setLooping(long paramLong, boolean paramBoolean);
  
  void setPan(long paramLong, float paramFloat1, float paramFloat2);
  
  void setPitch(long paramLong, float paramFloat);
  
  void setVolume(long paramLong, float paramFloat);
  
  void stop();
  
  void stop(long paramLong);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/audio/Sound.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */