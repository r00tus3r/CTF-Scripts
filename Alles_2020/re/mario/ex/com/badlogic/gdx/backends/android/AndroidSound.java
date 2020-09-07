package com.badlogic.gdx.backends.android;

import android.media.AudioManager;
import android.media.SoundPool;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.utils.IntArray;

final class AndroidSound implements Sound {
  final AudioManager manager;
  
  final int soundId;
  
  final SoundPool soundPool;
  
  final IntArray streamIds = new IntArray(8);
  
  AndroidSound(SoundPool paramSoundPool, AudioManager paramAudioManager, int paramInt) {
    this.soundPool = paramSoundPool;
    this.manager = paramAudioManager;
    this.soundId = paramInt;
  }
  
  public void dispose() { this.soundPool.unload(this.soundId); }
  
  public long loop() { return loop(1.0F); }
  
  public long loop(float paramFloat) {
    if (this.streamIds.size == 8)
      this.streamIds.pop(); 
    int i = this.soundPool.play(this.soundId, paramFloat, paramFloat, 1, -1, 1.0F);
    if (i == 0)
      return -1L; 
    this.streamIds.insert(0, i);
    return i;
  }
  
  public long loop(float paramFloat1, float paramFloat2, float paramFloat3) {
    if (this.streamIds.size == 8)
      this.streamIds.pop(); 
    if (paramFloat3 < 0.0F) {
      float f = Math.abs(paramFloat3);
      paramFloat3 = paramFloat1;
      f = paramFloat1 * (1.0F - f);
      paramFloat1 = paramFloat3;
      paramFloat3 = f;
    } else if (paramFloat3 > 0.0F) {
      float f = Math.abs(paramFloat3);
      paramFloat3 = paramFloat1;
      paramFloat1 *= (1.0F - f);
    } else {
      paramFloat3 = paramFloat1;
    } 
    int i = this.soundPool.play(this.soundId, paramFloat1, paramFloat3, 1, -1, paramFloat2);
    if (i == 0)
      return -1L; 
    this.streamIds.insert(0, i);
    return i;
  }
  
  public void pause() { this.soundPool.autoPause(); }
  
  public void pause(long paramLong) { this.soundPool.pause((int)paramLong); }
  
  public long play() { return play(1.0F); }
  
  public long play(float paramFloat) {
    if (this.streamIds.size == 8)
      this.streamIds.pop(); 
    int i = this.soundPool.play(this.soundId, paramFloat, paramFloat, 1, 0, 1.0F);
    if (i == 0)
      return -1L; 
    this.streamIds.insert(0, i);
    return i;
  }
  
  public long play(float paramFloat1, float paramFloat2, float paramFloat3) {
    if (this.streamIds.size == 8)
      this.streamIds.pop(); 
    if (paramFloat3 < 0.0F) {
      float f = Math.abs(paramFloat3);
      paramFloat3 = paramFloat1;
      f = paramFloat1 * (1.0F - f);
      paramFloat1 = paramFloat3;
      paramFloat3 = f;
    } else if (paramFloat3 > 0.0F) {
      float f = Math.abs(paramFloat3);
      paramFloat3 = paramFloat1;
      paramFloat1 *= (1.0F - f);
    } else {
      paramFloat3 = paramFloat1;
    } 
    int i = this.soundPool.play(this.soundId, paramFloat1, paramFloat3, 1, 0, paramFloat2);
    if (i == 0)
      return -1L; 
    this.streamIds.insert(0, i);
    return i;
  }
  
  public void resume() { this.soundPool.autoResume(); }
  
  public void resume(long paramLong) { this.soundPool.resume((int)paramLong); }
  
  public void setLooping(long paramLong, boolean paramBoolean) {
    byte b;
    SoundPool soundPool1 = this.soundPool;
    int i = (int)paramLong;
    if (paramBoolean) {
      b = -1;
    } else {
      b = 0;
    } 
    soundPool1.setLoop(i, b);
  }
  
  public void setPan(long paramLong, float paramFloat1, float paramFloat2) {
    if (paramFloat1 < 0.0F) {
      paramFloat1 = paramFloat2 * (1.0F - Math.abs(paramFloat1));
    } else if (paramFloat1 > 0.0F) {
      float f = paramFloat2 * (1.0F - Math.abs(paramFloat1));
      paramFloat1 = paramFloat2;
      paramFloat2 = f;
    } else {
      paramFloat1 = paramFloat2;
    } 
    this.soundPool.setVolume((int)paramLong, paramFloat2, paramFloat1);
  }
  
  public void setPitch(long paramLong, float paramFloat) { this.soundPool.setRate((int)paramLong, paramFloat); }
  
  public void setVolume(long paramLong, float paramFloat) { this.soundPool.setVolume((int)paramLong, paramFloat, paramFloat); }
  
  public void stop() {
    int i = this.streamIds.size;
    for (byte b = 0; b < i; b++)
      this.soundPool.stop(this.streamIds.get(b)); 
  }
  
  public void stop(long paramLong) { this.soundPool.stop((int)paramLong); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidSound.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */