package com.badlogic.gdx;

import com.badlogic.gdx.audio.AudioDevice;
import com.badlogic.gdx.audio.AudioRecorder;
import com.badlogic.gdx.audio.Music;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.files.FileHandle;

public interface Audio {
  AudioDevice newAudioDevice(int paramInt, boolean paramBoolean);
  
  AudioRecorder newAudioRecorder(int paramInt, boolean paramBoolean);
  
  Music newMusic(FileHandle paramFileHandle);
  
  Sound newSound(FileHandle paramFileHandle);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Audio.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */