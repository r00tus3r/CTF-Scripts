package com.badlogic.gdx.backends.android;

import android.media.AudioRecord;
import com.badlogic.gdx.audio.AudioRecorder;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class AndroidAudioRecorder implements AudioRecorder {
  private AudioRecord recorder;
  
  public AndroidAudioRecorder(int paramInt, boolean paramBoolean) {
    if (paramBoolean) {
      b = 16;
    } else {
      b = 12;
    } 
    this.recorder = new AudioRecord(true, paramInt, b, 2, AudioRecord.getMinBufferSize(paramInt, b, 2));
    if (this.recorder.getState() == 1) {
      this.recorder.startRecording();
      return;
    } 
    throw new GdxRuntimeException("Unable to initialize AudioRecorder.\nDo you have the RECORD_AUDIO permission?");
  }
  
  public void dispose() {
    this.recorder.stop();
    this.recorder.release();
  }
  
  public void read(short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    int i;
    for (i = 0; i != paramInt2; i += this.recorder.read(paramArrayOfShort, paramInt1 + i, paramInt2 - i));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidAudioRecorder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */