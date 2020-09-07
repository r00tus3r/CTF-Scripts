package com.badlogic.gdx.audio;

import com.badlogic.gdx.utils.Disposable;

public interface Music extends Disposable {
  void dispose();
  
  float getPosition();
  
  float getVolume();
  
  boolean isLooping();
  
  boolean isPlaying();
  
  void pause();
  
  void play();
  
  void setLooping(boolean paramBoolean);
  
  void setOnCompletionListener(OnCompletionListener paramOnCompletionListener);
  
  void setPan(float paramFloat1, float paramFloat2);
  
  void setPosition(float paramFloat);
  
  void setVolume(float paramFloat);
  
  void stop();
  
  public static interface OnCompletionListener {
    void onCompletion(Music param1Music);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/audio/Music.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */