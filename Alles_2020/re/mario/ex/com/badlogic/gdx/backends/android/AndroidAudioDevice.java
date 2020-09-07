package com.badlogic.gdx.backends.android;

import android.media.AudioTrack;
import com.badlogic.gdx.audio.AudioDevice;

class AndroidAudioDevice implements AudioDevice {
  private short[] buffer = new short[1024];
  
  private final boolean isMono;
  
  private final int latency;
  
  private final AudioTrack track;
  
  AndroidAudioDevice(int paramInt, boolean paramBoolean) {
    this.isMono = paramBoolean;
    if (paramBoolean) {
      b = 4;
    } else {
      b = 12;
    } 
    int i = 2;
    int j = AudioTrack.getMinBufferSize(paramInt, b, 2);
    if (paramBoolean) {
      b = 4;
    } else {
      b = 12;
    } 
    this.track = new AudioTrack(3, paramInt, b, 2, j, true);
    this.track.play();
    paramInt = i;
    if (paramBoolean)
      paramInt = 1; 
    this.latency = j / paramInt;
  }
  
  public void dispose() {
    this.track.stop();
    this.track.release();
  }
  
  public int getLatency() { return this.latency; }
  
  public boolean isMono() { return this.isMono; }
  
  public void setVolume(float paramFloat) { this.track.setStereoVolume(paramFloat, paramFloat); }
  
  public void writeSamples(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (this.buffer.length < paramArrayOfFloat.length)
      this.buffer = new short[paramArrayOfFloat.length]; 
    byte b = 0;
    int i = paramInt1;
    while (i < paramInt1 + paramInt2) {
      float f1 = paramArrayOfFloat[i];
      float f2 = f1;
      if (f1 > 1.0F)
        f2 = 1.0F; 
      f1 = f2;
      if (f2 < -1.0F)
        f1 = -1.0F; 
      short s = (short)(int)(f1 * 32767.0F);
      this.buffer[b] = (short)s;
      i++;
      b++;
    } 
    for (paramInt1 = this.track.write(this.buffer, 0, paramInt2); paramInt1 != paramInt2; paramInt1 += this.track.write(this.buffer, paramInt1, paramInt2 - paramInt1));
  }
  
  public void writeSamples(short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    int i;
    for (i = this.track.write(paramArrayOfShort, paramInt1, paramInt2); i != paramInt2; i += this.track.write(paramArrayOfShort, paramInt1 + i, paramInt2 - i));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidAudioDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */