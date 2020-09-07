package com.badlogic.gdx.backends.android;

import android.media.MediaPlayer;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.audio.Music;
import java.io.IOException;

public class AndroidMusic implements Music, MediaPlayer.OnCompletionListener {
  private final AndroidAudio audio;
  
  private boolean isPrepared = true;
  
  protected Music.OnCompletionListener onCompletionListener;
  
  private MediaPlayer player;
  
  private float volume = 1.0F;
  
  protected boolean wasPlaying = false;
  
  AndroidMusic(AndroidAudio paramAndroidAudio, MediaPlayer paramMediaPlayer) {
    this.audio = paramAndroidAudio;
    this.player = paramMediaPlayer;
    this.onCompletionListener = null;
    this.player.setOnCompletionListener(this);
  }
  
  public void dispose() {
    mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    try {
      mediaPlayer.release();
      this.player = null;
      this.onCompletionListener = null;
      synchronized (this.audio.musics) {
        this.audio.musics.remove(this);
      } 
    } catch (Throwable mediaPlayer) {
      Gdx.app.log("AndroidMusic", "error while disposing AndroidMusic instance, non-fatal");
      this.player = null;
      this.onCompletionListener = null;
      synchronized (this.audio.musics) {
        this.audio.musics.remove(this);
        return;
      } 
    } finally {
      MediaPlayer mediaPlayer1;
    } 
  }
  
  public float getDuration() {
    MediaPlayer mediaPlayer = this.player;
    return (mediaPlayer == null) ? 0.0F : (mediaPlayer.getDuration() / 1000.0F);
  }
  
  public float getPosition() {
    MediaPlayer mediaPlayer = this.player;
    return (mediaPlayer == null) ? 0.0F : (mediaPlayer.getCurrentPosition() / 1000.0F);
  }
  
  public float getVolume() { return this.volume; }
  
  public boolean isLooping() {
    mediaPlayer = this.player;
    if (mediaPlayer == null)
      return false; 
    try {
      return mediaPlayer.isLooping();
    } catch (Exception mediaPlayer) {
      mediaPlayer.printStackTrace();
      return false;
    } 
  }
  
  public boolean isPlaying() {
    mediaPlayer = this.player;
    if (mediaPlayer == null)
      return false; 
    try {
      return mediaPlayer.isPlaying();
    } catch (Exception mediaPlayer) {
      mediaPlayer.printStackTrace();
      return false;
    } 
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer) {
    if (this.onCompletionListener != null)
      Gdx.app.postRunnable(new Runnable() {
            public void run() { AndroidMusic.this.onCompletionListener.onCompletion(AndroidMusic.this); }
          }); 
  }
  
  public void pause() {
    mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    try {
      if (mediaPlayer.isPlaying())
        this.player.pause(); 
    } catch (Exception mediaPlayer) {
      mediaPlayer.printStackTrace();
    } 
    this.wasPlaying = false;
  }
  
  public void play() {
    mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    try {
      boolean bool = mediaPlayer.isPlaying();
      if (bool)
        return; 
      try {
        if (!this.isPrepared) {
          this.player.prepare();
          this.isPrepared = true;
        } 
        this.player.start();
      } catch (IllegalStateException mediaPlayer) {
        mediaPlayer.printStackTrace();
      } catch (IOException mediaPlayer) {
        mediaPlayer.printStackTrace();
      } 
      return;
    } catch (Exception mediaPlayer) {
      mediaPlayer.printStackTrace();
      return;
    } 
  }
  
  public void setLooping(boolean paramBoolean) {
    MediaPlayer mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    mediaPlayer.setLooping(paramBoolean);
  }
  
  public void setOnCompletionListener(Music.OnCompletionListener paramOnCompletionListener) { this.onCompletionListener = paramOnCompletionListener; }
  
  public void setPan(float paramFloat1, float paramFloat2) {
    float f;
    if (this.player == null)
      return; 
    if (paramFloat1 < 0.0F) {
      paramFloat1 = paramFloat2 * (1.0F - Math.abs(paramFloat1));
      f = paramFloat2;
    } else if (paramFloat1 > 0.0F) {
      f = paramFloat2 * (1.0F - Math.abs(paramFloat1));
      paramFloat1 = paramFloat2;
    } else {
      f = paramFloat2;
      paramFloat1 = f;
    } 
    this.player.setVolume(f, paramFloat1);
    this.volume = paramFloat2;
  }
  
  public void setPosition(float paramFloat) {
    mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    try {
      if (!this.isPrepared) {
        mediaPlayer.prepare();
        this.isPrepared = true;
      } 
      this.player.seekTo((int)(paramFloat * 1000.0F));
    } catch (IllegalStateException mediaPlayer) {
      mediaPlayer.printStackTrace();
    } catch (IOException mediaPlayer) {
      mediaPlayer.printStackTrace();
    } 
  }
  
  public void setVolume(float paramFloat) {
    MediaPlayer mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    mediaPlayer.setVolume(paramFloat, paramFloat);
    this.volume = paramFloat;
  }
  
  public void stop() {
    MediaPlayer mediaPlayer = this.player;
    if (mediaPlayer == null)
      return; 
    if (this.isPrepared)
      mediaPlayer.seekTo(0); 
    this.player.stop();
    this.isPrepared = false;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidMusic.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */