package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.os.Build;
import com.badlogic.gdx.Audio;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.audio.AudioDevice;
import com.badlogic.gdx.audio.AudioRecorder;
import com.badlogic.gdx.audio.Music;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.FileDescriptor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class AndroidAudio implements Audio {
  private final AudioManager manager;
  
  protected final List<AndroidMusic> musics = new ArrayList();
  
  private final SoundPool soundPool;
  
  public AndroidAudio(Context paramContext, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    if (!paramAndroidApplicationConfiguration.disableAudio) {
      if (Build.VERSION.SDK_INT >= 21) {
        AudioAttributes audioAttributes = (new AudioAttributes.Builder()).setUsage(14).setContentType(4).build();
        this.soundPool = (new SoundPool.Builder()).setAudioAttributes(audioAttributes).setMaxStreams(paramAndroidApplicationConfiguration.maxSimultaneousSounds).build();
      } else {
        this.soundPool = new SoundPool(paramAndroidApplicationConfiguration.maxSimultaneousSounds, 3, false);
      } 
      this.manager = (AudioManager)paramContext.getSystemService("audio");
      if (paramContext instanceof Activity)
        ((Activity)paramContext).setVolumeControlStream(3); 
    } else {
      this.soundPool = null;
      this.manager = null;
    } 
  }
  
  public void dispose() {
    if (this.soundPool == null)
      return; 
    synchronized (this.musics) {
      ArrayList arrayList = new ArrayList();
      this(this.musics);
      Iterator iterator = arrayList.iterator();
      while (iterator.hasNext())
        ((AndroidMusic)iterator.next()).dispose(); 
      this.soundPool.release();
      return;
    } 
  }
  
  public AudioDevice newAudioDevice(int paramInt, boolean paramBoolean) {
    if (this.soundPool != null)
      return new AndroidAudioDevice(paramInt, paramBoolean); 
    throw new GdxRuntimeException("Android audio is not enabled by the application config.");
  }
  
  public AudioRecorder newAudioRecorder(int paramInt, boolean paramBoolean) {
    if (this.soundPool != null)
      return new AndroidAudioRecorder(paramInt, paramBoolean); 
    throw new GdxRuntimeException("Android audio is not enabled by the application config.");
  }
  
  public Music newMusic(FileHandle paramFileHandle) {
    if (this.soundPool != null) {
      androidFileHandle = (AndroidFileHandle)paramFileHandle;
      stringBuilder = new MediaPlayer();
      if (androidFileHandle.type() == Files.FileType.Internal)
        try {
          AssetFileDescriptor assetFileDescriptor = androidFileHandle.getAssetFileDescriptor();
          stringBuilder.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
          assetFileDescriptor.close();
          stringBuilder.prepare();
          null = new AndroidMusic();
          this(this, stringBuilder);
          synchronized (this.musics) {
            this.musics.add(null);
            return null;
          } 
        } catch (Exception androidFileHandle) {
          stringBuilder = new StringBuilder();
          stringBuilder.append("Error loading audio file: ");
          stringBuilder.append(paramFileHandle);
          stringBuilder.append("\nNote: Internal audio files must be placed in the assets directory.");
          throw new GdxRuntimeException(stringBuilder.toString(), androidFileHandle);
        }  
      try {
        stringBuilder.setDataSource(androidFileHandle.file().getPath());
        stringBuilder.prepare();
        null = new AndroidMusic();
        this(this, stringBuilder);
        synchronized (this.musics) {
          this.musics.add(null);
          return null;
        } 
      } catch (Exception stringBuilder) {
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append("Error loading audio file: ");
        stringBuilder1.append(paramFileHandle);
        throw new GdxRuntimeException(stringBuilder1.toString(), stringBuilder);
      } 
    } 
    throw new GdxRuntimeException("Android audio is not enabled by the application config.");
  }
  
  public Music newMusic(FileDescriptor paramFileDescriptor) {
    if (this.soundPool != null) {
      MediaPlayer mediaPlayer = new MediaPlayer();
      try {
        mediaPlayer.setDataSource(paramFileDescriptor);
        mediaPlayer.prepare();
        AndroidMusic androidMusic = new AndroidMusic();
        this(this, mediaPlayer);
        synchronized (this.musics) {
          this.musics.add(androidMusic);
          return androidMusic;
        } 
      } catch (Exception paramFileDescriptor) {
        throw new GdxRuntimeException("Error loading audio from FileDescriptor", paramFileDescriptor);
      } 
    } 
    throw new GdxRuntimeException("Android audio is not enabled by the application config.");
  }
  
  public Sound newSound(FileHandle paramFileHandle) {
    if (this.soundPool != null) {
      androidFileHandle = (AndroidFileHandle)paramFileHandle;
      if (androidFileHandle.type() == Files.FileType.Internal)
        try {
          AssetFileDescriptor assetFileDescriptor = androidFileHandle.getAssetFileDescriptor();
          AndroidSound androidSound = new AndroidSound();
          this(this.soundPool, this.manager, this.soundPool.load(assetFileDescriptor, 1));
          assetFileDescriptor.close();
          return androidSound;
        } catch (IOException androidFileHandle) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("Error loading audio file: ");
          stringBuilder.append(paramFileHandle);
          stringBuilder.append("\nNote: Internal audio files must be placed in the assets directory.");
          throw new GdxRuntimeException(stringBuilder.toString(), androidFileHandle);
        }  
      try {
        return new AndroidSound(this.soundPool, this.manager, this.soundPool.load(androidFileHandle.file().getPath(), 1));
      } catch (Exception androidFileHandle) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Error loading audio file: ");
        stringBuilder.append(paramFileHandle);
        throw new GdxRuntimeException(stringBuilder.toString(), androidFileHandle);
      } 
    } 
    throw new GdxRuntimeException("Android audio is not enabled by the application config.");
  }
  
  protected void pause() {
    if (this.soundPool == null)
      return; 
    synchronized (this.musics) {
      for (AndroidMusic androidMusic : this.musics) {
        if (androidMusic.isPlaying()) {
          androidMusic.pause();
          androidMusic.wasPlaying = true;
          continue;
        } 
        androidMusic.wasPlaying = false;
      } 
      this.soundPool.autoPause();
      return;
    } 
  }
  
  protected void resume() { // Byte code:
    //   0: aload_0
    //   1: getfield soundPool : Landroid/media/SoundPool;
    //   4: ifnonnull -> 8
    //   7: return
    //   8: aload_0
    //   9: getfield musics : Ljava/util/List;
    //   12: astore_1
    //   13: aload_1
    //   14: monitorenter
    //   15: iconst_0
    //   16: istore_2
    //   17: iload_2
    //   18: aload_0
    //   19: getfield musics : Ljava/util/List;
    //   22: invokeinterface size : ()I
    //   27: if_icmpge -> 71
    //   30: aload_0
    //   31: getfield musics : Ljava/util/List;
    //   34: iload_2
    //   35: invokeinterface get : (I)Ljava/lang/Object;
    //   40: checkcast com/badlogic/gdx/backends/android/AndroidMusic
    //   43: getfield wasPlaying : Z
    //   46: ifeq -> 65
    //   49: aload_0
    //   50: getfield musics : Ljava/util/List;
    //   53: iload_2
    //   54: invokeinterface get : (I)Ljava/lang/Object;
    //   59: checkcast com/badlogic/gdx/backends/android/AndroidMusic
    //   62: invokevirtual play : ()V
    //   65: iinc #2, 1
    //   68: goto -> 17
    //   71: aload_1
    //   72: monitorexit
    //   73: aload_0
    //   74: getfield soundPool : Landroid/media/SoundPool;
    //   77: invokevirtual autoResume : ()V
    //   80: return
    //   81: astore_3
    //   82: aload_1
    //   83: monitorexit
    //   84: goto -> 89
    //   87: aload_3
    //   88: athrow
    //   89: goto -> 87
    // Exception table:
    //   from	to	target	type
    //   17	65	81	finally
    //   71	73	81	finally
    //   82	84	81	finally }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidAudio.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */