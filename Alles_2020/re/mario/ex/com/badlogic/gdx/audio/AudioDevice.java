package com.badlogic.gdx.audio;

import com.badlogic.gdx.utils.Disposable;

public interface AudioDevice extends Disposable {
  void dispose();
  
  int getLatency();
  
  boolean isMono();
  
  void setVolume(float paramFloat);
  
  void writeSamples(float[] paramArrayOfFloat, int paramInt1, int paramInt2);
  
  void writeSamples(short[] paramArrayOfShort, int paramInt1, int paramInt2);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/audio/AudioDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */